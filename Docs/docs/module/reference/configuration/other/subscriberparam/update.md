---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateSubscriberparam

## SYNOPSIS
Updates a NetScaler subscriberparam resource.

## SYNTAX

```
Invoke-NSUpdateSubscriberparam [[-IdleAction] <String>] [[-Idlettl] <Int32>] [[-InterfaceType] <String>]
 [[-IPv6Prefixlookuplist] <String>] [[-KeyType] <String>] [[-Session] <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Subscriber Params resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateSubscriberparam  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateSubscriberparam  -WhatIf
```

## PARAMETERS

### -IdleAction
q!Once idleTTL exprires on a subscriber session, Citrix ADC will take an idle action on that session.
idleAction could be chosen from one of these ==\> 1.
ccrTerminate: (default) send CCR-T to inform PCRF about session termination and delete the session.
2.
delete: Just delete the subscriber session without informing PCRF.
3.
ccrUpdate: Do not delete the session and instead send a CCR-U to PCRF requesting for an updated session.
!.
Default value: ccrTerminate Possible values = ccrTerminate, delete, ccrUpdate

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

### -Idlettl
q!Idle Timeout, in seconds, after which Citrix ADC will take an idleAction on a subscriber session (refer to 'idleAction' arguement in 'set subscriber param' for more details on idleAction).
Any data-plane or control plane activity updates the idleTimeout on subscriber session.
idleAction could be to 'just delete the session' or 'delete and CCR-T' (if PCRF is configured) or 'do not delete but send a CCR-U'.
Zero value disables the idle timeout.
!.
Default value: 0 Minimum value = 0 Maximum value = 172800

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

### -InterfaceType
Subscriber Interface refers to Citrix ADC interaction with control plane protocols, RADIUS and GX.
Types of subscriber interface: NONE, RadiusOnly, RadiusAndGx, GxOnly.
NONE: Only static subscribers can be configured.
RadiusOnly: GX interface is absent.
Subscriber information is obtained through RADIUS Accounting messages.
RadiusAndGx: Subscriber ID obtained through RADIUS Accounting is used to query PCRF.
Subscriber information is obtained from both RADIUS and PCRF.
GxOnly: RADIUS interface is absent.
Subscriber information is queried using Subscriber IP or IP+VLAN.
Default value: None Possible values = None, RadiusOnly, RadiusAndGx, GxOnly

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

### -IPv6Prefixlookuplist
The ipv6PrefixLookupList should consist of all the ipv6 prefix lengths assigned to the UE's'.
Minimum value = 1 Maximum value = 128

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

### -KeyType
Type of subscriber key type IP or IPANDVLAN.
IPANDVLAN option can be used only when the interfaceType is set to gxOnly.
Changing the lookup method should result to the subscriber session database being flushed.
Default value: IP Possible values = IP, IPANDVLAN

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

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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

