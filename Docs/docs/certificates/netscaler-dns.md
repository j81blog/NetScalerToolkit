# DNS-01 Hosted On NetScaler

Use this workflow when NetScaler is authoritative, delegated, or otherwise able to publish publicly resolvable DNS-01 TXT records for the validation name.

`-UseNetScalerDNS` publishes ACME DNS-01 TXT records directly on NetScaler DNS instead of using a Posh-ACME provider plugin.

## Example

```powershell
$requestParams = @{
    ManagementURL                         = 'https://ns-01.domain.local'
    Credential                            = $credential
    SkipCertificateCheck                  = $true
    CN                                    = 'example.com'
    SAN                                   = 'portal.example.com'
    ValidationMethod                      = 'dns'
    UseNetScalerDNS                       = $true
    AlternateDNSValidationDomain          = 'acme-dns.example.com'
    AlternateDNSValidationDomainSkipCheck = $true
    CertKeyNameToUpdate                   = 'example.com'
    CertDir                               = 'C:\Certificates\Example'
    EmailAddress                          = 'hostmaster@example.com'
}

Request-NSACMECertificate @requestParams
```

## Requirements

- NetScaler must be authoritative, delegated, or otherwise publicly resolvable for the DNS-01 TXT name.
- The automation user needs DNS TXT record permissions.
- DNS propagation must complete before the ACME server validates the challenge.

## NetScaler ADNS Setup

When NetScaler is used as authoritative DNS for a validation subdomain, delegate that subdomain from the parent DNS zone to the NetScaler ADNS service. For a step-by-step NetScaler ADNS setup example, see [Configure NetScaler ADNS as authoritative DNS for a subdomain](https://blog.j81.nl/howto-configure-netscaler-adns-as-an-authoritative-dns-server-for-a-subdomain/).

## Cleanup

The workflow removes the TXT records it published after validation. If a run is interrupted, inspect and remove stale `_acme-challenge` TXT records before retrying.
