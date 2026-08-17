---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetCSVServer

## SYNOPSIS
Clears one or more NetScaler csvserver resource properties.

## SYNTAX

```
Invoke-NSUnsetCSVServer [-Name] <String> [-APIProfile] [-AppFlowLog] [-Authentication] [-AuthenticationHost]
 [-Authn401] [-AuthnProfile] [-AuthnVServerName] [-BackupPersistenceTimeout] [-BackupVServer] [-Cacheable]
 [-Casesensitive] [-CltTimeout] [-Comment] [-CookieName] [-DBProfileName] [-DisablePrimaryOnDown]
 [-DNSOverHTTPS] [-DNSProfileName] [-DNSRecordType] [-DownStateFlush] [-Dtls] [-HTTPProfileName]
 [-HTTPSRedirectURL] [-ICMPVsrResponse] [-InsertVServerIPPort] [-IPSet] [-L2Conn] [-ListenPolicy]
 [-ListenPriority] [-MSSQLServerVersion] [-MySQLCharacterSet] [-MySQLProtocolVersion]
 [-MySQLServerCapabilities] [-MySQLServerVersion] [-NetProfile] [-OracleServerVersion] [-PersistenceBackup]
 [-PersistenceId] [-PersistenceType] [-PersistMask] [-Precedence] [-ProbeProtocol] [-ProbeSuccessResponseCode]
 [-Push] [-PushLabel] [-PushMultiClients] [-PushVServer] [-QUICProfileName] [-RedirectFromPort]
 [-RedirectPortRewrite] [-RedirectURL] [-Rhistate] [-RTSPNAT] [-SoBackupAction] [-SoMethod] [-SoPersistence]
 [-SoPersistenceTimeout] [-SoThreshold] [-Stateupdate] [-TCPProbePort] [-TCPProfileName] [-Timeout]
 [-V6PersistMaskLen] [-VIPHeader] [-WASMModule] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for CS virtual server resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetCSVServer -Name 'example' -APIProfile  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetCSVServer -Name 'example' -APIProfile  -WhatIf
```

## PARAMETERS

### -Name
Name for the content switching virtual server.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters.
Cannot be changed after the CS virtual server is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server).
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

### -APIProfile
The API profile where one or more API specs are bounded to.
Minimum length = 1

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

### -AppFlowLog
Enable logging appflow flow information.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Authentication
Authenticate users who request a connection to the content switching virtual server.
Default value: OFF Possible values = ON, OFF

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

### -AuthenticationHost
FQDN of the authentication virtual server.
The service type of the virtual server should be either HTTP or SSL.
Minimum length = 3 Maximum length = 252

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

### -Authn401
Enable HTTP 401-response based authentication.
Default value: OFF Possible values = ON, OFF

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

### -AuthnProfile
Name of the authentication profile to be used when authentication is turned on.

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

### -AuthnVServerName
Name of authentication virtual server that authenticates the incoming user requests to this content switching virtual server.
. Minimum length = 1 Maximum length = 252

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

### -BackupPersistenceTimeout
Time period for which backup persistence is in effect.
Default value: 2 Minimum value = 2 Maximum value = 1440

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

### -BackupVServer
Name of the backup virtual server that you are configuring.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters.
Can be changed after the backup virtual server is created.
You can assign a different backup virtual server or rename the existing virtual server.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks.
Minimum length = 1

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

### -Cacheable
Use this option to specify whether a virtual server, used for load balancing or content switching, routes requests to the cache redirection virtual server before sending it to the configured servers.
Default value: NO Possible values = YES, NO

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

### -Casesensitive
Consider case in URLs (for policies that use URLs instead of RULES).
For example, with the ON setting, the URLs /a/1.html and /A/1.HTML are treated differently and can have different targets (set by content switching policies).
With the OFF setting, /a/1.html and /A/1.HTML are switched to the same target.
Default value: ON Possible values = ON, OFF

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

### -CltTimeout
Idle time, in seconds, after which the client connection is terminated.
The default values are: 180 seconds for HTTP/SSL-based services.
9000 seconds for other TCP-based services.
120 seconds for DNS-based services.
120 seconds for other UDP-based services.
Minimum value = 0 Maximum value = 31536000

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

### -Comment
Information about this virtual server.

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

### -CookieName
Use this parameter to specify the cookie name for COOKIE peristence type.
It specifies the name of cookie with a maximum of 32 characters.
If not specified, cookie name is internally generated.

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

### -DBProfileName
Name of the DB profile.
Minimum length = 1 Maximum length = 127

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

### -DisablePrimaryOnDown
Continue forwarding the traffic to backup virtual server even after the primary server comes UP from the DOWN state.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -DNSOverHTTPS
This option is used to enable/disable DNS over HTTPS (DoH) processing.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -DNSProfileName
Name of the DNS profile to be associated with the VServer.
DNS profile properties will applied to the transactions processed by a VServer.
This parameter is valid only for DNS and DNS-TCP VServers.
Minimum length = 1 Maximum length = 127

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

### -DNSRecordType
.
Default value: NSGSLB_IPV4 Possible values = A, AAAA, CNAME, NAPTR

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

### -DownStateFlush
Flush all active transactions associated with a virtual server whose state transitions from UP to DOWN.
Do not enable this option for applications that must complete their transactions.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Dtls
This option starts/stops the dtls service on the vserver.
Default value: OFF Possible values = ON, OFF

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

### -HTTPProfileName
Name of the HTTP profile containing HTTP configuration settings for the virtual server.
The service type of the virtual server should be either HTTP or SSL.
Minimum length = 1 Maximum length = 127

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

### -HTTPSRedirectURL
URL to which all HTTP traffic received on the port specified in the -redirectFromPort parameter is redirected.

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

### -ICMPVsrResponse
Can be active or passive.
Default value: PASSIVE Possible values = PASSIVE, ACTIVE

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

### -InsertVServerIPPort
Insert the virtual server's VIP address and port number in the request header.
Available values function as follows: VIPADDR - Header contains the vserver's IP address and port number without any translation.
OFF - The virtual IP and port header insertion option is disabled.
V6TOV4MAPPING - Header contains the mapped IPv4 address corresponding to the IPv6 address of the vserver and the port number.
An IPv6 address can be mapped to a user-specified IPv4 address using the set ns ip6 command.
Possible values = OFF, VIPADDR, V6TOV4MAPPING

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

### -IPSet
The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cs vserver.
Minimum length = 1

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

### -L2Conn
Use L2 Parameters to identify a connection.
Possible values = ON, OFF

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

### -ListenPolicy
String specifying the listen policy for the content switching virtual server.
Can be either the name of an existing expression or an in-line expression.
Default value: "NONE"

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

### -ListenPriority
Integer specifying the priority of the listen policy.
A higher number specifies a lower priority.
If a request matches the listen policies of more than one virtual server the virtual server whose listen policy has the highest priority (the lowest priority number) accepts the request.
Default value: 101 Minimum value = 0 Maximum value = 100

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

### -MSSQLServerVersion
The version of the MSSQL server.
Default value: 2008R2 Possible values = 70, 2000, 2000SP1, 2005, 2008, 2008R2, 2012, 2014

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

### -MySQLCharacterSet
The character set returned by the mysql vserver.
Default value: 8

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

### -MySQLProtocolVersion
The protocol version returned by the mysql vserver.
Default value: 10

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

### -MySQLServerCapabilities
The server capabilities returned by the mysql vserver.
Default value: 41613

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

### -MySQLServerVersion
The server version string returned by the mysql vserver.
Minimum length = 1 Maximum length = 31

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

### -NetProfile
The name of the network profile.
Minimum length = 1 Maximum length = 127

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

### -OracleServerVersion
Oracle server version.
Default value: 10G Possible values = 10G, 11G

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

### -PersistenceBackup
Backup persistence type for the virtual server.
Becomes operational if the primary persistence mechanism fails.
Possible values = SOURCEIP, NONE

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

### -PersistenceId
.
Minimum value = 0 Maximum value = 65535

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

### -PersistenceType
Type of persistence for the virtual server.
Available settings function as follows: * SOURCEIP - Connections from the same client IP address belong to the same persistence session.
* COOKIEINSERT - Connections that have the same HTTP Cookie, inserted by a Set-Cookie directive from a server, belong to the same persistence session.
* SSLSESSION - Connections that have the same SSL Session ID belong to the same persistence session.
Possible values = SOURCEIP, COOKIEINSERT, SSLSESSION, NONE

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

### -PersistMask
Persistence mask for IP based persistence types, for IPv4 virtual servers.
Minimum length = 1

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

### -Precedence
Type of precedence to use for both RULE-based and URL-based policies on the content switching virtual server.
With the default (RULE) setting, incoming requests are evaluated against the rule-based content switching policies.
If none of the rules match, the URL in the request is evaluated against the URL-based content switching policies.
Default value: RULE Possible values = RULE, URL

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

### -ProbeProtocol
Citrix ADC provides support for external health check of the vserver status.
Select HTTP or TCP probes for healthcheck.
Possible values = TCP, HTTP

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

### -ProbeSuccessResponseCode
HTTP code to return in SUCCESS case.
Default value: "200 OK" Minimum length = 1 Maximum length = 64

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

### -Push
Process traffic with the push virtual server that is bound to this content switching virtual server (specified by the Push VServer parameter).
The service type of the push virtual server should be either HTTP or SSL.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -PushLabel
Expression for extracting the label from the response received from server.
This string can be either an existing rule name or an inline expression.
The service type of the virtual server should be either HTTP or SSL.
Default value: "none"

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

### -PushMultiClients
Allow multiple Web 2.0 connections from the same client to connect to the virtual server and expect updates.
Default value: NO Possible values = YES, NO

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

### -PushVServer
Name of the load balancing virtual server, of type PUSH or SSL_PUSH, to which the server pushes updates received on the client-facing load balancing virtual server.
Minimum length = 1

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

### -QUICProfileName
Name of QUIC profile which will be attached to the Content Switching VServer.
Minimum length = 1 Maximum length = 255

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

### -RedirectFromPort
Port number for the virtual server, from which we absorb the traffic for http redirect.
Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

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

### -RedirectPortRewrite
State of port rewrite while performing HTTP redirect.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -RedirectURL
URL to which traffic is redirected if the virtual server becomes unavailable.
The service type of the virtual server should be either HTTP or SSL.
Caution: Make sure that the domain in the URL does not match the domain specified for a content switching policy.
If it does, requests are continuously redirected to the unavailable virtual server.
Minimum length = 1

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

### -Rhistate
A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute.
* If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP.
* If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP.
Default value: PASSIVE Possible values = PASSIVE, ACTIVE

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

### -RTSPNAT
Enable network address translation (NAT) for real-time streaming protocol (RTSP) connections.
Default value: OFF Possible values = ON, OFF

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

### -SoBackupAction
Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists.
Possible values = DROP, ACCEPT, REDIRECT

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

### -SoMethod
Type of spillover used to divert traffic to the backup virtual server when the primary virtual server reaches the spillover threshold.
Connection spillover is based on the number of connections.
Bandwidth spillover is based on the total Kbps of incoming and outgoing traffic.
Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE

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

### -SoPersistence
Maintain source-IP based persistence on primary and backup virtual servers.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -SoPersistenceTimeout
Time-out value, in minutes, for spillover persistence.
Default value: 2 Minimum value = 2 Maximum value = 1440

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

### -SoThreshold
Depending on the spillover method, the maximum number of connections or the maximum total bandwidth (Kbps) that a virtual server can handle before spillover occurs.
Minimum value = 1 Maximum value = 4294967287

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

### -Stateupdate
Enable state updates for a specific content switching virtual server.
By default, the Content Switching virtual server is always UP, regardless of the state of the Load Balancing virtual servers bound to it.
This parameter interacts with the global setting as follows: Global Level | Vserver Level | Result ENABLED ENABLED ENABLED ENABLED DISABLED ENABLED DISABLED ENABLED ENABLED DISABLED DISABLED DISABLED If you want to enable state updates for only some content switching virtual servers, be sure to disable the state update parameter.
Default value: DISABLED Possible values = ENABLED, DISABLED, UPDATEONBACKENDUPDATE

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

### -TCPProbePort
Port number for external TCP probe.
NetScaler provides support for external TCP health check of the vserver status over the selected port.
This option is only supported for vservers assigned with an IPAddress or ipset.
Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

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

### -TCPProfileName
Name of the TCP profile containing TCP configuration settings for the virtual server.
Minimum length = 1 Maximum length = 127

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

### -Timeout
Time period for which a persistence session is in effect.
Default value: 2 Minimum value = 0 Maximum value = 1440

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

### -V6PersistMaskLen
Persistence mask for IP based persistence types, for IPv6 virtual servers.
Default value: 128 Minimum value = 1 Maximum value = 128

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

### -VIPHeader
Name of virtual server IP and port header, for use with the VServer IP Port Insertion parameter.
Minimum length = 1

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

### -WASMModule
Name of the WASM module to assign to this virtual server.

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

