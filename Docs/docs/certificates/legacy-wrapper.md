# Legacy Wrapper

The repository includes `GenLeCertForNS.ps1` as a compatibility wrapper for existing scheduled tasks and batch files.

The wrapper imports NetScalerToolkit and forwards all arguments to `Request-NSACMECertificate`. This means legacy command lines can keep using the old script name while new automation can call the module command directly.

## Existing Command Line

```powershell
.\GenLeCertForNS.ps1 `
    -CN 'portal.example.com' `
    -EmailAddress 'hostmaster@example.com' `
    -CertDir 'C:\Certificates\Example' `
    -ManagementURL 'https://ns-01.domain.local' `
    -Username 'leuser' `
    -Password 'L34s3r!' `
    -ValidationMethod http `
    -CsVipName 'cs_portal_http' `
    -CertKeyNameToUpdate 'portal.example.com'
```

## Equivalent Module Command

```powershell
$requestParams = @{
    CN                  = 'portal.example.com'
    EmailAddress        = 'hostmaster@example.com'
    CertDir             = 'C:\Certificates\Example'
    ManagementURL       = 'https://ns-01.domain.local'
    Username            = 'leuser'
    Password            = 'L34s3r!'
    ValidationMethod    = 'http'
    CsVipName           = 'cs_portal_http'
    CertKeyNameToUpdate = 'portal.example.com'
}

Request-NSACMECertificate @requestParams
```

## Scheduled Task Compatibility

Scheduled tasks can continue to call:

```powershell
.\GenLeCertForNS.ps1 -ConfigFile '.\GenLe-Config.json' -AutoRun
```

For new scheduled tasks, prefer:

```powershell
Request-NSACMECertificate -ConfigFile '.\GenLe-Config.json' -AutoRun
```

## Batch File Compatibility

Batch files that previously executed `GenLeCertForNS.ps1` can keep doing so. For new automation, use PowerShell directly and splat parameters into `Request-NSACMECertificate`.
