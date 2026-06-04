# Request-NSACMECertificate

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Request-NSACMECertificate [-CleanPoshACMEStorage <SwitchParameter>] -ManagementURL <String> [-Username <String>] [-Password <Object>] [-Credential <PSCredential>] -CN <String> [-SAN <String[]>] [-FriendlyName <String>] [-ValidationMethod <String>] [-CertKeyNameToUpdate <String>] [-RemovePrevious <SwitchParameter>] -CertDir <String> [-PfxPassword <Object>] [-EmailAddress <String>] [-KeyLength <Object>] [-Production <SwitchParameter>] [-DisableLogging <SwitchParameter>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig <SwitchParameter>] [-SendMail <SwitchParameter>] [-SMTPTo <String[]>] [-SMTPFrom <String>] [-SMTPCredential <PSCredential>] [-SMTPServer <String>] [-SMTPPort <Int32>] [-SMTPUseSSL <SwitchParameter>] [-LogAsAttachment <SwitchParameter>] [-DisableIPCheck <SwitchParameter>] [-IPv6 <SwitchParameter>] [-UpdateIIS <SwitchParameter>] [-UpdateGlobalVPNCertBinding <SwitchParameter>] [-GlobalVPNCertBindingIncludeCA <SwitchParameter>] [-GlobalVPNCertBindingCrlCheck <String>] [-GlobalVPNCertBindingOcspCheck <String>] [-IISSiteToUpdate <String>] [-PostPoSHScriptFilename <String>] [-PostPoSHScriptExtraParameters <Hashtable>] [-CsVipName <String[]>] [-UseLbVip <SwitchParameter>] [-CspName <String>] [-CsaName <String>] [-CsVipBinding <String>] [-SvcName <String>] [-SvcDestination <String>] [-LbName <String>] [-TrafficDomain <Int32>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>] [-EnableVipBefore <SwitchParameter>] [-DisableVipAfter <SwitchParameter>] [-ConfigFile <String>] [-ForceCertRenew <SwitchParameter>] [-StopOnError <SwitchParameter>] [-CleanExpiredCertsOnDisk <SwitchParameter>] [-CleanExpiredCertsOnDiskDays <Int16>] [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate -Help <SwitchParameter> [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate -CleanADC <SwitchParameter> -ManagementURL <String> [-Username <String>] [-Password <Object>] [-Credential <PSCredential>] [-DisableLogging <SwitchParameter>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig <SwitchParameter>] [-CsVipName <String[]>] [-CspName <String>] [-CsaName <String>] [-CsVipBinding <String>] [-SvcName <String>] [-SvcDestination <String>] [-LbName <String>] [-TrafficDomain <Int32>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>] [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate -RemoveTestCertificates <SwitchParameter> [-CleanPoshACMEStorage <SwitchParameter>] -ManagementURL <String> [-Username <String>] [-Password <Object>] [-Credential <PSCredential>] [-DisableLogging <SwitchParameter>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate [-CleanPoshACMEStorage <SwitchParameter>] -ManagementURL <String> [-Username <String>] [-Password <Object>] [-Credential <PSCredential>] -CN <String> [-SAN <String[]>] [-FriendlyName <String>] [-ValidationMethod <String>] [-DNSPlugin <String>] [-DNSParams <Object>] [-DNSWaitTime <Int32>] [-CertKeyNameToUpdate <String>] [-RemovePrevious <SwitchParameter>] -CertDir <String> [-PfxPassword <Object>] [-EmailAddress <String>] [-KeyLength <Object>] [-Production <SwitchParameter>] [-DisableLogging <SwitchParameter>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig <SwitchParameter>] [-SendMail <SwitchParameter>] [-SMTPTo <String[]>] [-SMTPFrom <String>] [-SMTPCredential <PSCredential>] [-SMTPServer <String>] [-SMTPPort <Int32>] [-SMTPUseSSL <SwitchParameter>] [-LogAsAttachment <SwitchParameter>] [-DisableIPCheck <SwitchParameter>] [-IPv6 <SwitchParameter>] [-UpdateIIS <SwitchParameter>] [-UpdateGlobalVPNCertBinding <SwitchParameter>] [-GlobalVPNCertBindingIncludeCA <SwitchParameter>] [-GlobalVPNCertBindingCrlCheck <String>] [-GlobalVPNCertBindingOcspCheck <String>] [-IISSiteToUpdate <String>] [-PostPoSHScriptFilename <String>] [-PostPoSHScriptExtraParameters <Hashtable>] [-CsVipName <String[]>] [-UseLbVip <SwitchParameter>] [-CspName <String>] [-CsaName <String>] [-CsVipBinding <String>] [-SvcName <String>] [-SvcDestination <String>] [-LbName <String>] [-TrafficDomain <Int32>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>] [-EnableVipBefore <SwitchParameter>] [-AlternateDNSValidationDomain <String>] [-AlternateDNSValidationDomainSkipCheck <SwitchParameter>] [-UseNetScalerDNS <SwitchParameter>] [-DisableVipAfter <SwitchParameter>] [-ConfigFile <String>] [-ForceCertRenew <SwitchParameter>] [-StopOnError <SwitchParameter>] [-CleanExpiredCertsOnDisk <SwitchParameter>] [-CleanExpiredCertsOnDiskDays <Int16>] [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate -ManagementURL <String> [-Username <String>] [-Password <Object>] [-Credential <PSCredential>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig <SwitchParameter>] [-UpdateGlobalVPNCertBinding <SwitchParameter>] [-CsVipName <String[]>] [-UseLbVip <SwitchParameter>] [-CspName <String>] [-CsaName <String>] [-SvcName <String>] [-LbName <String>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>] [-EnableVipBefore <SwitchParameter>] [-UseNetScalerDNS <SwitchParameter>] [-DisableVipAfter <SwitchParameter>] -CreateUserPermissions <SwitchParameter> [-NSCPName <String>] -CreateApiUser <SwitchParameter> -ApiUsername <String> -ApiPassword <Object> [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate -ManagementURL <String> [-Username <String>] [-Password <Object>] [-Credential <PSCredential>] [-LogFile <String>] [-LogLevel <String>] [-LogType <String>] [-SaveADCConfig <SwitchParameter>] [-UpdateGlobalVPNCertBinding <SwitchParameter>] [-CsVipName <String[]>] [-UseLbVip <SwitchParameter>] [-CspName <String>] [-CsaName <String>] [-SvcName <String>] [-LbName <String>] [-RspName <String>] [-RsaName <String>] [-Partitions <String[]>] [-EnableVipBefore <SwitchParameter>] [-UseNetScalerDNS <SwitchParameter>] [-DisableVipAfter <SwitchParameter>] -CreateUserPermissions <SwitchParameter> [-NSCPName <String>] [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate -CertDir <String> -CleanAllExpiredCertsOnDisk <SwitchParameter> [-CleanExpiredCertsOnDiskDays <Int16>] [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

```powershell
Request-NSACMECertificate [-Production <SwitchParameter>] -ConfigFile <String> -AutoRun <SwitchParameter> [-ForceCertRenew <SwitchParameter>] [-StopOnError <SwitchParameter>] [-NoConsoleOutput <SwitchParameter>] [-AutoUpdate <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-CertificateProvider <String>] [-AcmeDirectoryUrl <String>] [-ExternalAccountBindingKeyId <String>] [-ExternalAccountBindingHmacKey <Object>] [-ExternalAccountBindingAlgorithm <String>] [-UseModernPfxEncryption <SwitchParameter>] [-CertificateChainValidation <String>] [-PreferredChain <String>] [-Profile <String>] [-DnsAlias <String[]>] [-ValidationTimeout <Int32>] [-LifetimeDays <Int32>] [-AlwaysNewKey <SwitchParameter>] [-RemoveUploadedPfx <SwitchParameter>]
```

## Parameters

### -AcmeDirectoryUrl

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -AlternateDNSValidationDomain

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -AlternateDNSValidationDomainSkipCheck

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -AlwaysNewKey

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -ApiPassword

- Type: `System.Object`
- Required: `True`
- Pipeline input: `False`

### -ApiUsername

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -AutoRun

- Type: `System.Management.Automation.SwitchParameter`
- Required: `True`
- Pipeline input: `False`

### -AutoUpdate

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -CertDir

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -CertificateChainValidation

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CertificateProvider

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CertKeyNameToUpdate

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSCertNameToUpdate`

### -CleanADC

- Type: `System.Management.Automation.SwitchParameter`
- Required: `True`
- Pipeline input: `False`
- Aliases: `CleanNS`

### -CleanAllExpiredCertsOnDisk

- Type: `System.Management.Automation.SwitchParameter`
- Required: `True`
- Pipeline input: `False`

### -CleanExpiredCertsOnDisk

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -CleanExpiredCertsOnDiskDays

- Type: `System.Int16`
- Required: `False`
- Pipeline input: `False`

### -CleanPoshACMEStorage

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `CleanVault`

### -CN

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -ConfigFile

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -CreateApiUser

- Type: `System.Management.Automation.SwitchParameter`
- Required: `True`
- Pipeline input: `False`

### -CreateUserPermissions

- Type: `System.Management.Automation.SwitchParameter`
- Required: `True`
- Pipeline input: `False`

### -Credential

- Type: `System.Management.Automation.PSCredential`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSCredential`, `ADCCredential`

### -CsaName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CspName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSCspName`

### -CsVipBinding

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSCsVipBinding`

### -CsVipName

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSCsVipName`

### -DisableIPCheck

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -DisableLogging

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -DisableVipAfter

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -DnsAlias

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -DNSParams

- Type: `System.Object`
- Required: `False`
- Pipeline input: `False`

### -DNSPlugin

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DNSWaitTime

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -EmailAddress

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -EnableVipBefore

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -ExternalAccountBindingAlgorithm

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `ExtAcctAlgorithm`

### -ExternalAccountBindingHmacKey

- Type: `System.Object`
- Required: `False`
- Pipeline input: `False`
- Aliases: `ExtAcctHMACKey`

### -ExternalAccountBindingKeyId

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `ExtAcctKID`

### -ForceCertRenew

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `Force`

### -FriendlyName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -GlobalVPNCertBindingCrlCheck

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -GlobalVPNCertBindingIncludeCA

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -GlobalVPNCertBindingOcspCheck

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Help

- Type: `System.Management.Automation.SwitchParameter`
- Required: `True`
- Pipeline input: `False`
- Aliases: `h`

### -IISSiteToUpdate

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -IPv6

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -KeyLength

- Type: `System.Object`
- Required: `False`
- Pipeline input: `False`

### -LbName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSLbName`

### -LifetimeDays

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -LogAsAttachment

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -LogFile

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `LogLocation`

### -LogLevel

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -LogType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ManagementURL

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`
- Aliases: `URL`, `NSManagementURL`

### -NoConsoleOutput

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -NSCPName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Partitions

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Password

- Type: `System.Object`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSPassword`, `ADCPassword`

### -PfxPassword

- Type: `System.Object`
- Required: `False`
- Pipeline input: `False`

### -PostPoSHScriptExtraParameters

- Type: `System.Collections.Hashtable`
- Required: `False`
- Pipeline input: `False`

### -PostPoSHScriptFilename

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -PreferredChain

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Production

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Profile

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -RemovePrevious

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -RemoveTestCertificates

- Type: `System.Management.Automation.SwitchParameter`
- Required: `True`
- Pipeline input: `False`

### -RemoveUploadedPfx

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -RsaName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSRsaName`

### -RspName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSRspName`

### -SAN

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -SaveADCConfig

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `SaveNSConfig`

### -SendMail

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -SkipCertificateCheck

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -SMTPCredential

- Type: `System.Management.Automation.PSCredential`
- Required: `False`
- Pipeline input: `False`

### -SMTPFrom

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SMTPPort

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -SMTPServer

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SMTPTo

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -SMTPUseSSL

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -StopOnError

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -SvcDestination

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSSvcDestination`

### -SvcName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSSvcName`

### -TrafficDomain

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`
- Aliases: `TD`

### -UpdateGlobalVPNCertBinding

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -UpdateIIS

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -UseLbVip

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -UseModernPfxEncryption

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -UseNetScalerDNS

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Username

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `User`, `NSUsername`, `ADCUsername`

### -ValidationMethod

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ValidationTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

## Notes

This page was generated from exported PowerShell command metadata.

