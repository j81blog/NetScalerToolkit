$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\NetScalerToolkit\NetScalerToolkit.psd1'
Import-Module $modulePath -Force

Describe 'ACME helper functions' {
    InModuleScope NetScalerToolkit {
        BeforeAll {
            function ConvertFrom-TestSecureString {
                param([securestring]$SecureString)
                (New-Object pscredential 'user', $SecureString).GetNetworkCredential().Password
            }

            function New-TestCertificate {
                param(
                    [Parameter(Mandatory)][string]$Subject,
                    [int]$Years = 1
                )

                $rsa = [System.Security.Cryptography.RSA]::Create(2048)
                $request = [System.Security.Cryptography.X509Certificates.CertificateRequest]::new(
                    "CN=$Subject",
                    $rsa,
                    [System.Security.Cryptography.HashAlgorithmName]::SHA256,
                    [System.Security.Cryptography.RSASignaturePadding]::Pkcs1
                )
                $request.CertificateExtensions.Add(
                    [System.Security.Cryptography.X509Certificates.X509BasicConstraintsExtension]::new($true, $false, 0, $true)
                )
                $certificate = $request.CreateSelfSigned((Get-Date).AddDays(-1), (Get-Date).AddYears($Years))
                return [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($certificate.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Cert))
            }

            function ConvertTo-TestPem {
                param([Parameter(Mandatory)]$Certificate)
                $base64 = [Convert]::ToBase64String($Certificate.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Cert))
                $lines = for ($offset = 0; $offset -lt $base64.Length; $offset += 64) {
                    $base64.Substring($offset, [Math]::Min(64, $base64.Length - $offset))
                }
                "-----BEGIN CERTIFICATE-----`n$($lines -join "`n")`n-----END CERTIFICATE-----`n"
            }
        }

        Context 'secret and hashtable conversion' {
            It 'round-trips plain text through the legacy encrypted secret object' {
                $secret = ConvertTo-NSACMECertificateLegacySecret -Object 'P@ssw0rd!'

                $secret.IsEncrypted | Should -BeTrue
                $secret.Password | Should -Not -BeNullOrEmpty
                ConvertFrom-NSACMECertificateLegacySecret -Object $secret -AsClearText | Should -Be 'P@ssw0rd!'
            }

            It 'returns secure strings and clear text from supported secret inputs' {
                $secure = ConvertTo-SecureString 'abc123' -AsPlainText -Force
                ConvertFrom-TestSecureString (ConvertFrom-NSACMECertificateLegacySecret -Object 'abc123') | Should -Be 'abc123'
                ConvertFrom-NSACMECertificateLegacySecret -Object $secure -AsClearText | Should -Be 'abc123'
                ConvertFrom-NSACMECertificateLegacySecret -Object ([pscredential]::new('u', $secure)) -AsClearText | Should -Be 'abc123'
            }

            It 'ignores empty PSCredential values when registering log secrets' {
                $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()

                { Add-NSACMECertificateSensitiveValue -Value ([pscredential]::Empty) } | Should -Not -Throw
                $script:NSACMECertificateSensitiveValues.Count | Should -Be 0
            }

            It 'converts legacy DNS parameter shapes into hashtables' {
                $fromString = ConvertTo-NSACMECertificateHashtable -InputObject 'Token=abc; Zone = example.com ; Empty='
                $fromObject = ConvertTo-NSACMECertificateHashtable -InputObject ([pscustomobject]@{ A = 1; B = 'two' })

                $fromString.Token | Should -Be 'abc'
                $fromString.Zone | Should -Be 'example.com'
                $fromString.Empty | Should -Be ''
                $fromObject.A | Should -Be 1
                $fromObject.B | Should -Be 'two'
            }

            It 'adds or updates note properties' {
                $request = [pscustomobject]@{ CN = 'example.com' }

                Set-NSACMECertificateNoteProperty -InputObject $request -Name CN -Value 'updated.example.com'
                Set-NSACMECertificateNoteProperty -InputObject $request -Name ValidationMethod -Value 'dns'

                $request.CN | Should -Be 'updated.example.com'
                $request.ValidationMethod | Should -Be 'dns'
            }
        }

        Context 'renewal decisions' {
            It 'renews when forced' {
                $request = [pscustomobject]@{ RenewAfter = (Get-Date).AddDays(30).ToString('o') }

                $decision = Test-NSACMECertificateRenewalRequired -Request $request -Force

                $decision.ShouldRenew | Should -BeTrue
                $decision.Reason | Should -Match 'ForceCertRenew'
            }

            It 'skips before RenewAfter and renews after RenewAfter' {
                $future = [pscustomobject]@{ RenewAfter = (Get-Date).AddDays(5).ToString('o') }
                $past = [pscustomobject]@{ RenewAfter = (Get-Date).AddDays(-1).ToString('o') }

                (Test-NSACMECertificateRenewalRequired -Request $future).ShouldRenew | Should -BeFalse
                (Test-NSACMECertificateRenewalRequired -Request $past).ShouldRenew | Should -BeTrue
            }

            It 'renews for missing or invalid renewal metadata and parses legacy JSON dates' {
                $missing = [pscustomobject]@{}
                $invalid = [pscustomobject]@{ RenewAfter = 'not a date' }
                $futureOffset = [datetimeoffset]::new((Get-Date).AddDays(2))
                $legacy = [pscustomobject]@{ RenewAfter = "/Date($($futureOffset.ToUnixTimeMilliseconds()))/" }

                (Test-NSACMECertificateRenewalRequired -Request $missing).ShouldRenew | Should -BeTrue
                (Test-NSACMECertificateRenewalRequired -Request $invalid).ShouldRenew | Should -BeTrue
                (Test-NSACMECertificateRenewalRequired -Request $legacy).ShouldRenew | Should -BeFalse
            }
        }

        Context 'request normalization' {
            It 'forces DNS validation for NetScaler DNS, alternate DNS, and wildcard requests' {
                $netScalerDns = [pscustomobject]@{ CN = 'example.com'; SANs = ''; ValidationMethod = 'http'; UseNetScalerDNS = $true }
                $alternateDns = [pscustomobject]@{ CN = 'example.com'; SANs = ''; ValidationMethod = 'http'; AlternateDNSValidationDomain = 'adns.example.com' }
                $wildcard = [pscustomobject]@{ CN = '*.example.com'; SANs = ''; ValidationMethod = 'http' }

                (Normalize-NSACMECertificateRequest -Request $netScalerDns -DefaultCertDir 'C:\Certs').ValidationMethod | Should -Be 'dns'
                (Normalize-NSACMECertificateRequest -Request $alternateDns -DefaultCertDir 'C:\Certs').ValidationMethod | Should -Be 'dns'
                (Normalize-NSACMECertificateRequest -Request $wildcard -DefaultCertDir 'C:\Certs').ValidationMethod | Should -Be 'dns'
            }

            It 'splits and de-duplicates SANs and applies request defaults' {
                $request = [pscustomobject]@{
                    CN = 'example.com'
                    SANs = 'www.example.com, api.example.com, www.example.com'
                    ValidationMethod = 'HTTP'
                }

                $normalized = Normalize-NSACMECertificateRequest -Request $request -DefaultCertDir 'C:\Certs'

                $normalized.Domains | Should -Be @('example.com', 'www.example.com', 'api.example.com')
                $request.ValidationMethod | Should -Be 'http'
                $request.FriendlyName | Should -Be 'example.com'
                $request.CertDir | Should -Be 'C:\Certs'
                $request.UseLbVip | Should -BeFalse
            }
        }

        Context 'ACME logging' {
            It 'redacts registered sensitive values and known secret fields' {
                $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()
                Add-NSACMECertificateSensitiveValue -Value 'SuperSecret123!' -Placeholder '<NetScalerPassword>'
                Add-NSACMECertificateSensitiveValue -Value 'nsroot' -Placeholder '<NetScalerUsername>'

                $safeText = ConvertTo-NSACMECertificateSafeText -InputObject 'Connecting as nsroot password=SuperSecret123! token: abc123 certkey=visible'

                $safeText | Should -Not -Match ([regex]::Escape('SuperSecret123!'))
                $safeText | Should -Not -Match '\bnsroot\b'
                $safeText | Should -Match '<NetScalerPassword>'
                $safeText | Should -Match '<NetScalerUsername>'
                $safeText | Should -Match 'certkey=visible'
            }

            It 'keeps compatibility with legacy plain string sensitive entries' {
                $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()
                $script:NSACMECertificateSensitiveValues.Add('LegacySecret123!')

                ConvertTo-NSACMECertificateSafeText -InputObject 'value=LegacySecret123!' | Should -Be 'value=**SENSITIVE**'
            }

            It 'writes jsonl log records with masked data' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $logPath = Join-Path $dir 'acme.jsonl'
                    $script:NSACMECertificateLogFile = $logPath
                    $script:NSACMECertificateLogLevel = 'Debug'
                    $script:NSACMECertificateLogType = 'jsonl'
                    $script:NSACMECertificateNoConsoleOutput = $true
                    $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()
                    Add-NSACMECertificateSensitiveValue -Value 'JsonSecret123!' -Placeholder '<PfxPassword>'

                    Initialize-NSACMECertificateLog -Path $logPath -LogType jsonl
                    Write-NSACMECertificateLog Info 'Unit' 'Completed with JsonSecret123!' -Data @{ Password = 'JsonSecret123!'; CertKey = 'visible-cert' }

                    $records = @(Get-Content -LiteralPath $logPath | ForEach-Object { $_ | ConvertFrom-Json })
                    $records.Count | Should -Be 2
                    $records[1].message | Should -Be 'Completed with <PfxPassword>'
                    $records[1].data.Password | Should -Be '<PfxPassword>'
                    $records[1].data.CertKey | Should -Be 'visible-cert'
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                    $script:NSACMECertificateLogFile = $null
                    $script:NSACMECertificateNoConsoleOutput = $false
                }
            }

            It 'writes text log records with real tab delimiters' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $logPath = Join-Path $dir 'acme.log'
                    $script:NSACMECertificateLogFile = $logPath
                    $script:NSACMECertificateLogLevel = 'Info'
                    $script:NSACMECertificateLogType = 'txt'
                    $script:NSACMECertificateNoConsoleOutput = $true
                    $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()

                    Initialize-NSACMECertificateLog -Path $logPath -LogType txt
                    Write-NSACMECertificateLog Info 'Unit' 'Text delimiter check'

                    $line = Get-Content -LiteralPath $logPath | Select-Object -Last 1
                    $line | Should -Not -Match '`t'
                    @($line -split "`t").Count | Should -Be 4
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                    $script:NSACMECertificateLogFile = $null
                    $script:NSACMECertificateNoConsoleOutput = $false
                }
            }

            It 'writes a readable result summary without returning objects' {
                $script:NSACMECertificateLogFile = $null
                $script:NSACMECertificateLogLevel = 'Info'
                $script:NSACMECertificateLogType = 'txt'
                $script:NSACMECertificateNoConsoleOutput = $false

                $output = Write-NSACMECertificateResultSummary -Results @([pscustomobject]@{
                        CN = 'example.com'
                        Domains = @('example.com', 'www.example.com')
                        Status = 'Success'
                        CertKeyName = 'example-cert'
                        Thumbprint = 'ABC123'
                        NotAfter = Get-Date
                        PfxPath = 'C:\Certs\example.pfx'
                        LogFile = 'acme.log'
                    })

                $output | Should -BeNullOrEmpty
            }
        }

        Context 'chain parsing and linking' {
            BeforeEach {
                $script:UploadedFiles = @()
                $script:AddedCertKeys = @()
                $script:Links = @()
            }

            It 'parses ChainFile certificates and excludes leaf when falling back to FullChainFile' {
                $leaf = New-TestCertificate -Subject 'leaf.example.com'
                $intermediate = New-TestCertificate -Subject 'Intermediate CA'
                $root = New-TestCertificate -Subject 'Root CA'
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $chainPath = Join-Path $dir 'chain.cer'
                    $fullChainPath = Join-Path $dir 'fullchain.cer'
                    Set-Content -LiteralPath $chainPath -Value ((ConvertTo-TestPem $intermediate) + (ConvertTo-TestPem $root)) -Encoding ASCII
                    Set-Content -LiteralPath $fullChainPath -Value ((ConvertTo-TestPem $leaf) + (ConvertTo-TestPem $intermediate) + (ConvertTo-TestPem $root)) -Encoding ASCII

                    $fromChain = @(Get-NSACMECertificateChainCertificate -Certificate ([pscustomobject]@{ ChainFile = $chainPath; FullChainFile = $fullChainPath; Thumbprint = $leaf.Thumbprint }))
                    $fromFullChain = @(Get-NSACMECertificateChainCertificate -Certificate ([pscustomobject]@{ FullChainFile = $fullChainPath; Thumbprint = $leaf.Thumbprint }))

                    $fromChain.Count | Should -Be 2
                    $fromChain[0].Thumbprint | Should -Be $intermediate.Thumbprint
                    $fromChain[1].Thumbprint | Should -Be $root.Thumbprint
                    $fromFullChain.Count | Should -Be 2
                    $fromFullChain.Thumbprint | Should -Not -Contain $leaf.Thumbprint
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            It 'reuses existing CA certkeys by normalized serial' {
                $ca = New-TestCertificate -Subject 'Existing CA'
                $existing = [pscustomobject]@{ certkey = 'Existing-CA'; serial = "00$($ca.SerialNumber)"; subject = $ca.Subject; issuer = $ca.Issuer }

                $result = Resolve-NSACMECertificateChainCertKey -Session ([pscustomobject]@{}) -Certificate $ca -ExistingCertKeys @($existing) -IsProduction

                $result.Status | Should -Be 'Existing'
                $result.CertKeyName | Should -Be 'Existing-CA'
            }

            It 'uploads missing CA certkeys and links leaf to intermediate to root' {
                $intermediate = New-TestCertificate -Subject 'Unit Intermediate'
                $root = New-TestCertificate -Subject 'Unit Root'
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $chainPath = Join-Path $dir 'chain.cer'
                    Set-Content -LiteralPath $chainPath -Value ((ConvertTo-TestPem $intermediate) + (ConvertTo-TestPem $root)) -Encoding ASCII
                    $certificate = [pscustomobject]@{ ChainFile = $chainPath }

                    Mock Invoke-NSGetSSLCertKey { @() }
                    Mock Copy-NSACMECertificateNetScalerFile { $script:UploadedFiles += $FileName }
                    Mock Invoke-NSAddSSLCertKey { $script:AddedCertKeys += $CertKey }
                    Mock Invoke-NSUnlinkSSLCertKey {}
                    Mock Invoke-NSLinkSSLCertKey { $script:Links += "$CertKey->$LinkCertKeyName" }

                    $result = @(Set-NSACMECertificateChainLink -Session ([pscustomobject]@{}) -LeafCertKeyName 'leaf-cert' -Certificate $certificate -IsProduction)

                    $result.Count | Should -Be 2
                    $script:UploadedFiles.Count | Should -Be 2
                    $script:AddedCertKeys.Count | Should -Be 2
                    $script:Links[0] | Should -Be "leaf-cert->$($result[0].CertKeyName)"
                    $script:Links[1] | Should -Be "$($result[0].CertKeyName)->$($result[1].CertKeyName)"
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }

        Context 'VPN global binding helper' {
            BeforeEach {
                $script:DeletedVpnBindings = @()
                $script:AddedVpnBindings = @()
            }

            It 'skips replacement when the old certkey is not globally bound' {
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { @([pscustomobject]@{ certkeyname = 'other-cert' }) }
                Mock Invoke-NSDeleteVPNGlobalSSLCertKeyBinding {}
                Mock Invoke-NSAddVPNGlobalSSLCertKeyBinding {}

                $result = Update-NSACMECertificateGlobalVpnBinding -Session ([pscustomobject]@{}) -OldCertKeyName 'old-cert' -NewCertKeyName 'new-cert'

                $result.Status | Should -Be 'Skipped'
                Should -Invoke Invoke-NSDeleteVPNGlobalSSLCertKeyBinding -Times 0
                Should -Invoke Invoke-NSAddVPNGlobalSSLCertKeyBinding -Times 0
            }

            It 'replaces the leaf binding and optionally adds a CA binding' {
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding {
                    if ($script:AddedVpnBindings.Count -eq 0) { return @([pscustomobject]@{ certkeyname = 'old-cert' }) }
                    return @()
                }
                Mock Invoke-NSDeleteVPNGlobalSSLCertKeyBinding { $script:DeletedVpnBindings += $CertKeyName }
                Mock Invoke-NSAddVPNGlobalSSLCertKeyBinding {
                    $script:AddedVpnBindings += [pscustomobject]@{ CertKeyName = $CertKeyName; CaCert = $CaCert; Crlcheck = $Crlcheck; OCSPCheck = $OCSPCheck; GotoPriorityExpression = $GotoPriorityExpression }
                }

                $result = Update-NSACMECertificateGlobalVpnBinding -Session ([pscustomobject]@{}) -OldCertKeyName 'old-cert' -NewCertKeyName 'new-cert' -IncludeCA -CaCertKeyName 'ca-cert' -CrlCheck Optional -OcspCheck Mandatory

                $result.Status | Should -Be 'Updated'
                $script:DeletedVpnBindings | Should -Contain 'old-cert'
                $script:AddedVpnBindings[0].CertKeyName | Should -Be 'new-cert'
                $script:AddedVpnBindings[0].GotoPriorityExpression | Should -BeNullOrEmpty
                $script:AddedVpnBindings[1].CaCert | Should -Be 'ca-cert'
                $script:AddedVpnBindings[1].Crlcheck | Should -Be 'Optional'
                $script:AddedVpnBindings[1].OCSPCheck | Should -Be 'Mandatory'
                $script:AddedVpnBindings[1].GotoPriorityExpression | Should -BeNullOrEmpty
            }
        }

        Context 'NetScaler DNS validation guardrails' {
            It 'requires a NetScaler session when UseNetScalerDNS is enabled' {
                $request = [pscustomobject]@{ UseNetScalerDNS = $true; CN = 'example.com'; KeyLength = 2048; FriendlyName = 'example.com' }

                { Request-NSACMECertificateDnsOrder -Request $request -Domains @('example.com') -PfxSecret (ConvertTo-SecureString 'x' -AsPlainText -Force) -AcmeOptions @{} } |
                    Should -Throw -ExpectedMessage '*NetScaler session is required*'
            }

        }
    }
}
