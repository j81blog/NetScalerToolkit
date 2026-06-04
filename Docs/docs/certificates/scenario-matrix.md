# Scenario Matrix

| Scenario | Notes | Primary switches |
| --- | --- | --- |
| [HTTP-01 through NetScaler content switching and responder objects](http-01.md) |  | `-ValidationMethod http`, `-CsVipName` |
| [HTTP-01 with an existing LB VIP instead of a CS VIP](http-lb-vip.md) |  | `-ValidationMethod http`, `-UseLbVip`, `-LbName` |
| [DNS-01 with a Posh-ACME DNS plugin](dns-poshacme.md) |  | `-ValidationMethod dns`, `-DNSPlugin`, `-DNSParams` |
| [Manual DNS-01 challenge records](wildcard-certificates.md#manual-dns-01) |  | `-ValidationMethod dns` without `-DNSPlugin` or `-UseNetScalerDNS` |
| [DNS-01 hosted on NetScaler DNS](netscaler-dns.md) |  | `-ValidationMethod dns`, `-UseNetScalerDNS` |
| [Let's Encrypt staging](staging-production.md#staging) |  | default behavior |
| [Let's Encrypt production](staging-production.md#production) |  | `-Production` |
| [ZeroSSL production with HTTP-01 and external account binding](alternative-acme-providers.md#zerossl-http-01-example) |  | `-CertificateProvider ZeroSSL`, `-ValidationMethod http`, EAB parameters |
| [ZeroSSL production with DNS-01 and external account binding](alternative-acme-providers.md#zerossl-dns-01-example) |  | `-CertificateProvider ZeroSSL`, EAB parameters |
| [Other ACME providers](alternative-acme-providers.md) | supported but not live-tested | `-CertificateProvider`, `-AcmeDirectoryUrl`, EAB parameters |
| [SAN certificate](san-certificate.md) |  | `-CN`, `-SAN` |
| [Wildcard certificate with DNS-01](wildcard-certificates.md) |  | wildcard value in `-SAN`, DNS validation |
| [`tlsserver` ACME profile](tlsserver-profile.md) |  | `-Profile tlsserver` |
| [Renewal decision behavior](renewal-behavior.md) |  | `RenewAfter`, ARI/order metadata, dynamic lifetime fallback |
| [Upload PFX and update existing SSL certkey](deployment.md#update-an-existing-certkey) |  | `-CertKeyNameToUpdate` |
| [Create new SSL certkey](deployment.md#create-a-new-certkey) |  | omit `-CertKeyNameToUpdate` |
| [Upload and link intermediate/root chain certkeys](deployment.md#chain-handling) |  | automatic |
| [Replace Global VPN certificate binding](global-vpn-binding.md) |  | `-UpdateGlobalVPNCertBinding` |
| [Create restricted certificate automation API user](api-user-bootstrap.md) |  | `New-NSACMECertificateUser` |
| [Update local IIS binding](iis-binding.md) | supported but not live-tested | `-UpdateIIS` |
| [Create or update a JSON config file from a request](config-file-autorun.md#create-or-update-a-config-file) |  | `-ConfigFile` |
| [Run scheduled renewals from JSON config](config-file-autorun.md#scheduled-renewal) |  | `-ConfigFile`, `-AutoRun` |
| [Run multiple certificate requests from one config file](config-file-autorun.md#multiple-certificate-requests) |  | `-ConfigFile`, `-AutoRun` |
| [Run a post-renewal PowerShell script](post-run-actions.md#powershell-post-script) |  | `-PostPoSHScriptFilename`, `-PostPoSHScriptExtraParameters` |
| [Send renewal result email](post-run-actions.md#email-notification) | supported but not live-tested | `-SendMail`, SMTP parameters |
| [Clean unused NetScaler SSL certkey files](cleanup.md#clean-unused-netscaler-certkey-files) |  | `Invoke-NSCleanCertKeyFiles` |
| [Clean temporary HTTP validation objects](cleanup.md#clean-http-validation-objects) |  | `-CleanADC` |
| [Remove test certificates from NetScaler](cleanup.md#remove-test-certificates) |  | `-RemoveTestCertificates` |
| [Run through legacy wrapper script](legacy-wrapper.md) |  | `.\GenLeCertForNS.ps1` |
| [External CSR/key file workflow](overview.md) | planned | not available |

Use the most specific scenario page for the workflow you want to automate.
