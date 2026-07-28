---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateIcaparameter

## SYNOPSIS
Updates a NetScaler icaparameter resource.

## SYNTAX

```
Invoke-NSUpdateIcaparameter [[-DfPersistence] <String>] [[-Edtlosstolerant] <String>] [[-Edtpmtuddf] <String>]
 [[-EdtpmtuddfTimeout] <Int32>] [[-Edtpmtudrediscovery] <String>] [[-EnablesronhaFailover] <String>]
 [[-Hdxinsightnonnsap] <String>] [[-Insightonlytodirector] <String>] [[-L7latencyfrequency] <Int32>]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Config Parameters for NS ICA resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateIcaparameter  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateIcaparameter  -WhatIf
```

## PARAMETERS

### -DfPersistence
Enable/Disable DF Persistence.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Edtlosstolerant
Enable/Disable EDT Loss Tolerant feature.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Edtpmtuddf
Enable/Disable DF enforcement for EDT PMTUD Control Blocks.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EdtpmtuddfTimeout
DF enforcement timeout for EDTPMTUDDF.
Default value: 100 Minimum value = 10 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Edtpmtudrediscovery
Enable/Disable EDT PMTUD Rediscovery.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnablesronhaFailover
Enable/Disable Session Reliability on HA failover.
The default value is No.
Default value: NO Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hdxinsightnonnsap
Enable/Disable HDXInsight for Non NSAP ICA Sessions.
The default value is Yes.
Default value: YES Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Insightonlytodirector
Enable/Disable HDX Insight data to Director even if HDX Insight policy is not configured on Gateway and Network Telemtry policy is enabled on VDA.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -L7latencyfrequency
Specify the time interval/period for which L7 Client Latency value is to be calculated.
By default, L7 Client Latency is calculated for every packet.
The default value is 0.
Default value: 0 Minimum value = 0 Maximum value = 60

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
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
Position: 10
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

