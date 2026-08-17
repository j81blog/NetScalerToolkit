# HTTP-01 Through NetScaler

Use this workflow when the public HTTP path for `/.well-known/acme-challenge/` reaches a NetScaler VIP and you want NetScalerToolkit to publish the ACME challenge response through temporary NetScaler objects.

The command can create or update the validation service, LB vServer, content switching policy/action, responder policy/action, and required bindings.

## Example

```powershell
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'portal.example.com'
    ValidationMethod     = 'http'
    CsVipName            = 'cs_example_http'
    CertKeyNameToUpdate  = 'portal.example.com'
    CertDir              = 'C:\Certificates\Example'
    EmailAddress         = 'hostmaster@example.com'
}

Request-NSACMECertificate @requestParams
```

## What The Workflow Does

1. Connects to NetScaler and selects the HA primary when `-HA` behavior is available through `Connect-NSNode`.
2. Creates or updates ACME HTTP validation objects.
3. Starts an ACME order and publishes the HTTP-01 challenge body.
4. Waits for authorization.
5. Downloads certificate artifacts.
6. Uploads the PFX to `/nsconfig/ssl/`.
7. Creates or updates the SSL certkey.
8. Uploads/reuses chain certkeys and links the chain.
9. Cleans temporary validation bindings and objects.

Repeated runs skip the request while the existing certificate is still valid and outside its renewal window. Add `ForceCertRenew = $true` only when an immediate replacement is intentional. In a JSON config the flag is one shot and resets itself once the certificate deploys.

## Requirements

- The public HTTP path for `/.well-known/acme-challenge/` reaches the NetScaler VIP.
- Validation object names are unique per automation pattern unless shared objects are intentional.
