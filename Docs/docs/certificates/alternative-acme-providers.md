# Alternative ACME Providers

Use this scenario when you want the same NetScaler certificate deployment workflow with an ACME CA other than Let's Encrypt.

NetScalerToolkit uses Posh-ACME for the ACME account, order, challenge, and certificate download steps. The provider selection changes the ACME directory and, when required by the CA, the external account binding values used while creating the ACME account.

## Provider Selection

Use `CertificateProvider` for known providers:

| Provider | Production server | Staging server |
| --- | --- | --- |
| `LetsEncrypt` | `LE_PROD` | `LE_STAGE` |
| `ZeroSSL` | `ZEROSSL_PROD` | none configured |
| `Google` | `GOOGLE_PROD` | `GOOGLE_STAGE` |
| `SSLCom` | `SSLCOM_RSA` | none configured |
| `Actalis` | `ACTALIS_PROD` | none configured |

ZeroSSL production with external account binding has been live-tested with HTTP-01 and DNS-01 validation and NetScaler certificate deployment. Google, SSL.com, Actalis, and custom ACME directory URLs are supported but not live-tested.

Providers without a configured staging directory require `-Production` unless `-AcmeDirectoryUrl` points to a custom test directory. NetScalerToolkit stops early for those providers when neither value is supplied.

Use `AcmeDirectoryUrl` when you need a CA endpoint that is not in the provider list:

```powershell
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'portal.example.com'
    ValidationMethod     = 'http'
    CsVipName            = 'cs_portal_http'
    CertKeyNameToUpdate  = 'portal.example.com'
    CertDir              = 'C:\Certificates\Portal'
    EmailAddress         = 'hostmaster@example.com'
    Production           = $true
    AcmeDirectoryUrl     = 'https://acme.example.com/directory'
}

Request-NSACMECertificate @requestParams
```

## External Account Binding

Some ACME providers require external account binding when the ACME account is created. The provider gives you a key ID and HMAC key. Pass them with the request:

```powershell
$eabHmacKey = ConvertTo-SecureString 'replace-with-eab-hmac-key' -AsPlainText -Force

$requestParams = @{
    ManagementURL                   = 'https://ns-01.domain.local'
    Credential                      = $credential
    SkipCertificateCheck            = $true
    CN                              = 'portal.example.com'
    ValidationMethod                = 'http'
    CsVipName                       = 'cs_portal_http'
    CertKeyNameToUpdate             = 'portal.example.com'
    CertDir                         = 'C:\Certificates\Portal'
    EmailAddress                    = 'hostmaster@example.com'
    Production                      = $true
    CertificateProvider             = 'Google'
    ExternalAccountBindingKeyId     = 'replace-with-eab-key-id'
    ExternalAccountBindingHmacKey   = $eabHmacKey
    ExternalAccountBindingAlgorithm = 'HS256'
}

Request-NSACMECertificate @requestParams
```

`ExternalAccountBindingAlgorithm` defaults to `HS256`. Use another value only when the CA explicitly provides it.

## ZeroSSL HTTP-01 Example

Use HTTP-01 when the public DNS name already resolves to a NetScaler HTTP content switching VIP that can serve `/.well-known/acme-challenge/` responses.

```powershell
$zeroSslEabHmacKey = ConvertTo-SecureString 'replace-with-zerossl-eab-hmac-key' -AsPlainText -Force

$zeroSslHttpParams = @{
    ManagementURL                 = 'https://ns-01.domain.local'
    Credential                    = $credential
    SkipCertificateCheck          = $true
    CN                            = 'portal.example.com'
    ValidationMethod              = 'http'
    CsVipName                     = 'cs_portal_http'
    EnableVipBefore               = $true
    DisableVipAfter               = $true
    CertKeyNameToUpdate           = 'portal.example.com'
    CertDir                       = 'C:\Certificates\Portal'
    EmailAddress                  = 'hostmaster@example.com'
    Production                    = $true
    CertificateProvider           = 'ZeroSSL'
    ExternalAccountBindingKeyId   = 'replace-with-zerossl-eab-key-id'
    ExternalAccountBindingHmacKey = $zeroSslEabHmacKey
}

Request-NSACMECertificate @zeroSslHttpParams
```

## ZeroSSL DNS-01 Example

ZeroSSL uses its own ACME account binding credentials. Use DNS-01 the same way as a Let's Encrypt request; only the provider and EAB values change.

```powershell
$dnsToken = ConvertTo-SecureString 'replace-with-dns-token' -AsPlainText -Force
$zeroSslEabHmacKey = ConvertTo-SecureString 'replace-with-zerossl-eab-hmac-key' -AsPlainText -Force

$zeroSslParams = @{
    ManagementURL                 = 'https://ns-01.domain.local'
    Credential                    = $credential
    SkipCertificateCheck          = $true
    CN                            = 'portal.example.com'
    ValidationMethod              = 'dns'
    DNSPlugin                     = 'ExampleDnsPlugin'
    DNSParams                     = @{
        ExampleDnsToken = $dnsToken
    }
    DNSWaitTime                   = 120
    CertKeyNameToUpdate           = 'portal.example.com'
    CertDir                       = 'C:\Certificates\Portal'
    EmailAddress                  = 'hostmaster@example.com'
    Production                    = $true
    CertificateProvider           = 'ZeroSSL'
    ExternalAccountBindingKeyId   = 'replace-with-zerossl-eab-key-id'
    ExternalAccountBindingHmacKey = $zeroSslEabHmacKey
}

Request-NSACMECertificate @zeroSslParams
```

## Google Public CA Example

Google Public CA requires a Google Cloud project and an EAB key ID/HMAC pair. Use `GOOGLE_STAGE` by omitting `Production`, or use `GOOGLE_PROD` by setting `Production`.

```powershell
$googleEabHmacKey = ConvertTo-SecureString 'replace-with-google-eab-hmac-key' -AsPlainText -Force

$googleParams = @{
    ManagementURL                 = 'https://ns-01.domain.local'
    Credential                    = $credential
    SkipCertificateCheck          = $true
    CN                            = 'portal.example.com'
    ValidationMethod              = 'http'
    CsVipName                     = 'cs_portal_http'
    CertKeyNameToUpdate           = 'portal.example.com'
    CertDir                       = 'C:\Certificates\Portal'
    EmailAddress                  = 'hostmaster@example.com'
    CertificateProvider           = 'Google'
    ExternalAccountBindingKeyId   = 'replace-with-google-eab-key-id'
    ExternalAccountBindingHmacKey = $googleEabHmacKey
}

Request-NSACMECertificate @googleParams
```

## JSON Config

External account binding can be captured in the generated JSON config. The HMAC key is written as a secret value.

```powershell
$requestParams = @{
    ManagementURL                 = 'https://ns-01.domain.local'
    Credential                    = $credential
    SkipCertificateCheck          = $true
    CN                            = 'portal.example.com'
    ValidationMethod              = 'http'
    CsVipName                     = 'cs_portal_http'
    CertKeyNameToUpdate           = 'portal.example.com'
    CertDir                       = 'C:\Certificates\Portal'
    EmailAddress                  = 'hostmaster@example.com'
    Production                    = $true
    CertificateProvider           = 'ZeroSSL'
    ExternalAccountBindingKeyId   = 'replace-with-eab-key-id'
    ExternalAccountBindingHmacKey = $zeroSslEabHmacKey
    ConfigFile                    = '.\GenLe-Config.json'
}

Request-NSACMECertificate @requestParams
```

After the config exists, scheduled renewals can use the same `AutoRun` pattern:

```powershell
Request-NSACMECertificate -ConfigFile '.\GenLe-Config.json' -AutoRun
```

## Compatibility Notes

- HTTP-01 is preferred when the public challenge path reaches NetScaler; DNS-01 remains available for wildcard certificates and DNS-based workflows.
- DNS validation still uses a Posh-ACME DNS plugin. The DNS plugin is independent from the ACME certificate provider.
- Existing ACME accounts are reused when the contact address matches. EAB values are needed when creating a new ACME account with a CA that requires EAB.
- `ExtAcctKID`, `ExtAcctHMACKey`, and `ExtAcctAlgorithm` are accepted as aliases for the EAB parameters.
- Alternative provider scenarios are supported but not live-tested unless specifically noted in the scenario matrix.
