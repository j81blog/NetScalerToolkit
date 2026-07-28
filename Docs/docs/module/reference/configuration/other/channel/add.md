---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddChannel

## SYNOPSIS
Creates a NetScaler channel resource.

## SYNTAX

```
Invoke-NSAddChannel [-Bandwidthhigh <Int32>] [-Bandwidthnormal <Int32>] [-ConnDistr <String>]
 [-Flowctl <String>] [-Haheartbeat <String>] [-HaMonItor <String>] [-Id] <String> [-Ifalias <String>]
 [-Ifnum <String[]>] [-Lamac <String>] [-Macdistr <String>] [-Mode <String>] [-Speed <String>]
 [-State <String>] [-Tagall <String>] [-Throughput <Int32>] [-Trunk <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for channel resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddChannel -Id 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddChannel -Id 'example' -WhatIf
```

## PARAMETERS

### -Bandwidthhigh
High threshold value for the bandwidth usage of the LA channel, in Mbps.
The Citrix ADC generates an SNMP trap message when the bandwidth usage of the LA channel is greater than or equal to the specified high threshold value.
Minimum value = 0 Maximum value = 500000

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

### -Bandwidthnormal
Normal threshold value for the bandwidth usage of the LA channel, in Mbps.
When the bandwidth usage of the LA channel returns to less than or equal to the specified normal threshold after exceeding the high threshold, the Citrix ADC generates an SNMP trap message to indicate that the bandwidth usage has returned to normal.
Minimum value = 0 Maximum value = 500000

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

### -ConnDistr
The 'connection' distribution mode for the LA channel.
Possible values = DISABLED, ENABLED

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

### -Flowctl
Specifies the flow control type for this LA channel to manage the flow of frames.
Flow control is a function as mentioned in clause 31 of the IEEE 802.3 standard.
Flow control allows congested ports to pause traffic from the peer device.
Flow control is achieved by sending PAUSE frames.
Default value: OFF Possible values = OFF, RX, TX, RXTX, ON

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

### -Haheartbeat
In a High Availability (HA) configuration, configure the LA channel for sending heartbeats.
LA channel that has HA Heartbeat disabled should not send the heartbeats.
Default value: ON Possible values = OFF, ON

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

### -HaMonItor
In a High Availability (HA) configuration, monitor the LA channel for failure events.
Failure of any LA channel that has HA MON enabled triggers HA failover.
Default value: ON Possible values = ON, OFF

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

### -Id
ID for the LA channel or cluster LA channel or LR channel to be created.
Specify an LA channel in LA/x notation, where x can range from 1 to 8 or cluster LA channel in CLA/x notation or Link redundant channel in LR/x notation, where x can range from 1 to 4.
Cannot be changed after the LA channel is created.

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

### -Ifalias
Alias name for the LA channel.
Used only to enhance readability.
To perform any operations, you have to specify the LA channel ID.
Default value: " " Maximum length = 31

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

### -Ifnum
Interfaces to be bound to the LA channel of a Citrix ADC or to the LA channel of a cluster configuration.
For an LA channel of a Citrix ADC, specify an interface in C/U notation (for example, 1/3).
For an LA channel of a cluster configuration, specify an interface in N/C/U notation (for example, 2/1/3).
where C can take one of the following values: * 0 - Indicates a management interface.
* 1 - Indicates a 1 Gbps port.
* 10 - Indicates a 10 Gbps port.
U is a unique integer for representing an interface in a particular port group.
N is the ID of the node to which an interface belongs in a cluster configuration.
Use spaces to separate multiple entries.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Lamac
Specifies a MAC address for the LA channels configured in Citrix ADC virtual appliances (VPX).
This MAC address is persistent after each reboot.
If you don't specify this parameter, a MAC address is generated randomly for each LA channel.
These MAC addresses change after each reboot.

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

### -Macdistr
The 'MAC' distribution mode for the LA channel.
Possible values = SOURCE, DESTINATION, BOTH

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

### -Mode
The initital mode for the LA channel.
Possible values = MANUAL, AUTO

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

### -Speed
Ethernet speed of the channel, in Mbps.
If the speed of any bound interface is greater than or equal to the value set for this parameter, the state of the interface is UP.
Otherwise, the state is INACTIVE.
Bound Interfaces whose state is INACTIVE do not process any traffic.
Default value: AUTO Possible values = AUTO, 10, 100, 1000, 10000, 25000, 40000, 50000, 100000, 200000

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

### -State
Enable or disable the LA channel.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Tagall
Adds a four-byte 802.1q tag to every packet sent on this channel.
The ON setting applies tags for all VLANs that are bound to this channel.
OFF applies the tag for all VLANs other than the native VLAN.
Default value: OFF Possible values = ON, OFF

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

### -Throughput
Low threshold value for the throughput of the LA channel, in Mbps.
In an high availability (HA) configuration, failover is triggered when the LA channel has HA MON enabled and the throughput is below the specified threshold.
Minimum value = 0 Maximum value = 500000

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

### -Trunk
This is deprecated by tagall.
Default value: OFF Possible values = ON, OFF

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

