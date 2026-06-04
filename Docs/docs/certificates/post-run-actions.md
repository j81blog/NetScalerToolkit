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
