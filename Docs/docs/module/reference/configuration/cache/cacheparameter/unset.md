---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetCacheparameter

## SYNOPSIS
Clears one or more NetScaler cacheparameter resource properties.

## SYNTAX

```
Invoke-NSUnsetCacheparameter [-CacheevictionPolicy] [-EnableBypass] [-Enablehaobjpersist] [-MaxPostlen]
 [-Memlimit] [-PrefetchMaxPending] [-UndefAction] [-Verifyusing] [-Via] [[-Session] <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for cache parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetCacheparameter -CacheevictionPolicy RELAXED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetCacheparameter -CacheevictionPolicy RELAXED -WhatIf
```

## PARAMETERS

### -CacheevictionPolicy
The cacheEvictionPolicy determines the threshold for preemptive eviction of cache objects using the LRU (Least Recently Used) algorithm.
If set to AGGRESSIVE, eviction is triggered when free cache memory drops to 40%.
MODERATE triggers eviction at 25%, and RELAXED triggers eviction at 10%.
Default value: RELAXED Possible values = RELAXED, MODERATE, AGGRESSIVE

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

### -EnableBypass
Evaluate the request-time policies before attempting hit selection.
If set to NO, an incoming request for which a matching object is found in cache storage results in a response regardless of the policy configuration.
If the request matches a policy with a NOCACHE action, the request bypasses all cache processing.
This parameter does not affect processing of requests that match any invalidation policy.
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

### -Enablehaobjpersist
The HA object persisting parameter.
When this value is set to YES, cache objects can be synced to Secondary in a HA deployment.
If set to NO, objects will never be synced to Secondary node.
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

### -MaxPostlen
Maximum number of POST body bytes to consider when evaluating parameters for a content group for which you have configured hit parameters and invalidation parameters.
Default value: 4096 Minimum value = 0 Maximum value = 131072

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

### -Memlimit
Amount of memory available for storing the cache objects.
In practice, the amount of memory available for caching can be less than half the total memory of the Citrix ADC.

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

### -PrefetchMaxPending
Maximum number of outstanding prefetches in the Integrated Cache.

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

### -UndefAction
Action to take when a policy cannot be evaluated.
Possible values = NOCACHE, RESET

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

### -Verifyusing
Criteria for deciding whether a cached object can be served for an incoming HTTP request.
Available settings function as follows: HOSTNAME - The URL, host name, and host port values in the incoming HTTP request header must match the cache policy.
The IP address and the TCP port of the destination host are not evaluated.
Do not use the HOSTNAME setting unless you are certain that no rogue client can access a rogue server through the cache.
HOSTNAME_AND_IP - The URL, host name, host port in the incoming HTTP request header, and the IP address and TCP port of the destination server, must match the cache policy.
DNS - The URL, host name and host port in the incoming HTTP request, and the TCP port must match the cache policy.
The host name is used for DNS lookup of the destination server's IP address, and is compared with the set of addresses returned by the DNS lookup.
Possible values = HOSTNAME, HOSTNAME_AND_IP, DNS

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
String to include in the Via header.
A Via header is inserted into all responses served from a content group if its Insert Via flag is set.
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

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

