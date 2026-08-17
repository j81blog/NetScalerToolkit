---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddCRVServer

## SYNOPSIS
Creates a NetScaler crvserver resource.

## SYNTAX

```
Invoke-NSAddCRVServer [-AppFlowLog <String>] [-Arp <String>] [-BackendSSL <String>] [-BackupVServer <String>]
 [-CacheType <String>] [-CacheVServer <String>] [-CltTimeout <Int32>] [-Comment <String>]
 [-DestinationVServer <String>] [-DisablePrimaryOnDown <String>] [-DisallowServiceAccess <String>]
 [-DNSVServerName <String>] [-Domain <String>] [-DownStateFlush <String>] [-FormAt <String>] [-GHost <String>]
 [-HTTPProfileName <String>] [-ICMPVsrResponse <String>] [-IPSet <String>] [-IPv46 <String>] [-L2Conn <String>]
 [-ListenPolicy <String>] [-ListenPriority <Int32>] [-Map <String>] [-Name] <String> [-NetProfile <String>]
 [-OnPolicyMatch <String>] [-OriginuSIP <String>] [-Port <Int32>] [-Precedence <String>] [-ProbePort <Int32>]
 [-ProbeProtocol <String>] [-ProbeSuccessResponseCode <String>] [-Range <Int32>] [-Redirect <String>]
 [-RedirectURL <String>] [-Reuse <String>] [-Rhistate <String>] -ServiceType <String>
 [-SoPersistenceTimeout <Int32>] [-SoThreshold <Int32>] [-Srcipexpr <String>] [-State <String>]
 [-TCPProbePort <Int32>] [-TCPProfileName <String>] [-TrafficDomain <Int32>]
 [-UseoriginipPortForcache <String>] [-UsePortRange <String>] [-Via <String>] [-WASMModule <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for CR virtual server resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddCRVServer -Name 'example' -ServiceType HTTP -IPv46 '192.0.2.10' -Port 80 -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddCRVServer -Name 'example' -ServiceType HTTP -IPv46 '192.0.2.10' -Port 80 -WhatIf
```

## PARAMETERS

### -AppFlowLog
Enable logging of AppFlow information.
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

### -Arp
Use ARP to determine the destination MAC address.
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

### -BackendSSL
Decides whether the backend connection made by Citrix ADC to the origin server will be HTTP or SSL.
Applicable only for SSL type CR Forward proxy vserver.
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

### -BackupVServer
Name of the backup virtual server to which traffic is forwarded if the active server becomes unavailable.
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

### -CacheType
Mode of operation for the cache redirection virtual server.
Available settings function as follows: * TRANSPARENT - Intercept all traffic flowing to the appliance and apply cache redirection policies to determine whether content should be served from the cache or from the origin server.
* FORWARD - Resolve the hostname of the incoming request, by using a DNS server, and forward requests for non-cacheable content to the resolved origin servers.
Cacheable requests are sent to the configured cache servers.
* REVERSE - Configure reverse proxy caches for specific origin servers.
Incoming traffic directed to the reverse proxy can either be served from a cache server or be sent to the origin server with or without modification to the URL.
The default value for cache type is TRANSPARENT if service is HTTP or SSL whereas the default cache type is FORWARD if the service is HDX.
Possible values = TRANSPARENT, REVERSE, FORWARD

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

### -CacheVServer
Name of the default cache virtual server to which to redirect requests (the default target of the cache redirection virtual server).
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

### -CltTimeout
Time-out value, in seconds, after which to terminate an idle client connection.
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
Comments associated with this virtual server.
Maximum length = 256

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

### -DestinationVServer
Destination virtual server for a transparent or forward proxy cache redirection virtual server.
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

### -DisablePrimaryOnDown
Continue sending traffic to a backup virtual server even after the primary virtual server comes UP from the DOWN state.
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

### -DisallowServiceAccess
This is effective when a FORWARD type cr vserver is added.
By default, this parameter is DISABLED.
When it is ENABLED, backend services cannot be accessed through a FORWARD type cr vserver.
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

### -DNSVServerName
Name of the DNS virtual server that resolves domain names arriving at the forward proxy virtual server.
Note: This parameter applies only to forward proxy virtual servers, not reverse or transparent.
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

### -Domain
Default domain for reverse proxies.
Domains are configured to direct an incoming request from a specified source domain to a specified target domain.
There can be several configured pairs of source and target domains.
You can select one pair to be the default.
If the host header or URL of an incoming request does not include a source domain, this option sends the request to the specified target domain.
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

### -DownStateFlush
Perform delayed cleanup of connections to this virtual server.
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

### -FormAt
.
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

### -GHost
.
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

### -HTTPProfileName
Name of the profile containing HTTP configuration information for cache redirection virtual server.
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

### -ICMPVsrResponse
Criterion for responding to PING requests sent to this virtual server.
If ACTIVE, respond only if the virtual server is available.
If PASSIVE, respond even if the virtual server is not available.
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

### -IPSet
The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cr vserver.
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
IPv4 or IPv6 address of the cache redirection virtual server.
Usually a public IP address.
Clients send connection requests to this IP address.
Note: For a transparent cache redirection virtual server, use an asterisk (*) to specify a wildcard virtual server address.

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
Use L2 parameters, such as MAC, VLAN, and channel to identify a connection.
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

### -ListenPolicy
String specifying the listen policy for the cache redirection virtual server.
Can be either an in-line expression or the name of a named expression.
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
Priority of the listen policy specified by the Listen Policy parameter.
The lower the number, higher the priority.
Default value: 101 Minimum value = 0 Maximum value = 100

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

### -Map
Obsolete.
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

### -Name
Name for the cache redirection virtual server.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters.
Can be changed after the cache redirection virtual server is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server').
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

### -NetProfile
Name of the network profile containing network configurations for the cache redirection virtual server.
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

### -OnPolicyMatch
Redirect requests that match the policy to either the cache or the origin server, as specified.
Note: For this option to work, you must set the cache redirection type to POLICY.
Default value: ORIGIN Possible values = CACHE, ORIGIN

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

### -OriginuSIP
Use the client's IP address as the source IP address in requests sent to the origin server.
Note: You can enable this parameter to implement fully transparent CR deployment.
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

### -Port
Port number of the virtual server.
Default value: 80 Minimum value = 1 Maximum value = 65534

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

### -Precedence
Type of policy (URL or RULE) that takes precedence on the cache redirection virtual server.
Applies only to cache redirection virtual servers that have both URL and RULE based policies.
If you specify URL, URL based policies are applied first, in the following order: 1.
Domain and exact URL 2.
Domain, prefix and suffix 3.
Domain and suffix 4.
Domain and prefix 5.
Domain only 6.
Exact URL 7.
Prefix and suffix 8.
Suffix only 9.
Prefix only 10.
Default If you specify RULE, the rule based policies are applied before URL based policies are applied.
Default value: RULE Possible values = RULE, URL

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

### -Range
Number of consecutive IP addresses, starting with the address specified by the IPAddress parameter, to include in a range of addresses assigned to this virtual server.
Default value: 1 Minimum value = 1 Maximum value = 254

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

### -Redirect
Type of cache server to which to redirect HTTP requests.
Available settings function as follows: * CACHE - Direct all requests to the cache.
* POLICY - Apply the cache redirection policy to determine whether the request should be directed to the cache or to the origin.
* ORIGIN - Direct all requests to the origin server.
Default value: POLICY Possible values = CACHE, POLICY, ORIGIN

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

### -RedirectURL
URL of the server to which to redirect traffic if the cache redirection virtual server configured on the Citrix ADC becomes unavailable.
Minimum length = 1 Maximum length = 128

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

### -Reuse
Reuse TCP connections to the origin server across client connections.
Do not set this parameter unless the Service Type parameter is set to HTTP.
If you set this parameter to OFF, the possible settings of the Redirect parameter function as follows: * CACHE - TCP connections to the cache servers are not reused.
* ORIGIN - TCP connections to the origin servers are not reused.
* POLICY - TCP connections to the origin servers are not reused.
If you set the Reuse parameter to ON, connections to origin servers and connections to cache servers are reused.
Default value: ON Possible values = ON, OFF

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
A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute.
* If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP.
* If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP.
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

### -ServiceType
Protocol (type of service) handled by the virtual server.
Possible values = HTTP, SSL, NNTP, HDX

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

### -SoPersistenceTimeout
Time-out, in minutes, for spillover persistence.
Minimum value = 2 Maximum value = 24

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
For CONNECTION (or) DYNAMICCONNECTION spillover, the number of connections above which the virtual server enters spillover mode.
For BANDWIDTH spillover, the amount of incoming and outgoing traffic (in Kbps) before spillover.
For HEALTH spillover, the percentage of active services (by weight) below which spillover occurs.
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

### -Srcipexpr
Expression used to extract the source IP addresses from the requests originating from the cache.
Can be either an in-line expression or the name of a named expression.
Minimum length = 1 Maximum length = 1500

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
Initial state of the cache redirection virtual server.
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
Name of the profile containing TCP configuration information for the cache redirection virtual server.
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

### -UseoriginipPortForcache
Use origin ip/port while forwarding request to the cache.
Change the destination IP, destination port of the request came to CR vserver to Origin IP and Origin Port and forward it to Cache.
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

### -UsePortRange
Use a port number from the port range (set by using the set ns param command, or in the Create Virtual Server (Cache Redirection) dialog box) as the source port in the requests sent to the origin server.
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

### -Via
Insert a via header in each HTTP request.
In the case of a cache miss, the request is redirected from the cache server to the origin server.
This header indicates whether the request is being sent from a cache server.
Default value: ON Possible values = ON, OFF

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

