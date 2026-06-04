# Staging And Production

By default, certificate requests use Let's Encrypt staging (test). Production is enabled explicitly with `-Production`.

More information about Let's Encrypt staging can be found [here](https://letsencrypt.org/docs/staging-environment/)

Only providers with a configured staging directory can run without `-Production`. `LetsEncrypt` uses `LE_STAGE` by default and `Google` can use `GOOGLE_STAGE`. Providers such as ZeroSSL, SSL.com, and Actalis do not have a mapped staging environment in NetScalerToolkit; use `-Production` for those providers or specify a custom ACME directory with `-AcmeDirectoryUrl`.

## Staging

Use the default behavior for a staging certificate:

```powershell
$credential = Get-Credential
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    SkipCertificateCheck = $true
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

Staging certificates are not publicly trusted. They let you verify ACME account setup, challenge publication, NetScaler upload behavior, and certificate binding behavior without consuming production issuance limits.

Windows/.NET chain validation can report `UntrustedRoot` for staging certificates. NetScalerToolkit still reports the chain status and adds context that this is expected for staging/test ACME certificates.

## Production

Add `Production` to the same parameter set to request a publicly trusted Let's Encrypt certificate:

```powershell
Request-NSACMECertificate @requestParams -Production
```

You can also add the production parameter to the created object earlier, this will have the same result.

```powershell
$requestParams.Production = $true
Request-NSACMECertificate @requestParams
```


## Test Certificate Naming

Non-production deployments are prefixed with `TST-` for NetScaler certkeys and uploaded PFX files when needed.
