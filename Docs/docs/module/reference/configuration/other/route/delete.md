---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteRoute

## SYNOPSIS
Removes a NetScaler route resource.

## SYNTAX

```
Invoke-NSDeleteRoute [-Network] <String> -NetMask <String> [-Gateway <String>] [-Vlan <Int32>]
 [-TrafficDomain <Int32>] [-OwnerGroup <String>] [-Mgmt <Boolean>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for route resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteRoute -Network 'example' -NetMask '255.255.255.255' -Gateway 'example' -Vlan 1 -OwnerGroup 'example' -Mgmt $true -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetRoute -Network 'route_example' | Invoke-NSDeleteRoute -Confirm:$false
```

## PARAMETERS

### -Network
IPv4 network address for which to add a route entry in the routing table of the Citrix ADC.

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

### -NetMask
The subnet mask associated with the network address.

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

### -Gateway
IP address of the gateway for this route.
Can be either the IP address of the gateway, or can be null to specify a null interface route.
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

### -Vlan
VLAN as the gateway for this route.
Minimum value = 1 Maximum value = 4094

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

### -OwnerGroup
The owner node group in a Cluster for this route.
If owner node group is not specified then the route is treated as Striped route.
Default value: DEFAULT_NG Minimum length = 1

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

### -Mgmt
Route in management plane.

```yaml
Type: Boolean
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

