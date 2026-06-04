# SAN Certificate

Use this workflow when one NetScaler SSL certkey should cover a primary name and one or more Subject Alternative Names.

```powershell
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'example.com'
    SAN                  = @(
        'portal.example.com'
        'www.example.com'
        'vpn.example.com'
    )
    ValidationMethod     = 'http'
    CsVipName            = 'cs_example_http'
    CertKeyNameToUpdate  = 'san_example_com'
    CertDir              = 'C:\Certificates\Example'
    EmailAddress         = 'hostmaster@example.com'
    LogLevel             = 'Info'
}

Request-NSACMECertificate @requestParams
```

Add `Production = $true` to the parameter hashtable when the same request should use Let's Encrypt production.

## Updating An Existing Certkey

Set `CertKeyNameToUpdate` to the existing NetScaler SSL certkey. When the certkey is bound to services or vServers, NetScaler keeps those bindings on the updated certkey.

## Creating A New Certkey

Omit `CertKeyNameToUpdate` when the certificate should be uploaded as a new certkey. Bind the new certkey to the target service, LB vServer, CS vServer, or VPN configuration after the request completes.
