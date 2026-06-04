# Local IIS Binding

Use `UpdateIIS` when the issued certificate should also be imported into the local Windows certificate store and bound to an IIS site.

```powershell
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'portal.example.com'
    ValidationMethod     = 'http'
    CsVipName            = 'cs_portal_http'
    CertKeyNameToUpdate  = 'portal.example.com'
    CertDir              = 'C:\Certificates\Example'
    EmailAddress         = 'hostmaster@example.com'
    UpdateIIS            = $true
    IISSiteToUpdate      = 'Default Web Site'
}

Request-NSACMECertificate @requestParams
```

This scenario is **supported but not live-tested**.
