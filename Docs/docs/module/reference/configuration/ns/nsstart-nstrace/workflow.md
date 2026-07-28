---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSStartNstrace

## SYNOPSIS
Invokes the start operation for a NetScaler nstrace resource.

## SYNTAX

```
Invoke-NSStartNstrace [[-Capdroppkt] <String>] [[-CapSSLKeyS] <String>] [[-Doruntimecleanup] <String>]
 [[-FileId] <String>] [[-FileName] <String>] [[-FileSize] <Int32>] [[-Filter] <String>]
 [[-Inmemorytrace] <String>] [[-Link] <String>] [[-Merge] <String>] [[-Mode] <String[]>] [[-Nf] <Int32>]
 [[-Nodes] <String>] [[-Pernic] <String>] [[-Size] <Int32>] [[-SkipLocalSsh] <String>] [[-Skiprpc] <String>]
 [[-Time] <Int32>] [[-Tracebuffers] <Int32>] [[-TraceFormAt] <String>] [[-Session] <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for nstrace operations resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSStartNstrace
```

### EXAMPLE 2
```
Invoke-NSStartNstrace  -WhatIf
```

## PARAMETERS

### -Capdroppkt
Captures Dropped Packets if set to ENABLED.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -CapSSLKeyS
Capture SSL Master keys.
Master keys will not be captured on FIPS machine.
Warning: The captured keys can be used to decrypt information that may be confidential.
The captured key files have to be stored in a secure environment.
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

### -Doruntimecleanup
Enable or disable runtime temp file cleanup.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -FileId
ID for the trace file name for uniqueness.
Should be used only with -name option.

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

### -FileName
Name of the trace file.

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

### -FileSize
File size, in MB, treshold for rollover.
If free disk space is less than 2GB at the time of rollover, trace will stop .
Default value: 1024 Minimum value = 0 Maximum value = 10240

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
Filter expression for nstrace.
Maximum length of filter is 255 and it can be of following format: \<expression\> \[\<relop\> \<expression\>\] \<relop\> = ( && | || ) \<expression\> =: CONNECTION.\<qualifier\>.\<qualifier-method\>.(\<qualifier-value\>) \<qualifier\> = SRCIP \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv4 address.
example = CONNECTION.SRCIP.EQ(127.0.0.1) \<qualifier\> = DSTIP \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv4 address.
example = CONNECTION.DSTIP.EQ(127.0.0.1) \<qualifier\> = IP \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv4 address.
example = CONNECTION.IP.EQ(127.0.0.1) \<qualifier\> = SRCIPv6 \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv6 address.
example = CONNECTION.SRCIPv6.EQ(2001:db8:0:0:1::1) \<qualifier\> = DSTIPv6 \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv6 address.
example = CONNECTION.DSTIPv6.EQ(2001:db8:0:0:1::1) \<qualifier\> = IPv6 \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv6 address.
example = CONNECTION.IPv6.EQ(2001:db8:0:0:1::1) \<qualifier\> = SRCPORT \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid port number.
example = CONNECTION.SRCPORT.EQ(80) \<qualifier\> = DSTPORT \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid port number.
example = CONNECTION.DSTPORT.EQ(80) \<qualifier\> = PORT \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid port number.
example = CONNECTION.PORT.EQ(80) \<qualifier\> = VLANID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid VLAN ID.
example = CONNECTION.VLANID.EQ(0) \<qualifier\> = CONNID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid PCB dev number.
example = CONNECTION.CONNID.EQ(0) \<qualifier\> = PPEID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid core ID.
example = CONNECTION.PPEID.EQ(0) \<qualifier\> = SVCNAME \<qualifier-method\> = \[ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH \] \<qualifier-value\> = A valid text string.
example = CONNECTION.SVCNAME.EQ("name") \<qualifier\> = LB_VSERVER.NAME \<qualifier-method\> = \[ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH \] \<qualifier-value\> = LB vserver name.
example = CONNECTION.LB_VSERVER.NAME.EQ("name") \<qualifier\> = CS_VSERVER.NAME \<qualifier-method\> = \[ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH \] \<qualifier-value\> = CS vserver name.
example = CONNECTION.CS_VSERVER.NAME.EQ("name") \<qualifier\> = INTF \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid interface id in the form of x/y.
example = CONNECTION.INTF.EQ("x/y") \<qualifier\> = SERVICE_TYPE \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = ( SVC_HTTP | FTP | TCP | UDP | SSL | SSL_BRIDGE | SSL_TCP | NNTP | RPCSVR | RPCSVRS | RPCCLNT | SVC_DNS | ADNS | SNMP | RTSP | DHCPRA | ANY| MONITOR | MONITOR_UDP | MONITOR_PING | SIP_UDP | SVC_MYSQL | SVC_MSSQL | FIX | SSL_FIX | PKTSTEER | SVC_AAA | SERVICE_UNKNOWN ) example = CONNECTION.SERVICE_TYPE.EQ(ANY) \<qualifier\> = TRAFFIC_DOMAIN_ID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid traffic domain ID.
example = CONNECTION.TRAFFIC_DOMAIN_ID.EQ(0) eg: start nstrace -filter "CONNECTION.SRCIP.EQ(127.0.0.1) || (CONNECTION.SVCNAME.NE("s1") && CONNECTION.SRCPORT.EQ(80))" The filter expression should be given in double quotes.
common use cases: Trace capturing full sized traffic from/to ip 10.102.44.111, excluding loopback traffic start nstrace -size 0 -filter "CONNECTION.IP.NE(127.0.0.1) && CONNECTION.IP.EQ(10.102.44.111)" Trace capturing all traffic to (terminating at) port 80 or 443 start nstrace -size 0 -filter "CONNECTION.DSTPORT.EQ(443) || CONNECTION.DSTPORT.EQ(80)" Trace capturing all backend traffic specific to service service1 along with corresponding client side traffic start nstrace -size 0 -filter "CONNECTION.SVCNAME.EQ("service1")" -link ENABLED Trace capturing all traffic through NetScaler interface 1/1 start nstrace -filter "CONNECTION.INTF.EQ("1/1")" Trace capturing all traffic specific through vlan 2 start nstrace -filter "CONNECTION.VLANID.EQ(2)" Trace capturing all frontend (client side) traffic specific to lb vserver vserver1 along with corresponding server side traffic start nstrace -size 0 -filter "CONNECTION.LB_VSERVER.NAME.EQ("vserver1")" -link ENABLED .

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Inmemorytrace
Logs packets in appliance's memory and dumps the trace file on stopping the nstrace operation.
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

### -Link
Includes filtered connection's peer traffic.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Merge
Specify how traces across PE's are merged .
Default value: 0 Possible values = ONSTOP, ONTHEFLY, NOMERGE

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

### -Mode
Capturing mode for trace.
Mode can be any of the following values or combination of these values: RX Received packets before NIC pipelining (Filter does not work when RX capturing mode is ON) NEW_RX Received packets after NIC pipelining TX Transmitted packets TXB Packets buffered for transmission IPV6 Translated IPv6 packets C2C Capture C2C message NS_FR_TX TX/TXB packets are not captured in flow receiver.
MPTCP MPTCP master flow HTTP_QUIC HTTP-over-QUIC stream data and stream events Default mode: NEW_RX TXB .
Default value: DEFAULT_MODE Possible values = TX, TXB, RX, IPV6, NEW_RX, C2C, NS_FR_TX, APPFW, MPTCP, PolicyBased, HTTP_QUIC

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Nf
Number of files to be generated in cycle.
Default value: 24 Minimum value = 1 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Nodes
Nodes on which tracing is started.
Minimum value = 0 Maximum value = 32

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

### -Pernic
Use separate trace files for each interface.
Works only with cap format.
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

### -Size
Size of the captured data.
Set 0 for full packet trace.
Default value: 164 Minimum value = 0 Maximum value = 1514

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipLocalSsh
skip local SSH packets.
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

### -Skiprpc
skip RPC packets.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Time
Time per file (sec).
Default value: 3600 Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tracebuffers
Number of 16KB trace buffers.
Default value: 5000 Minimum value = 1000

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TraceFormAt
Format in which trace will be generated .
Default value: 0 Possible values = NSCAP, PCAP

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
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
Position: 21
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

