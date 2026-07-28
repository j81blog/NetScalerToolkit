---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateLimitIdentifier

## SYNOPSIS
Updates a NetScaler nslimitidentifier resource.

## SYNTAX

```
Invoke-NSUpdateLimitIdentifier [-Alertsintimeslice <Int32>] [-Limitidentifier] <String> [-LimitType <String>]
 [-MaxBandwidth <Int32>] [-Mode <String>] [-SelectorName <String>] [-Threshold <Int32>] [-Timealign <String>]
 [-Timeslice <Int32>] [-TrapSintimeslice <Int32>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for limit Identifier resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateLimitIdentifier -Limitidentifier 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateLimitIdentifier -Limitidentifier 'example' -WhatIf
```

## PARAMETERS

### -Alertsintimeslice
Number of appflow alerts to be sent in the timeslice configured.
A value of 0 indicates that alerts are disabled.
A value of 65535 indicates no limit on number of appflow alerts.
Default value: 65535 Minimum value = 0 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limitidentifier
Name for a rate limit identifier.
Must begin with an ASCII letter or underscore (_) character, and must consist only of ASCII alphanumeric or underscore characters.
Reserved words must not be used.

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

### -LimitType
Smooth or bursty request type.
* SMOOTH - When you want the permitted number of requests in a given interval of time to be spread evenly across the timeslice * BURSTY - When you want the permitted number of requests to exhaust the quota anytime within the timeslice.
This argument is needed only when the mode is set to REQUEST_RATE.
Mode TOKEN_RATE only supports BURSTY type.
Default value: BURSTY Possible values = BURSTY, SMOOTH

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

### -MaxBandwidth
Maximum bandwidth permitted, in kbps.
Minimum value = 0 Maximum value = 4294967287

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mode
Defines the type of traffic to be tracked.
* REQUEST_RATE - Tracks requests/timeslice.
* CONNECTION - Tracks active transactions.
* TOKEN_RATE - Tracks total input+output tokens/minute for LLM chat completions, Timeslice is fixed at 60000 ms, Useful on applications serving LLM services.
Examples 1.
To permit 20 requests in 10 ms and 2 traps in 10 ms: add limitidentifier limit_req -mode request_rate -limitType smooth -timeslice 1000 -Threshold 2000 -trapsInTimeSlice 200 2.
To permit 50 requests in 10 ms: set limitidentifier limit_req -mode request_rate -timeslice 1000 -Threshold 5000 -limitType smooth 3.
To permit 1 request in 40 ms: set limitidentifier limit_req -mode request_rate -timeslice 2000 -Threshold 50 -limitType smooth 4.
To permit 1 request in 200 ms and 1 trap in 130 ms: set limitidentifier limit_req -mode request_rate -timeslice 1000 -Threshold 5 -limitType smooth -trapsInTimeSlice 8 5.
To permit 5000 requests in 1000 ms and 200 traps in 1000 ms and 20 appflow alerts in 1000ms: set limitidentifier limit_req -mode request_rate -timeslice 1000 -Threshold 5000 -limitType BURSTY -trapsInTimeSlice 200 -alertsInTimeSlice 20 6.
To permit 100000 tokens in 60000 ms and 100 appflow alerts in 60000ms: set limitidentifier limit_tokens -mode token_rate -timeSlice 60000 -Threshold 100000 -limittype BURSTY -alertsInTimeSlice 100.
Default value: REQUEST_RATE Possible values = CONNECTION, REQUEST_RATE, TOKEN_RATE, NONE

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

### -SelectorName
Name of the rate limit selector.
If this argument is NULL, rate limiting will be applied on all traffic received by the virtual server or the Citrix ADC (depending on whether the limit identifier is bound to a virtual server or globally) without any filtering.
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

### -Threshold
Maximum number of requests that are allowed in the given timeslice when requests (mode is set as REQUEST_RATE) are tracked per timeslice.
When connections (mode is set as CONNECTION) are tracked, it is the total number of connections that would be let through.
Maximum number of tokens that are allowed in the given timeslice when Tokens (mode is set to TOKEN_RATE) are tracked per timeslice.
Default value: 1 Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timealign
Value MINUTE will align the time windows for a configured timeslice to Minute boundary.
TimeSlice values should be integrals of 60000ms when value MINUTE is choosen.
Default : NONE, timeslice alignments will happen with next 10ms.
Default value: NONE Possible values = NONE, MINUTE

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

### -Timeslice
Time interval, in milliseconds, specified in multiples of 10, during which requests/tokens are tracked to check if they cross the threshold.
This argument is needed only when the mode is set to REQUEST_RATE or TOKEN_RATE.
Default value: 1000 Minimum value = 10

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrapSintimeslice
Number of traps to be sent in the timeslice configured.
A value of 0 indicates that traps are disabled.
Minimum value = 0 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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

