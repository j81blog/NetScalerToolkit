---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteLSNAppsProfilePortBinding

## SYNOPSIS
Removes a NetScaler lsnappsprofile_port_binding resource.

## SYNTAX

```
Invoke-NSDeleteLSNAppsProfilePortBinding [-AppsProfileName] <String> [-LsnPort <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the port that can be bound to lsnappsprofile.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteLSNAppsProfilePortBinding -AppsProfileName 'example' -LsnPort 'example' -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetLSNAppsProfilePortBinding -AppsProfileName 'lsnappsprofile_port_binding_example' | Invoke-NSDeleteLSNAppsProfilePortBinding -Confirm:$false
```

## PARAMETERS

### -AppsProfileName
Name for the LSN application profile.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after the LSN application profile is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1').
Minimum length = 1 Maximum length = 127

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -LsnPort
Port numbers or range of port numbers to match against the destination port of the incoming packet from a subscriber.
When the destination port is matched, the LSN application profile is applied for the LSN session.
Separate a range of ports with a hyphen.
For example, 40-90.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-NSSession)
Accept pipeline input: False
Accept wildcard characters: False
```

### -IgnoreNotFound
Returns null instead of throwing for known NITRO not-found responses.

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

### -ReturnNullOnNotFound
Returns null instead of throwing for known NITRO not-found responses.

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

### -ThrowOnWarning
Treats NITRO warning responses as terminating errors.

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
Generated from NetScaler NITRO API metadata.
Generated: 2026-06-01 21:28
Supported metadata versions: 13.1, 14.1.

## RELATED LINKS

