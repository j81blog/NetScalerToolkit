---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteRnatIPBinding

## SYNOPSIS
Removes a NetScaler rnat_nsip_binding resource.

## SYNTAX

```
Invoke-NSDeleteRnatIPBinding [-Name] <String> [-Natip <String>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the nsip that can be bound to rnat.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteRnatIPBinding -Name 'example' -Natip 'example' -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetRnatIPBinding -Name 'rnat_nsip_binding_example' | Invoke-NSDeleteRnatIPBinding -Confirm:$false
```

## PARAMETERS

### -Name
Name of the RNAT rule to which to bind NAT IPs.
Minimum length = 1

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

### -Natip
Any NetScaler-owned IPv4 address except the NSIP address.
The NetScaler appliance replaces the source IP addresses of server-generated packets with the IP address specified.
The IP address must be a public NetScaler-owned IP address.
If you specify multiple addresses for this field, NATIP selection uses the round robin algorithm for each session.
By specifying a range of IP addresses, you can specify all NetScaler-owned IP addresses, except the NSIP, that fall within the specified range.
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

