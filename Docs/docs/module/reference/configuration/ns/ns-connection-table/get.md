---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSGetNsConnectionTable

## SYNOPSIS
Gets NetScaler nsconnectiontable configuration.

## SYNTAX

### All (Default)
```
Invoke-NSGetNsConnectionTable [-Filter <Hashtable>] [-ViewSummary] [-Filterexpression <String>] [-Link]
 [-FilterName] [-Detail <String[]>] [-Listen] [-Nodeid <Int32>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

### Count
```
Invoke-NSGetNsConnectionTable [-Count] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [<CommonParameters>]
```

## DESCRIPTION
Configuration for TCP/IP connection table resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSGetNsConnectionTable
```

### EXAMPLE 2
```
Invoke-NSGetNsConnectionTable -Filter @{ servicetype = 'HTTP' }
```

## PARAMETERS

### -Filter
{{ Fill Filter Description }}

```yaml
Type: Hashtable
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ViewSummary
Requests the NITRO summary view.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filterexpression
The maximum length of filter expression is 255 and it can be of following format: \<expression\> \[\<relop\> \<expression\>\] \<relop\> = ( && | || ) \<expression\> =: CONNECTION.\<qualifier\>.\<qualifier-method\>.(\<qualifier-value\>) \<qualifier\> = SRCIP \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv4 address example = CONNECTION.SRCIP.EQ(127.0.0.1) \<qualifier\> = DSTIP \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv4 address.
example = CONNECTION.DSTIP.EQ(127.0.0.1) \<qualifier\> = IP \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv4 address.
example = CONNECTION.IP.EQ(127.0.0.1) \<qualifier\> = SRCIPv6 \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv6 address.
example = CONNECTION.SRCIPv6.EQ(2001:db8:0:0:1::1) \<qualifier\> = DSTIPv6 \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv6 address.
example = CONNECTION.DSTIPv6.EQ(2001:db8:0:0:1::1) \<qualifier\> = IPv6 \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid IPv6 address.
example = CONNECTION.IPv6.EQ(2001:db8:0:0:1::1) \<qualifier\> = SRCPORT \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid port number.
example = CONNECTION.SRCPORT.EQ(80) \<qualifier\> = DSTPORT \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid port number.
example = CONNECTION.DSTPORT.EQ(80) \<qualifier\> = PORT \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid port number.
example = CONNECTION.PORT.EQ(80) \<qualifier\> = SVCNAME \<qualifier-method\> = \[ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH \] \<qualifier-value\> = service name.
example = CONNECTION.SVCNAME.EQ("name") \<qualifier\> = LB_VSERVER.NAME \<qualifier-method\> = \[ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH \] \<qualifier-value\> = LB vserver name.
example = CONNECTION.LB_VSERVER.NAME.EQ("name") \<qualifier\> = CS_VSERVER.NAME \<qualifier-method\> = \[ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH \] \<qualifier-value\> = CS vserver name.
example = CONNECTION.CS_VSERVER.NAME.EQ("name") \<qualifier\> = INTF \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = A valid interface id in the form of x/y (n/x/y in case of cluster interface).
examle = CONNECTION.INTF.EQ("0/1/1") \<qualifier\> = VLANID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid VLAN ID.
example = CONNECTION.VLANID.EQ(0) \<qualifier\> = CONNID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid PCB dev number.
example = CONNECTION.CONNID.EQ(0) \<qualifier\> = PPEID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid core ID.
example = CONNECTION.PPEID.EQ(0) \<qualifier\> = IDLETIME \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A positive integer indicating the idletime.
example = CONNECTION.IDLETIME.LT(100) \<qualifier\> = TCPSTATE \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = ( CLOSE_WAIT | CLOSED | CLOSING | ESTABLISHED | FIN_WAIT_1 | FIN_WAIT_2 | LAST_ACK | LISTEN | SYN_RECEIVED | SYN_SENT | TIME_WAIT | NOT_APPLICABLE) example = CONNECTION.TCPSTATE.EQ(LISTEN) \<qualifier\> = SERVICE_TYPE \<qualifier-method\> = \[ EQ | NE \] \<qualifier-value\> = ( SVC_HTTP | FTP | TCP | UDP | SSL | SSL_BRIDGE | SSL_TCP | NNTP | RPCSVR | RPCSVRS | RPCCLNT | SVC_DNS | ADNS | SNMP | RTSP | DHCPRA | NAT | ANY | MONITOR | MONITOR_UDP | MONITOR_PING | SIP_UDP | SVC_MYSQL | SVC_MSSQL | SERVICE_UNKNOWN ) example = CONNECTION.SERVICE_TYPE.EQ(ANY) \<qualifier\> = TRAFFIC_DOMAIN_ID \<qualifier-method\> = \[ EQ | NE | GT | GE | LT | LE | BETWEEN \] \<qualifier-value\> = A valid traffic domain ID.
example = CONNECTION.TRAFFIC_DOMAIN_ID.EQ(0) common usecases: Filtering out loopback connections and view present connections through netscaler show connectiontable "CONNECTION.IP.NE(127.0.0.1) && CONNECTION.TCPSTATE.EQ(ESTABLISHED)" -detail full show connections from a particular sourceip and targeted to port 80 show connectiontable "CONNECTION.SRCIP.EQ(10.102.1.91) && CONNECTION.DSTPORT.EQ(80)" show connection particular to a service and its linked client connections show connectiontable CONNECTION.SVCNAME.EQ("S1") -detail link show connections for a particular servicetype(e.g.http) show connectiontable CONNECTION.SERVICE_TYPE.EQ(TCP) viewing connections that have been idle for a long time show connectiontable CONNECTION.IDLETIME.GT(100) show connections particular to a service and idle for a long time show connectiontable "CONNECTION.SVCNAME.EQ(\\\\"S1\\\\") && CONNECTION.IDLETIME.GT(100)" show connections for a particular interface show connectiontable CONNECTION.INTF.EQ("1/1") show connections for a particular interface and vlan show connectiontable "CONNECTION.INTF.EQ(\\\\"1/1\\\\") && CONNECTION.VLANID.EQ(1)" .

```yaml
Type: String
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Link
Display link information if available.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterName
Display name instead of IP for local entities.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Detail
Specify display options for the connection table.
* LINK - Displays the linked PCB (Protocol Control Block).
* NAME - Displays along with the service name.
* CONNFAILOVER - Displays PCB with connection failover.
* FULL - Displays all available details.
Possible values = LINK, NAME, CONNFAILOVER, FULL, NNM, FULL+

```yaml
Type: String[]
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Listen
Display listening services only.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Nodeid
Unique number that identifies the cluster node.
Minimum value = 0 Maximum value = 31

```yaml
Type: Int32
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
Returns only the number of matching resources.

```yaml
Type: SwitchParameter
Parameter Sets: Count
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

