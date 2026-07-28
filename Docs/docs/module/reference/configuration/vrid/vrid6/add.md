---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddVrid6

## SYNOPSIS
Creates a NetScaler vrid6 resource.

## SYNTAX

```
Invoke-NSAddVrid6 [-Id] <Int32> [-Ownernode <Int32>] [-Preemption <String>] [-Preemptiondelaytimer <Int32>]
 [-Priority <Int32>] [-Sharing <String>] [-TrackifnumPriority <Int32>] [-Tracking <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Virtual Router ID for IPv6 resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddVrid6 -Id 1 -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddVrid6 -Id 1 -WhatIf
```

## PARAMETERS

### -Id
Integer value that uniquely identifies a VMAC6 address.
Minimum value = 1 Maximum value = 255

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ownernode
In a cluster setup, assign a cluster node as the owner of this VMAC address for IP based VRRP configuration.
If no owner is configured, ow ner node is displayed as ALL and one node is dynamically elected as the owner.
Minimum value = 0 Maximum value = 31

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

### -Preemption
In an active-active mode configuration, make a backup VIP address the master if its priority becomes higher than that of a master VIP address bound to this VMAC address.
If you disable pre-emption while a backup VIP address is the master, the backup VIP address remains master until the original master VIP's priority becomes higher than that of the current master.
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

### -Preemptiondelaytimer
Preemption delay time in seconds, in an active-active configuration.
If any high priority node will come in network, it will wait for these many seconds before becoming master.
Default value: 0 Minimum value = 1 Maximum value = 36000

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

### -Priority
Base priority (BP), in an active-active mode configuration, which ordinarily determines the master VIP address.
Default value: 255 Minimum value = 0 Maximum value = 255

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

### -Sharing
In an active-active mode configuration, enable the backup VIP address to process any traffic instead of dropping it.
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

### -TrackifnumPriority
Priority by which the Effective priority will be reduced if any of the tracked interfaces goes down in an active-active configuration.
Default value: 0 Minimum value = 1 Maximum value = 255

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

### -Tracking
The effective priority (EP) value, relative to the base priority (BP) value in an active-active mode configuration.
When EP is set to a value other than None, it is EP, not BP, which determines the master VIP address.
Available settings function as follows: * NONE - No tracking.
EP = BP * ALL - If the status of all virtual servers is UP, EP = BP.
Otherwise, EP = 0.
* ONE - If the status of at least one virtual server is UP, EP = BP.
Otherwise, EP = 0.
* PROGRESSIVE - If the status of all virtual servers is UP, EP = BP.
If the status of all virtual servers is DOWN, EP = 0.
Otherwise EP = BP (1 - K/N), where N is the total number of virtual servers associated with the VIP address and K is the number of virtual servers for which the status is DOWN.
Default: NONE.
Default value: NONE Possible values = NONE, ONE, ALL, PROGRESSIVE

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

