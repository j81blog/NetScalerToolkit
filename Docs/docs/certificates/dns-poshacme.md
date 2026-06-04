# DNS-01 With Posh-ACME

Use this workflow when your DNS zone is managed by a provider that has a Posh-ACME DNS plugin. NetScalerToolkit passes plugin arguments through to Posh-ACME and then deploys the issued certificate to NetScaler.

## Example

```powershell
$dnsToken = ConvertTo-SecureString 'replace-with-api-token' -AsPlainText -Force

$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'portal.example.com'
    ValidationMethod     = 'dns'
    DNSPlugin            = 'ExampleDnsPlugin'
    DNSParams            = @{ ExampleDnsToken = $dnsToken }
    DNSWaitTime          = 120
    CertKeyNameToUpdate  = 'portal.example.com'
    CertDir              = 'C:\Certificates\Example'
    EmailAddress         = 'hostmaster@example.com'
}

Request-NSACMECertificate @requestParams
```

## Profile Example

Use the Let's Encrypt `tlsserver` profile when you want that profile's shorter certificate behavior:

```powershell
$requestParams.Profile = 'tlsserver'
Request-NSACMECertificate @requestParams
```

## Operational Notes

- Run this from the PowerShell edition where the DNS plugin is installed.
- Use a long enough `-DNSWaitTime` for the provider and public resolvers. The default is 120 seconds.
- If repeated DNS-01 attempts fail with an incorrect TXT value, wait for old challenge records and resolver caches to clear or use a fresh test hostname.
