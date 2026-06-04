# Wildcard Certificates

Use DNS-01 validation for wildcard certificates. HTTP-01 cannot validate wildcard names.

## With A Posh-ACME DNS Plugin

Use this workflow when your DNS provider has a Posh-ACME plugin.

```powershell
$dnsToken = ConvertTo-SecureString 'replace-with-api-token' -AsPlainText -Force

$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'example.com'
    SAN                  = @(
        '*.example.com'
        '*.test.example.com'
    )
    ValidationMethod     = 'dns'
    DNSWaitTime          = 120
    CertKeyNameToUpdate  = 'wildcard_example_com'
    CertDir              = 'C:\Certificates\Example'
    EmailAddress         = 'hostmaster@example.com'
}

#You can optionally add a DNS provider to achieve full automation only if PoSH-ACME supports you DNS provider. If you omit these parameters a manual step is needed
$requestParams.DNSPlugin = 'ExampleDnsPlugin'
$requestParams.DNSParams = @{ ExampleDnsToken = $dnsToken }

Request-NSACMECertificate @requestParams

```

## Manual DNS-01

Use this workflow when TXT records must be created manually. The command displays the `_acme-challenge` record names and values, then waits for you to publish them before continuing.

```powershell
$requestParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    SkipCertificateCheck = $true
    CN                   = 'example.com'
    SAN                  = '*.example.com'
    ValidationMethod     = 'dns'
    DNSWaitTime          = 120
    CertKeyNameToUpdate  = 'wildcard_example_com'
    CertDir              = 'C:\Certificates\Example'
    EmailAddress         = 'hostmaster@example.com'
}

Request-NSACMECertificate @requestParams
```

Manual DNS-01 is useful when the DNS provider has no usable API or when a one-time certificate request is acceptable.
Remove old `_acme-challenge` TXT values before adding the new values. After adding the new values, wait until public DNS resolvers return them before continuing the prompt. The default DNS propagation wait is 120 seconds and can be changed with `DNSWaitTime`.
