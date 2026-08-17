---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate/request/
schema: 2.0.0
---

# Request-NSACMECertificate

## SYNOPSIS
Requests ACME certificates and deploys them to a NetScaler.

## SYNTAX

### LECertificatesHTTP (Default)
```
Request-NSACMECertificate [-CleanPoshACMEStorage] -ManagementURL <String> [-Username <String>]
 [-Password <Object>] [-Credential <PSCredential>] -CN <String> [-SAN <String[]>] [-FriendlyName <String>]
 [-ValidationMethod <String>] [-CertKeyNameToUpdate <String>] [-RemovePrevious] -CertDir <String>
 [-PfxPassword <Object>] [-EmailAddress <String>] [-KeyLength <Object>] [-Production] [-DisableLogging]
 [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig] [-SendMail] [-SMTPTo <String[]>]
 [-SMTPFrom <String>] [-SMTPCredential <PSCredential>] [-SMTPServer <String>] [-SMTPPort <Int32>] [-SMTPUseSSL]
 [-LogAsAttachment] [-DisableIPCheck] [-IPv6] [-UpdateIIS] [-UpdateGlobalVPNCertBinding]
 [-GlobalVPNCertBindingIncludeCA] [-GlobalVPNCertBindingCrlCheck <String>]
 [-GlobalVPNCertBindingOcspCheck <String>] [-IISSiteToUpdate <String>] [-PostPoSHScriptFilename <String>]
 [-PostPoSHScriptExtraParameters <Hashtable>] [-CsVipName <String[]>] [-UseLbVip] [-CspName <String>]
 [-CsaName <String>] [-CsVipBinding <String>] [-SvcName <String>] [-SvcDestination <String>] [-LbName <String>]
 [-TrafficDomain <Int32>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>] [-EnableVipBefore]
 [-DisableVipAfter] [-ConfigFile <String>] [-ForceCertRenew] [-StopOnError] [-CleanExpiredCertsOnDisk]
 [-CleanExpiredCertsOnDiskDays <Int16>] [-NoConsoleOutput] [-AutoUpdate] [-SkipCertificateCheck]
 [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>]
 [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>]
 [-UseModernPfxEncryption] [-CertificateChainValidation <String>] [-PreferredChain <String>]
 [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>]
 [-AlwaysNewKey] [-SkipPoshACMEInstall] [-RemoveUploadedPfx] [<CommonParameters>]
```

### Help
```
Request-NSACMECertificate [-Help] [-NoConsoleOutput] [-AutoUpdate] [<CommonParameters>]
```

### CleanADC
```
Request-NSACMECertificate [-CleanADC] -ManagementURL <String> [-Username <String>] [-Password <Object>]
 [-Credential <PSCredential>] [-DisableLogging] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>]
 [-SaveADCConfig] [-CsVipName <String[]>] [-CspName <String>] [-CsaName <String>] [-CsVipBinding <String>]
 [-SvcName <String>] [-SvcDestination <String>] [-LbName <String>] [-TrafficDomain <Int32>] [-RspName <String>]
 [-RsaName <String>] [-Partitions <String[]>] [-NoConsoleOutput] [-AutoUpdate] [-SkipCertificateCheck]
 [<CommonParameters>]
```

### CleanTestCertificate
```
Request-NSACMECertificate [-RemoveTestCertificates] [-CleanPoshACMEStorage] -ManagementURL <String>
 [-Username <String>] [-Password <Object>] [-Credential <PSCredential>] [-DisableLogging] [-LogFile <String>]
 [-LogLevel <String>] [-LogType <String>] [-NoConsoleOutput] [-AutoUpdate] [-SkipCertificateCheck]
 [<CommonParameters>]
```

### LECertificatesDNS
```
Request-NSACMECertificate [-CleanPoshACMEStorage] -ManagementURL <String> [-Username <String>]
 [-Password <Object>] [-Credential <PSCredential>] -CN <String> [-SAN <String[]>] [-FriendlyName <String>]
 [-ValidationMethod <String>] [-DNSPlugin <String>] [-DNSParams <Object>] [-DNSWaitTime <Int32>]
 [-CertKeyNameToUpdate <String>] [-RemovePrevious] -CertDir <String> [-PfxPassword <Object>]
 [-EmailAddress <String>] [-KeyLength <Object>] [-Production] [-DisableLogging] [-LogFile <String>]
 [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig] [-SendMail] [-SMTPTo <String[]>]
 [-SMTPFrom <String>] [-SMTPCredential <PSCredential>] [-SMTPServer <String>] [-SMTPPort <Int32>] [-SMTPUseSSL]
 [-LogAsAttachment] [-DisableIPCheck] [-IPv6] [-UpdateIIS] [-UpdateGlobalVPNCertBinding]
 [-GlobalVPNCertBindingIncludeCA] [-GlobalVPNCertBindingCrlCheck <String>]
 [-GlobalVPNCertBindingOcspCheck <String>] [-IISSiteToUpdate <String>] [-PostPoSHScriptFilename <String>]
 [-PostPoSHScriptExtraParameters <Hashtable>] [-CsVipName <String[]>] [-UseLbVip] [-CspName <String>]
 [-CsaName <String>] [-CsVipBinding <String>] [-SvcName <String>] [-SvcDestination <String>] [-LbName <String>]
 [-TrafficDomain <Int32>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>] [-EnableVipBefore]
 [-AlternateDNSValidationDomain <String>] [-AlternateDNSValidationDomainSkipCheck] [-UseNetScalerDNS]
 [-DisableVipAfter] [-ConfigFile <String>] [-ForceCertRenew] [-StopOnError] [-CleanExpiredCertsOnDisk]
 [-CleanExpiredCertsOnDiskDays <Int16>] [-NoConsoleOutput] [-AutoUpdate] [-SkipCertificateCheck]
 [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>]
 [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>]
 [-UseModernPfxEncryption] [-CertificateChainValidation <String>] [-PreferredChain <String>]
 [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>]
 [-AlwaysNewKey] [-SkipPoshACMEInstall] [-RemoveUploadedPfx] [<CommonParameters>]
```

### CommandPolicyUser
```
Request-NSACMECertificate -ManagementURL <String> [-Username <String>] [-Password <Object>]
 [-Credential <PSCredential>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig]
 [-UpdateGlobalVPNCertBinding] [-CsVipName <String[]>] [-UseLbVip] [-CspName <String>] [-CsaName <String>]
 [-SvcName <String>] [-LbName <String>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>]
 [-EnableVipBefore] [-UseNetScalerDNS] [-DisableVipAfter] [-CreateUserPermissions] [-NSCPName <String>]
 [-CreateApiUser] -ApiUsername <String> -ApiPassword <Object> [-NoConsoleOutput] [-AutoUpdate]
 [-SkipCertificateCheck] [<CommonParameters>]
```

### CommandPolicy
```
Request-NSACMECertificate -ManagementURL <String> [-Username <String>] [-Password <Object>]
 [-Credential <PSCredential>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig]
 [-UpdateGlobalVPNCertBinding] [-CsVipName <String[]>] [-UseLbVip] [-CspName <String>] [-CsaName <String>]
 [-SvcName <String>] [-LbName <String>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>]
 [-EnableVipBefore] [-UseNetScalerDNS] [-DisableVipAfter] [-CreateUserPermissions] [-NSCPName <String>]
 [-NoConsoleOutput] [-AutoUpdate] [-SkipCertificateCheck] [<CommonParameters>]
```

### AutoRun
```
Request-NSACMECertificate [-CertDir <String>] [-Production] -ConfigFile <String> [-AutoRun] [-ForceCertRenew]
 [-StopOnError] [-NoConsoleOutput] [-AutoUpdate] [-SkipCertificateCheck] [-CertificateProvider <String>]
 [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>]
 [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption] [-CertificateChainValidation <String>]
 [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>]
 [-LifetimeDays <Int32>] [-AlwaysNewKey] [-SkipPoshACMEInstall] [-RemoveUploadedPfx] [<CommonParameters>]
```

### CleanExpiredCerts
```
Request-NSACMECertificate -CertDir <String> [-CleanAllExpiredCertsOnDisk]
 [-CleanExpiredCertsOnDiskDays <Int16>] [-NoConsoleOutput] [-AutoUpdate] [<CommonParameters>]
```

## DESCRIPTION
Module replacement for the legacy GenLeCertForNS script.
Requests certificates
from an ACME provider, validates them through the NetScaler, and deploys the
result to /nsconfig/ssl with the certificate chain linked.

Validation is done over HTTP-01 (using a temporary responder policy on a content
switch or load balancing vServer) or DNS-01 (using a Posh-ACME DNS plugin).
Let's Encrypt, ZeroSSL, Google, SSLCom, Actalis and custom ACME directories are
supported, against production or staging endpoints.

A single run can process many certificates from a config file with -AutoRun.
Renewal is skipped for certificates that are still outside their renewal window
unless -ForceCertRenew is used, and one ACME account is reused for all requests
that share a contact address and account key length.

The certificate installed on the NetScaler decides whether a replacement is needed.
Local Posh-ACME state is a per-machine cache and is not authoritative on its own,
so runs spread across several machines reach the same decision.

Besides requesting certificates, the function also creates the NetScaler command
policies and API user used for automation, cleans up NetScaler validation
objects and test certificates, and removes expired certificates from disk.

The public parameter surface intentionally mirrors the legacy script so existing
config files and wrappers keep binding.

## EXAMPLES

### EXAMPLE 1
```
Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Username nsroot -Password 'password' -CN www.example.com -CertDir C:\Certs -EmailAddress hostmaster@example.com -CsVipName cs_https -Production
```

Requests a production certificate for www.example.com using HTTP-01 validation
through the existing cs_https content switch vServer, and deploys it.

### EXAMPLE 2
```
Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Username nsroot -Password 'password' -CN www.example.com -SAN mail.example.com,portal.example.com -CertDir C:\Certs -EmailAddress hostmaster@example.com -CsVipName cs_https
```

Requests a staging SAN certificate for three domains.
Without -Production the
certificate is untrusted, which is the safe way to test a new configuration.

### EXAMPLE 3
```
Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Credential $cred -CN example.com -SAN *.example.com -ValidationMethod dns -DNSPlugin Cloudflare -DNSParams @{ CFToken = $token } -CertDir C:\Certs -EmailAddress hostmaster@example.com -Production
```

Requests a wildcard certificate using DNS-01 validation through the Cloudflare
plugin.
Wildcard names require DNS validation.

### EXAMPLE 4
```
Request-NSACMECertificate -ConfigFile C:\Certs\config.json -AutoRun -Production
```

Processes every enabled request in the configuration file, skipping certificates
that are still outside their renewal window.
This is the usual scheduled task.

### EXAMPLE 5
```
Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Username nsroot -Password 'password' -CreateUserPermissions -CreateApiUser -ApiUsername svc_acme -ApiPassword 'password'
```

Creates the limited NetScaler command policy and an API user bound to it, so
later runs do not need a full administrator account.

## PARAMETERS

### -Help
Shows the built-in usage information and exits without contacting a NetScaler.

```yaml
Type: SwitchParameter
Parameter Sets: Help
Aliases: h

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CleanADC
Removes the temporary NetScaler objects used for HTTP-01 validation (responder
policy and action, content switch policy and action, load balancing vServer and
service) and exits.

```yaml
Type: SwitchParameter
Parameter Sets: CleanADC
Aliases: CleanNS

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoveTestCertificates
Removes previously deployed staging or test certificates from the NetScaler and
exits.
Test certificates are the ones created with a non-production ACME server.

```yaml
Type: SwitchParameter
Parameter Sets: CleanTestCertificate
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CleanPoshACMEStorage
Deletes the local Posh-ACME storage directory before the run.
This discards
cached ACME accounts and orders, so the next request registers a new account.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, CleanTestCertificate, LECertificatesDNS
Aliases: CleanVault

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ManagementURL
Management address of the NetScaler, for example https://192.168.1.10.
When the
NetScaler runs an HA pair, connect to the address of the primary node.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: URL, NSManagementURL

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
NetScaler user name used for the NITRO connection.
Use New-NSACMECertificateUser
to create an account with only the permissions this function needs.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: User, NSUsername, ADCUsername

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password for the NetScaler user.
Accepts a plain string, a SecureString or the
encrypted secret object used in the config file.

```yaml
Type: Object
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSPassword, ADCPassword

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
NetScaler credential object.
Use this instead of Username and Password.

```yaml
Type: PSCredential
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSCredential, ADCCredential

Required: False
Position: Named
Default value: [System.Management.Automation.PSCredential]::Empty
Accept pipeline input: False
Accept wildcard characters: False
```

### -CN
Common name of the certificate, for example www.example.com.
This is also the
first domain in the certificate request.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SAN
Additional Subject Alternative Names for the certificate.
The common name does
not need to be repeated here.

```yaml
Type: String[]
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### -FriendlyName
Friendly name stored in the PFX file.
Defaults to the common name.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ValidationMethod
ACME challenge type.
Use 'http' for HTTP-01 validation through the NetScaler, or
'dns' for DNS-01 validation through a Posh-ACME DNS plugin.
Default is 'http'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: Http
Accept pipeline input: False
Accept wildcard characters: False
```

### -DNSPlugin
Posh-ACME DNS plugin used for DNS-01 validation, for example Cloudflare or Azure.
Use 'Manual' to be prompted for the TXT records.
Default is 'Manual'.

```yaml
Type: String
Parameter Sets: LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: Manual
Accept pipeline input: False
Accept wildcard characters: False
```

### -DNSParams
Hashtable of plugin arguments passed to the Posh-ACME DNS plugin, such as API
tokens or zone identifiers.
See the Posh-ACME plugin documentation for the keys
each plugin expects.

```yaml
Type: Object
Parameter Sets: LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -DNSWaitTime
Seconds to wait after publishing DNS records before asking the ACME provider to
validate them.
Increase this for slow-propagating zones.
Default is 120.

```yaml
Type: Int32
Parameter Sets: LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: 120
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertKeyNameToUpdate
Name of the existing NetScaler certkey to replace with the new certificate.
When
omitted, a certkey name is derived from the common name.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases: NSCertNameToUpdate

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemovePrevious
Removes the previous certkey after the new certificate is bound.
The old certkey
is kept when it is still part of the new chain or bound to the VPN global
configuration.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertDir
Directory where certificate artifacts (PFX, chain and key files) are written.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, CleanExpiredCerts
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: AutoRun
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PfxPassword
Password for the generated PFX file.
A random password is generated when this is
not supplied.

```yaml
Type: Object
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EmailAddress
Contact address registered with the ACME account.
The provider uses it for
expiry notifications.
Requests that share this address and account key length
reuse the same ACME account.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeyLength
Certificate and account key size.
Accepts an RSA size between 2048 and 4096 that
is divisible by 128, or an EC curve name: 'ec-256', 'ec-384' or 'ec-521'.
Default is 2048.

```yaml
Type: Object
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: 2048
Accept pipeline input: False
Accept wildcard characters: False
```

### -Production
Requests a certificate from the production ACME endpoint.
Without this switch the
staging endpoint is used, which issues untrusted certificates but does not consume
production rate limits.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableLogging
Disables writing the log file for this run.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogFile
Path of the log file.
The default resolves to GenLE-Log.txt in the certificate
directory.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: LogLocation

Required: False
Position: Named
Default value: <DEFAULT>
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogLevel
Minimum severity written to the log: Error, Warning, Info, Debug or None.
Default
is 'Info'.
Use 'Debug' when troubleshooting validation or deployment problems.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: Info
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogType
Log file format: 'txt' for readable text or 'jsonl' for one JSON object per line.
Default is 'txt'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: Txt
Accept pipeline input: False
Accept wildcard characters: False
```

### -SaveADCConfig
Saves the NetScaler running configuration after changes are applied.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: SaveNSConfig

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SendMail
Sends a summary mail when the run finishes.
Requires the SMTP parameters.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPTo
One or more recipient addresses for the summary mail.

```yaml
Type: String[]
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPFrom
Sender address for the summary mail.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPCredential
Credential used to authenticate to the SMTP server.
Omit for anonymous relays.

```yaml
Type: PSCredential
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: [System.Management.Automation.PSCredential]::Empty
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPServer
Host name or address of the SMTP server.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPPort
TCP port of the SMTP server.
Default is 25.

```yaml
Type: Int32
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: 25
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPUseSSL
Uses TLS for the SMTP connection.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogAsAttachment
Attaches the log file to the summary mail instead of only linking to it.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableIPCheck
Skips the public DNS check that verifies each domain resolves to a reachable
address before validation starts.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPv6
Treats the validation addresses as IPv6.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdateIIS
Binds the new certificate to a local IIS site after deployment.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdateGlobalVPNCertBinding
Replaces the certificate bound to the NetScaler VPN global configuration.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -GlobalVPNCertBindingIncludeCA
Also binds the issuing CA certificate to the VPN global configuration.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -GlobalVPNCertBindingCrlCheck
CRL checking for the VPN global CA binding: 'Mandatory' or 'Optional'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GlobalVPNCertBindingOcspCheck
OCSP checking for the VPN global CA binding: 'Mandatory' or 'Optional'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IISSiteToUpdate
Name of the IIS site to bind the certificate to.
Default is 'Default Web Site'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: Default Web Site
Accept pipeline input: False
Accept wildcard characters: False
```

### -PostPoSHScriptFilename
Path to a PowerShell script executed after a certificate is deployed, for
distributing the certificate to other systems.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PostPoSHScriptExtraParameters
Hashtable of additional parameters splatted into the post-run script.

```yaml
Type: Hashtable
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -CsVipName
Name of the content switch vServer that already serves the domains being
validated.
The HTTP-01 challenge is bound to it for the duration of the run.

```yaml
Type: String[]
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSCsVipName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseLbVip
Validates through a dedicated load balancing vServer instead of an existing
content switch vServer.
Use this when no content switch fronts the domains.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CspName
Name of the content switch policy created for validation.
Default is
'csp_letsencrypt'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSCspName

Required: False
Position: Named
Default value: Csp_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -CsaName
Name of the content switch action created for validation.
Default is
'csa_letsencrypt'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: Csa_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -CsVipBinding
Binding priority used when the validation policy is bound to the content switch
vServer.
Default is '11'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS
Aliases: NSCsVipBinding

Required: False
Position: Named
Default value: 11
Accept pipeline input: False
Accept wildcard characters: False
```

### -SvcName
Name of the dummy service created for validation.
Default is
'svc_letsencrypt_cert_dummy'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSSvcName

Required: False
Position: Named
Default value: Svc_letsencrypt_cert_dummy
Accept pipeline input: False
Accept wildcard characters: False
```

### -SvcDestination
Destination address of the dummy validation service.
This address is never
contacted.
Default is '1.2.3.4'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS
Aliases: NSSvcDestination

Required: False
Position: Named
Default value: 1.2.3.4
Accept pipeline input: False
Accept wildcard characters: False
```

### -LbName
Name of the load balancing vServer created for validation.
Default is
'lb_letsencrypt_cert'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSLbName

Required: False
Position: Named
Default value: Lb_letsencrypt_cert
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrafficDomain
NetScaler traffic domain used for the validation objects.
Default is 0.

```yaml
Type: Int32
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS
Aliases: TD

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -RspName
Name of the responder policy created for validation.
Default is
'rsp_letsencrypt'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSRspName

Required: False
Position: Named
Default value: Rsp_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -RsaName
Name of the responder action created for validation.
Default is
'rsa_letsencrypt'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases: NSRsaName

Required: False
Position: Named
Default value: Rsa_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -Partitions
NetScaler admin partitions to search when locating existing certkeys.
Default is
the default partition.

```yaml
Type: String[]
Parameter Sets: LECertificatesHTTP, CleanADC, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: @('default')
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableVipBefore
Enables the content switch vServer before validation starts.
Use this when the
vServer is normally kept disabled.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AlternateDNSValidationDomain
Domain holding the _acme-challenge records when DNS-01 validation is delegated
to another zone through a CNAME.

```yaml
Type: String
Parameter Sets: LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AlternateDNSValidationDomainSkipCheck
Skips verification that the delegating CNAME records exist.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseNetScalerDNS
Publishes DNS-01 challenge records on the NetScaler itself instead of an external
DNS provider.
Requires a NetScaler session.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableVipAfter
Disables the content switch vServer again after validation finishes.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreateUserPermissions
Creates or updates the NetScaler command policy used for certificate automation
and exits.

```yaml
Type: SwitchParameter
Parameter Sets: CommandPolicyUser, CommandPolicy
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NSCPName
Name of the command policy created by CreateUserPermissions.
Default is
'script-GenLeCertForNS'.

```yaml
Type: String
Parameter Sets: CommandPolicyUser, CommandPolicy
Aliases:

Required: False
Position: Named
Default value: Script-GenLeCertForNS
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreateApiUser
Creates or updates a NetScaler system user for automation and binds the command
policy to it.

```yaml
Type: SwitchParameter
Parameter Sets: CommandPolicyUser
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApiUsername
User name of the NetScaler API account to create or update.

```yaml
Type: String
Parameter Sets: CommandPolicyUser
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApiPassword
Password for the NetScaler API account.

```yaml
Type: Object
Parameter Sets: CommandPolicyUser
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConfigFile
Path to the JSON configuration file.
Settings and certificate requests are read
from it in AutoRun mode, and command line settings are written back to it.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: AutoRun
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoRun
Processes every enabled certificate request in the configuration file.
Requests
outside their renewal window are skipped.

```yaml
Type: SwitchParameter
Parameter Sets: AutoRun
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceCertRenew
Renews certificates even when they are still outside their renewal window.
The switch itself is never written to a config file.
A ForceCertRenew flag set on a request inside a JSON config is one shot, and is
reset once that certificate deploys successfully, so it does not renew the same
certificate on every later run.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases: Force

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -StopOnError
Stops the run at the first failed certificate request.
By default the remaining
requests are still processed.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CleanExpiredCertsOnDisk
Removes expired certificate directories from the certificate directory after a
successful run.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CleanAllExpiredCertsOnDisk
Removes expired certificate directories from the certificate directory and exits.

```yaml
Type: SwitchParameter
Parameter Sets: CleanExpiredCerts
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CleanExpiredCertsOnDiskDays
Age in days after expiry before a certificate directory is removed from disk.
Default is 100.

```yaml
Type: Int16
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, CleanExpiredCerts
Aliases:

Required: False
Position: Named
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoConsoleOutput
Suppresses console output.
The log file is still written.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoUpdate
Checks for and installs a newer NetScalerToolkit module before running.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCertificateCheck
Skips TLS validation of the NetScaler management certificate.
Use this for
self-signed or private CA management certificates.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, CleanADC, CleanTestCertificate, LECertificatesDNS, CommandPolicyUser, CommandPolicy, AutoRun
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateProvider
ACME provider to request the certificate from: LetsEncrypt, ZeroSSL, Google,
SSLCom, Actalis or CustomAcme.
Providers other than LetsEncrypt generally require
external account binding.
Default is 'LetsEncrypt'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: LetsEncrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -AcmeDirectoryUrl
Directory URL of the ACME server.
Required when CertificateProvider is
'CustomAcme', and overrides the built-in URL for the other providers.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExternalAccountBindingKeyId
External account binding key identifier (EAB KID) supplied by the ACME provider.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases: ExtAcctKID

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExternalAccountBindingHmacKey
External account binding HMAC key supplied by the ACME provider.

```yaml
Type: Object
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases: ExtAcctHMACKey

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExternalAccountBindingAlgorithm
Algorithm used for the external account binding: HS256, HS384 or HS512.
Default
is 'HS256'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases: ExtAcctAlgorithm

Required: False
Position: Named
Default value: HS256
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseModernPfxEncryption
Writes the PFX with AES encryption instead of the legacy RC2 format.
Older
NetScaler firmware may not read these files.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateChainValidation
Behavior when the issued chain fails validation: 'None' to skip the check,
'Warn' to log and continue, or 'Fail' to stop the request.
Default is 'Warn'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: Warn
Accept pipeline input: False
Accept wildcard characters: False
```

### -PreferredChain
Issuer common name of the preferred certificate chain when the provider offers
alternates, for example 'ISRG Root X1'.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Profile
Certificate profile requested from the ACME provider, when the provider supports
profile selection.

```yaml
Type: String
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DnsAlias
DNS challenge alias domains used when validation is delegated through CNAME
records.

```yaml
Type: String[]
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ValidationTimeout
Seconds to wait for the ACME provider to complete validation before the request
fails.
Default is 240.

```yaml
Type: Int32
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: 240
Accept pipeline input: False
Accept wildcard characters: False
```

### -LifetimeDays
Requested certificate lifetime in days, when the provider supports short-lived
certificates.

```yaml
Type: Int32
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AlwaysNewKey
Generates a new private key for every renewal instead of reusing the existing
key.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipPoshACMEInstall
Fails instead of installing the Posh-ACME module automatically when it is
missing.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoveUploadedPfx
Deletes the uploaded PFX file from the NetScaler after the certkey is created.

```yaml
Type: SwitchParameter
Parameter Sets: LECertificatesHTTP, LECertificatesDNS, AutoRun
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate/request/](https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate/request/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


