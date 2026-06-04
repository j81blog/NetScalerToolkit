# Documentation Info

The examples use placeholder data that can be copied and adjusted for a lab or production environment.

## Example Names

| Item | Example value |
| --- | --- |
| Primary NetScaler node | `ns-01.domain.local` |
| Secondary NetScaler node | `ns-02.domain.local` |
| Public application FQDN | `portal.example.com` |
| VPN FQDN | `vpn.example.com` |
| Example domain | `example.com` |
| API automation user | `leuser` |
| Administrative user | `nsroot` |

## Example Passwords

The documentation uses fixed example passwords so snippets are easy to read:

- `nsroot` / `Sup3rS3cretP@ssw0rd`
- `leuser` / `L34s3r!`

Replace these values before using the examples in an environment.

## Validation Examples

HTTP-01 is the preferred validation style for general certificate examples. DNS-01 examples are still included for wildcard certificates, NetScaler-hosted DNS validation, and Posh-ACME DNS plugin workflows.

## ACME Providers

DNS-01 examples use the generic Posh-ACME plugin pattern. Replace `ExampleDnsPlugin` and `ExampleDnsToken` with the DNS plugin and parameter names required by your DNS provider.

## PowerShell Style

Long command examples use splatting. This keeps the required values visible and makes it easier to reuse a common connection parameter set across examples.

## Legacy Compatibility

The `GenLeCertForNS.ps1` wrapper is documented for users who already have scheduled tasks or batch files that call the old script name. New examples use `Request-NSACMECertificate` directly.
