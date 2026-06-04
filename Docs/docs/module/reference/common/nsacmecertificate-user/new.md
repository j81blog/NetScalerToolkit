# New-NSACMECertificateUser

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
New-NSACMECertificateUser -ManagementURL <String> -Credential <PSCredential> [-PolicyName <String>] [-ApiUsername <String>] [-ApiPassword <Object>] [-CsVipName <String[]>] [-UseLbVip <SwitchParameter>] [-LbName <String>] [-SvcName <String>] [-RspName <String>] [-RsaName <String>] [-CspName <String>] [-CsaName <String>] [-EnableVipBefore <SwitchParameter>] [-DisableVipAfter <SwitchParameter>] [-UseNetScalerDNS <SwitchParameter>] [-UpdateGlobalVPNCertBinding <SwitchParameter>] [-Partitions <String[]>] [-PruneExistingPolicyBindings <SwitchParameter>] [-SaveADCConfig <SwitchParameter>] [-SkipCertificateCheck <SwitchParameter>] [-PassThru <SwitchParameter>]
```

```powershell
New-NSACMECertificateUser -Session <Object> [-PolicyName <String>] [-ApiUsername <String>] [-ApiPassword <Object>] [-CsVipName <String[]>] [-UseLbVip <SwitchParameter>] [-LbName <String>] [-SvcName <String>] [-RspName <String>] [-RsaName <String>] [-CspName <String>] [-CsaName <String>] [-EnableVipBefore <SwitchParameter>] [-DisableVipAfter <SwitchParameter>] [-UseNetScalerDNS <SwitchParameter>] [-UpdateGlobalVPNCertBinding <SwitchParameter>] [-Partitions <String[]>] [-PruneExistingPolicyBindings <SwitchParameter>] [-SaveADCConfig <SwitchParameter>] [-PassThru <SwitchParameter>]
```

## Parameters

### -ApiPassword

- Type: `System.Object`
- Required: `False`
- Pipeline input: `False`

### -ApiUsername

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Confirm

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `cf`

### -Credential

- Type: `System.Management.Automation.PSCredential`
- Required: `True`
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

### -CsVipName

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSCsVipName`

### -DisableVipAfter

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -EnableVipBefore

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -LbName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSLbName`

### -ManagementURL

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`
- Aliases: `URL`, `NSManagementURL`

### -Partitions

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -PassThru

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -PolicyName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSCPName`

### -PruneExistingPolicyBindings

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

### -SaveADCConfig

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `SaveNSConfig`

### -Session

- Type: `System.Object`
- Required: `True`
- Pipeline input: `False`

### -SkipCertificateCheck

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -SvcName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`
- Aliases: `NSSvcName`

### -UpdateGlobalVPNCertBinding

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -UseLbVip

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -UseNetScalerDNS

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -WhatIf

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `wi`

## Notes

This page was generated from exported PowerShell command metadata.

