---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateLBVServer

## SYNOPSIS
Updates a NetScaler load balancing virtual server.

## SYNTAX

```
Invoke-NSUpdateLBVServer [-ADFSProxyProfile <String>] [-APIProfile <String>] [-AppFlowLog <String>]
 [-Authentication <String>] [-AuthenticationHost <String>] [-Authn401 <String>] [-AuthnProfile <String>]
 [-AuthnVServerName <String>] [-BackupLBMethod <String>] [-BackupPersistenceTimeout <Int32>]
 [-BackupVServer <String>] [-BypassAAAA <String>] [-Cacheable <String>] [-CltTimeout <Int32>]
 [-Comment <String>] [-ConnFailover <String>] [-CookieName <String>] [-DataLength <Int32>]
 [-DataOffset <Int32>] [-DBProfileName <String>] [-DBSLB <String>] [-DisablePrimaryOnDown <String>]
 [-DNS64 <String>] [-DNSOverHTTPS <String>] [-DNSProfileName <String>] [-DownStateFlush <String>]
 [-HashLength <Int32>] [-HealthThreshold <Int32>] [-HTTPProfileName <String>] [-HTTPSRedirectURL <String>]
 [-ICMPVsrResponse <String>] [-InsertVServerIPPort <String>] [-IPMask <String>] [-IPPattern <String>]
 [-IPSet <String>] [-IPv46 <String>] [-L2Conn <String>] [-LBMethod <String>] [-LBProfileName <String>]
 [-ListenPolicy <String>] [-ListenPriority <Int32>] [-M <String>] [-MacModeRetainVLAN <String>]
 [-MaxAutoscaleMembers <Int32>] [-MinAutoscaleMembers <Int32>] [-MSSQLServerVersion <String>]
 [-MySQLCharacterSet <Int32>] [-MySQLProtocolVersion <Int32>] [-MySQLServerCapabilities <Int32>]
 [-MySQLServerVersion <String>] [-Name] <String> [-NetMask <String>] [-NetProfile <String>]
 [-NewServiceRequest <Int32>] [-NewServiceRequestIncrementInterval <Int32>] [-NewServiceRequestUnit <String>]
 [-OracleServerVersion <String>] [-Order <Int32>] [-OrderThreshold <Int32>] [-PersistaVPNO <String>]
 [-PersistenceBackup <String>] [-PersistenceType <String>] [-PersistMask <String>] [-ProbePort <Int32>]
 [-ProbeProtocol <String>] [-ProbeSuccessResponseCode <String>] [-ProcessLocal <String>] [-Push <String>]
 [-PushLabel <String>] [-PushMultiClients <String>] [-PushVServer <String>] [-QUICBridgeProfileName <String>]
 [-QUICProfileName <String>] [-RecursionAvailable <String>] [-RedirectFromPort <Int32>]
 [-RedirectPortRewrite <String>] [-RedirURL <String>] [-Resrule <String>]
 [-RetainConnectionsOnCluster <String>] [-Rhistate <String>] [-RTSPNAT <String>] [-Rule <String>]
 [-ServiceName <String>] [-Sessionless <String>] [-Skippersistency <String>] [-SoBackupAction <String>]
 [-SoMethod <String>] [-SoPersistence <String>] [-SoPersistenceTimeout <Int32>] [-SoThreshold <Int32>]
 [-TCPProbePort <Int32>] [-TCPProfileName <String>] [-Timeout <Int32>] [-ToggleOrder <String>] [-Tosid <Int32>]
 [-TrofsPersistence <String>] [-V6NetmaskLen <Int32>] [-V6PersistMaskLen <Int32>] [-VIPHeader <String>]
 [-WASMModule <String>] [-Weight <Int32>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Load Balancing Virtual Server resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateLBVServer -Name 'example' -LBMethod LEASTCONNECTION -Comment 'Updated by automation' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateLBVServer -Name 'example' -LBMethod LEASTCONNECTION -Comment 'Updated by automation' -WhatIf
```

## PARAMETERS

### -ADFSProxyProfile
Name of the adfsProxy profile to be used to support ADFSPIP protocol for ADFS servers.

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

### -APIProfile
The API profile where one or more API specs are bounded to.
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

### -AppFlowLog
Apply AppFlow logging to the virtual server.
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

### -Authentication
Enable or disable user authentication.
Default value: OFF Possible values = ON, OFF

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

### -AuthenticationHost
Fully qualified domain name (FQDN) of the authentication virtual server to which the user must be redirected for authentication.
Make sure that the Authentication parameter is set to ENABLED.
Minimum length = 3 Maximum length = 252

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

### -Authn401
Enable or disable user authentication with HTTP 401 responses.
Default value: OFF Possible values = ON, OFF

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

### -AuthnProfile
Name of the authentication profile to be used when authentication is turned on.

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

### -AuthnVServerName
Name of an authentication virtual server with which to authenticate users.
Minimum length = 1 Maximum length = 252

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

### -BackupLBMethod
Backup load balancing method.
Becomes operational if the primary load balancing me thod fails or cannot be used.
Valid only if the primary method is based on static proximity.
Default value: ROUNDROBIN Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, CUSTOMLOAD

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

### -BackupPersistenceTimeout
Time period for which backup persistence is in effect.
Default value: 2 Minimum value = 2 Maximum value = 1440

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

### -BackupVServer
Name of the backup virtual server to which to forward requests if the primary virtual server goes DOWN or reaches its spillover threshold.
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

### -BypassAAAA
If this option is enabled while resolving DNS64 query AAAA queries are not sent to back end dns server.
Default value: NO Possible values = YES, NO

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

### -Cacheable
Route cacheable requests to a cache redirection virtual server.
The load balancing virtual server can forward requests only to a transparent cache redirection virtual server that has an IP address and port combination of *:80, so such a cache redirection virtual server must be configured on the appliance.
Default value: NO Possible values = YES, NO

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

### -CltTimeout
Idle time, in seconds, after which a client connection is terminated.
Minimum value = 0 Maximum value = 31536000

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

### -Comment
Any comments that you might want to associate with the virtual server.

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

### -ConnFailover
Mode in which the connection failover feature must operate for the virtual server.
After a failover, established TCP connections and UDP packet flows are kept active and resumed on the secondary appliance.
Clients remain connected to the same servers.
Available settings function as follows: * STATEFUL - The primary appliance shares state information with the secondary appliance, in real time, resulting in some runtime processing overhead.
* STATELESS - State information is not shared, and the new primary appliance tries to re-create the packet flow on the basis of the information contained in the packets it receives.
* DISABLED - Connection failover does not occur.
Default value: DISABLED Possible values = DISABLED, STATEFUL, STATELESS

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

### -CookieName
Use this parameter to specify the cookie name for COOKIE peristence type.
It specifies the name of cookie with a maximum of 32 characters.
If not specified, cookie name is internally generated.

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

### -DataLength
Length of the token to be extracted from the data segment of an incoming packet, for use in the token method of load balancing.
The length of the token, specified in bytes, must not be greater than 24 KB.
Applicable to virtual servers of type TCP.
Minimum value = 1 Maximum value = 100

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

### -DataOffset
Offset to be considered when extracting a token from the TCP payload.
Applicable to virtual servers, of type TCP, using the token method of load balancing.
Must be within the first 24 KB of the TCP payload.
Minimum value = 0 Maximum value = 25400

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

### -DBProfileName
Name of the DB profile whose settings are to be applied to the virtual server.
Minimum length = 1 Maximum length = 127

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

### -DBSLB
Enable database specific load balancing for MySQL and MSSQL service types.
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

### -DisablePrimaryOnDown
If the primary virtual server goes down, do not allow it to return to primary status until manually enabled.
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

### -DNS64
This argument is for enabling/disabling the dns64 on lbvserver.
Possible values = ENABLED, DISABLED

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

### -DNSOverHTTPS
This option is used to enable/disable DNS over HTTPS (DoH) processing.
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

### -DNSProfileName
Name of the DNS profile to be associated with the VServer.
DNS profile properties will be applied to the transactions processed by a VServer.
This parameter is valid only for DNS and DNS-TCP VServers.
Minimum length = 1 Maximum length = 127

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

### -DownStateFlush
Flush all active transactions associated with a virtual server whose state transitions from UP to DOWN.
Do not enable this option for applications that must complete their transactions.
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

### -HashLength
Number of bytes to consider for the hash value used in the URLHASH and DOMAINHASH load balancing methods.
Default value: 80 Minimum value = 1 Maximum value = 4096

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

### -HealthThreshold
Threshold in percent of active services below which vserver state is made down.
If this threshold is 0, vserver state will be up even if one bound service is up.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -HTTPProfileName
Name of the HTTP profile whose settings are to be applied to the virtual server.
Minimum length = 1 Maximum length = 127

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

### -HTTPSRedirectURL
URL to which all HTTP traffic received on the port specified in the -redirectFromPort parameter is redirected.

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

### -ICMPVsrResponse
How the Citrix ADC responds to ping requests received for an IP address that is common to one or more virtual servers.
Available settings function as follows: * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always responds to the ping requests.
* If set to ACTIVE on all the virtual servers that share the IP address, the appliance responds to the ping requests if at least one of the virtual servers is UP.
Otherwise, the appliance does not respond.
* If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance responds if at least one virtual server with the ACTIVE setting is UP.
Otherwise, the appliance does not respond.
Note: This parameter is available at the virtual server level.
A similar parameter, ICMP Response, is available at the IP address level, for IPv4 addresses of type VIP.
To set that parameter, use the add ip command in the CLI or the Create IP dialog box in the GUI.
Default value: PASSIVE Possible values = PASSIVE, ACTIVE

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

### -InsertVServerIPPort
Insert an HTTP header, whose value is the IP address and port number of the virtual server, before forwarding a request to the server.
The format of the header is \<vipHeader\>: \<virtual server IP address\>_\<port number \>, where vipHeader is the name that you specify for the header.
If the virtual server has an IPv6 address, the address in the header is enclosed in brackets (\[ and \]) to separate it from the port number.
If you have mapped an IPv4 address to a virtual server's IPv6 address, the value of this parameter determines which IP address is inserted in the header, as follows: * VIPADDR - Insert the IP address of the virtual server in the HTTP header regardless of whether the virtual server has an IPv4 address or an IPv6 address.
A mapped IPv4 address, if configured, is ignored.
* V6TOV4MAPPING - Insert the IPv4 address that is mapped to the virtual server's IPv6 address.
If a mapped IPv4 address is not configured, insert the IPv6 address.
* OFF - Disable header insertion.
Possible values = OFF, VIPADDR, V6TOV4MAPPING

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

### -IPMask
IP mask, in dotted decimal notation, for the IP Pattern parameter.
Can have leading or trailing non-zero octets (for example, 255.255.240.0 or 0.0.255.255).
Accordingly, the mask specifies whether the first n bits or the last n bits of the destination IP address in a client request are to be matched with the corresponding bits in the IP pattern.
The former is called a forward mask.
The latter is called a reverse mask.

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

### -IPPattern
IP address pattern, in dotted decimal notation, for identifying packets to be accepted by the virtual server.
The IP Mask parameter specifies which part of the destination IP address is matched against the pattern.
Mutually exclusive with the IP Address parameter.
For example, if the IP pattern assigned to the virtual server is 198.51.100.0 and the IP mask is 255.255.240.0 (a forward mask), the first 20 bits in the destination IP addresses are matched with the first 20 bits in the pattern.
The virtual server accepts requests with IP addresses that range from 198.51.96.1 to 198.51.111.254.
You can also use a pattern such as 0.0.2.2 and a mask such as 0.0.255.255 (a reverse mask).
If a destination IP address matches more than one IP pattern, the pattern with the longest match is selected, and the associated virtual server processes the request.
For example, if virtual servers vs1 and vs2 have the same IP pattern, 0.0.100.128, but different IP masks of 0.0.255.255 and 0.0.224.255, a destination IP address of 198.51.100.128 has the longest match with the IP pattern of vs1.
If a destination IP address matches two or more virtual servers to the same extent, the request is processed by the virtual server whose port number matches the port number in the request.

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

### -IPSet
The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current lb vserver.
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

### -IPv46
IPv4 or IPv6 address to assign to the virtual server.

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

### -L2Conn
Use Layer 2 parameters (channel number, MAC address, and VLAN ID) in addition to the 4-tuple (\<source IP\>:\<source port\>::\<destination IP\>:\<destination port\>) that is used to identify a connection.
Allows multiple TCP and non-TCP connections with the same 4-tuple to co-exist on the Citrix ADC.
Possible values = ON, OFF

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

### -LBMethod
Load balancing method.
The available settings function as follows: * ROUNDROBIN - Distribute requests in rotation, regardless of the load.
Weights can be assigned to services to enforce weighted round robin distribution.
* LEASTCONNECTION (default) - Select the service with the fewest connections.
* LEASTRESPONSETIME - Select the service with the lowest average response time.
* LEASTBANDWIDTH - Select the service currently handling the least traffic.
* LEASTPACKETS - Select the service currently serving the lowest number of packets per second.
* CUSTOMLOAD - Base service selection on the SNMP metrics obtained by custom load monitors.
* LRTM - Select the service with the lowest response time.
Response times are learned through monitoring probes.
This method also takes the number of active connections into account.
Also available are a number of hashing methods, in which the appliance extracts a predetermined portion of the request, creates a hash of the portion, and then checks whether any previous requests had the same hash value.
If it finds a match, it forwards the request to the service that served those previous requests.
Following are the hashing methods: * URLHASH - Create a hash of the request URL (or part of the URL).
* DOMAINHASH - Create a hash of the domain name in the request (or part of the domain name).
The domain name is taken from either the URL or the Host header.
If the domain name appears in both locations, the URL is preferred.
If the request does not contain a domain name, the load balancing method defaults to LEASTCONNECTION.
* DESTINATIONIPHASH - Create a hash of the destination IP address in the IP header.
* SOURCEIPHASH - Create a hash of the source IP address in the IP header.
* TOKEN - Extract a token from the request, create a hash of the token, and then select the service to which any previous requests with the same token hash value were sent.
* SRCIPDESTIPHASH - Create a hash of the string obtained by concatenating the source IP address and destination IP address in the IP header.
* SRCIPSRCPORTHASH - Create a hash of the source IP address and source port in the IP header.
* CALLIDHASH - Create a hash of the SIP Call-ID header.
* USER_TOKEN - Same as TOKEN LB method but token needs to be provided from an extension.
* LEASTLLMTOKENLATENCY - Select the service with the least LLM token latency.
Default value: LEASTCONNECTION Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, URLHASH, DOMAINHASH, DESTINATIONIPHASH, SOURCEIPHASH, SRCIPDESTIPHASH, LEASTBANDWIDTH, LEASTPACKETS, TOKEN, SRCIPSRCPORTHASH, LRTM, CALLIDHASH, CUSTOMLOAD, LEASTREQUEST, AUDITLOGHASH, STATICPROXIMITY, USER_TOKEN, LEASTLLMTOKENLATENCY

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

### -LBProfileName
Name of the LB profile which is associated to the vserver.

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

### -ListenPolicy
Expression identifying traffic accepted by the virtual server.
Can be either an expression (for example, CLIENT.IP.DST.IN_SUBNET(192.0.2.0/24) or the name of a named expression.
In the above example, the virtual server accepts all requests whose destination IP address is in the 192.0.2.0/24 subnet.
Default value: "NONE"

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

### -ListenPriority
Integer specifying the priority of the listen policy.
A higher number specifies a lower priority.
If a request matches the listen policies of more than one virtual server the virtual server whose listen policy has the highest priority (the lowest priority number) accepts the request.
Default value: 101 Minimum value = 0 Maximum value = 101

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

### -M
Redirection mode for load balancing.
Available settings function as follows: * IP - Before forwarding a request to a server, change the destination IP address to the server's IP address.
* MAC - Before forwarding a request to a server, change the destination MAC address to the server's MAC address.
The destination IP address is not changed.
MAC-based redirection mode is used mostly in firewall load balancing deployments.
* IPTUNNEL - Perform IP-in-IP encapsulation for client IP packets.
In the outer IP headers, set the destination IP address to the IP address of the server and the source IP address to the subnet IP (SNIP).
The client IP packets are not modified.
Applicable to both IPv4 and IPv6 packets.
* TOS - Encode the virtual server's TOS ID in the TOS field of the IP header.
You can use either the IPTUNNEL or the TOS option to implement Direct Server Return (DSR).
Default value: IP Possible values = IP, MAC, IPTUNNEL, TOS

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

### -MacModeRetainVLAN
This option is used to retain vlan information of incoming packet when macmode is enabled.
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

### -MaxAutoscaleMembers
Maximum number of members expected to be present when vserver is used in Autoscale.
Default value: 0 Minimum value = 0 Maximum value = 5000

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

### -MinAutoscaleMembers
Minimum number of members expected to be present when vserver is used in Autoscale.
Default value: 0 Minimum value = 0 Maximum value = 5000

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

### -MSSQLServerVersion
For a load balancing virtual server of type MSSQL, the Microsoft SQL Server version.
Set this parameter if you expect some clients to run a version different from the version of the database.
This setting provides compatibility between the client-side and server-side connections by ensuring that all communication conforms to the server's version.
Default value: 2008R2 Possible values = 70, 2000, 2000SP1, 2005, 2008, 2008R2, 2012, 2014

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

### -MySQLCharacterSet
Character set that the virtual server advertises to clients.

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

### -MySQLProtocolVersion
MySQL protocol version that the virtual server advertises to clients.

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

### -MySQLServerCapabilities
Server capabilities that the virtual server advertises to clients.

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

### -MySQLServerVersion
MySQL server version string that the virtual server advertises to clients.
Minimum length = 1 Maximum length = 31

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
Name for the virtual server.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters.
Can be changed after the virtual server is created.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver').
. Minimum length = 1

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

### -NetMask
IPv4 subnet mask to apply to the destination IP address or source IP address when the load balancing method is DESTINATIONIPHASH or SOURCEIPHASH.
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

### -NetProfile
Name of the network profile to associate with the virtual server.
If you set this parameter, the virtual server uses only the IP addresses in the network profile as source IP addresses when initiating connections with servers.
Minimum length = 1 Maximum length = 127

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

### -NewServiceRequest
Number of requests, or percentage of the load on existing services, by which to increase the load on a new service at each interval in slow-start mode.
A non-zero value indicates that slow-start is applicable.
A zero value indicates that the global RR startup parameter is applied.
Changing the value to zero will cause services currently in slow start to take the full traffic as determined by the LB method.
Subsequently, any new services added will use the global RR factor.
Default value: 0

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

### -NewServiceRequestIncrementInterval
Interval, in seconds, between successive increments in the load on a new service or a service whose state has just changed from DOWN to UP.
A value of 0 (zero) specifies manual slow start.
Default value: 0 Minimum value = 0 Maximum value = 3600

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

### -NewServiceRequestUnit
Units in which to increment load at each interval in slow-start mode.
Default value: PER_SECOND Possible values = PER_SECOND, PERCENT

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

### -OracleServerVersion
Oracle server version.
Default value: 10G Possible values = 10G, 11G

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

### -Order
Order number to be assigned to the service when it is bound to the lb vserver.
Minimum value = 1 Maximum value = 8192

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

### -OrderThreshold
This option is used to to specify the threshold of minimum number of services to be UP in an order, for it to be considered in Lb decision.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -PersistaVPNO
Persist AVP number for Diameter Persistency.
In case this AVP is not defined in Base RFC 3588 and it is nested inside a Grouped AVP, define a sequence of AVP numbers (max 3) in order of parent to child.
So say persist AVP number X is nested inside AVP Y which is nested in Z, then define the list as Z Y X.
Minimum value = 1

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

### -PersistenceBackup
Backup persistence type for the virtual server.
Becomes operational if the primary persistence mechanism fails.
Possible values = SOURCEIP, NONE

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

### -PersistenceType
Type of persistence for the virtual server.
Available settings function as follows: * SOURCEIP - Connections from the same client IP address belong to the same persistence session.
* COOKIEINSERT - Connections that have the same HTTP Cookie, inserted by a Set-Cookie directive from a server, belong to the same persistence session.
* SSLSESSION - Connections that have the same SSL Session ID belong to the same persistence session.
* CUSTOMSERVERID - Connections with the same server ID form part of the same session.
For this persistence type, set the Server ID (CustomServerID) parameter for each service and configure the Rule parameter to identify the server ID in a request.
* RULE - All connections that match a user defined rule belong to the same persistence session.
* URLPASSIVE - Requests that have the same server ID in the URL query belong to the same persistence session.
The server ID is the hexadecimal representation of the IP address and port of the service to which the request must be forwarded.
This persistence type requires a rule to identify the server ID in the request.
* DESTIP - Connections to the same destination IP address belong to the same persistence session.
* SRCIPDESTIP - Connections that have the same source IP address and destination IP address belong to the same persistence session.
* CALLID - Connections that have the same CALL-ID SIP header belong to the same persistence session.
* RTSPSID - Connections that have the same RTSP Session ID belong to the same persistence session.
* FIXSESSION - Connections that have the same SenderCompID and TargetCompID values belong to the same persistence session.
* USERSESSION - Persistence session is created based on the persistence parameter value provided from an extension.
Possible values = SOURCEIP, COOKIEINSERT, SSLSESSION, RULE, URLPASSIVE, CUSTOMSERVERID, DESTIP, SRCIPDESTIP, CALLID, RTSPSID, DIAMETER, FIXSESSION, USERSESSION, NONE

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

### -PersistMask
Persistence mask for IP based persistence types, for IPv4 virtual servers.
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

### -ProbePort
Citrix ADC provides support for external health check of the vserver status.
Select port for HTTP/TCP monitring.
Default value: 0 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

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

### -ProbeProtocol
Citrix ADC provides support for external health check of the vserver status.
Select HTTP or TCP probes for healthcheck.
Possible values = TCP, HTTP

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

### -ProbeSuccessResponseCode
HTTP code to return in SUCCESS case.
Default value: "200 OK" Minimum length = 1 Maximum length = 64

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

### -ProcessLocal
By turning on this option packets destined to a vserver in a cluster will not under go any steering.
Turn this option for single packet request response mode or when the upstream device is performing a proper RSS for connection based distribution.
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

### -Push
Process traffic with the push virtual server that is bound to this load balancing virtual server.
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

### -PushLabel
Expression for extracting a label from the server's response.
Can be either an expression or the name of a named expression.
Default value: "none"

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

### -PushMultiClients
Allow multiple Web 2.0 connections from the same client to connect to the virtual server and expect updates.
Default value: NO Possible values = YES, NO

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

### -PushVServer
Name of the load balancing virtual server, of type PUSH or SSL_PUSH, to which the server pushes updates received on the load balancing virtual server that you are configuring.
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

### -QUICBridgeProfileName
Name of the QUIC Bridge profile whose settings are to be applied to the virtual server.
Minimum length = 1 Maximum length = 127

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

### -QUICProfileName
Name of QUIC profile which will be attached to the VServer.
Minimum length = 1 Maximum length = 255

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

### -RecursionAvailable
When set to YES, this option causes the DNS replies from this vserver to have the RA bit turned on.
Typically one would set this option to YES, when the vserver is load balancing a set of DNS servers thatsupport recursive queries.
Default value: NO Possible values = YES, NO

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

### -RedirectFromPort
Port number for the virtual server, from which we absorb the traffic for http redirect.
Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

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

### -RedirectPortRewrite
Rewrite the port and change the protocol to ensure successful HTTP redirects from services.
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

### -RedirURL
URL to which to redirect traffic if the virtual server becomes unavailable.
WARNING!
Make sure that the domain in the URL does not match the domain specified for a content switching policy.
If it does, requests are continuously redirected to the unavailable virtual server.
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

### -Resrule
Expression specifying which part of a server's response to use for creating rule based persistence sessions (persistence type RULE).
Can be either an expression or the name of a named expression.
Example: HTTP.RES.HEADER("setcookie").VALUE(0).TYPECAST_NVLIST_T('=',';').VALUE("server1").
Default value: "none"

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

### -RetainConnectionsOnCluster
This option enables you to retain existing connections on a node joining a Cluster system or when a node is being configured for passive timeout.
By default, this option is disabled.
Default value: NO Possible values = YES, NO

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

### -Rhistate
Route Health Injection (RHI) functionality of the NetSaler appliance for advertising the route of the VIP address associated with the virtual server.
When Vserver RHI Level (RHI) parameter is set to VSVR_CNTRLD, the following are different RHI behaviors for the VIP address on the basis of RHIstate (RHI STATE) settings on the virtual servers associated with the VIP address: * If you set RHI STATE to PASSIVE on all virtual servers, the Citrix ADC always advertises the route for the VIP address.
* If you set RHI STATE to ACTIVE on all virtual servers, the Citrix ADC advertises the route for the VIP address if at least one of the associated virtual servers is in UP state.
* If you set RHI STATE to ACTIVE on some and PASSIVE on others, the Citrix ADC advertises the route for the VIP address if at least one of the associated virtual servers, whose RHI STATE set to ACTIVE, is in UP state.
Default value: PASSIVE Possible values = PASSIVE, ACTIVE

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

### -RTSPNAT
Use network address translation (NAT) for RTSP data connections.
Default value: OFF Possible values = ON, OFF

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

### -Rule
Expression, or name of a named expression, against which traffic is evaluated.
The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks.
* If the expression itself includes double quotation marks, escape the quotations by using the \ character.
* Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
Default value: "none"

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

### -ServiceName
Service to bind to the virtual server.
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

### -Sessionless
Perform load balancing on a per-packet basis, without establishing sessions.
Recommended for load balancing of intrusion detection system (IDS) servers and scenarios involving direct server return (DSR), where session information is unnecessary.
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

### -Skippersistency
This argument decides the behavior incase the service which is selected from an existing persistence session has reached threshold.
Default value: None Possible values = Bypass, ReLb, None

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

### -SoBackupAction
Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists.
Possible values = DROP, ACCEPT, REDIRECT

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

### -SoMethod
Type of threshold that, when exceeded, triggers spillover.
Available settings function as follows: * CONNECTION - Spillover occurs when the number of client connections exceeds the threshold.
* DYNAMICCONNECTION - Spillover occurs when the number of client connections at the virtual server exceeds the sum of the maximum client (Max Clients) settings for bound services.
Do not specify a spillover threshold for this setting, because the threshold is implied by the Max Clients settings of bound services.
* BANDWIDTH - Spillover occurs when the bandwidth consumed by the virtual server's incoming and outgoing traffic exceeds the threshold.
* HEALTH - Spillover occurs when the percentage of weights of the services that are UP drops below the threshold.
For example, if services svc1, svc2, and svc3 are bound to a virtual server, with weights 1, 2, and 3, and the spillover threshold is 50%, spillover occurs if svc1 and svc3 or svc2 and svc3 transition to DOWN.
* LLMQUOTA - Spillover occurs when the LLM token quota of all the services bound the vserver is exhausted.
Do not specify a spillover threshold for this setting, because the threshold is implied by the max tokens settings on the bound services.
* NONE - Spillover does not occur.
Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE

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

### -SoPersistence
If spillover occurs, maintain source IP address based persistence for both primary and backup virtual servers.
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

### -SoPersistenceTimeout
Timeout for spillover persistence, in minutes.
Default value: 2 Minimum value = 2 Maximum value = 1440

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

### -SoThreshold
Threshold at which spillover occurs.
Specify an integer for the CONNECTION spillover method, a bandwidth value in kilobits per second for the BANDWIDTH method (do not enter the units), or a percentage for the HEALTH method (do not enter the percentage symbol).
Minimum value = 1 Maximum value = 4294967287

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

### -TCPProbePort
Port number for external TCP probe.
NetScaler provides support for external TCP health check of the vserver status over the selected port.
This option is only supported for vservers assigned with an IPAddress or ipset.
Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

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

### -TCPProfileName
Name of the TCP profile whose settings are to be applied to the virtual server.
Minimum length = 1 Maximum length = 127

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

### -Timeout
Time period for which a persistence session is in effect.
Default value: 2 Minimum value = 0 Maximum value = 1440

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

### -ToggleOrder
Configure this option to toggle order preference.
Default value: ASCENDING Possible values = ASCENDING, DESCENDING

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

### -Tosid
TOS ID of the virtual server.
Applicable only when the load balancing redirection mode is set to TOS.
Minimum value = 1 Maximum value = 63

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

### -TrofsPersistence
When value is ENABLED, Trofs persistence is honored.
When value is DISABLED, Trofs persistence is not honored.
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

### -V6NetmaskLen
Number of bits to consider in an IPv6 destination or source IP address, for creating the hash that is required by the DESTINATIONIPHASH and SOURCEIPHASH load balancing methods.
Default value: 128 Minimum value = 1 Maximum value = 128

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

### -V6PersistMaskLen
Persistence mask for IP based persistence types, for IPv6 virtual servers.
Default value: 128 Minimum value = 1 Maximum value = 128

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

### -VIPHeader
Name for the inserted header.
The default name is vip-header.
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

### -WASMModule
Name of the WASM module to assign to this virtual server.

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

### -Weight
Weight to assign to the specified service.
Minimum value = 1 Maximum value = 100

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

