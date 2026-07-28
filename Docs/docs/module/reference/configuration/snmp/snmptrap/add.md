---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddSNMPTrap

## SYNOPSIS
Creates a NetScaler snmptrap resource.

## SYNTAX

```
Invoke-NSAddSNMPTrap [-AllPartitionS <String>] [-CommUnitYName <String>] [-DestPort <Int32>]
 [-Severity <String>] [-Srcip <String>] [-TrafficDomain <Int32>] [-TrapClass] <String>
 -TrapDestination <String> [-Version <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for snmp trap resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddSNMPTrap -TrapClass generic -TrapDestination 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddSNMPTrap -TrapClass generic -TrapDestination 'example' -WhatIf
```

## PARAMETERS

### -AllPartitionS
Send traps of all partitions to this destination.
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

### -CommUnitYName
Password (string) sent with the trap messages, so that the trap listener can authenticate them.
Can include 1 to 32 uppercase or lowercase letters, numbers, and hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters.
You must specify the same community string on the trap listener device.
Otherwise, the trap listener drops the trap messages.
The following requirement applies only to the Citrix ADC CLI: If the string includes one or more spaces, enclose the name in double or single quotation marks (for example, "my string" or 'my string').

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

### -DestPort
UDP port at which the trap listener listens for trap messages.
This setting must match the setting on the trap listener.
Otherwise, the listener drops the trap messages.
Default value: 162 Minimum value = 1 Maximum value = 65534

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

### -Severity
Severity level at or above which the Citrix ADC sends trap messages to this trap listener.
The severity levels, in increasing order of severity, are Informational, Warning, Minor, Major, Critical.
This parameter can be set for trap listeners of type SPECIFIC only.
The default is to send all levels of trap messages.
Important: Trap messages are not assigned severity levels unless you specify severity levels when configuring SNMP alarms.
Default value: Unknown Possible values = Critical, Major, Minor, Warning, Informational

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

### -Srcip
IPv4 or IPv6 address that the Citrix ADC inserts as the source IP address in all SNMP trap messages that it sends to this trap listener.
By default this is the appliance's NSIP or NSIP6 address, but you can specify an IPv4 MIP or SNIP/SNIP6 address.
In cluster setup, the default value is the individual node's NSIP, but it can be set to CLIP or Striped SNIP address.
In non default partition, this parameter must be set to the SNIP/SNIP6 address.
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

### -TrafficDomain
Integer value that uniquely identifies the traffic domain in which you want to configure the entity.
If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0.
Minimum value = 0 Maximum value = 4094

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

### -TrapClass
Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file.
Possible values = generic, specific

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

### -TrapDestination
IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages.
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

### -Version
SNMP version, which determines the format of trap messages sent to the trap listener.
This setting must match the setting on the trap listener.
Otherwise, the listener drops the trap messages.
Default value: V2 Possible values = V1, V2, V3

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

