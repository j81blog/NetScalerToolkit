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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCNt2nrRBqxgmg1
# mgWVc+M10ievD9WvoEkAWbVZoSftn6CCIAowggYUMIID/KADAgECAhB6I67aU2mW
# D5HIPlz0x+M/MA0GCSqGSIb3DQEBDAUAMFcxCzAJBgNVBAYTAkdCMRgwFgYDVQQK
# Ew9TZWN0aWdvIExpbWl0ZWQxLjAsBgNVBAMTJVNlY3RpZ28gUHVibGljIFRpbWUg
# U3RhbXBpbmcgUm9vdCBSNDYwHhcNMjEwMzIyMDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSwwKgYD
# VQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNjCCAaIwDQYJ
# KoZIhvcNAQEBBQADggGPADCCAYoCggGBAM2Y2ENBq26CK+z2M34mNOSJjNPvIhKA
# VD7vJq+MDoGD46IiM+b83+3ecLvBhStSVjeYXIjfa3ajoW3cS3ElcJzkyZlBnwDE
# JuHlzpbN4kMH2qRBVrjrGJgSlzzUqcGQBaCxpectRGhhnOSwcjPMI3G0hedv2eNm
# GiUbD12OeORN0ADzdpsQ4dDi6M4YhoGE9cbY11XxM2AVZn0GiOUC9+XE0wI7CQKf
# OUfigLDn7i/WeyxZ43XLj5GVo7LDBExSLnh+va8WxTlA+uBvq1KO8RSHUQLgzb1g
# bL9Ihgzxmkdp2ZWNuLc+XyEmJNbD2OIIq/fWlwBp6KNL19zpHsODLIsgZ+WZ1AzC
# s1HEK6VWrxmnKyJJg2Lv23DlEdZlQSGdF+z+Gyn9/CRezKe7WNyxRf4e4bwUtrYE
# 2F5Q+05yDD68clwnweckKtxRaF0VzN/w76kOLIaFVhf5sMM/caEZLtOYqYadtn03
# 4ykSFaZuIBU9uCSrKRKTPJhWvXk4CllgrwIDAQABo4IBXDCCAVgwHwYDVR0jBBgw
# FoAU9ndq3T/9ARP/FqFsggIv0Ao9FCUwHQYDVR0OBBYEFF9Y7UwxeqJhQo1SgLqz
# YZcZojKbMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGg
# P6A9hjtodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNUaW1lU3Rh
# bXBpbmdSb290UjQ2LmNybDB8BggrBgEFBQcBAQRwMG4wRwYIKwYBBQUHMAKGO2h0
# dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY1RpbWVTdGFtcGluZ1Jv
# b3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAN
# BgkqhkiG9w0BAQwFAAOCAgEAEtd7IK0ONVgMnoEdJVj9TC1ndK/HYiYh9lVUacah
# RoZ2W2hfiEOyQExnHk1jkvpIJzAMxmEc6ZvIyHI5UkPCbXKspioYMdbOnBWQUn73
# 3qMooBfIghpR/klUqNxx6/fDXqY0hSU1OSkkSivt51UlmJElUICZYBodzD3M/SFj
# eCP59anwxs6hwj1mfvzG+b1coYGnqsSz2wSKr+nDO+Db8qNcTbJZRAiSazr7KyUJ
# Go1c+MScGfG5QHV+bps8BX5Oyv9Ct36Y4Il6ajTqV2ifikkVtB3RNBUgwu/mSiSU
# ice/Jp/q8BMk/gN8+0rNIE+QqU63JoVMCMPY2752LmESsRVVoypJVt8/N3qQ1c6F
# ibbcRabo3azZkcIdWGVSAdoLgAIxEKBeNh9AQO1gQrnh1TA8ldXuJzPSuALOz1Uj
# b0PCyNVkWk7hkhVHfcvBfI8NtgWQupiaAeNHe0pWSGH2opXZYKYG4Lbukg7HpNi/
# KqJhue2Keak6qH9A8CeEOB7Eob0Zf+fU+CCQaL0cJqlmnx9HCDxF+3BLbUufrV64
# EbTI40zqegPZdA+sXCmbcZy6okx/SjwsusWRItFA3DE8MORZeFb6BmzBtqKJ7l93
# 9bbKBy2jvxcJI98Va95Q5JnlKor3m0E7xpMeYRriWklUPsetMSf2NvUQa/E5vVye
# fQIwggZFMIIELaADAgECAhAIMk+dt9qRb2Pk8qM8Xl1RMA0GCSqGSIb3DQEBCwUA
# MFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMu
# QS4xJDAiBgNVBAMTG0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQTAeFw0yNDA0
# MDQxNDA0MjRaFw0yNzA0MDQxNDA0MjNaMGsxCzAJBgNVBAYTAk5MMRIwEAYDVQQH
# DAlTY2hpam5kZWwxIzAhBgNVBAoMGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5
# MSMwIQYDVQQDDBpKb2huIEJpbGxla2VucyBDb25zdWx0YW5jeTCCAaIwDQYJKoZI
# hvcNAQEBBQADggGPADCCAYoCggGBAMslntDbSQwHZXwFhmibivbnd0Qfn6sqe/6f
# os3pKzKxEsR907RkDMet2x6RRg3eJkiIr3TFPwqBooyXXgK3zxxpyhGOcuIqyM9J
# 28DVf4kUyZHsjGO/8HFjrr3K1hABNUszP0o7H3o6J31eqV1UmCXYhQlNoW9FOmRC
# 1amlquBmh7w4EKYEytqdmdOBavAD5Xq4vLPxNP6kyA+B2YTtk/xM27TghtbwFGKn
# u9Vwnm7dFcpLxans4ONt2OxDQOMA5NwgcUv/YTpjhq9qoz6ivG55NRJGNvUXsM3w
# 2o7dR6Xh4MuEGrTSrOWGg2A5EcLH1XqQtkF5cZnAPM8W/9HUp8ggornWnFVQ9/6M
# ga+ermy5wy5XrmQpN+x3u6tit7xlHk1Hc+4XY4a4ie3BPXG2PhJhmZAn4ebNSBwN
# Hh8z7WTT9X9OFERepGSytZVeEP7hgyptSLcuhpwWeR4QdBb7dV++4p3PsAUQVHFp
# wkSbrRTv4EiJ0Lcz9P1HPGFoHiFAQQIDAQABo4IBeDCCAXQwDAYDVR0TAQH/BAIw
# ADA9BgNVHR8ENjA0MDKgMKAuhixodHRwOi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0u
# cGwvY2NzY2EyMDIxLmNybDBzBggrBgEFBQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0
# dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0dW0uY29tMDUGCCsGAQUFBzAChilodHRw
# Oi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAW
# gBTddF1MANt7n6B0yrFu9zzAMsBwzTAdBgNVHQ4EFgQUO6KtBpOBgmrlANVAnyiQ
# C6W6lJwwSwYDVR0gBEQwQjAIBgZngQwBBAEwNgYLKoRoAYb2dwIFAQQwJzAlBggr
# BgEFBQcCARYZaHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzATBgNVHSUEDDAKBggr
# BgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAEQsN8wg
# PMdWVkwHPPTN+jKpdns5AKVFjcn00psf2NGVVgWWNQBIQc9lEuTBWb54IK6Ga3hx
# QRZfnPNo5HGl73YLmFgdFQrFzZ1lnaMdIcyh8LTWv6+XNWfoyCM9wCp4zMIDPOs8
# LKSMQqA/wRgqiACWnOS4a6fyd5GUIAm4CuaptpFYr90l4Dn/wAdXOdY32UhgzmSu
# xpUbhD8gVJUaBNVmQaRqeU8y49MxiVrUKJXde1BCrtR9awXbqembc7Nqvmi60tYK
# lD27hlpKtj6eGPjkht0hHEsgzU0Fxw7ZJghYG2wXfpF2ziN893ak9Mi/1dmCNmor
# GOnybKYfT6ff6YTCDDNkod4egcMZdOSv+/Qv+HAeIgEvrxE9QsGlzTwbRtbm6gwY
# YcVBs/SsVUdBn/TSB35MMxRhHE5iC3aUTkDbceo/XP3uFhVL4g2JZHpFfCSu2TQr
# rzRn2sn07jfMvzeHArCOJgBW1gPqR3WrJ4hUxL06Rbg1gs9tU5HGGz9KNQMfQFQ7
# 0Wz7UIhezGcFcRfkIfSkMmQYYpsc7rfzj+z0ThfDVzzJr2dMOFsMlfj1T6l22GBq
# 9XQx0A4lcc5Fl9pRxbOuHHWFqIBD/BCEhwniOCySzqENd2N+oz8znKooSISStnkN
# aYXt6xblJF2dx9Dn89FK7d1IquNxOwt0tI5dMIIGYjCCBMqgAwIBAgIRAKQpO24e
# 3denNAiHrXpOtyQwDQYJKoZIhvcNAQEMBQAwVTELMAkGA1UEBhMCR0IxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEsMCoGA1UEAxMjU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBDQSBSMzYwHhcNMjUwMzI3MDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjByMQswCQYDVQQGEwJHQjEXMBUGA1UECBMOV2VzdCBZb3Jrc2hpcmUxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEwMC4GA1UEAxMnU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBTaWduZXIgUjM2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEA04SV9G6kU3jyPRBLeBIHPNyUgVNnYayfsGOyYEXrn3+SkDYTLs1crcw/
# ol2swE1TzB2aR/5JIjKNf75QBha2Ddj+4NEPKDxHEd4dEn7RTWMcTIfm492TW22I
# 8LfH+A7Ehz0/safc6BbsNBzjHTt7FngNfhfJoYOrkugSaT8F0IzUh6VUwoHdYDpi
# ln9dh0n0m545d5A5tJD92iFAIbKHQWGbCQNYplqpAFasHBn77OqW37P9BhOASdmj
# p3IijYiFdcA0WQIe60vzvrk0HG+iVcwVZjz+t5OcXGTcxqOAzk1frDNZ1aw8nFhG
# EvG0ktJQknnJZE3D40GofV7O8WzgaAnZmoUn4PCpvH36vD4XaAF2CjiPsJWiY/j2
# xLsJuqx3JtuI4akH0MmGzlBUylhXvdNVXcjAuIEcEQKtOBR9lU4wXQpISrbOT8ux
# +96GzBq8TdbhoFcmYaOBZKlwPP7pOp5Mzx/UMhyBA93PQhiCdPfIVOCINsUY4U23
# p4KJ3F1HqP3H6Slw3lHACnLilGETXRg5X/Fp8G8qlG5Y+M49ZEGUp2bneRLZoyHT
# yynHvFISpefhBCV0KdRZHPcuSL5OAGWnBjAlRtHvsMBrI3AAA0Tu1oGvPa/4yeei
# Ayu+9y3SLC98gDVbySnXnkujjhIh+oaatsk/oyf5R2vcxHahajMCAwEAAaOCAY4w
# ggGKMB8GA1UdIwQYMBaAFF9Y7UwxeqJhQo1SgLqzYZcZojKbMB0GA1UdDgQWBBSI
# YYyhKjdkgShgoZsx0Iz9LALOTzAOBgNVHQ8BAf8EBAMCBsAwDAYDVR0TAQH/BAIw
# ADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBKBgNVHSAEQzBBMDUGDCsGAQQBsjEB
# AgEDCDAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzAIBgZn
# gQwBBAIwSgYDVR0fBEMwQTA/oD2gO4Y5aHR0cDovL2NybC5zZWN0aWdvLmNvbS9T
# ZWN0aWdvUHVibGljVGltZVN0YW1waW5nQ0FSMzYuY3JsMHoGCCsGAQUFBwEBBG4w
# bDBFBggrBgEFBQcwAoY5aHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUHVi
# bGljVGltZVN0YW1waW5nQ0FSMzYuY3J0MCMGCCsGAQUFBzABhhdodHRwOi8vb2Nz
# cC5zZWN0aWdvLmNvbTANBgkqhkiG9w0BAQwFAAOCAYEAAoE+pIZyUSH5ZakuPVKK
# 4eWbzEsTRJOEjbIu6r7vmzXXLpJx4FyGmcqnFZoa1dzx3JrUCrdG5b//LfAxOGy9
# Ph9JtrYChJaVHrusDh9NgYwiGDOhyyJ2zRy3+kdqhwtUlLCdNjFjakTSE+hkC9F5
# ty1uxOoQ2ZkfI5WM4WXA3ZHcNHB4V42zi7Jk3ktEnkSdViVxM6rduXW0jmmiu71Z
# pBFZDh7Kdens+PQXPgMqvzodgQJEkxaION5XRCoBxAwWwiMm2thPDuZTzWp/gUFz
# i7izCmEt4pE3Kf0MOt3ccgwn4Kl2FIcQaV55nkjv1gODcHcD9+ZVjYZoyKTVWb4V
# qMQy/j8Q3aaYd/jOQ66Fhk3NWbg2tYl5jhQCuIsE55Vg4N0DUbEWvXJxtxQQaVR5
# xzhEI+BjJKzh3TQ026JxHhr2fuJ0mV68AluFr9qshgwS5SpN5FFtaSEnAwqZv3IS
# +mlG50rK7W3qXbWwi4hmpylUfygtYLEdLQukNEX1jiOKMIIGgjCCBGqgAwIBAgIQ
# NsKwvXwbOuejs902y8l1aDANBgkqhkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYD
# VQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBS
# U0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMjEwMzIyMDAwMDAwWhcNMzgw
# MTE4MjM1OTU5WjBXMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1p
# dGVkMS4wLAYDVQQDEyVTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIFJvb3Qg
# UjQ2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAiJ3YuUVnnR3d6Lkm
# gZpUVMB8SQWbzFoVD9mUEES0QUCBdxSZqdTkdizICFNeINCSJS+lV1ipnW5ihkQy
# C0cRLWXUJzodqpnMRs46npiJPHrfLBOifjfhpdXJ2aHHsPHggGsCi7uE0awqKggE
# /LkYw3sqaBia67h/3awoqNvGqiFRJ+OTWYmUCO2GAXsePHi+/JUNAax3kpqstbl3
# vcTdOGhtKShvZIvjwulRH87rbukNyHGWX5tNK/WABKf+Gnoi4cmisS7oSimgHUI0
# Wn/4elNd40BFdSZ1EwpuddZ+Wr7+Dfo0lcHflm/FDDrOJ3rWqauUP8hsokDoI7D/
# yUVI9DAE/WK3Jl3C4LKwIpn1mNzMyptRwsXKrop06m7NUNHdlTDEMovXAIDGAvYy
# nPt5lutv8lZeI5w3MOlCybAZDpK3Dy1MKo+6aEtE9vtiTMzz/o2dYfdP0KWZwZIX
# bYsTIlg1YIetCpi5s14qiXOpRsKqFKqav9R1R5vj3NgevsAsvxsAnI8Oa5s2oy25
# qhsoBIGo/zi6GpxFj+mOdh35Xn91y72J4RGOJEoqzEIbW3q0b2iPuWLA911cRxgY
# 5SJYubvjay3nSMbBPPFsyl6mY4/WYucmyS9lo3l7jk27MAe145GWxK4O3m3gEFEI
# kv7kRmefDR7Oe2T1HxAnICQvr9sCAwEAAaOCARYwggESMB8GA1UdIwQYMBaAFFN5
# v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBT2d2rdP/0BE/8WoWyCAi/QCj0U
# JTAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zATBgNVHSUEDDAKBggr
# BgEFBQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0
# cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25B
# dXRob3JpdHkuY3JsMDUGCCsGAQUFBwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDov
# L29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEADr5lQe1oRLjl
# ocXUEYfktzsljOt+2sgXke3Y8UPEooU5y39rAARaAdAxUeiX1ktLJ3+lgxtoLQhn
# 5cFb3GF2SSZRX8ptQ6IvuD3wz/LNHKpQ5nX8hjsDLRhsyeIiJsms9yAWnvdYOdEM
# q1W61KE9JlBkB20XBee6JaXx4UBErc+YuoSb1SxVf7nkNtUjPfcxuFtrQdRMRi/f
# InV/AobE8Gw/8yBMQKKaHt5eia8ybT8Y/Ffa6HAJyz9gvEOcF1VWXG8OMeM7Vy7B
# s6mSIkYeYtddU1ux1dQLbEGur18ut97wgGwDiGinCwKPyFO7ApcmVJOtlw9FVJxw
# /mL1TbyBns4zOgkaXFnnfzg4qbSvnrwyj1NiurMp4pmAWjR+Pb/SIduPnmFzbSN/
# G8reZCL4fvGlvPFk4Uab/JVCSmj59+/mB2Gn6G/UYOy8k60mKcmaAZsEVkhOFuoj
# 4we8CYyaR9vd9PGZKSinaZIkvVjbH/3nlLb0a7SBIkiRzfPfS9T+JesylbHa1LtR
# V9U/7m0q7Ma2CQ/t392ioOssXW7oKLdOmMBl14suVFBmbzrt5V5cQPnwtd3UOTpS
# 9oCG+ZZheiIvPgkDmA8FzPsnfXW5qHELB43ET7HHFHeRPRYrMBKjkb8/IN7Po0d0
# hQoF4TeMM+zYAJzoKQnVKOLg8pZVPT8wgga5MIIEoaADAgECAhEAmaOACiZVO2Wr
# 3G6EprPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAgBgNVBAoT
# GVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1bSBDZXJ0
# aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0ZWQgTmV0
# d29yayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIxOFowVjELMAkG
# A1UEBhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIG
# A1UEAxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5cTbq96y34vuTm
# flN4mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7VS5+djSoMcbv
# IKck6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1PH9ud0IF+njvM
# k2xqbNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOouu9Tj1yHIohzu
# C8KNqfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv8aGUsRdaCtVD
# 2bSlbfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtMLK+Wo837Q4QO
# ZgYqVWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9lDV2nT8mFSkc
# SkAExzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/JHuurfTI5XDY
# O962WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkKbWpQ5boufUnq
# 1UiYPIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADaCi2JSplKShBS
# ND36E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAWd18Jx5n858JS
# qPECAwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFN10XUwA
# 23ufoHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4HKbROg79
# MA4GA1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAwBgNVHR8EKTAn
# MCWgI6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwGCCsGAQUF
# BwEBBGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2VydHVtLmNv
# bTAyBggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBsL2N0bmNh
# Mi5jZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0dHA6Ly93
# d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhYD+WPUCiaU58Q
# 7EP89DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUStJl490L94C9L
# GF3vjzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChDUyuQy6rGDxLU
# UAsO0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiRsWrhWM2f8pXd
# d3x2mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7bWRLDm0CdY9rN
# LqyA3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mATwZWwSD+B7eMc
# ZNhpn8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3/bFAEloMU+vU
# BfSouCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESYkOh1/w1tVxTp
# V2Na3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR+x+zPF/2DaGg
# K2W1eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C+xN4YaNjt2yw
# zOr+tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qwt4HOUBCrW602
# NCmvO1nm+/80nLy5r0AZvCQxaQ4xggXDMIIFvwIBATBqMFYxCzAJBgNVBAYTAlBM
# MSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0Nl
# cnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQQIQCDJPnbfakW9j5PKjPF5dUTANBglg
# hkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3
# DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
# MC8GCSqGSIb3DQEJBDEiBCAwdV8+2Za0Nzhhuptxp3fZ0Xd7Qpp4NvtFD3WrdQML
# SDANBgkqhkiG9w0BAQEFAASCAYCs0JGKkCYcXsAGxXdkk0VvngdQIiTlLtoDyKFp
# v2z26xWUQv9EX0LqOSrd39BjTUz/XWm1x8Rc8gLWML9cpzPqV9cE/4HjqN1UJHe5
# 0C+vXsq/8GKpAHUmuly/RWO+/+PC1E4ftYONw8lA4oSLNMH+qiDyhoz7VOwhVWTI
# jSZ4t3tOcwRHQZPI0x49yRKP75kv9Ma8fJgWw+AVBfDutYkBMdnN+nH4bCfScCyB
# +cyzjfzpaRybQaBDVrJ//ykwmqxEvmSXUgZ6t/ZN+UTDkXYSoxjr0qRApie+CVgH
# 3WIZwy69XxR9JkdE29j6qfjP+JCPEZsT0tLik6o42lQR0oXZNWNLU621OGFWYbV5
# r274GGc69Noq4aJnLeVzwP4sRkfNhoDdZAdL8OyefxYsm3ol3Xz0rZPBKbYhdmbw
# 9Es9JnKoDSeGf9X+m5SrpuY6VV7T4yIU2fYl903dVLnBQa3sVVTsL1ovOo5BNIUq
# z/5qwQV0Iap+hCAiw3ub7ahNBVOhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU0NDFaMD8GCSqGSIb3
# DQEJBDEyBDCgqbNym7ASxBYTkDxDAq2R2v1NWwhZeJUym3RGrAQzswXtSbSd+Pc6
# 8Pqh7yLs1VAwDQYJKoZIhvcNAQEBBQAEggIAXR0ny6/7LqpEvaj3vyV7WqI4Qsj/
# cae8J5NDwTPL9npsrCX6WhB85fRYBUw8P3hc37ZuZeNUoQbYPm5afc5DkLvZzVF1
# E9NEmJTbD3zmKagQ6vihWG1JbVR9GAMBGZLDQa1qye+7kjrMgh9qSCTsQMf1NoXX
# bmb9gqtQv9ns9YNtisHsXzyc0x6CwF7HBLTBAUJdXA6GLj51kzMuP8axQXaWyxrI
# mtL+fysJwkh9pie/oE/QQW4WhuY7FoT8XcbjLioYo1ddawRgEcS4Riug3TIfEP+y
# T1FPryAVz4jk30VG/BE07xXdQKguwwJddhxzOsuVNMWFQnNPLRoYDMmWaHYh6hbd
# kVPFgGWURJ52aqoZTPHbSwf0msyTp77Y1/q+4EgU9lhnIeW1+YU2sg+yiwtcQJr5
# +CacBRb5OdQ+n/D4AgU11EqjxuvWfbHaRi6/GagMOLUtaPA9QnLxLHqwn+rOslbu
# 6y18CJ4TsUPelhIVLbeeKZJifffPn2uklPfg2FKAukg7MK3w5wmZ2+cBtIQ/aetc
# 6toOu7K8ED6Uq4DgKxIBcgDSDvyX9PDVZE1MyZ6lUAP7zATFrKJErup0MIScN4f2
# B0CgZol7MMJ4PyzxLYZNFgYmgW883aw+3sMhco6in2H4/6Xq2KFS8G+urBo6M2d2
# qhYColyvCEveb6s=
# SIG # End signature block
