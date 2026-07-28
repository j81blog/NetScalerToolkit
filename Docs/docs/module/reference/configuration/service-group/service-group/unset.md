---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetServiceGroup

## SYNOPSIS
Clears one or more NetScaler servicegroup resource properties.

## SYNTAX

```
Invoke-NSUnsetServiceGroup [-ServiceGroupName] <String> [-AppFlowLog] [-AutoDelayedTROFS] [-AutoDisableDelay]
 [-AutoDisableGraceful] [-Cacheable] [-CIP] [-CIPHeader] [-CKA] [-CltTimeout] [-CMP] [-Comment]
 [-CustomServerID] [-DBSTTL] [-DownStateFlush] [-DupWeight] [-HashID] [-HealthMonitor] [-HTTPProfileName]
 [-MaxBandwidth] [-MaxClient] [-MaxReq] [-MonConnectionClose] [-MonitorNameSvc] [-MonThreshold] [-NameServer]
 [-NetProfile] [-Order] [-PathMonitor] [-PathMonitorIndv] [-Port] [-QUICProfileName] [-RTSPSessionIDRemap]
 [-ServerID] [-ServerName] [-SP] [-SvrTimeout] [-TCPB] [-TCPProfileName] [-UseProxyPort] [-USIP] [-Weight]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for service group resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetServiceGroup -ServiceGroupName 'example' -AppFlowLog ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetServiceGroup -ServiceGroupName 'example' -AppFlowLog ENABLED -WhatIf
```

## PARAMETERS

### -ServiceGroupName
Name of the service group.
Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Can be changed after the name is created.
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
Enable logging of AppFlow information for the specified service group.
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

### -AutoDelayedTROFS
Indicates graceful movement of IP-Port binding/s to TROFS when IP addresses are removed from DNS response.
System will wait for monitor response timeout period before moving to TROFS .
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

### -AutoDisableDelay
The time allowed (in seconds) for a graceful shutdown.
During this period, new connections or requests will continue to be sent to this service for clients who already have a persistent session on the system.
Connections or requests from fresh or new clients who do not yet have a persistence sessions on the system will not be sent to the service.
Instead, they will be load balanced among other available services.
After the delay time expires, no new requests or connections will be sent to the service.

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

### -AutoDisableGraceful
Indicates graceful shutdown of the service.
System will wait for all outstanding connections to this service to be closed before disabling the service.
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

### -Cacheable
Use the transparent cache redirection virtual server to forward the request to the cache server.
Note: Do not set this parameter if you set the Cache Type.
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

### -CIP
Insert the Client IP header in requests forwarded to the service.
Possible values = ENABLED, DISABLED

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

### -CIPHeader
Name of the HTTP header whose value must be set to the IP address of the client.
Used with the Client IP parameter.
If client IP insertion is enabled, and the client IP header is not specified, the value of Client IP Header parameter or the value set by the set ns config command is used as client's IP header name.
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

### -CKA
Enable client keep-alive for the service group.
Possible values = YES, NO

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
Time, in seconds, after which to terminate an idle client connection.
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

### -CMP
Enable compression for the specified service.
Possible values = YES, NO

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
Any information about the service group.

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

### -CustomServerID
The identifier for this IP:Port pair.
Used when the persistency type is set to Custom Server ID.
Default value: "None"

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

### -DBSTTL
Specify the TTL for DNS record for domain based service.The default value of ttl is 0 which indicates to use the TTL received in DNS response for monitors.
Default value: 0

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
Flush all active transactions associated with all the services in the service group whose state transitions from UP to DOWN.
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

### -DupWeight
weight of the monitor that is bound to servicegroup.
Minimum value = 1

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

### -HashID
The hash identifier for the service.
This must be unique for each service.
This parameter is used by hash based load balancing methods.
Minimum value = 1

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

### -HealthMonitor
Monitor the health of this service.
Available settings function as follows: YES - Send probes to check the health of the service.
NO - Do not send probes to check the health of the service.
With the NO option, the appliance shows the service as UP at all times.
Default value: YES Possible values = YES, NO

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
Name of the HTTP profile that contains HTTP configuration settings for the service group.
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

### -MaxBandwidth
Maximum bandwidth, in Kbps, allocated for all the services in the service group.
Minimum value = 0 Maximum value = 4294967287

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

### -MaxClient
Maximum number of simultaneous open connections for the service group.
Minimum value = 0 Maximum value = 4294967294

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

### -MaxReq
Maximum number of requests that can be sent on a persistent connection to the service group.
Note: Connection requests beyond this value are rejected.
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

### -MonConnectionClose
Close monitoring connections by sending the service a connection termination message with the specified bit set.
Default value: NONE Possible values = RESET, FIN

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

### -MonitorNameSvc
Name of the monitor bound to the service group.
Used to assign a weight to the monitor.
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

### -MonThreshold
Minimum sum of weights of the monitors that are bound to this service.
Used to determine whether to mark a service as UP or DOWN.
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

### -NameServer
Specify the nameserver to which the query for bound domain needs to be sent.
If not specified, use the global nameserver.

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
Network profile for the service group.
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

### -Order
Order number to be assigned to the servicegroup member.
Minimum value = 1 Maximum value = 8192

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

### -PathMonitor
Path monitoring for clustering.
Possible values = YES, NO

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

### -PathMonitorIndv
Individual Path monitoring decisions.
Possible values = YES, NO

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

### -Port
Server port number.
Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

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
Name of QUIC profile which will be attached to the service group.
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

### -RTSPSessionIDRemap
Enable RTSP session ID mapping for the service group.
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

### -ServerID
The identifier for the service.
This is used when the persistency type is set to Custom Server ID.

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

### -ServerName
Name of the server to which to bind the service group.
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

### -SP
Enable surge protection for the service group.
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

### -SvrTimeout
Time, in seconds, after which to terminate an idle server connection.
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

### -TCPB
Enable TCP buffering for the service group.
Possible values = YES, NO

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
Name of the TCP profile that contains TCP configuration settings for the service group.
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

### -UseProxyPort
Use the proxy port as the source port when initiating connections with the server.
With the NO setting, the client-side connection port is used as the source port for the server-side connection.
Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES.
Possible values = YES, NO

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

### -USIP
Use client's IP address as the source IP address when initiating connection to the server.
With the NO setting, which is the default, a mapped IP (MIP) address or subnet IP (SNIP) address is used as the source IP address to initiate server side connections.
Possible values = YES, NO

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

### -Weight
Weight to assign to the servers in the service group.
Specifies the capacity of the servers relative to the other servers in the load balancing configuration.
The higher the weight, the higher the percentage of requests sent to the service.
Minimum value = 1 Maximum value = 100

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

