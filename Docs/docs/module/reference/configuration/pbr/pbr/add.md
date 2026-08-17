---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddPBR

## SYNOPSIS
Creates a NetScaler nspbr resource.

## SYNTAX

```
Invoke-NSAddPBR -Action <String> [-Destip <Boolean>] [-DestipDataSet <String>] [-Destipop <String>]
 [-Destipval <String>] [-DestPort <Boolean>] [-DestPortDataSet <String>] [-DestPortOp <String>]
 [-DestPortVal <String>] [-Interface <String>] [-IPTunnel <Boolean>] [-IptunnelName <String>]
 [-MonItor <String>] [-Msr <String>] [-Name] <String> [-Nexthop <Boolean>] [-Nexthopval <String>]
 [-OwnerGroup <String>] [-Priority <Int32>] [-Protocol <String>] [-ProtocolNumber <Int32>] [-Srcip <Boolean>]
 [-SrcipDataSet <String>] [-Srcipop <String>] [-Srcipval <String>] [-Srcmac <String>] [-SrcmacMask <String>]
 [-SrcPort <Boolean>] [-SrcPortDataSet <String>] [-SrcPortOp <String>] [-SrcPortVal <String>] [-State <String>]
 [-Targettd <Int32>] [-TrafficDomain <Int32>] [-Vlan <Int32>] [-Vxlan <Int32>] [-Vxlanvlanmap <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Policy Based Routing(PBR) entry resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddPBR -Name 'example' -Action ALLOW -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddPBR -Name 'example' -Action ALLOW -WhatIf
```

## PARAMETERS

### -Action
Action to perform on the outgoing IPv4 packets that match the PBR.
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

### -Destip
IP address or range of IP addresses to match against the destination IP address of an outgoing IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example: 10.102.29.30-10.102.29.189.

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

### -DestipDataSet
Policy dataset which can have multiple IP ranges bound to it.

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

### -Destipval
IP address or range of IP addresses to match against the destination IP address of an outgoing IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example: 10.102.29.30-10.102.29.189.

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
Port number or range of port numbers to match against the destination port number of an outgoing IPv4 packet.
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

### -DestPortDataSet
Policy dataset which can have multiple port ranges bound to it.

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
Port number or range of port numbers to match against the destination port number of an outgoing IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example: 40-90.
Note: The destination port can be specified only for TCP and UDP protocols.
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
The Citrix ADC compares the PBR only to the outgoing packets on the specified interface.
If you do not specify any value, the appliance compares the PBR to the outgoing packets on all interfaces.

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
The Tunnel name.

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

### -IptunnelName
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
Monitor the route specified byte Next Hop parameter.
This parameter is not applicable if you specify a link load balancing (LLB) virtual server name with the Next Hop parameter.
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
Name for the PBR.
Must begin with an ASCII alphabetic or underscore \\(_\\) character, and must contain only ASCII alphanumeric, underscore, hash \\(\#\\), period \\(.\\), space, colon \\(:\\), at \\(@\\), equals \\(=\\), and hyphen \\(-\\) characters.
Cannot be changed after the PBR is created.
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
IP address of the next hop router or the name of the link load balancing virtual server to which to send matching packets if action is set to ALLOW.
If you specify a link load balancing (LLB) virtual server, which can provide a backup if a next hop link fails, first make sure that the next hops bound to the LLB virtual server are actually next hops that are directly connected to the Citrix ADC.
Otherwise, the Citrix ADC throws an error when you attempt to create the PBR.
The next hop can be null to represent null routes.

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
The Next Hop IP address or gateway name.

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

### -OwnerGroup
The owner node group in a Cluster for this pbr rule.
If ownernode is not specified then the pbr rule is treated as Striped pbr rule.
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
Priority of the PBR, which determines the order in which it is evaluated relative to the other PBRs.
If you do not specify priorities while creating PBRs, the PBRs are evaluated in the order in which they are created.
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
Protocol, identified by protocol name, to match against the protocol of an outgoing IPv4 packet.
Possible values = ICMP, IGMP, TCP, EGP, IGP, ARGUS, UDP, RDP, RSVP, EIGRP, L2TP, ISIS, GGP, IPoverIP, ST, CBT, BBN-RCC-M, NVP-II, PUP, EMCON, XNET, CHAOS, MUX, DCN-MEAS, HMP, PRM, XNS-IDP, TRUNK-1, TRUNK-2, LEAF-1, LEAF-2, IRTP, ISO-TP4, NETBLT, MFE-NSP, MERIT-INP, SEP, 3PC, IDPR, XTP, DDP, IDPR-CMTP, TP++, IL, IPv6, SDRP, IPv6-Route, IPv6-Frag, IDRP, GRE, MHRP, BNA, ESP, AH, I-NLSP, SWIPE, NARP, MOBILE, TLSP, SKIP, ICMPV6, IPv6-NoNx, IPv6-Opts, Any-Host-Internal-Protocol, CFTP, Any-Local-Network, SAT-EXPAK, KRYPTOLAN, RVD, IPPC, Any-Distributed-File-System, TFTP, VISA, IPCV, CPNX, CPHB, WSN, PVP, BR-SAT-MO, SUN-ND, WB-MON, WB-EXPAK, ISO-IP, VMTP, SECURE-VM, VINES, TTP, NSFNET-IG, DGP, TCF, OSPFIGP, Sprite-RP, LARP, MTP, AX.25, IPIP, MICP, SCC-SP, ETHERIP, Any-Private-Encryption-Scheme, GMTP, IFMP, PNNI, PIM, ARIS, SCPS, QNX, A/N, IPComp, SNP, Compaq-Pe, IPX-in-IP, VRRP, PGM, Any-0-Hop-Protocol, ENCAP, DDX, IATP, STP, SRP, UTI, SMP, SM, PTP, FIRE, CRTP, CRUDP, SSCOPMCE, IPLT, SPS, PIPE, SCTP, FC, RSVP-E2E-IGNORE, Mobility-Header, UDPLite

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
Protocol, identified by protocol number, to match against the protocol of an outgoing IPv4 packet.
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

### -Srcip
IP address or range of IP addresses to match against the source IP address of an outgoing IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example: 10.102.29.30-10.102.29.189.

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

### -SrcipDataSet
Policy dataset which can have multiple IP ranges bound to it.

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

### -Srcipval
IP address or range of IP addresses to match against the source IP address of an outgoing IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example: 10.102.29.30-10.102.29.189.

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
MAC address to match against the source MAC address of an outgoing IPv4 packet.

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
Port number or range of port numbers to match against the source port number of an outgoing IPv4 packet.
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

### -SrcPortDataSet
Policy dataset which can have multiple port ranges bound to it.

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
Port number or range of port numbers to match against the source port number of an outgoing IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example: 40-90.
Note: The destination port can be specified only for TCP and UDP protocols.
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
Enable or disable the PBR.
After you apply the PBRs, the Citrix ADC compares outgoing packets to the enabled PBRs.
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

### -Targettd
Integer value that uniquely identifies the traffic domain to which you want to send packet to.
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
The Citrix ADC compares the PBR only to the outgoing packets on the specified VLAN.
If you do not specify any interface ID, the appliance compares the PBR to the outgoing packets on all VLANs.
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
The Citrix ADC compares the PBR only to the outgoing packets on the specified VXLAN.
If you do not specify any interface ID, the appliance compares the PBR to the outgoing packets on all VXLANs.
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

