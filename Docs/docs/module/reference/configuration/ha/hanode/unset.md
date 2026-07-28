---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetHANode

## SYNOPSIS
Clears one or more NetScaler hanode resource properties.

## SYNTAX

```
Invoke-NSUnsetHANode [-Id] <Int32> [-DeadInterval] [-Failsafe] [-Haprop] [-Hastatus] [-Hasync] [-HelloInterval]
 [-MaxFlips] [-MaxFliptime] [-SyncstatusstrictMode] [-Syncvlan] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for node resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetHANode -Id 1 -DeadInterval  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetHANode -Id 1 -DeadInterval  -WhatIf
```

## PARAMETERS

### -Id
Number that uniquely identifies the node.
For self node, it will always be 0.
Peer node values can range from 1-64.
Minimum value = 1 Maximum value = 64

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DeadInterval
Number of seconds after which a peer node is marked DOWN if heartbeat messages are not received from the peer node.
Default value: 3 Minimum value = 3 Maximum value = 60

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

### -Failsafe
Keep one node primary if both nodes fail the health check, so that a partially available node can back up data and handle traffic.
This mode is set independently on each node.
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

### -Haprop
Automatically propagate all commands from the primary to the secondary node, except the following: * All HA configuration related commands.
For example, add ha node, set ha node, and bind ha node.
* All Interface related commands.
For example, set interface and unset interface.
* All channels related commands.
For example, add channel, set channel, and bind channel.
The propagated command is executed on the secondary node before it is executed on the primary.
If command propagation fails, or if command execution fails on the secondary, the primary node executes the command and logs an error.
Command propagation uses port 3010.
Note: After enabling propagation, run force synchronization on either node.
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

### -Hastatus
The HA status of the node.
The HA status STAYSECONDARY is used to force the secondary device stay as secondary independent of the state of the Primary device.
For example, in an existing HA setup, the Primary node has to be upgraded and this process would take few seconds.
During the upgradation, it is possible that the Primary node may suffer from a downtime for a few seconds.
However, the Secondary should not take over as the Primary node.
Thus, the Secondary node should remain as Secondary even if there is a failure in the Primary node.
STAYPRIMARY configuration keeps the node in primary state in case if it is healthy, even if the peer node was the primary node initially.
If the node with STAYPRIMARY setting (and no peer node) is added to a primary node (which has this node as the peer) then this node takes over as the new primary and the older node becomes secondary.
ENABLED state means normal HA operation without any constraints/preferences.
DISABLED state disables the normal HA operation of the node.
Possible values = ENABLED, STAYSECONDARY, DISABLED, STAYPRIMARY

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

### -Hasync
Automatically maintain synchronization by duplicating the configuration of the primary node on the secondary node.
This setting is not propagated.
Automatic synchronization requires that this setting be enabled (the default) on the current secondary node.
Synchronization uses TCP port 3010.
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

### -HelloInterval
Interval, in milliseconds, between heartbeat messages sent to the peer node.
The heartbeat messages are UDP packets sent to port 3003 of the peer node.
Default value: 200 Minimum value = 200 Maximum value = 1000

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

### -MaxFlips
Max number of flips allowed before becoming sticky primary.
Default value: 0

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

### -MaxFliptime
Interval after which flipping of node states can again start.
Default value: 0

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

### -SyncstatusstrictMode
strict mode flag for sync status.
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

### -Syncvlan
Vlan on which HA related communication is sent.
This include sync, propagation , connection mirroring , LB persistency config sync, persistent session sync and session state sync.
However HA heartbeats can go all interfaces.
Minimum value = 1 Maximum value = 4094

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

