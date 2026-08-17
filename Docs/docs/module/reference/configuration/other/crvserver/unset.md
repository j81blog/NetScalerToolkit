---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetCRVServer

## SYNOPSIS
Clears one or more NetScaler crvserver resource properties.

## SYNTAX

```
Invoke-NSUnsetCRVServer [-Name] <String> [-AppFlowLog] [-Arp] [-BackendSSL] [-BackupVServer] [-CacheVServer]
 [-CltTimeout] [-Comment] [-DestinationVServer] [-DisablePrimaryOnDown] [-DisallowServiceAccess]
 [-DNSVServerName] [-Domain] [-DownStateFlush] [-HTTPProfileName] [-ICMPVsrResponse] [-IPSet] [-L2Conn]
 [-ListenPolicy] [-ListenPriority] [-NetProfile] [-OnPolicyMatch] [-OriginuSIP] [-Precedence] [-ProbeProtocol]
 [-ProbeSuccessResponseCode] [-Redirect] [-RedirectURL] [-Reuse] [-Rhistate] [-Srcipexpr] [-TCPProbePort]
 [-TCPProfileName] [-UseoriginipPortForcache] [-UsePortRange] [-Via] [-WASMModule] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for CR virtual server resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetCRVServer -Name 'example' -AppFlowLog ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetCRVServer -Name 'example' -AppFlowLog ENABLED -WhatIf
```

## PARAMETERS

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
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AppFlowLog
Enable logging of AppFlow information.
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

### -Arp
Use ARP to determine the destination MAC address.
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

### -BackendSSL
Decides whether the backend connection made by Citrix ADC to the origin server will be HTTP or SSL.
Applicable only for SSL type CR Forward proxy vserver.
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

### -BackupVServer
Name of the backup virtual server to which traffic is forwarded if the active server becomes unavailable.
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

### -CacheVServer
Name of the default cache virtual server to which to redirect requests (the default target of the cache redirection virtual server).
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

### -CltTimeout
Time-out value, in seconds, after which to terminate an idle client connection.
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
Comments associated with this virtual server.
Maximum length = 256

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

### -DestinationVServer
Destination virtual server for a transparent or forward proxy cache redirection virtual server.
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

### -DisablePrimaryOnDown
Continue sending traffic to a backup virtual server even after the primary virtual server comes UP from the DOWN state.
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

### -DisallowServiceAccess
This is effective when a FORWARD type cr vserver is added.
By default, this parameter is DISABLED.
When it is ENABLED, backend services cannot be accessed through a FORWARD type cr vserver.
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

### -DNSVServerName
Name of the DNS virtual server that resolves domain names arriving at the forward proxy virtual server.
Note: This parameter applies only to forward proxy virtual servers, not reverse or transparent.
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

### -Domain
Default domain for reverse proxies.
Domains are configured to direct an incoming request from a specified source domain to a specified target domain.
There can be several configured pairs of source and target domains.
You can select one pair to be the default.
If the host header or URL of an incoming request does not include a source domain, this option sends the request to the specified target domain.
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

### -DownStateFlush
Perform delayed cleanup of connections to this virtual server.
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

### -HTTPProfileName
Name of the profile containing HTTP configuration information for cache redirection virtual server.
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

### -ICMPVsrResponse
Criterion for responding to PING requests sent to this virtual server.
If ACTIVE, respond only if the virtual server is available.
If PASSIVE, respond even if the virtual server is not available.
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

### -IPSet
The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cr vserver.
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
Use L2 parameters, such as MAC, VLAN, and channel to identify a connection.
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
String specifying the listen policy for the cache redirection virtual server.
Can be either an in-line expression or the name of a named expression.
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
Priority of the listen policy specified by the Listen Policy parameter.
The lower the number, higher the priority.
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

### -NetProfile
Name of the network profile containing network configurations for the cache redirection virtual server.
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

### -OnPolicyMatch
Redirect requests that match the policy to either the cache or the origin server, as specified.
Note: For this option to work, you must set the cache redirection type to POLICY.
Default value: ORIGIN Possible values = CACHE, ORIGIN

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

### -OriginuSIP
Use the client's IP address as the source IP address in requests sent to the origin server.
Note: You can enable this parameter to implement fully transparent CR deployment.
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

### -Redirect
Type of cache server to which to redirect HTTP requests.
Available settings function as follows: * CACHE - Direct all requests to the cache.
* POLICY - Apply the cache redirection policy to determine whether the request should be directed to the cache or to the origin.
* ORIGIN - Direct all requests to the origin server.
Default value: POLICY Possible values = CACHE, POLICY, ORIGIN

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
URL of the server to which to redirect traffic if the cache redirection virtual server configured on the Citrix ADC becomes unavailable.
Minimum length = 1 Maximum length = 128

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

### -Reuse
Reuse TCP connections to the origin server across client connections.
Do not set this parameter unless the Service Type parameter is set to HTTP.
If you set this parameter to OFF, the possible settings of the Redirect parameter function as follows: * CACHE - TCP connections to the cache servers are not reused.
* ORIGIN - TCP connections to the origin servers are not reused.
* POLICY - TCP connections to the origin servers are not reused.
If you set the Reuse parameter to ON, connections to origin servers and connections to cache servers are reused.
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

### -Srcipexpr
Expression used to extract the source IP addresses from the requests originating from the cache.
Can be either an in-line expression or the name of a named expression.
Minimum length = 1 Maximum length = 1500

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
Name of the profile containing TCP configuration information for the cache redirection virtual server.
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

### -UseoriginipPortForcache
Use origin ip/port while forwarding request to the cache.
Change the destination IP, destination port of the request came to CR vserver to Origin IP and Origin Port and forward it to Cache.
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

### -UsePortRange
Use a port number from the port range (set by using the set ns param command, or in the Create Virtual Server (Cache Redirection) dialog box) as the source port in the requests sent to the origin server.
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

### -Via
Insert a via header in each HTTP request.
In the case of a cache miss, the request is redirected from the cache server to the origin server.
This header indicates whether the request is being sent from a cache server.
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

