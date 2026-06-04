# Global VPN Binding

Use this workflow when the certificate being issued or renewed must become the active Global VPN certificate.

`-UpdateGlobalVPNCertBinding` replaces the Global VPN SSL certkey binding after the new certificate is deployed.

```powershell
$requestParams = @{
    ManagementURL                   = 'https://ns-01.domain.local'
    Credential                      = $credential
    CN                              = 'vpn.example.com'
    ValidationMethod                = 'http'
    CsVipName                       = 'cs_vpn_http'
    CertKeyNameToUpdate             = 'vpn.example.com'
    UpdateGlobalVPNCertBinding      = $true
    GlobalVPNCertBindingIncludeCA   = $true
    GlobalVPNCertBindingCrlCheck    = 'Optional'
    CertDir                         = 'C:\Certificates\Example'
    EmailAddress                    = 'hostmaster@example.com'
}

Request-NSACMECertificate @requestParams
```

## Behavior

- Removes the old leaf binding when it is currently bound.
- Adds the new leaf certkey binding.
- Optionally adds the first chain certkey as a CA binding.
- Leaves the binding unchanged when the old certkey was not globally bound.

## Rollback

Record the existing Global VPN certificate binding when you need a rollback point:

```powershell
Invoke-NSGetVPNGlobalSSLCertKeyBinding -Session $session
```

Keep the previous certkey available until the replacement is verified.
