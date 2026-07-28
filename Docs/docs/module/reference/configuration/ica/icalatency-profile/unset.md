---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetICALatencyProfile

## SYNOPSIS
Clears one or more NetScaler icalatencyprofile resource properties.

## SYNTAX

```
Invoke-NSUnsetICALatencyProfile [-Name] <String> [-L7latencyMaxNotifycount] [-L7latencyMonItoring]
 [-L7latencynotifyInterval] [-L7latencyThresholdFactor] [-L7latencywaittime] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for Profile for Latency monitoring resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetICALatencyProfile -Name 'example' -L7latencyMaxNotifycount  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetICALatencyProfile -Name 'example' -L7latencyMaxNotifycount  -WhatIf
```

## PARAMETERS

### -Name
Name for the ICA latencyprofile.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Cannot be changed after the ICA latency profile is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica l7latencyprofile" or 'my ica l7latencyprofile').
Minimum length = 1

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

### -L7latencyMaxNotifycount
L7 Latency Max notify Count.
This is the upper limit on the number of notifications sent to the Insight Center within an interval where the Latency is above the threshold.
Default value: 5 Minimum value = 1 Maximum value = 65535

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

### -L7latencyMonItoring
Enable/Disable L7 Latency monitoring for L7 latency notifications.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -L7latencynotifyInterval
L7 Latency Notify Interval.
This is the interval at which the Citrix ADC sends out notifications to the Insight Center after the wait time has passed.
Default value: 20 Minimum value = 1 Maximum value = 65535

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

### -L7latencyThresholdFactor
L7 Latency threshold factor.
This is the factor by which the active latency should be greater than the minimum observed value to determine that the latency is high and may need to be reported.
Default value: 4 Minimum value = 2 Maximum value = 65535

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

### -L7latencywaittime
L7 Latency Wait time.
This is the time for which the Citrix ADC waits after the threshold is exceeded before it sends out a Notification to the Insight Center.
Default value: 20 Minimum value = 1 Maximum value = 65535

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

### -PassThru
Returns the updated resource after the operation completes.

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

