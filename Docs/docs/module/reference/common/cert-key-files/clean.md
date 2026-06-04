# Invoke-NSCleanCertKeyFiles

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Invoke-NSCleanCertKeyFiles -Session <PSObject> [-Backup <SwitchParameter>] [-NoSaveConfig <SwitchParameter>] [-Attempts <Int32>] [-ExpirationDays <Int32>] [-FileLocation <String>] [-ExcludeCertKey <String[]>] [-ExcludeFile <String[]>] [-ExcludeFilePattern <String[]>] [-PassThru <SwitchParameter>] [-Summary <SwitchParameter>]
```

```powershell
Invoke-NSCleanCertKeyFiles -ManagementUrl <Uri> -Credential <PSCredential> [-SkipCertificateCheck <SwitchParameter>] [-UseNitroHeader <SwitchParameter>] [-Backup <SwitchParameter>] [-NoSaveConfig <SwitchParameter>] [-Attempts <Int32>] [-ExpirationDays <Int32>] [-FileLocation <String>] [-ExcludeCertKey <String[]>] [-ExcludeFile <String[]>] [-ExcludeFilePattern <String[]>] [-PassThru <SwitchParameter>] [-Summary <SwitchParameter>]
```

## Parameters

### -Attempts

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Backup

- Type: `System.Management.Automation.SwitchParameter`
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

### -ExcludeCertKey

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -ExcludeFile

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -ExcludeFilePattern

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -ExpirationDays

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -FileLocation

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ManagementUrl

- Type: `System.Uri`
- Required: `True`
- Pipeline input: `False`

### -NoSaveConfig

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -PassThru

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Session

- Type: `System.Management.Automation.PSObject`
- Required: `True`
- Pipeline input: `False`

### -SkipCertificateCheck

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Summary

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -UseNitroHeader

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

