$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\NetScalerToolkit\NetScalerToolkit.psd1'
Import-Module $modulePath -Force

# Exception types whose Data dictionary is unusable, mirroring third-party exceptions
# that break the inner-exception walk in Write-NSACMECertificateErrorDetail.
class NullDataTestException : System.Exception {
    NullDataTestException([string]$message) : base($message) {}
    [System.Collections.IDictionary] get_Data() { return $null }
}

class NullKeysTestException : System.Exception {
    NullKeysTestException([string]$message) : base($message) {}
    [System.Collections.IDictionary] get_Data() { return [NullKeysTestDictionary]::new() }
}

# Dictionary whose Keys collection is null.
class NullKeysTestDictionary : System.Collections.Hashtable {
    [System.Collections.ICollection] get_Keys() { return $null }
}

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

        Context 'module version reporting' {
            It 'reports a loaded module by version alone' {
                $result = Get-NSACMECertificateModuleVersion -Name 'NetScalerToolkit'

                $result.Loaded | Should -BeTrue
                $result.Version | Should -Not -BeNullOrEmpty
                $result.Display | Should -Be ([string]$result.Version)
            }

            It 'marks an installed but unloaded module instead of presenting it as in use' {
                # The log header is written before Posh-ACME and ConsoleStatus are imported, so an
                # installed version must not read as the running one.
                Mock Get-Module { } -ParameterFilter { -not $ListAvailable }
                Mock Get-Module { [pscustomobject]@{ Name = 'Posh-ACME'; Version = [version]'4.31.0' } } -ParameterFilter { $ListAvailable }

                $result = Get-NSACMECertificateModuleVersion -Name 'Posh-ACME'

                $result.Loaded | Should -BeFalse
                $result.Version | Should -Be ([version]'4.31.0')
                $result.Display | Should -Be '4.31.0 (installed, not loaded yet)'
            }

            It 'reports a module that is not installed at all' {
                $result = Get-NSACMECertificateModuleVersion -Name 'NetScalerToolkitNoSuchModule'

                $result.Loaded | Should -BeFalse
                $result.Version | Should -BeNullOrEmpty
                $result.Display | Should -Be 'not installed'
            }

            It 'resolves Posh-ACME and ConsoleStatus through the same code path' {
                $poshACME = Get-NSACMECertificateModuleVersion -Name 'Posh-ACME'
                $consoleStatus = Get-NSACMECertificateModuleVersion -Name 'ConsoleStatus'

                foreach ($result in @($poshACME, $consoleStatus)) {
                    $result.PSObject.Properties.Name | Should -Contain 'Loaded'
                    $result.PSObject.Properties.Name | Should -Contain 'Display'
                    $result.Display | Should -Not -BeNullOrEmpty
                }
            }
        }

        Context 'deployed NetScaler certificate as the primary renewal source' {
            BeforeAll {
                function New-TestNitroDate {
                    param([Parameter(Mandatory)][datetime]$Date)
                    # NITRO reports 'Jul 16 18:51:18 2020 GMT'.
                    '{0} GMT' -f $Date.ToUniversalTime().ToString('MMM d HH:mm:ss yyyy', [System.Globalization.CultureInfo]::InvariantCulture)
                }

                function New-TestNitroCertKey {
                    param(
                        [int]$NotBeforeDays = -20,
                        [int]$NotAfterDays = 70,
                        [string]$Issuer = 'CN=YR1, O=Lets Encrypt, C=US',
                        [string]$Status = 'Valid',
                        [string]$Serial = 'SERIAL-1',
                        [string]$Subject = 'CN=host.example.com'
                    )

                    [pscustomobject]@{
                        certkey             = 'host.example.com'
                        subject             = $Subject
                        issuer              = $Issuer
                        status              = $Status
                        serial              = $Serial
                        clientcertnotbefore = New-TestNitroDate -Date (Get-Date).AddDays($NotBeforeDays)
                        clientcertnotafter  = New-TestNitroDate -Date (Get-Date).AddDays($NotAfterDays)
                        daystoexpiration    = $NotAfterDays
                    }
                }

            }

            It 'parses the NITRO certkey date format, including a space padded day' {
                # Space padded NotBefore, unpadded NotAfter, so one case covers both.
                $certKey = [pscustomobject]@{
                    certkey             = 'host.example.com'
                    subject             = 'CN=host.example.com'
                    status              = 'Valid'
                    clientcertnotbefore = 'Jul  6 18:51:18 2030 GMT'
                    clientcertnotafter  = 'Jul 16 18:51:18 2040 GMT'
                }

                $decision = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate $certKey -Domains @('host.example.com') -IsProduction

                $decision.CertExpires.ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss') | Should -Be '2040-07-16 18:51:18'
                # Two thirds of a lifetime starting 2030-07-06 lands in 2037, so nothing is due yet.
                $decision.ShouldRenew | Should -BeFalse
            }

            It 'skips a valid deployed certificate when the ACME order metadata is stale' {
                # Regression: a Posh-ACME order left over from a previous account claimed the
                # certificate had expired, while the appliance was serving a valid one.
                $request = [pscustomobject]@{ CN = 'host.example.com' }
                $staleOrder = [pscustomobject]@{
                    CertExpires = '2025-06-27T00:06:14Z'
                    RenewAfter  = '2025-05-27T02:50:19Z'
                }

                $decision = Test-NSACMECertificateRenewalRequired -Request $request -AcmeOrder $staleOrder -NetScalerCertificate (New-TestNitroCertKey) -Domains @('host.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeFalse
                $decision.Source | Should -Be 'NetScaler certificate'
            }

            It 'lets an ACME order for the deployed certificate pull renewal forward' {
                $deployedNotAfter = (Get-Date).AddDays(70)
                $certKey = New-TestNitroCertKey
                $certKey.clientcertnotafter = New-TestNitroDate -Date $deployedNotAfter
                $matchingOrder = [pscustomobject]@{
                    CertExpires = $deployedNotAfter.ToString('o')
                    RenewAfter  = (Get-Date).AddDays(-1).ToString('o')
                }

                $decision = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -AcmeOrder $matchingOrder -NetScalerCertificate $certKey -Domains @('host.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeTrue
                $decision.Source | Should -Be 'ACME order'
            }

            It 'renews an expired deployed certificate and skips one outside its window' {
                $expired = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate (New-TestNitroCertKey -NotBeforeDays -120 -NotAfterDays -5) -Domains @('host.example.com') -IsProduction
                $current = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate (New-TestNitroCertKey) -Domains @('host.example.com') -IsProduction

                $expired.ShouldRenew | Should -BeTrue
                $expired.Summary | Should -Be 'Certificate expired.'
                $current.ShouldRenew | Should -BeFalse
            }

            It 'derives expiry from daystoexpiration when the validity dates are missing' {
                $certKey = [pscustomobject]@{ certkey = 'host.example.com'; status = 'Valid'; daystoexpiration = -3 }

                $decision = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate $certKey -Domains @('host.example.com') -IsProduction

                $decision.ShouldRenew | Should -BeTrue
                $decision.Source | Should -Be 'NetScaler certificate'
                $decision.Summary | Should -Be 'Certificate expired.'
            }

            It 'renews a staging certificate on a production run but leaves it alone otherwise' {
                $stagingCertKey = New-TestNitroCertKey -Issuer '(STAGING) False Fennel E6'

                $production = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate $stagingCertKey -Domains @('host.example.com') -IsProduction
                $staging = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate $stagingCertKey -Domains @('host.example.com')

                $production.ShouldRenew | Should -BeTrue
                $production.Summary | Should -Be 'Staging certificate on a production run.'
                $staging.ShouldRenew | Should -BeFalse
            }

            It 'renews when the NetScaler reports the certkey as not valid' {
                $decision = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate (New-TestNitroCertKey -Status 'Expired') -Domains @('host.example.com') -IsProduction

                $decision.ShouldRenew | Should -BeTrue
                $decision.Summary | Should -Be 'Certkey not valid on the NetScaler.'
            }

            It 'renews when the deployed certificate is issued to another common name' {
                $decision = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com' }) -NetScalerCertificate (New-TestNitroCertKey -Subject 'C=US,O=Example,CN=other.example.com') -Domains @('host.example.com') -IsProduction

                $decision.ShouldRenew | Should -BeTrue
                $decision.Summary | Should -Be 'Deployed certificate is for another name.'
            }
        }

        Context 'request definition drift' {
            BeforeAll {
                function New-TestDriftCertKey {
                    [pscustomobject]@{
                        certkey             = 'host.example.com'
                        subject             = 'CN=host.example.com'
                        issuer              = 'CN=YR1'
                        status              = 'Valid'
                        serial              = 'SERIAL-1'
                        clientcertnotbefore = '{0} GMT' -f (Get-Date).AddDays(-20).ToUniversalTime().ToString('MMM d HH:mm:ss yyyy', [System.Globalization.CultureInfo]::InvariantCulture)
                        clientcertnotafter  = '{0} GMT' -f (Get-Date).AddDays(70).ToUniversalTime().ToString('MMM d HH:mm:ss yyyy', [System.Globalization.CultureInfo]::InvariantCulture)
                    }
                }

                function New-TestDriftRequest {
                    param([hashtable]$Override, [switch]$WithoutRecord)
                    $properties = @{ CN = 'host.example.com'; KeyLength = '2048' }
                    if (-not $WithoutRecord) {
                        $properties['LastIssuedSerial'] = 'SERIAL-1'
                        $properties['LastIssuedDomains'] = 'host.example.com'
                        $properties['LastIssuedAcmeServer'] = 'LE_PROD'
                        $properties['LastIssuedKeyLength'] = '2048'
                    }
                    if ($Override) {
                        foreach ($key in $Override.Keys) { $properties[$key] = $Override[$key] }
                    }
                    [pscustomobject]$properties
                }
            }

            It 'renews when a SAN is added to a corroborated request' {
                $decision = Test-NSACMECertificateRenewalRequired -Request (New-TestDriftRequest) -NetScalerCertificate (New-TestDriftCertKey) -Domains @('host.example.com', 'www.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeTrue
                $decision.Source | Should -Be 'request definition'
                $decision.Summary | Should -Be 'Requested domains changed.'
            }

            It 'ignores domain order and casing' {
                $decision = Test-NSACMECertificateRenewalRequired -Request (New-TestDriftRequest) -NetScalerCertificate (New-TestDriftCertKey) -Domains @('HOST.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeFalse
            }

            It 'renews when the ACME server changed, covering a staging to production move' {
                $decision = Test-NSACMECertificateRenewalRequired -Request (New-TestDriftRequest @{ LastIssuedAcmeServer = 'LE_STAGE' }) -NetScalerCertificate (New-TestDriftCertKey) -Domains @('host.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeTrue
                $decision.Summary | Should -Be 'ACME server changed.'
            }

            It 'renews when the requested key length changed' {
                $decision = Test-NSACMECertificateRenewalRequired -Request (New-TestDriftRequest @{ LastIssuedKeyLength = '4096' }) -NetScalerCertificate (New-TestDriftCertKey) -Domains @('host.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeTrue
                $decision.Summary | Should -Be 'Key length changed.'
            }

            It 'does not renew on drift when no record exists yet, so an upgrade stays quiet' {
                $decision = Test-NSACMECertificateRenewalRequired -Request (New-TestDriftRequest -WithoutRecord) -NetScalerCertificate (New-TestDriftCertKey) -Domains @('host.example.com', 'www.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeFalse
                $decision.Source | Should -Be 'NetScaler certificate'
            }

            It 'ignores the record when the serial no longer matches the deployed certificate' {
                $decision = Test-NSACMECertificateRenewalRequired -Request (New-TestDriftRequest @{ LastIssuedSerial = 'SERIAL-OLD' }) -NetScalerCertificate (New-TestDriftCertKey) -Domains @('host.example.com', 'www.example.com') -AcmeServer 'LE_PROD' -IsProduction

                $decision.ShouldRenew | Should -BeFalse
                $decision.Source | Should -Be 'NetScaler certificate'
            }

            It 'keeps renewal metadata stable across a save and reload cycle' {
                # Regression: a local time was written with a literal Z, so every run shifted the
                # stored value by the UTC offset.
                $stored = '2126-10-25T23:19:04Z'
                foreach ($pass in 1..3) {
                    $decision = Test-NSACMECertificateRenewalRequired -Request ([pscustomobject]@{ CN = 'host.example.com'; RenewAfter = $stored })
                    $stored = ([datetimeoffset]$decision.RenewAfter).UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ', [System.Globalization.CultureInfo]::InvariantCulture)
                }

                $stored | Should -Be '2126-10-25T23:19:04Z'
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

            It 'requires CertDir for AutoRun requests when not provided in config or command line' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $configPath = Join-Path $dir 'GenLe-Config.json'
                    $config = [pscustomobject]@{
                        settings = [pscustomobject]@{
                            ManagementURL = 'https://ns-01.domain.local'
                            ADCCredentialUsername = 'nsroot'
                            ADCCredentialPassword = ConvertTo-NSACMECertificateLegacySecret -Object 'Sup3rS3cretP@ssw0rd'
                        }
                        certrequests = @(
                            [pscustomobject]@{
                                Enabled = $true
                                CN = 'example.com'
                                ValidationMethod = 'http'
                                CsVipName = @('cs_example_http')
                            }
                        )
                    }
                    $config | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $configPath -Encoding UTF8

                    Mock Import-Module {} -ParameterFilter { $Name -eq 'Posh-ACME' }
                    Mock Set-NSACMEPoshACMEServer {}
                    Mock Get-PAServer { [pscustomobject]@{ renewalInfo = 'https://example.com/acme/renewal-info'; DisableARI = $false } }
                    Mock Connect-NSNode { [pscustomobject]@{ IsHA = $false; IsPrimary = $true } }

                    {
                        Request-NSACMECertificate `
                            -ConfigFile $configPath `
                            -AutoRun `
                            -Production `
                            -StopOnError
                    } | Should -Throw -ExpectedMessage '*CertDir is required*'
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            It 'merges into the config as it stands and keeps a backup, so an edit made during the run survives' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $configPath = Join-Path $dir 'GenLe-Config.json'
                    $config = [pscustomobject]@{
                        settings     = [pscustomobject]@{
                            ManagementURL         = 'https://ns-01.domain.local'
                            ADCCredentialUsername = 'nsroot'
                            ADCCredentialPassword = ConvertTo-NSACMECertificateLegacySecret -Object 'Sup3rS3cretP@ssw0rd'
                            LogFile               = Join-Path $dir 'run.log'
                        }
                        certrequests = @(
                            [pscustomobject]@{
                                Enabled                 = $true
                                CN                      = 'example.com'
                                ValidationMethod        = 'http'
                                CsVipName               = @('cs_example_http')
                                CertDir                 = $dir
                                CurrentCertIsProduction = $true
                            },
                            [pscustomobject]@{
                                Enabled          = $false
                                CN               = 'other.example.com'
                                ValidationMethod = 'http'
                                CsVipName        = @('cs_example_http')
                                CertDir          = $dir
                            }
                        )
                    }
                    $config | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $configPath -Encoding UTF8

                    Mock Import-Module {} -ParameterFilter { $Name -eq 'Posh-ACME' }
                    Mock Set-NSACMEPoshACMEServer {}
                    Mock Get-PAServer { [pscustomobject]@{ renewalInfo = 'https://example.com/acme/renewal-info'; DisableARI = $false } }
                    Mock Connect-NSNode { [pscustomobject]@{ IsHA = $false; IsPrimary = $true } }
                    Mock Test-NSACMECertificateRenewalRequired {
                        # Stands in for an edit landing while the run is in progress.
                        $onDisk = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
                        $onDisk.certrequests[1].Enabled = $true
                        $onDisk | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $configPath -Encoding UTF8

                        [pscustomobject]@{
                            ShouldRenew    = $false
                            Reason         = 'unit test skip'
                            Summary        = 'unit test skip'
                            CertExpires    = $null
                            RenewAfter     = $null
                            Source         = 'unit'
                            Strategy       = 'unit test'
                            ExpireDays     = $null
                            RenewAfterDays = $null
                        }
                    }

                    Request-NSACMECertificate `
                        -ConfigFile $configPath `
                        -AutoRun `
                        -Production `
                        -SkipCertificateCheck `
                        -NoConsoleOutput | Out-Null

                    $saved = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
                    $saved.certrequests[1].Enabled | Should -BeTrue
                    $saved.certrequests[0].RenewalSource | Should -Be 'unit'
                    # Retired in favour of LastIssuedAcmeServer.
                    $saved.certrequests[0].PSObject.Properties.Name | Should -Not -Contain 'CurrentCertIsProduction'
                    Test-Path -LiteralPath "$configPath.bak" | Should -BeTrue
                    Test-Path -LiteralPath "$configPath.tmp" | Should -BeFalse
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            It 'logs feature enable warning details and continues HTTP initialization when feature enable fails' {
                Mock Invoke-NSGetNsFeature { [pscustomobject]@{} }
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

            It 'skips feature enable when required NetScaler features are already enabled' {
                Mock Invoke-NSGetNsFeature { [pscustomobject]@{ lb = 'ON'; responder = 'ENABLED'; cs = $true; ssl = 1 } }
                Mock Invoke-NSEnableNsFeature {}
                Mock Write-NSACMECertificateLog {}
                Mock Invoke-NSGetService { [pscustomobject]@{ name = 'svc_letsencrypt_cert_dummy' } }
                Mock Invoke-NSGetCSVServer { [pscustomobject]@{ name = 'cs_letsencrypt' } }
                Mock Invoke-NSGetLBVServer { [pscustomobject]@{ name = 'lb_letsencrypt_cert' } }
                Mock Invoke-NSGetLBVServerServiceBinding { @([pscustomobject]@{ servicename = 'svc_letsencrypt_cert_dummy' }) }
                Mock Invoke-NSAddLBVServerServiceBinding {}
                Mock Invoke-NSAddCSAction {}
                Mock Invoke-NSUpdateCSAction {}
                Mock Invoke-NSAddCSPolicy {}
                Mock Invoke-NSUpdateCSPolicy {}
                Mock Invoke-NSAddCSVServerCSPolicyBinding {}

                $request = [pscustomobject]@{
                    UseLbVip   = $false
                    CsVipName  = @('cs_letsencrypt')
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
                Should -Invoke Invoke-NSEnableNsFeature -Times 0
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

            It 'keeps running when the log file is locked by another process' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                $stream = $null
                try {
                    $logPath = Join-Path $dir 'acme.log'
                    $script:NSACMECertificateLogFile = $logPath
                    $script:NSACMECertificateLogLevel = 'Info'
                    $script:NSACMECertificateLogType = 'txt'
                    $script:NSACMECertificateNoConsoleOutput = $true
                    $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()

                    Initialize-NSACMECertificateLog -Path $logPath -LogType txt
                    $stream = [System.IO.File]::Open($logPath, 'Open', 'Read', 'None')

                    { Write-NSACMECertificateLog Info 'Unit' 'Write while locked' -ErrorAction Stop } | Should -Not -Throw
                } finally {
                    if ($stream) { $stream.Dispose() }
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                    $script:NSACMECertificateLogFile = $null
                    $script:NSACMECertificateNoConsoleOutput = $false
                }
            }

            It 'releases the attached log file when the completion mail fails' {
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

                    # Port 9 on loopback refuses immediately, so the send fails with the log attached.
                    $settings = [pscustomobject]@{
                        SendMail        = $true
                        SMTPTo          = 'hostmaster@example.com'
                        SMTPFrom        = 'acme@example.com'
                        SMTPServer      = '127.0.0.1'
                        SMTPPort        = 9
                        SMTPUseSSL      = $false
                        SMTPCredential  = [pscredential]::Empty
                        LogAsAttachment = $true
                    }

                    Send-NSACMECertificateMail -Settings $settings -Subject 'Unit' -Body 'Unit' -LogFile $logPath

                    { Add-Content -LiteralPath $logPath -Value 'after mail' -ErrorAction Stop } | Should -Not -Throw
                    (Get-Content -LiteralPath $logPath) | Should -Contain 'after mail'
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

            It 'reports the certificate details in the result summary' {
                $script:SummaryMessages = @()
                Mock Write-NSACMECertificateLog { $script:SummaryMessages += $Message }

                Write-NSACMECertificateResultSummary -Results @([pscustomobject]@{
                        CN                      = 'example.com'
                        Domains                 = @('example.com', 'www.example.com')
                        Status                  = 'Success'
                        Production              = $false
                        CertKeyName             = 'TST-example-cert'
                        NotAfter                = (Get-Date).AddDays(90).AddMinutes(1)
                        RenewAfter              = (Get-Date).AddDays(59).AddMinutes(1)
                        PublicKeySize           = 2048
                        Thumbprint              = 'ABC123'
                        CertDir                 = 'C:\Certs\LECRT-20260813-215559-example.com'
                        CertFile                = 'C:\Certs\LECRT-20260813-215559-example.com\cert.cer'
                        KeyFile                 = 'C:\Certs\LECRT-20260813-215559-example.com\cert.key'
                        # PfxPath is the uploaded file, which is the full chain whenever one exists.
                        PfxPath                 = 'C:\Certs\LECRT-20260813-215559-example.com\fullchain.pfx'
                        PfxFilePath             = 'C:\Certs\LECRT-20260813-215559-example.com\cert.pfx'
                        PfxFullChainPath        = 'C:\Certs\LECRT-20260813-215559-example.com\fullchain.pfx'
                        IntermediateName        = 'STAGING Unit Intermediate'
                        IntermediateNotAfter    = [datetime]'2028-09-03'
                        IntermediateCertKeyName = @('STAGING Unit Intermediate')
                        LogFile                 = 'acme.log'
                    })

                $summary = $script:SummaryMessages -join "`n"
                $summary | Should -Match 'Certificate usage\s+test \(staging\)'
                $summary | Should -Match 'Expires\s+\S+ \S+ \(90 days\)'
                $summary | Should -Match 'Renew after\s+\S+ \S+ \(59 days\)'
                $summary | Should -Match 'Public key size\s+2048'
                $summary | Should -Match 'Intermediate\s+STAGING Unit Intermediate \[2028-09-03\]'
                $summary | Should -Match 'Intermediate certkey\s+STAGING Unit Intermediate'
                $summary | Should -Match 'Cert dir\s+C:\\Certs\\LECRT-20260813-215559-example\.com'
                $summary | Should -Match 'CRT file\s+cert\.cer'
                $summary | Should -Match 'KEY file\s+cert\.key'
                $summary | Should -Match 'PFX file\s+cert\.pfx'
                $summary | Should -Match 'PFX with chain\s+fullchain\.pfx'
            }

            It 'copies generated ACME certificate artifacts to the configured CertDir' {
                $sourceRoot = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                $targetRoot = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $sourceRoot | Out-Null
                New-Item -ItemType Directory -Path $targetRoot | Out-Null
                try {
                    $orderDir = Join-Path $sourceRoot '3416058976'
                    $domainDir = Join-Path $orderDir 'topdesk-va-upgr.vgmdiensten.nl'
                    New-Item -ItemType Directory -Path $domainDir -Force | Out-Null
                    Set-Content -LiteralPath (Join-Path $domainDir 'fullchain.pfx') -Value 'pfx' -Encoding ASCII
                    Set-Content -LiteralPath (Join-Path $domainDir 'cert.pfx') -Value 'pfx' -Encoding ASCII
                    Set-Content -LiteralPath (Join-Path $domainDir 'chain.cer') -Value 'chain' -Encoding ASCII
                    Set-Content -LiteralPath (Join-Path $domainDir 'cert.cer') -Value 'cert' -Encoding ASCII
                    Set-Content -LiteralPath (Join-Path $domainDir 'order.json') -Value '{}' -Encoding ASCII

                    Mock Write-NSACMECertificateLog {}
                    Mock Get-Date -ParameterFilter { $Format -eq 'yyyyMMdd-HHmmss' } { '20260523-020149' }
                    $certificate = [pscustomobject]@{
                        PfxFullChain  = (Join-Path $domainDir 'fullchain.pfx')
                        PfxFile       = (Join-Path $domainDir 'cert.pfx')
                        ChainFile     = (Join-Path $domainDir 'chain.cer')
                        CertFile      = (Join-Path $domainDir 'cert.cer')
                        FullChainFile = (Join-Path $domainDir 'fullchain.cer')
                    }

                    $result = Copy-NSACMECertificateArtifactsToCertDir -Certificate $certificate -CertDir $targetRoot -CommonName 'topdesk-va-upgr.vgmdiensten.nl'

                    $expectedDir = Join-Path $targetRoot 'LECRT-20260523-020149-topdesk-va-upgr.vgmdiensten.nl'
                    (Test-Path -LiteralPath (Join-Path $expectedDir 'fullchain.pfx')) | Should -BeTrue
                    (Test-Path -LiteralPath (Join-Path $expectedDir 'cert.pfx')) | Should -BeTrue
                    (Test-Path -LiteralPath (Join-Path $expectedDir 'chain.cer')) | Should -BeTrue
                    (Test-Path -LiteralPath (Join-Path $expectedDir 'cert.cer')) | Should -BeTrue
                    $result.PfxFullChain | Should -Be (Join-Path $expectedDir 'fullchain.pfx')
                    $result.PfxFile | Should -Be (Join-Path $expectedDir 'cert.pfx')
                    $result.ChainFile | Should -Be (Join-Path $expectedDir 'chain.cer')
                    $result.CertFile | Should -Be (Join-Path $expectedDir 'cert.cer')
                } finally {
                    Remove-Item -LiteralPath $sourceRoot -Recurse -Force -ErrorAction SilentlyContinue
                    Remove-Item -LiteralPath $targetRoot -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            It 'removes expired legacy LECRT folders by folder timestamp and CN filter' {
                $certDir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $certDir | Out-Null
                try {
                    New-Item -ItemType Directory -Path (Join-Path $certDir 'LECRT-20250101-010101-topdesk-va-upgr.vgmdiensten.nl') | Out-Null
                    New-Item -ItemType Directory -Path (Join-Path $certDir 'LECRT-20260501-010101-topdesk-va-upgr.vgmdiensten.nl') | Out-Null
                    New-Item -ItemType Directory -Path (Join-Path $certDir 'LECRT-20250101-010101-other.vgmdiensten.nl') | Out-Null

                    Mock Get-Date { [datetime]'2026-06-08T15:00:00' }
                    $result = Remove-NSACMECertificateExpiredDiskCertificate -CertDir $certDir -Days 100 -CN 'topdesk-va-upgr.vgmdiensten.nl'

                    $result.Removed | Should -Be 1
                    (Test-Path -LiteralPath (Join-Path $certDir 'LECRT-20250101-010101-topdesk-va-upgr.vgmdiensten.nl')) | Should -BeFalse
                    (Test-Path -LiteralPath (Join-Path $certDir 'LECRT-20260501-010101-topdesk-va-upgr.vgmdiensten.nl')) | Should -BeTrue
                    (Test-Path -LiteralPath (Join-Path $certDir 'LECRT-20250101-010101-other.vgmdiensten.nl')) | Should -BeTrue
                } finally {
                    Remove-Item -LiteralPath $certDir -Recurse -Force -ErrorAction SilentlyContinue
                }
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

            It 'throws when chain validation fails in Fail mode' {
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

            It 'stops before install when chain validation fails in Fail mode' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    # Shadow the Posh-ACME cmdlets: their KeyLength validation calls module-private
                    # helpers that are unreachable from here, and mocks keep the real parameter metadata.
                    function Get-PAServer { param($DirectoryUrl) [pscustomobject]@{ renewalInfo = $null; DisableARI = $true } }
                    function Get-PAOrder { param($MainDomain, [switch]$Refresh) [pscustomobject]@{ MainDomain = 'example.com'; status = 'valid' } }
                    function Get-PACertificate { param($MainDomain) [pscustomobject]@{ CertFile = $null; Thumbprint = 'ABC123' } }
                    function Get-PAAccount { param($ID, $Contact, $KeyLength, $Status, [switch]$List, [switch]$Refresh) [pscustomobject]@{ ID = '1'; contact = @('mailto:hostmaster@example.com') } }
                    function Set-PAAccount { param($ID, [switch]$Force) }
                    function New-PAOrder { param($Domain, $KeyLength, $FriendlyName, $PfxPassSecure, $PreferredChain, $LifetimeDays, $ValidationTimeout, [switch]$AlwaysNewKey, [switch]$Force, [switch]$UseModernPfxEncryption) [pscustomobject]@{ MainDomain = 'example.com' } }
                    function Submit-OrderFinalize { param($Order) }
                    function Complete-PAOrder { param($Order) }

                    Mock Import-Module {} -ParameterFilter { $Name -eq 'Posh-ACME' }
                    Mock Set-NSACMEPoshACMEServer {}
                    Mock Connect-NSNode { [pscustomobject]@{ IsHA = $false; IsPrimary = $true } }
                    Mock Invoke-NSGetSSLCertKey { $null }
                    Mock Test-NSACMECertificateRenewalRequired {
                        [pscustomobject]@{ ShouldRenew = $true; Reason = 'unit test renew'; Summary = 'unit test renew'; CertExpires = $null; RenewAfter = $null; Source = 'unit'; Strategy = 'unit test'; ExpireDays = 0; RenewAfterDays = $null }
                    }
                    Mock Initialize-NSACMECertificateHttpValidationConfig {}
                    Mock Get-NSACMECertificateVServerState {
                        [pscustomobject]@{ Name = 'cs_example_http'; Type = 'CS'; State = 'ENABLED'; CurState = 'UP'; Endpoint = '10.0.0.1:80'; Text = 'UP'; IsServing = $true; Found = $true }
                    }
                    Mock Publish-NSACMECertificateHttpChallenge { @() }
                    Mock Wait-NSACMECertificateAuthorization {}
                    Mock Submit-OrderFinalize {}
                    Mock Wait-NSACMECertificateOrderFinal {}
                    Mock Complete-PAOrder {}
                    Mock Copy-NSACMECertificateArtifactsToCertDir { [pscustomobject]@{ CertFile = $null; Thumbprint = 'ABC123' } }
                    Mock Test-NSACMECertificateChainValidation { throw 'Certificate chain validation failed in Fail mode.' }
                    Mock Install-NSACMECertificateNetScalerCertificate { [pscustomobject]@{ CertKeyName = 'san_example_com'; PfxFileName = 'unit.pfx'; PfxPath = 'C:\Certs\unit.pfx' } }
                    Mock Remove-NSACMECertificateHttpChallengeBinding {}
                    Mock Remove-NSACMECertificateHttpValidationConfig {}

                    $requestResult = Request-NSACMECertificate `
                        -ManagementURL 'https://ns-01.domain.local' `
                        -Username 'nsroot' `
                        -Password 'Sup3rS3cretP@ssw0rd' `
                        -CN 'example.com' `
                        -ValidationMethod http `
                        -CsVipName 'cs_example_http' `
                        -CertKeyNameToUpdate 'san_example_com' `
                        -CertDir $dir `
                        -EmailAddress 'hostmaster@example.com' `
                        -CertificateChainValidation Fail `
                        -Production `
                        -SkipCertificateCheck `
                        -DisableLogging `
                        -NoConsoleOutput

                    Should -Invoke Test-NSACMECertificateChainValidation -Times 1
                    Should -Invoke Install-NSACMECertificateNetScalerCertificate -Times 0
                    @($requestResult)[0].Status | Should -Be 'Failed'
                    @($requestResult)[0].Reason | Should -Match 'chain validation'
                    Should -Invoke Remove-NSACMECertificateHttpValidationConfig -Times 1
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            It 'fails the request before publishing the challenge when the CS vServer is not serving' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    # See the chain validation wiring test above for why these are stubs, not mocks.
                    function Get-PAServer { param($DirectoryUrl) [pscustomobject]@{ renewalInfo = $null; DisableARI = $true } }
                    function Get-PAOrder { param($MainDomain, [switch]$Refresh) [pscustomobject]@{ MainDomain = 'example.com'; status = 'valid' } }
                    function Get-PACertificate { param($MainDomain) [pscustomobject]@{ CertFile = $null; Thumbprint = 'ABC123' } }
                    function Get-PAAccount { param($ID, $Contact, $KeyLength, $Status, [switch]$List, [switch]$Refresh) [pscustomobject]@{ ID = '1'; contact = @('mailto:hostmaster@example.com') } }
                    function Set-PAAccount { param($ID, [switch]$Force) }
                    function New-PAOrder { param($Domain, $KeyLength, $FriendlyName, $PfxPassSecure, $PreferredChain, $LifetimeDays, $ValidationTimeout, [switch]$AlwaysNewKey, [switch]$Force, [switch]$UseModernPfxEncryption) [pscustomobject]@{ MainDomain = 'example.com' } }

                    Mock Import-Module {} -ParameterFilter { $Name -eq 'Posh-ACME' }
                    Mock Set-NSACMEPoshACMEServer {}
                    Mock Connect-NSNode { [pscustomobject]@{ IsHA = $false; IsPrimary = $true } }
                    Mock Invoke-NSGetSSLCertKey { $null }
                    Mock Test-NSACMECertificateRenewalRequired {
                        [pscustomobject]@{ ShouldRenew = $true; Reason = 'unit test renew'; Summary = 'unit test renew'; CertExpires = $null; RenewAfter = $null; Source = 'unit'; Strategy = 'unit test'; ExpireDays = 0; RenewAfterDays = $null }
                    }
                    Mock Initialize-NSACMECertificateHttpValidationConfig {}
                    Mock Get-NSACMECertificateVServerState {
                        [pscustomobject]@{ Name = 'cs_example_http'; Type = 'CS'; State = 'ENABLED'; CurState = 'OUT OF SERVICE'; Endpoint = '10.0.0.1:80'; Text = 'OUT OF SERVICE, ENABLED'; IsServing = $false; Found = $true }
                    }
                    Mock Publish-NSACMECertificateHttpChallenge { @() }
                    Mock Install-NSACMECertificateNetScalerCertificate { [pscustomobject]@{ CertKeyName = 'san_example_com' } }
                    Mock Remove-NSACMECertificateHttpChallengeBinding {}
                    Mock Remove-NSACMECertificateHttpValidationConfig {}

                    $requestResult = Request-NSACMECertificate `
                        -ManagementURL 'https://ns-01.domain.local' `
                        -Username 'nsroot' `
                        -Password 'Sup3rS3cretP@ssw0rd' `
                        -CN 'example.com' `
                        -ValidationMethod http `
                        -CsVipName 'cs_example_http' `
                        -CertKeyNameToUpdate 'san_example_com' `
                        -CertDir $dir `
                        -EmailAddress 'hostmaster@example.com' `
                        -Production `
                        -SkipCertificateCheck `
                        -DisableLogging `
                        -NoConsoleOutput

                    Should -Invoke Publish-NSACMECertificateHttpChallenge -Times 0
                    Should -Invoke Install-NSACMECertificateNetScalerCertificate -Times 0
                    @($requestResult)[0].Status | Should -Be 'Failed'
                    @($requestResult)[0].Reason | Should -Match 'cannot reach the HTTP-01 challenge'
                    # Down plus no EnableVipBefore is the state DisableVipAfter leaves behind.
                    @($requestResult)[0].Reason | Should -Match 'EnableVipBefore'
                    Should -Invoke Remove-NSACMECertificateHttpValidationConfig -Times 1
                } finally {
                    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
                }
            }

            It 'names the VPN global binding and the parameter when a certkey update is refused' {
                $settings = [pscustomobject]@{ SaveADCConfig = $false }
                $request = [pscustomobject]@{ CN = 'example.com'; CertKeyNameToUpdate = 'vpn-bound-cert' }
                $pfxDir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $pfxDir | Out-Null
                $pfxPath = Join-Path $pfxDir 'fullchain.pfx'
                Set-Content -LiteralPath $pfxPath -Value 'unit-test-pfx' -Encoding ASCII
                $certificate = [pscustomobject]@{ PfxFullChain = $pfxPath; NotAfter = (Get-Date).AddDays(90) }

                Mock ConvertFrom-NSACMECertificateLegacySecret { 'pfx-pass' }
                Mock Copy-NSACMECertificateNetScalerFile {}
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'vpn-bound-cert' } }
                Mock Invoke-NSUnlinkSSLCertKey { throw 'ErrorCode: 1545; Message: Certificate does not have any CA link' }
                Mock Invoke-NSUpdateSSLCertKey { throw 'ErrorCode: 1541; Message: Certificate is referenced by a CRL, OCSP responder, vserver, service, monitor, SSL profile, CA Cert Group, another certificate' }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { [pscustomobject]@{ certkeyname = 'vpn-bound-cert' } }
                Mock Invoke-NSGetSSLCertLink { $null }
                Mock Invoke-NSGetSSLCertKeySSLVServerBinding { $null }
                Mock Invoke-NSGetSSLCertKeyServiceBinding { $null }
                Mock Invoke-NSGetSSLCertKeySSLProfileBinding { $null }
                Mock Invoke-NSGetSSLCertKeyCrldistributionBinding { $null }
                Mock Invoke-NSGetSSLCertKeySSLOCSPResponderBinding { $null }
                Mock Invoke-NSDeleteVPNGlobalSSLCertKeyBinding {}

                $installError = $null
                try {
                    Install-NSACMECertificateNetScalerCertificate -Session ([pscustomobject]@{}) -Settings $settings `
                        -Request $request -Certificate $certificate -PfxSecret (ConvertTo-SecureString 'pfx-pass' -AsPlainText -Force) -IsProduction
                } catch {
                    $installError = $_
                }

                $installError | Should -Not -BeNullOrEmpty
                $installError.Exception.Message | Should -Match "refused to update SSL certkey 'vpn-bound-cert'"
                $installError.Exception.Message | Should -Match 'bind vpn global -certkeyName vpn-bound-cert'
                $installError.Exception.Message | Should -Match '-UnbindGlobalVPNCertOnUpdate'
                $installError.Exception.Message | Should -Match 'ErrorCode: 1541'
                # Without the switch the binding is left exactly as it was.
                Should -Invoke Invoke-NSDeleteVPNGlobalSSLCertKeyBinding -Times 0
            }

            It 'unbinds from VPN global, updates and rebinds when UnbindGlobalVPNCertOnUpdate is set' {
                $settings = [pscustomobject]@{ SaveADCConfig = $false }
                $request = [pscustomobject]@{ CN = 'example.com'; CertKeyNameToUpdate = 'vpn-bound-cert'; UnbindGlobalVPNCertOnUpdate = $true }
                $pfxDir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $pfxDir | Out-Null
                $pfxPath = Join-Path $pfxDir 'fullchain.pfx'
                Set-Content -LiteralPath $pfxPath -Value 'unit-test-pfx' -Encoding ASCII
                $certificate = [pscustomobject]@{ PfxFullChain = $pfxPath; NotAfter = (Get-Date).AddDays(90) }

                $script:VpnUpdateAttempts = 0
                Mock ConvertFrom-NSACMECertificateLegacySecret { 'pfx-pass' }
                Mock Copy-NSACMECertificateNetScalerFile {}
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'vpn-bound-cert' } }
                Mock Invoke-NSUnlinkSSLCertKey { throw 'ErrorCode: 1545; Message: Certificate does not have any CA link' }
                Mock Invoke-NSUpdateSSLCertKey {
                    $script:VpnUpdateAttempts++
                    # Refused while bound; the third attempt runs after the unbind.
                    if ($script:VpnUpdateAttempts -lt 3) { throw 'ErrorCode: 1541; Message: Certificate is referenced by a CRL, OCSP responder, vserver' }
                }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { [pscustomobject]@{ certkeyname = 'vpn-bound-cert' } }
                Mock Invoke-NSGetSSLCertLink { $null }
                Mock Invoke-NSGetSSLCertKeySSLVServerBinding { $null }
                Mock Invoke-NSGetSSLCertKeyServiceBinding { $null }
                Mock Invoke-NSGetSSLCertKeySSLProfileBinding { $null }
                Mock Invoke-NSGetSSLCertKeyCrldistributionBinding { $null }
                Mock Invoke-NSGetSSLCertKeySSLOCSPResponderBinding { $null }
                Mock Invoke-NSDeleteVPNGlobalSSLCertKeyBinding {}
                Mock Invoke-NSAddVPNGlobalSSLCertKeyBinding {}
                Mock Set-NSACMECertificateChainLink { @() }

                $result = Install-NSACMECertificateNetScalerCertificate -Session ([pscustomobject]@{}) -Settings $settings `
                    -Request $request -Certificate $certificate -PfxSecret (ConvertTo-SecureString 'pfx-pass' -AsPlainText -Force) -IsProduction

                $script:VpnUpdateAttempts | Should -Be 3
                Should -Invoke Invoke-NSDeleteVPNGlobalSSLCertKeyBinding -Times 1
                Should -Invoke Invoke-NSAddVPNGlobalSSLCertKeyBinding -Times 1
                $result.CertKeyName | Should -Be 'vpn-bound-cert'
            }

            It 'restores the VPN global binding when the update fails while unbound' {
                $settings = [pscustomobject]@{ SaveADCConfig = $false }
                $request = [pscustomobject]@{ CN = 'example.com'; CertKeyNameToUpdate = 'vpn-bound-cert'; UnbindGlobalVPNCertOnUpdate = $true }
                $pfxDir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $pfxDir | Out-Null
                $pfxPath = Join-Path $pfxDir 'fullchain.pfx'
                Set-Content -LiteralPath $pfxPath -Value 'unit-test-pfx' -Encoding ASCII
                $certificate = [pscustomobject]@{ PfxFullChain = $pfxPath; NotAfter = (Get-Date).AddDays(90) }

                Mock ConvertFrom-NSACMECertificateLegacySecret { 'pfx-pass' }
                Mock Copy-NSACMECertificateNetScalerFile {}
                Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'vpn-bound-cert' } }
                Mock Invoke-NSUnlinkSSLCertKey { throw 'ErrorCode: 1545; Message: Certificate does not have any CA link' }
                Mock Invoke-NSUpdateSSLCertKey { throw 'ErrorCode: 1541; Message: Certificate is referenced by a CRL, OCSP responder, vserver' }
                Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { [pscustomobject]@{ certkeyname = 'vpn-bound-cert' } }
                Mock Invoke-NSGetSSLCertLink { $null }
                Mock Invoke-NSGetSSLCertKeySSLVServerBinding { $null }
                Mock Invoke-NSGetSSLCertKeyServiceBinding { $null }
                Mock Invoke-NSGetSSLCertKeySSLProfileBinding { $null }
                Mock Invoke-NSGetSSLCertKeyCrldistributionBinding { $null }
                Mock Invoke-NSGetSSLCertKeySSLOCSPResponderBinding { $null }
                Mock Invoke-NSDeleteVPNGlobalSSLCertKeyBinding {}
                Mock Invoke-NSAddVPNGlobalSSLCertKeyBinding {}

                {
                    Install-NSACMECertificateNetScalerCertificate -Session ([pscustomobject]@{}) -Settings $settings `
                        -Request $request -Certificate $certificate -PfxSecret (ConvertTo-SecureString 'pfx-pass' -AsPlainText -Force) -IsProduction
                } | Should -Throw

                Should -Invoke Invoke-NSAddVPNGlobalSSLCertKeyBinding -Times 1
            }

            It 'enables a CS vServer left down by DisableVipAfter and disables it again' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    # See the chain validation wiring test above for why these are stubs, not mocks.
                    function Get-PAServer { param($DirectoryUrl) [pscustomobject]@{ renewalInfo = $null; DisableARI = $true } }
                    function Get-PAOrder { param($MainDomain, [switch]$Refresh) [pscustomobject]@{ MainDomain = 'example.com'; status = 'valid' } }
                    function Get-PACertificate { param($MainDomain) [pscustomobject]@{ CertFile = $null; Thumbprint = 'ABC123' } }
                    function Get-PAAccount { param($ID, $Contact, $KeyLength, $Status, [switch]$List, [switch]$Refresh) [pscustomobject]@{ ID = '1'; contact = @('mailto:hostmaster@example.com') } }
                    function Set-PAAccount { param($ID, [switch]$Force) }
                    function New-PAOrder { param($Domain, $KeyLength, $FriendlyName, $PfxPassSecure, $PreferredChain, $LifetimeDays, $ValidationTimeout, [switch]$AlwaysNewKey, [switch]$Force, [switch]$UseModernPfxEncryption) [pscustomobject]@{ MainDomain = 'example.com' } }
                    function Submit-OrderFinalize { param($Order) }
                    function Complete-PAOrder { param($Order) }

                    Mock Import-Module {} -ParameterFilter { $Name -eq 'Posh-ACME' }
                    Mock Set-NSACMEPoshACMEServer {}
                    Mock Connect-NSNode { [pscustomobject]@{ IsHA = $false; IsPrimary = $true } }
                    Mock Invoke-NSGetSSLCertKey { $null }
                    Mock Test-NSACMECertificateRenewalRequired {
                        [pscustomobject]@{ ShouldRenew = $true; Reason = 'unit test renew'; Summary = 'unit test renew'; CertExpires = $null; RenewAfter = $null; Source = 'unit'; Strategy = 'unit test'; ExpireDays = 0; RenewAfterDays = $null }
                    }
                    Mock Initialize-NSACMECertificateHttpValidationConfig {}
                    # Down on the first read (the state DisableVipAfter left behind), up once enabled.
                    $script:VServerStateReads = 0
                    Mock Get-NSACMECertificateVServerState {
                        $script:VServerStateReads++
                        $serving = $script:VServerStateReads -gt 1
                        [pscustomobject]@{
                            Name      = $Name
                            Type      = $Type
                            State     = 'ENABLED'
                            CurState  = if ($serving) { 'UP' } else { 'OUT OF SERVICE' }
                            Endpoint  = '10.0.0.1:80'
                            Text      = if ($serving) { 'UP' } else { 'OUT OF SERVICE' }
                            IsServing = $serving
                            Found     = $true
                        }
                    }
                    Mock Invoke-NSEnableCSVServer {}
                    Mock Invoke-NSDisableCSVServer {}
                    Mock Publish-NSACMECertificateHttpChallenge { @() }
                    Mock Wait-NSACMECertificateAuthorization {}
                    Mock Wait-NSACMECertificateOrderFinal {}
                    Mock Copy-NSACMECertificateArtifactsToCertDir { [pscustomobject]@{ CertFile = $null; Thumbprint = 'ABC123' } }
                    Mock Test-NSACMECertificateChainValidation { [pscustomobject]@{ Mode = 'Warn'; Validated = $true; IsValid = $true; Status = @(); Leaf = $null; Chain = @() } }
                    Mock Install-NSACMECertificateNetScalerCertificate { [pscustomobject]@{ CertKeyName = 'san_example_com'; PfxFileName = 'unit.pfx'; PfxPath = 'C:\Certs\unit.pfx'; ChainCertKeyName = @() } }
                    Mock Remove-NSACMECertificateHttpChallengeBinding {}
                    Mock Remove-NSACMECertificateHttpValidationConfig {}

                    $requestResult = Request-NSACMECertificate `
                        -ManagementURL 'https://ns-01.domain.local' `
                        -Username 'nsroot' `
                        -Password 'Sup3rS3cretP@ssw0rd' `
                        -CN 'example.com' `
                        -ValidationMethod http `
                        -CsVipName 'cs_example_http' `
                        -CertKeyNameToUpdate 'san_example_com' `
                        -CertDir $dir `
                        -EmailAddress 'hostmaster@example.com' `
                        -EnableVipBefore `
                        -DisableVipAfter `
                        -Production `
                        -SkipCertificateCheck `
                        -DisableLogging `
                        -NoConsoleOutput

                    Should -Invoke Invoke-NSEnableCSVServer -Times 1
                    Should -Invoke Publish-NSACMECertificateHttpChallenge -Times 1
                    Should -Invoke Invoke-NSDisableCSVServer -Times 1
                    @($requestResult)[0].Status | Should -Be 'Success'
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

            It 'retries the certkey update with nodomaincheck after a rejected first attempt' {
                $dir = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
                New-Item -ItemType Directory -Path $dir | Out-Null
                try {
                    $pfxPath = Join-Path $dir 'fullchain.pfx'
                    Set-Content -LiteralPath $pfxPath -Value 'unit-test-pfx' -Encoding ASCII
                    $request = [pscustomobject]@{ CN = 'leaf.example.com'; CertKeyNameToUpdate = 'custom-cert-key' }
                    $settings = [pscustomobject]@{ SaveADCConfig = $false }
                    $certificate = [pscustomobject]@{ PfxFullChain = $pfxPath; NotAfter = [datetime]'2027-01-02T03:04:00' }
                    $script:UpdateAttempts = @()

                    Mock ConvertFrom-NSACMECertificateLegacySecret { 'pfx-pass' }
                    Mock Copy-NSACMECertificateNetScalerFile {}
                    Mock Invoke-NSGetSSLCertKey { [pscustomobject]@{ certkey = 'custom-cert-key' } }
                    Mock Invoke-NSUnlinkSSLCertKey { throw 'ErrorCode: 1545; Message: Certificate does not have any CA link' }
                    Mock Invoke-NSUpdateSSLCertKey {
                        $script:UpdateAttempts += [pscustomobject]@{ Nodomaincheck = [bool]$Nodomaincheck }
                        if ($script:UpdateAttempts.Count -eq 1) {
                            throw 'ErrorCode: 1541; Message: Certificate is referenced by a CRL, OCSP responder, vserver, service, monitor, SSL profile, CA Cert Group, another certificate'
                        }
                    }
                    Mock Set-NSACMECertificateChainLink { @() }

                    $result = Install-NSACMECertificateNetScalerCertificate `
                        -Session ([pscustomobject]@{}) `
                        -Settings $settings `
                        -Request $request `
                        -Certificate $certificate `
                        -PfxSecret (ConvertTo-SecureString 'pfx-pass' -AsPlainText -Force) `
                        -IsProduction

                    $script:UpdateAttempts.Count | Should -Be 2
                    $script:UpdateAttempts[0].Nodomaincheck | Should -BeFalse
                    $script:UpdateAttempts[1].Nodomaincheck | Should -BeTrue
                    $result.CertKeyName | Should -Be 'custom-cert-key'
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

        Context 'ACME account resolution' {
            BeforeEach {
                $script:NewAccountCalls = @()
                $script:AccountListFilters = @()
                $script:AccountStore = @()

                # Plain stubs so mocks bind without Posh-ACME's private ValidateScript helpers.
                function Get-PAAccount { param($ID, [switch]$List, $Status, $Contact, $KeyLength, [switch]$Refresh) }
                function New-PAAccount { param($Contact, $KeyLength, [switch]$AcceptTOS, [switch]$Force, $ExtAcctKID, $ExtAcctHMACKey, $ExtAcctAlgorithm) }
                function Set-PAAccount { param($ID, [switch]$Force) }

                Mock Get-PAAccount {
                    $script:AccountListFilters += [pscustomobject]@{ Contact = $Contact; KeyLength = $KeyLength; Status = $Status }
                    @($script:AccountStore | Where-Object {
                        $_.contact -contains "mailto:$Contact" -and $_.KeyLength -eq $KeyLength -and $_.status -eq 'valid'
                    })
                }
                Mock New-PAAccount {
                    $created = [pscustomobject]@{
                        ID        = "acct-$($script:NewAccountCalls.Count + 1)"
                        contact   = @("mailto:$Contact")
                        KeyLength = $KeyLength
                        status    = 'valid'
                    }
                    $script:NewAccountCalls += [pscustomobject]@{ Contact = $Contact; KeyLength = $KeyLength; Force = $Force }
                    $script:AccountStore += $created
                    $created
                }
                Mock Set-PAAccount {}

                # Mirrors the account resolution block in Request-NSACMECertificate so the reuse
                # contract is covered without standing up a full certificate request.
                function Resolve-TestAcmeAccount {
                    param([object[]]$Requests)

                    $resolvedAcmeAccounts = @{}
                    foreach ($request in $Requests) {
                        $accountKeyLength = [string]$request.KeyLength
                        if ($accountKeyLength -notmatch '^(ec-(256|384|521)|\d+)$') { $accountKeyLength = '2048' }
                        $accountCacheKey = "$($request.EmailAddress)|$accountKeyLength"
                        $account = $resolvedAcmeAccounts[$accountCacheKey]
                        if (-not $account) {
                            $existingAccounts = @()
                            try {
                                $existingAccounts = @(Get-PAAccount -List -Refresh -Contact $request.EmailAddress -KeyLength $accountKeyLength -Status 'valid' -ErrorAction Stop)
                            } catch {
                                $existingAccounts = @()
                            }
                            if ($existingAccounts.Count -gt 0) {
                                $account = $existingAccounts[0]
                            } else {
                                $account = New-PAAccount -Contact $request.EmailAddress -KeyLength $accountKeyLength -AcceptTOS -ErrorAction Stop
                            }
                            $resolvedAcmeAccounts[$accountCacheKey] = $account
                        }
                        Set-PAAccount -ID $account.ID -Force | Out-Null
                    }
                }
            }

            It 'creates one account for many requests sharing a contact' {
                $requests = 1..18 | ForEach-Object {
                    [pscustomobject]@{ CN = "host$_.example.com"; EmailAddress = 'hostmaster@example.com'; KeyLength = '2048' }
                }

                Resolve-TestAcmeAccount -Requests $requests

                Should -Invoke New-PAAccount -Times 1 -Exactly
                $script:AccountListFilters.Count | Should -Be 1
            }

            It 'reuses an account that already exists on disk without creating one' {
                $script:AccountStore = @(
                    [pscustomobject]@{ ID = 'acct-existing'; contact = @('mailto:hostmaster@example.com'); KeyLength = '2048'; status = 'valid' }
                )
                $requests = 1..3 | ForEach-Object {
                    [pscustomobject]@{ CN = "host$_.example.com"; EmailAddress = 'hostmaster@example.com'; KeyLength = '2048' }
                }

                Resolve-TestAcmeAccount -Requests $requests

                Should -Invoke New-PAAccount -Times 0
                Should -Invoke Set-PAAccount -Times 3
            }

            It 'creates separate accounts for distinct contacts' {
                $requests = @(
                    [pscustomobject]@{ CN = 'a.example.com'; EmailAddress = 'first@example.com'; KeyLength = '2048' }
                    [pscustomobject]@{ CN = 'b.example.com'; EmailAddress = 'second@example.com'; KeyLength = '2048' }
                    [pscustomobject]@{ CN = 'c.example.com'; EmailAddress = 'first@example.com'; KeyLength = '2048' }
                )

                Resolve-TestAcmeAccount -Requests $requests

                Should -Invoke New-PAAccount -Times 2 -Exactly
                $script:NewAccountCalls.Contact | Should -Be @('first@example.com', 'second@example.com')
            }

            It 'does not pass Force to New-PAAccount' {
                $requests = @([pscustomobject]@{ CN = 'a.example.com'; EmailAddress = 'hostmaster@example.com'; KeyLength = '2048' })

                Resolve-TestAcmeAccount -Requests $requests

                $script:NewAccountCalls[0].Force | Should -Not -BeTrue
            }

            It 'keeps RSA key lengths as strings when filtering accounts' {
                $requests = @([pscustomobject]@{ CN = 'a.example.com'; EmailAddress = 'hostmaster@example.com'; KeyLength = '4096' })

                Resolve-TestAcmeAccount -Requests $requests

                $script:AccountListFilters[0].KeyLength | Should -Be '4096'
                $script:AccountListFilters[0].KeyLength | Should -BeOfType [string]
                $script:NewAccountCalls[0].KeyLength | Should -Be '4096'
            }

            It 'preserves EC key lengths instead of falling back to RSA 2048' {
                $requests = @([pscustomobject]@{ CN = 'a.example.com'; EmailAddress = 'hostmaster@example.com'; KeyLength = 'ec-384' })

                Resolve-TestAcmeAccount -Requests $requests

                $script:NewAccountCalls[0].KeyLength | Should -Be 'ec-384'
            }

            It 'falls back to RSA 2048 for missing or invalid key lengths' {
                $requests = @(
                    [pscustomobject]@{ CN = 'a.example.com'; EmailAddress = 'a@example.com'; KeyLength = $null }
                    [pscustomobject]@{ CN = 'b.example.com'; EmailAddress = 'b@example.com'; KeyLength = 'not-a-key' }
                )

                Resolve-TestAcmeAccount -Requests $requests

                $script:NewAccountCalls.KeyLength | Should -Be @('2048', '2048')
            }

            It 'treats different key lengths for one contact as separate accounts' {
                $requests = @(
                    [pscustomobject]@{ CN = 'a.example.com'; EmailAddress = 'hostmaster@example.com'; KeyLength = '2048' }
                    [pscustomobject]@{ CN = 'b.example.com'; EmailAddress = 'hostmaster@example.com'; KeyLength = '4096' }
                )

                Resolve-TestAcmeAccount -Requests $requests

                Should -Invoke New-PAAccount -Times 2 -Exactly
                $script:NewAccountCalls.KeyLength | Should -Be @('2048', '4096')
            }

            It 'creates an account when listing existing accounts fails' {
                Mock Get-PAAccount { throw 'account refresh failed' }
                $requests = @([pscustomobject]@{ CN = 'a.example.com'; EmailAddress = 'hostmaster@example.com'; KeyLength = '2048' })

                { Resolve-TestAcmeAccount -Requests $requests } | Should -Not -Throw
                Should -Invoke New-PAAccount -Times 1 -Exactly
            }
        }

        Context 'exception detail logging' {
            It 'logs exception data entries when the Data dictionary is populated' {
                Mock Write-NSACMECertificateLog {}

                $exception = [System.Exception]::new('populated')
                $exception.Data.Add('StatusCode', 400)
                $exception.Data.Add('Detail', 'account not found')
                $errorRecord = [System.Management.Automation.ErrorRecord]::new($exception, 'TestId', 'InvalidOperation', $null)

                { Write-NSACMECertificateErrorDetail -ErrorRecord $errorRecord -Component 'Result' } | Should -Not -Throw
                Should -Invoke Write-NSACMECertificateLog -Times 1 -ParameterFilter {
                    $Message -eq 'Exception data.' -and $Data.Name -eq 'StatusCode' -and $Data.Value -eq 400
                }
                Should -Invoke Write-NSACMECertificateLog -Times 1 -ParameterFilter {
                    $Message -eq 'Exception data.' -and $Data.Name -eq 'Detail' -and $Data.Value -eq 'account not found'
                }
            }

            It 'walks a web exception inner chain without throwing' {
                Mock Write-NSACMECertificateLog {}

                $inner = [System.Net.WebException]::new('The remote server returned an error: (400) Bad Request.')
                $exception = [System.Exception]::new('Unable to validate JWS :: Account not found', $inner)
                $errorRecord = [System.Management.Automation.ErrorRecord]::new($exception, 'TestId', 'OperationStopped', $null)

                { Write-NSACMECertificateErrorDetail -ErrorRecord $errorRecord -Component 'Result' } | Should -Not -Throw
                Should -Invoke Write-NSACMECertificateLog -Times 0 -ParameterFilter {
                    $Message -eq 'Exception data unavailable.'
                }
            }

            It 'reports the exception shape instead of throwing when Data is null' {
                Mock Write-NSACMECertificateLog {}

                $exception = [NullDataTestException]::new('no data')
                $errorRecord = [System.Management.Automation.ErrorRecord]::new($exception, 'TestId', 'InvalidOperation', $null)

                { Write-NSACMECertificateErrorDetail -ErrorRecord $errorRecord -Component 'Result' } | Should -Not -Throw
                Should -Invoke Write-NSACMECertificateLog -Times 1 -ParameterFilter {
                    $Message -eq 'Exception data unavailable.' -and $Data.DataIsNull -eq $true -and $Data.KeysIsNull -eq $true
                }
            }

            It 'reports the exception shape instead of throwing when Data keys are null' {
                Mock Write-NSACMECertificateLog {}

                $exception = [NullKeysTestException]::new('unusable data')
                $errorRecord = [System.Management.Automation.ErrorRecord]::new($exception, 'TestId', 'InvalidOperation', $null)

                { Write-NSACMECertificateErrorDetail -ErrorRecord $errorRecord -Component 'Result' } | Should -Not -Throw
                Should -Invoke Write-NSACMECertificateLog -Times 1 -ParameterFilter {
                    $Message -eq 'Exception data unavailable.' -and $Data.DataIsNull -eq $false -and $Data.KeysIsNull -eq $true
                }
            }
        }

        Context 'HTTP-01 challenge binding cleanup' {
            It 'does nothing when there are no challenge bindings to clean up' {
                Mock Invoke-NSDeleteLBVServerResponderPolicyBinding {}
                Mock Invoke-NSDeleteResponderPolicy {}
                Mock Invoke-NSDeleteResponderAction {}
                Mock Write-NSACMECertificateLog {}

                $settings = [pscustomobject]@{ LbName = 'lb_letsencrypt_cert' }

                # $ChallengeBindings is $null when Publish-NSACMECertificateHttpChallenge published
                # no new challenges, e.g. because the ACME authorization was already valid.
                { Remove-NSACMECertificateHttpChallengeBinding -Session ([pscustomobject]@{}) -ChallengeBindings $null -Settings $settings } | Should -Not -Throw

                Should -Invoke Invoke-NSDeleteLBVServerResponderPolicyBinding -Times 0
                Should -Invoke Invoke-NSDeleteResponderPolicy -Times 0
                Should -Invoke Invoke-NSDeleteResponderAction -Times 0
                Should -Invoke Write-NSACMECertificateLog -Times 0 -ParameterFilter { $Level -eq 'Warning' }
            }

            It 'removes bindings, policies, and actions for each published challenge' {
                $script:UnboundPolicies = @()
                $script:RemovedPolicies = @()
                $script:RemovedActions = @()
                Mock Invoke-NSDeleteLBVServerResponderPolicyBinding { $script:UnboundPolicies += $Policyname }
                Mock Invoke-NSDeleteResponderPolicy { $script:RemovedPolicies += $Name }
                Mock Invoke-NSDeleteResponderAction { $script:RemovedActions += $Name }
                Mock Write-NSACMECertificateLog {}

                $settings = [pscustomobject]@{ LbName = 'lb_letsencrypt_cert' }
                $bindings = @(
                    [pscustomobject]@{ PolicyName = 'rsp_le_101'; ActionName = 'rsa_le_101'; Priority = 101 }
                )

                Remove-NSACMECertificateHttpChallengeBinding -Session ([pscustomobject]@{}) -ChallengeBindings $bindings -Settings $settings

                $script:UnboundPolicies | Should -Be @('rsp_le_101')
                $script:RemovedPolicies | Should -Be @('rsp_le_101')
                $script:RemovedActions | Should -Be @('rsa_le_101')
            }
        }
    }
}
