---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateGSLBVServer

## SYNOPSIS
Updates a NetScaler gslbvserver resource.

## SYNTAX

```
Invoke-NSUpdateGSLBVServer [-AppFlowLog <String>] [-BackupIp <String>] [-BackupLBMethod <String>]
 [-BackupSessionTimeout <Int32>] [-BackupVServer <String>] [-Comment <String>]
 [-Considereffectivestate <String>] [-CookieDomain <String>] [-CookieTimeout <Int32>]
 [-DisablePrimaryOnDown <String>] [-DNSRecordType <String>] [-DomainName <String>] [-Dynamicweight <String>]
 [-Ecs <String>] [-Ecsaddrvalidation <String>] [-Edr <String>] [-IpType <String>] [-LBMethod <String>]
 [-Mir <String>] [-Name] <String> [-NetMask <String>] [-Order <Int32>] [-OrderThreshold <Int32>]
 [-PersistenceId <Int32>] [-PersistenceType <String>] [-PersistMask <String>] [-Rule <String>]
 [-ServiceGroupName <String>] [-ServiceName <String>] [-Sitedomainttl <Int32>] [-SoBackupAction <String>]
 [-SoMethod <String>] [-SoPersistence <String>] [-SoPersistenceTimeout <Int32>] [-SoThreshold <Int32>]
 [-Timeout <Int32>] [-ToggleOrder <String>] [-Tolerance <Int32>] [-Ttl <Int32>] [-V6NetmaskLen <Int32>]
 [-V6PersistMaskLen <Int32>] [-Weight <Int32>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Global Server Load Balancing Virtual Server resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateGSLBVServer -Name 'example' -LBMethod ROUNDROBIN -Comment 'Updated by automation' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateGSLBVServer -Name 'example' -LBMethod ROUNDROBIN -Comment 'Updated by automation' -WhatIf
```

## PARAMETERS

### -AppFlowLog
Enable logging appflow flow information.
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

### -BackupIp
The IP address of the backup service for the specified domain name.
Used when all the services bound to the domain are down, or when the backup chain of virtual servers is down.
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

### -BackupLBMethod
Backup load balancing method.
Becomes operational if the primary load balancing method fails or cannot be used.
Valid only if the primary method is based on either round-trip time (RTT) or static proximity.
Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API

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

### -BackupSessionTimeout
A non zero value enables the feature whose minimum value is 2 minutes.
The feature can be disabled by setting the value to zero.
The created session is in effect for a specific client per domain.
Minimum value = 0 Maximum value = 1440

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
Name of the backup GSLB virtual server to which the appliance should to forward requests if the status of the primary GSLB virtual server is down or exceeds its spillover threshold.
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

### -Comment
Any comments that you might want to associate with the GSLB virtual server.

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

### -Considereffectivestate
If the primary state of all bound GSLB services is DOWN, consider the effective states of all the GSLB services, obtained through the Metrics Exchange Protocol (MEP), when determining the state of the GSLB virtual server.
To consider the effective state, set the parameter to STATE_ONLY.
To disregard the effective state, set the parameter to NONE.
The effective state of a GSLB service is the ability of the corresponding virtual server to serve traffic.
The effective state of the load balancing virtual server, which is transferred to the GSLB service, is UP even if only one virtual server in the backup chain of virtual servers is in the UP state.
Default value: NONE Possible values = NONE, STATE_ONLY

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

### -CookieDomain
The cookie domain for the GSLB site.
Used when inserting the GSLB site cookie in the HTTP response.
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

### -CookieTimeout
Timeout, in minutes, for the GSLB site cookie.
Minimum value = 0 Maximum value = 1440

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

### -DisablePrimaryOnDown
Continue to direct traffic to the backup chain even after the primary GSLB virtual server returns to the UP state.
Used when spillover is configured for the virtual server.
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

### -DNSRecordType
DNS record type to associate with the GSLB virtual server's domain name.
Default value: A Possible values = A, AAAA, CNAME, NAPTR

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

### -DomainName
Domain name for which to change the time to live (TTL) and/or backup service IP address.
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

### -Dynamicweight
Specify if the appliance should consider the service count, service weights, or ignore both when using weight-based load balancing methods.
The state of the number of services bound to the virtual server help the appliance to select the service.
Default value: DISABLED Possible values = SERVICECOUNT, SERVICEWEIGHT, DISABLED

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

### -Ecs
If enabled, respond with EDNS Client Subnet (ECS) option in the response for a DNS query with ECS.
The ECS address will be used for persistence and spillover persistence (if enabled) instead of the LDNS address.
Persistence mask is ignored if ECS is enabled.
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

### -Ecsaddrvalidation
Validate if ECS address is a private or unroutable address and in such cases, use the LDNS IP.
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

### -Edr
Send clients an empty DNS response when the GSLB virtual server is DOWN.
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

### -IpType
The IP type for this GSLB vserver.
Default value: IPV4 Possible values = IPV4, IPV6

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
Load balancing method for the GSLB virtual server.
Default value: LEASTCONNECTION Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API

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

### -Mir
Include multiple IP addresses in the DNS responses sent to clients.
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
Name for the GSLB virtual server.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Can be changed after the virtual server is created.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver').
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

### -NetMask
IPv4 network mask for use in the SOURCEIPHASH load balancing method.
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

### -PersistenceId
The persistence ID for the GSLB virtual server.
The ID is a positive integer that enables GSLB sites to identify the GSLB virtual server, and is required if source IP address based or spill over based persistence is enabled on the virtual server.
Minimum value = 0 Maximum value = 65535

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

### -PersistenceType
Use source IP address based persistence for the virtual server.
After the load balancing method selects a service for the first packet, the IP address received in response to the DNS query is used for subsequent requests from the same client.
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

### -PersistMask
The optional IPv4 network mask applied to IPv4 addresses to establish source IP address based persistence.
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

### -Rule
Expression, or name of a named expression, against which traffic is evaluated.
This field is applicable only if gslb method or gslb backup method are set to API.
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

### -ServiceGroupName
The GSLB service group name bound to the selected GSLB virtual server.

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
Name of the GSLB service for which to change the weight.
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

### -Sitedomainttl
TTL, in seconds, for all internally created site domains (created when a site prefix is configured on a GSLB service) that are associated with this virtual server.
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
* DYNAMICCONNECTION - Spillover occurs when the number of client connections at the GSLB virtual server exceeds the sum of the maximum client (Max Clients) settings for bound GSLB services.
Do not specify a spillover threshold for this setting, because the threshold is implied by the Max Clients settings of the bound GSLB services.
* BANDWIDTH - Spillover occurs when the bandwidth consumed by the GSLB virtual server's incoming and outgoing traffic exceeds the threshold.
* HEALTH - Spillover occurs when the percentage of weights of the GSLB services that are UP drops below the threshold.
For example, if services gslbSvc1, gslbSvc2, and gslbSvc3 are bound to a virtual server, with weights 1, 2, and 3, and the spillover threshold is 50%, spillover occurs if gslbSvc1 and gslbSvc3 or gslbSvc2 and gslbSvc3 transition to DOWN.
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
If spillover occurs, maintain source IP address based persistence for both primary and backup GSLB virtual servers.
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

### -Timeout
Idle time, in minutes, after which a persistence entry is cleared.
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

### -Tolerance
Tolerance in milliseconds.
Tolerance value is used in deciding which sites in a GSLB configuration must be considered for implementing the RTT load balancing method.
The sites having the RTT value less than or equal to the sum of the lowest RTT and tolerance value are considered.
NetScaler implements the round robin method of global server load balancing among these considered sites.
The sites that have RTT value greater than this value are not considered.
The logic is applied for each LDNS and based on the LDNS, the sites that are considered might change.
For example, a site that is considered for requests coming from LDNS1 might not be considered for requests coming from LDNS2.
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

### -Ttl
Time to live (TTL) for the domain.
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

### -V6NetmaskLen
Number of bits to consider, in an IPv6 source IP address, for creating the hash that is required by the SOURCEIPHASH load balancing method.
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
Number of bits to consider in an IPv6 source IP address when creating source IP address based persistence sessions.
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

### -Weight
Weight for the service.
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

