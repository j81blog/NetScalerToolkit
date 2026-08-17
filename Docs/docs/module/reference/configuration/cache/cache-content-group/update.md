---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateCacheContentGroup

## SYNOPSIS
Updates a NetScaler cachecontentgroup resource.

## SYNTAX

```
Invoke-NSUpdateCacheContentGroup [-Absexpiry <String[]>] [-Absexpirygmt <String[]>]
 [-Alwaysevalpolicies <String>] [-Cachecontrol <String>] [-Expireatlastbyte <String>] [-Flashcache <String>]
 [-Heurexpiryparam <Int32>] [-Hitparams <String[]>] [-Hitselector <String>] [-Ignoreparamvaluecase <String>]
 [-Ignorereloadreq <String>] [-Ignorereqcachinghdrs <String>] [-InsertAge <String>] [-InsertEtag <String>]
 [-InsertVia <String>] [-Invalparams <String[]>] [-InvalrestrictedtoHost <String>] [-Invalselector <String>]
 [-LazyDNSResolve <String>] [-MatchCookieS <String>] [-MaxRessize <Int32>] [-Memlimit <Int32>]
 [-MinHits <Int32>] [-MinRessize <Int32>] [-Name] <String> [-Persistha <String>] [-Pinned <String>]
 [-Polleverytime <String>] [-Prefetch <String>] [-PrefetchMaxPending <Int32>] [-Prefetchperiod <Int32>]
 [-Prefetchperiodmillisec <Int32>] [-QUICKabortsize <Int32>] [-Relexpiry <Int32>] [-Relexpirymillisec <Int32>]
 [-RemoveCookieS <String>] [-Weaknegrelexpiry <Int32>] [-Weakposrelexpiry <Int32>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for Integrated Cache content group resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateCacheContentGroup -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateCacheContentGroup -Name 'example' -WhatIf
```

## PARAMETERS

### -Absexpiry
Local time, up to 4 times a day, at which all objects in the content group must expire.
CLI Users: For example, to specify that the objects in the content group should expire by 11:00 PM, type the following command: add cache contentgroup \<contentgroup name\> -absexpiry 23:00 To specify that the objects in the content group should expire at 10:00 AM, 3 PM, 6 PM, and 11:00 PM, type: add cache contentgroup \<contentgroup name\> -absexpiry 10:00 15:00 18:00 23:00.

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

### -Absexpirygmt
Coordinated Universal Time (GMT), up to 4 times a day, when all objects in the content group must expire.

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

### -Alwaysevalpolicies
Force policy evaluation for each response arriving from the origin server.
Cannot be set to YES if the Prefetch parameter is also set to YES.
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

### -Cachecontrol
Insert a Cache-Control header into the response.
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

### -Expireatlastbyte
Force expiration of the content immediately after the response is downloaded (upon receipt of the last byte of the response body).
Applicable only to positive responses.
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

### -Flashcache
Perform flash cache.
Mutually exclusive with Poll Every Time (PET) on the same content group.
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

### -Heurexpiryparam
Heuristic expiry time, in percent of the duration, since the object was last modified.
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

### -Hitparams
Parameters to use for parameterized hit evaluation of an object.
Up to 128 parameters can be specified.
Mutually exclusive with the Hit Selector parameter.
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

### -Hitselector
Selector for evaluating whether an object gets stored in a particular content group.
A selector is an abstraction for a collection of PIXL expressions.

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

### -Ignoreparamvaluecase
Ignore case when comparing parameter values during parameterized hit evaluation.
(Parameter value case is ignored by default during parameterized invalidation.).
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

### -Ignorereloadreq
Ignore any request to reload a cached object from the origin server.
To guard against Denial of Service attacks, set this parameter to YES.
For RFC-compliant behavior, set it to NO.
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

### -Ignorereqcachinghdrs
Ignore Cache-Control and Pragma headers in the incoming request.
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

### -InsertAge
Insert an Age header into the response.
An Age header contains information about the age of the object, in seconds, as calculated by the integrated cache.
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

### -InsertEtag
Insert an ETag header in the response.
With ETag header insertion, the integrated cache does not serve full responses on repeat requests.
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

### -InsertVia
Insert a Via header into the response.
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

### -Invalparams
Parameters for parameterized invalidation of an object.
You can specify up to 8 parameters.
Mutually exclusive with invalSelector.
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

### -InvalrestrictedtoHost
Take the host header into account during parameterized invalidation.
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

### -Invalselector
Selector for invalidating objects in the content group.
A selector is an abstraction for a collection of PIXL expressions.

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

### -LazyDNSResolve
Perform DNS resolution for responses only if the destination IP address in the request does not match the destination IP address of the cached response.
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

### -MatchCookieS
Evaluate for parameters in the cookie header also.
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

### -MaxRessize
Maximum size of a response that can be cached in this content group.
Default value: 80 Minimum value = 0 Maximum value = 2097151

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

### -Memlimit
Maximum amount of memory that the cache can use.
The effective limit is based on the available memory of the Citrix ADC.
Default value: 65536

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

### -MinHits
Number of hits that qualifies a response for storage in this content group.
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

### -MinRessize
Minimum size of a response that can be cached in this content group.
Default minimum response size is 0.
Minimum value = 0 Maximum value = 2097151

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

### -Name
Name for the content group.
Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after the content group is created.
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

### -Persistha
Setting persistHA to YES causes IC to save objects in contentgroup to Secondary node in HA deployment.
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

### -Pinned
Do not flush objects from this content group under memory pressure.
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

### -Polleverytime
Always poll for the objects in this content group.
That is, retrieve the objects from the origin server whenever they are requested.
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

### -Prefetch
Attempt to refresh objects that are about to go stale.
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

### -PrefetchMaxPending
Maximum number of outstanding prefetches that can be queued for the content group.
Minimum value = 0 Maximum value = 4294967294

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

### -Prefetchperiod
Time period, in seconds before an object's calculated expiry time, during which to attempt prefetch.
Minimum value = 0 Maximum value = 4294967294

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

### -Prefetchperiodmillisec
Time period, in milliseconds before an object's calculated expiry time, during which to attempt prefetch.
Minimum value = 0 Maximum value = 4294967290

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

### -QUICKabortsize
If the size of an object that is being downloaded is less than or equal to the quick abort value, and a client aborts during the download, the cache stops downloading the response.
If the object is larger than the quick abort size, the cache continues to download the response.
Default value: 4194303 Minimum value = 0 Maximum value = 4194303

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

### -Relexpiry
Relative expiry time, in seconds, after which to expire an object cached in this content group.
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

### -Relexpirymillisec
Relative expiry time, in milliseconds, after which to expire an object cached in this content group.
Minimum value = 0 Maximum value = 86400000

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

### -RemoveCookieS
Remove cookies from responses.
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

### -Weaknegrelexpiry
Relative expiry time, in seconds, for expiring negative responses.
This value is used only if the expiry time cannot be determined from any other source.
It is applicable only to the following status codes: 307, 403, 404, and 410.
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

### -Weakposrelexpiry
Relative expiry time, in seconds, for expiring positive responses with response codes between 200 and 399.
Cannot be used in combination with other Expiry attributes.
Similar to -relExpiry but has lower precedence.
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

