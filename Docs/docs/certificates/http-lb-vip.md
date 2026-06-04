# HTTP-01 With LB VIP

Use this workflow when HTTP-01 validation should bind the responder policy directly to an existing HTTP LB vServer instead of using a content switching vServer.

```powershell
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'portal.example.com'
    ValidationMethod     = 'http'
    UseLbVip             = $true
    LbName               = 'lb_example_http'
    CertKeyNameToUpdate  = 'portal.example.com'
    CertDir              = 'C:\Certificates\Example'
    EmailAddress         = 'hostmaster@example.com'
}

Request-NSACMECertificate @requestParams
```

`UseLbVip` is useful for smaller deployments where traffic reaches a load balancing vServer directly and no content switching layer exists.

## Related Permission Bootstrap

When creating a restricted API user for this workflow, use the same `UseLbVip` and `LbName` values:

```powershell
$userParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $adminCredential
    SkipCertificateCheck = $true
    CreateUserPermissions = $true
    CreateApiUser        = $true
    ApiUsername          = 'leuser'
    ApiPassword          = $apiPassword
    UseLbVip             = $true
    LbName               = 'lb_example_http'
}

New-NSACMECertificateUser @userParams
```
