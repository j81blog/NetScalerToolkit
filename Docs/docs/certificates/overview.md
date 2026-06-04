# Certificate Automation Overview

Use NetScalerToolkit certificate automation when you want a repeatable PowerShell workflow that requests or imports a certificate, uploads it to NetScaler, creates or updates the SSL certkey, links the chain, and optionally updates a Global VPN binding.

`Request-NSACMECertificate` automates ACME certificate issuance and deployment to NetScaler. It uses Posh-ACME for ACME account, order, authorization, and certificate artifact handling, then uses NetScalerToolkit functions to upload and bind the certificate.

For a protocol-level overview with diagrams, see [ACME How It Works](acme-how-it-works.md).

For non-ACME certificates, use the generated SSL configuration commands directly. The certificate deployment pages still apply conceptually: upload the certificate material, create or update the SSL certkey, link the chain, and update the relevant service or Global VPN binding.

The workflow can:

- request Let's Encrypt staging or production certificates
- request certificates from other ACME providers supported by Posh-ACME
- request SAN and wildcard certificates
- validate HTTP-01 through NetScaler responder objects
- validate DNS-01 through a Posh-ACME DNS plugin when HTTP-01 is not suitable
- validate DNS-01 by publishing TXT records on NetScaler DNS
- upload the resulting PFX to `/nsconfig/ssl/`
- create or update SSL certkeys
- upload and link CA chain certkeys
- optionally replace a Global VPN certificate binding
- optionally create a restricted API user for certificate automation
- run from a JSON config file for scheduled renewal
- run through the `GenLeCertForNS.ps1` compatibility wrapper

## Core Commands

- `Request-NSACMECertificate`
- `New-NSACMECertificateUser`
- `Connect-NSNode`
- `Invoke-NSGetSSLCertKey`
- `Invoke-NSAddSSLCertKey`
- `Invoke-NSUpdateSSLCertKey`
- `Invoke-NSDeleteSSLCertKey`
- `Invoke-NSCleanCertKeyFiles`

## Validation Method Preference

HTTP-01 is the preferred validation method in most examples because it keeps the certificate flow on NetScaler and avoids DNS provider-specific plugin configuration. Use DNS-01 when HTTP validation cannot reach the NetScaler VIP, when issuing wildcard certificates, or when the DNS ownership model requires it.

## Renewal Decisions

Scheduled and repeated requests do not rely only on a static `RenewAfter` value. NetScalerToolkit prefers ACME order renewal metadata from Posh-ACME, uses certificate validity as a dynamic fallback, and skips valid certificates that are outside their renewal window. See [Renewal Behavior](renewal-behavior.md).

## Legacy Script Compatibility

The repository includes a `GenLeCertForNS.ps1` wrapper script. Existing scheduled tasks, batch files, and command lines that call the old script name can continue to call that wrapper while the implementation runs through `Request-NSACMECertificate`.

You can download a copy of the wrapper script here: [GenLeCertForNS.ps1](https://raw.githubusercontent.com/j81blog/NetScalerToolkit/refs/heads/master/GenLeCertForNS.ps1)
