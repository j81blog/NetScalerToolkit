---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddStreamIdentifier

## SYNOPSIS
Creates a NetScaler streamidentifier resource.

## SYNTAX

```
Invoke-NSAddStreamIdentifier [-AcceptanceThreshold <String>] [-AppFlowLog <String>] [-BreachThreshold <Int32>]
 [-Interval <Int32>] [-Log <String>] [-LoginTerval <Int32>] [-Loglimit <Int32>]
 [-MaxTransActionThreshold <Int32>] [-MinTransActionThreshold <Int32>] [-Name] <String> [-Samplecount <Int32>]
 -SelectorName <String> [-SNMPTrap <String>] [-Sort <String>] [-Trackackonlypackets <String>]
 [-TracktransActionS <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for identifier resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddStreamIdentifier -Name 'example' -SelectorName 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddStreamIdentifier -Name 'example' -SelectorName 'example' -WhatIf
```

## PARAMETERS

### -AcceptanceThreshold
Non-Breaching transactions to Total transactions threshold expressed in percent.
Maximum of 6 decimal places is supported.
Default value: 0.000000 Maximum length = 10

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

### -AppFlowLog
Enable/disable Appflow logging for stream identifier.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -BreachThreshold
Breaching transactions threshold calculated over interval.
Default value: 0

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

### -Interval
Number of minutes of data to use when calculating session statistics (number of requests, bandwidth, and response times).
The interval is a moving window that keeps the most recently collected data.
Older data is discarded at regular intervals.
Default value: 1 Minimum value = 1 Maximum value = 10080

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

### -Log
Location where objects collected on the identifier will be logged.
Default value: NONE Possible values = SYSLOG, NONE

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

### -LoginTerval
Time interval in minutes for logging the collected objects.
Log interval should be greater than or equal to the inteval of the stream identifier.
Default value: 5 Minimum value = 1 Maximum value = 10080

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

### -Loglimit
Maximum number of objects to be logged in the log interval.
Default value: 100 Minimum value = 1 Maximum value = 1000

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

### -MaxTransActionThreshold
Maximum per transcation value of metric.
Metric to be tracked is specified by tracktransactions attribute.
Default value: 0

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

### -MinTransActionThreshold
Minimum per transcation value of metric.
Metric to be tracked is specified by tracktransactions attribute.
Default value: 0

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

### -Name
The name of stream identifier.

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

### -Samplecount
Size of the sample from which to select a request for evaluation.
The smaller the sample count, the more accurate is the statistical data.
To evaluate all requests, set the sample count to 1.
However, such a low setting can result in excessive consumption of memory and processing resources.
Default value: 1 Minimum value = 1 Maximum value = 65535

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

### -SelectorName
Name of the selector to use with the stream identifier.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SNMPTrap
Enable/disable SNMP trap for stream identifier.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Sort
Sort stored records by the specified statistics column, in descending order.
Performed during data collection, the sorting enables real-time data evaluation through Citrix ADC policies (for example, compression and caching policies) that use functions such as IS_TOP(n).
Default value: REQUESTS Possible values = REQUESTS, CONNECTIONS, RESPTIME, BANDWIDTH, RESPTIME_BREACHES, NONE

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

### -Trackackonlypackets
Track ack only packets as well.
This setting is applicable only when packet rate limiting is being used.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -TracktransActionS
Track transactions exceeding configured threshold.
Transaction tracking can be enabled for following metric: ResponseTime.
By default transaction tracking is disabled.
Default value: NONE Possible values = RESPTIME, NONE

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

