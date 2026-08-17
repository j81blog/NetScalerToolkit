---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetNsvpxparam

## SYNOPSIS
Clears one or more NetScaler nsvpxparam resource properties.

## SYNTAX

```
Invoke-NSUnsetNsvpxparam [-Cpuyield] [-KvmvirtioMultiQueue] [-Masterclockcpu1] [-Ownernode]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for "VPX" resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetNsvpxparam -Cpuyield DEFAULT -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetNsvpxparam -Cpuyield DEFAULT -WhatIf
```

## PARAMETERS

### -Cpuyield
This setting applicable in virtual appliances, is to affect the cpu yield(relinquishing the cpu resources) in any hypervised environment.
* There are 3 options for the behavior: 1.
YES - Allow the Virtual Appliance to yield its vCPUs periodically, if there is no data traffic.
2.
NO - Virtual Appliance will not yield the vCPU.
3.
DEFAULT - Restores the default behaviour, according to the license.
* Its behavior in different scenarios: 1.
As this setting is node specific only, it will not be propagated to other nodes, when executed on Cluster(CLIP) and HA(Primary).
2.
In cluster setup, use '-ownerNode' to specify ID of the cluster node.
3.
This setting is a system wide implementation and not granular to vCPUs.
4.
No effect on the management PE.
Default value: DEFAULT Possible values = DEFAULT, YES, NO

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

### -KvmvirtioMultiQueue
This setting applicable on KVM VPX with virtio NICs, is to configure multiple queues for all virtio interfaces.
* There are 2 options for this behavior: 1.
YES - Allows VPX to use multiple queues for each virtio interface as configured through the KVM Hypervisor.
2.
NO - Each virtio interface within VPX will use a single queue for transmit and receive.
* Its behavior in different scenarios: 1.
As this setting is node specific only, it will not be propagated to other nodes, when executed on Cluster(CLIP) and HA(Primary).
2.
In cluster setup, use '-ownerNode' to specify ID of the cluster node.
Default value: NO Possible values = YES, NO

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

### -Masterclockcpu1
This argument is deprecated.
Possible values = YES, NO

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

### -Ownernode
ID of the cluster node for which you are setting the cpuyield and/or KVMVirtioMultiqueue.
It can be configured only through the cluster IP address.
Default value: 255 Minimum value = 0 Maximum value = 31

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
Position: 1
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

