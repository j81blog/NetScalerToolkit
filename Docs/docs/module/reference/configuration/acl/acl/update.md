---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateACL

## SYNOPSIS
Updates a NetScaler nsacl resource.

## SYNTAX

```
Invoke-NSUpdateACL [-AclAction <String>] [-AclName] <String> [-Destip <Boolean>] [-Destipop <String>]
 [-Destipval <String>] [-DestPort <Boolean>] [-DestPortOp <String>] [-DestPortVal <String>] [-DfdHash <String>]
 [-Established <Boolean>] [-ICMPCode <Int32>] [-ICMPType <Int32>] [-Interface <String>] [-Logstate <String>]
 [-Nodeid <Int32>] [-Priority <Int32>] [-Protocol <String>] [-ProtocolNumber <Int32>] [-Ratelimit <Int32>]
 [-Srcip <Boolean>] [-Srcipop <String>] [-Srcipval <String>] [-Srcmac <String>] [-SrcmacMask <String>]
 [-SrcPort <Boolean>] [-SrcPortOp <String>] [-SrcPortVal <String>] [-Stateful <String>] [-Vlan <Int32>]
 [-Vxlan <Int32>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for ACL entry resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateACL -AclName 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateACL -AclName 'example' -WhatIf
```

## PARAMETERS

### -AclAction
Action to perform on incoming IPv4 packets that match the extended ACL rule.
Available settings function as follows: * ALLOW - The Citrix ADC processes the packet.
* BRIDGE - The Citrix ADC bridges the packet to the destination without processing it.
* DENY - The Citrix ADC drops the packet.
Possible values = BRIDGE, DENY, ALLOW

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

### -AclName
Name for the extended ACL rule.
Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
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

### -Destip
IP address or range of IP addresses to match against the destination IP address of an incoming IPv4 packet.
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
IP address or range of IP addresses to match against the destination IP address of an incoming IPv4 packet.
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
Port number or range of port numbers to match against the destination port number of an incoming IPv4 packet.
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
Port number or range of port numbers to match against the destination port number of an incoming IPv4 packet.
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

### -DfdHash
Specifies the type hashmethod to be applied, to steer the packet to the FP of the packet.
Possible values = SIP-SPORT-DIP-DPORT, SIP, DIP, SIP-DIP, SIP-SPORT, DIP-DPORT

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

### -Established
Allow only incoming TCP packets that have the ACK or RST bit set, if the action set for the ACL rule is ALLOW and these packets match the other conditions in the ACL rule.

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

### -ICMPCode
Code of a particular ICMP message type to match against the ICMP code of an incoming ICMP packet.
For example, to block DESTINATION HOST UNREACHABLE messages, specify 3 as the ICMP type and 1 as the ICMP code.
If you set this parameter, you must set the ICMP Type parameter.
Minimum value = 0 Maximum value = 65536

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

### -ICMPType
ICMP Message type to match against the message type of an incoming ICMP packet.
For example, to block DESTINATION UNREACHABLE messages, you must specify 3 as the ICMP type.
Note: This parameter can be specified only for the ICMP protocol.
Minimum value = 0 Maximum value = 65536

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

### -Interface
ID of an interface.
The Citrix ADC applies the ACL rule only to the incoming packets from the specified interface.
If you do not specify any value, the appliance applies the ACL rule to the incoming packets of all interfaces.

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

### -Logstate
Enable or disable logging of events related to the extended ACL rule.
The log messages are stored in the configured syslog or auditlog server.
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

### -Nodeid
Specifies the NodeId to steer the packet to the provided FP.
Minimum value = 0 Maximum value = 31

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

### -Priority
Priority for the extended ACL rule that determines the order in which it is evaluated relative to the other extended ACL rules.
If you do not specify priorities while creating extended ACL rules, the ACL rules are evaluated in the order in which they are created.
Minimum value = 1 Maximum value = 100000

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
Protocol to match against the protocol of an incoming IPv4 packet.
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
Protocol to match against the protocol of an incoming IPv4 packet.
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

### -Ratelimit
Maximum number of log messages to be generated per second.
If you set this parameter, you must enable the Log State parameter.
Default value: 100 Minimum value = 1 Maximum value = 10000

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
IP address or range of IP addresses to match against the source IP address of an incoming IPv4 packet.
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
IP address or range of IP addresses to match against the source IP address of an incoming IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example:10.102.29.30-10.102.29.189.

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
MAC address to match against the source MAC address of an incoming IPv4 packet.

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
Port number or range of port numbers to match against the source port number of an incoming IPv4 packet.
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
Port number or range of port numbers to match against the source port number of an incoming IPv4 packet.
In the command line interface, separate the range with a hyphen.
For example: 40-90.
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

### -Stateful
If stateful option is enabled, transparent sessions are created for the traffic hitting this ACL and not hitting any other features like LB, INAT etc.
. Default value: NO Possible values = YES, NO

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
ID of the VLAN.
The Citrix ADC applies the ACL rule only to the incoming packets of the specified VLAN.
If you do not specify a VLAN ID, the appliance applies the ACL rule to the incoming packets on all VLANs.
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
The Citrix ADC applies the ACL rule only to the incoming packets of the specified VXLAN.
If you do not specify a VXLAN ID, the appliance applies the ACL rule to the incoming packets on all VXLANs.
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

