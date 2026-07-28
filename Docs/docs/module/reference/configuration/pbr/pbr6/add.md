---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddPBR6

## SYNOPSIS
Creates a NetScaler nspbr6 resource.

## SYNTAX

```
Invoke-NSAddPBR6 -Action <String> [-Destipop <String>] [-DestIPv6 <Boolean>] [-DestIPv6Val <String>]
 [-DestPort <Boolean>] [-DestPortOp <String>] [-DestPortVal <String>] [-Interface <String>]
 [-IPTunnel <String>] [-MonItor <String>] [-Msr <String>] [-Name] <String> [-Nexthop <Boolean>]
 [-Nexthopval <String>] [-Nexthopvlan <Int32>] [-OwnerGroup <String>] [-Priority <Int32>] [-Protocol <String>]
 [-ProtocolNumber <Int32>] [-Srcipop <String>] [-SrcIPv6 <Boolean>] [-SrcIPv6Val <String>] [-Srcmac <String>]
 [-SrcmacMask <String>] [-SrcPort <Boolean>] [-SrcPortOp <String>] [-SrcPortVal <String>] [-State <String>]
 [-TrafficDomain <Int32>] [-Vlan <Int32>] [-Vxlan <Int32>] [-Vxlanvlanmap <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for PBR6 entry resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddPBR6 -Name 'example' -Action ALLOW -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddPBR6 -Name 'example' -Action ALLOW -WhatIf
```

## PARAMETERS

### -Action
Action to perform on the outgoing IPv6 packets that match the PBR6.
Available settings function as follows: * ALLOW - The Citrix ADC sends the packet to the designated next-hop router.
* DENY - The Citrix ADC applies the routing table for normal destination-based routing.
Possible values = ALLOW, DENY

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

### -Destipop
Either the equals (=) or does not equal (!=) logical operator.
Possible values = =, !=, EQ, NEQ

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

### -DestIPv6
IP address or range of IP addresses to match against the destination IP address of an outgoing IPv6 packet.
In the command line interface, separate the range with a hyphen.

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

### -DestIPv6Val
IP address or range of IP addresses to match against the destination IP address of an outgoing IPv6 packet.
In the command line interface, separate the range with a hyphen.

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
Port number or range of port numbers to match against the destination port number of an outgoing IPv6 packet.
In the command line interface, separate the range with a hyphen.
For example: 40-90.
Note: The destination port can be specified only for TCP and UDP protocols.

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

### -DestPortOp
Either the equals (=) or does not equal (!=) logical operator.
Possible values = =, !=, EQ, NEQ

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

### -DestPortVal
Destination port (range).
Maximum length = 65535

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

### -Interface
ID of an interface.
The Citrix ADC compares the PBR6 only to the outgoing packets on the specified interface.
If you do not specify a value, the appliance compares the PBR6 to the outgoing packets on all interfaces.

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

### -IPTunnel
The iptunnel name where packets need to be forwarded upon.

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

### -MonItor
The name of the monitor.(Can be only of type ping or ARP ).
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

### -Msr
Monitor the route specified by the Next Hop parameter.
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

### -Name
Name for the PBR6.
Must begin with an ASCII alphabetic or underscore \\(_\\) character, and must contain only ASCII alphanumeric, underscore, hash \\(\#\\), period \\(.\\), space, colon \\(:\\), at \\(@\\), equals \\(=\\), and hyphen \\(-\\) characters.
Cannot be changed after the PBR6 is created.
Minimum length = 1

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

### -Nexthop
IP address of the next hop router to which to send matching packets if action is set to ALLOW.
This next hop should be directly reachable from the appliance.

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

### -Nexthopval
The Next Hop IPv6 address.

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

### -Nexthopvlan
VLAN number to be used for link local nexthop .
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

### -OwnerGroup
The owner node group in a Cluster for this pbr rule.
If owner node group is not specified then the pbr rule is treated as Striped pbr rule.
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

### -Priority
Priority of the PBR6, which determines the order in which it is evaluated relative to the other PBR6s.
If you do not specify priorities while creating PBR6s, the PBR6s are evaluated in the order in which they are created.
Minimum value = 1 Maximum value = 81920

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
Protocol, identified by protocol name, to match against the protocol of an outgoing IPv6 packet.
Possible values = ICMPV6, TCP, UDP, ICMP, IGMP, EGP, IGP, ARGUS, RDP, RSVP, EIGRP, L2TP, ISIS, GGP, IPoverIP, ST, CBT, BBN-RCC-M, NVP-II, PUP, EMCON, XNET, CHAOS, MUX, DCN-MEAS, HMP, PRM, XNS-IDP, TRUNK-1, TRUNK-2, LEAF-1, LEAF-2, IRTP, ISO-TP4, NETBLT, MFE-NSP, MERIT-INP, SEP, 3PC, IDPR, XTP, DDP, IDPR-CMTP, TP++, IL, IPv6, SDRP, IPv6-Route, IPv6-Frag, IDRP, GRE, MHRP, BNA, ESP, AH, I-NLSP, SWIPE, NARP, MOBILE, TLSP, SKIP, IPv6-NoNx, IPv6-Opts, Any-Host-Internal-Protocol, CFTP, Any-Local-Network, SAT-EXPAK, KRYPTOLAN, RVD, IPPC, Any-Distributed-File-System, TFTP, VISA, IPCV, CPNX, CPHB, WSN, PVP, BR-SAT-MO, SUN-ND, WB-MON, WB-EXPAK, ISO-IP, VMTP, SECURE-VM, VINES, TTP, NSFNET-IG, DGP, TCF, OSPFIGP, Sprite-RP, LARP, MTP, AX.25, IPIP, MICP, SCC-SP, ETHERIP, Any-Private-Encryption-Scheme, GMTP, IFMP, PNNI, PIM, ARIS, SCPS, QNX, A/N, IPComp, SNP, Compaq-Pe, IPX-in-IP, VRRP, PGM, Any-0-Hop-Protocol, ENCAP, DDX, IATP, STP, SRP, UTI, SMP, SM, PTP, FIRE, CRTP, CRUDP, SSCOPMCE, IPLT, SPS, PIPE, SCTP, FC, RSVP-E2E-IGNORE, Mobility-Header, UDPLite

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

### -ProtocolNumber
Protocol, identified by protocol number, to match against the protocol of an outgoing IPv6 packet.
Minimum value = 1 Maximum value = 255

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

### -Srcipop
Either the equals (=) or does not equal (!=) logical operator.
Possible values = =, !=, EQ, NEQ

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

### -SrcIPv6
IP address or range of IP addresses to match against the source IP address of an outgoing IPv6 packet.
In the command line interface, separate the range with a hyphen.

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

### -SrcIPv6Val
IP address or range of IP addresses to match against the source IP address of an outgoing IPv6 packet.
In the command line interface, separate the range with a hyphen.

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

### -Srcmac
MAC address to match against the source MAC address of an outgoing IPv6 packet.

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

### -SrcmacMask
Used to define range of Source MAC address.
It takes string of 0 and 1, 0s are for exact match and 1s for wildcard.
For matching first 3 bytes of MAC address, srcMacMask value "000000111111".
. Default value: "000000000000"

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

### -SrcPort
Port number or range of port numbers to match against the source port number of an outgoing IPv6 packet.
In the command line interface, separate the range with a hyphen.
For example: 40-90.

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

### -SrcPortOp
Either the equals (=) or does not equal (!=) logical operator.
Possible values = =, !=, EQ, NEQ

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

### -SrcPortVal
Source port (range).
Maximum length = 65535

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

### -State
Enable or disable the PBR6.
After you apply the PBR6s, the Citrix ADC compares outgoing packets to the enabled PBR6s.
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

### -Vlan
ID of the VLAN.
The Citrix ADC compares the PBR6 only to the outgoing packets on the specified VLAN.
If you do not specify an interface ID, the appliance compares the PBR6 to the outgoing packets on all VLANs.
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

### -Vxlan
ID of the VXLAN.
The Citrix ADC compares the PBR6 only to the outgoing packets on the specified VXLAN.
If you do not specify an interface ID, the appliance compares the PBR6 to the outgoing packets on all VXLANs.
Minimum value = 1 Maximum value = 16777215

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

### -Vxlanvlanmap
The vlan to vxlan mapping to be applied for incoming packets over this pbr tunnel.

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

