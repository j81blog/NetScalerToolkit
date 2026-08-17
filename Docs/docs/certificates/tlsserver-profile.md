# tlsserver Profile

Let's Encrypt supports ACME profiles. The `tlsserver` profile is intended for TLS server certificates and can have different lifetime behavior from the default profile.

Use `-Profile tlsserver` to request it:

```powershell
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    SkipCertificateCheck = $true
    Profile              = 'tlsserver'
    Credential           = $credential
    CN                   = 'portal.example.com'
    CsVipName            = "cs_example.com_http"
    ValidationMethod     = 'http'
    CertKeyNameToUpdate  = 'portal.example.com'
    CertDir              = 'C:\Certificates'
    EmailAddress         = 'hostmaster@example.com'
    LogFile              = "C:\Certificates\portal_example_com_certgen.txt"
}

Request-NSACMECertificate @requestParams
```

## Renewal Behavior

NetScalerToolkit stores provider and renewal metadata when available. It calculates the renewal window from the actual lifetime of the certificate installed on the NetScaler, and uses refreshed Posh-ACME order metadata, including provider renewal windows such as ARI, to move renewal earlier when that order describes the installed certificate.

This avoids assuming a fixed certificate lifetime. See [Renewal Behavior](renewal-behavior.md).

## Notes

- Shorter lifetimes increase the importance of reliable scheduled automation.
- Do not use `tlsclient` for ordinary NetScaler TLS server certificates.
