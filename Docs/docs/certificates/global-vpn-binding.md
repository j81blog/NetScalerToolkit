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

## Updating a certkey that is already bound

NetScaler refuses to update a certkey in place while it is bound to the VPN global configuration. This is separate from `-UpdateGlobalVPNCertBinding`, which changes which certkey is bound after a new certificate is deployed. The problem here is renewing a certificate into a certkey name that is bound right now.

NITRO reports this as error 1541 and lists every possible cause rather than the actual one, so NetScalerToolkit looks the reference up and names it:

```text
A certkey bound to VPN global cannot be updated in place. Add -UnbindGlobalVPNCertOnUpdate
to unbind it for the update and bind it back afterwards, or point -CertKeyNameToUpdate at a
new name and add -UpdateGlobalVPNCertBinding to move the binding to the new certkey.
```

`-UnbindGlobalVPNCertOnUpdate` takes the first of those two routes: the binding is removed for the duration of the certkey update and restored immediately afterwards.

```powershell
$requestParams = @{
    ManagementURL               = 'https://ns-01.domain.local'
    Credential                  = $credential
    CN                          = 'vpn.example.com'
    ValidationMethod            = 'http'
    CsVipName                   = 'cs_vpn_http'
    CertKeyNameToUpdate         = 'vpn.example.com'
    UnbindGlobalVPNCertOnUpdate = $true
    CertDir                     = 'C:\Certificates\Example'
    EmailAddress                = 'hostmaster@example.com'
}

Request-NSACMECertificate @requestParams
```

The switch is deliberately opt-in. Unbinding the VPN global certificate, however briefly, touches live configuration, so without it the run fails and names the fix rather than doing it unasked.

The second route avoids unbinding altogether: point `-CertKeyNameToUpdate` at a new certkey name so the certificate is added rather than updated, and use `-UpdateGlobalVPNCertBinding` to move the binding onto it.

## Rollback

Record the existing Global VPN certificate binding when you need a rollback point:

```powershell
Invoke-NSGetVPNGlobalSSLCertKeyBinding -Session $session
```

Keep the previous certkey available until the replacement is verified.
