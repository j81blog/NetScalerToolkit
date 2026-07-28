---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateDNSParameter

## SYNOPSIS
Updates a NetScaler dnsparameter resource.

## SYNTAX

```
Invoke-NSUpdateDNSParameter [[-AutosaveKeyOps] <String>] [[-Cacheecszeroprefix] <String>]
 [[-CachehitBypass] <String>] [[-Cachenoexpire] <String>] [[-CacheRecordS] <String>] [[-DNS64Timeout] <Int32>]
 [[-DNSRootreferral] <String>] [[-DNSSec] <String>] [[-EcsMaxSubnets] <Int32>] [[-MaxCachesize] <Int32>]
 [[-MaxNegativecachesize] <Int32>] [[-MaxNegcachettl] <Int32>] [[-MaxPipeline] <Int32>] [[-MaxTtl] <Int32>]
 [[-MaxUDPPacketsize] <Int32>] [[-MinTtl] <Int32>] [[-NameLookupPriority] <String>]
 [[-NxdomainratelimitThreshold] <Int32>] [[-Recursion] <String>] [[-Resolutionorder] <String>]
 [[-ResolverMaxActiveresolutions] <Int32>] [[-ResolverMaxTCPConnectionS] <Int32>]
 [[-ResolverMaxTCPTimeout] <Int32>] [[-Retries] <Int32>] [[-SplitpktqueryProcessIng] <String>]
 [[-Zonetransfer] <String>] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for DNS parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateDNSParameter  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateDNSParameter  -WhatIf
```

## PARAMETERS

### -AutosaveKeyOps
Flag to enable/disable saving of rollover operations executed automatically to avoid config loss.
Applicable only when autorollover option is enabled on a key.
Note: when you enable this, full configuration will be saved.
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

### -Cacheecszeroprefix
Cache ECS responses with a Scope Prefix length of zero.
Such a cached response will be used for all queries with this domain name and any subnet.
When disabled, ECS responses with Scope Prefix length of zero will be cached, but not tied to any subnet.
This option has no effect if caching of ECS responses is disabled in the corresponding DNS profile.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -CachehitBypass
This parameter is applicable only in proxy mode and if this parameter is enabled we will forward all the client requests to the backend DNS server and the response served will be cached on Citrix ADC.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Cachenoexpire
If this flag is set to YES, the existing entries in cache do not age out.
On reaching the max limit the cache records are frozen.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -CacheRecordS
Cache resource records in the DNS cache.
Applies to resource records obtained through proxy configurations only.
End resolver and forwarder configurations always cache records in the DNS cache, and you cannot disable this behavior.
When you disable record caching, the appliance stops caching server responses.
However, cached records are not flushed.
The appliance does not serve requests from the cache until record caching is enabled again.
Default value: YES Possible values = YES, NO

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

### -DNS64Timeout
While doing DNS64 resolution, this parameter specifies the time to wait before sending an A query if no response is received from backend DNS server for AAAA query.
Minimum value = 0 Maximum value = 10000

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

### -DNSRootreferral
Send a root referral if a client queries a domain name that is unrelated to the domains configured/cached on the Citrix ADC.
If the setting is disabled, the appliance sends a blank response instead of a root referral.
Applicable to domains for which the appliance is authoritative.
Disable the parameter when the appliance is under attack from a client that is sending a flood of queries for unrelated domains.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -DNSSec
Enable or disable the Domain Name System Security Extensions (DNSSEC) feature on the appliance.
Note: Even when the DNSSEC feature is enabled, forwarder configurations (used by internal Citrix ADC features such as SSL VPN and Cache Redirection for name resolution) do not support the DNSSEC OK (DO) bit in the EDNS0 OPT header.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -EcsMaxSubnets
Maximum number of subnets that can be cached corresponding to a single domain.
Subnet caching will occur for responses with EDNS Client Subnet (ECS) option.
Caching of such responses can be disabled using DNS profile settings.
A value of zero indicates that the number of subnets cached is limited only by existing memory constraints.
The default value is zero.
Default value: 0 Minimum value = 0 Maximum value = 1280

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxCachesize
Maximum memory, in megabytes, that can be used for dns caching per Packet Engine.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxNegativecachesize
Maximum memory, in megabytes, that can be used for caching of negative DNS responses per packet engine.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxNegcachettl
Maximum time to live (TTL) for all negative records ( NXDONAIN and NODATA ) cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations.
If the TTL of a record that is to be cached is higher than the value configured for maxnegcacheTTL, the TTL of the record is set to the value of maxnegcacheTTL before caching.
When you modify this setting, the new value is applied only to those records that are cached after the modification.
The TTL values of existing records are not changed.
Default value: 604800 Minimum value = 1 Maximum value = 604800

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

### -MaxPipeline
Maximum number of concurrent DNS requests to allow on a single client connection, which is identified by the \<clientip:port\>-\<vserver ip:port\> tuple.
A value of 0 (zero) applies no limit to the number of concurrent DNS requests allowed on a single client connection.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxTtl
Maximum time to live (TTL) for all records cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations.
If the TTL of a record that is to be cached is higher than the value configured for maxTTL, the TTL of the record is set to the value of maxTTL before caching.
When you modify this setting, the new value is applied only to those records that are cached after the modification.
The TTL values of existing records are not changed.
Default value: 604800 Minimum value = 1 Maximum value = 604800

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxUDPPacketsize
Maximum UDP packet size that can be handled by Citrix ADC.
This is the value advertised by Citrix ADC when responding as an authoritative server and it is also used when Citrix ADC queries other name servers as a forwarder.
When acting as a proxy, requests from clients are limited by this parameter - if a request contains a size greater than this value in the OPT record, it will be replaced.
Default value: 1280 Minimum value = 512 Maximum value = 16384

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

### -MinTtl
Minimum permissible time to live (TTL) for all records cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations.
If the TTL of a record that is to be cached is lower than the value configured for minTTL, the TTL of the record is set to the value of minTTL before caching.
When you modify this setting, the new value is applied only to those records that are cached after the modification.
The TTL values of existing records are not changed.
Minimum value = 0 Maximum value = 604800

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -NameLookupPriority
Type of lookup (DNS or WINS) to attempt first.
If the first-priority lookup fails, the second-priority lookup is attempted.
Used only by the SSL VPN feature.
Default value: WINS Possible values = WINS, DNS

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

### -NxdomainratelimitThreshold
Rate limit threshold for Non-Existant domain (NXDOMAIN) responses generated from Citrix ADC.
Once the threshold is breached , DNS queries leading to NXDOMAIN response will be dropped.
This threshold will not be applied for NXDOMAIN responses got from the backend.
The threshold will be applied per packet engine and per second.

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

### -Recursion
Function as an end resolver and recursively resolve queries for domains that are not hosted on the Citrix ADC.
Also resolve queries recursively when the external name servers configured on the appliance (for a forwarder configuration) are unavailable.
When external name servers are unavailable, the appliance queries a root server and resolves the request recursively, as it does for an end resolver configuration.
This parameter will be effective only for queries recieved on nameserver with local flag.
To enable recursion for queries recieved through ADNS service , CS vserver and LB vserver it is recommended to use recursiveResolution parameter on DNS profile.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Resolutionorder
Type of DNS queries (A, AAAA, or both) to generate during the routine functioning of certain Citrix ADC features, such as SSL VPN, cache redirection, and the integrated cache.
The queries are sent to the external name servers that are configured for the forwarder function.
If you specify both query types, you can also specify the order.
Available settings function as follows: * OnlyAQuery.
Send queries for IPv4 address records (A records) only.
* OnlyAAAAQuery.
Send queries for IPv6 address records (AAAA records) instead of queries for IPv4 address records (A records).
* AThenAAAAQuery.
Send a query for an A record, and then send a query for an AAAA record if the query for the A record results in a NODATA response from the name server.
* AAAAThenAQuery.
Send a query for an AAAA record, and then send a query for an A record if the query for the AAAA record results in a NODATA response from the name server.
Default value: OnlyAQuery Possible values = OnlyAQuery, OnlyAAAAQuery, AThenAAAAQuery, AAAAThenAQuery

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

### -ResolverMaxActiveresolutions
Maximum number of active concurrent DNS resolutions per Packet Engine.
Default value: 0

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResolverMaxTCPConnectionS
Maximum DNS-TCP connections opened for recursive resolution per Packet Engine.
Default value: 1000 Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResolverMaxTCPTimeout
Maximum wait time in seconds for the response on DNS-TCP connection for recursive resolution per Packet Engine.
Default value: 5 Minimum value = 1 Maximum value = 120

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Retries
Maximum number of retry attempts when no response is received for a query sent to a name server.
Applies to end resolver and forwarder configurations.
Default value: 5 Minimum value = 1 Maximum value = 5

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SplitpktqueryProcessIng
Processing requests split across multiple packets.
Default value: ALLOW Possible values = ALLOW, DROP

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Zonetransfer
Flag to enable/disable DNS zones configuration transfer to remote GSLB site nodes.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
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
Position: 27
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

