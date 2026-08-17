---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetInterface

## SYNOPSIS
Clears one or more NetScaler Interface resource properties.

## SYNTAX

```
Invoke-NSUnsetInterface [-Id] <String> [-Autoneg] [-Bandwidthhigh] [-Bandwidthnormal] [-Duplex] [-Flowctl]
 [-Haheartbeat] [-HaMonItor] [-Ifalias] [-LacpMode] [-LacpPriority] [-LacpTimeout] [-Linkredundancy]
 [-LldpMode] [-LrsetPriority] [-Mtu] [-Ringsize] [-RingType] [-Speed] [-Tagall] [-Throughput] [-Trunk]
 [-Trunkallowedvlan] [-TrunkMode] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for interface resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetInterface -Id 'example' -Autoneg DISABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetInterface -Id 'example' -Autoneg DISABLED -WhatIf
```

## PARAMETERS

### -Id
Interface number, in C/U format, where C can take one of the following values: * 0 - Indicates a management interface.
* 1 - Indicates a 1 Gbps port.
* 10 - Indicates a 10 Gbps port.
* LA - Indicates a link aggregation port.
* LO - Indicates a loop back port.
U is a unique integer for representing an interface in a particular port group.

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

### -Autoneg
Auto-negotiation state of the interface.
With the ENABLED setting, the Citrix ADC auto-negotiates the speed and duplex settings with the peer network device on the link.
The Citrix ADC appliance auto-negotiates the settings of only those parameters (speed or duplex mode) for which the value is set as AUTO.
Default value: NSA_DVC_AUTONEG_ON Possible values = DISABLED, ENABLED

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

### -Bandwidthhigh
High threshold value for the bandwidth usage of the interface, in Mbps.
The Citrix ADC generates an SNMP trap message when the bandwidth usage of the interface is greater than or equal to the specified high threshold value.
Minimum value = 0 Maximum value = 500000

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

### -Bandwidthnormal
Normal threshold value for the bandwidth usage of the interface, in Mbps.
When the bandwidth usage of the interface becomes less than or equal to the specified normal threshold after exceeding the high threshold, the Citrix ADC generates an SNMP trap message to indicate that the bandwidth usage has returned to normal.
Minimum value = 0 Maximum value = 500000

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

### -Duplex
The duplex mode for the interface.
Notes:* If you set the duplex mode to AUTO, the Citrix ADC attempts to auto-negotiate the duplex mode of the interface when it is UP.
You must enable auto negotiation on the interface.
If you set a duplex mode other than AUTO, you must specify the same duplex mode for the peer network device.
Mismatched speed and duplex settings between the peer devices of a link lead to link errors, packet loss, and other errors.
Default value: AUTO Possible values = AUTO, HALF, FULL

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

### -Flowctl
802.3x flow control setting for the interface.
The 802.3x specification does not define flow control for 10 Mbps and 100 Mbps speeds, but if a Gigabit Ethernet interface operates at those speeds, the flow control settings can be applied.
The flow control setting that is finally applied to an interface depends on auto-negotiation.
With the ON option, the peer negotiates the flow control, but the appliance then forces two-way flow control for the interface.
Default value: OFF Possible values = OFF, RX, TX, RXTX, ON

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

### -Haheartbeat
In a High Availability (HA) or Cluster configuration, configure the interface for sending heartbeats.
In an HA or Cluster configuration, an interface that has HA Heartbeat disabled should not send the heartbeats.
Default value: ON Possible values = OFF, ON

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

### -HaMonItor
In a High Availability (HA) configuration, monitor the interface for failure events.
In an HA configuration, an interface that has HA MON enabled and is not bound to any Failover Interface Set (FIS), is a critical interface.
Failure or disabling of any critical interface triggers HA failover.
Default value: ON Possible values = ON, OFF

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

### -Ifalias
Alias name for the interface.
Used only to enhance readability.
To perform any operations, you have to specify the interface ID.
Default value: " " Maximum length = 31

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

### -LacpMode
Bind the interface to a LA channel created by the Link Aggregation control protocol (LACP).
Available settings function as follows: * Active - The LA channel port of the Citrix ADC generates LACPDU messages on a regular basis, regardless of any need expressed by its peer device to receive them.
* Passive - The LA channel port of the Citrix ADC does not transmit LACPDU messages unless the peer device port is in the active mode.
That is, the port does not speak unless spoken to.
* Disabled - Unbinds the interface from the LA channel.
If this is the only interface in the LA channel, the LA channel is removed.
Default value: DISABLED Possible values = DISABLED, ACTIVE, PASSIVE

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

### -LacpPriority
LACP port priority, expressed as an integer.
The lower the number, the higher the priority.
The Citrix ADC limits the number of interfaces in an LA channel to sixteen.
Default value: 32768 Minimum value = 1 Maximum value = 65535

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

### -LacpTimeout
Interval at which the Citrix ADC sends LACPDU messages to the peer device on the LA channel.
Available settings function as follows: LONG - 30 seconds.
SHORT - 1 second.
Default value: NSA_LACP_TIMEOUT_LONG Possible values = LONG, SHORT

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

### -Linkredundancy
Link Redundancy for Cluster LAG.
Default value: OFF Possible values = ON, OFF

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

### -LldpMode
Link Layer Discovery Protocol (LLDP) mode for an interface.
The resultant LLDP mode of an interface depends on the LLDP mode configured at the global and the interface levels.
Possible values = NONE, TRANSMITTER, RECEIVER, TRANSCEIVER

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

### -LrsetPriority
LRSET port priority, expressed as an integer ranging from 1 to 1024.
The highest priority is 1.
The Citrix ADC limits the number of interfaces in an LRSET to 8.
Within a LRSET the highest LR Priority Interface is considered as the first candidate for the Active interface, if the interface is UP.
Default value: 1024 Minimum value = 1 Maximum value = 1024

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

### -Mtu
The Maximum Transmission Unit (MTU) is the largest packet size, measured in bytes excluding 14 bytes ethernet header and 4 bytes CRC, that can be transmitted and received by an interface.
The default value of MTU is 1500 on all the interface of Citrix ADC, some Cloud Platforms will restrict Citrix ADC to use the lesser default value.
Any MTU value more than 1500 is called Jumbo MTU and will make the interface as jumbo enabled.
The Maximum Jumbo MTU in Citrix ADC is 9216, however, some Virtualized / Cloud Platforms will have lesser Maximum Jumbo MTU Value (9000).
In the case of Cluster, the Backplane interface requires an MTU value of 78 bytes more than the Max MTU configured on any other Data-Plane Interface.
When the Data plane interfaces are all at default 1500 MTU, Cluster Back Plane will be automatically set to 1578 (1500 + 78) MTU.
If a Backplane interface is reset to Data Plane Interface, then the 1578 MTU will be automatically reset to the default MTU of 1500(or whatever lesser default value).
If any data plane interface of a Cluster is configured with a Jumbo MTU ( \> 1500), then all backplane interfaces require to be configured with a minimum MTU of 'Highest Data Plane MTU in the Cluster + 78'.
That makes the maximum Jumbo MTU for any Data-Plane Interface in a Cluster System to be '9138 (9216 - 78)., where 9216 is the maximum Jumbo MTU.
On certain Virtualized / Cloud Platforms, the maximum possible MTU is restricted to a lesser value, Similar calculation can be applied, Maximum Data Plane MTU in Cluster = (Maximum possible MTU - 78).
Default value: 1500 Minimum value = 1500 Maximum value = 9216

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

### -Ringsize
The receive ringsize of the interface.
A higher number provides more number of buffers in handling incoming traffic.
Default value: 2048 Minimum value = 512 Maximum value = 16384

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

### -RingType
The receive ringtype of the interface (Fixed or Elastic).
A fixed ring type pre-allocates configured number of buffers irrespective of traffic rate.
In contrast, an elastic ring, expands and shrinks based on incoming traffic rate.
Default value: Elastic Possible values = Elastic, Fixed

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

### -Speed
Ethernet speed of the interface, in Mbps.
Notes: * If you set the speed as AUTO, the Citrix ADC attempts to auto-negotiate or auto-sense the link speed of the interface when it is UP.
You must enable auto negotiation on the interface.
* If you set a speed other than AUTO, you must specify the same speed for the peer network device.
Mismatched speed and duplex settings between the peer devices of a link lead to link errors, packet loss, and other errors.
Some interfaces do not support certain speeds.
If you specify an unsupported speed, an error message appears.
Default value: AUTO Possible values = AUTO, 10, 100, 1000, 10000, 25000, 40000, 50000, 100000, 200000

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

### -Tagall
Add a four-byte 802.1q tag to every packet sent on this interface.
The ON setting applies the tag for this interface's native VLAN.
OFF applies the tag for all VLANs other than the native VLAN.
Default value: OFF Possible values = ON, OFF

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

### -Throughput
Low threshold value for the throughput of the interface, in Mbps.
In an HA configuration, failover is triggered if the interface has HA MON enabled and the throughput is below the specified the threshold.
Minimum value = 0 Maximum value = 500000

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

### -Trunk
This argument is deprecated by tagall.
Default value: OFF Possible values = ON, OFF

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

### -Trunkallowedvlan
VLAN ID or range of VLAN IDs will be allowed on this trunk interface.
In the command line interface, separate the range with a hyphen.
For example: 40-90.
Minimum length = 1 Maximum length = 4094

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

### -TrunkMode
Accept and send 802.1q VLAN tagged packets, based on Allowed Vlan List of this interface.
Default value: OFF Possible values = ON, OFF

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

