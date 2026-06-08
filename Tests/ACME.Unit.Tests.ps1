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

            if (-not (Get-Command Get-PAServer -ErrorAction SilentlyContinue)) {
                function Get-PAServer { }
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

            It 'prefers ACME order renewal metadata when available' {
                $request = [pscustomobject]@{ RenewAfter = (Get-Date).AddDays(-1).ToString('o') }
                $order = [pscustomobject]@{
                    CertExpires = (Get-Date).AddDays(40).ToString('o')
                    RenewAfter  = (Get-Date).AddDays(10).ToString('o')
                }

                $decision = Test-NSACMECertificateRenewalRequired -Request $request -AcmeOrder $order

                $decision.ShouldRenew | Should -BeFalse
                $decision.Source | Should -Be 'ACME order'
                $decision.Strategy | Should -Be 'ACME/Posh-ACME renewal metadata.'
                $decision.Summary | Should -Be 'Outside renewal window. Use -ForceCertRenew to renew now.'
            }

            It 'uses two-thirds certificate lifetime when renewal metadata is unavailable' {
                $request = [pscustomobject]@{}
                $certificate = [pscustomobject]@{
                    notbefore = (Get-Date).AddDays(-10).ToString('o')
                    notafter  = (Get-Date).AddDays(50).ToString('o')
                }

                $decision = Test-NSACMECertificateRenewalRequired -Request $request -NetScalerCertificate $certificate

                $decision.ShouldRenew | Should -BeFalse
                $decision.Source | Should -Be 'NetScaler certificate'
                $decision.Strategy | Should -Match 'two-thirds'
            }

            It 'renews when the dynamic certificate lifetime window has started' {
                $request = [pscustomobject]@{}
                $certificate = [pscustomobject]@{
                    NotBefore = (Get-Date).AddDays(-50)
                    NotAfter  = (Get-Date).AddDays(10)
                }

                $decision = Test-NSACMECertificateRenewalRequired -Request $request -AcmeCertificate $certificate

                $decision.ShouldRenew | Should -BeTrue
                $decision.Source | Should -Be 'ACME certificate'
            }
        }

        Context 'request normalization' {
            It 'keeps the legacy CleanVault alias for Posh-ACME storage cleanup' {
                $parameter = (Get-Command Request-NSACMECertificate).Parameters['CleanPoshACMEStorage']

                $parameter.Aliases | Should -Contain 'CleanVault'
            }

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

            It 'writes a reusable config file from a direct request' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $configPath = Join-Path $dir 'GenLe-Config.json'
                    $certDir = Join-Path $dir 'certs'
                    Mock Import-Module {} -ParameterFilter { $Name -eq 'Posh-ACME' }
                    Mock Set-NSACMEPoshACMEServer {}
                    Mock Get-PAServer { [pscustomobject]@{ renewalInfo = 'https://example.com/acme/renewal-info'; DisableARI = $false } }
                    Mock Connect-NSNode { [pscustomobject]@{ IsHA = $false; IsPrimary = $true } }
                    Mock Test-NSACMECertificateRenewalRequired {
                        [pscustomobject]@{
                            ShouldRenew    = $false
                            Reason         = 'unit test skip'
                            Summary        = 'unit test skip'
                            CertExpires    = (Get-Date).AddDays(30)
                            Source         = 'unit'
                            Strategy       = 'unit test'
                            ExpireDays     = 30
                            RenewAfterDays = $null
                        }
                    }

                    Request-NSACMECertificate `
                        -ManagementURL 'https://ns-01.domain.local' `
                        -Username 'nsroot' `
                        -Password 'Sup3rS3cretP@ssw0rd' `
                        -CN 'example.com' `
                        -SAN 'portal.example.com' `
                        -ValidationMethod http `
                        -CsVipName 'cs_example_http' `
                        -CertKeyNameToUpdate 'san_example_com' `
                        -CertDir $certDir `
                        -EmailAddress 'hostmaster@example.com' `
                        -ExternalAccountBindingKeyId 'eab-key-id' `
                        -ExternalAccountBindingHmacKey 'eab-hmac-secret' `
                        -ConfigFile $configPath `
                        -SkipCertificateCheck `
                        -DisableLogging `
                        -NoConsoleOutput | Out-Null

                    $config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
                    $config.settings.ManagementURL | Should -Be 'https://ns-01.domain.local/'
                    $config.settings.ADCCredentialUsername | Should -Be 'nsroot'
                    $config.settings.ADCCredentialPassword.IsEncrypted | Should -BeTrue
                    $config.settings.ExternalAccountBindingKeyId | Should -Be 'eab-key-id'
                    $config.settings.ExternalAccountBindingHmacKey.IsEncrypted | Should -BeTrue
                    ConvertFrom-NSACMECertificateLegacySecret -Object $config.settings.ExternalAccountBindingHmacKey -AsClearText | Should -Be 'eab-hmac-secret'
                    $config.settings.PSObject.Properties.Name | Should -Not -Contain 'SMTPCredential'
                    $config.certrequests[0].CN | Should -Be 'example.com'
                    $config.certrequests[0].SANs | Should -Be 'portal.example.com'
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            It 'requires production or a custom directory for providers without staging' {
                {
                    Request-NSACMECertificate `
                        -ManagementURL 'https://ns-01.domain.local' `
                        -Username 'nsroot' `
                        -Password 'Sup3rS3cretP@ssw0rd' `
                        -CN 'example.com' `
                        -ValidationMethod http `
                        -CsVipName 'cs_example_http' `
                        -CertDir 'C:\Certs' `
                        -EmailAddress 'hostmaster@example.com' `
                        -CertificateProvider ZeroSSL `
                        -DisableLogging `
                        -NoConsoleOutput
                } | Should -Throw -ExpectedMessage "*does not have a configured staging environment*"
            }

            It 'logs feature enable warning details and continues HTTP initialization when feature enable fails' {
                Mock Invoke-NSEnableNsFeature { throw 'feature operation failed' }
                Mock Write-NSACMECertificateLog {}
                Mock Invoke-NSGetService { [pscustomobject]@{ name = 'svc_letsencrypt_cert_dummy' } }
                Mock Invoke-NSGetLBVServer { [pscustomobject]@{ name = 'lb_letsencrypt_cert' } }
                Mock Invoke-NSGetLBVServerServiceBinding { @() }
                Mock Invoke-NSAddLBVServerServiceBinding {}

                $request = [pscustomobject]@{
                    UseLbVip = $true
                }
                $settings = [pscustomobject]@{
                    SvcName        = 'svc_letsencrypt_cert_dummy'
                    SvcDestination = '127.0.0.1'
                    LbName         = 'lb_letsencrypt_cert'
                    TrafficDomain  = 0
                    CsVipBinding   = 100
                    CsaName        = 'csa_letsencrypt'
                    CspName        = 'csp_letsencrypt'
                }

                { Initialize-NSACMECertificateHttpValidationConfig -Session ([pscustomobject]@{}) -Settings $settings -Request $request } | Should -Not -Throw
                Should -Invoke Write-NSACMECertificateLog -Times 1 -ParameterFilter {
                    $Level -eq 'Warning' -and
                    $Component -eq 'NetScaler' -and
                    $Message -like 'Could not enable one or more required NetScaler features*' -and
                    $Data.Features -eq 'RESPONDER,SSL' -and
                    $Data.Error -like '*feature operation failed*'
                }
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

            It 'masks local profile paths' {
                $path = Join-Path $env:LOCALAPPDATA 'Posh-ACME\LE_STAGE\299195143\example.com\fullchain.pfx'

                $safeText = ConvertTo-NSACMECertificateSafeText -InputObject "PFX $path"

                $safeText | Should -Be 'PFX <LOCALAPPDATA>\Posh-ACME\LE_STAGE\299195143\example.com\fullchain.pfx'
                $safeText | Should -Not -Match ([regex]::Escape($env:LOCALAPPDATA))
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

            It 'writes sanitized data fields in text log records' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $logPath = Join-Path $dir 'acme.log'
                    $script:NSACMECertificateLogFile = $logPath
                    $script:NSACMECertificateLogLevel = 'Debug'
                    $script:NSACMECertificateLogType = 'txt'
                    $script:NSACMECertificateNoConsoleOutput = $true
                    $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()
                    Add-NSACMECertificateSensitiveValue -Value 'TextSecret123!' -Placeholder '<PfxPassword>'

                    Initialize-NSACMECertificateLog -Path $logPath -LogType txt
                    Write-NSACMECertificateLog Debug 'Unit' 'Data check' -Data @{ Password = 'TextSecret123!'; CertKey = 'visible-cert' }

                    $line = Get-Content -LiteralPath $logPath | Select-Object -Last 1
                    $line | Should -Match 'CertKey=visible-cert'
                    $line | Should -Match 'Password=<PfxPassword>'
                    $line | Should -Not -Match 'TextSecret123!'
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

            It 'logs selected certificate chain artifact details' {
                $leaf = New-TestCertificate -Subject 'leaf.example.com'
                $intermediate = New-TestCertificate -Subject 'Intermediate CA'
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $certPath = Join-Path $dir 'cert.cer'
                    $chainPath = Join-Path $dir 'chain.cer'
                    $logPath = Join-Path $dir 'acme.jsonl'
                    Set-Content -LiteralPath $certPath -Value (ConvertTo-TestPem $leaf) -Encoding ASCII
                    Set-Content -LiteralPath $chainPath -Value (ConvertTo-TestPem $intermediate) -Encoding ASCII

                    $script:NSACMECertificateLogFile = $logPath
                    $script:NSACMECertificateLogLevel = 'Info'
                    $script:NSACMECertificateLogType = 'jsonl'
                    $script:NSACMECertificateNoConsoleOutput = $true
                    Initialize-NSACMECertificateLog -Path $logPath -LogType jsonl

                    $result = Test-NSACMECertificateChainValidation -Certificate ([pscustomobject]@{ CertFile = $certPath; ChainFile = $chainPath; Thumbprint = $leaf.Thumbprint }) -Mode None

                    $result.Validated | Should -BeFalse
                    $result.Leaf.Thumbprint | Should -Be $leaf.Thumbprint
                    $result.Chain.Count | Should -Be 1
                    $records = @(Get-Content -LiteralPath $logPath | ForEach-Object { $_ | ConvertFrom-Json })
                    $records.message | Should -Contain 'Selected certificate artifact paths.'
                    ($records | Where-Object { $_.message -eq 'Selected Leaf certificate.' }).data.Thumbprint | Should -Be $leaf.Thumbprint
                    ($records | Where-Object { $_.message -eq 'Selected Chain #1 certificate.' }).data.Thumbprint | Should -Be $intermediate.Thumbprint
                    $records.message | Should -Contain "Leaf subject: $($leaf.Subject)"
                    $records.message | Should -Contain "Chain #1 subject: $($intermediate.Subject)"
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                    $script:NSACMECertificateLogFile = $null
                    $script:NSACMECertificateNoConsoleOutput = $false
                }
            }

            It 'warns but continues when chain validation fails in Warn mode' {
                $leaf = New-TestCertificate -Subject 'untrusted.example.com'
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $certPath = Join-Path $dir 'cert.cer'
                    $logPath = Join-Path $dir 'acme.jsonl'
                    Set-Content -LiteralPath $certPath -Value (ConvertTo-TestPem $leaf) -Encoding ASCII
                    $script:NSACMECertificateLogFile = $logPath
                    $script:NSACMECertificateLogLevel = 'Info'
                    $script:NSACMECertificateLogType = 'jsonl'
                    $script:NSACMECertificateNoConsoleOutput = $true
                    Initialize-NSACMECertificateLog -Path $logPath -LogType jsonl

                    $result = Test-NSACMECertificateChainValidation -Certificate ([pscustomobject]@{ CertFile = $certPath; Thumbprint = $leaf.Thumbprint }) -Mode Warn

                    $result.Validated | Should -BeTrue
                    $result.IsValid | Should -BeFalse
                    $result.Status.Count | Should -BeGreaterThan 0
                    if ($result.Status -match '^UntrustedRoot:') {
                        $records = @(Get-Content -LiteralPath $logPath | ForEach-Object { $_ | ConvertFrom-Json })
                        $records.message | Should -Contain 'Staging root is untrusted. UntrustedRoot is expected.'
                    }
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                    $script:NSACMECertificateLogFile = $null
                    $script:NSACMECertificateNoConsoleOutput = $false
                }
            }

            It 'stops deployment when chain validation fails in Fail mode' {
                $leaf = New-TestCertificate -Subject 'untrusted.example.com'
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $certPath = Join-Path $dir 'cert.cer'
                    Set-Content -LiteralPath $certPath -Value (ConvertTo-TestPem $leaf) -Encoding ASCII
                    $script:NSACMECertificateNoConsoleOutput = $true

                    { Test-NSACMECertificateChainValidation -Certificate ([pscustomobject]@{ CertFile = $certPath; Thumbprint = $leaf.Thumbprint }) -Mode Fail } |
                        Should -Throw -ExpectedMessage '*Certificate chain validation*'
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                    $script:NSACMECertificateNoConsoleOutput = $false
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

            It 'uploads the PFX with a certkey and expiry timestamp filename instead of fullchain.pfx' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $pfxPath = Join-Path $dir 'fullchain.pfx'
                    Set-Content -LiteralPath $pfxPath -Value 'unit-test-pfx' -Encoding ASCII
                    $request = [pscustomobject]@{
                        CN                  = 'leaf.example.com'
                        CertKeyNameToUpdate = 'custom-cert-key'
                    }
                    $settings = [pscustomobject]@{
                        SaveADCConfig = $false
                    }
                    $certificate = [pscustomobject]@{
                        PfxFullChain = $pfxPath
                        NotAfter     = [datetime]'2027-01-02T03:04:00'
                    }

                    Mock ConvertFrom-NSACMECertificateLegacySecret { 'pfx-pass' }
                    Mock Test-NSACMECertificateChainValidation {}
                    Mock Copy-NSACMECertificateNetScalerFile { $script:UploadedFiles += $FileName }
                    Mock Invoke-NSGetSSLCertKey { $null }
                    Mock Invoke-NSAddSSLCertKey {}
                    Mock Invoke-NSUpdateSSLCertKey {}
                    Mock Set-NSACMECertificateChainLink { @() }

                    $result = Install-NSACMECertificateNetScalerCertificate `
                        -Session ([pscustomobject]@{}) `
                        -Settings $settings `
                        -Request $request `
                        -Certificate $certificate `
                        -PfxSecret (ConvertTo-SecureString 'pfx-pass' -AsPlainText -Force) `
                        -IsProduction

                    $script:UploadedFiles.Count | Should -Be 1
                    $script:UploadedFiles[0] | Should -Be 'custom-cert-key-202701020304.pfx'
                    $result.PfxFileName | Should -Be 'custom-cert-key-202701020304.pfx'
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

        Context 'RemovePrevious safety helper' {
            It 'skips when old and new certkey names are equal' {
                Mock Invoke-NSGetSSLCertKey {}
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding {}
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'same-cert' -NewCertKeyName 'same-cert' -DeleteFromDevice

                $result.Status | Should -Be 'Skipped'
                $result.Reason | Should -Match 'equal'
                Should -Invoke Invoke-NSGetSSLCertKey -Times 0
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            }

            It 'skips when old certkey is part of the new chain' {
                Mock Invoke-NSGetSSLCertKey {}
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding {}
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'chain-ca' -NewCertKeyName 'leaf-cert' -NewChainCertKeyName @('chain-ca') -DeleteFromDevice

                $result.Status | Should -Be 'Skipped'
                $result.Reason | Should -Match 'chain'
                Should -Invoke Invoke-NSGetSSLCertKey -Times 0
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            }

            It 'skips when old certkey is globally VPN-bound' {
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'old-cert' } }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { @([pscustomobject]@{ certkeyname = 'old-cert' }) }
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'old-cert' -NewCertKeyName 'new-cert' -DeleteFromDevice

                $result.Status | Should -Be 'Skipped'
                $result.Reason | Should -Match 'VPN-bound'
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            }

            It 'skips when old certkey is globally VPN-bound as CA cert' {
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'old-ca' } }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { @([pscustomobject]@{ cacert = 'old-ca' }) }
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'old-ca' -NewCertKeyName 'new-cert' -DeleteFromDevice

                $result.Status | Should -Be 'Skipped'
                $result.Reason | Should -Match 'VPN-bound'
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            }

            It 'skips when old certkey is globally VPN-bound as userdata encryption key' {
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'old-ude' } }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { @([pscustomobject]@{ userdataencryptionkey = 'old-ude' }) }
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'old-ude' -NewCertKeyName 'new-cert' -DeleteFromDevice

                $result.Status | Should -Be 'Skipped'
                $result.Reason | Should -Match 'VPN-bound'
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            }

            It 'skips when old certkey does not exist' {
                Mock Invoke-NSGetSSLCertKey { $null }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding {}
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'missing-old' -NewCertKeyName 'new-cert' -DeleteFromDevice

                $result.Status | Should -Be 'Skipped'
                $result.Reason | Should -Match 'does not exist'
                Should -Invoke Invoke-NSGetVPNGlobalSSLCertKeyBinding -Times 0
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            }

            It 'skips when VPN binding inspection fails' {
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'old-cert' } }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { throw 'network issue' }
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'old-cert' -NewCertKeyName 'new-cert' -DeleteFromDevice

                $result.Status | Should -Be 'Skipped'
                $result.Reason | Should -Match 'Could not inspect VPN global bindings'
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            }

            It 'deletes the previous certkey when safety checks pass' {
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'old-cert' } }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { @() }
                Mock Invoke-NSDeleteSSLCertKey {}

                $result = Remove-NSACMECertificatePreviousCertKey -Session ([pscustomobject]@{}) -OldCertKeyName 'old-cert' -NewCertKeyName 'new-cert' -DeleteFromDevice

                $result.Status | Should -Be 'Deleted'
                $result.CertKeyName | Should -Be 'old-cert'
                Should -Invoke Invoke-NSDeleteSSLCertKey -Times 1 -ParameterFilter { $CertKey -eq 'old-cert' -and $DeleteFromDevice -eq $true }
            }
        }

        Context 'NetScaler DNS validation guardrails' {
            It 'requires a NetScaler session when UseNetScalerDNS is enabled' {
                $request = [pscustomobject]@{ UseNetScalerDNS = $true; CN = 'example.com'; KeyLength = 2048; FriendlyName = 'example.com' }

                { Request-NSACMECertificateDnsOrder -Request $request -Domains @('example.com') -PfxSecret (ConvertTo-SecureString 'x' -AsPlainText -Force) -AcmeOptions @{} } |
                    Should -Throw -ExpectedMessage '*NetScaler session is required*'
            }

            It 'expands a single DNS plugin value for multi-name orders' {
                $script:CapturedPlugin = $null
                $script:CapturedDnsSleep = $null
                function New-PACertificate {
                    param(
                        [string[]]$Domain,
                        [string]$Contact,
                        [bool]$AcceptTOS,
                        [object[]]$Plugin,
                        [hashtable]$PluginArgs,
                        [int]$DnsSleep,
                        [securestring]$PfxPassSecure,
                        [string]$FriendlyName,
                        [bool]$Force,
                        [string]$CertKeyLength,
                        [string]$ErrorAction
                    )

                    $script:CapturedPlugin = @($Plugin)
                    $script:CapturedDnsSleep = $DnsSleep
                    [pscustomobject]@{ MainDomain = 'example.com' }
                }

                try {
                    $request = [pscustomobject]@{
                        CN             = 'example.com'
                        DNSPlugin      = 'Manual'
                        EmailAddress   = 'hostmaster@example.com'
                        FriendlyName   = 'example.com'
                        KeyLength      = 2048
                        ForceCertRenew = $false
                    }

                    Request-NSACMECertificateDnsOrder -Request $request -Domains @('example.com', '*.example.com') -PfxSecret (ConvertTo-SecureString 'x' -AsPlainText -Force) -AcmeOptions @{} | Out-Null

                    $script:CapturedPlugin.Count | Should -Be 2
                    $script:CapturedPlugin | Should -Be @('Manual', 'Manual')
                    $script:CapturedDnsSleep | Should -Be 120
                } finally {
                    Remove-Item -Path Function:\New-PACertificate -ErrorAction SilentlyContinue
                }
            }

        }
    }
}
