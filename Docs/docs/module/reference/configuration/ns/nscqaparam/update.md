---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateNscqaparam

## SYNOPSIS
Updates a NetScaler nscqaparam resource.

## SYNTAX

```
Invoke-NSUpdateNscqaparam [[-Harqretxdelay] <Int32>] [[-Lr1coeflist] <String>] [[-Lr1probthresh] <Double>]
 [[-Lr2coeflist] <String>] [[-Lr2probthresh] <Double>] [[-MinRttnet1] <Int32>] [[-MinRttnet2] <Int32>]
 [[-MinRttnet3] <Int32>] [[-Net1cclscale] <String>] [[-Net1csqscale] <String>] [[-Net1Label] <String>]
 [[-Net1logcoef] <String>] [[-Net2cclscale] <String>] [[-Net2csqscale] <String>] [[-Net2Label] <String>]
 [[-Net2logcoef] <String>] [[-Net3cclscale] <String>] [[-Net3csqscale] <String>] [[-Net3Label] <String>]
 [[-Net3logcoef] <String>] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for cqaparam resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateNscqaparam  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateNscqaparam  -WhatIf
```

## PARAMETERS

### -Harqretxdelay
HARQ retransmission delay (in ms).
Default value: 0 Minimum value = 1 Maximum value = 64000

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Lr1coeflist
coefficients values for Label1.

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

### -Lr1probthresh
Probability threshold values for LR model to differentiate between NET1 and reset(NET2 and NET3).
Default value: 0 Minimum value = 0 Maximum value = 1

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Lr2coeflist
coefficients values for Label 2.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Lr2probthresh
Probability threshold values for LR model to differentiate between NET2 and NET3.
Default value: 0 Minimum value = 0 Maximum value = 1

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinRttnet1
MIN RTT (in ms) for the first network.
Default value: 0 Minimum value = 0 Maximum value = 6400

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinRttnet2
MIN RTT (in ms) for the second network.
Default value: 0 Minimum value = 0 Maximum value = 6400

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinRttnet3
MIN RTT (in ms) for the third network.
Default value: 0 Minimum value = 0 Maximum value = 6400

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net1cclscale
Three congestion level scores limits corresponding to None, Low, Medium.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net1csqscale
Three signal quality level scores limits corresponding to Excellent, Good, Fair.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net1Label
Name of the network label.
Maximum length = 15

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net1logcoef
Connection quality ranking Log coefficients of network 1.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net2cclscale
Three congestion level scores limits corresponding to None, Low, Medium.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net2csqscale
Three signal quality level scores limits corresponding to Excellent, Good, Fair.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net2Label
Name of the network label 2.
Maximum length = 15

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net2logcoef
Connnection quality ranking Log coefficients of network 2.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net3cclscale
Three congestion level scores limits corresponding to None, Low, Medium.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net3csqscale
Three signal quality level scores limits corresponding to Excellent, Good, Fair.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net3Label
Name of the network label 3.
Maximum length = 15

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Net3logcoef
Connection quality ranking Log coefficients of network 3.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
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
Position: 21
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

