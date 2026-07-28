---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddVxlan

## SYNOPSIS
Creates a NetScaler vxlan resource.

## SYNTAX

```
Invoke-NSAddVxlan [-Dynamicrouting <String>] [-Id] <Int32> [-Innervlantagging <String>]
 [-IPv6Dynamicrouting <String>] [-Port <Int32>] [-Protocol <String>] [-Type <String>] [-Vlan <Int32>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for "VXLAN" resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddVxlan -Id 1 -Port 80 -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddVxlan -Id 1 -Port 80 -WhatIf
```

## PARAMETERS

### -Dynamicrouting
Enable dynamic routing on this VXLAN.
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

### -Id
A positive integer, which is also called VXLAN Network Identifier (VNI), that uniquely identifies a VXLAN.
Minimum value = 1 Maximum value = 16777215

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

### -Innervlantagging
Specifies whether Citrix ADC should generate VXLAN packets with inner VLAN tag.
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

### -IPv6Dynamicrouting
Enable all IPv6 dynamic routing protocols on this VXLAN.
Note: For the ENABLED setting to work, you must configure IPv6 dynamic routing protocols from the VTYSH command line.
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

### -Port
Specifies UDP destination port for VXLAN packets.
Default value: 4789 Minimum value = 1 Maximum value = 65534

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

### -Protocol
VXLAN-GPE next protocol.
RESERVED, IPv4, IPv6, ETHERNET, NSH.
Default value: ETHERNET Possible values = IPv4, IPv6, ETHERNET, NSH

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

### -Type
VXLAN encapsulation type.
VXLAN, VXLANGPE.
Default value: VXLAN Possible values = VXLAN, VXLANGPE

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
ID of VLANs whose traffic is allowed over this VXLAN.
If you do not specify any VLAN IDs, the Citrix ADC allows traffic of all VLANs that are not part of any other VXLANs.
Minimum value = 2 Maximum value = 4094

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

