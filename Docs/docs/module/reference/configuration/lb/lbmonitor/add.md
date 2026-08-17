---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddLBMonitor

## SYNOPSIS
Creates a NetScaler lbmonitor resource.

## SYNTAX

```
Invoke-NSAddLBMonitor [-Acctapplicationid <String>] [-Action <String>] [-Alertretries <Int32>]
 [-Application <String>] [-Attribute <String>] [-Authapplicationid <String>] [-Basedn <String>]
 [-Binddn <String>] [-CustomHeaderS <String>] [-DataBase <String>] [-Destip <String>] [-DestPort <Int32>]
 [-Deviation <Int32>] [-Dispatcherip <String>] [-DispatcherPort <Int32>] [-Domain <String>] [-DownTime <Int32>]
 [-Evalrule <String>] [-Failureretries <Int32>] [-FileName <String>] [-Filter <String>]
 [-Firmwarerevision <Int32>] [-Group <String>] [-GrpcHealthCheck <String>] [-GrpcServiceName <String>]
 [-GrpcStatuscode <String>] [-HostIpaddress <String>] [-HostName <String>] [-HTTPRequest <String>]
 [-Inbandsecurityid <String>] [-Interval <Int32>] [-Ipaddress <String[]>] [-IPTunnel <String>]
 [-KCDAccount <String>] [-Lasversion <String>] [-LogonpointName <String>] [-Lrtm <String>]
 [-MaxForwards <Int32>] [-Metrictable <String>] [-MonItorName] <String> [-MqttClientIdentifier <String>]
 [-Mqttversion <Int32>] [-MssqlProtocolVersion <String>] [-NetProfile <String>] [-OracleSid <String>]
 [-OriginHost <String>] [-Originrealm <String>] [-Password <String>] [-ProductName <String>] [-Query <String>]
 [-QueryType <String>] [-RadAccountSession <String>] [-RadAccountType <Int32>] [-Radapn <String>]
 [-Radframedip <String>] [-RadKey <String>] [-Radmsisdn <String>] [-Radnasid <String>] [-RadnaSIP <String>]
 [-Recv <String>] [-ResponseCode <String[]>] [-ResponseTimeout <Int32>] [-ResponseTimeoutThresh <Int32>]
 [-Retries <Int32>] [-Reverse <String>] [-RtspRequest <String>] [-Scriptargs <String>] [-ScriptName <String>]
 [-Secondarypassword <String>] [-Secure <String>] [-Secureargs <String>] [-Send <String>] [-SIPMethod <String>]
 [-SIPReguri <String>] [-SIPUri <String>] [-Sitepath <String>] [-SNMPCommUnitY <String>] [-SNMPOid <String>]
 [-SNMPThreshold <String>] [-SNMPVersion <String>] [-Sqlquery <String>] [-SSLProfile <String>]
 [-State <String>] [-Storedb <String>] [-StorefrontacctService <String>]
 [-StorefrontcheckbackendServiceS <String>] [-StoreName <String>] [-SuccessRetries <Int32>]
 [-SupPortEdvendorids <String>] [-Tos <String>] [-Tosid <Int32>] [-Transparent <String>] [-Trofscode <Int32>]
 [-Trofsstring <String>] -Type <String> [-UnitS1 <String>] [-UnitS2 <String>] [-UnitS3 <String>]
 [-UnitS4 <String>] [-UserName <String>] [-Validatecred <String>] [-Vendorid <Int32>]
 [-VendorSpecIficacctapplicationids <String>] [-VendorSpecIficauthapplicationids <String>]
 [-VendorSpecIficvendorid <Int32>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for monitor resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddLBMonitor -MonItorName 'example' -Type 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddLBMonitor -MonItorName 'example' -Type 'example' -WhatIf
```

## PARAMETERS

### -Acctapplicationid
List of Acct-Application-Id attribute value pairs (AVPs) for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
A maximum of eight of these AVPs are supported in a monitoring message.
Minimum value = 0 Maximum value = 4294967295

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

### -Action
Action to perform when the response to an inline monitor (a monitor of type HTTP-INLINE) indicates that the service is down.
A service monitored by an inline monitor is considered DOWN if the response code is not one of the codes that have been specified for the Response Code parameter.
Available settings function as follows: * NONE - Do not take any action.
However, the show service command and the show lb monitor command indicate the total number of responses that were checked and the number of consecutive error responses received after the last successful probe.
* LOG - Log the event in NSLOG or SYSLOG.
* DOWN - Mark the service as being down, and then do not direct any traffic to the service until the configured down time has expired.
Persistent connections to the service are terminated as soon as the service is marked as DOWN.
Also, log the event in NSLOG or SYSLOG.
Default value: DOWN Possible values = NONE, LOG, DOWN

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

### -Alertretries
Number of consecutive probe failures after which the appliance generates an SNMP trap called monProbeFailed.
Minimum value = 0 Maximum value = 32

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

### -Application
Name of the application used to determine the state of the service.
Applicable to monitors of type CITRIX-XML-SERVICE.
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

### -Attribute
Attribute to evaluate when the LDAP server responds to the query.
Success or failure of the monitoring probe depends on whether the attribute exists in the response.
Optional.
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

### -Authapplicationid
List of Auth-Application-Id attribute value pairs (AVPs) for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
A maximum of eight of these AVPs are supported in a monitoring CER message.
Minimum value = 0 Maximum value = 4294967295

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

### -Basedn
The base distinguished name of the LDAP service, from where the LDAP server can begin the search for the attributes in the monitoring query.
Required for LDAP service monitoring.
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

### -Binddn
The distinguished name with which an LDAP monitor can perform the Bind operation on the LDAP server.
Optional.
Applicable to LDAP monitors.
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

### -CustomHeaderS
Custom header string to include in the monitoring probes.

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

### -DataBase
Name of the database to connect to during authentication.
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

### -Destip
IP address of the service to which to send probes.
If the parameter is set to 0, the IP address of the server to which the monitor is bound is considered the destination IP address.

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
TCP or UDP port to which to send the probe.
If the parameter is set to 0, the port number of the service to which the monitor is bound is considered the destination port.
For a monitor of type USER, however, the destination port is the port number that is included in the HTTP request sent to the dispatcher.
Does not apply to monitors of type PING.

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

### -Deviation
Time value added to the learned average response time in dynamic response time monitoring (DRTM).
When a deviation is specified, the appliance learns the average response time of bound services and adds the deviation to the average.
The final value is then continually adjusted to accommodate response time variations over time.
Specified in milliseconds, seconds, or minutes.
Minimum value = 0 Maximum value = 20939

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

### -Dispatcherip
IP address of the dispatcher to which to send the probe.

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

### -DispatcherPort
Port number on which the dispatcher listens for the monitoring probe.

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

### -Domain
Domain in which the XenDesktop Desktop Delivery Controller (DDC) servers or Web Interface servers are present.
Required by CITRIX-XD-DDC and CITRIX-WI-EXTENDED monitors for logging on to the DDC servers and Web Interface servers, respectively.

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

### -DownTime
Time duration for which to wait before probing a service that has been marked as DOWN.
Expressed in milliseconds, seconds, or minutes.
Default value: 30 Minimum value = 1 Maximum value = 20939

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

### -Evalrule
Expression that evaluates the database server's response to a MYSQL-ECV or MSSQL-ECV monitoring query.
Must produce a Boolean result.
The result determines the state of the server.
If the expression returns TRUE, the probe succeeds.
For example, if you want the appliance to evaluate the error message to determine the state of the server, use the rule MYSQL.RES.ROW(10) .TEXT_ELEM(2).EQ("MySQL").

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

### -Failureretries
Number of retries that must fail, out of the number specified for the Retries parameter, for a service to be marked as DOWN.
For example, if the Retries parameter is set to 10 and the Failure Retries parameter is set to 6, out of the ten probes sent, at least six probes must fail if the service is to be marked as DOWN.
The default value of 0 means that all the retries must fail if the service is to be marked as DOWN.
Minimum value = 0 Maximum value = 32

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

### -FileName
Name of a file on the FTP server.
The appliance monitors the FTP service by periodically checking the existence of the file on the server.
Applicable to FTP-EXTENDED monitors.
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

### -Filter
Filter criteria for the LDAP query.
Optional.
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

### -Firmwarerevision
Firmware-Revision value for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.

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

### -Group
Name of a newsgroup available on the NNTP service that is to be monitored.
The appliance periodically generates an NNTP query for the name of the newsgroup and evaluates the response.
If the newsgroup is found on the server, the service is marked as UP.
If the newsgroup does not exist or if the search fails, the service is marked as DOWN.
Applicable to NNTP monitors.
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

### -GrpcHealthCheck
Option to enable or disable gRPC health check service.
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

### -GrpcServiceName
Option to specify gRPC service name on which gRPC health check need to be performed.

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

### -GrpcStatuscode
gRPC status codes for which to mark the service as UP.
The default value is 12(health check unimplemented).
If the gRPC status code 0 is received from the backend this configuration is ignored.

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

### -HostIpaddress
Host-IP-Address value for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
If Host-IP-Address is not specified, the appliance inserts the mapped IP (MIP) address or subnet IP (SNIP) address from which the CER request (the monitoring probe) is sent.
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

### -HostName
Hostname in the FQDN format (Example: porche.cars.org).
Applicable to STOREFRONT monitors.
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

### -HTTPRequest
HTTP request to send to the server (for example, "HEAD /file.html").

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

### -Inbandsecurityid
Inband-Security-Id for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
Possible values = NO_INBAND_SECURITY, TLS

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

### -Interval
Time interval between two successive probes.
Must be greater than the value of Response Time-out.
Default value: 5 Minimum value = 1 Maximum value = 20940

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

### -Ipaddress
Set of IP addresses expected in the monitoring response from the DNS server, if the record type is A or AAAA.
Applicable to DNS monitors.
Minimum length = 1

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPTunnel
Send the monitoring probe to the service through an IP tunnel.
A destination IP address must be specified.
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

### -KCDAccount
KCD Account used by MSSQL monitor.
Minimum length = 1 Maximum length = 32

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

### -Lasversion
Version number of the Citrix Advanced Access Control Logon Agent.
Required by the CITRIX-AAC-LAS monitor.

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

### -LogonpointName
Name of the logon point that is configured for the Citrix Access Gateway Advanced Access Control software.
Required if you want to monitor the associated login page or Logon Agent.
Applicable to CITRIX-AAC-LAS and CITRIX-AAC-LOGINPAGE monitors.

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

### -Lrtm
Calculate the least response times for bound services.
If this parameter is not enabled, the appliance does not learn the response times of the bound services.
Also used for LRTM load balancing.
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

### -MaxForwards
Maximum number of hops that the SIP request used for monitoring can traverse to reach the server.
Applicable only to monitors of type SIP-UDP.
Default value: 1 Minimum value = 0 Maximum value = 255

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

### -Metrictable
Metric table to which to bind metrics.
Minimum length = 1 Maximum length = 99

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

### -MonItorName
Name for the monitor.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my monitor" or 'my monitor').
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

### -MqttClientIdentifier
Client id to be used in Connect command.

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

### -Mqttversion
Version of MQTT protocol used in connect message, default is version 3.1.1 \[4\].
Default value: 4 Minimum value = 3

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

### -MssqlProtocolVersion
Version of MSSQL server that is to be monitored.
Default value: 70 Possible values = 70, 2000, 2000SP1, 2005, 2008, 2008R2, 2012, 2014

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
Name of the network profile.
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

### -OracleSid
Name of the service identifier that is used to connect to the Oracle database during authentication.
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

### -OriginHost
Origin-Host value for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
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

### -Originrealm
Origin-Realm value for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
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

### -Password
Password that is required for logging on to the RADIUS, NNTP, FTP, FTP-EXTENDED, MYSQL, MSSQL, POP3, CITRIX-AG, CITRIX-XD-DDC, CITRIX-WI-EXTENDED, CITRIX-XNC-ECV or CITRIX-XDM server.
Used in conjunction with the user name specified for the User Name parameter.
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

### -ProductName
Product-Name value for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
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

### -Query
Domain name to resolve as part of monitoring the DNS service (for example, example.com).

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

### -QueryType
Type of DNS record for which to send monitoring queries.
Set to Address for querying A records, AAAA for querying AAAA records, and Zone for querying the SOA record.
Possible values = Address, Zone, AAAA

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

### -RadAccountSession
Account Session ID to be used in Account Request Packet.
Applicable to monitors of type RADIUS_ACCOUNTING.
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

### -RadAccountType
Account Type to be used in Account Request Packet.
Applicable to monitors of type RADIUS_ACCOUNTING.
Default value: 1 Minimum value = 0 Maximum value = 15

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

### -Radapn
Called Station Id to be used in Account Request Packet.
Applicable to monitors of type RADIUS_ACCOUNTING.
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

### -Radframedip
Source ip with which the packet will go out .
Applicable to monitors of type RADIUS_ACCOUNTING.

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

### -RadKey
Authentication key (shared secret text string) for RADIUS clients and servers to exchange.
Applicable to monitors of type RADIUS and RADIUS_ACCOUNTING.
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

### -Radmsisdn
Calling Stations Id to be used in Account Request Packet.
Applicable to monitors of type RADIUS_ACCOUNTING.
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

### -Radnasid
NAS-Identifier to send in the Access-Request packet.
Applicable to monitors of type RADIUS.
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

### -RadnaSIP
Network Access Server (NAS) IP address to use as the source IP address when monitoring a RADIUS server.
Applicable to monitors of type RADIUS and RADIUS_ACCOUNTING.

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

### -Recv
String expected from the server for the service to be marked as UP.
Applicable to TCP-ECV, HTTP-ECV, and UDP-ECV monitors.

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

### -ResponseCode
Response codes for which to mark the service as UP.
For any other response code, the action performed depends on the monitor type.
HTTP monitors and RADIUS monitors mark the service as DOWN, while HTTP-INLINE monitors perform the action indicated by the Action parameter.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResponseTimeout
Amount of time for which the appliance must wait before it marks a probe as FAILED.
Must be less than the value specified for the Interval parameter.
Note: For UDP-ECV monitors for which a receive string is not configured, response timeout does not apply.
For UDP-ECV monitors with no receive string, probe failure is indicated by an ICMP port unreachable error received from the service.
Default value: 2 Minimum value = 1 Maximum value = 20939

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

### -ResponseTimeoutThresh
Response time threshold, specified as a percentage of the Response Time-out parameter.
If the response to a monitor probe has not arrived when the threshold is reached, the appliance generates an SNMP trap called monRespTimeoutAboveThresh.
After the response time returns to a value below the threshold, the appliance generates a monRespTimeoutBelowThresh SNMP trap.
For the traps to be generated, the "MONITOR-RTO-THRESHOLD" alarm must also be enabled.
Minimum value = 0 Maximum value = 100

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

### -Retries
Maximum number of probes to send to establish the state of a service for which a monitoring probe failed.
Default value: 3 Minimum value = 1 Maximum value = 127

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

### -Reverse
Mark a service as DOWN, instead of UP, when probe criteria are satisfied, and as UP instead of DOWN when probe criteria are not satisfied.
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

### -RtspRequest
RTSP request to send to the server (for example, "OPTIONS *").

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

### -Scriptargs
String of arguments for the script.
The string is copied verbatim into the request.

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

### -ScriptName
Path and name of the script to execute.
The script must be available on the Citrix ADC, in the /nsconfig/monitors/ directory.
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

### -Secondarypassword
Secondary password that users might have to provide to log on to the Access Gateway server.
Applicable to CITRIX-AG monitors.

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

### -Secure
Use a secure SSL connection when monitoring a service.
Applicable only to TCP based monitors.
The secure option cannot be used with a CITRIX-AG monitor, because a CITRIX-AG monitor uses a secure connection by default.
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

### -Secureargs
List of arguments for the script which should be secure.

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

### -Send
String to send to the service.
Applicable to TCP-ECV, HTTP-ECV, and UDP-ECV monitors.

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

### -SIPMethod
SIP method to use for the query.
Applicable only to monitors of type SIP-UDP.
Possible values = OPTIONS, INVITE, REGISTER

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

### -SIPReguri
SIP user to be registered.
Applicable only if the monitor is of type SIP-UDP and the SIP Method parameter is set to REGISTER.
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

### -SIPUri
SIP URI string to send to the service (for example, sip:sip.test).
Applicable only to monitors of type SIP-UDP.
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

### -Sitepath
URL of the logon page.
For monitors of type CITRIX-WEB-INTERFACE, to monitor a dynamic page under the site path, terminate the site path with a slash (/).
Applicable to CITRIX-WEB-INTERFACE, CITRIX-WI-EXTENDED and CITRIX-XDM monitors.
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

### -SNMPCommUnitY
Community name for SNMP monitors.
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

### -SNMPOid
SNMP OID for SNMP monitors.
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

### -SNMPThreshold
Threshold for SNMP monitors.
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

### -SNMPVersion
SNMP version to be used for SNMP monitors.
Possible values = V1, V2

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

### -Sqlquery
SQL query for a MYSQL-ECV or MSSQL-ECV monitor.
Sent to the database server after the server authenticates the connection.
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

### -SSLProfile
SSL Profile associated with the monitor.
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

### -State
State of the monitor.
The DISABLED setting disables not only the monitor being configured, but all monitors of the same type, until the parameter is set to ENABLED.
If the monitor is bound to a service, the state of the monitor is not taken into account when the state of the service is determined.
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

### -Storedb
Store the database list populated with the responses to monitor probes.
Used in database specific load balancing if MSSQL-ECV/MYSQL-ECV monitor is configured.
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

### -StorefrontacctService
Enable/Disable probing for Account Service.
Applicable only to Store Front monitors.
For multi-tenancy configuration users my skip account service.
Default value: YES Possible values = YES, NO

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

### -StorefrontcheckbackendServiceS
This option will enable monitoring of services running on storefront server.
Storefront services are monitored by probing to a Windows service that runs on the Storefront server and exposes details of which storefront services are running.
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

### -StoreName
Store Name.
For monitors of type STOREFRONT, STORENAME is an optional argument defining storefront service store name.
Applicable to STOREFRONT monitors.
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

### -SuccessRetries
Number of consecutive successful probes required to transition a service's state from DOWN to UP.
Default value: 1 Minimum value = 1 Maximum value = 32

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

### -SupPortEdvendorids
List of Supported-Vendor-Id attribute value pairs (AVPs) for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
A maximum eight of these AVPs are supported in a monitoring message.
Minimum value = 1 Maximum value = 4294967295

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

### -Tos
Probe the service by encoding the destination IP address in the IP TOS (6) bits.
Possible values = YES, NO

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
The TOS ID of the specified destination IP.
Applicable only when the TOS parameter is set.
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

### -Transparent
The monitor is bound to a transparent device such as a firewall or router.
The state of a transparent device depends on the responsiveness of the services behind it.
If a transparent device is being monitored, a destination IP address must be specified.
The probe is sent to the specified IP address by using the MAC address of the transparent device.
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

### -Trofscode
Code expected when the server is under maintenance.

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

### -Trofsstring
String expected from the server for the service to be marked as trofs.
Applicable to HTTP-ECV/TCP-ECV monitors.

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
Type of monitor that you want to create.
Possible values = PING, TCP, HTTP, TCP-ECV, HTTP-ECV, UDP-ECV, DNS, FTP, LDNS-PING, LDNS-TCP, LDNS-DNS, RADIUS, USER, HTTP-INLINE, SIP-UDP, SIP-TCP, LOAD, FTP-EXTENDED, SMTP, SNMP, NNTP, MYSQL, MYSQL-ECV, MSSQL-ECV, ORACLE-ECV, LDAP, POP3, CITRIX-XML-SERVICE, CITRIX-WEB-INTERFACE, DNS-TCP, RTSP, ARP, CITRIX-AG, CITRIX-AAC-LOGINPAGE, CITRIX-AAC-LAS, CITRIX-XD-DDC, ND6, CITRIX-WI-EXTENDED, DIAMETER, RADIUS_ACCOUNTING, STOREFRONT, APPC, SMPP, CITRIX-XNC-ECV, CITRIX-XDM, CITRIX-STA-SERVICE, CITRIX-STA-SERVICE-NHOP, MQTT, HTTP2, DTLS, QUIC, KAFKA-AUTODISCOVER

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

### -UnitS1
Unit of measurement for the Deviation parameter.
Cannot be changed after the monitor is created.
Default value: SEC Possible values = SEC, MSEC, MIN

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

### -UnitS2
Unit of measurement for the Down Time parameter.
Cannot be changed after the monitor is created.
Default value: SEC Possible values = SEC, MSEC, MIN

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

### -UnitS3
monitor interval units.
Default value: SEC Possible values = SEC, MSEC, MIN

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

### -UnitS4
monitor response timeout units.
Default value: SEC Possible values = SEC, MSEC, MIN

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

### -UserName
User name with which to probe the RADIUS, NNTP, FTP, FTP-EXTENDED, MYSQL, MSSQL, POP3, CITRIX-AG, CITRIX-XD-DDC, CITRIX-WI-EXTENDED, CITRIX-XNC or CITRIX-XDM server.
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

### -Validatecred
Validate the credentials of the Xen Desktop DDC server user.
Applicable to monitors of type CITRIX-XD-DDC.
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

### -Vendorid
Vendor-Id value for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.

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

### -VendorSpecIficacctapplicationids
List of Vendor-Specific-Acct-Application-Id attribute value pairs (AVPs) to use for monitoring Diameter servers.
A maximum of eight of these AVPs are supported in a monitoring message.
The specified value is combined with the value of vendorSpecificVendorId to obtain the Vendor-Specific-Application-Id AVP in the CER monitoring message.
Minimum value = 0 Maximum value = 4294967295

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

### -VendorSpecIficauthapplicationids
List of Vendor-Specific-Auth-Application-Id attribute value pairs (AVPs) for the Capabilities-Exchange-Request (CER) message to use for monitoring Diameter servers.
A maximum of eight of these AVPs are supported in a monitoring message.
The specified value is combined with the value of vendorSpecificVendorId to obtain the Vendor-Specific-Application-Id AVP in the CER monitoring message.
Minimum value = 0 Maximum value = 4294967295

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

### -VendorSpecIficvendorid
Vendor-Id to use in the Vendor-Specific-Application-Id grouped attribute-value pair (AVP) in the monitoring CER message.
To specify Auth-Application-Id or Acct-Application-Id in Vendor-Specific-Application-Id, use vendorSpecificAuthApplicationIds or vendorSpecificAcctApplicationIds, respectively.
Only one Vendor-Id is supported for all the Vendor-Specific-Application-Id AVPs in a CER monitoring message.
Minimum value = 1

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

