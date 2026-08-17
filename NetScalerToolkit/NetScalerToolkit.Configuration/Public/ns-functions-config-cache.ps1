# Generated NetScalerToolkit Configuration bundle for category 'cache'.

# region Invoke-NSAddCacheContentGroup
function Invoke-NSAddCacheContentGroup {
    <#
    .SYNOPSIS
        Creates a NetScaler cachecontentgroup resource.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER Absexpiry
        Local time, up to 4 times a day, at which all objects in the content group must expire. CLI Users: For example, to specify that the objects in the content group should expire by 11:00 PM, type the following command: add cache contentgroup <contentgroup name> -absexpiry 23:00 To specify that the objects in the content group should expire at 10:00 AM, 3 PM, 6 PM, and 11:00 PM, type: add cache contentgroup <contentgroup name> -absexpiry 10:00 15:00 18:00 23:00.
    .PARAMETER Absexpirygmt
        Coordinated Universal Time (GMT), up to 4 times a day, when all objects in the content group must expire.
    .PARAMETER Alwaysevalpolicies
        Force policy evaluation for each response arriving from the origin server. Cannot be set to YES if the Prefetch parameter is also set to YES. Default value: NO Possible values = YES, NO
    .PARAMETER Cachecontrol
        Insert a Cache-Control header into the response. Minimum length = 1
    .PARAMETER Expireatlastbyte
        Force expiration of the content immediately after the response is downloaded (upon receipt of the last byte of the response body). Applicable only to positive responses. Default value: NO Possible values = YES, NO
    .PARAMETER Flashcache
        Perform flash cache. Mutually exclusive with Poll Every Time (PET) on the same content group. Default value: NO Possible values = YES, NO
    .PARAMETER Heurexpiryparam
        Heuristic expiry time, in percent of the duration, since the object was last modified. Minimum value = 0 Maximum value = 100
    .PARAMETER Hitparams
        Parameters to use for parameterized hit evaluation of an object. Up to 128 parameters can be specified. Mutually exclusive with the Hit Selector parameter. Minimum length = 1
    .PARAMETER Hitselector
        Selector for evaluating whether an object gets stored in a particular content group. A selector is an abstraction for a collection of PIXL expressions.
    .PARAMETER Ignoreparamvaluecase
        Ignore case when comparing parameter values during parameterized hit evaluation. (Parameter value case is ignored by default during parameterized invalidation.). Possible values = YES, NO
    .PARAMETER Ignorereloadreq
        Ignore any request to reload a cached object from the origin server. To guard against Denial of Service attacks, set this parameter to YES. For RFC-compliant behavior, set it to NO. Default value: YES Possible values = YES, NO
    .PARAMETER Ignorereqcachinghdrs
        Ignore Cache-Control and Pragma headers in the incoming request. Default value: YES Possible values = YES, NO
    .PARAMETER InsertAge
        Insert an Age header into the response. An Age header contains information about the age of the object, in seconds, as calculated by the integrated cache. Default value: YES Possible values = YES, NO
    .PARAMETER InsertEtag
        Insert an ETag header in the response. With ETag header insertion, the integrated cache does not serve full responses on repeat requests. Default value: YES Possible values = YES, NO
    .PARAMETER InsertVia
        Insert a Via header into the response. Default value: YES Possible values = YES, NO
    .PARAMETER Invalparams
        Parameters for parameterized invalidation of an object. You can specify up to 8 parameters. Mutually exclusive with invalSelector. Minimum length = 1
    .PARAMETER InvalrestrictedtoHost
        Take the host header into account during parameterized invalidation. Possible values = YES, NO
    .PARAMETER Invalselector
        Selector for invalidating objects in the content group. A selector is an abstraction for a collection of PIXL expressions.
    .PARAMETER LazyDNSResolve
        Perform DNS resolution for responses only if the destination IP address in the request does not match the destination IP address of the cached response. Default value: YES Possible values = YES, NO
    .PARAMETER MatchCookieS
        Evaluate for parameters in the cookie header also. Possible values = YES, NO
    .PARAMETER MaxRessize
        Maximum size of a response that can be cached in this content group. Default value: 80 Minimum value = 0 Maximum value = 2097151
    .PARAMETER Memlimit
        Maximum amount of memory that the cache can use. The effective limit is based on the available memory of the Citrix ADC. Default value: 65536
    .PARAMETER MinHits
        Number of hits that qualifies a response for storage in this content group. Default value: 0
    .PARAMETER MinRessize
        Minimum size of a response that can be cached in this content group. Default minimum response size is 0. Minimum value = 0 Maximum value = 2097151
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER Persistha
        Setting persistHA to YES causes IC to save objects in contentgroup to Secondary node in HA deployment. Default value: NO Possible values = YES, NO
    .PARAMETER Pinned
        Do not flush objects from this content group under memory pressure. Default value: NO Possible values = YES, NO
    .PARAMETER Polleverytime
        Always poll for the objects in this content group. That is, retrieve the objects from the origin server whenever they are requested. Default value: NO Possible values = YES, NO
    .PARAMETER Prefetch
        Attempt to refresh objects that are about to go stale. Default value: YES Possible values = YES, NO
    .PARAMETER PrefetchMaxPending
        Maximum number of outstanding prefetches that can be queued for the content group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Prefetchperiod
        Time period, in seconds before an object's calculated expiry time, during which to attempt prefetch. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Prefetchperiodmillisec
        Time period, in milliseconds before an object's calculated expiry time, during which to attempt prefetch. Minimum value = 0 Maximum value = 4294967290
    .PARAMETER QUICKabortsize
        If the size of an object that is being downloaded is less than or equal to the quick abort value, and a client aborts during the download, the cache stops downloading the response. If the object is larger than the quick abort size, the cache continues to download the response. Default value: 4194303 Minimum value = 0 Maximum value = 4194303
    .PARAMETER Relexpiry
        Relative expiry time, in seconds, after which to expire an object cached in this content group. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Relexpirymillisec
        Relative expiry time, in milliseconds, after which to expire an object cached in this content group. Minimum value = 0 Maximum value = 86400000
    .PARAMETER RemoveCookieS
        Remove cookies from responses. Default value: YES Possible values = YES, NO
    .PARAMETER Type
        The type of the content group. Default value: HTTP Possible values = HTTP, MYSQL, MSSQL
    .PARAMETER Weaknegrelexpiry
        Relative expiry time, in seconds, for expiring negative responses. This value is used only if the expiry time cannot be determined from any other source. It is applicable only to the following status codes: 307, 403, 404, and 410. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Weakposrelexpiry
        Relative expiry time, in seconds, for expiring positive responses with response codes between 200 and 399. Cannot be used in combination with other Expiry attributes. Similar to -relExpiry but has lower precedence. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddCacheContentGroup -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCacheContentGroup -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string[]] $Absexpiry,

        [Parameter()]
        [string[]] $Absexpirygmt,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Alwaysevalpolicies,

        [Parameter()]
        [string] $Cachecontrol,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Expireatlastbyte,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Flashcache,

        [Parameter()]
        [int] $Heurexpiryparam,

        [Parameter()]
        [string[]] $Hitparams,

        [Parameter()]
        [string] $Hitselector,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Ignoreparamvaluecase,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Ignorereloadreq,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Ignorereqcachinghdrs,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InsertAge,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InsertEtag,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InsertVia,

        [Parameter()]
        [string[]] $Invalparams,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InvalrestrictedtoHost,

        [Parameter()]
        [string] $Invalselector,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $LazyDNSResolve,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $MatchCookieS,

        [Parameter()]
        [int] $MaxRessize,

        [Parameter()]
        [int] $Memlimit,

        [Parameter()]
        [int] $MinHits,

        [Parameter()]
        [int] $MinRessize,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Persistha,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Pinned,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Polleverytime,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Prefetch,

        [Parameter()]
        [int] $PrefetchMaxPending,

        [Parameter()]
        [int] $Prefetchperiod,

        [Parameter()]
        [int] $Prefetchperiodmillisec,

        [Parameter()]
        [int] $QUICKabortsize,

        [Parameter()]
        [int] $Relexpiry,

        [Parameter()]
        [int] $Relexpirymillisec,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $RemoveCookieS,

        [Parameter()]
        [ValidateSet('HTTP', 'MYSQL', 'MSSQL')]
        [string] $Type,

        [Parameter()]
        [int] $Weaknegrelexpiry,

        [Parameter()]
        [int] $Weakposrelexpiry,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Absexpiry')) { $properties['absexpiry'] = $Absexpiry }
    if ($PSBoundParameters.ContainsKey('Absexpirygmt')) { $properties['absexpirygmt'] = $Absexpirygmt }
    if ($PSBoundParameters.ContainsKey('Alwaysevalpolicies')) { $properties['alwaysevalpolicies'] = $Alwaysevalpolicies }
    if ($PSBoundParameters.ContainsKey('Cachecontrol')) { $properties['cachecontrol'] = $Cachecontrol }
    if ($PSBoundParameters.ContainsKey('Expireatlastbyte')) { $properties['expireatlastbyte'] = $Expireatlastbyte }
    if ($PSBoundParameters.ContainsKey('Flashcache')) { $properties['flashcache'] = $Flashcache }
    if ($PSBoundParameters.ContainsKey('Heurexpiryparam')) { $properties['heurexpiryparam'] = $Heurexpiryparam }
    if ($PSBoundParameters.ContainsKey('Hitparams')) { $properties['hitparams'] = $Hitparams }
    if ($PSBoundParameters.ContainsKey('Hitselector')) { $properties['hitselector'] = $Hitselector }
    if ($PSBoundParameters.ContainsKey('Ignoreparamvaluecase')) { $properties['ignoreparamvaluecase'] = $Ignoreparamvaluecase }
    if ($PSBoundParameters.ContainsKey('Ignorereloadreq')) { $properties['ignorereloadreq'] = $Ignorereloadreq }
    if ($PSBoundParameters.ContainsKey('Ignorereqcachinghdrs')) { $properties['ignorereqcachinghdrs'] = $Ignorereqcachinghdrs }
    if ($PSBoundParameters.ContainsKey('InsertAge')) { $properties['insertage'] = $InsertAge }
    if ($PSBoundParameters.ContainsKey('InsertEtag')) { $properties['insertetag'] = $InsertEtag }
    if ($PSBoundParameters.ContainsKey('InsertVia')) { $properties['insertvia'] = $InsertVia }
    if ($PSBoundParameters.ContainsKey('Invalparams')) { $properties['invalparams'] = $Invalparams }
    if ($PSBoundParameters.ContainsKey('InvalrestrictedtoHost')) { $properties['invalrestrictedtohost'] = $InvalrestrictedtoHost }
    if ($PSBoundParameters.ContainsKey('Invalselector')) { $properties['invalselector'] = $Invalselector }
    if ($PSBoundParameters.ContainsKey('LazyDNSResolve')) { $properties['lazydnsresolve'] = $LazyDNSResolve }
    if ($PSBoundParameters.ContainsKey('MatchCookieS')) { $properties['matchcookies'] = $MatchCookieS }
    if ($PSBoundParameters.ContainsKey('MaxRessize')) { $properties['maxressize'] = $MaxRessize }
    if ($PSBoundParameters.ContainsKey('Memlimit')) { $properties['memlimit'] = $Memlimit }
    if ($PSBoundParameters.ContainsKey('MinHits')) { $properties['minhits'] = $MinHits }
    if ($PSBoundParameters.ContainsKey('MinRessize')) { $properties['minressize'] = $MinRessize }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Persistha')) { $properties['persistha'] = $Persistha }
    if ($PSBoundParameters.ContainsKey('Pinned')) { $properties['pinned'] = $Pinned }
    if ($PSBoundParameters.ContainsKey('Polleverytime')) { $properties['polleverytime'] = $Polleverytime }
    if ($PSBoundParameters.ContainsKey('Prefetch')) { $properties['prefetch'] = $Prefetch }
    if ($PSBoundParameters.ContainsKey('PrefetchMaxPending')) { $properties['prefetchmaxpending'] = $PrefetchMaxPending }
    if ($PSBoundParameters.ContainsKey('Prefetchperiod')) { $properties['prefetchperiod'] = $Prefetchperiod }
    if ($PSBoundParameters.ContainsKey('Prefetchperiodmillisec')) { $properties['prefetchperiodmillisec'] = $Prefetchperiodmillisec }
    if ($PSBoundParameters.ContainsKey('QUICKabortsize')) { $properties['quickabortsize'] = $QUICKabortsize }
    if ($PSBoundParameters.ContainsKey('Relexpiry')) { $properties['relexpiry'] = $Relexpiry }
    if ($PSBoundParameters.ContainsKey('Relexpirymillisec')) { $properties['relexpirymillisec'] = $Relexpirymillisec }
    if ($PSBoundParameters.ContainsKey('RemoveCookieS')) { $properties['removecookies'] = $RemoveCookieS }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('Weaknegrelexpiry')) { $properties['weaknegrelexpiry'] = $Weaknegrelexpiry }
    if ($PSBoundParameters.ContainsKey('Weakposrelexpiry')) { $properties['weakposrelexpiry'] = $Weakposrelexpiry }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create cachecontentgroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachecontentgroup -Payload @{ cachecontentgroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCacheContentGroup -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCacheContentGroup

# region Invoke-NSAddCacheForwardProxy
function Invoke-NSAddCacheForwardProxy {
    <#
    .SYNOPSIS
        Creates a NetScaler cacheforwardproxy resource.
    .DESCRIPTION
        Configuration for forward proxy resource.
    .PARAMETER Ipaddress
        IP address of the Citrix ADC or a cache server for which the cache acts as a proxy. Requests coming to the Citrix ADC with the configured IP address are forwarded to the particular address, without involving the Integrated Cache in any way. Minimum length = 1
    .PARAMETER Port
        Port on the Citrix ADC or a server for which the cache acts as a proxy. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddCacheForwardProxy -Ipaddress 'example' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddCacheForwardProxy -Ipaddress 'example' -Port 80 -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $Ipaddress,

        [Parameter(Mandatory)]
        [int] $Port,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ipaddress", 'Create cacheforwardproxy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cacheforwardproxy -Payload @{ cacheforwardproxy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCacheForwardProxy -Ipaddress $Ipaddress -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCacheForwardProxy

# region Invoke-NSAddCacheglobalCachePolicyBinding
function Invoke-NSAddCacheglobalCachePolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler cacheglobal_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to cacheglobal.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke policies bound to a virtual server or a user-defined policy label. After the invoked policies are evaluated, the flow returns to the policy with the next priority. Applicable only to default-syntax policies.
    .PARAMETER LabelName
        Name of the label to invoke if the current policy rule evaluates to TRUE. (To invoke a label associated with a virtual server, specify the name of the virtual server.).
    .PARAMETER LabelType
        Type of policy label to invoke. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Policy
        Name of the cache policy.
    .PARAMETER Precededefrules
        Specify whether this policy should be evaluated. Default value: NO Possible values = YES, NO
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Type
        The bind point to which policy is bound. When you specify the type, detailed information about that bind point appears. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT, HTTPQUIC_RES_OVERRIDE, HTTPQUIC_RES_DEFAULT
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddCacheglobalCachePolicyBinding -Policy 'policy_example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddCacheglobalCachePolicyBinding -Policy 'policy_example' -Priority 1 -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory)]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Precededefrules,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT', 'HTTPQUIC_RES_OVERRIDE', 'HTTPQUIC_RES_DEFAULT')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Precededefrules')) { $properties['precededefrules'] = $Precededefrules }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('cacheglobal_cachepolicy_binding', 'Create cacheglobal_cachepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cacheglobal_cachepolicy_binding -Payload @{ cacheglobal_cachepolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddCacheglobalCachePolicyBinding

# region Invoke-NSAddCachePolicy
function Invoke-NSAddCachePolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler cachepolicy resource.
    .DESCRIPTION
        Configuration for Integrated Cache policy resource.
    .PARAMETER Action
        Action to apply to content that matches the policy. * CACHE or MAY_CACHE action - positive cachability policy * NOCACHE or MAY_NOCACHE action - negative cachability policy * INVAL action - Dynamic Invalidation Policy. Possible values = CACHE, NOCACHE, MAY_CACHE, MAY_NOCACHE, INVAL
    .PARAMETER InvalGroupS
        Content group(s) to be invalidated when the INVAL action is applied. Maximum number of content groups that can be specified is 16. Minimum length = 1
    .PARAMETER Invalobjects
        Content groups(s) in which the objects will be invalidated if the action is INVAL. Minimum length = 1
    .PARAMETER PolicyName
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the policy is created. Minimum length = 1
    .PARAMETER Rule
        Expression against which the traffic is evaluated. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER StoreinGroup
        Name of the content group in which to store the object when the final result of policy evaluation is CACHE. The content group must exist before being mentioned here. Use the "show cache contentgroup" command to view the list of existing content groups. Minimum length = 1
    .PARAMETER UndefAction
        Action to be performed when the result of rule evaluation is undefined. Possible values = NOCACHE, RESET
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddCachePolicy -PolicyName 'example' -Action CACHE -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCachePolicy -PolicyName 'example' -Action CACHE -Rule 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('CACHE', 'NOCACHE', 'MAY_CACHE', 'MAY_NOCACHE', 'INVAL')]
        [string] $Action,

        [Parameter()]
        [string[]] $InvalGroupS,

        [Parameter()]
        [string[]] $Invalobjects,

        [Parameter(Mandatory, Position = 0)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [string] $Rule,

        [Parameter()]
        [string] $StoreinGroup,

        [Parameter()]
        [ValidateSet('NOCACHE', 'RESET')]
        [string] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Action')) { $properties['action'] = $Action }
    if ($PSBoundParameters.ContainsKey('InvalGroupS')) { $properties['invalgroups'] = $InvalGroupS }
    if ($PSBoundParameters.ContainsKey('Invalobjects')) { $properties['invalobjects'] = $Invalobjects }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('StoreinGroup')) { $properties['storeingroup'] = $StoreinGroup }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$PolicyName", 'Create cachepolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachepolicy -Payload @{ cachepolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCachePolicy -PolicyName $PolicyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCachePolicy

# region Invoke-NSAddCachePolicyLabel
function Invoke-NSAddCachePolicyLabel {
    <#
    .SYNOPSIS
        Creates a NetScaler cachepolicylabel resource.
    .DESCRIPTION
        Configuration for cache policy label resource.
    .PARAMETER Evaluates
        When to evaluate policies bound to this label: request-time or response-time. Possible values = REQ, RES, MSSQL_REQ, MSSQL_RES, MYSQL_REQ, MYSQL_RES, HTTPQUIC_REQ, HTTPQUIC_RES
    .PARAMETER LabelName
        Name for the label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the label is created.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddCachePolicyLabel -LabelName 'example' -Evaluates REQ -PassThru
    .EXAMPLE
        Invoke-NSAddCachePolicyLabel -LabelName 'example' -Evaluates REQ -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('REQ', 'RES', 'MSSQL_REQ', 'MSSQL_RES', 'MYSQL_REQ', 'MYSQL_RES', 'HTTPQUIC_REQ', 'HTTPQUIC_RES')]
        [string] $Evaluates,

        [Parameter(Mandatory, Position = 0)]
        [string] $LabelName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Evaluates')) { $properties['evaluates'] = $Evaluates }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create cachepolicylabel')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachepolicylabel -Payload @{ cachepolicylabel = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCachePolicyLabel -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCachePolicyLabel

# region Invoke-NSAddCachePolicyLabelCachePolicyBinding
function Invoke-NSAddCachePolicyLabelCachePolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler cachepolicylabel_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to cachepolicylabel.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke policies bound to a virtual server or a user-defined policy label. After the invoked policies are evaluated, the flow returns to the policy with the next-lower priority.
    .PARAMETER InvokeLabelName
        Name of the policy label to invoke if the current policy rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the cache policy label to which to bind the policy.
    .PARAMETER LabelType
        Type of policy label to invoke: an unnamed label associated with a virtual server, or user-defined policy label. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER PolicyName
        Name of the cache policy to bind to the policy label.
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddCachePolicyLabelCachePolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddCachePolicyLabelCachePolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $InvokeLabelName,

        [Parameter(Mandatory, Position = 0)]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('InvokeLabelName')) { $properties['invoke_labelname'] = $InvokeLabelName }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create cachepolicylabel_cachepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachepolicylabel_cachepolicy_binding -Payload @{ cachepolicylabel_cachepolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCachePolicyLabelCachePolicyBinding -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCachePolicyLabelCachePolicyBinding

# region Invoke-NSAddCacheSelector
function Invoke-NSAddCacheSelector {
    <#
    .SYNOPSIS
        Creates a NetScaler cacheselector resource.
    .DESCRIPTION
        Configuration for cache selector resource.
    .PARAMETER Rule
        One or multiple PIXL expressions for evaluating an HTTP request or response. Minimum length = 1
    .PARAMETER SelectorName
        Name for the selector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddCacheSelector -SelectorName 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCacheSelector -SelectorName 'example' -Rule 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string[]] $Rule,

        [Parameter(Mandatory, Position = 0)]
        [string] $SelectorName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('SelectorName')) { $properties['selectorname'] = $SelectorName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$SelectorName", 'Create cacheselector')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cacheselector -Payload @{ cacheselector = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCacheSelector -SelectorName $SelectorName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCacheSelector

# region Invoke-NSDeleteCacheContentGroup
function Invoke-NSDeleteCacheContentGroup {
    <#
    .SYNOPSIS
        Removes a NetScaler cachecontentgroup resource.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCacheContentGroup -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCacheContentGroup -Name 'cachecontentgroup_example' | Invoke-NSDeleteCacheContentGroup -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete cachecontentgroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cachecontentgroup -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCacheContentGroup

# region Invoke-NSDeleteCacheForwardProxy
function Invoke-NSDeleteCacheForwardProxy {
    <#
    .SYNOPSIS
        Removes a NetScaler cacheforwardproxy resource.
    .DESCRIPTION
        Configuration for forward proxy resource.
    .PARAMETER Ipaddress
        IP address of the Citrix ADC or a cache server for which the cache acts as a proxy. Requests coming to the Citrix ADC with the configured IP address are forwarded to the particular address, without involving the Integrated Cache in any way. Minimum length = 1
    .PARAMETER Port
        Port on the Citrix ADC or a server for which the cache acts as a proxy. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCacheForwardProxy -Ipaddress 'example' -Port 80 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCacheForwardProxy -Ipaddress 'cacheforwardproxy_example' | Invoke-NSDeleteCacheForwardProxy -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Ipaddress,

        [Parameter(Mandatory)]
        [int] $Port,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Port')) {
            $argumentParts += 'port:' + $Port
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Ipaddress", 'Delete cacheforwardproxy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cacheforwardproxy -Resource $Ipaddress -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCacheForwardProxy

# region Invoke-NSDeleteCacheglobalCachePolicyBinding
function Invoke-NSDeleteCacheglobalCachePolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler cacheglobal_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to cacheglobal.
    .PARAMETER Policy
        Name of the cache policy.
    .PARAMETER Type
        The bind point to which policy is bound. When you specify the type, detailed information about that bind point appears. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT, HTTPQUIC_RES_OVERRIDE, HTTPQUIC_RES_DEFAULT
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCacheglobalCachePolicyBinding -Policy 'policy_example' -Priority 1 -Type REQ_OVERRIDE -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCacheglobalCachePolicyBinding  | Invoke-NSDeleteCacheglobalCachePolicyBinding -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory)]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT', 'HTTPQUIC_RES_OVERRIDE', 'HTTPQUIC_RES_DEFAULT')]
        [string] $Type,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('cacheglobal_cachepolicy_binding', 'Delete cacheglobal_cachepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cacheglobal_cachepolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCacheglobalCachePolicyBinding

# region Invoke-NSDeleteCachePolicy
function Invoke-NSDeleteCachePolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler cachepolicy resource.
    .DESCRIPTION
        Configuration for Integrated Cache policy resource.
    .PARAMETER PolicyName
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the policy is created. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCachePolicy -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCachePolicy -PolicyName 'cachepolicy_example' | Invoke-NSDeleteCachePolicy -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Delete cachepolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cachepolicy -Resource $PolicyName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCachePolicy

# region Invoke-NSDeleteCachePolicyLabel
function Invoke-NSDeleteCachePolicyLabel {
    <#
    .SYNOPSIS
        Removes a NetScaler cachepolicylabel resource.
    .DESCRIPTION
        Configuration for cache policy label resource.
    .PARAMETER LabelName
        Name for the label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the label is created.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCachePolicyLabel -LabelName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCachePolicyLabel -LabelName 'cachepolicylabel_example' | Invoke-NSDeleteCachePolicyLabel -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $LabelName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete cachepolicylabel')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cachepolicylabel -Resource $LabelName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCachePolicyLabel

# region Invoke-NSDeleteCachePolicyLabelCachePolicyBinding
function Invoke-NSDeleteCachePolicyLabelCachePolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler cachepolicylabel_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to cachepolicylabel.
    .PARAMETER LabelName
        Name of the cache policy label to which to bind the policy.
    .PARAMETER PolicyName
        Name of the cache policy to bind to the policy label.
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCachePolicyLabelCachePolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelCachePolicyBinding -LabelName 'cachepolicylabel_cachepolicy_binding_example' | Invoke-NSDeleteCachePolicyLabelCachePolicyBinding -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $LabelName,

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('PolicyName')) {
            $argumentParts += 'policyname:' + $PolicyName
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete cachepolicylabel_cachepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cachepolicylabel_cachepolicy_binding -Resource $LabelName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCachePolicyLabelCachePolicyBinding

# region Invoke-NSDeleteCacheSelector
function Invoke-NSDeleteCacheSelector {
    <#
    .SYNOPSIS
        Removes a NetScaler cacheselector resource.
    .DESCRIPTION
        Configuration for cache selector resource.
    .PARAMETER SelectorName
        Name for the selector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCacheSelector -SelectorName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCacheSelector -SelectorName 'cacheselector_example' | Invoke-NSDeleteCacheSelector -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $SelectorName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$SelectorName", 'Delete cacheselector')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cacheselector -Resource $SelectorName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCacheSelector

# region Invoke-NSExpireCacheContentGroup
function Invoke-NSExpireCacheContentGroup {
    <#
    .SYNOPSIS
        Invokes the expire operation for a NetScaler cachecontentgroup resource.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSExpireCacheContentGroup -Name 'example'
    .EXAMPLE
        Invoke-NSExpireCacheContentGroup -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }

        if ($PSCmdlet.ShouldProcess('cachecontentgroup', 'Expire cachecontentgroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachecontentgroup -Action expire -Payload @{ cachecontentgroup = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSExpireCacheContentGroup

# region Invoke-NSExpireCacheobject
function Invoke-NSExpireCacheobject {
    <#
    .SYNOPSIS
        Invokes the expire operation for a NetScaler cacheobject resource.
    .DESCRIPTION
        Configuration for cache object resource.
    .PARAMETER GroupName
        Name of the content group to which the object belongs. It will display only the objects belonging to the specified content group. You must also set the Host parameter.
    .PARAMETER HostName
        Host name of the object. Parameter "url" must be specified. Minimum length = 1
    .PARAMETER HTTPMethod
        HTTP request method that caused the object to be stored. Default value: GET Possible values = GET, POST
    .PARAMETER Locator
        ID of the cached object.
    .PARAMETER Port
        Host port of the object. You must also set the Host parameter. Default value: 80 Minimum value = 1
    .PARAMETER URL
        URL of the particular object whose details is required. Parameter "host" must be specified along with the URL. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSExpireCacheobject 
    .EXAMPLE
        Invoke-NSExpireCacheobject  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $GroupName,

        [Parameter()]
        [string] $HostName,

        [Parameter()]
        [ValidateSet('GET', 'POST')]
        [string] $HTTPMethod,

        [Parameter()]
        [int] $Locator,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $URL,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('GroupName')) { $body['groupname'] = $GroupName }
        if ($PSBoundParameters.ContainsKey('HostName')) { $body['host'] = $HostName }
        if ($PSBoundParameters.ContainsKey('HTTPMethod')) { $body['httpmethod'] = $HTTPMethod }
        if ($PSBoundParameters.ContainsKey('Locator')) { $body['locator'] = $Locator }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $Port }
        if ($PSBoundParameters.ContainsKey('URL')) { $body['url'] = $URL }

        if ($PSCmdlet.ShouldProcess('cacheobject', 'Expire cacheobject')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cacheobject -Action expire -Payload @{ cacheobject = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSExpireCacheobject

# region Invoke-NSFlushCacheContentGroup
function Invoke-NSFlushCacheContentGroup {
    <#
    .SYNOPSIS
        Clears NetScaler cachecontentgroup cache data.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER HostName
        Flush only objects that belong to the specified host. Do not use except with parameterized invalidation. Also, the Invalidation Restricted to Host parameter for the group must be set to YES. Minimum length = 1
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER Query
        Query string specifying individual objects to flush from this group by using parameterized invalidation. If this parameter is not set, all objects are flushed from the group. Minimum length = 1
    .PARAMETER SelectorValue
        Value of the selector to be used for flushing objects from the content group. Requires that an invalidation selector be configured for the content group. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSFlushCacheContentGroup -Name 'example'
    .EXAMPLE
        Invoke-NSFlushCacheContentGroup -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $HostName,

        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [string] $Query,

        [Parameter()]
        [string] $SelectorValue,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('HostName')) { $body['host'] = $HostName }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('Query')) { $body['query'] = $Query }
        if ($PSBoundParameters.ContainsKey('SelectorValue')) { $body['selectorvalue'] = $SelectorValue }

        if ($PSCmdlet.ShouldProcess('cachecontentgroup', 'Clear cachecontentgroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachecontentgroup -Action flush -Payload @{ cachecontentgroup = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSFlushCacheContentGroup

# region Invoke-NSFlushCacheobject
function Invoke-NSFlushCacheobject {
    <#
    .SYNOPSIS
        Clears NetScaler cacheobject cache data.
    .DESCRIPTION
        Configuration for cache object resource.
    .PARAMETER GroupName
        Name of the content group to which the object belongs. It will display only the objects belonging to the specified content group. You must also set the Host parameter.
    .PARAMETER HostName
        Host name of the object. Parameter "url" must be specified. Minimum length = 1
    .PARAMETER HTTPMethod
        HTTP request method that caused the object to be stored. Default value: GET Possible values = GET, POST
    .PARAMETER Locator
        ID of the cached object.
    .PARAMETER Port
        Host port of the object. You must also set the Host parameter. Default value: 80 Minimum value = 1
    .PARAMETER URL
        URL of the particular object whose details is required. Parameter "host" must be specified along with the URL. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSFlushCacheobject 
    .EXAMPLE
        Invoke-NSFlushCacheobject  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $GroupName,

        [Parameter()]
        [string] $HostName,

        [Parameter()]
        [ValidateSet('GET', 'POST')]
        [string] $HTTPMethod,

        [Parameter()]
        [int] $Locator,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $URL,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('GroupName')) { $body['groupname'] = $GroupName }
        if ($PSBoundParameters.ContainsKey('HostName')) { $body['host'] = $HostName }
        if ($PSBoundParameters.ContainsKey('HTTPMethod')) { $body['httpmethod'] = $HTTPMethod }
        if ($PSBoundParameters.ContainsKey('Locator')) { $body['locator'] = $Locator }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $Port }
        if ($PSBoundParameters.ContainsKey('URL')) { $body['url'] = $URL }

        if ($PSCmdlet.ShouldProcess('cacheobject', 'Clear cacheobject')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cacheobject -Action flush -Payload @{ cacheobject = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSFlushCacheobject

# region Invoke-NSGetCacheContentGroup
function Invoke-NSGetCacheContentGroup {
    <#
    .SYNOPSIS
        Gets NetScaler cachecontentgroup configuration.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCacheContentGroup
    .EXAMPLE
        Invoke-NSGetCacheContentGroup -Name 'cachecontentgroup_example'
    .EXAMPLE
        Invoke-NSGetCacheContentGroup -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachecontentgroup'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Name
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCacheContentGroup

# region Invoke-NSGetCacheForwardProxy
function Invoke-NSGetCacheForwardProxy {
    <#
    .SYNOPSIS
        Gets NetScaler cacheforwardproxy configuration.
    .DESCRIPTION
        Configuration for forward proxy resource.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCacheForwardProxy
    .EXAMPLE
        Invoke-NSGetCacheForwardProxy -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cacheforwardproxy'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCacheForwardProxy

# region Invoke-NSGetCacheglobalBinding
function Invoke-NSGetCacheglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cacheglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to cacheglobal.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCacheglobalBinding
    .EXAMPLE
        Invoke-NSGetCacheglobalBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cacheglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCacheglobalBinding

# region Invoke-NSGetCacheglobalCachePolicyBinding
function Invoke-NSGetCacheglobalCachePolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cacheglobal_cachepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to cacheglobal.
    .PARAMETER Type
        The bind point to which policy is bound. When you specify the type, detailed information about that bind point appears. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT, HTTPQUIC_RES_OVERRIDE, HTTPQUIC_RES_DEFAULT
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCacheglobalCachePolicyBinding
    .EXAMPLE
        Invoke-NSGetCacheglobalCachePolicyBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT', 'HTTPQUIC_RES_OVERRIDE', 'HTTPQUIC_RES_DEFAULT')]
        [string] $Type,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cacheglobal_cachepolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCacheglobalCachePolicyBinding

# region Invoke-NSGetCacheobject
function Invoke-NSGetCacheobject {
    <#
    .SYNOPSIS
        Gets NetScaler cacheobject configuration.
    .DESCRIPTION
        Configuration for cache object resource.
    .PARAMETER URL
        URL of the particular object whose details is required. Parameter "host" must be specified along with the URL. Minimum length = 1
    .PARAMETER Locator
        ID of the cached object.
    .PARAMETER HTTPSTatus
        HTTP status of the object.
    .PARAMETER HostName
        Host name of the object. Parameter "url" must be specified. Minimum length = 1
    .PARAMETER Port
        Host port of the object. You must also set the Host parameter. Default value: 80 Minimum value = 1
    .PARAMETER GroupName
        Name of the content group to which the object belongs. It will display only the objects belonging to the specified content group. You must also set the Host parameter.
    .PARAMETER HTTPMethod
        HTTP request method that caused the object to be stored. Default value: GET Possible values = GET, POST
    .PARAMETER Group
        Name of the content group whose objects should be listed.
    .PARAMETER Ignoremarkerobjects
        Ignore marker objects. Marker objects are created when a response exceeds the maximum or minimum response size for the content group or has not yet received the minimum number of hits for the content group. Possible values = ON, OFF
    .PARAMETER Includenotreadyobjects
        Include responses that have not yet reached a minimum number of hits before being cached. Possible values = ON, OFF
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCacheobject
    .EXAMPLE
        Invoke-NSGetCacheobject -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [string] $URL,

        [Parameter(ParameterSetName = 'All')]
        [int] $Locator,

        [Parameter(ParameterSetName = 'All')]
        [int] $HTTPSTatus,

        [Parameter(ParameterSetName = 'All')]
        [string] $HostName,

        [Parameter(ParameterSetName = 'All')]
        [int] $Port,

        [Parameter(ParameterSetName = 'All')]
        [string] $GroupName,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('GET', 'POST')]
        [string] $HTTPMethod,

        [Parameter(ParameterSetName = 'All')]
        [string] $Group,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ON', 'OFF')]
        [string] $Ignoremarkerobjects,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ON', 'OFF')]
        [string] $Includenotreadyobjects,

        [Parameter(ParameterSetName = 'All')]
        [int] $Nodeid,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('URL')) {
            $argumentValue = $URL
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'url:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Locator')) {
            $argumentValue = $Locator
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'locator:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('HTTPSTatus')) {
            $argumentValue = $HTTPSTatus
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'httpstatus:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('HostName')) {
            $argumentValue = $HostName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'host:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Port')) {
            $argumentValue = $Port
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'port:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('GroupName')) {
            $argumentValue = $GroupName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'groupname:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('HTTPMethod')) {
            $argumentValue = $HTTPMethod
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'httpmethod:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Group')) {
            $argumentValue = $Group
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'group:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Ignoremarkerobjects')) {
            $argumentValue = $Ignoremarkerobjects
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'ignoremarkerobjects:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Includenotreadyobjects')) {
            $argumentValue = $Includenotreadyobjects
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'includenotreadyobjects:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Nodeid')) {
            $argumentValue = $Nodeid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nodeid:' + $argumentValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cacheobject'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCacheobject

# region Invoke-NSGetCacheparameter
function Invoke-NSGetCacheparameter {
    <#
    .SYNOPSIS
        Gets NetScaler cacheparameter configuration.
    .DESCRIPTION
        Configuration for cache parameter resource.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCacheparameter
    .EXAMPLE
        Invoke-NSGetCacheparameter -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cacheparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCacheparameter

# region Invoke-NSGetCachePolicy
function Invoke-NSGetCachePolicy {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicy configuration.
    .DESCRIPTION
        Configuration for Integrated Cache policy resource.
    .PARAMETER PolicyName
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the policy is created. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicy
    .EXAMPLE
        Invoke-NSGetCachePolicy -PolicyName 'cachepolicy_example'
    .EXAMPLE
        Invoke-NSGetCachePolicy -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicy'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PolicyName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicy

# region Invoke-NSGetCachePolicyBinding
function Invoke-NSGetCachePolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to cachepolicy.
    .PARAMETER PolicyName
        Name of the cache policy about which to display details. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyBinding -PolicyName 'cachepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PolicyName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyBinding

# region Invoke-NSGetCachePolicyCacheglobalBinding
function Invoke-NSGetCachePolicyCacheglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicy_cacheglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the cacheglobal that can be bound to cachepolicy.
    .PARAMETER PolicyName
        Name of the cache policy about which to display details. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyCacheglobalBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyCacheglobalBinding -PolicyName 'cachepolicy_cacheglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyCacheglobalBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicy_cacheglobal_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PolicyName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyCacheglobalBinding

# region Invoke-NSGetCachePolicyCachePolicyLabelBinding
function Invoke-NSGetCachePolicyCachePolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicy_cachepolicylabel_binding configuration.
    .DESCRIPTION
        Binding object showing the cachepolicylabel that can be bound to cachepolicy.
    .PARAMETER PolicyName
        Name of the cache policy about which to display details. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyCachePolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyCachePolicyLabelBinding -PolicyName 'cachepolicy_cachepolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyCachePolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicy_cachepolicylabel_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PolicyName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyCachePolicyLabelBinding

# region Invoke-NSGetCachePolicyCSVServerBinding
function Invoke-NSGetCachePolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to cachepolicy.
    .PARAMETER PolicyName
        Name of the cache policy about which to display details. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyCSVServerBinding -PolicyName 'cachepolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicy_csvserver_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PolicyName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyCSVServerBinding

# region Invoke-NSGetCachePolicyLabel
function Invoke-NSGetCachePolicyLabel {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicylabel configuration.
    .DESCRIPTION
        Configuration for cache policy label resource.
    .PARAMETER LabelName
        Name for the label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the label is created.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyLabel
    .EXAMPLE
        Invoke-NSGetCachePolicyLabel -LabelName 'cachepolicylabel_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyLabel -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $LabelName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicylabel'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $LabelName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyLabel

# region Invoke-NSGetCachePolicyLabelBinding
function Invoke-NSGetCachePolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicylabel_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to cachepolicylabel.
    .PARAMETER LabelName
        Name of the cache-policy label about which to display information.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelBinding -LabelName 'cachepolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $LabelName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicylabel_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $LabelName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyLabelBinding

# region Invoke-NSGetCachePolicyLabelCachePolicyBinding
function Invoke-NSGetCachePolicyLabelCachePolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicylabel_cachepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to cachepolicylabel.
    .PARAMETER LabelName
        Name of the cache policy label to which to bind the policy.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelCachePolicyBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelCachePolicyBinding -LabelName 'cachepolicylabel_cachepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelCachePolicyBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $LabelName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicylabel_cachepolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $LabelName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyLabelCachePolicyBinding

# region Invoke-NSGetCachePolicyLabelPolicyBindingBinding
function Invoke-NSGetCachePolicyLabelPolicyBindingBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicylabel_policybinding_binding configuration.
    .DESCRIPTION
        Binding object showing the policybinding that can be bound to cachepolicylabel.
    .PARAMETER LabelName
        Name of the cache policy label to which to bind the policy.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelPolicyBindingBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelPolicyBindingBinding -LabelName 'cachepolicylabel_policybinding_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyLabelPolicyBindingBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $LabelName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicylabel_policybinding_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $LabelName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyLabelPolicyBindingBinding

# region Invoke-NSGetCachePolicyLBVServerBinding
function Invoke-NSGetCachePolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cachepolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to cachepolicy.
    .PARAMETER PolicyName
        Name of the cache policy about which to display details. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCachePolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetCachePolicyLBVServerBinding -PolicyName 'cachepolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCachePolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cachepolicy_lbvserver_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PolicyName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCachePolicyLBVServerBinding

# region Invoke-NSGetCacheSelector
function Invoke-NSGetCacheSelector {
    <#
    .SYNOPSIS
        Gets NetScaler cacheselector configuration.
    .DESCRIPTION
        Configuration for cache selector resource.
    .PARAMETER SelectorName
        Name for the selector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetCacheSelector
    .EXAMPLE
        Invoke-NSGetCacheSelector -SelectorName 'cacheselector_example'
    .EXAMPLE
        Invoke-NSGetCacheSelector -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $SelectorName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'cacheselector'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $SelectorName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCacheSelector

# region Invoke-NSRenameCachePolicy
function Invoke-NSRenameCachePolicy {
    <#
    .SYNOPSIS
        Renames a NetScaler cachepolicy resource.
    .DESCRIPTION
        Configuration for Integrated Cache policy resource.
    .PARAMETER PolicyName
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the policy is created. Minimum length = 1
    .PARAMETER NewName
        New name for the cache policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameCachePolicy -PolicyName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCachePolicy -PolicyName 'example' -NewName 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [string] $NewName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('PolicyName')) { $body['policyname'] = $PolicyName }
        if ($PSBoundParameters.ContainsKey('NewName')) { $body['newname'] = $NewName }

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Rename cachepolicy')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachepolicy -Action rename -Payload @{ cachepolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCachePolicy -PolicyName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCachePolicy

# region Invoke-NSRenameCachePolicyLabel
function Invoke-NSRenameCachePolicyLabel {
    <#
    .SYNOPSIS
        Renames a NetScaler cachepolicylabel resource.
    .DESCRIPTION
        Configuration for cache policy label resource.
    .PARAMETER LabelName
        Name for the label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the label is created.
    .PARAMETER NewName
        New name for the cache-policy label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameCachePolicyLabel -LabelName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCachePolicyLabel -LabelName 'example' -NewName 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $LabelName,

        [Parameter(Mandatory)]
        [string] $NewName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('LabelName')) { $body['labelname'] = $LabelName }
        if ($PSBoundParameters.ContainsKey('NewName')) { $body['newname'] = $NewName }

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Rename cachepolicylabel')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachepolicylabel -Action rename -Payload @{ cachepolicylabel = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCachePolicyLabel -LabelName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCachePolicyLabel

# region Invoke-NSSaveCacheContentGroup
function Invoke-NSSaveCacheContentGroup {
    <#
    .SYNOPSIS
        Saves NetScaler cachecontentgroup configuration.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER ToSecondary
        content group whose objects are to be sent to secondary. Default value: NO Possible values = YES, NO
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSSaveCacheContentGroup -Name 'example'
    .EXAMPLE
        Invoke-NSSaveCacheContentGroup -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $ToSecondary,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('ToSecondary')) { $body['tosecondary'] = $ToSecondary }

        if ($PSCmdlet.ShouldProcess('cachecontentgroup', 'Save cachecontentgroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachecontentgroup -Action save -Payload @{ cachecontentgroup = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSSaveCacheContentGroup

# region Invoke-NSSaveCacheobject
function Invoke-NSSaveCacheobject {
    <#
    .SYNOPSIS
        Saves NetScaler cacheobject configuration.
    .DESCRIPTION
        Configuration for cache object resource.
    .PARAMETER Locator
        ID of the cached object.
    .PARAMETER ToSecondary
        Object will be saved onto Secondary. Default value: NO Possible values = YES, NO
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSSaveCacheobject 
    .EXAMPLE
        Invoke-NSSaveCacheobject  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [int] $Locator,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $ToSecondary,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('Locator')) { $body['locator'] = $Locator }
        if ($PSBoundParameters.ContainsKey('ToSecondary')) { $body['tosecondary'] = $ToSecondary }

        if ($PSCmdlet.ShouldProcess('cacheobject', 'Save cacheobject')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cacheobject -Action save -Payload @{ cacheobject = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSSaveCacheobject

# region Invoke-NSUnsetCacheContentGroup
function Invoke-NSUnsetCacheContentGroup {
    <#
    .SYNOPSIS
        Clears one or more NetScaler cachecontentgroup resource properties.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER Absexpiry
        Local time, up to 4 times a day, at which all objects in the content group must expire. CLI Users: For example, to specify that the objects in the content group should expire by 11:00 PM, type the following command: add cache contentgroup <contentgroup name> -absexpiry 23:00 To specify that the objects in the content group should expire at 10:00 AM, 3 PM, 6 PM, and 11:00 PM, type: add cache contentgroup <contentgroup name> -absexpiry 10:00 15:00 18:00 23:00.
    .PARAMETER Absexpirygmt
        Coordinated Universal Time (GMT), up to 4 times a day, when all objects in the content group must expire.
    .PARAMETER Alwaysevalpolicies
        Force policy evaluation for each response arriving from the origin server. Cannot be set to YES if the Prefetch parameter is also set to YES. Default value: NO Possible values = YES, NO
    .PARAMETER Cachecontrol
        Insert a Cache-Control header into the response. Minimum length = 1
    .PARAMETER Expireatlastbyte
        Force expiration of the content immediately after the response is downloaded (upon receipt of the last byte of the response body). Applicable only to positive responses. Default value: NO Possible values = YES, NO
    .PARAMETER Flashcache
        Perform flash cache. Mutually exclusive with Poll Every Time (PET) on the same content group. Default value: NO Possible values = YES, NO
    .PARAMETER Heurexpiryparam
        Heuristic expiry time, in percent of the duration, since the object was last modified. Minimum value = 0 Maximum value = 100
    .PARAMETER Hitparams
        Parameters to use for parameterized hit evaluation of an object. Up to 128 parameters can be specified. Mutually exclusive with the Hit Selector parameter. Minimum length = 1
    .PARAMETER Hitselector
        Selector for evaluating whether an object gets stored in a particular content group. A selector is an abstraction for a collection of PIXL expressions.
    .PARAMETER Ignoreparamvaluecase
        Ignore case when comparing parameter values during parameterized hit evaluation. (Parameter value case is ignored by default during parameterized invalidation.). Possible values = YES, NO
    .PARAMETER Ignorereloadreq
        Ignore any request to reload a cached object from the origin server. To guard against Denial of Service attacks, set this parameter to YES. For RFC-compliant behavior, set it to NO. Default value: YES Possible values = YES, NO
    .PARAMETER Ignorereqcachinghdrs
        Ignore Cache-Control and Pragma headers in the incoming request. Default value: YES Possible values = YES, NO
    .PARAMETER InsertAge
        Insert an Age header into the response. An Age header contains information about the age of the object, in seconds, as calculated by the integrated cache. Default value: YES Possible values = YES, NO
    .PARAMETER InsertEtag
        Insert an ETag header in the response. With ETag header insertion, the integrated cache does not serve full responses on repeat requests. Default value: YES Possible values = YES, NO
    .PARAMETER InsertVia
        Insert a Via header into the response. Default value: YES Possible values = YES, NO
    .PARAMETER Invalparams
        Parameters for parameterized invalidation of an object. You can specify up to 8 parameters. Mutually exclusive with invalSelector. Minimum length = 1
    .PARAMETER InvalrestrictedtoHost
        Take the host header into account during parameterized invalidation. Possible values = YES, NO
    .PARAMETER Invalselector
        Selector for invalidating objects in the content group. A selector is an abstraction for a collection of PIXL expressions.
    .PARAMETER LazyDNSResolve
        Perform DNS resolution for responses only if the destination IP address in the request does not match the destination IP address of the cached response. Default value: YES Possible values = YES, NO
    .PARAMETER MatchCookieS
        Evaluate for parameters in the cookie header also. Possible values = YES, NO
    .PARAMETER MaxRessize
        Maximum size of a response that can be cached in this content group. Default value: 80 Minimum value = 0 Maximum value = 2097151
    .PARAMETER Memlimit
        Maximum amount of memory that the cache can use. The effective limit is based on the available memory of the Citrix ADC. Default value: 65536
    .PARAMETER MinHits
        Number of hits that qualifies a response for storage in this content group. Default value: 0
    .PARAMETER MinRessize
        Minimum size of a response that can be cached in this content group. Default minimum response size is 0. Minimum value = 0 Maximum value = 2097151
    .PARAMETER Persistha
        Setting persistHA to YES causes IC to save objects in contentgroup to Secondary node in HA deployment. Default value: NO Possible values = YES, NO
    .PARAMETER Pinned
        Do not flush objects from this content group under memory pressure. Default value: NO Possible values = YES, NO
    .PARAMETER Polleverytime
        Always poll for the objects in this content group. That is, retrieve the objects from the origin server whenever they are requested. Default value: NO Possible values = YES, NO
    .PARAMETER Prefetch
        Attempt to refresh objects that are about to go stale. Default value: YES Possible values = YES, NO
    .PARAMETER PrefetchMaxPending
        Maximum number of outstanding prefetches that can be queued for the content group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Prefetchperiod
        Time period, in seconds before an object's calculated expiry time, during which to attempt prefetch. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Prefetchperiodmillisec
        Time period, in milliseconds before an object's calculated expiry time, during which to attempt prefetch. Minimum value = 0 Maximum value = 4294967290
    .PARAMETER QUICKabortsize
        If the size of an object that is being downloaded is less than or equal to the quick abort value, and a client aborts during the download, the cache stops downloading the response. If the object is larger than the quick abort size, the cache continues to download the response. Default value: 4194303 Minimum value = 0 Maximum value = 4194303
    .PARAMETER Relexpiry
        Relative expiry time, in seconds, after which to expire an object cached in this content group. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Relexpirymillisec
        Relative expiry time, in milliseconds, after which to expire an object cached in this content group. Minimum value = 0 Maximum value = 86400000
    .PARAMETER RemoveCookieS
        Remove cookies from responses. Default value: YES Possible values = YES, NO
    .PARAMETER Weaknegrelexpiry
        Relative expiry time, in seconds, for expiring negative responses. This value is used only if the expiry time cannot be determined from any other source. It is applicable only to the following status codes: 307, 403, 404, and 410. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Weakposrelexpiry
        Relative expiry time, in seconds, for expiring positive responses with response codes between 200 and 399. Cannot be used in combination with other Expiry attributes. Similar to -relExpiry but has lower precedence. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetCacheContentGroup -Name 'example' -Absexpiry  -PassThru
    .EXAMPLE
        Invoke-NSUnsetCacheContentGroup -Name 'example' -Absexpiry  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [switch] $Absexpiry,

        [Parameter()]
        [switch] $Absexpirygmt,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Alwaysevalpolicies,

        [Parameter()]
        [switch] $Cachecontrol,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Expireatlastbyte,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Flashcache,

        [Parameter()]
        [switch] $Heurexpiryparam,

        [Parameter()]
        [switch] $Hitparams,

        [Parameter()]
        [switch] $Hitselector,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Ignoreparamvaluecase,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Ignorereloadreq,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Ignorereqcachinghdrs,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $InsertAge,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $InsertEtag,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $InsertVia,

        [Parameter()]
        [switch] $Invalparams,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $InvalrestrictedtoHost,

        [Parameter()]
        [switch] $Invalselector,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $LazyDNSResolve,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $MatchCookieS,

        [Parameter()]
        [switch] $MaxRessize,

        [Parameter()]
        [switch] $Memlimit,

        [Parameter()]
        [switch] $MinHits,

        [Parameter()]
        [switch] $MinRessize,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Persistha,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Pinned,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Polleverytime,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Prefetch,

        [Parameter()]
        [switch] $PrefetchMaxPending,

        [Parameter()]
        [switch] $Prefetchperiod,

        [Parameter()]
        [switch] $Prefetchperiodmillisec,

        [Parameter()]
        [switch] $QUICKabortsize,

        [Parameter()]
        [switch] $Relexpiry,

        [Parameter()]
        [switch] $Relexpirymillisec,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $RemoveCookieS,

        [Parameter()]
        [switch] $Weaknegrelexpiry,

        [Parameter()]
        [switch] $Weakposrelexpiry,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = @{ name = $Name }
        if ($PSBoundParameters.ContainsKey('Absexpiry')) { $body['absexpiry'] = $true }
        if ($PSBoundParameters.ContainsKey('Absexpirygmt')) { $body['absexpirygmt'] = $true }
        if ($PSBoundParameters.ContainsKey('Alwaysevalpolicies')) { $body['alwaysevalpolicies'] = $true }
        if ($PSBoundParameters.ContainsKey('Cachecontrol')) { $body['cachecontrol'] = $true }
        if ($PSBoundParameters.ContainsKey('Expireatlastbyte')) { $body['expireatlastbyte'] = $true }
        if ($PSBoundParameters.ContainsKey('Flashcache')) { $body['flashcache'] = $true }
        if ($PSBoundParameters.ContainsKey('Heurexpiryparam')) { $body['heurexpiryparam'] = $true }
        if ($PSBoundParameters.ContainsKey('Hitparams')) { $body['hitparams'] = $true }
        if ($PSBoundParameters.ContainsKey('Hitselector')) { $body['hitselector'] = $true }
        if ($PSBoundParameters.ContainsKey('Ignoreparamvaluecase')) { $body['ignoreparamvaluecase'] = $true }
        if ($PSBoundParameters.ContainsKey('Ignorereloadreq')) { $body['ignorereloadreq'] = $true }
        if ($PSBoundParameters.ContainsKey('Ignorereqcachinghdrs')) { $body['ignorereqcachinghdrs'] = $true }
        if ($PSBoundParameters.ContainsKey('InsertAge')) { $body['insertage'] = $true }
        if ($PSBoundParameters.ContainsKey('InsertEtag')) { $body['insertetag'] = $true }
        if ($PSBoundParameters.ContainsKey('InsertVia')) { $body['insertvia'] = $true }
        if ($PSBoundParameters.ContainsKey('Invalparams')) { $body['invalparams'] = $true }
        if ($PSBoundParameters.ContainsKey('InvalrestrictedtoHost')) { $body['invalrestrictedtohost'] = $true }
        if ($PSBoundParameters.ContainsKey('Invalselector')) { $body['invalselector'] = $true }
        if ($PSBoundParameters.ContainsKey('LazyDNSResolve')) { $body['lazydnsresolve'] = $true }
        if ($PSBoundParameters.ContainsKey('MatchCookieS')) { $body['matchcookies'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxRessize')) { $body['maxressize'] = $true }
        if ($PSBoundParameters.ContainsKey('Memlimit')) { $body['memlimit'] = $true }
        if ($PSBoundParameters.ContainsKey('MinHits')) { $body['minhits'] = $true }
        if ($PSBoundParameters.ContainsKey('MinRessize')) { $body['minressize'] = $true }
        if ($PSBoundParameters.ContainsKey('Persistha')) { $body['persistha'] = $true }
        if ($PSBoundParameters.ContainsKey('Pinned')) { $body['pinned'] = $true }
        if ($PSBoundParameters.ContainsKey('Polleverytime')) { $body['polleverytime'] = $true }
        if ($PSBoundParameters.ContainsKey('Prefetch')) { $body['prefetch'] = $true }
        if ($PSBoundParameters.ContainsKey('PrefetchMaxPending')) { $body['prefetchmaxpending'] = $true }
        if ($PSBoundParameters.ContainsKey('Prefetchperiod')) { $body['prefetchperiod'] = $true }
        if ($PSBoundParameters.ContainsKey('Prefetchperiodmillisec')) { $body['prefetchperiodmillisec'] = $true }
        if ($PSBoundParameters.ContainsKey('QUICKabortsize')) { $body['quickabortsize'] = $true }
        if ($PSBoundParameters.ContainsKey('Relexpiry')) { $body['relexpiry'] = $true }
        if ($PSBoundParameters.ContainsKey('Relexpirymillisec')) { $body['relexpirymillisec'] = $true }
        if ($PSBoundParameters.ContainsKey('RemoveCookieS')) { $body['removecookies'] = $true }
        if ($PSBoundParameters.ContainsKey('Weaknegrelexpiry')) { $body['weaknegrelexpiry'] = $true }
        if ($PSBoundParameters.ContainsKey('Weakposrelexpiry')) { $body['weakposrelexpiry'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear cachecontentgroup properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachecontentgroup -Action unset -Payload @{ cachecontentgroup = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCacheContentGroup -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCacheContentGroup

# region Invoke-NSUnsetCacheparameter
function Invoke-NSUnsetCacheparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler cacheparameter resource properties.
    .DESCRIPTION
        Configuration for cache parameter resource.
    .PARAMETER CacheevictionPolicy
        The cacheEvictionPolicy determines the threshold for preemptive eviction of cache objects using the LRU (Least Recently Used) algorithm. If set to AGGRESSIVE, eviction is triggered when free cache memory drops to 40%. MODERATE triggers eviction at 25%, and RELAXED triggers eviction at 10%. Default value: RELAXED Possible values = RELAXED, MODERATE, AGGRESSIVE
    .PARAMETER EnableBypass
        Evaluate the request-time policies before attempting hit selection. If set to NO, an incoming request for which a matching object is found in cache storage results in a response regardless of the policy configuration. If the request matches a policy with a NOCACHE action, the request bypasses all cache processing. This parameter does not affect processing of requests that match any invalidation policy. Possible values = YES, NO
    .PARAMETER Enablehaobjpersist
        The HA object persisting parameter. When this value is set to YES, cache objects can be synced to Secondary in a HA deployment. If set to NO, objects will never be synced to Secondary node. Default value: NO Possible values = YES, NO
    .PARAMETER MaxPostlen
        Maximum number of POST body bytes to consider when evaluating parameters for a content group for which you have configured hit parameters and invalidation parameters. Default value: 4096 Minimum value = 0 Maximum value = 131072
    .PARAMETER Memlimit
        Amount of memory available for storing the cache objects. In practice, the amount of memory available for caching can be less than half the total memory of the Citrix ADC.
    .PARAMETER PrefetchMaxPending
        Maximum number of outstanding prefetches in the Integrated Cache.
    .PARAMETER UndefAction
        Action to take when a policy cannot be evaluated. Possible values = NOCACHE, RESET
    .PARAMETER Verifyusing
        Criteria for deciding whether a cached object can be served for an incoming HTTP request. Available settings function as follows: HOSTNAME - The URL, host name, and host port values in the incoming HTTP request header must match the cache policy. The IP address and the TCP port of the destination host are not evaluated. Do not use the HOSTNAME setting unless you are certain that no rogue client can access a rogue server through the cache. HOSTNAME_AND_IP - The URL, host name, host port in the incoming HTTP request header, and the IP address and TCP port of the destination server, must match the cache policy. DNS - The URL, host name and host port in the incoming HTTP request, and the TCP port must match the cache policy. The host name is used for DNS lookup of the destination server's IP address, and is compared with the set of addresses returned by the DNS lookup. Possible values = HOSTNAME, HOSTNAME_AND_IP, DNS
    .PARAMETER Via
        String to include in the Via header. A Via header is inserted into all responses served from a content group if its Insert Via flag is set. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetCacheparameter -CacheevictionPolicy RELAXED -PassThru
    .EXAMPLE
        Invoke-NSUnsetCacheparameter -CacheevictionPolicy RELAXED -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [ValidateSet('RELAXED', 'MODERATE', 'AGGRESSIVE')]
        [switch] $CacheevictionPolicy,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $EnableBypass,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Enablehaobjpersist,

        [Parameter()]
        [switch] $MaxPostlen,

        [Parameter()]
        [switch] $Memlimit,

        [Parameter()]
        [switch] $PrefetchMaxPending,

        [Parameter()]
        [ValidateSet('NOCACHE', 'RESET')]
        [switch] $UndefAction,

        [Parameter()]
        [ValidateSet('HOSTNAME', 'HOSTNAME_AND_IP', 'DNS')]
        [switch] $Verifyusing,

        [Parameter()]
        [switch] $Via,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = @{}
        if ($PSBoundParameters.ContainsKey('CacheevictionPolicy')) { $body['cacheevictionpolicy'] = $true }
        if ($PSBoundParameters.ContainsKey('EnableBypass')) { $body['enablebypass'] = $true }
        if ($PSBoundParameters.ContainsKey('Enablehaobjpersist')) { $body['enablehaobjpersist'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxPostlen')) { $body['maxpostlen'] = $true }
        if ($PSBoundParameters.ContainsKey('Memlimit')) { $body['memlimit'] = $true }
        if ($PSBoundParameters.ContainsKey('PrefetchMaxPending')) { $body['prefetchmaxpending'] = $true }
        if ($PSBoundParameters.ContainsKey('UndefAction')) { $body['undefaction'] = $true }
        if ($PSBoundParameters.ContainsKey('Verifyusing')) { $body['verifyusing'] = $true }
        if ($PSBoundParameters.ContainsKey('Via')) { $body['via'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('cacheparameter', 'Clear cacheparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cacheparameter -Action unset -Payload @{ cacheparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCacheparameter

# region Invoke-NSUnsetCachePolicy
function Invoke-NSUnsetCachePolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler cachepolicy resource properties.
    .DESCRIPTION
        Configuration for Integrated Cache policy resource.
    .PARAMETER PolicyName
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the policy is created. Minimum length = 1
    .PARAMETER InvalGroupS
        Content group(s) to be invalidated when the INVAL action is applied. Maximum number of content groups that can be specified is 16. Minimum length = 1
    .PARAMETER Invalobjects
        Content groups(s) in which the objects will be invalidated if the action is INVAL. Minimum length = 1
    .PARAMETER StoreinGroup
        Name of the content group in which to store the object when the final result of policy evaluation is CACHE. The content group must exist before being mentioned here. Use the "show cache contentgroup" command to view the list of existing content groups. Minimum length = 1
    .PARAMETER UndefAction
        Action to be performed when the result of rule evaluation is undefined. Possible values = NOCACHE, RESET
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetCachePolicy -PolicyName 'example' -InvalGroupS  -PassThru
    .EXAMPLE
        Invoke-NSUnsetCachePolicy -PolicyName 'example' -InvalGroupS  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $PolicyName,

        [Parameter()]
        [switch] $InvalGroupS,

        [Parameter()]
        [switch] $Invalobjects,

        [Parameter()]
        [switch] $StoreinGroup,

        [Parameter()]
        [ValidateSet('NOCACHE', 'RESET')]
        [switch] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = @{ policyname = $PolicyName }
        if ($PSBoundParameters.ContainsKey('InvalGroupS')) { $body['invalgroups'] = $true }
        if ($PSBoundParameters.ContainsKey('Invalobjects')) { $body['invalobjects'] = $true }
        if ($PSBoundParameters.ContainsKey('StoreinGroup')) { $body['storeingroup'] = $true }
        if ($PSBoundParameters.ContainsKey('UndefAction')) { $body['undefaction'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Clear cachepolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cachepolicy -Action unset -Payload @{ cachepolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCachePolicy -PolicyName $PolicyName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCachePolicy

# region Invoke-NSUpdateCacheContentGroup
function Invoke-NSUpdateCacheContentGroup {
    <#
    .SYNOPSIS
        Updates a NetScaler cachecontentgroup resource.
    .DESCRIPTION
        Configuration for Integrated Cache content group resource.
    .PARAMETER Absexpiry
        Local time, up to 4 times a day, at which all objects in the content group must expire. CLI Users: For example, to specify that the objects in the content group should expire by 11:00 PM, type the following command: add cache contentgroup <contentgroup name> -absexpiry 23:00 To specify that the objects in the content group should expire at 10:00 AM, 3 PM, 6 PM, and 11:00 PM, type: add cache contentgroup <contentgroup name> -absexpiry 10:00 15:00 18:00 23:00.
    .PARAMETER Absexpirygmt
        Coordinated Universal Time (GMT), up to 4 times a day, when all objects in the content group must expire.
    .PARAMETER Alwaysevalpolicies
        Force policy evaluation for each response arriving from the origin server. Cannot be set to YES if the Prefetch parameter is also set to YES. Default value: NO Possible values = YES, NO
    .PARAMETER Cachecontrol
        Insert a Cache-Control header into the response. Minimum length = 1
    .PARAMETER Expireatlastbyte
        Force expiration of the content immediately after the response is downloaded (upon receipt of the last byte of the response body). Applicable only to positive responses. Default value: NO Possible values = YES, NO
    .PARAMETER Flashcache
        Perform flash cache. Mutually exclusive with Poll Every Time (PET) on the same content group. Default value: NO Possible values = YES, NO
    .PARAMETER Heurexpiryparam
        Heuristic expiry time, in percent of the duration, since the object was last modified. Minimum value = 0 Maximum value = 100
    .PARAMETER Hitparams
        Parameters to use for parameterized hit evaluation of an object. Up to 128 parameters can be specified. Mutually exclusive with the Hit Selector parameter. Minimum length = 1
    .PARAMETER Hitselector
        Selector for evaluating whether an object gets stored in a particular content group. A selector is an abstraction for a collection of PIXL expressions.
    .PARAMETER Ignoreparamvaluecase
        Ignore case when comparing parameter values during parameterized hit evaluation. (Parameter value case is ignored by default during parameterized invalidation.). Possible values = YES, NO
    .PARAMETER Ignorereloadreq
        Ignore any request to reload a cached object from the origin server. To guard against Denial of Service attacks, set this parameter to YES. For RFC-compliant behavior, set it to NO. Default value: YES Possible values = YES, NO
    .PARAMETER Ignorereqcachinghdrs
        Ignore Cache-Control and Pragma headers in the incoming request. Default value: YES Possible values = YES, NO
    .PARAMETER InsertAge
        Insert an Age header into the response. An Age header contains information about the age of the object, in seconds, as calculated by the integrated cache. Default value: YES Possible values = YES, NO
    .PARAMETER InsertEtag
        Insert an ETag header in the response. With ETag header insertion, the integrated cache does not serve full responses on repeat requests. Default value: YES Possible values = YES, NO
    .PARAMETER InsertVia
        Insert a Via header into the response. Default value: YES Possible values = YES, NO
    .PARAMETER Invalparams
        Parameters for parameterized invalidation of an object. You can specify up to 8 parameters. Mutually exclusive with invalSelector. Minimum length = 1
    .PARAMETER InvalrestrictedtoHost
        Take the host header into account during parameterized invalidation. Possible values = YES, NO
    .PARAMETER Invalselector
        Selector for invalidating objects in the content group. A selector is an abstraction for a collection of PIXL expressions.
    .PARAMETER LazyDNSResolve
        Perform DNS resolution for responses only if the destination IP address in the request does not match the destination IP address of the cached response. Default value: YES Possible values = YES, NO
    .PARAMETER MatchCookieS
        Evaluate for parameters in the cookie header also. Possible values = YES, NO
    .PARAMETER MaxRessize
        Maximum size of a response that can be cached in this content group. Default value: 80 Minimum value = 0 Maximum value = 2097151
    .PARAMETER Memlimit
        Maximum amount of memory that the cache can use. The effective limit is based on the available memory of the Citrix ADC. Default value: 65536
    .PARAMETER MinHits
        Number of hits that qualifies a response for storage in this content group. Default value: 0
    .PARAMETER MinRessize
        Minimum size of a response that can be cached in this content group. Default minimum response size is 0. Minimum value = 0 Maximum value = 2097151
    .PARAMETER Name
        Name for the content group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the content group is created. Minimum length = 1
    .PARAMETER Persistha
        Setting persistHA to YES causes IC to save objects in contentgroup to Secondary node in HA deployment. Default value: NO Possible values = YES, NO
    .PARAMETER Pinned
        Do not flush objects from this content group under memory pressure. Default value: NO Possible values = YES, NO
    .PARAMETER Polleverytime
        Always poll for the objects in this content group. That is, retrieve the objects from the origin server whenever they are requested. Default value: NO Possible values = YES, NO
    .PARAMETER Prefetch
        Attempt to refresh objects that are about to go stale. Default value: YES Possible values = YES, NO
    .PARAMETER PrefetchMaxPending
        Maximum number of outstanding prefetches that can be queued for the content group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Prefetchperiod
        Time period, in seconds before an object's calculated expiry time, during which to attempt prefetch. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Prefetchperiodmillisec
        Time period, in milliseconds before an object's calculated expiry time, during which to attempt prefetch. Minimum value = 0 Maximum value = 4294967290
    .PARAMETER QUICKabortsize
        If the size of an object that is being downloaded is less than or equal to the quick abort value, and a client aborts during the download, the cache stops downloading the response. If the object is larger than the quick abort size, the cache continues to download the response. Default value: 4194303 Minimum value = 0 Maximum value = 4194303
    .PARAMETER Relexpiry
        Relative expiry time, in seconds, after which to expire an object cached in this content group. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Relexpirymillisec
        Relative expiry time, in milliseconds, after which to expire an object cached in this content group. Minimum value = 0 Maximum value = 86400000
    .PARAMETER RemoveCookieS
        Remove cookies from responses. Default value: YES Possible values = YES, NO
    .PARAMETER Weaknegrelexpiry
        Relative expiry time, in seconds, for expiring negative responses. This value is used only if the expiry time cannot be determined from any other source. It is applicable only to the following status codes: 307, 403, 404, and 410. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Weakposrelexpiry
        Relative expiry time, in seconds, for expiring positive responses with response codes between 200 and 399. Cannot be used in combination with other Expiry attributes. Similar to -relExpiry but has lower precedence. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateCacheContentGroup -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCacheContentGroup -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string[]] $Absexpiry,

        [Parameter()]
        [string[]] $Absexpirygmt,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Alwaysevalpolicies,

        [Parameter()]
        [string] $Cachecontrol,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Expireatlastbyte,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Flashcache,

        [Parameter()]
        [int] $Heurexpiryparam,

        [Parameter()]
        [string[]] $Hitparams,

        [Parameter()]
        [string] $Hitselector,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Ignoreparamvaluecase,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Ignorereloadreq,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Ignorereqcachinghdrs,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InsertAge,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InsertEtag,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InsertVia,

        [Parameter()]
        [string[]] $Invalparams,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $InvalrestrictedtoHost,

        [Parameter()]
        [string] $Invalselector,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $LazyDNSResolve,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $MatchCookieS,

        [Parameter()]
        [int] $MaxRessize,

        [Parameter()]
        [int] $Memlimit,

        [Parameter()]
        [int] $MinHits,

        [Parameter()]
        [int] $MinRessize,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Persistha,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Pinned,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Polleverytime,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Prefetch,

        [Parameter()]
        [int] $PrefetchMaxPending,

        [Parameter()]
        [int] $Prefetchperiod,

        [Parameter()]
        [int] $Prefetchperiodmillisec,

        [Parameter()]
        [int] $QUICKabortsize,

        [Parameter()]
        [int] $Relexpiry,

        [Parameter()]
        [int] $Relexpirymillisec,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $RemoveCookieS,

        [Parameter()]
        [int] $Weaknegrelexpiry,

        [Parameter()]
        [int] $Weakposrelexpiry,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Absexpiry')) { $properties['absexpiry'] = $Absexpiry }
    if ($PSBoundParameters.ContainsKey('Absexpirygmt')) { $properties['absexpirygmt'] = $Absexpirygmt }
    if ($PSBoundParameters.ContainsKey('Alwaysevalpolicies')) { $properties['alwaysevalpolicies'] = $Alwaysevalpolicies }
    if ($PSBoundParameters.ContainsKey('Cachecontrol')) { $properties['cachecontrol'] = $Cachecontrol }
    if ($PSBoundParameters.ContainsKey('Expireatlastbyte')) { $properties['expireatlastbyte'] = $Expireatlastbyte }
    if ($PSBoundParameters.ContainsKey('Flashcache')) { $properties['flashcache'] = $Flashcache }
    if ($PSBoundParameters.ContainsKey('Heurexpiryparam')) { $properties['heurexpiryparam'] = $Heurexpiryparam }
    if ($PSBoundParameters.ContainsKey('Hitparams')) { $properties['hitparams'] = $Hitparams }
    if ($PSBoundParameters.ContainsKey('Hitselector')) { $properties['hitselector'] = $Hitselector }
    if ($PSBoundParameters.ContainsKey('Ignoreparamvaluecase')) { $properties['ignoreparamvaluecase'] = $Ignoreparamvaluecase }
    if ($PSBoundParameters.ContainsKey('Ignorereloadreq')) { $properties['ignorereloadreq'] = $Ignorereloadreq }
    if ($PSBoundParameters.ContainsKey('Ignorereqcachinghdrs')) { $properties['ignorereqcachinghdrs'] = $Ignorereqcachinghdrs }
    if ($PSBoundParameters.ContainsKey('InsertAge')) { $properties['insertage'] = $InsertAge }
    if ($PSBoundParameters.ContainsKey('InsertEtag')) { $properties['insertetag'] = $InsertEtag }
    if ($PSBoundParameters.ContainsKey('InsertVia')) { $properties['insertvia'] = $InsertVia }
    if ($PSBoundParameters.ContainsKey('Invalparams')) { $properties['invalparams'] = $Invalparams }
    if ($PSBoundParameters.ContainsKey('InvalrestrictedtoHost')) { $properties['invalrestrictedtohost'] = $InvalrestrictedtoHost }
    if ($PSBoundParameters.ContainsKey('Invalselector')) { $properties['invalselector'] = $Invalselector }
    if ($PSBoundParameters.ContainsKey('LazyDNSResolve')) { $properties['lazydnsresolve'] = $LazyDNSResolve }
    if ($PSBoundParameters.ContainsKey('MatchCookieS')) { $properties['matchcookies'] = $MatchCookieS }
    if ($PSBoundParameters.ContainsKey('MaxRessize')) { $properties['maxressize'] = $MaxRessize }
    if ($PSBoundParameters.ContainsKey('Memlimit')) { $properties['memlimit'] = $Memlimit }
    if ($PSBoundParameters.ContainsKey('MinHits')) { $properties['minhits'] = $MinHits }
    if ($PSBoundParameters.ContainsKey('MinRessize')) { $properties['minressize'] = $MinRessize }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Persistha')) { $properties['persistha'] = $Persistha }
    if ($PSBoundParameters.ContainsKey('Pinned')) { $properties['pinned'] = $Pinned }
    if ($PSBoundParameters.ContainsKey('Polleverytime')) { $properties['polleverytime'] = $Polleverytime }
    if ($PSBoundParameters.ContainsKey('Prefetch')) { $properties['prefetch'] = $Prefetch }
    if ($PSBoundParameters.ContainsKey('PrefetchMaxPending')) { $properties['prefetchmaxpending'] = $PrefetchMaxPending }
    if ($PSBoundParameters.ContainsKey('Prefetchperiod')) { $properties['prefetchperiod'] = $Prefetchperiod }
    if ($PSBoundParameters.ContainsKey('Prefetchperiodmillisec')) { $properties['prefetchperiodmillisec'] = $Prefetchperiodmillisec }
    if ($PSBoundParameters.ContainsKey('QUICKabortsize')) { $properties['quickabortsize'] = $QUICKabortsize }
    if ($PSBoundParameters.ContainsKey('Relexpiry')) { $properties['relexpiry'] = $Relexpiry }
    if ($PSBoundParameters.ContainsKey('Relexpirymillisec')) { $properties['relexpirymillisec'] = $Relexpirymillisec }
    if ($PSBoundParameters.ContainsKey('RemoveCookieS')) { $properties['removecookies'] = $RemoveCookieS }
    if ($PSBoundParameters.ContainsKey('Weaknegrelexpiry')) { $properties['weaknegrelexpiry'] = $Weaknegrelexpiry }
    if ($PSBoundParameters.ContainsKey('Weakposrelexpiry')) { $properties['weakposrelexpiry'] = $Weakposrelexpiry }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update cachecontentgroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type cachecontentgroup -Payload @{ cachecontentgroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCacheContentGroup -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCacheContentGroup

# region Invoke-NSUpdateCacheparameter
function Invoke-NSUpdateCacheparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler cacheparameter resource.
    .DESCRIPTION
        Configuration for cache parameter resource.
    .PARAMETER CacheevictionPolicy
        The cacheEvictionPolicy determines the threshold for preemptive eviction of cache objects using the LRU (Least Recently Used) algorithm. If set to AGGRESSIVE, eviction is triggered when free cache memory drops to 40%. MODERATE triggers eviction at 25%, and RELAXED triggers eviction at 10%. Default value: RELAXED Possible values = RELAXED, MODERATE, AGGRESSIVE
    .PARAMETER EnableBypass
        Evaluate the request-time policies before attempting hit selection. If set to NO, an incoming request for which a matching object is found in cache storage results in a response regardless of the policy configuration. If the request matches a policy with a NOCACHE action, the request bypasses all cache processing. This parameter does not affect processing of requests that match any invalidation policy. Possible values = YES, NO
    .PARAMETER Enablehaobjpersist
        The HA object persisting parameter. When this value is set to YES, cache objects can be synced to Secondary in a HA deployment. If set to NO, objects will never be synced to Secondary node. Default value: NO Possible values = YES, NO
    .PARAMETER MaxPostlen
        Maximum number of POST body bytes to consider when evaluating parameters for a content group for which you have configured hit parameters and invalidation parameters. Default value: 4096 Minimum value = 0 Maximum value = 131072
    .PARAMETER Memlimit
        Amount of memory available for storing the cache objects. In practice, the amount of memory available for caching can be less than half the total memory of the Citrix ADC.
    .PARAMETER PrefetchMaxPending
        Maximum number of outstanding prefetches in the Integrated Cache.
    .PARAMETER UndefAction
        Action to take when a policy cannot be evaluated. Possible values = NOCACHE, RESET
    .PARAMETER Verifyusing
        Criteria for deciding whether a cached object can be served for an incoming HTTP request. Available settings function as follows: HOSTNAME - The URL, host name, and host port values in the incoming HTTP request header must match the cache policy. The IP address and the TCP port of the destination host are not evaluated. Do not use the HOSTNAME setting unless you are certain that no rogue client can access a rogue server through the cache. HOSTNAME_AND_IP - The URL, host name, host port in the incoming HTTP request header, and the IP address and TCP port of the destination server, must match the cache policy. DNS - The URL, host name and host port in the incoming HTTP request, and the TCP port must match the cache policy. The host name is used for DNS lookup of the destination server's IP address, and is compared with the set of addresses returned by the DNS lookup. Possible values = HOSTNAME, HOSTNAME_AND_IP, DNS
    .PARAMETER Via
        String to include in the Via header. A Via header is inserted into all responses served from a content group if its Insert Via flag is set. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateCacheparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateCacheparameter  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $CacheevictionPolicy,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $EnableBypass,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Enablehaobjpersist,

        [Parameter()]
        [int] $MaxPostlen,

        [Parameter()]
        [int] $Memlimit,

        [Parameter()]
        [int] $PrefetchMaxPending,

        [Parameter()]
        [ValidateSet('NOCACHE', 'RESET')]
        [string] $UndefAction,

        [Parameter()]
        [ValidateSet('HOSTNAME', 'HOSTNAME_AND_IP', 'DNS')]
        [string] $Verifyusing,

        [Parameter()]
        [string] $Via,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    if ($PSBoundParameters.ContainsKey('CacheevictionPolicy')) {
        Assert-NSParameterValue -ParameterName 'CacheevictionPolicy' -Value $CacheevictionPolicy -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('RELAXED', 'MODERATE', 'AGGRESSIVE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('CacheevictionPolicy')) { $properties['cacheevictionpolicy'] = $CacheevictionPolicy }
    if ($PSBoundParameters.ContainsKey('EnableBypass')) { $properties['enablebypass'] = $EnableBypass }
    if ($PSBoundParameters.ContainsKey('Enablehaobjpersist')) { $properties['enablehaobjpersist'] = $Enablehaobjpersist }
    if ($PSBoundParameters.ContainsKey('MaxPostlen')) { $properties['maxpostlen'] = $MaxPostlen }
    if ($PSBoundParameters.ContainsKey('Memlimit')) { $properties['memlimit'] = $Memlimit }
    if ($PSBoundParameters.ContainsKey('PrefetchMaxPending')) { $properties['prefetchmaxpending'] = $PrefetchMaxPending }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }
    if ($PSBoundParameters.ContainsKey('Verifyusing')) { $properties['verifyusing'] = $Verifyusing }
    if ($PSBoundParameters.ContainsKey('Via')) { $properties['via'] = $Via }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('cacheparameter', 'Update cacheparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type cacheparameter -Payload @{ cacheparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateCacheparameter

# region Invoke-NSUpdateCachePolicy
function Invoke-NSUpdateCachePolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler cachepolicy resource.
    .DESCRIPTION
        Configuration for Integrated Cache policy resource.
    .PARAMETER Action
        Action to apply to content that matches the policy. * CACHE or MAY_CACHE action - positive cachability policy * NOCACHE or MAY_NOCACHE action - negative cachability policy * INVAL action - Dynamic Invalidation Policy. Possible values = CACHE, NOCACHE, MAY_CACHE, MAY_NOCACHE, INVAL
    .PARAMETER InvalGroupS
        Content group(s) to be invalidated when the INVAL action is applied. Maximum number of content groups that can be specified is 16. Minimum length = 1
    .PARAMETER Invalobjects
        Content groups(s) in which the objects will be invalidated if the action is INVAL. Minimum length = 1
    .PARAMETER PolicyName
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the policy is created. Minimum length = 1
    .PARAMETER Rule
        Expression against which the traffic is evaluated. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER StoreinGroup
        Name of the content group in which to store the object when the final result of policy evaluation is CACHE. The content group must exist before being mentioned here. Use the "show cache contentgroup" command to view the list of existing content groups. Minimum length = 1
    .PARAMETER UndefAction
        Action to be performed when the result of rule evaluation is undefined. Possible values = NOCACHE, RESET
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateCachePolicy -PolicyName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCachePolicy -PolicyName 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [ValidateSet('CACHE', 'NOCACHE', 'MAY_CACHE', 'MAY_NOCACHE', 'INVAL')]
        [string] $Action,

        [Parameter()]
        [string[]] $InvalGroupS,

        [Parameter()]
        [string[]] $Invalobjects,

        [Parameter(Mandatory, Position = 0)]
        [string] $PolicyName,

        [Parameter()]
        [string] $Rule,

        [Parameter()]
        [string] $StoreinGroup,

        [Parameter()]
        [ValidateSet('NOCACHE', 'RESET')]
        [string] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Action')) { $properties['action'] = $Action }
    if ($PSBoundParameters.ContainsKey('InvalGroupS')) { $properties['invalgroups'] = $InvalGroupS }
    if ($PSBoundParameters.ContainsKey('Invalobjects')) { $properties['invalobjects'] = $Invalobjects }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('StoreinGroup')) { $properties['storeingroup'] = $StoreinGroup }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$PolicyName", 'Update cachepolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type cachepolicy -Payload @{ cachepolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCachePolicy -PolicyName $PolicyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCachePolicy

# region Invoke-NSUpdateCacheSelector
function Invoke-NSUpdateCacheSelector {
    <#
    .SYNOPSIS
        Updates a NetScaler cacheselector resource.
    .DESCRIPTION
        Configuration for cache selector resource.
    .PARAMETER Rule
        One or multiple PIXL expressions for evaluating an HTTP request or response. Minimum length = 1
    .PARAMETER SelectorName
        Name for the selector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateCacheSelector -SelectorName 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCacheSelector -SelectorName 'example' -Rule 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string[]] $Rule,

        [Parameter(Mandatory, Position = 0)]
        [string] $SelectorName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('SelectorName')) { $properties['selectorname'] = $SelectorName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$SelectorName", 'Update cacheselector')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type cacheselector -Payload @{ cacheselector = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCacheSelector -SelectorName $SelectorName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCacheSelector

# SIG # Begin signature block
# MII6AQYJKoZIhvcNAQcCoII58jCCOe4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCNt2nrRBqxgmg1
# mgWVc+M10ievD9WvoEkAWbVZoSftn6CCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
# lUgTecgRwIeZMA0GCSqGSIb3DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVu
# dGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAy
# MDAeFw0yMDA0MTYxODM2MTZaFw00NTA0MTYxODQ0NDBaMHcxCzAJBgNVBAYTAlVT
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jv
# c29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRo
# b3JpdHkgMjAyMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALORKgeD
# Bmf9np3gx8C3pOZCBH8Ppttf+9Va10Wg+3cL8IDzpm1aTXlT2KCGhFdFIMeiVPvH
# or+Kx24186IVxC9O40qFlkkN/76Z2BT2vCcH7kKbK/ULkgbk/WkTZaiRcvKYhOuD
# PQ7k13ESSCHLDe32R0m3m/nJxxe2hE//uKya13NnSYXjhr03QNAlhtTetcJtYmrV
# qXi8LW9J+eVsFBT9FMfTZRY33stuvF4pjf1imxUs1gXmuYkyM6Nix9fWUmcIxC70
# ViueC4fM7Ke0pqrrBc0ZV6U6CwQnHJFnni1iLS8evtrAIMsEGcoz+4m+mOJyoHI1
# vnnhnINv5G0Xb5DzPQCGdTiO0OBJmrvb0/gwytVXiGhNctO/bX9x2P29Da6SZEi3
# W295JrXNm5UhhNHvDzI9e1eM80UHTHzgXhgONXaLbZ7LNnSrBfjgc10yVpRnlyUK
# xjU9lJfnwUSLgP3B+PR0GeUw9gb7IVc+BhyLaxWGJ0l7gpPKWeh1R+g/OPTHU3mg
# trTiXFHvvV84wRPmeAyVWi7FQFkozA8kwOy6CXcjmTimthzax7ogttc32H83rwjj
# O3HbbnMbfZlysOSGM1l0tRYAe1BtxoYT2v3EOYI9JACaYNq6lMAFUSw0rFCZE4e7
# swWAsk0wAly4JoNdtGNz764jlU9gKL431VulAgMBAAGjVDBSMA4GA1UdDwEB/wQE
# AwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTIftJqhSobyhmYBAcnz1AQ
# T2ioojAQBgkrBgEEAYI3FQEEAwIBADANBgkqhkiG9w0BAQwFAAOCAgEAr2rd5hnn
# LZRDGU7L6VCVZKUDkQKL4jaAOxWiUsIWGbZqWl10QzD0m/9gdAmxIR6QFm3FJI9c
# Zohj9E/MffISTEAQiwGf2qnIrvKVG8+dBetJPnSgaFvlVixlHIJ+U9pW2UYXeZJF
# xBA2CFIpF8svpvJ+1Gkkih6PsHMNzBxKq7Kq7aeRYwFkIqgyuH4yKLNncy2RtNwx
# AQv3Rwqm8ddK7VZgxCwIo3tAsLx0J1KH1r6I3TeKiW5niB31yV2g/rarOoDXGpc8
# FzYiQR6sTdWD5jw4vU8w6VSp07YEwzJ2YbuwGMUrGLPAgNW3lbBeUU0i/OxYqujY
# lLSlLu2S3ucYfCFX3VVj979tzR/SpncocMfiWzpbCNJbTsgAlrPhgzavhgplXHT2
# 6ux6anSg8Evu75SjrFDyh+3XOjCDyft9V77l4/hByuVkrrOj7FjshZrM77nq81YY
# uVxzmq/FdxeDWds3GhhyVKVB0rYjdaNDmuV3fJZ5t0GNv+zcgKCf0Xd1WF81E+Al
# GmcLfc4l+gcK5GEh2NQc5QfGNpn0ltDGFf5Ozdeui53bFv0ExpK91IjmqaOqu/dk
# ODtfzAzQNb50GQOmxapMomE2gj4d8yu8l13bS3g7LfU772Aj6PXsCyM2la+YZr9T
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAQqYjg2
# C/C7UthEAAAABCpiMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQwHhcNMjYwODAxMTk0NTU5WhcNMjYwODA0
# MTk0NTU5WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAzJVfDiyD7X5wjaVAbNcWusQ1
# m3nZDHQpCr9Tac4NJB+RO2I778PjqBIVN5CyAGRYbP/nK+yy2tOAjaC/Fo5hatz0
# 5EFprl6CuV28E2OulBZ6fZm1NByGMHdctNVVoQDnZp0H32GVlavYJKwiLzESO01m
# 5DV2mQxEyxWGQlPyNUZousEvBi0LyvtQ/MnekqzqSqRnoT1HNul8Em4CoEMqUsLe
# nyYSQJ/YBj5ZiLbPdvEdSSZfHBnKFyJSzU1LoXYpgH1BLsS24pIlF3kHUxN8LcKd
# yBkqISEUElx7O4+fi71na+s04CjDI2ffkGt4Uhhcd2kzMsUEATi5YLLW/0m3SX1k
# AaSX4k2SmIGrCIiD7Tg5dxsnoz37mshvEhsGCd91PLsxVlCQrTcz1Pg2lLki9RXv
# ekrOS9B8jAdXbN5cU42szS4Z6olfShAHFBo1TizkYMgjxAOqZPWKCsgAZrT4R9SH
# auKCkCkTqGV3XoIKQ22FozT/NMfxKcmo4kh0MCaNAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# SNqcq9sa54tVhaeGFcwQwietz+UwHwYDVR0jBBgwFoAUayVB3vtrfP0YgAotf492
# XapzPbgwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwNC5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDQuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBADop
# 8VvsB0PCl6Oomj6RIkJs5sJADvWluNDY8wf4eidt0AX2JpTTLzXVWcZTE+78wYhe
# 2sBmufBXIw6PRhOcTSOfReICWaUTSKLTWX0Z1x9YN1HugpMpvMatentzINPYpP+q
# ao91Rsn9lT91MES6CnrhhB/sBZEK4KHf2yNQ3MJ+kRAf1qre1j9S9DWuBiprg+2C
# sOex2VKs2+rHbuT6CFdw67T9k+bleKiktjFInfVlJ0dfMTa6D/mv5ED/az9xccjQ
# cses9dSiGIXg2stIc49dvfZZK16/zFfn4JXZOHcenYvg1HXNaywh8htkOz2ylbQB
# XB8JtDmY5sLCT8oYxILmhgmZ8FWrRaW7yOnGUSAxRYaiGj7tiDcIhwI86tuxEKFu
# vkGoFTOh5fch0g/pNqAxDnUlDyrlkaZ3w6c2cC6lEeOEnX9wMNbpgdE0kX/vNB6Y
# p2IqGZ9e01rKS0T1yHYy2jvY761YirKkewV/xWqjj9OQktKA9ri+LRcizKD1PqkH
# uVyjsUs5LDdZbkjJTCkr07LEda/cGG9SFxd4nFuUWW+IcU7QwCMLpCUaoUmpVNJF
# 93lLntphbR4lQjJqcO68JXvJ8zE2yCjQ/07fk+BqJDe9/ha1pJpqizxeqkCsdJcg
# Fc3dv1gLb4r3GwBWsVpvKE+gTpVk/1z1SK7OjMKRMIIGwDCCBKigAwIBAgITMwAE
# KmI4Ngvwu1LYRAAAAAQqYjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDA0MB4XDTI2MDgwMTE5NDU1OVoXDTI2
# MDgwNDE5NDU1OVowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAMyVXw4sg+1+cI2lQGzX
# FrrENZt52Qx0KQq/U2nODSQfkTtiO+/D46gSFTeQsgBkWGz/5yvsstrTgI2gvxaO
# YWrc9ORBaa5egrldvBNjrpQWen2ZtTQchjB3XLTVVaEA52adB99hlZWr2CSsIi8x
# EjtNZuQ1dpkMRMsVhkJT8jVGaLrBLwYtC8r7UPzJ3pKs6kqkZ6E9RzbpfBJuAqBD
# KlLC3p8mEkCf2AY+WYi2z3bxHUkmXxwZyhciUs1NS6F2KYB9QS7EtuKSJRd5B1MT
# fC3CncgZKiEhFBJcezuPn4u9Z2vrNOAowyNn35BreFIYXHdpMzLFBAE4uWCy1v9J
# t0l9ZAGkl+JNkpiBqwiIg+04OXcbJ6M9+5rIbxIbBgnfdTy7MVZQkK03M9T4NpS5
# IvUV73pKzkvQfIwHV2zeXFONrM0uGeqJX0oQBxQaNU4s5GDII8QDqmT1igrIAGa0
# +EfUh2rigpApE6hld16CCkNthaM0/zTH8SnJqOJIdDAmjQIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFEjanKvbGueLVYWnhhXMEMInrc/lMB8GA1UdIwQYMBaAFGslQd77a3z9GIAK
# LX+Pdl2qcz24MGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDQuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDA0LmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQA6KfFb7AdDwpejqJo+kSJCbObCQA71pbjQ2PMH+HonbdAF9iaU0y811VnGUxPu
# /MGIXtrAZrnwVyMOj0YTnE0jn0XiAlmlE0ii01l9GdcfWDdR7oKTKbzGrXp7cyDT
# 2KT/qmqPdUbJ/ZU/dTBEugp64YQf7AWRCuCh39sjUNzCfpEQH9aq3tY/UvQ1rgYq
# a4PtgrDnsdlSrNvqx27k+ghXcOu0/ZPm5XiopLYxSJ31ZSdHXzE2ug/5r+RA/2s/
# cXHI0HLHrPXUohiF4NrLSHOPXb32WStev8xX5+CV2Th3Hp2L4NR1zWssIfIbZDs9
# spW0AVwfCbQ5mObCwk/KGMSC5oYJmfBVq0Wlu8jpxlEgMUWGoho+7Yg3CIcCPOrb
# sRChbr5BqBUzoeX3IdIP6TagMQ51JQ8q5ZGmd8OnNnAupRHjhJ1/cDDW6YHRNJF/
# 7zQemKdiKhmfXtNayktE9ch2Mto72O+tWIqypHsFf8Vqo4/TkJLSgPa4vi0XIsyg
# 9T6pB7lco7FLOSw3WW5IyUwpK9OyxHWv3BhvUhcXeJxblFlviHFO0MAjC6QlGqFJ
# qVTSRfd5S57aYW0eJUIyanDuvCV7yfMxNsgo0P9O35PgaiQ3vf4WtaSaaos8XqpA
# rHSXIBXN3b9YC2+K9xsAVrFabyhPoE6VZP9c9UiuzozCkTCCBygwggUQoAMCAQIC
# EzMAAAAWMZKNkgJle5oAAAAAABYwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMjlaFw0zMTAzMjYxODExMjlaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDKVfrI2+gJMM/0bQ5OVKNdvOASzLbUUMvXuf+Vl7YGuofPaZHVo3gMHF5i
# nT+GMSpIcfIZ9qtXU1UG68ry8vNbQtOL4Nm30ifXpqI1+ByiAWLO1YT0WnzG7XPO
# uoTeeWsNZv5FmjxCsReBZvyzyzCyXZbu1EQfJxWTH4ebUwtAiW9rqMf9eDj/wYhi
# EfNteJV3ZFeibD2ztCHr9JhFdd97XbnCHgQoTIqc02X5xlRKtUGBa++OtHBBjiJ/
# uwBnzTkqu4FjpZjQeJtrmda+ur1CT2jflWIB/ypn7u7V9tvW9wJbJYt/H2EtJ0GO
# NWxJZ7TEu8jWPindOO3lzPP7UtzS/mVDV94HucWaltmsra6zSG8BoEJ87IM8QSb7
# vfm/O41FhYkUv89WIj5ES2O4kxyiMSfe95CMivCuYrRP2hKvx7egPMrWgDDBkxML
# grKZO9hRNUMm8vk3w5b9SogHOyJVhxyFm8aFXfIxgqDF4S0g4bhbhnzljmSlCLlu
# mMZcXFGDjpF2tNoAu3VGFGYtHtTSNVKvZpgB3b4ynaoDkbPf+Wg4523jt4VneasB
# gZhC1srZI2NCnCBBfgjLq04pqEKAWEohyW2K29KSkkHvt5VaE1ac3Yt+oyiOzMS5
# 7tXwQDJLGvLg/OXFO0VNvczDndfIfXYExB/ab2PuMSwd5VIBOwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRr
# JUHe+2t8/RiACi1/j3ZdqnM9uDBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQAG1VBeVHTVRBljlcZD3IiMxwPyMjQyLNaEnVu5mODm2hRB
# JfH8GsBLATmrHAc8F47jmk5CnpUPiIguCbw6Z/KVj4Dsoiq228NSLMLewFfGMri7
# uwNGLISC5ccp8vUdADDEIsS2dE+QI9OwkDpv3XuUD7d+hAgcLVcMOl1AsfEZtsZe
# nhGvSYUrm/FuLq0BqEGL9GXM5c+Ho9q8o+Vn/S+GWQN2y+gkRO15s0kI05nUpq/d
# OD4ri9rgVs6tipEd0YZqGgD+CZNiaZWrDTOQbNPncd2F9qOsUa20miYruoT5PwJA
# aI+QQiTE2ZJeMJOkOpzhTUgqVMZwZidEUZKCqudaeQA08WwnkQMfKyHzaU8j48UL
# cU4hUwvMsv7fSurOe9GAdRQCPvF8WcSK5oDHe8VVJM4tv6KKCm91HqLx9JamBgRI
# 6R2SfY3nu26EGznu0rCg/769z8xWm4PVcC2ZaL6VlKVqFp1NsN8YqMyf5t+bbGVb
# 09noFKcJG/UwyGlxRmQBlfeBUQx5/ytlzZzsEnhrJF9fTAfje8j3OdX5lEnePTFQ
# LRlvzZFBqUXnIeQKv3fHQjC9m2fo/Z01DII/qp3d8LhGVUW0BCG04fRwHJNH8iqq
# CG/qofMv+kym2AxBDnHzNgRjL60JOFiBgiurvLhYQNhB95KWojFA6shQnggkMTCC
# B54wggWGoAMCAQICEzMAAAAHh6M0o3uljhwAAAAAAAcwDQYJKoZIhvcNAQEMBQAw
# dzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjFI
# MEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBSb290IENl
# cnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIxMDQwMTIwMDUyMFoXDTM2MDQw
# MTIwMTUyMFowYzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjE0MDIGA1UEAxMrTWljcm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2ln
# bmluZyBQQ0EgMjAyMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALLw
# wK8ZiCji3VR6TElsaQhVCbRS/3pK+MHrJSj3Zxd3KU3rlfL3qrZilYKJNqztA9OQ
# acr1AwoNcHbKBLbsQAhBnIB34zxf52bDpIO3NJlfIaTE/xrweLoQ71lzCHkD7A4A
# s1Bs076Iu+mA6cQzsYYH/Cbl1icwQ6C65rU4V9NQhNUwgrx9rGQ//h890Q8JdjLL
# w0nV+ayQ2Fbkd242o9kH82RZsH3HEyqjAB5a8+Ae2nPIPc8sZU6ZE7iRrRZywRmr
# KDp5+TcmJX9MRff241UaOBs4NmHOyke8oU1TYrkxh+YeHgfWo5tTgkoSMoayqoDp
# HOLJs+qG8Tvh8SnifW2Jj3+ii11TS8/FGngEaNAWrbyfNrC69oKpRQXY9bGH6jn9
# NEJv9weFxhTwyvx9OJLXmRGbAUXN1U9nf4lXezky6Uh/cgjkVd6CGUAf0K+Jw+GE
# /5VpIVbcNr9rNE50Sbmy/4RTCEGvOq3GhjITbCa4crCzTTHgYYjHs1NbOc6brH+e
# KpWLtr+bGecy9CrwQyx7S/BfYJ+ozst7+yZtG2wR461uckFu0t+gCwLdN0A6cFtS
# RtR8bvxVFyWwTtgMMFRuBa3vmUOTnfKLsLefRaQcVTgRnzeLzdpt32cdYKp+dhr2
# ogc+qM6K4CBI5/j4VFyC4QFeUP2YAidLtvpXRRo3AgMBAAGjggI1MIICMTAOBgNV
# HQ8BAf8EBAMCAYYwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFNlBKbAPD2Ns
# 72nX9c0pnqRIajDmMFQGA1UdIARNMEswSQYEVR0gADBBMD8GCCsGAQUFBwIBFjNo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5o
# dG0wGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBTIftJqhSobyhmYBAcnz1AQT2ioojCBhAYDVR0fBH0wezB5oHeg
# dYZzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0
# JTIwSWRlbnRpdHklMjBWZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUl
# MjBBdXRob3JpdHklMjAyMDIwLmNybDCBwwYIKwYBBQUHAQEEgbYwgbMwgYEGCCsG
# AQUFBzAChnVodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01p
# Y3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0aW9uJTIwUm9vdCUyMENlcnRp
# ZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcnQwLQYIKwYBBQUHMAGGIWh0dHA6
# Ly9vbmVvY3NwLm1pY3Jvc29mdC5jb20vb2NzcDANBgkqhkiG9w0BAQwFAAOCAgEA
# fyUqnv7Uq+rdZgrbVyNMul5skONbhls5fccPlmIbzi+OwVdPQ4H55v7VOInnmezQ
# EeW4LqK0wja+fBznANbXLB0KrdMCbHQpbLvG6UA/Xv2pfpVIE1CRFfNF4XKO8XYE
# a3oW8oVH+KZHgIQRIwAbyFKQ9iyj4aOWeAzwk+f9E5StNp5T8FG7/VEURIVWArbA
# zPt9ThVN3w1fAZkF7+YU9kbq1bCR2YD+MtunSQ1Rft6XG7b4e0ejRA7mB2IoX5hN
# h3UEauY0byxNRG+fT2MCEhQl9g2i2fs6VOG19CNep7SquKaBjhWmirYyANb0RJSL
# WjinMLXNOAga10n8i9jqeprzSMU5ODmrMCJE12xS/NWShg/tuLjAsKP6SzYZ+1Ry
# 358ZTFcx0FS/mx2vSoU8s8HRvy+rnXqyUJ9HBqS0DErVLjQwK8VtsBdekBmdTbQV
# oCgPCqr+PDPB3xajYnzevs7eidBsM71PINK2BoE2UfMwxCCX3mccFgx6UsQeRSdV
# VVNSyALQe6PT12418xon2iDGE81OGCreLzDcMAZnrUAx4XQLUz6ZTl65yPUiOh3k
# 7Yww94lDf+8oG2oZmDh5O1Qe38E+M3vhKwmzIeoB1dVLlz4i3IpaDcR+iuGjH2Td
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcxMIIXLQIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABCpi
# ODYL8LtS2EQAAAAEKmIwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgMHVf
# PtmWtDc4Ybqbcad32dF3e0KaeDb7RQ91q3UDC0gwDQYJKoZIhvcNAQEBBQAEggGA
# qwpg5t3GPETv6RGvTKf+nLpNNOmhYAzdFiWQ56AmIHK7J2PVa8dWpVEbTXzaFtKH
# a9eLBkwct+xld9djtIZ0lYErx/kq94OvI8peCJS+aU+VbILjyeZu+Zc/5dHY0LJM
# DqGg5YD6Dva9abLLbVNXKeg7pysqHPBIKgg9+MOYKa+F2fljAyIqXRJTn1V4n/JH
# 9cG+7hH9LMknLhU5eRmeIqno/kLzY+JYaX3qq5o8A4B9Z0o6s02RiZZlaDW8ODsL
# wY4ntSZj9TgLFIGHOnLZM9xKu3DDa08wnx4VOg0j53PXmjEvNA4mU9LUi9K5dxiy
# WNtEXT+VxrA8R0cxBP8K1VzmHqUr/Wmt3eUJUVojzkL73JHzPuGFv0wrRjCiGBeq
# yqIq4tPKq2yhVoXc9OIkMX6X7+Va+Ib/VK6ZA3/MIutRmc+gMtNlyXFg9f5YiIRW
# Marfm5AV3Ov4WtDi2gB/JYXj+adoIVGNvkcT0CqrYBXBz6Y+Edwpap3X4YFq/Kr2
# oYIUsTCCFK0GCisGAQQBgjcDAwExghSdMIIUmQYJKoZIhvcNAQcCoIIUijCCFIYC
# AQMxDzANBglghkgBZQMEAgEFADCCAWkGCyqGSIb3DQEJEAEEoIIBWASCAVQwggFQ
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIFz61Iphq02dTN7zUSJo
# QQd1j1IyTjJuJ9dWQDcqZbP1AgZqNWdtw4QYEjIwMjYwODAzMTI1MTIyLjExWjAE
# gAIB9KCB6aSB5jCB4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVk
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046N0ExQS0wNUUwLUQ5NDcxNTAzBgNV
# BAMTLE1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5
# oIIPKTCCB4IwggVqoAMCAQICEzMAAAAF5c8P/2YuyYcAAAAAAAUwDQYJKoZIhvcN
# AQEMBQAwdzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjFIMEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBS
# b290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIwMTExOTIwMzIzMVoX
# DTM1MTExOTIwNDIzMVowYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGlt
# ZXN0YW1waW5nIENBIDIwMjAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQCefOdSY/3gxZ8FfWO1BiKjHB7X55cz0RMFvWVGR3eRwV1wb3+yq0OXDEqhUhxq
# oNv6iYWKjkMcLhEFxvJAeNcLAyT+XdM5i2CgGPGcb95WJLiw7HzLiBKrxmDj1EQB
# /mG5eEiRBEp7dDGzxKCnTYocDOcRr9KxqHydajmEkzXHOeRGwU+7qt8Md5l4bVZr
# XAhK+WSk5CihNQsWbzT1nRliVDwunuLkX1hyIWXIArCfrKM3+RHh+Sq5RZ8aYyik
# 2r8HxT+l2hmRllBvE2Wok6IEaAJanHr24qoqFM9WLeBUSudz+qL51HwDYyIDPSQ3
# SeHtKog0ZubDk4hELQSxnfVYXdTGncaBnB60QrEuazvcob9n4yR65pUNBCF5qeA4
# QwYnilBkfnmeAjRN3LVuLr0g0FXkqfYdUmj1fFFhH8k8YBozrEaXnsSL3kdTD01X
# +4LfIWOuFzTzuoslBrBILfHNj8RfOxPgjuwNvE6YzauXi4orp4Sm6tF245DaFOSY
# bWFK5ZgG6cUY2/bUq3g3bQAqZt65KcaewEJ3ZyNEobv35Nf6xN6FrA6jF9447+NH
# vCjeWLCQZ3M8lgeCcnnhTFtyQX3XgCoc6IRXvFOcPVrr3D9RPHCMS6Ckg8wggTrt
# IVnY8yjbvGOUsAdZbeXUIQAWMs0d3cRDv09SvwVRd61evQIDAQABo4ICGzCCAhcw
# DgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRraSg6
# NS9IY0DPe9ivSek+2T3bITBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEFBQcC
# ARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRv
# cnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1
# AGIAQwBBMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUyH7SaoUqG8oZmAQH
# J89QEE9oqKIwgYQGA1UdHwR9MHsweaB3oHWGc2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0
# aW9uJTIwUm9vdCUyMENlcnRpZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcmww
# gZQGCCsGAQUFBwEBBIGHMIGEMIGBBggrBgEFBQcwAoZ1aHR0cDovL3d3dy5taWNy
# b3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZl
# cmlmaWNhdGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIw
# MjAuY3J0MA0GCSqGSIb3DQEBDAUAA4ICAQBfiHbHfm21WhV150x4aPpO4dhEmSUV
# pbixNDmv6TvuIHv1xIs174bNGO/ilWMm+Jx5boAXrJxagRhHQtiFprSjMktTliL4
# sKZyt2i+SXncM23gRezzsoOiBhv14YSd1Klnlkzvgs29XNjT+c8hIfPRe9rvVCMP
# iH7zPZcw5nNjthDQ+zD563I1nUJ6y59TbXWsuyUsqw7wXZoGzZwijWT5oc6GvD3H
# DokJY401uhnj3ubBhbkR83RbfMvmzdp3he2bvIUztSOuFzRqrLfEvsPkVHYnvH1w
# tYyrt5vShiKheGpXa2AWpsod4OJyT4/y0dggWi8g/tgbhmQlZqDUf3UqUQsZaLdI
# u/XSjgoZqDjamzCPJtOLi2hBwL+KsCh0Nbwc21f5xvPSwym0Ukr4o5sCcMUcSy6T
# EP7uMV8RX0eH/4JLEpGyae6Ki8JYg5v4fsNGif1OXHJ2IWG+7zyjTDfkmQ1snFOT
# gyEX8qBpefQbF0fx6URrYiarjmBprwP6ZObwtZXJ23jK3Fg/9uqM3j0P01nzVygT
# ppBabzxPAh/hHhhls6kwo3QLJ6No803jUsZcd4JQxiYHHc+Q/wAMcPUnYKv/q2O4
# 44LO1+n6j01z5mggCSlRwD9faBIySAcA9S8h22hIAcRQqIGEjolCK9F6nK9ZyX4l
# hthsGHumaABdWzCCB58wggWHoAMCAQICEzMAAABbSrWNQTJt3HQAAAAAAFswDQYJ
# KoZIhvcNAQEMBQAwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjAwHhcNMjYwMTA4MTg1OTA1WhcNMjcwMTA3MTg1OTA1WjCB
# 4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMk
# TWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5u
# U2hpZWxkIFRTUyBFU046N0ExQS0wNUUwLUQ5NDcxNTAzBgNVBAMTLE1pY3Jvc29m
# dCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5MIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAkFTMFtueUNd57QHQoPkbj/jvm2EXJ9y0LK4R
# JNZBe+UuLhbH+13apR16riJ156DpVaGI4d+7fAlXhNQZJG2qH0JyvUGaIEq/2K4W
# mAfIgG7lDHfxmzHCUV5dVL5mokkqddFsM1B1xhKgL/pzSFAn88fnQMFENCQ9dXDI
# WLMutEf0CWsl5SDsEp5PbfN+1Lz8o4ku8QRsc4XqlI5jdlWmtlRZtaNbBFOagdpD
# 8Ty+ta0s3IQn5vTz1VbUiStre3gZMHlZvLcIvUrbNicDEEi9p+wowXKP065cdxM8
# owOgVIx5qYb0wo4xvq6gbU+N2cOCws/oQ4xFLOssvuMQPWZsH1FJ31+G3L4dCvq9
# mCwGfqhTL5hOk1UuyTB21QzzZZgCQ/O2U63cCIvSrJXv9TeP+6re8cyM8zTDTfjQ
# zns16LSDgEJwy3R1uqhz3VWAJvf/fqwdAA2ie2fUc4XaguTzX3RBFLjeKwdWtrwf
# yx/n4aWohixiIIpfTgdmI7NlbzbqdUjp377yXJN5aamP3RRr249smFWPATeiHq07
# nXTJKqZIxIsQ3Tuncht7cToEBvbD3etbNvbr52lK2FsoXiQCmh+oGxY9fgwS0cpI
# 5+0+ZVMJDju2CGtW4eJr2Nj4eyPTWbgpbha2SZWbcvqExkQIxriyMzEBfP5tf8Am
# FZN7pNkCAwEAAaOCAcswggHHMB0GA1UdDgQWBBTv8upSVZZiFcl1fCBgrHhvwa/S
# tjAfBgNVHSMEGDAWgBRraSg6NS9IY0DPe9ivSek+2T3bITBsBgNVHR8EZTBjMGGg
# X6BdhltodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3Nv
# ZnQlMjBQdWJsaWMlMjBSU0ElMjBUaW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3Js
# MHkGCCsGAQUFBwEBBG0wazBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBQdWJsaWMlMjBSU0ElMjBU
# aW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0l
# AQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMGYGA1UdIARfMF0wUQYM
# KwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTAIBgZngQwBBAIwDQYJKoZI
# hvcNAQEMBQADggIBAAAf7N35cqHg7FdgxYWa2CKVcBAZy06MJQHXD+4GIL85dwfc
# hrj9dt1SErMVtqJNsgTq9hkp3Wni7uco4uRrDKYAxXK47stKXqssq21kjIuFaNMr
# TNc7PS7jEur35tG0EQom8DqwPmcnAfUg7rPViLPK4hGhqUwKdutSLF9bFCfhMCY3
# u326T5fYVROERrd7DNHCG0b7HBoBssyTFGZHbgmd9d3VXEqj3T6btbO6i/3pS6DH
# nBl17CIgibVlZOPiUIke6nrv0tw5ru0DEkyKlVpKW1Af1+b1M4pzOV/G1a4FwtTh
# 25l+rCCwguwfs8yRxfXPBDNAPTIC0+GdjP0o0bXbltf6KKU57VLxEeq/ZtsGkylq
# jiRxS9Ajp0yApG8WabV4tuFI05CmUMxMYPW01V00aQj3qNS762uhSNYwyLjpNB8E
# AfG0NOlGEi7/zu8BVDxnpEeEXF6zPgR3klOFohBEDLoZw78mT5DMPOhnRqtEiQiw
# YnutmA5UCPH1y1/DyUf1F+NzAHfB0YFg0w1UmpClRqLZNp11/mlfNNkQciosQXnd
# KsGMh4iehCs/tTlWVeIxCzF7At0g2sATaXZNHcoGKRv5FBHKBtOnyOPbKILQ0JTA
# b4r6d2CU3lExteMVbpoprn1er5vxfMr8Mr4Am2A6keAm/xCuTrYD63A5Us6mMYID
# 1DCCA9ACAQEweDBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3Rh
# bXBpbmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzANBglghkgBZQMEAgEF
# AKCCAS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEi
# BCAgDST3iKgHE0AXQpptOQ4ArbrR2QegMHvWkbQWompqTTCB3QYLKoZIhvcNAQkQ
# Ai8xgc0wgcowgccwgaAEIC8xA1VdnRvTHGUbDxf/cgTJs5u5PprlbV3rUJb5wYPv
# MHwwZaRjMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVzdGFtcGlu
# ZyBDQSAyMDIwAhMzAAAAW0q1jUEybdx0AAAAAABbMCIEIBuobhiY89mNdAx1PEOR
# NqE7KekVCmwrtPuq3t6eA5lGMA0GCSqGSIb3DQEBCwUABIICAHQSProYZtcZdVg/
# a8wMR1kckshJrP682bwpTb9bED1CG1tjfRcOEQkVeywIVShC5izjUrL+wTEftipd
# zpjKqTMUcRC2XJX1U+hRnqLKhvy+YCq91t8d4eXm8rb1HRDnsswVH4R0UuUPvXGM
# 9t/MwjECEQuf4xcK8LLxPQIlyOAWo83MOWdC9rA8Sd0kuMQkNuxSjHovWU2Bx1I1
# SiVwatxxNoPn+XnpNdXUhmMzH3DCscrKfVUN/DSK/v98Td1SV/M4wHHsXrewpVNX
# vkY/g41ai2koy7wrrgxqWEsS5JksIHwCVLVe437xQRy9/GbsGDdeJEkssNdLr8DO
# DSZ9j9cSlyHne4/xV62lpLLoVdjlKaBZ7iCBUboXNetmOCX20LPCbdvLAvddZtPa
# huaUBkvavjAOcPWcL/lvhiyFjAIYyujiJKkPS+lV5UbCZLAEGyvpVqYkJbA0P3RT
# 5t4AEpeE9FgoURJlGsTNbhhfysA+/YnT6YDL0na9VKXAEi0Xvf31MeVz7rA68V2B
# 43HWs5wUjq/AfmdPBXC994wXHt2juG8rD5wPyqIsrG9PRwrn5jcXyhuDpEHwRT9V
# vBiHa2OciZ9VHxmXtdyNV1nuXnRwa5BNKKfPwO6Zu1YoD3d7Jy7L9Tw0ftH52anj
# 9PCMHNNKxo93fnOvoqwRV2hUAjdf
# SIG # End signature block
