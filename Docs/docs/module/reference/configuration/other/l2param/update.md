---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateL2param

## SYNOPSIS
Updates a NetScaler l2param resource.

## SYNTAX

```
Invoke-NSUpdateL2param [[-BdggrpProxyArp] <String>] [[-Bdgsetting] <String>] [[-BridgeAgeTimeout] <Int32>]
 [[-Garponvridintf] <String>] [[-Garpreply] <String>] [[-MacModeFwdmypkt] <String>]
 [[-MaxBridgeCollision] <Int32>] [[-MbfinstLearning] <String>] [[-Mbfpeermacupdate] <Int32>]
 [[-ProxyArp] <String>] [[-Returntoethernetsender] <String>] [[-Rstintfonhafo] <String>]
 [[-SkipProxyIngbsdtraffic] <String>] [[-Stopmacmoveupdate] <String>] [[-Usemymac] <String>]
 [[-UsenetProfileBsdtraffic] <String>] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Layer 2 related parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateL2param  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateL2param  -WhatIf
```

## PARAMETERS

### -BdggrpProxyArp
Set/reset proxy ARP in bridge group deployment.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Bdgsetting
Bridging settings for C2C behavior.
If enabled, each PE will learn MAC entries independently.
Otherwise, when L2 mode is ON, learned MAC entries on a PE will be broadcasted to all other PEs.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BridgeAgeTimeout
Time-out value for the bridge table entries, in seconds.
The new value applies only to the entries that are dynamically learned after the new value is set.
Previously existing bridge table entries expire after the previously configured time-out value.
Default value: 300 Minimum value = 60 Maximum value = 300

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Garponvridintf
Send GARP messagess on VRID-configured interfaces upon failover .
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Garpreply
Set/reset REPLY form of GARP .
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -MacModeFwdmypkt
Allows MAC mode vserver to pick and forward the packets even if it is destined to Citrix ADC owned VIP.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxBridgeCollision
Maximum bridge collision for loop detection .
Default value: 20

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MbfinstLearning
Enable instant learning of MAC changes in MBF mode.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mbfpeermacupdate
When mbf_instant_learning is enabled, learn any changes in peer's MAC after this time interval, which is in 10ms ticks.
Default value: 10

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProxyArp
Proxies the ARP as Citrix ADC MAC for FreeBSD.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Returntoethernetsender
Return to ethernet sender.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Rstintfonhafo
Enable the reset interface upon HA failover.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipProxyIngbsdtraffic
Control source parameters (IP and Port) for FreeBSD initiated traffic.
If Enabled, source parameters are retained.
Else proxy the source parameters based on next hop.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Stopmacmoveupdate
Stop Update of server mac change to NAT sessions.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Usemymac
Use Citrix ADC MAC for all outgoing packets.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsenetProfileBsdtraffic
Control source parameters (IP and Port) for FreeBSD initiated traffic.
If enabled proxy the source parameters based on netprofile source ip.
If netprofile does not have ip configured, then it will continue to use NSIP as earlier.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
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
Position: 17
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

