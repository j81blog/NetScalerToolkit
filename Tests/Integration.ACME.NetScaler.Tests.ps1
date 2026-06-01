$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\NetScalerToolkit\NetScalerToolkit.psd1'
Import-Module $modulePath -Force

$runIntegration = $env:NSTOOLKIT_TEST_RUN_NETSCALER -eq 'true'

Describe 'ACME NetScaler integration' -Skip:(-not $runIntegration) {
    BeforeAll {
        foreach ($name in 'NSTOOLKIT_TEST_NS_URL', 'NSTOOLKIT_TEST_USERNAME', 'NSTOOLKIT_TEST_PASSWORD') {
            if ([string]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable($name))) {
                throw "Missing required integration test environment variable: $name"
            }
        }

        $password = ConvertTo-SecureString $env:NSTOOLKIT_TEST_PASSWORD -AsPlainText -Force
        $credential = [pscredential]::new($env:NSTOOLKIT_TEST_USERNAME, $password)
        $skipCertificateCheck = $env:NSTOOLKIT_TEST_SKIP_CERT_CHECK -eq 'true'
        $script:IntegrationSession = Connect-NSNode -ManagementURL $env:NSTOOLKIT_TEST_NS_URL -Credential $credential -SkipCertificateCheck:$skipCertificateCheck -HA -PassThru -ErrorAction Stop
    }

    It 'adds, reads, and removes a DNS TXT record' {
        $zone = if ($env:NSTOOLKIT_TEST_DNS_ZONE) { $env:NSTOOLKIT_TEST_DNS_ZONE } else { 'example.test' }
        $name = "nstoolkit-pester-$([guid]::NewGuid().ToString('N')).$zone"
        $value = "nstoolkit-$([guid]::NewGuid().ToString('N'))"

        try {
            Invoke-NSAddDNSTXTRecord -Session $script:IntegrationSession -Domain $name -String $value -Ttl 300 | Out-Null
            $record = Invoke-NSGetDNSTXTRecord -Session $script:IntegrationSession -Domain $name -ReturnNullOnNotFound

            $record | Should -Not -BeNullOrEmpty
            @($record.String) + @($record.string) | Should -Contain $value
        } finally {
            Invoke-NSDeleteDNSTXTRecord -Session $script:IntegrationSession -Domain $name -String $value -IgnoreNotFound -Confirm:$false -ErrorAction SilentlyContinue | Out-Null
        }
    }

    It 'can perform a reversible global VPN cert binding replacement when enabled' -Skip:($env:NSTOOLKIT_TEST_RUN_VPN_BINDING -ne 'true') {
        foreach ($name in 'NSTOOLKIT_TEST_VPN_OLD_CERTKEY', 'NSTOOLKIT_TEST_VPN_NEW_CERTKEY') {
            if ([string]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable($name))) {
                throw "Missing required VPN binding test environment variable: $name"
            }
        }

        $original = @(Invoke-NSGetVPNGlobalSSLCertKeyBinding -Session $script:IntegrationSession -ReturnNullOnNotFound)

        function Remove-IntegrationVpnBinding {
            param([object]$Binding)
            if ($Binding.certkeyname) { Invoke-NSDeleteVPNGlobalSSLCertKeyBinding -Session $script:IntegrationSession -CertKeyName $Binding.certkeyname -IgnoreNotFound -Confirm:$false -ErrorAction SilentlyContinue | Out-Null }
            if ($Binding.cacert) { Invoke-NSDeleteVPNGlobalSSLCertKeyBinding -Session $script:IntegrationSession -CaCert $Binding.cacert -IgnoreNotFound -Confirm:$false -ErrorAction SilentlyContinue | Out-Null }
            if ($Binding.userdataencryptionkey) { Invoke-NSDeleteVPNGlobalSSLCertKeyBinding -Session $script:IntegrationSession -UserDataEncryptionKey $Binding.userdataencryptionkey -IgnoreNotFound -Confirm:$false -ErrorAction SilentlyContinue | Out-Null }
        }

        function Add-IntegrationVpnBinding {
            param([object]$Binding)
            $params = @{ Session = $script:IntegrationSession }
            if ($Binding.certkeyname) { $params.CertKeyName = $Binding.certkeyname }
            if ($Binding.cacert) { $params.CaCert = $Binding.cacert }
            if ($Binding.userdataencryptionkey) { $params.UserDataEncryptionKey = $Binding.userdataencryptionkey }
            if ($Binding.crlcheck -and $Binding.crlcheck -in @('Mandatory', 'Optional')) { $params.Crlcheck = $Binding.crlcheck }
            if ($Binding.ocspcheck -and $Binding.ocspcheck -in @('Mandatory', 'Optional')) { $params.OCSPCheck = $Binding.ocspcheck }
            Invoke-NSAddVPNGlobalSSLCertKeyBinding @params -ErrorAction SilentlyContinue | Out-Null
        }

        try {
            $params = @{
                Session        = $script:IntegrationSession
                OldCertKeyName = $env:NSTOOLKIT_TEST_VPN_OLD_CERTKEY
                NewCertKeyName = $env:NSTOOLKIT_TEST_VPN_NEW_CERTKEY
            }
            if ($env:NSTOOLKIT_TEST_VPN_CA_CERTKEY) {
                $params.IncludeCA = $true
                $params.CaCertKeyName = $env:NSTOOLKIT_TEST_VPN_CA_CERTKEY
                $params.CrlCheck = 'Optional'
            }

            $module = Get-Module NetScalerToolkit
            $result = & $module { param($p) Update-NSACMECertificateGlobalVpnBinding @p } $params
            $current = @(Invoke-NSGetVPNGlobalSSLCertKeyBinding -Session $script:IntegrationSession -ReturnNullOnNotFound)

            $result.Status | Should -Be 'Updated'
            @($current | Where-Object { $_.certkeyname -eq $env:NSTOOLKIT_TEST_VPN_NEW_CERTKEY }).Count | Should -BeGreaterThan 0
        } finally {
            $current = @(Invoke-NSGetVPNGlobalSSLCertKeyBinding -Session $script:IntegrationSession -ReturnNullOnNotFound)
            foreach ($binding in $current) { Remove-IntegrationVpnBinding -Binding $binding }
            foreach ($binding in $original) { Add-IntegrationVpnBinding -Binding $binding }
        }
    }
}
