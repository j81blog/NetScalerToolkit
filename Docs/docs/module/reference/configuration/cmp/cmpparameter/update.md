---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateCMPParameter

## SYNOPSIS
Updates a NetScaler cmpparameter resource.

## SYNTAX

```
Invoke-NSUpdateCMPParameter [[-AddvaryHeader] <String>] [[-CMPBypassPct] <Int32>] [[-CMPLevel] <String>]
 [[-CMPOnpush] <String>] [[-Externalcache] <String>] [[-Heurexpiry] <String>] [[-Heurexpiryhistwt] <Int32>]
 [[-Heurexpirythres] <Int32>] [[-MinRessize] <Int32>] [[-PolicyType] <String>] [[-Quantumsize] <Int32>]
 [[-RandomgzipFileName] <String>] [[-RandomgzipFileNameMaxLength] <Int32>]
 [[-RandomgzipFileNameMinLength] <Int32>] [[-ServerCMP] <String>] [[-VaryHeaderValue] <String>]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for CMP parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateCMPParameter  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateCMPParameter  -WhatIf
```

## PARAMETERS

### -AddvaryHeader
Control insertion of the Vary header in HTTP responses compressed by Citrix ADC.
Intermediate caches store different versions of the response for different values of the headers present in the Vary response header.
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

### -CMPBypassPct
Citrix ADC CPU threshold after which compression is not performed.
Range: 0 - 100.
Default value: 100 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CMPLevel
Specify a compression level.
Available settings function as follows: * Optimal - Corresponds to a gzip GZIP level of 5-7.
* Best speed - Corresponds to a gzip level of 1.
* Best compression - Corresponds to a gzip level of 9.
Default value: optimal Possible values = optimal, bestspeed, bestcompression

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

### -CMPOnpush
Citrix ADC does not wait for the quantum to be filled before starting to compress data.
Upon receipt of a packet with a PUSH flag, the appliance immediately begins compression of the accumulated packets.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Externalcache
Enable insertion of Cache-Control: private response directive to indicate response message is intended for a single user and must not be cached by a shared or proxy cache.
Default value: NO Possible values = YES, NO

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

### -Heurexpiry
Heuristic basefile expiry.
Default value: OFF Possible values = ON, OFF

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

### -Heurexpiryhistwt
For heuristic basefile expiry, weightage to be given to historical delta compression ratio, specified as percentage.
For example, to give 25% weightage to historical ratio (and therefore 75% weightage to the ratio for current delta compression transaction), specify 25.
Default value: 50 Minimum value = 1 Maximum value = 100

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

### -Heurexpirythres
Threshold compression ratio for heuristic basefile expiry, multiplied by 100.
For example, to set the threshold ratio to 1.25, specify 125.
Default value: 100 Minimum value = 1 Maximum value = 1000

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

### -MinRessize
Smallest response size, in bytes, to be compressed.

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

### -PolicyType
Type of the policy.
The only possible value is ADVANCED.
Default value: ADVANCED Possible values = ADVANCED

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

### -Quantumsize
Minimum quantum of data to be filled before compression begins.
Default value: 57344 Minimum value = 8 Maximum value = 63488

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -RandomgzipFileName
Control the addition of a random filename of random length in the GZIP header to apply the Heal-the-BREACH mitigation for the BREACH attack.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -RandomgzipFileNameMaxLength
Maximum length of the random filename to be added in the GZIP header to apply the Heal-the-BREACH mitigation for the BREACH attack.
Default value: 63 Minimum value = 8 Maximum value = 63

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -RandomgzipFileNameMinLength
Minimum length of the random filename to be added in the GZIP header to apply the Heal-the-BREACH mitigation for the BREACH attack.
Default value: 8 Minimum value = 8 Maximum value = 63

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServerCMP
Allow the server to send compressed data to the Citrix ADC.
With the default setting, the Citrix ADC appliance handles all compression.
Default value: ON Possible values = ON, OFF

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

### -VaryHeaderValue
The value of the HTTP Vary header for compressed responses.
If this argument is not specified, a default value of "Accept-Encoding" will be used.
Minimum length = 1

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

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
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

