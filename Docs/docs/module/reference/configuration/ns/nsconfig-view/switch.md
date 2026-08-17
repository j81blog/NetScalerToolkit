---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSSwitchNSConfigView

## SYNOPSIS
Invokes the switch operation for a NetScaler nsconfigview resource.

## SYNTAX

```
Invoke-NSSwitchNSConfigView [-State] <String> [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for 0 resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSSwitchNSConfigView -State CLASSIC
```

### EXAMPLE 2
```
Invoke-NSSwitchNSConfigView -State CLASSIC -WhatIf
```

## PARAMETERS

### -State
State is a session-level setting that controls the configuration shown to the user.
Based on the selected option user will be able to see only the configuration created through Classic Interface (CLI/API) or Only Configurations created through Next-Gen API, Or both Classic & Next-Gen API interfaces.
Configurations created by Nextgenapi are read-only and can only be modified via Next-Gen API REST endpoints.
Configurations created by classic interfaces (CLI, NITRO) are editable for CLASSIC or ALL views.
Possible values: - CLASSIC: Config view is limited to the configuration entities created through classic interfaces (CLI, NITRO).
This is the default behaviour.
- NEXTGENAPI: Config view is limited to the configuration entities created through Next-Gen API Interface.
- ALL: Configurations created by both Classic and Next-Gen API interfaces are visible.
Default value: CLASSIC Possible values = CLASSIC, NEXTGENAPI, ALL

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
Position: 2
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

