# Invoke-NSRestRequest

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Invoke-NSRestRequest [-Session <PSObject>] [-Method <String>] [-Operation <String>] -Task <String> -Type <String> [-Resource <String>] [-Action <String>] [-Query <Hashtable>] [-Payload <Hashtable>] [-RawResponse <SwitchParameter>] [-Headers <Hashtable>] [-IgnoreNotFound <SwitchParameter>] [-NotFoundErrorCode <Int32[]>] [-ReturnNullOnNotFound <SwitchParameter>] [-ThrowOnWarning <SwitchParameter>] [-NitroWarning <String>] [-NitroOnError <String>] [-RetryCount <Int32>] [-RetryDelaySeconds <Int32>] [-RetryStatusCode <Int32[]>] [-RetryUnsafeMethods <SwitchParameter>]
```

```powershell
Invoke-NSRestRequest [-Session <PSObject>] [-Method <String>] [-Operation <String>] -NitroPath <String> [-Action <String>] [-Query <Hashtable>] [-Payload <Hashtable>] [-RawResponse <SwitchParameter>] [-Headers <Hashtable>] [-IgnoreNotFound <SwitchParameter>] [-NotFoundErrorCode <Int32[]>] [-ReturnNullOnNotFound <SwitchParameter>] [-ThrowOnWarning <SwitchParameter>] [-NitroWarning <String>] [-NitroOnError <String>] [-RetryCount <Int32>] [-RetryDelaySeconds <Int32>] [-RetryStatusCode <Int32[]>] [-RetryUnsafeMethods <SwitchParameter>]
```

## Parameters

### -Action

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Headers

- Type: `System.Collections.Hashtable`
- Required: `False`
- Pipeline input: `False`

### -IgnoreNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Method

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -NitroOnError

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -NitroPath

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -NitroWarning

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -NotFoundErrorCode

- Type: `System.Int32[]`
- Required: `False`
- Pipeline input: `False`

### -Operation

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Payload

- Type: `System.Collections.Hashtable`
- Required: `False`
- Pipeline input: `False`

### -Query

- Type: `System.Collections.Hashtable`
- Required: `False`
- Pipeline input: `False`

### -RawResponse

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Resource

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -RetryCount

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -RetryDelaySeconds

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -RetryStatusCode

- Type: `System.Int32[]`
- Required: `False`
- Pipeline input: `False`

### -RetryUnsafeMethods

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -ReturnNullOnNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Session

- Type: `System.Management.Automation.PSObject`
- Required: `False`
- Pipeline input: `False`

### -Task

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -ThrowOnWarning

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Type

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

## Notes

This page was generated from exported PowerShell command metadata.

