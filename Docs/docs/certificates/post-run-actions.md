# Post-Run Actions

Use post-run actions when another system must be updated after a certificate request succeeds.

## PowerShell Post Script

`PostPoSHScriptFilename` runs a PowerShell script after a successful request. The script receives certificate details from NetScalerToolkit and can also receive custom values through `PostPoSHScriptExtraParameters`.

```powershell
$requestParams = @{
    ManagementURL                  = 'https://ns-01.domain.local'
    Credential                     = $credential
    SkipCertificateCheck            = $true
    CN                             = 'portal.example.com'
    ValidationMethod               = 'http'
    CsVipName                      = 'cs_portal_http'
    CertDir                        = 'C:\Certificates\Example'
    EmailAddress                   = 'hostmaster@example.com'
    PostPoSHScriptFilename         = 'C:\Scripts\Publish-Certificate.ps1'
    PostPoSHScriptExtraParameters  = @{
        TargetApplication = 'ExamplePortal'
    }
}

Request-NSACMECertificate @requestParams
```

`PostPoSHScriptFilename` can also be a file name or a relative path. It is then resolved against `PostPoSHScriptDir`, which must be a full path. Without `PostPoSHScriptDir` the script path must be a full path. In an AutoRun config, set `PostPoSHScriptDir` once under `settings`. `-PostPoSHScriptDir` on the command line overrides it.

```json
{
    "settings": {
        "PostPoSHScriptDir": "C:\\Scripts"
    },
    "certrequests": [
        {
            "CN": "portal.example.com",
            "PostPoSHScriptFilename": "Publish-Certificate.ps1"
        }
    ]
}
```

The script path is checked before the certificate is ordered, so a wrong path fails the request without spending an ACME order.

## Email Notification

Use the SMTP parameters to send a result email.

```powershell
$requestParams.SendMail      = $true
$requestParams.SMTPTo        = 'admin@example.com'
$requestParams.SMTPFrom      = 'netscaler@example.com'
$requestParams.SMTPServer    = 'smtp.example.com'
$requestParams.SMTPPort      = 587
$requestParams.SMTPUseSSL    = $true
$requestParams.LogAsAttachment = $true

Request-NSACMECertificate @requestParams
```

Mail notification is **supported but not live-tested**.
