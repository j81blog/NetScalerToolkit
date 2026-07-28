---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetGSLBParameter

## SYNOPSIS
Clears one or more NetScaler gslbparameter resource properties.

## SYNTAX

```
Invoke-NSUnsetGSLBParameter [-Automaticconfigsync] [-DroplDNSReq] [-GSLBConfigsyncMonItor]
 [-GSLBSvcstatedelaytime] [-GSLBSyncInterval] [-GSLBSynclocFileS] [-GSLBSyncMode] [-GSLBSyncsaveconfigcommand]
 [-LDNSEntryTimeout] [-LDNSMask] [-LDNSProbeOrder] [-MepkeepaliveTimeout] [-Rtttolerance]
 [-Sourceipwhitelisting] [-SvcstateLearningTime] [-UndefAction] [-Usekrpcchannelforsync] [-V6lDNSMaskLen]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for GSLB parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetGSLBParameter -Automaticconfigsync ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetGSLBParameter -Automaticconfigsync ENABLED -WhatIf
```

## PARAMETERS

### -Automaticconfigsync
GSLB configuration will be synced automatically to remote gslb sites if enabled.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -DroplDNSReq
Drop LDNS requests if round-trip time (RTT) information is not available.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -GSLBConfigsyncMonItor
If enabled, remote gslb site's rsync port will be monitored and site is considered for configuration sync only when the monitor is successful.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -GSLBSvcstatedelaytime
Amount of delay in updating the state of GSLB service to DOWN when MEP goes down.
This parameter is applicable only if monitors are not bound to GSLB services.
Default value: 0 Minimum value = 0 Maximum value = 3600

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

### -GSLBSyncInterval
Time duartion (in seconds) for which the gslb sync process will wait before checking for config changes.
Default value: 10 Minimum value = 1

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

### -GSLBSynclocFileS
If disabled, Location files will not be synced to the remote sites as part of manual sync and automatic sync.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -GSLBSyncMode
Mode in which configuration will be synced from master site to remote sites.
Default value: IncrementalSync Possible values = IncrementalSync, FullSync

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

### -GSLBSyncsaveconfigcommand
If enabled, 'save ns config' command will be treated as other GSLB commands and synced to GSLB nodes when auto gslb sync option is enabled.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -LDNSEntryTimeout
Time, in seconds, after which an inactive LDNS entry is removed.
Default value: 180 Minimum value = 30 Maximum value = 65534

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

### -LDNSMask
The IPv4 network mask with which to create LDNS entries.
Minimum length = 1

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

### -LDNSProbeOrder
Order in which monitors should be initiated to calculate RTT.
Possible values = PING, DNS, TCP

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

### -MepkeepaliveTimeout
Time duartion (in seconds) during which if no new packets received by Local gslb site from Remote gslb site then mark the MEP connection DOWN.
Default value: 10 Minimum value = 1

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

### -Rtttolerance
Tolerance, in milliseconds, for newly learned round-trip time (RTT) values.
If the difference between the old RTT value and the newly computed RTT value is less than or equal to the specified tolerance value, the LDNS entry in the network metric table is not updated with the new RTT value.
Prevents the exchange of metrics when variations in RTT values are negligible.
Default value: 5 Minimum value = 1 Maximum value = 100

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

### -Sourceipwhitelisting
If enabled, local gslb site private IP would be used as the source IP while initiating MEP/GSLB sync connection if srcIP is not configured for GSLB site.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -SvcstateLearningTime
Time (in seconds) within which local or child site services remain in learning phase.
GSLB site will enter the learning phase after reboot, HA failover, Cluster GSLB owner node changes or MEP being enabled on local node.
Backup parent (if configured) will selectively move the adopted children's GSLB services to learning phase when primary parent goes down.
While a service is in learning period, remote site will not honour the state and stats got through MEP for that service.
State can be learnt from health monitor if bound explicitly.
Default value: 0 Minimum value = 0 Maximum value = 3600

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

### -UndefAction
Action to perform when policy evaluation creates an UNDEF condition.
Available settings function as follows: * NOLBACTION - Does not consider LB action in making LB decision.
* RESET - Reset the request and notify the user, so that the user can resend the request.
* DROP - Drop the request without sending a response to the user.
Default value: "NOLBACTION"

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

### -Usekrpcchannelforsync
This option is to use Krpc channel for GSLB sync.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -V6lDNSMaskLen
Mask for creating LDNS entries for IPv6 source addresses.
The mask is defined as the number of leading bits to consider, in the source IP address, when creating an LDNS entry.
Default value: 128 Minimum value = 1 Maximum value = 128

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

