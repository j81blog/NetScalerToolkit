# Troubleshooting

## Posh-ACME Plugin Not Found

Confirm the plugin is installed in the PowerShell edition you are using:

```powershell
Import-Module Posh-ACME -MinimumVersion 4.31.0 -Force
Get-PAPlugin | Where-Object Name -eq 'ExampleDnsPlugin'
```

Windows PowerShell and PowerShell 7 use different module paths.

## Incorrect TXT Record

An ACME error about an incorrect TXT record usually means public resolvers still see an older DNS-01 value.

Actions:

- wait for DNS caches to clear
- increase `-DNSWaitTime`
- remove stale `_acme-challenge` TXT records
- for manual DNS-01, confirm public resolvers return the new TXT values before continuing the prompt
- test with a fresh hostname

## NetScaler Domain Check Error

When updating an existing SSL certkey, NetScaler may reject a certificate if the domain does not match the existing certkey expectations.

Actions:

- confirm `-CN` and `-SAN` are correct
- use a new certkey for testing
- avoid reusing a certkey name across unrelated domains

## Certificate Skipped During Renewal

If a request is skipped because the certificate is still valid, the module found a renewal window from ACME order metadata or from the current certificate lifetime.

Actions:

- rerun with `-LogLevel Debug` to see the renewal decision source, renewal date, expiry date, and strategy
- review `RenewalSource` and `RenewalStrategy` in the generated JSON config when a config file is used
- confirm `CertKeyNameToUpdate` points to the certkey that should be replaced
- use `-ForceCertRenew` or `-Force` only when an immediate replacement is intentional

## TLS Trust Failure

If NetScaler management TLS validation fails:

```powershell
Connect-NSNode ... -SkipCertificateCheck
```

Use this for lab appliances or private management certificates. For production automation, prefer a trusted management certificate.

## Generated Command Not Found

Check the module area:

- Common: hand-written session, transport, and workflow commands
- Configuration: generated config resource commands
- Statistics: generated stat resource commands

Then search by NetScaler resource name in the [module reference](../module/reference/index.md).

## Legacy Script Call Still Uses Old Name

Use the [legacy wrapper](legacy-wrapper.md) when an existing scheduled task or batch file still calls `GenLeCertForNS.ps1`. The wrapper forwards the arguments to `Request-NSACMECertificate`.
