# Invoke-NSUpdateGSLBVServer

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Invoke-NSUpdateGSLBVServer [-AppFlowLog <String>] [-BackupIp <String>] [-BackupLBMethod <String>] [-BackupSessionTimeout <Int32>] [-BackupVServer <String>] [-Comment <String>] [-Considereffectivestate <String>] [-CookieDomain <String>] [-CookieTimeout <Int32>] [-DisablePrimaryOnDown <String>] [-DNSRecordType <String>] [-DomainName <String>] [-Dynamicweight <String>] [-Ecs <String>] [-Ecsaddrvalidation <String>] [-Edr <String>] [-IpType <String>] [-LBMethod <String>] [-Mir <String>] -Name <String> [-NetMask <String>] [-Order <Int32>] [-OrderThreshold <Int32>] [-PersistenceId <Int32>] [-PersistenceType <String>] [-PersistMask <String>] [-Rule <String>] [-ServiceGroupName <String>] [-ServiceName <String>] [-Sitedomainttl <Int32>] [-SoBackupAction <String>] [-SoMethod <String>] [-SoPersistence <String>] [-SoPersistenceTimeout <Int32>] [-SoThreshold <Int32>] [-Timeout <Int32>] [-ToggleOrder <String>] [-Tolerance <Int32>] [-Ttl <Int32>] [-V6NetmaskLen <Int32>] [-V6PersistMaskLen <Int32>] [-Weight <Int32>] [-Session <PSObject>] [-IgnoreNotFound <SwitchParameter>] [-ReturnNullOnNotFound <SwitchParameter>] [-ThrowOnWarning <SwitchParameter>] [-PassThru <SwitchParameter>]
```

## Parameters

### -AppFlowLog

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -BackupIp

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -BackupLBMethod

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -BackupSessionTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -BackupVServer

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Comment

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Confirm

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `cf`

### -Considereffectivestate

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CookieDomain

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CookieTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -DisablePrimaryOnDown

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DNSRecordType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DomainName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Dynamicweight

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Ecs

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Ecsaddrvalidation

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Edr

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -IgnoreNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -IpType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -LBMethod

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Mir

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Name

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -NetMask

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Order

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -OrderThreshold

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -PassThru

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -PersistenceId

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -PersistenceType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -PersistMask

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ReturnNullOnNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Rule

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ServiceGroupName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ServiceName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Session

- Type: `System.Management.Automation.PSObject`
- Required: `False`
- Pipeline input: `False`

### -Sitedomainttl

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -SoBackupAction

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SoMethod

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SoPersistence

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SoPersistenceTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -SoThreshold

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -ThrowOnWarning

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Timeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -ToggleOrder

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Tolerance

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Ttl

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -V6NetmaskLen

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -V6PersistMaskLen

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Weight

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -WhatIf

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `wi`

## Notes

This page was generated from exported PowerShell command metadata.

