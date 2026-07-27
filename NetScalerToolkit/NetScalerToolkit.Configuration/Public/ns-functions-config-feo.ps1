# Generated NetScalerToolkit Configuration bundle for category 'feo'.

# region Invoke-NSAddFEOAction
function Invoke-NSAddFEOAction {
    <#
    .SYNOPSIS
        Creates a NetScaler feoaction resource.
    .DESCRIPTION
        Configuration for Front end optimization action resource.
    .PARAMETER CacheMaxAge
        Maxage for cache extension. Default value: 30 Minimum value = 0 Maximum value = 360
    .PARAMETER ClientsIdemeasurements
        Send AppFlow records about the web pages optimized by this action. The records provide FEO statistics, such as the number of HTTP requests that have been reduced for this page. You must enable the Appflow feature before enabling this parameter.
    .PARAMETER ConvertimPortTolink
        Convert CSS import statements to HTML link tags.
    .PARAMETER Csscombine
        Combine one or more CSS files into one file.
    .PARAMETER Cssimginline
        Inline small images (less than 2KB) referred within CSS files as background-URLs.
    .PARAMETER Cssinline
        Inline CSS files, whose size is less than 2KB, within the main page.
    .PARAMETER CssMinIfy
        Remove comments and whitespaces from CSSs.
    .PARAMETER Cssmovetohead
        Move any CSS file present within the body tag of an HTML page to the head tag.
    .PARAMETER DNSShards
        Set of domain names that replaces the parent domain.
    .PARAMETER Domainsharding
        Domain name of the server.
    .PARAMETER HTMLMinIfy
        Remove comments and whitespaces from an HTML page.
    .PARAMETER Imggiftopng
        Convert GIF image formats to PNG formats.
    .PARAMETER Imginline
        Inline images whose size is less than 2KB.
    .PARAMETER Imglazyload
        Download images, only when the user scrolls the page to view them.
    .PARAMETER Imgshrinktoattrib
        Shrink image dimensions as per the height and width attributes specified in the <img> tag.
    .PARAMETER Imgtojpegxr
        Convert JPEG, GIF, PNG image formats to JXR format.
    .PARAMETER ImgtoWebP
        Convert JPEG, GIF, PNG image formats to WEBP format.
    .PARAMETER Jpgoptimize
        Remove non-image data such as comments from JPEG images.
    .PARAMETER Jsinline
        Convert linked JavaScript files (less than 2KB) to inline JavaScript files.
    .PARAMETER JsMinIfy
        Remove comments and whitespaces from JavaScript.
    .PARAMETER Jsmovetoend
        Move any JavaScript present in the body tag to the end of the body tag.
    .PARAMETER Name
        The name of the front end optimization action. Minimum length = 1
    .PARAMETER PageExtendcache
        Extend the time period during which the browser can use the cached resource.
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
        Invoke-NSAddFEOAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddFEOAction -Name 'example' -WhatIf
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
        [int] $CacheMaxAge,

        [Parameter()]
        [bool] $ClientsIdemeasurements,

        [Parameter()]
        [bool] $ConvertimPortTolink,

        [Parameter()]
        [bool] $Csscombine,

        [Parameter()]
        [bool] $Cssimginline,

        [Parameter()]
        [bool] $Cssinline,

        [Parameter()]
        [bool] $CssMinIfy,

        [Parameter()]
        [bool] $Cssmovetohead,

        [Parameter()]
        [string[]] $DNSShards,

        [Parameter()]
        [string] $Domainsharding,

        [Parameter()]
        [bool] $HTMLMinIfy,

        [Parameter()]
        [bool] $Imggiftopng,

        [Parameter()]
        [bool] $Imginline,

        [Parameter()]
        [bool] $Imglazyload,

        [Parameter()]
        [bool] $Imgshrinktoattrib,

        [Parameter()]
        [bool] $Imgtojpegxr,

        [Parameter()]
        [bool] $ImgtoWebP,

        [Parameter()]
        [bool] $Jpgoptimize,

        [Parameter()]
        [bool] $Jsinline,

        [Parameter()]
        [bool] $JsMinIfy,

        [Parameter()]
        [bool] $Jsmovetoend,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [bool] $PageExtendcache,

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
    if ($PSBoundParameters.ContainsKey('CacheMaxAge')) { $properties['cachemaxage'] = $CacheMaxAge }
    if ($PSBoundParameters.ContainsKey('ClientsIdemeasurements')) { $properties['clientsidemeasurements'] = $ClientsIdemeasurements }
    if ($PSBoundParameters.ContainsKey('ConvertimPortTolink')) { $properties['convertimporttolink'] = $ConvertimPortTolink }
    if ($PSBoundParameters.ContainsKey('Csscombine')) { $properties['csscombine'] = $Csscombine }
    if ($PSBoundParameters.ContainsKey('Cssimginline')) { $properties['cssimginline'] = $Cssimginline }
    if ($PSBoundParameters.ContainsKey('Cssinline')) { $properties['cssinline'] = $Cssinline }
    if ($PSBoundParameters.ContainsKey('CssMinIfy')) { $properties['cssminify'] = $CssMinIfy }
    if ($PSBoundParameters.ContainsKey('Cssmovetohead')) { $properties['cssmovetohead'] = $Cssmovetohead }
    if ($PSBoundParameters.ContainsKey('DNSShards')) { $properties['dnsshards'] = $DNSShards }
    if ($PSBoundParameters.ContainsKey('Domainsharding')) { $properties['domainsharding'] = $Domainsharding }
    if ($PSBoundParameters.ContainsKey('HTMLMinIfy')) { $properties['htmlminify'] = $HTMLMinIfy }
    if ($PSBoundParameters.ContainsKey('Imggiftopng')) { $properties['imggiftopng'] = $Imggiftopng }
    if ($PSBoundParameters.ContainsKey('Imginline')) { $properties['imginline'] = $Imginline }
    if ($PSBoundParameters.ContainsKey('Imglazyload')) { $properties['imglazyload'] = $Imglazyload }
    if ($PSBoundParameters.ContainsKey('Imgshrinktoattrib')) { $properties['imgshrinktoattrib'] = $Imgshrinktoattrib }
    if ($PSBoundParameters.ContainsKey('Imgtojpegxr')) { $properties['imgtojpegxr'] = $Imgtojpegxr }
    if ($PSBoundParameters.ContainsKey('ImgtoWebP')) { $properties['imgtowebp'] = $ImgtoWebP }
    if ($PSBoundParameters.ContainsKey('Jpgoptimize')) { $properties['jpgoptimize'] = $Jpgoptimize }
    if ($PSBoundParameters.ContainsKey('Jsinline')) { $properties['jsinline'] = $Jsinline }
    if ($PSBoundParameters.ContainsKey('JsMinIfy')) { $properties['jsminify'] = $JsMinIfy }
    if ($PSBoundParameters.ContainsKey('Jsmovetoend')) { $properties['jsmovetoend'] = $Jsmovetoend }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PageExtendcache')) { $properties['pageextendcache'] = $PageExtendcache }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create feoaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type feoaction -Payload @{ feoaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetFEOAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddFEOAction

# region Invoke-NSAddFeoglobalFEOPolicyBinding
function Invoke-NSAddFeoglobalFEOPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler feoglobal_feopolicy_binding resource.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to feoglobal.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER PolicyName
        The name of the globally bound front end optimization policy.
    .PARAMETER Priority
        The priority assigned to the policy binding.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
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
        Invoke-NSAddFeoglobalFEOPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddFeoglobalFEOPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
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

    if ($PSBoundParameters.ContainsKey('Type')) {
        Assert-NSParameterValue -ParameterName 'Type' -Value $Type -AllowedValuesByVersion @{ '13.1' = @('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT', 'NONE'); '14.1' = @('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('feoglobal_feopolicy_binding', 'Create feoglobal_feopolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type feoglobal_feopolicy_binding -Payload @{ feoglobal_feopolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddFeoglobalFEOPolicyBinding

# region Invoke-NSAddFEOPolicy
function Invoke-NSAddFEOPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler feopolicy resource.
    .DESCRIPTION
        Configuration for Front end optimization policy resource.
    .PARAMETER Action
        The front end optimization action that has to be performed when the rule matches. Minimum length = 1
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
    .PARAMETER Rule
        The rule associated with the front end optimization policy.
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
        Invoke-NSAddFEOPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddFEOPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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
        [string] $Action,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Rule,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create feopolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type feopolicy -Payload @{ feopolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetFEOPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddFEOPolicy

# region Invoke-NSDeleteFEOAction
function Invoke-NSDeleteFEOAction {
    <#
    .SYNOPSIS
        Removes a NetScaler feoaction resource.
    .DESCRIPTION
        Configuration for Front end optimization action resource.
    .PARAMETER Name
        The name of the front end optimization action. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteFEOAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetFEOAction -Name 'feoaction_example' | Invoke-NSDeleteFEOAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete feoaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type feoaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteFEOAction

# region Invoke-NSDeleteFeoglobalFEOPolicyBinding
function Invoke-NSDeleteFeoglobalFEOPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler feoglobal_feopolicy_binding resource.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to feoglobal.
    .PARAMETER PolicyName
        The name of the globally bound front end optimization policy.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
    .PARAMETER Priority
        The priority assigned to the policy binding.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteFeoglobalFEOPolicyBinding -PolicyName 'example' -Priority 1 -Type 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetFeoglobalFEOPolicyBinding  | Invoke-NSDeleteFeoglobalFEOPolicyBinding -Confirm:$false
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
        [string] $PolicyName,

        [Parameter()]
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

        if ($PSBoundParameters.ContainsKey('Type')) {
            Assert-NSParameterValue -ParameterName 'Type' -Value $Type -AllowedValuesByVersion @{ '13.1' = @('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT', 'NONE'); '14.1' = @('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT') } -MetadataVersion $metadataVersion
        }

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('PolicyName')) {
            $argumentParts += 'policyname:' + $PolicyName
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

        if ($PSCmdlet.ShouldProcess('feoglobal_feopolicy_binding', 'Delete feoglobal_feopolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type feoglobal_feopolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteFeoglobalFEOPolicyBinding

# region Invoke-NSDeleteFEOPolicy
function Invoke-NSDeleteFEOPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler feopolicy resource.
    .DESCRIPTION
        Configuration for Front end optimization policy resource.
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteFEOPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetFEOPolicy -Name 'feopolicy_example' | Invoke-NSDeleteFEOPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete feopolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type feopolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteFEOPolicy

# region Invoke-NSGetFEOAction
function Invoke-NSGetFEOAction {
    <#
    .SYNOPSIS
        Gets NetScaler feoaction configuration.
    .DESCRIPTION
        Configuration for Front end optimization action resource.
    .PARAMETER Name
        The name of the front end optimization action. Minimum length = 1
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
        Invoke-NSGetFEOAction
    .EXAMPLE
        Invoke-NSGetFEOAction -Name 'feoaction_example'
    .EXAMPLE
        Invoke-NSGetFEOAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feoaction'
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
# endregion Invoke-NSGetFEOAction

# region Invoke-NSGetFeoglobalBinding
function Invoke-NSGetFeoglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler feoglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to feoglobal.
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
        Invoke-NSGetFeoglobalBinding
    .EXAMPLE
        Invoke-NSGetFeoglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feoglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetFeoglobalBinding

# region Invoke-NSGetFeoglobalFEOPolicyBinding
function Invoke-NSGetFeoglobalFEOPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler feoglobal_feopolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to feoglobal.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
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
        Invoke-NSGetFeoglobalFEOPolicyBinding
    .EXAMPLE
        Invoke-NSGetFeoglobalFEOPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feoglobal_feopolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetFeoglobalFEOPolicyBinding

# region Invoke-NSGetFeoparameter
function Invoke-NSGetFeoparameter {
    <#
    .SYNOPSIS
        Gets NetScaler feoparameter configuration.
    .DESCRIPTION
        Configuration for FEO parameter resource.
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
        Invoke-NSGetFeoparameter
    .EXAMPLE
        Invoke-NSGetFeoparameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feoparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetFeoparameter

# region Invoke-NSGetFEOPolicy
function Invoke-NSGetFEOPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler feopolicy configuration.
    .DESCRIPTION
        Configuration for Front end optimization policy resource.
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
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
        Invoke-NSGetFEOPolicy
    .EXAMPLE
        Invoke-NSGetFEOPolicy -Name 'feopolicy_example'
    .EXAMPLE
        Invoke-NSGetFEOPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feopolicy'
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
# endregion Invoke-NSGetFEOPolicy

# region Invoke-NSGetFEOPolicyBinding
function Invoke-NSGetFEOPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler feopolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to feopolicy.
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
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
        Invoke-NSGetFEOPolicyBinding
    .EXAMPLE
        Invoke-NSGetFEOPolicyBinding -Name 'feopolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetFEOPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feopolicy_binding'
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
# endregion Invoke-NSGetFEOPolicyBinding

# region Invoke-NSGetFEOPolicyCSVServerBinding
function Invoke-NSGetFEOPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler feopolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to feopolicy.
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
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
        Invoke-NSGetFEOPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetFEOPolicyCSVServerBinding -Name 'feopolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetFEOPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feopolicy_csvserver_binding'
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
# endregion Invoke-NSGetFEOPolicyCSVServerBinding

# region Invoke-NSGetFEOPolicyFeoglobalBinding
function Invoke-NSGetFEOPolicyFeoglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler feopolicy_feoglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the feoglobal that can be bound to feopolicy.
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
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
        Invoke-NSGetFEOPolicyFeoglobalBinding
    .EXAMPLE
        Invoke-NSGetFEOPolicyFeoglobalBinding -Name 'feopolicy_feoglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetFEOPolicyFeoglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feopolicy_feoglobal_binding'
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
# endregion Invoke-NSGetFEOPolicyFeoglobalBinding

# region Invoke-NSGetFEOPolicyLBVServerBinding
function Invoke-NSGetFEOPolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler feopolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to feopolicy.
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
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
        Invoke-NSGetFEOPolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetFEOPolicyLBVServerBinding -Name 'feopolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetFEOPolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'feopolicy_lbvserver_binding'
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
# endregion Invoke-NSGetFEOPolicyLBVServerBinding

# region Invoke-NSUnsetFEOAction
function Invoke-NSUnsetFEOAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler feoaction resource properties.
    .DESCRIPTION
        Configuration for Front end optimization action resource.
    .PARAMETER Name
        The name of the front end optimization action. Minimum length = 1
    .PARAMETER ClientsIdemeasurements
        Send AppFlow records about the web pages optimized by this action. The records provide FEO statistics, such as the number of HTTP requests that have been reduced for this page. You must enable the Appflow feature before enabling this parameter.
    .PARAMETER ConvertimPortTolink
        Convert CSS import statements to HTML link tags.
    .PARAMETER Csscombine
        Combine one or more CSS files into one file.
    .PARAMETER Cssimginline
        Inline small images (less than 2KB) referred within CSS files as background-URLs.
    .PARAMETER Cssinline
        Inline CSS files, whose size is less than 2KB, within the main page.
    .PARAMETER CssMinIfy
        Remove comments and whitespaces from CSSs.
    .PARAMETER Cssmovetohead
        Move any CSS file present within the body tag of an HTML page to the head tag.
    .PARAMETER Domainsharding
        Domain name of the server.
    .PARAMETER HTMLMinIfy
        Remove comments and whitespaces from an HTML page.
    .PARAMETER Imggiftopng
        Convert GIF image formats to PNG formats.
    .PARAMETER Imginline
        Inline images whose size is less than 2KB.
    .PARAMETER Imglazyload
        Download images, only when the user scrolls the page to view them.
    .PARAMETER Imgshrinktoattrib
        Shrink image dimensions as per the height and width attributes specified in the <img> tag.
    .PARAMETER Imgtojpegxr
        Convert JPEG, GIF, PNG image formats to JXR format.
    .PARAMETER ImgtoWebP
        Convert JPEG, GIF, PNG image formats to WEBP format.
    .PARAMETER Jpgoptimize
        Remove non-image data such as comments from JPEG images.
    .PARAMETER Jsinline
        Convert linked JavaScript files (less than 2KB) to inline JavaScript files.
    .PARAMETER JsMinIfy
        Remove comments and whitespaces from JavaScript.
    .PARAMETER Jsmovetoend
        Move any JavaScript present in the body tag to the end of the body tag.
    .PARAMETER PageExtendcache
        Extend the time period during which the browser can use the cached resource.
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
        Invoke-NSUnsetFEOAction -Name 'example' -ClientsIdemeasurements  -PassThru
    .EXAMPLE
        Invoke-NSUnsetFEOAction -Name 'example' -ClientsIdemeasurements  -WhatIf
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
        [switch] $ClientsIdemeasurements,

        [Parameter()]
        [switch] $ConvertimPortTolink,

        [Parameter()]
        [switch] $Csscombine,

        [Parameter()]
        [switch] $Cssimginline,

        [Parameter()]
        [switch] $Cssinline,

        [Parameter()]
        [switch] $CssMinIfy,

        [Parameter()]
        [switch] $Cssmovetohead,

        [Parameter()]
        [switch] $Domainsharding,

        [Parameter()]
        [switch] $HTMLMinIfy,

        [Parameter()]
        [switch] $Imggiftopng,

        [Parameter()]
        [switch] $Imginline,

        [Parameter()]
        [switch] $Imglazyload,

        [Parameter()]
        [switch] $Imgshrinktoattrib,

        [Parameter()]
        [switch] $Imgtojpegxr,

        [Parameter()]
        [switch] $ImgtoWebP,

        [Parameter()]
        [switch] $Jpgoptimize,

        [Parameter()]
        [switch] $Jsinline,

        [Parameter()]
        [switch] $JsMinIfy,

        [Parameter()]
        [switch] $Jsmovetoend,

        [Parameter()]
        [switch] $PageExtendcache,

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
        if ($PSBoundParameters.ContainsKey('ClientsIdemeasurements')) { $body['clientsidemeasurements'] = $true }
        if ($PSBoundParameters.ContainsKey('ConvertimPortTolink')) { $body['convertimporttolink'] = $true }
        if ($PSBoundParameters.ContainsKey('Csscombine')) { $body['csscombine'] = $true }
        if ($PSBoundParameters.ContainsKey('Cssimginline')) { $body['cssimginline'] = $true }
        if ($PSBoundParameters.ContainsKey('Cssinline')) { $body['cssinline'] = $true }
        if ($PSBoundParameters.ContainsKey('CssMinIfy')) { $body['cssminify'] = $true }
        if ($PSBoundParameters.ContainsKey('Cssmovetohead')) { $body['cssmovetohead'] = $true }
        if ($PSBoundParameters.ContainsKey('Domainsharding')) { $body['domainsharding'] = $true }
        if ($PSBoundParameters.ContainsKey('HTMLMinIfy')) { $body['htmlminify'] = $true }
        if ($PSBoundParameters.ContainsKey('Imggiftopng')) { $body['imggiftopng'] = $true }
        if ($PSBoundParameters.ContainsKey('Imginline')) { $body['imginline'] = $true }
        if ($PSBoundParameters.ContainsKey('Imglazyload')) { $body['imglazyload'] = $true }
        if ($PSBoundParameters.ContainsKey('Imgshrinktoattrib')) { $body['imgshrinktoattrib'] = $true }
        if ($PSBoundParameters.ContainsKey('Imgtojpegxr')) { $body['imgtojpegxr'] = $true }
        if ($PSBoundParameters.ContainsKey('ImgtoWebP')) { $body['imgtowebp'] = $true }
        if ($PSBoundParameters.ContainsKey('Jpgoptimize')) { $body['jpgoptimize'] = $true }
        if ($PSBoundParameters.ContainsKey('Jsinline')) { $body['jsinline'] = $true }
        if ($PSBoundParameters.ContainsKey('JsMinIfy')) { $body['jsminify'] = $true }
        if ($PSBoundParameters.ContainsKey('Jsmovetoend')) { $body['jsmovetoend'] = $true }
        if ($PSBoundParameters.ContainsKey('PageExtendcache')) { $body['pageextendcache'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear feoaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type feoaction -Action unset -Payload @{ feoaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetFEOAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetFEOAction

# region Invoke-NSUnsetFeoparameter
function Invoke-NSUnsetFeoparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler feoparameter resource properties.
    .DESCRIPTION
        Configuration for FEO parameter resource.
    .PARAMETER Cssinlinethressize
        Threshold value of the file size (in bytes) for converting external CSS files to inline CSS files. Default value: 1024 Minimum value = 1 Maximum value = 2048
    .PARAMETER Imginlinethressize
        Maximum file size of an image (in bytes), for coverting linked images to inline images. Default value: 1024 Minimum value = 1 Maximum value = 2048
    .PARAMETER JpegqualiTypeRcent
        The percentage value of a JPEG image quality to be reduced. Range: 0 - 100. Default value: 75 Minimum value = 0 Maximum value = 100
    .PARAMETER Jsinlinethressize
        Threshold value of the file size (in bytes), for converting external JavaScript files to inline JavaScript files. Default value: 1024 Minimum value = 1 Maximum value = 2048
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
        Invoke-NSUnsetFeoparameter -Cssinlinethressize  -PassThru
    .EXAMPLE
        Invoke-NSUnsetFeoparameter -Cssinlinethressize  -WhatIf
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
        [switch] $Cssinlinethressize,

        [Parameter()]
        [switch] $Imginlinethressize,

        [Parameter()]
        [switch] $JpegqualiTypeRcent,

        [Parameter()]
        [switch] $Jsinlinethressize,

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
        if ($PSBoundParameters.ContainsKey('Cssinlinethressize')) { $body['cssinlinethressize'] = $true }
        if ($PSBoundParameters.ContainsKey('Imginlinethressize')) { $body['imginlinethressize'] = $true }
        if ($PSBoundParameters.ContainsKey('JpegqualiTypeRcent')) { $body['jpegqualitypercent'] = $true }
        if ($PSBoundParameters.ContainsKey('Jsinlinethressize')) { $body['jsinlinethressize'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('feoparameter', 'Clear feoparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type feoparameter -Action unset -Payload @{ feoparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetFeoparameter

# region Invoke-NSUnsetFEOPolicy
function Invoke-NSUnsetFEOPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler feopolicy resource properties.
    .DESCRIPTION
        Configuration for Front end optimization policy resource.
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
    .PARAMETER Action
        The front end optimization action that has to be performed when the rule matches. Minimum length = 1
    .PARAMETER Rule
        The rule associated with the front end optimization policy.
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
        Invoke-NSUnsetFEOPolicy -Name 'example' -Action  -PassThru
    .EXAMPLE
        Invoke-NSUnsetFEOPolicy -Name 'example' -Action  -WhatIf
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
        [switch] $Action,

        [Parameter()]
        [switch] $Rule,

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
        if ($PSBoundParameters.ContainsKey('Action')) { $body['action'] = $true }
        if ($PSBoundParameters.ContainsKey('Rule')) { $body['rule'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear feopolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type feopolicy -Action unset -Payload @{ feopolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetFEOPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetFEOPolicy

# region Invoke-NSUpdateFEOAction
function Invoke-NSUpdateFEOAction {
    <#
    .SYNOPSIS
        Updates a NetScaler feoaction resource.
    .DESCRIPTION
        Configuration for Front end optimization action resource.
    .PARAMETER CacheMaxAge
        Maxage for cache extension. Default value: 30 Minimum value = 0 Maximum value = 360
    .PARAMETER ClientsIdemeasurements
        Send AppFlow records about the web pages optimized by this action. The records provide FEO statistics, such as the number of HTTP requests that have been reduced for this page. You must enable the Appflow feature before enabling this parameter.
    .PARAMETER ConvertimPortTolink
        Convert CSS import statements to HTML link tags.
    .PARAMETER Csscombine
        Combine one or more CSS files into one file.
    .PARAMETER Cssimginline
        Inline small images (less than 2KB) referred within CSS files as background-URLs.
    .PARAMETER Cssinline
        Inline CSS files, whose size is less than 2KB, within the main page.
    .PARAMETER CssMinIfy
        Remove comments and whitespaces from CSSs.
    .PARAMETER Cssmovetohead
        Move any CSS file present within the body tag of an HTML page to the head tag.
    .PARAMETER DNSShards
        Set of domain names that replaces the parent domain.
    .PARAMETER Domainsharding
        Domain name of the server.
    .PARAMETER HTMLMinIfy
        Remove comments and whitespaces from an HTML page.
    .PARAMETER Imggiftopng
        Convert GIF image formats to PNG formats.
    .PARAMETER Imginline
        Inline images whose size is less than 2KB.
    .PARAMETER Imglazyload
        Download images, only when the user scrolls the page to view them.
    .PARAMETER Imgshrinktoattrib
        Shrink image dimensions as per the height and width attributes specified in the <img> tag.
    .PARAMETER Imgtojpegxr
        Convert JPEG, GIF, PNG image formats to JXR format.
    .PARAMETER ImgtoWebP
        Convert JPEG, GIF, PNG image formats to WEBP format.
    .PARAMETER Jpgoptimize
        Remove non-image data such as comments from JPEG images.
    .PARAMETER Jsinline
        Convert linked JavaScript files (less than 2KB) to inline JavaScript files.
    .PARAMETER JsMinIfy
        Remove comments and whitespaces from JavaScript.
    .PARAMETER Jsmovetoend
        Move any JavaScript present in the body tag to the end of the body tag.
    .PARAMETER Name
        The name of the front end optimization action. Minimum length = 1
    .PARAMETER PageExtendcache
        Extend the time period during which the browser can use the cached resource.
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
        Invoke-NSUpdateFEOAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateFEOAction -Name 'example' -WhatIf
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
        [int] $CacheMaxAge,

        [Parameter()]
        [bool] $ClientsIdemeasurements,

        [Parameter()]
        [bool] $ConvertimPortTolink,

        [Parameter()]
        [bool] $Csscombine,

        [Parameter()]
        [bool] $Cssimginline,

        [Parameter()]
        [bool] $Cssinline,

        [Parameter()]
        [bool] $CssMinIfy,

        [Parameter()]
        [bool] $Cssmovetohead,

        [Parameter()]
        [string[]] $DNSShards,

        [Parameter()]
        [string] $Domainsharding,

        [Parameter()]
        [bool] $HTMLMinIfy,

        [Parameter()]
        [bool] $Imggiftopng,

        [Parameter()]
        [bool] $Imginline,

        [Parameter()]
        [bool] $Imglazyload,

        [Parameter()]
        [bool] $Imgshrinktoattrib,

        [Parameter()]
        [bool] $Imgtojpegxr,

        [Parameter()]
        [bool] $ImgtoWebP,

        [Parameter()]
        [bool] $Jpgoptimize,

        [Parameter()]
        [bool] $Jsinline,

        [Parameter()]
        [bool] $JsMinIfy,

        [Parameter()]
        [bool] $Jsmovetoend,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [bool] $PageExtendcache,

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
    if ($PSBoundParameters.ContainsKey('CacheMaxAge')) { $properties['cachemaxage'] = $CacheMaxAge }
    if ($PSBoundParameters.ContainsKey('ClientsIdemeasurements')) { $properties['clientsidemeasurements'] = $ClientsIdemeasurements }
    if ($PSBoundParameters.ContainsKey('ConvertimPortTolink')) { $properties['convertimporttolink'] = $ConvertimPortTolink }
    if ($PSBoundParameters.ContainsKey('Csscombine')) { $properties['csscombine'] = $Csscombine }
    if ($PSBoundParameters.ContainsKey('Cssimginline')) { $properties['cssimginline'] = $Cssimginline }
    if ($PSBoundParameters.ContainsKey('Cssinline')) { $properties['cssinline'] = $Cssinline }
    if ($PSBoundParameters.ContainsKey('CssMinIfy')) { $properties['cssminify'] = $CssMinIfy }
    if ($PSBoundParameters.ContainsKey('Cssmovetohead')) { $properties['cssmovetohead'] = $Cssmovetohead }
    if ($PSBoundParameters.ContainsKey('DNSShards')) { $properties['dnsshards'] = $DNSShards }
    if ($PSBoundParameters.ContainsKey('Domainsharding')) { $properties['domainsharding'] = $Domainsharding }
    if ($PSBoundParameters.ContainsKey('HTMLMinIfy')) { $properties['htmlminify'] = $HTMLMinIfy }
    if ($PSBoundParameters.ContainsKey('Imggiftopng')) { $properties['imggiftopng'] = $Imggiftopng }
    if ($PSBoundParameters.ContainsKey('Imginline')) { $properties['imginline'] = $Imginline }
    if ($PSBoundParameters.ContainsKey('Imglazyload')) { $properties['imglazyload'] = $Imglazyload }
    if ($PSBoundParameters.ContainsKey('Imgshrinktoattrib')) { $properties['imgshrinktoattrib'] = $Imgshrinktoattrib }
    if ($PSBoundParameters.ContainsKey('Imgtojpegxr')) { $properties['imgtojpegxr'] = $Imgtojpegxr }
    if ($PSBoundParameters.ContainsKey('ImgtoWebP')) { $properties['imgtowebp'] = $ImgtoWebP }
    if ($PSBoundParameters.ContainsKey('Jpgoptimize')) { $properties['jpgoptimize'] = $Jpgoptimize }
    if ($PSBoundParameters.ContainsKey('Jsinline')) { $properties['jsinline'] = $Jsinline }
    if ($PSBoundParameters.ContainsKey('JsMinIfy')) { $properties['jsminify'] = $JsMinIfy }
    if ($PSBoundParameters.ContainsKey('Jsmovetoend')) { $properties['jsmovetoend'] = $Jsmovetoend }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PageExtendcache')) { $properties['pageextendcache'] = $PageExtendcache }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update feoaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type feoaction -Payload @{ feoaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetFEOAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateFEOAction

# region Invoke-NSUpdateFeoparameter
function Invoke-NSUpdateFeoparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler feoparameter resource.
    .DESCRIPTION
        Configuration for FEO parameter resource.
    .PARAMETER Cssinlinethressize
        Threshold value of the file size (in bytes) for converting external CSS files to inline CSS files. Default value: 1024 Minimum value = 1 Maximum value = 2048
    .PARAMETER Imginlinethressize
        Maximum file size of an image (in bytes), for coverting linked images to inline images. Default value: 1024 Minimum value = 1 Maximum value = 2048
    .PARAMETER JpegqualiTypeRcent
        The percentage value of a JPEG image quality to be reduced. Range: 0 - 100. Default value: 75 Minimum value = 0 Maximum value = 100
    .PARAMETER Jsinlinethressize
        Threshold value of the file size (in bytes), for converting external JavaScript files to inline JavaScript files. Default value: 1024 Minimum value = 1 Maximum value = 2048
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
        Invoke-NSUpdateFeoparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateFeoparameter  -WhatIf
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
        [int] $Cssinlinethressize,

        [Parameter()]
        [int] $Imginlinethressize,

        [Parameter()]
        [int] $JpegqualiTypeRcent,

        [Parameter()]
        [int] $Jsinlinethressize,

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
    if ($PSBoundParameters.ContainsKey('Cssinlinethressize')) { $properties['cssinlinethressize'] = $Cssinlinethressize }
    if ($PSBoundParameters.ContainsKey('Imginlinethressize')) { $properties['imginlinethressize'] = $Imginlinethressize }
    if ($PSBoundParameters.ContainsKey('JpegqualiTypeRcent')) { $properties['jpegqualitypercent'] = $JpegqualiTypeRcent }
    if ($PSBoundParameters.ContainsKey('Jsinlinethressize')) { $properties['jsinlinethressize'] = $Jsinlinethressize }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('feoparameter', 'Update feoparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type feoparameter -Payload @{ feoparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateFeoparameter

# region Invoke-NSUpdateFEOPolicy
function Invoke-NSUpdateFEOPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler feopolicy resource.
    .DESCRIPTION
        Configuration for Front end optimization policy resource.
    .PARAMETER Action
        The front end optimization action that has to be performed when the rule matches. Minimum length = 1
    .PARAMETER Name
        The name of the front end optimization policy. Minimum length = 1
    .PARAMETER Rule
        The rule associated with the front end optimization policy.
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
        Invoke-NSUpdateFEOPolicy -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateFEOPolicy -Name 'example' -WhatIf
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
        [string] $Action,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Rule,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update feopolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type feopolicy -Payload @{ feopolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetFEOPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateFEOPolicy

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDXC3v0KYJXQ4E2
# 9uPXV4EfXXN2Y2wsUqUgB26JIcP8yKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAOxfsGE
# dAui3IWtAAAAA7F+MA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYwNzI1MTkyNjEwWhcNMjYwNzI4
# MTkyNjEwWjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAoVDcAOz6TalWG9vfNlA6qVCD
# mLVli6Uc0fGG8EYUEtFVVtMWj2XauPbRgJ5oJxZpyvJb7jIWhZOjLHB8u/nDaJ77
# HsqfjiBgteEkOqZaMd2Lc7bn/cJU51jf0/folLa7iEfwlIukDrNBgpwTVJuPLbTQ
# 4hZDA+xFCZN8RikowtnrlQjN9gNn5Oh6jgPou7cz5AkfdWpj5Rp4NGV0cctYt6da
# uE/Wa5B1Q/NB8Zz2C2o3bmJ/fYeBwnuMVrhaeff6lBykWH6fixbw/FHECpGxgxBe
# jU0yFvhoO+SpDlIaejRq4IIxyeUHJNrTE8Mk8nU+T7x4i27MNHwsVvPn5vdozRhB
# JNR9eg1j/RzwhqZ3SoRuV2ne26xhG9UJw/2bv9rDdaBf2GP6nyKf+FmdFyCb1Y2D
# yygS3t/5FptjNcceOUIQZSpcjXJ/HJnnfdbCURshMzHhQ4mUzFuJLZtNiBFQ3uop
# E80PvLmNSA9sEyjXd4nyUm2SKfqpwyq7H+TMQs4DAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# rDk4FlKL6gGHF9FRtMEug2P8gT0wHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAMA0
# 8eOioaqDx9G96lr+ahHtFnpfHg0df91iir8LIKh7IguajVeIgFiOWOjYLWpFpRe+
# fMzvj5duooOeZChlHXFJVouSI0n3ooqmSakikUoVL8NJ4QHmppscUO7KaPzcVyyS
# Anq1LL7sfC3Z4sk2a0iFriXc90EcJ+StLU96tUUeJps15d0m5HRe+VQ0WmjepIrH
# H8kPYNDMtpxyMu5LvJdKDS02RdK4ZM0yvoMx70LdRuRAuNCUze3JovLjv4jprp/A
# BgEfMvE5Au7PMQEgAL50FM8jREQRtHWl9xaQFJwEgo62XQ1SVC3MKTc2SGb3Qke+
# re5a1KCRa6QOEof6F0fX6IDP1Mc9iRzdUdnZZ9Lu6OBsG/3j8LC6GVXePMcbogM9
# /oVizBQXwrAMCZEhwoGCQmxM18pRW1/Dq68I0dWCiIptqZE/fz2XrrvJktn/evdN
# EvlUk7cbsw0Aeeoy+8ju5N5jY98R4v44oUAkAhT7HvrU0k5dISUhNVHJbmjSEPWk
# 2K/sEYAEZAMfuK4KqTN3pSFNQttSdZs/3pqOtK+UW/tOWYO8hGskOwoo9MhxvYIK
# 9UaUyDcO0Fz7QBzO3DIZJMEY5jllHy1YH5ZZ8/Kmy7l0v2xuTMsVi1JN1laH8/R6
# TCSMIjo+8TJhm2VpA+PzG/wjcBbgSPYMLBiVSKH+MIIGwDCCBKigAwIBAgITMwAD
# sX7BhHQLotyFrQAAAAOxfjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MDcyNTE5MjYxMFoXDTI2
# MDcyODE5MjYxMFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAKFQ3ADs+k2pVhvb3zZQ
# OqlQg5i1ZYulHNHxhvBGFBLRVVbTFo9l2rj20YCeaCcWacryW+4yFoWToyxwfLv5
# w2ie+x7Kn44gYLXhJDqmWjHdi3O25/3CVOdY39P36JS2u4hH8JSLpA6zQYKcE1Sb
# jy200OIWQwPsRQmTfEYpKMLZ65UIzfYDZ+Toeo4D6Lu3M+QJH3VqY+UaeDRldHHL
# WLenWrhP1muQdUPzQfGc9gtqN25if32HgcJ7jFa4Wnn3+pQcpFh+n4sW8PxRxAqR
# sYMQXo1NMhb4aDvkqQ5SGno0auCCMcnlByTa0xPDJPJ1Pk+8eItuzDR8LFbz5+b3
# aM0YQSTUfXoNY/0c8Iamd0qEbldp3tusYRvVCcP9m7/aw3WgX9hj+p8in/hZnRcg
# m9WNg8soEt7f+RabYzXHHjlCEGUqXI1yfxyZ533WwlEbITMx4UOJlMxbiS2bTYgR
# UN7qKRPND7y5jUgPbBMo13eJ8lJtkin6qcMqux/kzELOAwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFKw5OBZSi+oBhxfRUbTBLoNj/IE9MB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQDANPHjoqGqg8fRvepa/moR7RZ6Xx4NHX/dYoq/CyCoeyILmo1XiIBYjljo2C1q
# RaUXvnzM74+XbqKDnmQoZR1xSVaLkiNJ96KKpkmpIpFKFS/DSeEB5qabHFDuymj8
# 3FcskgJ6tSy+7Hwt2eLJNmtIha4l3PdBHCfkrS1PerVFHiabNeXdJuR0XvlUNFpo
# 3qSKxx/JD2DQzLaccjLuS7yXSg0tNkXSuGTNMr6DMe9C3UbkQLjQlM3tyaLy47+I
# 6a6fwAYBHzLxOQLuzzEBIAC+dBTPI0REEbR1pfcWkBScBIKOtl0NUlQtzCk3Nkhm
# 90JHvq3uWtSgkWukDhKH+hdH1+iAz9THPYkc3VHZ2WfS7ujgbBv94/CwuhlV3jzH
# G6IDPf6FYswUF8KwDAmRIcKBgkJsTNfKUVtfw6uvCNHVgoiKbamRP389l667yZLZ
# /3r3TRL5VJO3G7MNAHnqMvvI7uTeY2PfEeL+OKFAJAIU+x761NJOXSElITVRyW5o
# 0hD1pNiv7BGABGQDH7iuCqkzd6UhTULbUnWbP96ajrSvlFv7TlmDvIRrJDsKKPTI
# cb2CCvVGlMg3DtBc+0AcztwyGSTBGOY5ZR8tWB+WWfPypsu5dL9sbkzLFYtSTdZW
# h/P0ekwkjCI6PvEyYZtlaQPj8xv8I3AW4Ej2DCwYlUih/jCCBygwggUQoAMCAQIC
# EzMAAAAYDeuRVamKAJgAAAAAABgwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMzJaFw0zMTAzMjYxODExMzJaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDIgNpgNFaiif2VWeWP5I6PnFXxJ/lB37fJR55GCvR7GLZBMkBijbiKVwgp
# BI3xM5nf484znH/qncJ+OCq6y3jgnQW+R8Zd7U+7LjlrmcskalzSQ0ghMxEpnBW8
# /HHs2V8ZJzQk6HP+SDsbvsL7LdlH/eO2l4mknhDBwr0Z/Q966TvEth5b8kCxj1vq
# iV4YNthLGRqZR9u2fK/yBMWu83p6O4uo2Edg++gEew5IL7vnnnKFqmSh/R9vPJy3
# WF1YcZewAUx8sXZNUnx3ZhVg59l2LpitPiwzE6FMqIsqaEvVe3MzuFd2a/uWDZH6
# VbDyUiRK78mIg1DQYA9zDEyyBFcNI+nxVSzglvL6u7PRuNqgcV3sf6ELxw89ysQM
# /Z4R1hRFWXRpyOWKKAKtfBHTk0UnNiPcxmLMMYs8jeUjOidfVPjTIry/UVwnwxdl
# kK85cZfBEMYZ/DBNOwdomP459Y1n8izKkbhsa+p4lw+cQVxATBFx9ggR79HhryT7
# HDmpPLvkJvBZ4wW4CW32UT2SMyDe28nIOU3m+hfHlVeKcLBQcym5VoRDjIcCVI7u
# qgGW2PNME0cfei8zCwCy6HCsssJWFS7eg/YbFhnATJcyWfMrkNuAbMfMN8Npg8cr
# S6jVVowyD0GG5zdgi+uQVcSK/638mA1xEYK3pnIoQgO09uuDBwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBSk
# Qwx/dlqlhec+jSgPDBeiRWlwxjBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQBxxyBW+X6mhdRiSwD9PMMWcGUAnx5/QUwnNvZdFGEX+4DR
# DIr9WCh4C87wHtw+lg1D3uzK10DstPX0LFLBFAC3vWMYX4ImXwoLhoR0xlN8mUdo
# rJ3bgnpCJWuI1531Z1rCwPuUrSkBxfOIGDk3p2ECb3Ho/xHi5PRSR/OUrWuQHwXi
# aXMTuXu3IRLezwVkZpFmNwYRD57R9Nx2F/yM7tzOY0Hh0hGCaYEK38/6FrS0SXad
# XWyDUCfn5XOGACRjUCnHx+JQUG0f4SHD+iblpAI0gl+ZHnVmdXXxHTZeTa0CYCIh
# FxKP2922s0g6zLmeiV13LWUmtt/UF7TrWXpMi2/0UNniaDoH7rnPGRV5xVX8uXy4
# sZii4aswzqPM7Y7+mzcranqZ8EjZk5gjLhQ3A2sZaprlOu8CaRmyfcIiVH7zVfgA
# vm81MWXFziAf7my7QOvnyEFPGddq8MSfPtfRyw/Uq3uH6KpoaJNIfPYH6fceZSi5
# 3Rat1A9grExq3ROjhhSpTcchuBItAMNVPxoKNbUm+iR/X3XkL+9WQginjyHe+hXL
# clY8vAGXFD1p40PqMIpAYsmEJBFKW9df4//1N5oQDr/FY9IBJl/oSS979i5rtT7N
# Zz9KvYraCPRBGs0QCy+sWvgQa0coM70QJVLeVwmSxUO/0od0w9Qry7bSLrxGoDCC
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
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcyMIIXLgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAA7F+
# wYR0C6Lcha0AAAADsX4wDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgYmrT
# xxyHved+hb0GnmB0y19q7CLDp1Sq4ij6nYQ2jHYwDQYJKoZIhvcNAQEBBQAEggGA
# AGitQUEwD0QHUYAisT6ivnVbOKHcHUnWBvCdLJ7qZGPGkIBRS7e8uwne/yCwr8hQ
# lv9kGearhoioODRDXbXdFvVsvx4XZUcjOt/QO/fNc0fIxpRWXc6B0eD1gm23L6o9
# 7+ML5mJ/WOx3PsXt7lEki4teYdAwSg3so/c5jSqTD5JZQJWJ7G8Fnj6saN6kd07C
# ZaREBml3oneZoFYkmtmChGPGwIxepAp0B8XofZocJR2pkcbkD8r4uB0tJVIA8G+S
# dFtsyrB+4zYXM/L+in2NbN2fMHyQywRPOQO4Z2vJRmoLT6PCU457LltGTxuhWsAQ
# OqivfmGFvVzEh/GzGy2CNP1ByJIDl3GEsIzyrer8pQNYgIUeY3D5xu0x8UJ2S+12
# bms9p8ARRePzPY3abqg434dW2ZI46BqexJeQXSrVuRDTKgPM9d+X/eayemKGuBzi
# GkIpyV2nnrrJWNM2VDABE401OFKHY0TQJ31c+YcjZtHhn/A8bnVltJm1hKShdjOE
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIAKy8QehoGv1BgSMQ5Pk
# k6mbOcTldeshZ+TFAfzH4h3gAgZqNTBOP4gYEzIwMjYwNzI3MTMxMTI3LjkxMlow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYD
# VQQDEyxNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0
# eaCCDykwggeCMIIFaqADAgECAhMzAAAABeXPD/9mLsmHAAAAAAAFMA0GCSqGSIb3
# DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24g
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAyMDAeFw0yMDExMTkyMDMyMzFa
# Fw0zNTExMTkyMDQyMzFaMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRp
# bWVzdGFtcGluZyBDQSAyMDIwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEAnnznUmP94MWfBX1jtQYioxwe1+eXM9ETBb1lRkd3kcFdcG9/sqtDlwxKoVIc
# aqDb+omFio5DHC4RBcbyQHjXCwMk/l3TOYtgoBjxnG/eViS4sOx8y4gSq8Zg49RE
# Af5huXhIkQRKe3Qxs8Sgp02KHAznEa/Ssah8nWo5hJM1xznkRsFPu6rfDHeZeG1W
# a1wISvlkpOQooTULFm809Z0ZYlQ8Lp7i5F9YciFlyAKwn6yjN/kR4fkquUWfGmMo
# pNq/B8U/pdoZkZZQbxNlqJOiBGgCWpx69uKqKhTPVi3gVErnc/qi+dR8A2MiAz0k
# N0nh7SqINGbmw5OIRC0EsZ31WF3Uxp3GgZwetEKxLms73KG/Z+MkeuaVDQQheang
# OEMGJ4pQZH55ngI0Tdy1bi69INBV5Kn2HVJo9XxRYR/JPGAaM6xGl57Ei95HUw9N
# V/uC3yFjrhc087qLJQawSC3xzY/EXzsT4I7sDbxOmM2rl4uKK6eEpurRduOQ2hTk
# mG1hSuWYBunFGNv21Kt4N20AKmbeuSnGnsBCd2cjRKG79+TX+sTehawOoxfeOO/j
# R7wo3liwkGdzPJYHgnJ54UxbckF914AqHOiEV7xTnD1a69w/UTxwjEugpIPMIIE6
# 7SFZ2PMo27xjlLAHWW3l1CEAFjLNHd3EQ79PUr8FUXetXr0CAwEAAaOCAhswggIX
# MA4GA1UdDwEB/wQEAwIBhjAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQUa2ko
# OjUvSGNAz3vYr0npPtk92yEwVAYDVR0gBE0wSzBJBgRVHSAAMEEwPwYIKwYBBQUH
# AgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0
# b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMA
# dQBiAEMAQTAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFMh+0mqFKhvKGZgE
# ByfPUBBPaKiiMIGEBgNVHR8EfTB7MHmgd6B1hnNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZlcmlmaWNh
# dGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIwMjAuY3Js
# MIGUBggrBgEFBQcBAQSBhzCBhDCBgQYIKwYBBQUHMAKGdWh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwSWRlbnRpdHklMjBW
# ZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUlMjBBdXRob3JpdHklMjAy
# MDIwLmNydDANBgkqhkiG9w0BAQwFAAOCAgEAX4h2x35ttVoVdedMeGj6TuHYRJkl
# FaW4sTQ5r+k77iB79cSLNe+GzRjv4pVjJviceW6AF6ycWoEYR0LYhaa0ozJLU5Yi
# +LCmcrdovkl53DNt4EXs87KDogYb9eGEndSpZ5ZM74LNvVzY0/nPISHz0Xva71Qj
# D4h+8z2XMOZzY7YQ0Psw+etyNZ1CesufU211rLslLKsO8F2aBs2cIo1k+aHOhrw9
# xw6JCWONNboZ497mwYW5EfN0W3zL5s3ad4Xtm7yFM7Ujrhc0aqy3xL7D5FR2J7x9
# cLWMq7eb0oYioXhqV2tgFqbKHeDick+P8tHYIFovIP7YG4ZkJWag1H91KlELGWi3
# SLv10o4KGag42pswjybTi4toQcC/irAodDW8HNtX+cbz0sMptFJK+KObAnDFHEsu
# kxD+7jFfEV9Hh/+CSxKRsmnuiovCWIOb+H7DRon9TlxydiFhvu88o0w35JkNbJxT
# k4MhF/KgaXn0GxdH8elEa2Imq45gaa8D+mTm8LWVydt4ytxYP/bqjN49D9NZ81co
# E6aQWm88TwIf4R4YZbOpMKN0CyejaPNN41LGXHeCUMYmBx3PkP8ADHD1J2Cr/6tj
# uOOCztfp+o9Nc+ZoIAkpUcA/X2gSMkgHAPUvIdtoSAHEUKiBhI6JQivRepyvWcl+
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAWvYNZ4yF7d0IAAAAAABaMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwM1oXDTI3MDEwNzE4NTkwM1ow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAO/0O0eWjgUb9rnHcQLRdfWPN4H+91a3Ynla
# P46E1m4uD+JKx6csWMStX79fxLJUAqHJqQWE19UlNMhS9jEB32dAJ4yuWsHyUuM+
# dphjDz4E5jl4gYGZEmaOrKvNt+KqlFayyg/oTg3BlLRu4aBq8668A5qlHcfsuh6D
# dSqFID1ixJFZzHrZFG1iGBG7U1Bn2ONLDo7jbwX5rMcPduTAUw/c7M3WhSxQBuZp
# Qiz8RQGKIqCKfIxgQkKdzpCpU0SWQOE/DgTXbz3c15KMRCdkGlL2zb+lnuSV4sse
# Qm3qflZiZckLyn2xJI8ZXDkq+Ig+b/rsPPIfI8di228WvK1j67JXpyeVCaSUO9Er
# zlLnTrnjQkeXVQIp73xuVBVrmvoTf/v4a7MnrmuKSyIXc5vJUHEGB345+O8omFt1
# w8b+Xg9D9PKIRqDPEv7HRk0C+Yvxu8FvHJvSocSIZK+v/FmKFOipYnpP76yAmJNn
# yheucShOgk8QiU53USn/+AyMb7xW905gZnyNqb29HeVdQ175pDHJGEz8Cx5wiHeV
# liGz5hABucFDylR9z3LSTmB6+3ZuIxeG9BZS46P6ANPkuVuD5m8wgc7GLLzg73Cs
# DF09ukt8Uf8dTcMBX3ro+7/k9M6Xt8WPG7IL9v/4DvyMY03tkb9Y9Ri6HWavXRPY
# RCUePspPAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQUjmOyQ6twMcP1ZbRytJxI4fnX
# mcIwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQCAlM8r+t3hIb2h1lDTAx+iYkQlxFuU7QONeyIFIBZ29xvG
# l8pehKxErDzIniOpIX/eluUAwQKoaI0zwuKAdR0mrSHXCniMoLNko5W+5r7sXNam
# KX7QMV3BfGOX3gi9qVfxyUe7AHXbqQ8KBQHNYCnNFtQQHgARrlYhtyAKol5ctM0C
# Ac/y3oY7bTMsVJvnA5u7DVWPeXoST2KEMDeLBvJYq0IJZ6yMpDOWLZ4UP82bksyS
# hIB/XdawirIGLdseudryRxVMk313mAcjGRb59+Ittt6otVvYQWqH+PGrTUzEcez8
# aQuO3umoNZjKuFoX5VsPP/gSZse+orhG3zfZk9IDyE3DfUFrhvkv6H0tijK1D0uI
# GhwMBWSm9ktQ6oeU+aurZFx3MI+LODnHsbRFZAy11uMvwKq+ZNC1Se4tIM1u9piW
# AhnTPoh6mULKikHOVhHaO953tkzDCtjsse5GUKOx9yg9nqHKWMgnODp62/uPPzC/
# yDEISrXCcU7UB7tATr3zWNEdtM4d009iXWI6dV/SdcIIX44rpoLyCLw+nXjxp+fY
# /dygLO7UdSQaVaUFVj3K2nVyuujPspt5Lunc5FvuYPqmi/z8kASmmwbiF+W0P0UT
# WFaC84MWfU2h6MDg5s0oxmdNFK76jXr3wZfdSoV7FCKfq5GdeGoy5UwDQwMC0DGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABa9g1njIXt3QgAAAAAAFowDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgNmF/qKYQF+/Q+qAum4Sl6r5grCy59Q12suy++gqAhRkwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCCQq79qqwkD4ea/FiBm
# C4pfvGQpmxVmt9dVg+iQDGdTljANBgkqhkiG9w0BAQsFAASCAgASUr6tBvb0oxsW
# yWTW+kQc7E0fEYmcjy/YnaH/i6Kn2cHZfmRBvTubwDe6NXplq45sHvSqFORVKgvR
# oMxI3H7AaBDcMc3DTi/NCX4dwhzGTZvYs2seHRU7EBlNVs0KiL+7u8tl//AhuY+R
# AGGzza/srkhenykB+stIzA7BMr5peTIthuyatkqhi3AXnPjSVC7Ym35vZ2B6roL/
# /kz7gFqjuOLrCUTbWT5h6Ua/prLo+p7hsi5M/CQW+blEeFXf7Co3TnFOWE1vbxjE
# g7QUFcYbCUvVHlaHOUO1g+zbMIR8Xdxpy5ej9xkGhCkMUv0iUIT+ohqUZEQjghkD
# M8w7TeKcpcxix7SPabjRCl0y2/0RyG7lv5AYKcsI5GbkJQ27Y4pRkE6RoyGqH0Lf
# DtkykEu2ng8L9Uq8TXQsH1lcuVRqmtjUruYqOilGIMubyKzvCN476iWj9OB+c5f8
# t81XbzeTEZ7//epOXsH+aTLcdF0aVB1lkUugtZ49nXQ0YDT7pMJpcd3gtLiXUi5+
# SWGGOrwN1KJegpvnfX9iLm5zKXX/Kl+mdQdG5oT3u0Pi94G6/1qCLiCrt0Wo2rt+
# pg7U90tqPHX7z+Vsh6fhQA80Qp4NZ+xbS/VTxC1TBJtsa/V4csZApPE5ALThg46j
# 1Uziam3blop9xg9aD4zpzTK0XdOaxA==
# SIG # End signature block
