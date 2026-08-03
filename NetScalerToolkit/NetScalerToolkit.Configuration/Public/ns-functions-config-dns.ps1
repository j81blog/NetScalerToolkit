# Generated NetScalerToolkit Configuration bundle for category 'dns'.

# region Invoke-NSAddDNSAAAARecord
function Invoke-NSAddDNSAAAARecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsaaaarec resource.
    .DESCRIPTION
        Configuration for IPv6 address type record resource.
    .PARAMETER HostName
        Domain name. Minimum length = 1
    .PARAMETER IPv6Address
        One or more IPv6 addresses to assign to the domain name. Minimum length = 1
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSAAAARecord -HostName '192.0.2.10' -IPv6Address 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSAAAARecord -HostName '192.0.2.10' -IPv6Address 'example' -WhatIf
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
        [string] $HostName,

        [Parameter(Mandatory)]
        [string] $IPv6Address,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('HostName')) { $properties['hostname'] = $HostName }
    if ($PSBoundParameters.ContainsKey('IPv6Address')) { $properties['ipv6address'] = $IPv6Address }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$HostName", 'Create dnsaaaarec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsaaaarec -Payload @{ dnsaaaarec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSAAAARecord -HostName $HostName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSAAAARecord

# region Invoke-NSAddDNSAction
function Invoke-NSAddDNSAction {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsaction resource.
    .DESCRIPTION
        Configuration for DNS action resource.
    .PARAMETER ActionName
        Name of the dns action.
    .PARAMETER ActionType
        The type of DNS action that is being configured. Possible values = ViewName, GslbPrefLoc, noop, Drop, Cache_Bypass, Rewrite_Response
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the transaction for which the action is chosen. Minimum length = 1 Maximum length = 127
    .PARAMETER Ipaddress
        List of IP address to be returned in case of rewrite_response actiontype. They can be of IPV4 or IPV6 type. In case of set command We will remove all the IP address previously present in the action and will add new once given in set dns action command.
    .PARAMETER PreferredloCLISt
        The location list in priority order used for the given action. Minimum length = 1
    .PARAMETER Ttl
        Time to live, in seconds. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER ViewName
        The view name that must be used for the given action.
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
        Invoke-NSAddDNSAction -ActionName 'example' -ActionType ViewName -PassThru
    .EXAMPLE
        Invoke-NSAddDNSAction -ActionName 'example' -ActionType ViewName -WhatIf
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
        [string] $ActionName,

        [Parameter(Mandatory)]
        [ValidateSet('ViewName', 'GslbPrefLoc', 'noop', 'Drop', 'Cache_Bypass', 'Rewrite_Response')]
        [string] $ActionType,

        [Parameter()]
        [string] $DNSProfileName,

        [Parameter()]
        [string[]] $Ipaddress,

        [Parameter()]
        [string[]] $PreferredloCLISt,

        [Parameter()]
        [int] $Ttl,

        [Parameter()]
        [string] $ViewName,

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
    if ($PSBoundParameters.ContainsKey('ActionName')) { $properties['actionname'] = $ActionName }
    if ($PSBoundParameters.ContainsKey('ActionType')) { $properties['actiontype'] = $ActionType }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('PreferredloCLISt')) { $properties['preferredloclist'] = $PreferredloCLISt }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('ViewName')) { $properties['viewname'] = $ViewName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ActionName", 'Create dnsaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsaction -Payload @{ dnsaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSAction -ActionName $ActionName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSAction

# region Invoke-NSAddDNSAction64
function Invoke-NSAddDNSAction64 {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsaction64 resource.
    .DESCRIPTION
        Configuration for dns64 action resource.
    .PARAMETER ActionName
        Name of the dns64 action.
    .PARAMETER Excluderule
        The expression to select the criteria for eliminating the corresponding ipv6 addresses from the response.
    .PARAMETER Mappedrule
        The expression to select the criteria for ipv4 addresses to be used for synthesis. Only if the mappedrule is evaluated to true the corresponding ipv4 address is used for synthesis using respective prefix, otherwise the A RR is discarded.
    .PARAMETER Prefix
        The dns64 prefix to be used if the after evaluating the rules.
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
        Invoke-NSAddDNSAction64 -ActionName 'example' -Prefix 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSAction64 -ActionName 'example' -Prefix 'example' -WhatIf
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
        [string] $ActionName,

        [Parameter()]
        [string] $Excluderule,

        [Parameter()]
        [string] $Mappedrule,

        [Parameter(Mandatory)]
        [string] $Prefix,

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
    if ($PSBoundParameters.ContainsKey('ActionName')) { $properties['actionname'] = $ActionName }
    if ($PSBoundParameters.ContainsKey('Excluderule')) { $properties['excluderule'] = $Excluderule }
    if ($PSBoundParameters.ContainsKey('Mappedrule')) { $properties['mappedrule'] = $Mappedrule }
    if ($PSBoundParameters.ContainsKey('Prefix')) { $properties['prefix'] = $Prefix }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ActionName", 'Create dnsaction64')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsaction64 -Payload @{ dnsaction64 = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSAction64 -ActionName $ActionName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSAction64

# region Invoke-NSAddDNSAddRecord
function Invoke-NSAddDNSAddRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsaddrec resource.
    .DESCRIPTION
        Configuration for address type record resource.
    .PARAMETER HostName
        Domain name. Minimum length = 1
    .PARAMETER Ipaddress
        One or more IPv4 addresses to assign to the domain name. Minimum length = 1
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSAddRecord -HostName '192.0.2.10' -Ipaddress 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSAddRecord -HostName '192.0.2.10' -Ipaddress 'example' -WhatIf
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
        [string] $HostName,

        [Parameter(Mandatory)]
        [string] $Ipaddress,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('HostName')) { $properties['hostname'] = $HostName }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$HostName", 'Create dnsaddrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsaddrec -Payload @{ dnsaddrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSAddRecord -HostName $HostName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSAddRecord

# region Invoke-NSAddDNSCAARecord
function Invoke-NSAddDNSCAARecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnscaarec resource.
    .DESCRIPTION
        Configuration for CAA record resource.
    .PARAMETER Domain
        Domain name of the CAA record. Minimum length = 1
    .PARAMETER Flag
        Flag associated with the CAA record. Default value: 5 Possible values = NONE, CRITICAL
    .PARAMETER Tag
        String that represents the identifier of the property represented by the CAA record. The RFC currently defines three available tags - issue, issuwild and iodef. Default value: "issue" Minimum length = 1 Maximum length = 255
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Valuestring
        Value associated with the chosen property tag in the CAA resource record. Enclose the string in single or double quotation marks. Minimum length = 1
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
        Invoke-NSAddDNSCAARecord -Domain 'example' -Valuestring 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSCAARecord -Domain 'example' -Valuestring 'example' -WhatIf
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
        [string] $Domain,

        [Parameter()]
        [ValidateSet('NONE', 'CRITICAL')]
        [string] $Flag,

        [Parameter()]
        [string] $Tag,

        [Parameter()]
        [int] $Ttl,

        [Parameter(Mandatory)]
        [string] $Valuestring,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Flag')) { $properties['flag'] = $Flag }
    if ($PSBoundParameters.ContainsKey('Tag')) { $properties['tag'] = $Tag }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('Valuestring')) { $properties['valuestring'] = $Valuestring }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Create dnscaarec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnscaarec -Payload @{ dnscaarec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSCAARecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSCAARecord

# region Invoke-NSAddDNSCNameRecord
function Invoke-NSAddDNSCNameRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnscnamerec resource.
    .DESCRIPTION
        Configuration for CNAME record resource.
    .PARAMETER AliasName
        Alias for the canonical domain name. Minimum length = 1
    .PARAMETER CanonicalName
        Canonical domain name. Minimum length = 1
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSCNameRecord -AliasName 'example' -CanonicalName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSCNameRecord -AliasName 'example' -CanonicalName 'example' -WhatIf
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
        [string] $AliasName,

        [Parameter(Mandatory)]
        [string] $CanonicalName,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('AliasName')) { $properties['aliasname'] = $AliasName }
    if ($PSBoundParameters.ContainsKey('CanonicalName')) { $properties['canonicalname'] = $CanonicalName }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$AliasName", 'Create dnscnamerec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnscnamerec -Payload @{ dnscnamerec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSCNameRecord -AliasName $AliasName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSCNameRecord

# region Invoke-NSAddDNSGlobalDNSPolicyBinding
function Invoke-NSAddDNSGlobalDNSPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsglobal_dnspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the dnspolicy that can be bound to dnsglobal.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label. Minimum length = 1
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label to invoke if the current policy rule evaluates to TRUE.
    .PARAMETER LabelType
        Type of policy label invocation. Possible values = policylabel
    .PARAMETER PolicyName
        Name of the dns policy.
    .PARAMETER Priority
        Specifies the priority of the policy with which it is bound. Maximum allowed priority should be less than 65535.
    .PARAMETER Type
        Type of global bind point for which to show bound policies. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT
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
        Invoke-NSAddDNSGlobalDNSPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddDNSGlobalDNSPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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
        [ValidateSet('policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT')]
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
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('dnsglobal_dnspolicy_binding', 'Create dnsglobal_dnspolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsglobal_dnspolicy_binding -Payload @{ dnsglobal_dnspolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddDNSGlobalDNSPolicyBinding

# region Invoke-NSAddDNSKey
function Invoke-NSAddDNSKey {
    <#
    .SYNOPSIS
        Creates a NetScaler dnskey resource.
    .DESCRIPTION
        Configuration for dns key resource.
    .PARAMETER Autorollover
        Flag to enable/disable key rollover automatically. Note: * Key name will be appended with _AR1 for successor key. For e.g. current key=k1, successor key=k1_AR1. * Key name can be truncated if current name length is more than 58 bytes to accomodate the suffix. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Expires
        Time period for which to consider the key valid, after the key is used to sign a zone. Default value: 120 Minimum value = 1 Maximum value = 32767
    .PARAMETER KeyName
        Name of the public-private key pair to publish in the zone. Minimum length = 1
    .PARAMETER Notificationperiod
        Time at which to generate notification of key expiration, specified as number of days, hours, or minutes before expiry. Must be less than the expiry period. The notification is an SNMP trap sent to an SNMP manager. To enable the appliance to send the trap, enable the DNSKEY-EXPIRY SNMP alarm. In case autorollover option is enabled, rollover for successor key will be intiated at this time. No notification trap will be sent. Default value: 7 Minimum value = 1 Maximum value = 32767
    .PARAMETER Password
        Passphrase for reading the encrypted public/private DNS keys. Minimum length = 1
    .PARAMETER PrivateKey
        File name of the private key.
    .PARAMETER PublicKey
        File name of the public key.
    .PARAMETER Revoke
        Revoke the key. Note: This operation is non-reversible.
    .PARAMETER RolloverMethod
        Method used for automatic rollover. * Key type: ZSK, Method: PrePublication or DoubleSignature. * Key type: KSK, Method: DoubleRRSet. Possible values = PrePublication, DoubleSignature, DoubleRRSet
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the DNSKEY resource record created in the zone. TTL is the time for which the record must be cached by the DNS proxies. If the TTL is not specified, either the DNS zone's minimum TTL or the default value of 3600 is used. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER UnitS1
        Units for the expiry period. Default value: DAYS Possible values = MINUTES, HOURS, DAYS
    .PARAMETER UnitS2
        Units for the notification period. Default value: DAYS Possible values = MINUTES, HOURS, DAYS
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
        Invoke-NSAddDNSKey -KeyName 'example' -PrivateKey 'example' -PublicKey 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSKey -KeyName 'example' -PrivateKey 'example' -PublicKey 'example' -WhatIf
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
        [string] $Autorollover,

        [Parameter()]
        [int] $Expires,

        [Parameter(Mandatory, Position = 0)]
        [string] $KeyName,

        [Parameter()]
        [int] $Notificationperiod,

        [Parameter()]
        [string] $Password,

        [Parameter(Mandatory)]
        [string] $PrivateKey,

        [Parameter(Mandatory)]
        [string] $PublicKey,

        [Parameter()]
        [bool] $Revoke,

        [Parameter()]
        [string] $RolloverMethod,

        [Parameter()]
        [int] $Ttl,

        [Parameter()]
        [ValidateSet('MINUTES', 'HOURS', 'DAYS')]
        [string] $UnitS1,

        [Parameter()]
        [ValidateSet('MINUTES', 'HOURS', 'DAYS')]
        [string] $UnitS2,

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

    if ($PSBoundParameters.ContainsKey('Autorollover')) {
        Assert-NSParameterValue -ParameterName 'Autorollover' -Value $Autorollover -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('RolloverMethod')) {
        Assert-NSParameterValue -ParameterName 'RolloverMethod' -Value $RolloverMethod -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('PrePublication', 'DoubleSignature', 'DoubleRRSet') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Autorollover')) { $properties['autorollover'] = $Autorollover }
    if ($PSBoundParameters.ContainsKey('Expires')) { $properties['expires'] = $Expires }
    if ($PSBoundParameters.ContainsKey('KeyName')) { $properties['keyname'] = $KeyName }
    if ($PSBoundParameters.ContainsKey('Notificationperiod')) { $properties['notificationperiod'] = $Notificationperiod }
    if ($PSBoundParameters.ContainsKey('Password')) { $properties['password'] = $Password }
    if ($PSBoundParameters.ContainsKey('PrivateKey')) { $properties['privatekey'] = $PrivateKey }
    if ($PSBoundParameters.ContainsKey('PublicKey')) { $properties['publickey'] = $PublicKey }
    if ($PSBoundParameters.ContainsKey('Revoke')) { $properties['revoke'] = $Revoke }
    if ($PSBoundParameters.ContainsKey('RolloverMethod')) { $properties['rollovermethod'] = $RolloverMethod }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('UnitS1')) { $properties['units1'] = $UnitS1 }
    if ($PSBoundParameters.ContainsKey('UnitS2')) { $properties['units2'] = $UnitS2 }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$KeyName", 'Create dnskey')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnskey -Payload @{ dnskey = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSKey -KeyName $KeyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSKey

# region Invoke-NSAddDNSMXRecord
function Invoke-NSAddDNSMXRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsmxrec resource.
    .DESCRIPTION
        Configuration for MX record resource.
    .PARAMETER Domain
        Domain name for which to add the MX record. Minimum length = 1
    .PARAMETER Mx
        Host name of the mail exchange server. Minimum length = 1
    .PARAMETER Pref
        Priority number to assign to the mail exchange server. A domain name can have multiple mail servers, with a priority number assigned to each server. The lower the priority number, the higher the mail server's priority. When other mail servers have to deliver mail to the specified domain, they begin with the mail server with the lowest priority number, and use other configured mail servers, in priority order, as backups. Minimum value = 0 Maximum value = 65535
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSMXRecord -Domain 'example' -Mx 'example' -Pref 1 -PassThru
    .EXAMPLE
        Invoke-NSAddDNSMXRecord -Domain 'example' -Mx 'example' -Pref 1 -WhatIf
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string] $Mx,

        [Parameter(Mandatory)]
        [int] $Pref,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Mx')) { $properties['mx'] = $Mx }
    if ($PSBoundParameters.ContainsKey('Pref')) { $properties['pref'] = $Pref }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Create dnsmxrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsmxrec -Payload @{ dnsmxrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSMXRecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSMXRecord

# region Invoke-NSAddDNSNameServer
function Invoke-NSAddDNSNameServer {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsnameserver resource.
    .DESCRIPTION
        Configuration for name server resource.
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the name server. Minimum length = 1
    .PARAMETER DNSVServerName
        Name of a DNS virtual server. Overrides any IP address-based name servers configured on the Citrix ADC. Minimum length = 1
    .PARAMETER Ip
        IP address of an external name server or, if the Local parameter is set, IP address of a local DNS server (LDNS). Minimum length = 1
    .PARAMETER Local
        Mark the IP address as one that belongs to a local recursive DNS server on the Citrix ADC. The appliance recursively resolves queries received on an IP address that is marked as being local. For recursive resolution to work, the global DNS parameter, Recursion, must also be set. From 14.1 47.x build , it is recommended to use ADNS and ADNS_TCP service and associating a DNS profile with recursiveResolution parameter enabled to achieve the same functionality.
    .PARAMETER State
        Administrative state of the name server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Type
        Protocol used by the name server. UDP_TCP is not valid if the name server is a DNS virtual server configured on the appliance. Default value: UDP Possible values = UDP, TCP, UDP_TCP
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
        Invoke-NSAddDNSNameServer -Ip 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSNameServer -Ip 'example' -WhatIf
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
        [string] $DNSProfileName,

        [Parameter()]
        [string] $DNSVServerName,

        [Parameter(Position = 0)]
        [string] $Ip,

        [Parameter()]
        [bool] $Local,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [ValidateSet('UDP', 'TCP', 'UDP_TCP')]
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
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('DNSVServerName')) { $properties['dnsvservername'] = $DNSVServerName }
    if ($PSBoundParameters.ContainsKey('Ip')) { $properties['ip'] = $Ip }
    if ($PSBoundParameters.ContainsKey('Local')) { $properties['local'] = $Local }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ip", 'Create dnsnameserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsnameserver -Payload @{ dnsnameserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSNameServer -Ip $Ip -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSNameServer

# region Invoke-NSAddDNSNAPTRRecord
function Invoke-NSAddDNSNAPTRRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsnaptrrec resource.
    .DESCRIPTION
        Configuration for NAPTR record resource.
    .PARAMETER Domain
        Name of the domain for the NAPTR record. Minimum length = 1
    .PARAMETER Flags
        flags for this NAPTR. Maximum length = 255
    .PARAMETER Order
        An integer specifying the order in which the NAPTR records MUST be processed in order to accurately represent the ordered list of Rules. The ordering is from lowest to highest. Minimum value = 0 Maximum value = 65535
    .PARAMETER Preference
        An integer specifying the preference of this NAPTR among NAPTR records having same order. lower the number, higher the preference. Minimum value = 0 Maximum value = 65535
    .PARAMETER Regexp
        The regular expression, that specifies the substitution expression for this NAPTR. Maximum length = 255
    .PARAMETER Replacement
        The replacement domain name for this NAPTR. Maximum length = 255
    .PARAMETER ServiceS
        Service Parameters applicable to this delegation path. Maximum length = 255
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSNAPTRRecord -Domain 'example' -Order 1 -Preference 1 -PassThru
    .EXAMPLE
        Invoke-NSAddDNSNAPTRRecord -Domain 'example' -Order 1 -Preference 1 -WhatIf
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
        [string] $Domain,

        [Parameter()]
        [string] $Flags,

        [Parameter(Mandatory)]
        [int] $Order,

        [Parameter(Mandatory)]
        [int] $Preference,

        [Parameter()]
        [string] $Regexp,

        [Parameter()]
        [string] $Replacement,

        [Parameter()]
        [string] $ServiceS,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Flags')) { $properties['flags'] = $Flags }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('Preference')) { $properties['preference'] = $Preference }
    if ($PSBoundParameters.ContainsKey('Regexp')) { $properties['regexp'] = $Regexp }
    if ($PSBoundParameters.ContainsKey('Replacement')) { $properties['replacement'] = $Replacement }
    if ($PSBoundParameters.ContainsKey('ServiceS')) { $properties['services'] = $ServiceS }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Create dnsnaptrrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsnaptrrec -Payload @{ dnsnaptrrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSNAPTRRecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSNAPTRRecord

# region Invoke-NSAddDNSNSRecord
function Invoke-NSAddDNSNSRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsnsrec resource.
    .DESCRIPTION
        Configuration for name server record resource.
    .PARAMETER Domain
        Domain name. Minimum length = 1
    .PARAMETER NameServer
        Host name of the name server to add to the domain. Minimum length = 1
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSNSRecord -Domain 'example' -NameServer 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSNSRecord -Domain 'example' -NameServer 'example' -WhatIf
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string] $NameServer,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('NameServer')) { $properties['nameserver'] = $NameServer }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Create dnsnsrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsnsrec -Payload @{ dnsnsrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSNSRecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSNSRecord

# region Invoke-NSAddDNSPolicy
function Invoke-NSAddDNSPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler dnspolicy resource.
    .DESCRIPTION
        Configuration for DNS policy resource.
    .PARAMETER ActionName
        Name of the DNS action to perform when the rule evaluates to TRUE. The built in actions function as follows: * dns_default_act_Drop. Drop the DNS request. * dns_default_act_Cachebypass. Bypass the DNS cache and forward the request to the name server. You can create custom actions by using the add dns action command in the CLI or the DNS > Actions > Create DNS Action dialog box in the Citrix ADC configuration utility.
    .PARAMETER CacheBypass
        By pass dns cache for this. Possible values = YES, NO
    .PARAMETER Drop
        The dns packet must be dropped. Possible values = YES, NO
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the DNS policy.
    .PARAMETER Preferredlocation
        The location used for the given policy. This is deprecated attribute. Please use -prefLocList.
    .PARAMETER PreferredloCLISt
        The location list in priority order used for the given policy. Minimum length = 1
    .PARAMETER Rule
        Expression against which DNS traffic is evaluated. Note: * On the command line interface, if the expression includes blank spaces, the entire expression must be enclosed in double quotation marks. * If the expression itself includes double quotation marks, you must escape the quotations by using the character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks. Example: CLIENT.UDP.DNS.DOMAIN.EQ("domainname").
    .PARAMETER ViewName
        The view name that must be used for the given policy.
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
        Invoke-NSAddDNSPolicy -Name 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSPolicy -Name 'example' -Rule 'example' -WhatIf
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
        [string] $ActionName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CacheBypass,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Drop,

        [Parameter()]
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Preferredlocation,

        [Parameter()]
        [string[]] $PreferredloCLISt,

        [Parameter(Mandatory)]
        [string] $Rule,

        [Parameter()]
        [string] $ViewName,

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
    if ($PSBoundParameters.ContainsKey('ActionName')) { $properties['actionname'] = $ActionName }
    if ($PSBoundParameters.ContainsKey('CacheBypass')) { $properties['cachebypass'] = $CacheBypass }
    if ($PSBoundParameters.ContainsKey('Drop')) { $properties['drop'] = $Drop }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Preferredlocation')) { $properties['preferredlocation'] = $Preferredlocation }
    if ($PSBoundParameters.ContainsKey('PreferredloCLISt')) { $properties['preferredloclist'] = $PreferredloCLISt }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('ViewName')) { $properties['viewname'] = $ViewName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create dnspolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnspolicy -Payload @{ dnspolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSPolicy

# region Invoke-NSAddDNSPolicy64
function Invoke-NSAddDNSPolicy64 {
    <#
    .SYNOPSIS
        Creates a NetScaler dnspolicy64 resource.
    .DESCRIPTION
        Configuration for dns64 policy resource.
    .PARAMETER Action
        Name of the DNS64 action to perform when the rule evaluates to TRUE. The built in actions function as follows: * A default dns64 action with prefix <default prefix> and mapped and exclude are any You can create custom actions by using the add dns action command in the CLI or the DNS64 > Actions > Create DNS64 Action dialog box in the Citrix ADC configuration utility.
    .PARAMETER Name
        Name for the DNS64 policy.
    .PARAMETER Rule
        Expression against which DNS traffic is evaluated. Note: * On the command line interface, if the expression includes blank spaces, the entire expression must be enclosed in double quotation marks. * If the expression itself includes double quotation marks, you must escape the quotations by using the character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks. Example: CLIENT.IP.SRC.IN_SUBENT(23.34.0.0/16).
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
        Invoke-NSAddDNSPolicy64 -Name 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSPolicy64 -Name 'example' -Rule 'example' -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$Name", 'Create dnspolicy64')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnspolicy64 -Payload @{ dnspolicy64 = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSPolicy64 -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSPolicy64

# region Invoke-NSAddDNSPolicyLabel
function Invoke-NSAddDNSPolicyLabel {
    <#
    .SYNOPSIS
        Creates a NetScaler dnspolicylabel resource.
    .DESCRIPTION
        Configuration for dns policy label resource.
    .PARAMETER LabelName
        Name of the dns policy label.
    .PARAMETER TransForm
        The type of transformations allowed by the policies bound to the label. Possible values = dns_req, dns_res
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
        Invoke-NSAddDNSPolicyLabel -LabelName 'example' -TransForm dns_req -PassThru
    .EXAMPLE
        Invoke-NSAddDNSPolicyLabel -LabelName 'example' -TransForm dns_req -WhatIf
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
        [string] $LabelName,

        [Parameter(Mandatory)]
        [ValidateSet('dns_req', 'dns_res')]
        [string] $TransForm,

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
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('TransForm')) { $properties['transform'] = $TransForm }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create dnspolicylabel')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnspolicylabel -Payload @{ dnspolicylabel = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSPolicyLabel -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSPolicyLabel

# region Invoke-NSAddDNSPolicyLabelDNSPolicyBinding
function Invoke-NSAddDNSPolicyLabelDNSPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler dnspolicylabel_dnspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the dnspolicy that can be bound to dnspolicylabel.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER InvokeLabelName
        Name of the label to invoke if the current policy rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the dns policy label.
    .PARAMETER LabelType
        Type of policy label invocation. Possible values = policylabel
    .PARAMETER PolicyName
        The dns policy name.
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
        Invoke-NSAddDNSPolicyLabelDNSPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddDNSPolicyLabelDNSPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -WhatIf
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
        [ValidateSet('policylabel')]
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

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create dnspolicylabel_dnspolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnspolicylabel_dnspolicy_binding -Payload @{ dnspolicylabel_dnspolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSPolicyLabelDNSPolicyBinding -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSPolicyLabelDNSPolicyBinding

# region Invoke-NSAddDNSProfile
function Invoke-NSAddDNSProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsprofile resource.
    .DESCRIPTION
        Configuration for DNS profile resource.
    .PARAMETER CacheecsResponseS
        Cache DNS responses with EDNS Client Subnet(ECS) option in the DNS cache. When disabled, the appliance stops caching responses with ECS option. This is relevant to proxy configuration. Enabling/disabling support of ECS option when Citrix ADC is authoritative for a GSLB domain is supported using a knob in GSLB vserver. In all other modes, ECS option is ignored. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CachenegativeResponseS
        Cache negative responses in the DNS cache. When disabled, the appliance stops caching negative responses except referral records. This applies to all configurations - proxy, end resolver, and forwarder. However, cached responses are not flushed. The appliance does not serve negative responses from the cache until this parameter is enabled again. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CacheRecordS
        Cache resource records in the DNS cache. Applies to resource records obtained through proxy configurations only. End resolver and forwarder configurations always cache records in the DNS cache, and you cannot disable this behavior. When you disable record caching, the appliance stops caching server responses. However, cached records are not flushed. The appliance does not serve requests from the cache until record caching is enabled again. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSAnswerseclogging
        DNS answer section; if enabled, answer section in the response will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSErrorLogging
        DNS error logging; if enabled, whenever error is encountered in DNS module reason for the error will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSExtendedlogging
        DNS extended logging; if enabled, authority and additional section in the response will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSProfileName
        Name of the DNS profile. Minimum length = 1 Maximum length = 127
    .PARAMETER DNSQuerylogging
        DNS query logging; if enabled, DNS query information such as DNS query id, DNS query flags , DNS domain name and DNS query type will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DropMultiQueryRequest
        Drop the DNS requests containing multiple queries. When enabled, DNS requests containing multiple queries will be dropped. In case of proxy configuration by default the DNS request containing multiple queries is forwarded to the backend and in case of ADNS and Resolver configuration NOCODE error response will be sent to the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER InsertEcs
        Insert ECS Option on DNS query. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER MaxCacheableEcsprefixLength
        The maximum ecs prefix length that will be cached. Default value: 32 Minimum value = 0 Maximum value = 32
    .PARAMETER MaxCacheableEcsprefixLength6
        The maximum ecs prefix length that will be cached for IPv6 subnets. Default value: 128 Minimum value = 0 Maximum value = 128
    .PARAMETER Recursiveresolution
        DNS recursive resolution; if enabled, will do recursive resolution for DNS query when the profile is associated with ADNS service, CS Vserver and DNS action. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Replaceecs
        Replace ECS Option on DNS query. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSAddDNSProfile -DNSProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSProfile -DNSProfileName 'example' -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CacheecsResponseS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CachenegativeResponseS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CacheRecordS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSAnswerseclogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSErrorLogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSExtendedlogging,

        [Parameter(Mandatory, Position = 0)]
        [string] $DNSProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSQuerylogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DropMultiQueryRequest,

        [Parameter()]
        [string] $InsertEcs,

        [Parameter()]
        [int] $MaxCacheableEcsprefixLength,

        [Parameter()]
        [int] $MaxCacheableEcsprefixLength6,

        [Parameter()]
        [string] $Recursiveresolution,

        [Parameter()]
        [string] $Replaceecs,

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

    if ($PSBoundParameters.ContainsKey('InsertEcs')) {
        Assert-NSParameterValue -ParameterName 'InsertEcs' -Value $InsertEcs -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Recursiveresolution')) {
        Assert-NSParameterValue -ParameterName 'Recursiveresolution' -Value $Recursiveresolution -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Replaceecs')) {
        Assert-NSParameterValue -ParameterName 'Replaceecs' -Value $Replaceecs -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('CacheecsResponseS')) { $properties['cacheecsresponses'] = $CacheecsResponseS }
    if ($PSBoundParameters.ContainsKey('CachenegativeResponseS')) { $properties['cachenegativeresponses'] = $CachenegativeResponseS }
    if ($PSBoundParameters.ContainsKey('CacheRecordS')) { $properties['cacherecords'] = $CacheRecordS }
    if ($PSBoundParameters.ContainsKey('DNSAnswerseclogging')) { $properties['dnsanswerseclogging'] = $DNSAnswerseclogging }
    if ($PSBoundParameters.ContainsKey('DNSErrorLogging')) { $properties['dnserrorlogging'] = $DNSErrorLogging }
    if ($PSBoundParameters.ContainsKey('DNSExtendedlogging')) { $properties['dnsextendedlogging'] = $DNSExtendedlogging }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('DNSQuerylogging')) { $properties['dnsquerylogging'] = $DNSQuerylogging }
    if ($PSBoundParameters.ContainsKey('DropMultiQueryRequest')) { $properties['dropmultiqueryrequest'] = $DropMultiQueryRequest }
    if ($PSBoundParameters.ContainsKey('InsertEcs')) { $properties['insertecs'] = $InsertEcs }
    if ($PSBoundParameters.ContainsKey('MaxCacheableEcsprefixLength')) { $properties['maxcacheableecsprefixlength'] = $MaxCacheableEcsprefixLength }
    if ($PSBoundParameters.ContainsKey('MaxCacheableEcsprefixLength6')) { $properties['maxcacheableecsprefixlength6'] = $MaxCacheableEcsprefixLength6 }
    if ($PSBoundParameters.ContainsKey('Recursiveresolution')) { $properties['recursiveresolution'] = $Recursiveresolution }
    if ($PSBoundParameters.ContainsKey('Replaceecs')) { $properties['replaceecs'] = $Replaceecs }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$DNSProfileName", 'Create dnsprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsprofile -Payload @{ dnsprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSProfile -DNSProfileName $DNSProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSProfile

# region Invoke-NSAddDNSPTRRecord
function Invoke-NSAddDNSPTRRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsptrrec resource.
    .DESCRIPTION
        Configuration for PTR record resource.
    .PARAMETER Domain
        Domain name for which to configure reverse mapping. Minimum length = 1
    .PARAMETER Reversedomain
        Reversed domain name representation of the IPv4 or IPv6 address for which to create the PTR record. Use the "in-addr.arpa." suffix for IPv4 addresses and the "ip6.arpa." suffix for IPv6 addresses. Minimum length = 1
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSPTRRecord -Reversedomain 'example' -Domain 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSPTRRecord -Reversedomain 'example' -Domain 'example' -WhatIf
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
        [string] $Domain,

        [Parameter(Mandatory, Position = 0)]
        [string] $Reversedomain,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Reversedomain')) { $properties['reversedomain'] = $Reversedomain }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Reversedomain", 'Create dnsptrrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsptrrec -Payload @{ dnsptrrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSPTRRecord -Reversedomain $Reversedomain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSPTRRecord

# region Invoke-NSAddDNSSOARecord
function Invoke-NSAddDNSSOARecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnssoarec resource.
    .DESCRIPTION
        Configuration for SOA record resource.
    .PARAMETER Contact
        Email address of the contact to whom domain issues can be addressed. In the email address, replace the @ sign with a period (.). For example, enter domainadmin.example.com instead of domainadmin@example.com. Minimum length = 1
    .PARAMETER Domain
        Domain name for which to add the SOA record. Minimum length = 1
    .PARAMETER Expire
        Time, in seconds, after which the zone data on a secondary name server can no longer be considered authoritative because all refresh and retry attempts made during the period have failed. After the expiry period, the secondary server stops serving the zone. Typically one week. Not used by the primary server. Default value: 3600 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MinImum
        Default time to live (TTL) for all records in the zone. Can be overridden for individual records. Default value: 5 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER OriginServer
        Domain name of the name server that responds authoritatively for the domain. Minimum length = 1
    .PARAMETER Refresh
        Time, in seconds, for which a secondary server must wait between successive checks on the value of the serial number. Default value: 3600 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Retry
        Time, in seconds, between retries if a secondary server's attempt to contact the primary server for a zone refresh fails. Default value: 3 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Serial
        The secondary server uses this parameter to determine whether it requires a zone transfer from the primary server. Default value: 100 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSSOARecord -Domain 'example' -Contact 'example' -OriginServer 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSSOARecord -Domain 'example' -Contact 'example' -OriginServer 'example' -WhatIf
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
        [string] $Contact,

        [Parameter(Mandatory, Position = 0)]
        [string] $Domain,

        [Parameter()]
        [int] $Expire,

        [Parameter()]
        [int] $MinImum,

        [Parameter(Mandatory)]
        [string] $OriginServer,

        [Parameter()]
        [int] $Refresh,

        [Parameter()]
        [int] $Retry,

        [Parameter()]
        [int] $Serial,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Contact')) { $properties['contact'] = $Contact }
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Expire')) { $properties['expire'] = $Expire }
    if ($PSBoundParameters.ContainsKey('MinImum')) { $properties['minimum'] = $MinImum }
    if ($PSBoundParameters.ContainsKey('OriginServer')) { $properties['originserver'] = $OriginServer }
    if ($PSBoundParameters.ContainsKey('Refresh')) { $properties['refresh'] = $Refresh }
    if ($PSBoundParameters.ContainsKey('Retry')) { $properties['retry'] = $Retry }
    if ($PSBoundParameters.ContainsKey('Serial')) { $properties['serial'] = $Serial }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Create dnssoarec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnssoarec -Payload @{ dnssoarec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSSOARecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSSOARecord

# region Invoke-NSAddDNSSRVRecord
function Invoke-NSAddDNSSRVRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnssrvrec resource.
    .DESCRIPTION
        Configuration for server record resource.
    .PARAMETER Domain
        Domain name, which, by convention, is prefixed by the symbolic name of the desired service and the symbolic name of the desired protocol, each with an underscore (_) prepended. For example, if an SRV-aware client wants to discover a SIP service that is provided over UDP, in the domain example.com, the client performs a lookup for _sip._udp.example.com. Minimum length = 1
    .PARAMETER Port
        Port on which the target host listens for client requests. Minimum value = 0 Maximum value = 65535
    .PARAMETER Priority
        Integer specifying the priority of the target host. The lower the number, the higher the priority. If multiple target hosts have the same priority, selection is based on the Weight parameter. Minimum value = 0 Maximum value = 65535
    .PARAMETER Target
        Target host for the specified service.
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Weight
        Weight for the target host. Aids host selection when two or more hosts have the same priority. A larger number indicates greater weight. Minimum value = 0 Maximum value = 65535
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
        Invoke-NSAddDNSSRVRecord -Domain 'example' -Port 80 -Priority 1 -Target 'example' -Weight 1 -PassThru
    .EXAMPLE
        Invoke-NSAddDNSSRVRecord -Domain 'example' -Port 80 -Priority 1 -Target 'example' -Weight 1 -WhatIf
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [int] $Port,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter(Mandatory)]
        [string] $Target,

        [Parameter()]
        [int] $Ttl,

        [Parameter(Mandatory)]
        [int] $Weight,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Target')) { $properties['target'] = $Target }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Create dnssrvrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnssrvrec -Payload @{ dnssrvrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSSRVRecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSSRVRecord

# region Invoke-NSAddDNSSuffix
function Invoke-NSAddDNSSuffix {
    <#
    .SYNOPSIS
        Creates a NetScaler dnssuffix resource.
    .DESCRIPTION
        Configuration for DNS suffix resource.
    .PARAMETER DNSSuffix
        Suffix to be appended when resolving domain names that are not fully qualified. Minimum length = 1
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
        Invoke-NSAddDNSSuffix -DNSSuffix 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSSuffix -DNSSuffix 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Position = 0)]
        [string] $DNSSuffix,

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
    if ($PSBoundParameters.ContainsKey('DNSSuffix')) { $properties['Dnssuffix'] = $DNSSuffix }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$DNSSuffix", 'Create dnssuffix')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnssuffix -Payload @{ dnssuffix = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSSuffix -DNSSuffix $DNSSuffix -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSSuffix

# region Invoke-NSAddDNSTXTRecord
function Invoke-NSAddDNSTXTRecord {
    <#
    .SYNOPSIS
        Creates a NetScaler dnstxtrec resource.
    .DESCRIPTION
        Configuration for TXT record resource.
    .PARAMETER Domain
        Name of the domain for the TXT record. Minimum length = 1
    .PARAMETER String
        Information to store in the TXT resource record. Enclose the string in single or double quotation marks. A TXT resource record can contain up to six strings, each of which can contain up to 255 characters. If you want to add a string of more than 255 characters, evaluate whether splitting it into two or more smaller strings, subject to the six-string limit, works for you. Maximum length = 255
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSAddDNSTXTRecord -Domain 'example' -String 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSTXTRecord -Domain 'example' -String 'example' -WhatIf
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string[]] $String,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('String')) { $properties['String'] = $String }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Create dnstxtrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnstxtrec -Payload @{ dnstxtrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSTXTRecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSTXTRecord

# region Invoke-NSAddDNSView
function Invoke-NSAddDNSView {
    <#
    .SYNOPSIS
        Creates a NetScaler dnsview resource.
    .DESCRIPTION
        Configuration for DNS view resource.
    .PARAMETER ViewName
        Name for the DNS view. Minimum length = 1
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
        Invoke-NSAddDNSView -ViewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddDNSView -ViewName 'example' -WhatIf
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
        [string] $ViewName,

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
    if ($PSBoundParameters.ContainsKey('ViewName')) { $properties['viewname'] = $ViewName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ViewName", 'Create dnsview')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsview -Payload @{ dnsview = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSView -ViewName $ViewName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSView

# region Invoke-NSAddDNSZone
function Invoke-NSAddDNSZone {
    <#
    .SYNOPSIS
        Creates a NetScaler dnszone resource.
    .DESCRIPTION
        Configuration for DNS zone resource.
    .PARAMETER DNSSecoffload
        Enable dnssec offload for this zone. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Nsec
        Enable nsec generation for dnssec offload. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ProxyMode
        Deploy the zone in proxy mode. Enable in the following scenarios: * The load balanced DNS servers are authoritative for the zone and all resource records that are part of the zone. * The load balanced DNS servers are authoritative for the zone, but the Citrix ADC owns a subset of the resource records that belong to the zone (partial zone ownership configuration). Typically seen in global server load balancing (GSLB) configurations, in which the appliance responds authoritatively to queries for GSLB domain names but forwards queries for other domain names in the zone to the load balanced servers. In either scenario, do not create the zone's Start of Authority (SOA) and name server (NS) resource records on the appliance. Disable if the appliance is authoritative for the zone, but make sure that you have created the SOA and NS records on the appliance before you create the zone. Default value: YES Possible values = YES, NO
    .PARAMETER ZoneName
        Name of the zone to create. Minimum length = 1
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
        Invoke-NSAddDNSZone -ZoneName 'example' -ProxyMode YES -PassThru
    .EXAMPLE
        Invoke-NSAddDNSZone -ZoneName 'example' -ProxyMode YES -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSSecoffload,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Nsec,

        [Parameter(Mandatory)]
        [ValidateSet('YES', 'NO')]
        [string] $ProxyMode,

        [Parameter(Mandatory, Position = 0)]
        [string] $ZoneName,

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
    if ($PSBoundParameters.ContainsKey('DNSSecoffload')) { $properties['dnssecoffload'] = $DNSSecoffload }
    if ($PSBoundParameters.ContainsKey('Nsec')) { $properties['nsec'] = $Nsec }
    if ($PSBoundParameters.ContainsKey('ProxyMode')) { $properties['proxymode'] = $ProxyMode }
    if ($PSBoundParameters.ContainsKey('ZoneName')) { $properties['zonename'] = $ZoneName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ZoneName", 'Create dnszone')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnszone -Payload @{ dnszone = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSZone -ZoneName $ZoneName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddDNSZone

# region Invoke-NSCreateDNSKey
function Invoke-NSCreateDNSKey {
    <#
    .SYNOPSIS
        Invokes the create operation for a NetScaler dnskey resource.
    .DESCRIPTION
        Configuration for dns key resource.
    .PARAMETER Algorithm
        Algorithm to generate the key. Default value: NS_DNSKEYALGO_RSASHA1 Possible values = RSASHA1, RSASHA256, RSASHA512
    .PARAMETER FileNamePrefix
        Common prefix for the names of the generated public and private key files and the Delegation Signer (DS) resource record. During key generation, the .key, .private, and .ds suffixes are appended automatically to the file name prefix to produce the names of the public key, the private key, and the DS record, respectively. Minimum length = 1 Maximum length = 55
    .PARAMETER KeySize
        Size of the key, in bits. Default value: 512 Minimum value = 1 Maximum value = 4096
    .PARAMETER KeyType
        Type of key to create. Default value: ZSK Possible values = KSK, KeySigningKey, ZSK, ZoneSigningKey
    .PARAMETER Password
        Passphrase for reading the encrypted public/private DNS keys. Minimum length = 1
    .PARAMETER ZoneName
        Name of the zone for which to create a key. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSCreateDNSKey -Algorithm RSASHA1 -FileNamePrefix 'example' -KeySize 1 -KeyType KSK -ZoneName 'example'
    .EXAMPLE
        Invoke-NSCreateDNSKey -Algorithm RSASHA1 -FileNamePrefix 'example' -KeySize 1 -KeyType KSK -ZoneName 'example' -WhatIf
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
        [ValidateSet('RSASHA1', 'RSASHA256', 'RSASHA512')]
        [string] $Algorithm,

        [Parameter(Mandatory)]
        [string] $FileNamePrefix,

        [Parameter(Mandatory)]
        [int] $KeySize,

        [Parameter(Mandatory)]
        [ValidateSet('KSK', 'KeySigningKey', 'ZSK', 'ZoneSigningKey')]
        [string] $KeyType,

        [Parameter()]
        [string] $Password,

        [Parameter(Mandatory)]
        [string] $ZoneName,

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
        if ($PSBoundParameters.ContainsKey('Algorithm')) { $body['algorithm'] = $Algorithm }
        if ($PSBoundParameters.ContainsKey('FileNamePrefix')) { $body['filenameprefix'] = $FileNamePrefix }
        if ($PSBoundParameters.ContainsKey('KeySize')) { $body['keysize'] = $KeySize }
        if ($PSBoundParameters.ContainsKey('KeyType')) { $body['keytype'] = $KeyType }
        if ($PSBoundParameters.ContainsKey('Password')) { $body['password'] = $Password }
        if ($PSBoundParameters.ContainsKey('ZoneName')) { $body['zonename'] = $ZoneName }

        if ($PSCmdlet.ShouldProcess('dnskey', 'Create dnskey')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnskey -Action create -Payload @{ dnskey = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSCreateDNSKey

# region Invoke-NSDeleteDNSAAAARecord
function Invoke-NSDeleteDNSAAAARecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsaaaarec resource.
    .DESCRIPTION
        Configuration for IPv6 address type record resource.
    .PARAMETER HostName
        Domain name. Minimum length = 1
    .PARAMETER Ecssubnet
        Subnet for which the cached records need to be removed.
    .PARAMETER IPv6Address
        One or more IPv6 addresses to assign to the domain name. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSAAAARecord -HostName '192.0.2.10' -IPv6Address 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSAAAARecord -HostName 'dnsaaaarec_example' | Invoke-NSDeleteDNSAAAARecord -Confirm:$false
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
        [string] $HostName,

        [Parameter()]
        [string] $Ecssubnet,

        [Parameter(Mandatory)]
        [string] $IPv6Address,

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
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($PSBoundParameters.ContainsKey('IPv6Address')) {
            $argumentParts += 'ipv6address:' + $IPv6Address
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$HostName", 'Delete dnsaaaarec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsaaaarec -Resource $HostName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSAAAARecord

# region Invoke-NSDeleteDNSAction
function Invoke-NSDeleteDNSAction {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsaction resource.
    .DESCRIPTION
        Configuration for DNS action resource.
    .PARAMETER ActionName
        Name of the dns action.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSAction -ActionName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSAction -ActionName 'dnsaction_example' | Invoke-NSDeleteDNSAction -Confirm:$false
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
        [string] $ActionName,

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

        if ($PSCmdlet.ShouldProcess("$ActionName", 'Delete dnsaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsaction -Resource $ActionName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSAction

# region Invoke-NSDeleteDNSAction64
function Invoke-NSDeleteDNSAction64 {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsaction64 resource.
    .DESCRIPTION
        Configuration for dns64 action resource.
    .PARAMETER ActionName
        Name of the dns64 action.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSAction64 -ActionName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSAction64 -ActionName 'dnsaction64_example' | Invoke-NSDeleteDNSAction64 -Confirm:$false
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
        [string] $ActionName,

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

        if ($PSCmdlet.ShouldProcess("$ActionName", 'Delete dnsaction64')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsaction64 -Resource $ActionName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSAction64

# region Invoke-NSDeleteDNSAddRecord
function Invoke-NSDeleteDNSAddRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsaddrec resource.
    .DESCRIPTION
        Configuration for address type record resource.
    .PARAMETER HostName
        Domain name. Minimum length = 1
    .PARAMETER Ecssubnet
        Subnet for which the cached address records need to be removed.
    .PARAMETER Ipaddress
        One or more IPv4 addresses to assign to the domain name. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSAddRecord -HostName '192.0.2.10' -Ipaddress 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSAddRecord -HostName 'dnsaddrec_example' | Invoke-NSDeleteDNSAddRecord -Confirm:$false
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
        [string] $HostName,

        [Parameter()]
        [string] $Ecssubnet,

        [Parameter(Mandatory)]
        [string] $Ipaddress,

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
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($PSBoundParameters.ContainsKey('Ipaddress')) {
            $argumentParts += 'ipaddress:' + $Ipaddress
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$HostName", 'Delete dnsaddrec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsaddrec -Resource $HostName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSAddRecord

# region Invoke-NSDeleteDNSCAARecord
function Invoke-NSDeleteDNSCAARecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnscaarec resource.
    .DESCRIPTION
        Configuration for CAA record resource.
    .PARAMETER Domain
        Domain name of the CAA record. Minimum length = 1
    .PARAMETER Valuestring
        Value associated with the chosen property tag in the CAA resource record. Enclose the string in single or double quotation marks. Minimum length = 1
    .PARAMETER RecordId
        Unique, internally generated record ID. View the details of the CAA record to obtain its record ID. Records can be removedby either specifying the domain name and record id OR by specifying domain name and all other CAA record attributes as was supplied during the add command. Minimum value = 1 Maximum value = 65535
    .PARAMETER Tag
        String that represents the identifier of the property represented by the CAA record. The RFC currently defines three available tags - issue, issuwild and iodef. Default value: "issue" Minimum length = 1 Maximum length = 255
    .PARAMETER Flag
        Flag associated with the CAA record. Default value: 5 Possible values = NONE, CRITICAL
    .PARAMETER Ecssubnet
        Subnet for which the cached CAA record need to be removed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSCAARecord -Domain 'example' -Valuestring 'example' -RecordId 1 -Tag 'example' -Flag NONE -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSCAARecord -Domain 'dnscaarec_example' | Invoke-NSDeleteDNSCAARecord -Confirm:$false
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string] $Valuestring,

        [Parameter()]
        [int] $RecordId,

        [Parameter()]
        [string] $Tag,

        [Parameter()]
        [ValidateSet('NONE', 'CRITICAL')]
        [string] $Flag,

        [Parameter()]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('Valuestring')) {
            $argumentParts += 'valuestring:' + $Valuestring
        }
        if ($PSBoundParameters.ContainsKey('RecordId')) {
            $argumentParts += 'recordid:' + $RecordId
        }
        if ($PSBoundParameters.ContainsKey('Tag')) {
            $argumentParts += 'tag:' + $Tag
        }
        if ($PSBoundParameters.ContainsKey('Flag')) {
            $argumentParts += 'flag:' + $Flag
        }
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Delete dnscaarec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnscaarec -Resource $Domain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSCAARecord

# region Invoke-NSDeleteDNSCNameRecord
function Invoke-NSDeleteDNSCNameRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnscnamerec resource.
    .DESCRIPTION
        Configuration for CNAME record resource.
    .PARAMETER AliasName
        Alias for the canonical domain name. Minimum length = 1
    .PARAMETER Ecssubnet
        Subnet for which the cached CNAME record need to be removed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSCNameRecord -AliasName 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSCNameRecord -AliasName 'dnscnamerec_example' | Invoke-NSDeleteDNSCNameRecord -Confirm:$false
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
        [string] $AliasName,

        [Parameter()]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$AliasName", 'Delete dnscnamerec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnscnamerec -Resource $AliasName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSCNameRecord

# region Invoke-NSDeleteDNSGlobalDNSPolicyBinding
function Invoke-NSDeleteDNSGlobalDNSPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsglobal_dnspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the dnspolicy that can be bound to dnsglobal.
    .PARAMETER PolicyName
        Name of the dns policy.
    .PARAMETER Type
        Type of global bind point for which to show bound policies. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSGlobalDNSPolicyBinding -PolicyName 'example' -Type REQ_OVERRIDE -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSGlobalDNSPolicyBinding  | Invoke-NSDeleteDNSGlobalDNSPolicyBinding -Confirm:$false
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('dnsglobal_dnspolicy_binding', 'Delete dnsglobal_dnspolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsglobal_dnspolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSGlobalDNSPolicyBinding

# region Invoke-NSDeleteDNSKey
function Invoke-NSDeleteDNSKey {
    <#
    .SYNOPSIS
        Removes a NetScaler dnskey resource.
    .DESCRIPTION
        Configuration for dns key resource.
    .PARAMETER KeyName
        Name of the public-private key pair to publish in the zone. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSKey -KeyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSKey -KeyName 'dnskey_example' | Invoke-NSDeleteDNSKey -Confirm:$false
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
        [string] $KeyName,

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

        if ($PSCmdlet.ShouldProcess("$KeyName", 'Delete dnskey')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnskey -Resource $KeyName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSKey

# region Invoke-NSDeleteDNSMXRecord
function Invoke-NSDeleteDNSMXRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsmxrec resource.
    .DESCRIPTION
        Configuration for MX record resource.
    .PARAMETER Domain
        Domain name for which to add the MX record. Minimum length = 1
    .PARAMETER Mx
        Host name of the mail exchange server. Minimum length = 1
    .PARAMETER Ecssubnet
        Subnet for which the cached MX record need to be removed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSMXRecord -Domain 'example' -Mx 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSMXRecord -Domain 'dnsmxrec_example' | Invoke-NSDeleteDNSMXRecord -Confirm:$false
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string] $Mx,

        [Parameter()]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('Mx')) {
            $argumentParts += 'mx:' + $Mx
        }
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Delete dnsmxrec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsmxrec -Resource $Domain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSMXRecord

# region Invoke-NSDeleteDNSNameServer
function Invoke-NSDeleteDNSNameServer {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsnameserver resource.
    .DESCRIPTION
        Configuration for name server resource.
    .PARAMETER Ip
        IP address of an external name server or, if the Local parameter is set, IP address of a local DNS server (LDNS). Minimum length = 1
    .PARAMETER DNSVServerName
        Name of a DNS virtual server. Overrides any IP address-based name servers configured on the Citrix ADC. Minimum length = 1
    .PARAMETER Type
        Protocol used by the name server. UDP_TCP is not valid if the name server is a DNS virtual server configured on the appliance. Default value: UDP Possible values = UDP, TCP, UDP_TCP
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSNameServer -Ip 'example' -DNSVServerName 'example' -Type UDP -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSNameServer -Ip 'dnsnameserver_example' | Invoke-NSDeleteDNSNameServer -Confirm:$false
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
        [string] $Ip,

        [Parameter()]
        [string] $DNSVServerName,

        [Parameter()]
        [ValidateSet('UDP', 'TCP', 'UDP_TCP')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('DNSVServerName')) {
            $argumentParts += 'dnsvservername:' + $DNSVServerName
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Ip", 'Delete dnsnameserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsnameserver -Resource $Ip -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSNameServer

# region Invoke-NSDeleteDNSNAPTRRecord
function Invoke-NSDeleteDNSNAPTRRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsnaptrrec resource.
    .DESCRIPTION
        Configuration for NAPTR record resource.
    .PARAMETER Domain
        Name of the domain for the NAPTR record. Minimum length = 1
    .PARAMETER Order
        An integer specifying the order in which the NAPTR records MUST be processed in order to accurately represent the ordered list of Rules. The ordering is from lowest to highest. Minimum value = 0 Maximum value = 65535
    .PARAMETER RecordId
        Unique, internally generated record ID. View the details of the naptr record to obtain its record ID. Records can be removed by either specifying the domain name and record id OR by specifying domain name and all other naptr record attributes as was supplied during the add command. Minimum value = 1 Maximum value = 65535
    .PARAMETER Ecssubnet
        Subnet for which the cached NAPTR record need to be removed.
    .PARAMETER Preference
        An integer specifying the preference of this NAPTR among NAPTR records having same order. lower the number, higher the preference. Minimum value = 0 Maximum value = 65535
    .PARAMETER Flags
        flags for this NAPTR. Maximum length = 255
    .PARAMETER ServiceS
        Service Parameters applicable to this delegation path. Maximum length = 255
    .PARAMETER Regexp
        The regular expression, that specifies the substitution expression for this NAPTR. Maximum length = 255
    .PARAMETER Replacement
        The replacement domain name for this NAPTR. Maximum length = 255
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSNAPTRRecord -Domain 'example' -Order 1 -Preference 1 -RecordId 1 -Ecssubnet 'example' -Flags 'example' -ServiceS 'example' -Regexp 'example' -Replacement 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSNAPTRRecord -Domain 'dnsnaptrrec_example' | Invoke-NSDeleteDNSNAPTRRecord -Confirm:$false
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [int] $Order,

        [Parameter()]
        [int] $RecordId,

        [Parameter()]
        [string] $Ecssubnet,

        [Parameter(Mandatory)]
        [int] $Preference,

        [Parameter()]
        [string] $Flags,

        [Parameter()]
        [string] $ServiceS,

        [Parameter()]
        [string] $Regexp,

        [Parameter()]
        [string] $Replacement,

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
        if ($PSBoundParameters.ContainsKey('Order')) {
            $argumentParts += 'order:' + $Order
        }
        if ($PSBoundParameters.ContainsKey('RecordId')) {
            $argumentParts += 'recordid:' + $RecordId
        }
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($PSBoundParameters.ContainsKey('Preference')) {
            $argumentParts += 'preference:' + $Preference
        }
        if ($PSBoundParameters.ContainsKey('Flags')) {
            $argumentParts += 'flags:' + $Flags
        }
        if ($PSBoundParameters.ContainsKey('ServiceS')) {
            $argumentParts += 'services:' + $ServiceS
        }
        if ($PSBoundParameters.ContainsKey('Regexp')) {
            $argumentParts += 'regexp:' + $Regexp
        }
        if ($PSBoundParameters.ContainsKey('Replacement')) {
            $argumentParts += 'replacement:' + $Replacement
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Delete dnsnaptrrec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsnaptrrec -Resource $Domain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSNAPTRRecord

# region Invoke-NSDeleteDNSNSRecord
function Invoke-NSDeleteDNSNSRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsnsrec resource.
    .DESCRIPTION
        Configuration for name server record resource.
    .PARAMETER Domain
        Domain name. Minimum length = 1
    .PARAMETER NameServer
        Host name of the name server to add to the domain. Minimum length = 1
    .PARAMETER Ecssubnet
        Subnet for which the cached name server record need to be removed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSNSRecord -Domain 'example' -NameServer 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSNSRecord -Domain 'dnsnsrec_example' | Invoke-NSDeleteDNSNSRecord -Confirm:$false
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string] $NameServer,

        [Parameter()]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('NameServer')) {
            $argumentParts += 'nameserver:' + $NameServer
        }
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Delete dnsnsrec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsnsrec -Resource $Domain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSNSRecord

# region Invoke-NSDeleteDNSPolicy
function Invoke-NSDeleteDNSPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler dnspolicy resource.
    .DESCRIPTION
        Configuration for DNS policy resource.
    .PARAMETER Name
        Name for the DNS policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSPolicy -Name 'dnspolicy_example' | Invoke-NSDeleteDNSPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete dnspolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnspolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSPolicy

# region Invoke-NSDeleteDNSPolicy64
function Invoke-NSDeleteDNSPolicy64 {
    <#
    .SYNOPSIS
        Removes a NetScaler dnspolicy64 resource.
    .DESCRIPTION
        Configuration for dns64 policy resource.
    .PARAMETER Name
        Name for the DNS64 policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSPolicy64 -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSPolicy64 -Name 'dnspolicy64_example' | Invoke-NSDeleteDNSPolicy64 -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete dnspolicy64')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnspolicy64 -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSPolicy64

# region Invoke-NSDeleteDNSPolicyLabel
function Invoke-NSDeleteDNSPolicyLabel {
    <#
    .SYNOPSIS
        Removes a NetScaler dnspolicylabel resource.
    .DESCRIPTION
        Configuration for dns policy label resource.
    .PARAMETER LabelName
        Name of the dns policy label.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSPolicyLabel -LabelName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabel -LabelName 'dnspolicylabel_example' | Invoke-NSDeleteDNSPolicyLabel -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete dnspolicylabel')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnspolicylabel -Resource $LabelName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSPolicyLabel

# region Invoke-NSDeleteDNSPolicyLabelDNSPolicyBinding
function Invoke-NSDeleteDNSPolicyLabelDNSPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler dnspolicylabel_dnspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the dnspolicy that can be bound to dnspolicylabel.
    .PARAMETER LabelName
        Name of the dns policy label.
    .PARAMETER PolicyName
        The dns policy name.
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
        Invoke-NSDeleteDNSPolicyLabelDNSPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabelDNSPolicyBinding -LabelName 'dnspolicylabel_dnspolicy_binding_example' | Invoke-NSDeleteDNSPolicyLabelDNSPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete dnspolicylabel_dnspolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnspolicylabel_dnspolicy_binding -Resource $LabelName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSPolicyLabelDNSPolicyBinding

# region Invoke-NSDeleteDNSProfile
function Invoke-NSDeleteDNSProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsprofile resource.
    .DESCRIPTION
        Configuration for DNS profile resource.
    .PARAMETER DNSProfileName
        Name of the DNS profile. Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSProfile -DNSProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSProfile -DNSProfileName 'dnsprofile_example' | Invoke-NSDeleteDNSProfile -Confirm:$false
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
        [string] $DNSProfileName,

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

        if ($PSCmdlet.ShouldProcess("$DNSProfileName", 'Delete dnsprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsprofile -Resource $DNSProfileName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSProfile

# region Invoke-NSDeleteDNSPTRRecord
function Invoke-NSDeleteDNSPTRRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsptrrec resource.
    .DESCRIPTION
        Configuration for PTR record resource.
    .PARAMETER Reversedomain
        Reversed domain name representation of the IPv4 or IPv6 address for which to create the PTR record. Use the "in-addr.arpa." suffix for IPv4 addresses and the "ip6.arpa." suffix for IPv6 addresses. Minimum length = 1
    .PARAMETER Ecssubnet
        Subnet for which the cached PTR record need to be removed.
    .PARAMETER Domain
        Domain name for which to configure reverse mapping. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSPTRRecord -Reversedomain 'example' -Domain 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSPTRRecord -Reversedomain 'dnsptrrec_example' | Invoke-NSDeleteDNSPTRRecord -Confirm:$false
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
        [string] $Reversedomain,

        [Parameter()]
        [string] $Ecssubnet,

        [Parameter(Mandatory)]
        [string] $Domain,

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
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($PSBoundParameters.ContainsKey('Domain')) {
            $argumentParts += 'domain:' + $Domain
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Reversedomain", 'Delete dnsptrrec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsptrrec -Resource $Reversedomain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSPTRRecord

# region Invoke-NSDeleteDNSSOARecord
function Invoke-NSDeleteDNSSOARecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnssoarec resource.
    .DESCRIPTION
        Configuration for SOA record resource.
    .PARAMETER Domain
        Domain name for which to add the SOA record. Minimum length = 1
    .PARAMETER Ecssubnet
        Subnet for which the cached SOA record need to be removed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSSOARecord -Domain 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSSOARecord -Domain 'dnssoarec_example' | Invoke-NSDeleteDNSSOARecord -Confirm:$false
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
        [string] $Domain,

        [Parameter()]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Delete dnssoarec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnssoarec -Resource $Domain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSSOARecord

# region Invoke-NSDeleteDNSSRVRecord
function Invoke-NSDeleteDNSSRVRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnssrvrec resource.
    .DESCRIPTION
        Configuration for server record resource.
    .PARAMETER Domain
        Domain name, which, by convention, is prefixed by the symbolic name of the desired service and the symbolic name of the desired protocol, each with an underscore (_) prepended. For example, if an SRV-aware client wants to discover a SIP service that is provided over UDP, in the domain example.com, the client performs a lookup for _sip._udp.example.com. Minimum length = 1
    .PARAMETER Target
        Target host for the specified service.
    .PARAMETER Ecssubnet
        Subnet for which the cached SRV record need to be removed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSSRVRecord -Domain 'example' -Target 'example' -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSSRVRecord -Domain 'dnssrvrec_example' | Invoke-NSDeleteDNSSRVRecord -Confirm:$false
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string] $Target,

        [Parameter()]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('Target')) {
            $argumentParts += 'target:' + $Target
        }
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Delete dnssrvrec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnssrvrec -Resource $Domain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSSRVRecord

# region Invoke-NSDeleteDNSSuffix
function Invoke-NSDeleteDNSSuffix {
    <#
    .SYNOPSIS
        Removes a NetScaler dnssuffix resource.
    .DESCRIPTION
        Configuration for DNS suffix resource.
    .PARAMETER DNSSuffix
        Suffix to be appended when resolving domain names that are not fully qualified. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSSuffix -DNSSuffix 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSSuffix -DNSSuffix 'dnssuffix_example' | Invoke-NSDeleteDNSSuffix -Confirm:$false
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
        [string] $DNSSuffix,

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

        if ($PSCmdlet.ShouldProcess("$DNSSuffix", 'Delete dnssuffix')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnssuffix -Resource $DNSSuffix -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSSuffix

# region Invoke-NSDeleteDNSTXTRecord
function Invoke-NSDeleteDNSTXTRecord {
    <#
    .SYNOPSIS
        Removes a NetScaler dnstxtrec resource.
    .DESCRIPTION
        Configuration for TXT record resource.
    .PARAMETER Domain
        Name of the domain for the TXT record. Minimum length = 1
    .PARAMETER String
        Information to store in the TXT resource record. Enclose the string in single or double quotation marks. A TXT resource record can contain up to six strings, each of which can contain up to 255 characters. If you want to add a string of more than 255 characters, evaluate whether splitting it into two or more smaller strings, subject to the six-string limit, works for you. Maximum length = 255
    .PARAMETER RecordId
        Unique, internally generated record ID. View the details of the TXT record to obtain its record ID. Mutually exclusive with the string parameter. Minimum value = 1 Maximum value = 65535
    .PARAMETER Ecssubnet
        Subnet for which the cached TXT record need to be removed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSTXTRecord -Domain 'example' -String 'example' -RecordId 1 -Ecssubnet 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSTXTRecord -Domain 'dnstxtrec_example' | Invoke-NSDeleteDNSTXTRecord -Confirm:$false
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string[]] $String,

        [Parameter()]
        [int] $RecordId,

        [Parameter()]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('String')) {
            $argumentParts += 'String:' + $String
        }
        if ($PSBoundParameters.ContainsKey('RecordId')) {
            $argumentParts += 'recordid:' + $RecordId
        }
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) {
            $argumentParts += 'ecssubnet:' + $Ecssubnet
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Delete dnstxtrec')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnstxtrec -Resource $Domain -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSTXTRecord

# region Invoke-NSDeleteDNSView
function Invoke-NSDeleteDNSView {
    <#
    .SYNOPSIS
        Removes a NetScaler dnsview resource.
    .DESCRIPTION
        Configuration for DNS view resource.
    .PARAMETER ViewName
        Name for the DNS view. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSView -ViewName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSView -ViewName 'dnsview_example' | Invoke-NSDeleteDNSView -Confirm:$false
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
        [string] $ViewName,

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

        if ($PSCmdlet.ShouldProcess("$ViewName", 'Delete dnsview')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnsview -Resource $ViewName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSView

# region Invoke-NSDeleteDNSZone
function Invoke-NSDeleteDNSZone {
    <#
    .SYNOPSIS
        Removes a NetScaler dnszone resource.
    .DESCRIPTION
        Configuration for DNS zone resource.
    .PARAMETER ZoneName
        Name of the zone to create. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteDNSZone -ZoneName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetDNSZone -ZoneName 'dnszone_example' | Invoke-NSDeleteDNSZone -Confirm:$false
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
        [string] $ZoneName,

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

        if ($PSCmdlet.ShouldProcess("$ZoneName", 'Delete dnszone')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type dnszone -Resource $ZoneName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteDNSZone

# region Invoke-NSDisableDNSNameServer
function Invoke-NSDisableDNSNameServer {
    <#
    .SYNOPSIS
        Disables a NetScaler dnsnameserver resource.
    .DESCRIPTION
        Configuration for name server resource.
    .PARAMETER Ip
        IP address of an external name server or, if the Local parameter is set, IP address of a local DNS server (LDNS). Minimum length = 1
    .PARAMETER DNSVServerName
        Name of a DNS virtual server. Overrides any IP address-based name servers configured on the Citrix ADC. Minimum length = 1
    .PARAMETER Type
        Protocol used by the name server. UDP_TCP is not valid if the name server is a DNS virtual server configured on the appliance. Default value: UDP Possible values = UDP, TCP, UDP_TCP
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
        Invoke-NSDisableDNSNameServer -Ip 'dnsnameserver_example' -PassThru
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
        [string] $Ip,

        [Parameter()]
        [string] $DNSVServerName,

        [Parameter()]
        [ValidateSet('UDP', 'TCP', 'UDP_TCP')]
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

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('Ip')) { $body['ip'] = $Ip }
        if ($PSBoundParameters.ContainsKey('DNSVServerName')) { $body['dnsvservername'] = $DNSVServerName }
        if ($PSBoundParameters.ContainsKey('Type')) { $body['type'] = $Type }

        if ($PSCmdlet.ShouldProcess("$Ip", 'Disable dnsnameserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsnameserver -Action disable -Payload @{ dnsnameserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetDNSNameServer -Ip $Ip -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableDNSNameServer

# region Invoke-NSEnableDNSNameServer
function Invoke-NSEnableDNSNameServer {
    <#
    .SYNOPSIS
        Enables a NetScaler dnsnameserver resource.
    .DESCRIPTION
        Configuration for name server resource.
    .PARAMETER Ip
        IP address of an external name server or, if the Local parameter is set, IP address of a local DNS server (LDNS). Minimum length = 1
    .PARAMETER DNSVServerName
        Name of a DNS virtual server. Overrides any IP address-based name servers configured on the Citrix ADC. Minimum length = 1
    .PARAMETER Type
        Protocol used by the name server. UDP_TCP is not valid if the name server is a DNS virtual server configured on the appliance. Default value: UDP Possible values = UDP, TCP, UDP_TCP
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
        Invoke-NSEnableDNSNameServer -Ip 'dnsnameserver_example' -PassThru
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
        [string] $Ip,

        [Parameter()]
        [string] $DNSVServerName,

        [Parameter()]
        [ValidateSet('UDP', 'TCP', 'UDP_TCP')]
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

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('Ip')) { $body['ip'] = $Ip }
        if ($PSBoundParameters.ContainsKey('DNSVServerName')) { $body['dnsvservername'] = $DNSVServerName }
        if ($PSBoundParameters.ContainsKey('Type')) { $body['type'] = $Type }

        if ($PSCmdlet.ShouldProcess("$Ip", 'Enable dnsnameserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsnameserver -Action enable -Payload @{ dnsnameserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetDNSNameServer -Ip $Ip -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableDNSNameServer

# region Invoke-NSFlushDNSSubnetCache
function Invoke-NSFlushDNSSubnetCache {
    <#
    .SYNOPSIS
        Clears NetScaler dnssubnetcache cache data.
    .DESCRIPTION
        Configuration for subnet cache resource.
    .PARAMETER All
        Flush all the ECS subnets from the DNS cache.
    .PARAMETER Ecssubnet
        ECS Subnet.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSFlushDNSSubnetCache -Ecssubnet 'example'
    .EXAMPLE
        Invoke-NSFlushDNSSubnetCache -Ecssubnet 'example' -WhatIf
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
        [bool] $All,

        [Parameter(Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Ecssubnet,

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
        if ($PSBoundParameters.ContainsKey('All')) { $body['all'] = $All }
        if ($PSBoundParameters.ContainsKey('Ecssubnet')) { $body['ecssubnet'] = $Ecssubnet }

        if ($PSCmdlet.ShouldProcess('dnssubnetcache', 'Clear dnssubnetcache')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnssubnetcache -Action flush -Payload @{ dnssubnetcache = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSFlushDNSSubnetCache

# region Invoke-NSGetDNSAAAARecord
function Invoke-NSGetDNSAAAARecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnsaaaarec configuration.
    .DESCRIPTION
        Configuration for IPv6 address type record resource.
    .PARAMETER HostName
        Domain name. Minimum length = 1
    .PARAMETER IPv6Address
        One or more IPv6 addresses to assign to the domain name. Minimum length = 1
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSAAAARecord
    .EXAMPLE
        Invoke-NSGetDNSAAAARecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $HostName,

        [Parameter(ParameterSetName = 'All')]
        [string] $IPv6Address,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('HostName')) {
            $argumentValue = $HostName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'hostname:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('IPv6Address')) {
            $argumentValue = $IPv6Address
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'ipv6address:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnsaaaarec'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSAAAARecord

# region Invoke-NSGetDNSAction
function Invoke-NSGetDNSAction {
    <#
    .SYNOPSIS
        Gets NetScaler dnsaction configuration.
    .DESCRIPTION
        Configuration for DNS action resource.
    .PARAMETER ActionName
        Name of the dns action.
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
        Invoke-NSGetDNSAction
    .EXAMPLE
        Invoke-NSGetDNSAction -ActionName 'dnsaction_example'
    .EXAMPLE
        Invoke-NSGetDNSAction -Filter @{ servicetype = 'HTTP' }
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
        [string] $ActionName,

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
            Type = 'dnsaction'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ActionName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSAction

# region Invoke-NSGetDNSAction64
function Invoke-NSGetDNSAction64 {
    <#
    .SYNOPSIS
        Gets NetScaler dnsaction64 configuration.
    .DESCRIPTION
        Configuration for dns64 action resource.
    .PARAMETER ActionName
        Name of the dns64 action.
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
        Invoke-NSGetDNSAction64
    .EXAMPLE
        Invoke-NSGetDNSAction64 -ActionName 'dnsaction64_example'
    .EXAMPLE
        Invoke-NSGetDNSAction64 -Filter @{ servicetype = 'HTTP' }
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
        [string] $ActionName,

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
            Type = 'dnsaction64'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ActionName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSAction64

# region Invoke-NSGetDNSAddRecord
function Invoke-NSGetDNSAddRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnsaddrec configuration.
    .DESCRIPTION
        Configuration for address type record resource.
    .PARAMETER HostName
        Domain name. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        The address record type. The type can take 3 values: ADNS - If this is specified, all of the authoritative address records will be displayed. PROXY - If this is specified, all of the proxy address records will be displayed. ALL - If this is specified, all of the address records will be displayed. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSAddRecord
    .EXAMPLE
        Invoke-NSGetDNSAddRecord -HostName 'dnsaddrec_example'
    .EXAMPLE
        Invoke-NSGetDNSAddRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $HostName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnsaddrec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $HostName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSAddRecord

# region Invoke-NSGetDNSCAARecord
function Invoke-NSGetDNSCAARecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnscaarec configuration.
    .DESCRIPTION
        Configuration for CAA record resource.
    .PARAMETER Domain
        Domain name of the CAA record. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Default value: ADNS Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSCAARecord
    .EXAMPLE
        Invoke-NSGetDNSCAARecord -Domain 'dnscaarec_example'
    .EXAMPLE
        Invoke-NSGetDNSCAARecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Domain,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnscaarec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Domain
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSCAARecord

# region Invoke-NSGetDNSCNameRecord
function Invoke-NSGetDNSCNameRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnscnamerec configuration.
    .DESCRIPTION
        Configuration for CNAME record resource.
    .PARAMETER AliasName
        Alias for the canonical domain name. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Default value: ADNS Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSCNameRecord
    .EXAMPLE
        Invoke-NSGetDNSCNameRecord -AliasName 'dnscnamerec_example'
    .EXAMPLE
        Invoke-NSGetDNSCNameRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $AliasName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnscnamerec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $AliasName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSCNameRecord

# region Invoke-NSGetDNSDsFile
function Invoke-NSGetDNSDsFile {
    <#
    .SYNOPSIS
        Gets NetScaler dnsdsfile configuration.
    .DESCRIPTION
        Configuration for dnskey dsfile resource.
    .PARAMETER KeyName
        Name of the DNS key. Minimum length = 1
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
        Invoke-NSGetDNSDsFile
    .EXAMPLE
        Invoke-NSGetDNSDsFile -Filter @{ servicetype = 'HTTP' }
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
        [string] $KeyName,

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
        if ($PSBoundParameters.ContainsKey('KeyName')) {
            $argumentValue = $KeyName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'keyname:' + $argumentValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'dnsdsfile'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSDsFile

# region Invoke-NSGetDNSGlobalBinding
function Invoke-NSGetDNSGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnsglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to dnsglobal.
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
        Invoke-NSGetDNSGlobalBinding
    .EXAMPLE
        Invoke-NSGetDNSGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnsglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSGlobalBinding

# region Invoke-NSGetDNSGlobalDNSPolicyBinding
function Invoke-NSGetDNSGlobalDNSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnsglobal_dnspolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the dnspolicy that can be bound to dnsglobal.
    .PARAMETER Type
        Type of global bind point for which to show bound policies. Possible values = REQ_OVERRIDE, REQ_DEFAULT, RES_OVERRIDE, RES_DEFAULT
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
        Invoke-NSGetDNSGlobalDNSPolicyBinding
    .EXAMPLE
        Invoke-NSGetDNSGlobalDNSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'RES_OVERRIDE', 'RES_DEFAULT')]
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
            Type = 'dnsglobal_dnspolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSGlobalDNSPolicyBinding

# region Invoke-NSGetDNSKey
function Invoke-NSGetDNSKey {
    <#
    .SYNOPSIS
        Gets NetScaler dnskey configuration.
    .DESCRIPTION
        Configuration for dns key resource.
    .PARAMETER KeyName
        Name of the public-private key pair to publish in the zone. Minimum length = 1
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
        Invoke-NSGetDNSKey
    .EXAMPLE
        Invoke-NSGetDNSKey -KeyName 'dnskey_example'
    .EXAMPLE
        Invoke-NSGetDNSKey -Filter @{ servicetype = 'HTTP' }
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
        [string] $KeyName,

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
            Type = 'dnskey'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $KeyName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSKey

# region Invoke-NSGetDNSMXRecord
function Invoke-NSGetDNSMXRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnsmxrec configuration.
    .DESCRIPTION
        Configuration for MX record resource.
    .PARAMETER Domain
        Domain name for which to add the MX record. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Default value: ADNS Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSMXRecord
    .EXAMPLE
        Invoke-NSGetDNSMXRecord -Domain 'dnsmxrec_example'
    .EXAMPLE
        Invoke-NSGetDNSMXRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Domain,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnsmxrec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Domain
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSMXRecord

# region Invoke-NSGetDNSNameServer
function Invoke-NSGetDNSNameServer {
    <#
    .SYNOPSIS
        Gets NetScaler dnsnameserver configuration.
    .DESCRIPTION
        Configuration for name server resource.
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
        Invoke-NSGetDNSNameServer
    .EXAMPLE
        Invoke-NSGetDNSNameServer -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnsnameserver'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSNameServer

# region Invoke-NSGetDNSNAPTRRecord
function Invoke-NSGetDNSNAPTRRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnsnaptrrec configuration.
    .DESCRIPTION
        Configuration for NAPTR record resource.
    .PARAMETER Domain
        Name of the domain for the NAPTR record. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Default value: ADNS Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSNAPTRRecord
    .EXAMPLE
        Invoke-NSGetDNSNAPTRRecord -Domain 'dnsnaptrrec_example'
    .EXAMPLE
        Invoke-NSGetDNSNAPTRRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Domain,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnsnaptrrec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Domain
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSNAPTRRecord

# region Invoke-NSGetDNSNegativecacheRecordS
function Invoke-NSGetDNSNegativecacheRecordS {
    <#
    .SYNOPSIS
        Gets NetScaler dnsnegativecacherecords configuration.
    .DESCRIPTION
        Configuration for Negative Cache Records resource.
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
        Invoke-NSGetDNSNegativecacheRecordS
    .EXAMPLE
        Invoke-NSGetDNSNegativecacheRecordS -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnsnegativecacherecords'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSNegativecacheRecordS

# region Invoke-NSGetDNSNSECRecord
function Invoke-NSGetDNSNSECRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnsnsecrec configuration.
    .DESCRIPTION
        Configuration for 0 resource.
    .PARAMETER HostName
        Name of the domain. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSNSECRecord
    .EXAMPLE
        Invoke-NSGetDNSNSECRecord -HostName 'dnsnsecrec_example'
    .EXAMPLE
        Invoke-NSGetDNSNSECRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $HostName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
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
            Type = 'dnsnsecrec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $HostName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSNSECRecord

# region Invoke-NSGetDNSNSRecord
function Invoke-NSGetDNSNSRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnsnsrec configuration.
    .DESCRIPTION
        Configuration for name server record resource.
    .PARAMETER Domain
        Domain name. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSNSRecord
    .EXAMPLE
        Invoke-NSGetDNSNSRecord -Domain 'dnsnsrec_example'
    .EXAMPLE
        Invoke-NSGetDNSNSRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Domain,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnsnsrec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Domain
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSNSRecord

# region Invoke-NSGetDNSParameter
function Invoke-NSGetDNSParameter {
    <#
    .SYNOPSIS
        Gets NetScaler dnsparameter configuration.
    .DESCRIPTION
        Configuration for DNS parameter resource.
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
        Invoke-NSGetDNSParameter
    .EXAMPLE
        Invoke-NSGetDNSParameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnsparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSParameter

# region Invoke-NSGetDNSPolicy
function Invoke-NSGetDNSPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicy configuration.
    .DESCRIPTION
        Configuration for DNS policy resource.
    .PARAMETER Name
        Name for the DNS policy.
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
        Invoke-NSGetDNSPolicy
    .EXAMPLE
        Invoke-NSGetDNSPolicy -Name 'dnspolicy_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicy'
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
# endregion Invoke-NSGetDNSPolicy

# region Invoke-NSGetDNSPolicy64
function Invoke-NSGetDNSPolicy64 {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicy64 configuration.
    .DESCRIPTION
        Configuration for dns64 policy resource.
    .PARAMETER Name
        Name for the DNS64 policy.
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
        Invoke-NSGetDNSPolicy64
    .EXAMPLE
        Invoke-NSGetDNSPolicy64 -Name 'dnspolicy64_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicy64 -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicy64'
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
# endregion Invoke-NSGetDNSPolicy64

# region Invoke-NSGetDNSPolicy64Binding
function Invoke-NSGetDNSPolicy64Binding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicy64_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to dnspolicy64.
    .PARAMETER Name
        Name of the DNS64 policy.
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
        Invoke-NSGetDNSPolicy64Binding
    .EXAMPLE
        Invoke-NSGetDNSPolicy64Binding -Name 'dnspolicy64_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicy64Binding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicy64_binding'
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
# endregion Invoke-NSGetDNSPolicy64Binding

# region Invoke-NSGetDNSPolicy64LBVServerBinding
function Invoke-NSGetDNSPolicy64LBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicy64_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to dnspolicy64.
    .PARAMETER Name
        Name of the DNS64 policy.
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
        Invoke-NSGetDNSPolicy64LBVServerBinding
    .EXAMPLE
        Invoke-NSGetDNSPolicy64LBVServerBinding -Name 'dnspolicy64_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicy64LBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicy64_lbvserver_binding'
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
# endregion Invoke-NSGetDNSPolicy64LBVServerBinding

# region Invoke-NSGetDNSPolicyBinding
function Invoke-NSGetDNSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to dnspolicy.
    .PARAMETER Name
        Name of the DNS policy.
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
        Invoke-NSGetDNSPolicyBinding
    .EXAMPLE
        Invoke-NSGetDNSPolicyBinding -Name 'dnspolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicy_binding'
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
# endregion Invoke-NSGetDNSPolicyBinding

# region Invoke-NSGetDNSPolicyDNSGlobalBinding
function Invoke-NSGetDNSPolicyDNSGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicy_dnsglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the dnsglobal that can be bound to dnspolicy.
    .PARAMETER Name
        Name of the DNS policy.
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
        Invoke-NSGetDNSPolicyDNSGlobalBinding
    .EXAMPLE
        Invoke-NSGetDNSPolicyDNSGlobalBinding -Name 'dnspolicy_dnsglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicyDNSGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicy_dnsglobal_binding'
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
# endregion Invoke-NSGetDNSPolicyDNSGlobalBinding

# region Invoke-NSGetDNSPolicyDNSPolicyLabelBinding
function Invoke-NSGetDNSPolicyDNSPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicy_dnspolicylabel_binding configuration.
    .DESCRIPTION
        Binding object showing the dnspolicylabel that can be bound to dnspolicy.
    .PARAMETER Name
        Name of the DNS policy.
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
        Invoke-NSGetDNSPolicyDNSPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetDNSPolicyDNSPolicyLabelBinding -Name 'dnspolicy_dnspolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicyDNSPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicy_dnspolicylabel_binding'
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
# endregion Invoke-NSGetDNSPolicyDNSPolicyLabelBinding

# region Invoke-NSGetDNSPolicyLabel
function Invoke-NSGetDNSPolicyLabel {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicylabel configuration.
    .DESCRIPTION
        Configuration for dns policy label resource.
    .PARAMETER LabelName
        Name of the dns policy label.
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
        Invoke-NSGetDNSPolicyLabel
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabel -LabelName 'dnspolicylabel_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabel -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicylabel'
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
# endregion Invoke-NSGetDNSPolicyLabel

# region Invoke-NSGetDNSPolicyLabelBinding
function Invoke-NSGetDNSPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicylabel_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to dnspolicylabel.
    .PARAMETER LabelName
        Name of the dns policy label.
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
        Invoke-NSGetDNSPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabelBinding -LabelName 'dnspolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicylabel_binding'
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
# endregion Invoke-NSGetDNSPolicyLabelBinding

# region Invoke-NSGetDNSPolicyLabelDNSPolicyBinding
function Invoke-NSGetDNSPolicyLabelDNSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicylabel_dnspolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the dnspolicy that can be bound to dnspolicylabel.
    .PARAMETER LabelName
        Name of the dns policy label.
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
        Invoke-NSGetDNSPolicyLabelDNSPolicyBinding
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabelDNSPolicyBinding -LabelName 'dnspolicylabel_dnspolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabelDNSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicylabel_dnspolicy_binding'
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
# endregion Invoke-NSGetDNSPolicyLabelDNSPolicyBinding

# region Invoke-NSGetDNSPolicyLabelPolicyBindingBinding
function Invoke-NSGetDNSPolicyLabelPolicyBindingBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnspolicylabel_policybinding_binding configuration.
    .DESCRIPTION
        Binding object showing the policybinding that can be bound to dnspolicylabel.
    .PARAMETER LabelName
        Name of the dns policy label.
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
        Invoke-NSGetDNSPolicyLabelPolicyBindingBinding
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabelPolicyBindingBinding -LabelName 'dnspolicylabel_policybinding_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSPolicyLabelPolicyBindingBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'dnspolicylabel_policybinding_binding'
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
# endregion Invoke-NSGetDNSPolicyLabelPolicyBindingBinding

# region Invoke-NSGetDNSProfile
function Invoke-NSGetDNSProfile {
    <#
    .SYNOPSIS
        Gets NetScaler dnsprofile configuration.
    .DESCRIPTION
        Configuration for DNS profile resource.
    .PARAMETER DNSProfileName
        Name of the DNS profile. Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetDNSProfile
    .EXAMPLE
        Invoke-NSGetDNSProfile -DNSProfileName 'dnsprofile_example'
    .EXAMPLE
        Invoke-NSGetDNSProfile -Filter @{ servicetype = 'HTTP' }
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
        [string] $DNSProfileName,

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
            Type = 'dnsprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $DNSProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSProfile

# region Invoke-NSGetDNSPTRRecord
function Invoke-NSGetDNSPTRRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnsptrrec configuration.
    .DESCRIPTION
        Configuration for PTR record resource.
    .PARAMETER Reversedomain
        Reversed domain name representation of the IPv4 or IPv6 address for which to create the PTR record. Use the "in-addr.arpa." suffix for IPv4 addresses and the "ip6.arpa." suffix for IPv6 addresses. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSPTRRecord
    .EXAMPLE
        Invoke-NSGetDNSPTRRecord -Reversedomain 'dnsptrrec_example'
    .EXAMPLE
        Invoke-NSGetDNSPTRRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Reversedomain,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnsptrrec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Reversedomain
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSPTRRecord

# region Invoke-NSGetDNSResolverentry
function Invoke-NSGetDNSResolverentry {
    <#
    .SYNOPSIS
        Gets NetScaler dnsresolverentry configuration.
    .DESCRIPTION
        Configuration for Active DNS resolution entries resource.
    .PARAMETER Detail
        To get a detailed view of ongoing DNS resolution entries.
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
        Invoke-NSGetDNSResolverentry
    .EXAMPLE
        Invoke-NSGetDNSResolverentry -Filter @{ servicetype = 'HTTP' }
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
        [switch] $Detail,

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
        if ($PSBoundParameters.ContainsKey('Detail')) {
            $argumentValue = $Detail
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'detail:' + $argumentValue
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
            Type = 'dnsresolverentry'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSResolverentry

# region Invoke-NSGetDNSSOARecord
function Invoke-NSGetDNSSOARecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnssoarec configuration.
    .DESCRIPTION
        Configuration for SOA record resource.
    .PARAMETER Domain
        Domain name for which to add the SOA record. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSSOARecord
    .EXAMPLE
        Invoke-NSGetDNSSOARecord -Domain 'dnssoarec_example'
    .EXAMPLE
        Invoke-NSGetDNSSOARecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Domain,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnssoarec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Domain
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSSOARecord

# region Invoke-NSGetDNSSRVRecord
function Invoke-NSGetDNSSRVRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnssrvrec configuration.
    .DESCRIPTION
        Configuration for server record resource.
    .PARAMETER Domain
        Domain name, which, by convention, is prefixed by the symbolic name of the desired service and the symbolic name of the desired protocol, each with an underscore (_) prepended. For example, if an SRV-aware client wants to discover a SIP service that is provided over UDP, in the domain example.com, the client performs a lookup for _sip._udp.example.com. Minimum length = 1
    .PARAMETER Target
        Target host for the specified service.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSSRVRecord
    .EXAMPLE
        Invoke-NSGetDNSSRVRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Domain,

        [Parameter(ParameterSetName = 'All')]
        [string] $Target,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Domain')) {
            $argumentValue = $Domain
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'domain:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Target')) {
            $argumentValue = $Target
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'target:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnssrvrec'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSSRVRecord

# region Invoke-NSGetDNSSubnetCache
function Invoke-NSGetDNSSubnetCache {
    <#
    .SYNOPSIS
        Gets NetScaler dnssubnetcache configuration.
    .DESCRIPTION
        Configuration for subnet cache resource.
    .PARAMETER Ecssubnet
        ECS Subnet.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
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
        Invoke-NSGetDNSSubnetCache
    .EXAMPLE
        Invoke-NSGetDNSSubnetCache -Ecssubnet 'dnssubnetcache_example'
    .EXAMPLE
        Invoke-NSGetDNSSubnetCache -Filter @{ servicetype = 'HTTP' }
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
        [string] $Ecssubnet,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

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
            Type = 'dnssubnetcache'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Ecssubnet
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSSubnetCache

# region Invoke-NSGetDNSSuffix
function Invoke-NSGetDNSSuffix {
    <#
    .SYNOPSIS
        Gets NetScaler dnssuffix configuration.
    .DESCRIPTION
        Configuration for DNS suffix resource.
    .PARAMETER DNSSuffix
        Suffix to be appended when resolving domain names that are not fully qualified. Minimum length = 1
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
        Invoke-NSGetDNSSuffix
    .EXAMPLE
        Invoke-NSGetDNSSuffix -DNSSuffix 'dnssuffix_example'
    .EXAMPLE
        Invoke-NSGetDNSSuffix -Filter @{ servicetype = 'HTTP' }
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
        [string] $DNSSuffix,

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
            Type = 'dnssuffix'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $DNSSuffix
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSSuffix

# region Invoke-NSGetDNSTXTRecord
function Invoke-NSGetDNSTXTRecord {
    <#
    .SYNOPSIS
        Gets NetScaler dnstxtrec configuration.
    .DESCRIPTION
        Configuration for TXT record resource.
    .PARAMETER Domain
        Name of the domain for the TXT record. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of records to display. Available settings function as follows: * ADNS - Display all authoritative address records. * PROXY - Display all proxy address records. * ALL - Display all address records. Default value: ADNS Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSTXTRecord
    .EXAMPLE
        Invoke-NSGetDNSTXTRecord -Domain 'dnstxtrec_example'
    .EXAMPLE
        Invoke-NSGetDNSTXTRecord -Filter @{ servicetype = 'HTTP' }
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
        [string] $Domain,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
        [string] $Type,

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
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentValue = $Type
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'type:' + $argumentValue
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
            Type = 'dnstxtrec'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Domain
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSTXTRecord

# region Invoke-NSGetDNSView
function Invoke-NSGetDNSView {
    <#
    .SYNOPSIS
        Gets NetScaler dnsview configuration.
    .DESCRIPTION
        Configuration for DNS view resource.
    .PARAMETER ViewName
        Name for the DNS view. Minimum length = 1
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
        Invoke-NSGetDNSView
    .EXAMPLE
        Invoke-NSGetDNSView -ViewName 'dnsview_example'
    .EXAMPLE
        Invoke-NSGetDNSView -Filter @{ servicetype = 'HTTP' }
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
        [string] $ViewName,

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
            Type = 'dnsview'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ViewName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSView

# region Invoke-NSGetDNSViewBinding
function Invoke-NSGetDNSViewBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnsview_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to dnsview.
    .PARAMETER ViewName
        Name of the view to display. Minimum length = 1
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
        Invoke-NSGetDNSViewBinding
    .EXAMPLE
        Invoke-NSGetDNSViewBinding -ViewName 'dnsview_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSViewBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ViewName,

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
            Type = 'dnsview_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ViewName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSViewBinding

# region Invoke-NSGetDNSViewDNSPolicyBinding
function Invoke-NSGetDNSViewDNSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnsview_dnspolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the dnspolicy that can be bound to dnsview.
    .PARAMETER ViewName
        Name of the view to display. Minimum length = 1
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
        Invoke-NSGetDNSViewDNSPolicyBinding
    .EXAMPLE
        Invoke-NSGetDNSViewDNSPolicyBinding -ViewName 'dnsview_dnspolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSViewDNSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ViewName,

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
            Type = 'dnsview_dnspolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ViewName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSViewDNSPolicyBinding

# region Invoke-NSGetDNSViewGSLBServiceBinding
function Invoke-NSGetDNSViewGSLBServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnsview_gslbservice_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservice that can be bound to dnsview.
    .PARAMETER ViewName
        Name of the view to display. Minimum length = 1
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
        Invoke-NSGetDNSViewGSLBServiceBinding
    .EXAMPLE
        Invoke-NSGetDNSViewGSLBServiceBinding -ViewName 'dnsview_gslbservice_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSViewGSLBServiceBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ViewName,

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
            Type = 'dnsview_gslbservice_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ViewName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSViewGSLBServiceBinding

# region Invoke-NSGetDNSZone
function Invoke-NSGetDNSZone {
    <#
    .SYNOPSIS
        Gets NetScaler dnszone configuration.
    .DESCRIPTION
        Configuration for DNS zone resource.
    .PARAMETER ZoneName
        Name of the zone to create. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Type
        Type of zone to display. Mutually exclusive with the DNS Zone (zoneName) parameter. Available settings function as follows: * ADNS - Display all the zones for which the Citrix ADC is authoritative. * PROXY - Display all the zones for which the Citrix ADC is functioning as a proxy server. * ALL - Display all the zones configured on the appliance. Possible values = ALL, ADNS, PROXY
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
        Invoke-NSGetDNSZone
    .EXAMPLE
        Invoke-NSGetDNSZone -ZoneName 'dnszone_example'
    .EXAMPLE
        Invoke-NSGetDNSZone -Filter @{ servicetype = 'HTTP' }
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
        [string] $ZoneName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'ADNS', 'PROXY')]
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
            Type = 'dnszone'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ZoneName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSZone

# region Invoke-NSGetDNSZoneBinding
function Invoke-NSGetDNSZoneBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnszone_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to dnszone.
    .PARAMETER ZoneName
        Name of the zone. Mutually exclusive with the type parameter. Minimum length = 1
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
        Invoke-NSGetDNSZoneBinding
    .EXAMPLE
        Invoke-NSGetDNSZoneBinding -ZoneName 'dnszone_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSZoneBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ZoneName,

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
            Type = 'dnszone_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ZoneName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSZoneBinding

# region Invoke-NSGetDNSZoneDNSKeyBinding
function Invoke-NSGetDNSZoneDNSKeyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnszone_dnskey_binding configuration.
    .DESCRIPTION
        Binding object showing the dnskey that can be bound to dnszone.
    .PARAMETER ZoneName
        Name of the zone. Mutually exclusive with the type parameter. Minimum length = 1
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
        Invoke-NSGetDNSZoneDNSKeyBinding
    .EXAMPLE
        Invoke-NSGetDNSZoneDNSKeyBinding -ZoneName 'dnszone_dnskey_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSZoneDNSKeyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ZoneName,

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
            Type = 'dnszone_dnskey_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ZoneName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSZoneDNSKeyBinding

# region Invoke-NSGetDNSZoneDomainBinding
function Invoke-NSGetDNSZoneDomainBinding {
    <#
    .SYNOPSIS
        Gets NetScaler dnszone_domain_binding configuration.
    .DESCRIPTION
        Binding object showing the domain that can be bound to dnszone.
    .PARAMETER ZoneName
        Name of the zone. Mutually exclusive with the type parameter. Minimum length = 1
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
        Invoke-NSGetDNSZoneDomainBinding
    .EXAMPLE
        Invoke-NSGetDNSZoneDomainBinding -ZoneName 'dnszone_domain_binding_example'
    .EXAMPLE
        Invoke-NSGetDNSZoneDomainBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ZoneName,

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
            Type = 'dnszone_domain_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ZoneName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetDNSZoneDomainBinding

# region Invoke-NSImportDNSKey
function Invoke-NSImportDNSKey {
    <#
    .SYNOPSIS
        Imports NetScaler dnskey data.
    .DESCRIPTION
        Configuration for dns key resource.
    .PARAMETER KeyName
        Name of the public-private key pair to publish in the zone. Minimum length = 1
    .PARAMETER Src
        URL (protocol, host, path, and file name) from where the DNS key file will be imported. NOTE: The import fails if the object to be imported is on an HTTPS server that requires client certificate authentication for access. This is a mandatory argument. Minimum length = 1 Maximum length = 2047
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSImportDNSKey -KeyName 'example' -Src 'example'
    .EXAMPLE
        Invoke-NSImportDNSKey -KeyName 'example' -Src 'example' -WhatIf
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
        [string] $KeyName,

        [Parameter(Mandatory)]
        [string] $Src,

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
        if ($PSBoundParameters.ContainsKey('KeyName')) { $body['keyname'] = $KeyName }
        if ($PSBoundParameters.ContainsKey('Src')) { $body['src'] = $Src }

        if ($PSCmdlet.ShouldProcess('dnskey', 'Import dnskey')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnskey -Action Import -Payload @{ dnskey = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSImportDNSKey

# region Invoke-NSRenameDNSPolicyLabel
function Invoke-NSRenameDNSPolicyLabel {
    <#
    .SYNOPSIS
        Renames a NetScaler dnspolicylabel resource.
    .DESCRIPTION
        Configuration for dns policy label resource.
    .PARAMETER LabelName
        Name of the dns policy label.
    .PARAMETER NewName
        The new name of the dns policylabel. Minimum length = 1
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
        Invoke-NSRenameDNSPolicyLabel -LabelName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameDNSPolicyLabel -LabelName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Rename dnspolicylabel')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnspolicylabel -Action rename -Payload @{ dnspolicylabel = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSPolicyLabel -LabelName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameDNSPolicyLabel

# region Invoke-NSSignDNSZone
function Invoke-NSSignDNSZone {
    <#
    .SYNOPSIS
        Invokes the sign operation for a NetScaler dnszone resource.
    .DESCRIPTION
        Configuration for DNS zone resource.
    .PARAMETER KeyName
        Name of the public/private DNS key pair with which to sign the zone. You can sign a zone with up to four keys. Minimum length = 1
    .PARAMETER ZoneName
        Name of the zone to create. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSSignDNSZone -ZoneName 'example'
    .EXAMPLE
        Invoke-NSSignDNSZone -ZoneName 'example' -WhatIf
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
        [string[]] $KeyName,

        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $ZoneName,

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
        if ($PSBoundParameters.ContainsKey('KeyName')) { $body['keyname'] = $KeyName }
        if ($PSBoundParameters.ContainsKey('ZoneName')) { $body['zonename'] = $ZoneName }

        if ($PSCmdlet.ShouldProcess('dnszone', 'Sign dnszone')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnszone -Action sign -Payload @{ dnszone = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSSignDNSZone

# region Invoke-NSUnsetDNSAction
function Invoke-NSUnsetDNSAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnsaction resource properties.
    .DESCRIPTION
        Configuration for DNS action resource.
    .PARAMETER ActionName
        Name of the dns action.
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the transaction for which the action is chosen. Minimum length = 1 Maximum length = 127
    .PARAMETER Ttl
        Time to live, in seconds. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSUnsetDNSAction -ActionName 'example' -DNSProfileName  -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSAction -ActionName 'example' -DNSProfileName  -WhatIf
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
        [string] $ActionName,

        [Parameter()]
        [switch] $DNSProfileName,

        [Parameter()]
        [switch] $Ttl,

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

        $body = @{ actionname = $ActionName }
        if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $body['dnsprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('Ttl')) { $body['ttl'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$ActionName", 'Clear dnsaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsaction -Action unset -Payload @{ dnsaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSAction -ActionName $ActionName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSAction

# region Invoke-NSUnsetDNSAction64
function Invoke-NSUnsetDNSAction64 {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnsaction64 resource properties.
    .DESCRIPTION
        Configuration for dns64 action resource.
    .PARAMETER ActionName
        Name of the dns64 action.
    .PARAMETER Excluderule
        The expression to select the criteria for eliminating the corresponding ipv6 addresses from the response.
    .PARAMETER Mappedrule
        The expression to select the criteria for ipv4 addresses to be used for synthesis. Only if the mappedrule is evaluated to true the corresponding ipv4 address is used for synthesis using respective prefix, otherwise the A RR is discarded.
    .PARAMETER Prefix
        The dns64 prefix to be used if the after evaluating the rules.
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
        Invoke-NSUnsetDNSAction64 -ActionName 'example' -Excluderule  -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSAction64 -ActionName 'example' -Excluderule  -WhatIf
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
        [string] $ActionName,

        [Parameter()]
        [switch] $Excluderule,

        [Parameter()]
        [switch] $Mappedrule,

        [Parameter()]
        [switch] $Prefix,

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

        $body = @{ actionname = $ActionName }
        if ($PSBoundParameters.ContainsKey('Excluderule')) { $body['excluderule'] = $true }
        if ($PSBoundParameters.ContainsKey('Mappedrule')) { $body['mappedrule'] = $true }
        if ($PSBoundParameters.ContainsKey('Prefix')) { $body['prefix'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$ActionName", 'Clear dnsaction64 properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsaction64 -Action unset -Payload @{ dnsaction64 = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSAction64 -ActionName $ActionName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSAction64

# region Invoke-NSUnsetDNSKey
function Invoke-NSUnsetDNSKey {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnskey resource properties.
    .DESCRIPTION
        Configuration for dns key resource.
    .PARAMETER KeyName
        Name of the public-private key pair to publish in the zone. Minimum length = 1
    .PARAMETER Autorollover
        Flag to enable/disable key rollover automatically. Note: * Key name will be appended with _AR1 for successor key. For e.g. current key=k1, successor key=k1_AR1. * Key name can be truncated if current name length is more than 58 bytes to accomodate the suffix. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Expires
        Time period for which to consider the key valid, after the key is used to sign a zone. Default value: 120 Minimum value = 1 Maximum value = 32767
    .PARAMETER Notificationperiod
        Time at which to generate notification of key expiration, specified as number of days, hours, or minutes before expiry. Must be less than the expiry period. The notification is an SNMP trap sent to an SNMP manager. To enable the appliance to send the trap, enable the DNSKEY-EXPIRY SNMP alarm. In case autorollover option is enabled, rollover for successor key will be intiated at this time. No notification trap will be sent. Default value: 7 Minimum value = 1 Maximum value = 32767
    .PARAMETER RolloverMethod
        Method used for automatic rollover. * Key type: ZSK, Method: PrePublication or DoubleSignature. * Key type: KSK, Method: DoubleRRSet. Possible values = PrePublication, DoubleSignature, DoubleRRSet
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the DNSKEY resource record created in the zone. TTL is the time for which the record must be cached by the DNS proxies. If the TTL is not specified, either the DNS zone's minimum TTL or the default value of 3600 is used. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER UnitS1
        Units for the expiry period. Default value: DAYS Possible values = MINUTES, HOURS, DAYS
    .PARAMETER UnitS2
        Units for the notification period. Default value: DAYS Possible values = MINUTES, HOURS, DAYS
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
        Invoke-NSUnsetDNSKey -KeyName 'example' -Autorollover ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSKey -KeyName 'example' -Autorollover ENABLED -WhatIf
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
        [string] $KeyName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Autorollover,

        [Parameter()]
        [switch] $Expires,

        [Parameter()]
        [switch] $Notificationperiod,

        [Parameter()]
        [ValidateSet('PrePublication', 'DoubleSignature', 'DoubleRRSet')]
        [switch] $RolloverMethod,

        [Parameter()]
        [switch] $Ttl,

        [Parameter()]
        [ValidateSet('MINUTES', 'HOURS', 'DAYS')]
        [switch] $UnitS1,

        [Parameter()]
        [ValidateSet('MINUTES', 'HOURS', 'DAYS')]
        [switch] $UnitS2,

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

        $body = @{ keyname = $KeyName }
        if ($PSBoundParameters.ContainsKey('Autorollover')) { $body['autorollover'] = $true }
        if ($PSBoundParameters.ContainsKey('Expires')) { $body['expires'] = $true }
        if ($PSBoundParameters.ContainsKey('Notificationperiod')) { $body['notificationperiod'] = $true }
        if ($PSBoundParameters.ContainsKey('RolloverMethod')) { $body['rollovermethod'] = $true }
        if ($PSBoundParameters.ContainsKey('Ttl')) { $body['ttl'] = $true }
        if ($PSBoundParameters.ContainsKey('UnitS1')) { $body['units1'] = $true }
        if ($PSBoundParameters.ContainsKey('UnitS2')) { $body['units2'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$KeyName", 'Clear dnskey properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnskey -Action unset -Payload @{ dnskey = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSKey -KeyName $KeyName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSKey

# region Invoke-NSUnsetDNSMXRecord
function Invoke-NSUnsetDNSMXRecord {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnsmxrec resource properties.
    .DESCRIPTION
        Configuration for MX record resource.
    .PARAMETER Domain
        Domain name for which to add the MX record. Minimum length = 1
    .PARAMETER Mx
        Host name of the mail exchange server. Minimum length = 1
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSUnsetDNSMXRecord -Domain 'example' -Mx  -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSMXRecord -Domain 'example' -Mx  -WhatIf
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
        [string] $Domain,

        [Parameter()]
        [switch] $Mx,

        [Parameter()]
        [switch] $Ttl,

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

        $body = @{ domain = $Domain }
        if ($PSBoundParameters.ContainsKey('Mx')) { $body['mx'] = $true }
        if ($PSBoundParameters.ContainsKey('Ttl')) { $body['ttl'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Clear dnsmxrec properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsmxrec -Action unset -Payload @{ dnsmxrec = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSMXRecord -Domain $Domain -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSMXRecord

# region Invoke-NSUnsetDNSNameServer
function Invoke-NSUnsetDNSNameServer {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnsnameserver resource properties.
    .DESCRIPTION
        Configuration for name server resource.
    .PARAMETER Ip
        IP address of an external name server or, if the Local parameter is set, IP address of a local DNS server (LDNS). Minimum length = 1
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the name server. Minimum length = 1
    .PARAMETER Type
        Protocol used by the name server. UDP_TCP is not valid if the name server is a DNS virtual server configured on the appliance. Default value: UDP Possible values = UDP, TCP, UDP_TCP
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
        Invoke-NSUnsetDNSNameServer -Ip 'example' -DNSProfileName  -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSNameServer -Ip 'example' -DNSProfileName  -WhatIf
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
        [string] $Ip,

        [Parameter()]
        [switch] $DNSProfileName,

        [Parameter()]
        [ValidateSet('UDP', 'TCP', 'UDP_TCP')]
        [switch] $Type,

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

        $body = @{ ip = $Ip }
        if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $body['dnsprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('Type')) { $body['type'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Ip", 'Clear dnsnameserver properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsnameserver -Action unset -Payload @{ dnsnameserver = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSNameServer -Ip $Ip -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSNameServer

# region Invoke-NSUnsetDNSParameter
function Invoke-NSUnsetDNSParameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnsparameter resource properties.
    .DESCRIPTION
        Configuration for DNS parameter resource.
    .PARAMETER AutosaveKeyOps
        Flag to enable/disable saving of rollover operations executed automatically to avoid config loss. Applicable only when autorollover option is enabled on a key. Note: when you enable this, full configuration will be saved. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cacheecszeroprefix
        Cache ECS responses with a Scope Prefix length of zero. Such a cached response will be used for all queries with this domain name and any subnet. When disabled, ECS responses with Scope Prefix length of zero will be cached, but not tied to any subnet. This option has no effect if caching of ECS responses is disabled in the corresponding DNS profile. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CachehitBypass
        This parameter is applicable only in proxy mode and if this parameter is enabled we will forward all the client requests to the backend DNS server and the response served will be cached on Citrix ADC. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cachenoexpire
        If this flag is set to YES, the existing entries in cache do not age out. On reaching the max limit the cache records are frozen. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CacheRecordS
        Cache resource records in the DNS cache. Applies to resource records obtained through proxy configurations only. End resolver and forwarder configurations always cache records in the DNS cache, and you cannot disable this behavior. When you disable record caching, the appliance stops caching server responses. However, cached records are not flushed. The appliance does not serve requests from the cache until record caching is enabled again. Default value: YES Possible values = YES, NO
    .PARAMETER DNS64Timeout
        While doing DNS64 resolution, this parameter specifies the time to wait before sending an A query if no response is received from backend DNS server for AAAA query. Minimum value = 0 Maximum value = 10000
    .PARAMETER DNSRootreferral
        Send a root referral if a client queries a domain name that is unrelated to the domains configured/cached on the Citrix ADC. If the setting is disabled, the appliance sends a blank response instead of a root referral. Applicable to domains for which the appliance is authoritative. Disable the parameter when the appliance is under attack from a client that is sending a flood of queries for unrelated domains. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSSec
        Enable or disable the Domain Name System Security Extensions (DNSSEC) feature on the appliance. Note: Even when the DNSSEC feature is enabled, forwarder configurations (used by internal Citrix ADC features such as SSL VPN and Cache Redirection for name resolution) do not support the DNSSEC OK (DO) bit in the EDNS0 OPT header. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER EcsMaxSubnets
        Maximum number of subnets that can be cached corresponding to a single domain. Subnet caching will occur for responses with EDNS Client Subnet (ECS) option. Caching of such responses can be disabled using DNS profile settings. A value of zero indicates that the number of subnets cached is limited only by existing memory constraints. The default value is zero. Default value: 0 Minimum value = 0 Maximum value = 1280
    .PARAMETER MaxCachesize
        Maximum memory, in megabytes, that can be used for dns caching per Packet Engine.
    .PARAMETER MaxNegativecachesize
        Maximum memory, in megabytes, that can be used for caching of negative DNS responses per packet engine.
    .PARAMETER MaxNegcachettl
        Maximum time to live (TTL) for all negative records ( NXDONAIN and NODATA ) cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations. If the TTL of a record that is to be cached is higher than the value configured for maxnegcacheTTL, the TTL of the record is set to the value of maxnegcacheTTL before caching. When you modify this setting, the new value is applied only to those records that are cached after the modification. The TTL values of existing records are not changed. Default value: 604800 Minimum value = 1 Maximum value = 604800
    .PARAMETER MaxPipeline
        Maximum number of concurrent DNS requests to allow on a single client connection, which is identified by the <clientip:port>-<vserver ip:port> tuple. A value of 0 (zero) applies no limit to the number of concurrent DNS requests allowed on a single client connection.
    .PARAMETER MaxTtl
        Maximum time to live (TTL) for all records cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations. If the TTL of a record that is to be cached is higher than the value configured for maxTTL, the TTL of the record is set to the value of maxTTL before caching. When you modify this setting, the new value is applied only to those records that are cached after the modification. The TTL values of existing records are not changed. Default value: 604800 Minimum value = 1 Maximum value = 604800
    .PARAMETER MaxUDPPacketsize
        Maximum UDP packet size that can be handled by Citrix ADC. This is the value advertised by Citrix ADC when responding as an authoritative server and it is also used when Citrix ADC queries other name servers as a forwarder. When acting as a proxy, requests from clients are limited by this parameter - if a request contains a size greater than this value in the OPT record, it will be replaced. Default value: 1280 Minimum value = 512 Maximum value = 16384
    .PARAMETER MinTtl
        Minimum permissible time to live (TTL) for all records cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations. If the TTL of a record that is to be cached is lower than the value configured for minTTL, the TTL of the record is set to the value of minTTL before caching. When you modify this setting, the new value is applied only to those records that are cached after the modification. The TTL values of existing records are not changed. Minimum value = 0 Maximum value = 604800
    .PARAMETER NameLookupPriority
        Type of lookup (DNS or WINS) to attempt first. If the first-priority lookup fails, the second-priority lookup is attempted. Used only by the SSL VPN feature. Default value: WINS Possible values = WINS, DNS
    .PARAMETER NxdomainratelimitThreshold
        Rate limit threshold for Non-Existant domain (NXDOMAIN) responses generated from Citrix ADC. Once the threshold is breached , DNS queries leading to NXDOMAIN response will be dropped. This threshold will not be applied for NXDOMAIN responses got from the backend. The threshold will be applied per packet engine and per second.
    .PARAMETER Recursion
        Function as an end resolver and recursively resolve queries for domains that are not hosted on the Citrix ADC. Also resolve queries recursively when the external name servers configured on the appliance (for a forwarder configuration) are unavailable. When external name servers are unavailable, the appliance queries a root server and resolves the request recursively, as it does for an end resolver configuration. This parameter will be effective only for queries recieved on nameserver with local flag. To enable recursion for queries recieved through ADNS service , CS vserver and LB vserver it is recommended to use recursiveResolution parameter on DNS profile. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Resolutionorder
        Type of DNS queries (A, AAAA, or both) to generate during the routine functioning of certain Citrix ADC features, such as SSL VPN, cache redirection, and the integrated cache. The queries are sent to the external name servers that are configured for the forwarder function. If you specify both query types, you can also specify the order. Available settings function as follows: * OnlyAQuery. Send queries for IPv4 address records (A records) only. * OnlyAAAAQuery. Send queries for IPv6 address records (AAAA records) instead of queries for IPv4 address records (A records). * AThenAAAAQuery. Send a query for an A record, and then send a query for an AAAA record if the query for the A record results in a NODATA response from the name server. * AAAAThenAQuery. Send a query for an AAAA record, and then send a query for an A record if the query for the AAAA record results in a NODATA response from the name server. Default value: OnlyAQuery Possible values = OnlyAQuery, OnlyAAAAQuery, AThenAAAAQuery, AAAAThenAQuery
    .PARAMETER ResolverMaxActiveresolutions
        Maximum number of active concurrent DNS resolutions per Packet Engine. Default value: 0
    .PARAMETER ResolverMaxTCPConnectionS
        Maximum DNS-TCP connections opened for recursive resolution per Packet Engine. Default value: 1000 Minimum value = 1
    .PARAMETER ResolverMaxTCPTimeout
        Maximum wait time in seconds for the response on DNS-TCP connection for recursive resolution per Packet Engine. Default value: 5 Minimum value = 1 Maximum value = 120
    .PARAMETER Retries
        Maximum number of retry attempts when no response is received for a query sent to a name server. Applies to end resolver and forwarder configurations. Default value: 5 Minimum value = 1 Maximum value = 5
    .PARAMETER SplitpktqueryProcessIng
        Processing requests split across multiple packets. Default value: ALLOW Possible values = ALLOW, DROP
    .PARAMETER Zonetransfer
        Flag to enable/disable DNS zones configuration transfer to remote GSLB site nodes. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetDNSParameter -AutosaveKeyOps ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSParameter -AutosaveKeyOps ENABLED -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AutosaveKeyOps,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Cacheecszeroprefix,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CachehitBypass,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Cachenoexpire,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $CacheRecordS,

        [Parameter()]
        [switch] $DNS64Timeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSRootreferral,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSSec,

        [Parameter()]
        [switch] $EcsMaxSubnets,

        [Parameter()]
        [switch] $MaxCachesize,

        [Parameter()]
        [switch] $MaxNegativecachesize,

        [Parameter()]
        [switch] $MaxNegcachettl,

        [Parameter()]
        [switch] $MaxPipeline,

        [Parameter()]
        [switch] $MaxTtl,

        [Parameter()]
        [switch] $MaxUDPPacketsize,

        [Parameter()]
        [switch] $MinTtl,

        [Parameter()]
        [ValidateSet('WINS', 'DNS')]
        [switch] $NameLookupPriority,

        [Parameter()]
        [switch] $NxdomainratelimitThreshold,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Recursion,

        [Parameter()]
        [ValidateSet('OnlyAQuery', 'OnlyAAAAQuery', 'AThenAAAAQuery', 'AAAAThenAQuery')]
        [switch] $Resolutionorder,

        [Parameter()]
        [switch] $ResolverMaxActiveresolutions,

        [Parameter()]
        [switch] $ResolverMaxTCPConnectionS,

        [Parameter()]
        [switch] $ResolverMaxTCPTimeout,

        [Parameter()]
        [switch] $Retries,

        [Parameter()]
        [ValidateSet('ALLOW', 'DROP')]
        [switch] $SplitpktqueryProcessIng,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Zonetransfer,

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
        if ($PSBoundParameters.ContainsKey('AutosaveKeyOps')) { $body['autosavekeyops'] = $true }
        if ($PSBoundParameters.ContainsKey('Cacheecszeroprefix')) { $body['cacheecszeroprefix'] = $true }
        if ($PSBoundParameters.ContainsKey('CachehitBypass')) { $body['cachehitbypass'] = $true }
        if ($PSBoundParameters.ContainsKey('Cachenoexpire')) { $body['cachenoexpire'] = $true }
        if ($PSBoundParameters.ContainsKey('CacheRecordS')) { $body['cacherecords'] = $true }
        if ($PSBoundParameters.ContainsKey('DNS64Timeout')) { $body['dns64timeout'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSRootreferral')) { $body['dnsrootreferral'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSSec')) { $body['dnssec'] = $true }
        if ($PSBoundParameters.ContainsKey('EcsMaxSubnets')) { $body['ecsmaxsubnets'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxCachesize')) { $body['maxcachesize'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxNegativecachesize')) { $body['maxnegativecachesize'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxNegcachettl')) { $body['maxnegcachettl'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxPipeline')) { $body['maxpipeline'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxTtl')) { $body['maxttl'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxUDPPacketsize')) { $body['maxudppacketsize'] = $true }
        if ($PSBoundParameters.ContainsKey('MinTtl')) { $body['minttl'] = $true }
        if ($PSBoundParameters.ContainsKey('NameLookupPriority')) { $body['namelookuppriority'] = $true }
        if ($PSBoundParameters.ContainsKey('NxdomainratelimitThreshold')) { $body['nxdomainratelimitthreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('Recursion')) { $body['recursion'] = $true }
        if ($PSBoundParameters.ContainsKey('Resolutionorder')) { $body['resolutionorder'] = $true }
        if ($PSBoundParameters.ContainsKey('ResolverMaxActiveresolutions')) { $body['resolvermaxactiveresolutions'] = $true }
        if ($PSBoundParameters.ContainsKey('ResolverMaxTCPConnectionS')) { $body['resolvermaxtcpconnections'] = $true }
        if ($PSBoundParameters.ContainsKey('ResolverMaxTCPTimeout')) { $body['resolvermaxtcptimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Retries')) { $body['retries'] = $true }
        if ($PSBoundParameters.ContainsKey('SplitpktqueryProcessIng')) { $body['splitpktqueryprocessing'] = $true }
        if ($PSBoundParameters.ContainsKey('Zonetransfer')) { $body['zonetransfer'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('dnsparameter', 'Clear dnsparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsparameter -Action unset -Payload @{ dnsparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSParameter

# region Invoke-NSUnsetDNSPolicy
function Invoke-NSUnsetDNSPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnspolicy resource properties.
    .DESCRIPTION
        Configuration for DNS policy resource.
    .PARAMETER Name
        Name for the DNS policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
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
        Invoke-NSUnsetDNSPolicy -Name 'example' -LogAction  -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSPolicy -Name 'example' -LogAction  -WhatIf
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
        [switch] $LogAction,

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
        if ($PSBoundParameters.ContainsKey('LogAction')) { $body['logaction'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear dnspolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnspolicy -Action unset -Payload @{ dnspolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSPolicy

# region Invoke-NSUnsetDNSProfile
function Invoke-NSUnsetDNSProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnsprofile resource properties.
    .DESCRIPTION
        Configuration for DNS profile resource.
    .PARAMETER DNSProfileName
        Name of the DNS profile. Minimum length = 1 Maximum length = 127
    .PARAMETER CacheecsResponseS
        Cache DNS responses with EDNS Client Subnet(ECS) option in the DNS cache. When disabled, the appliance stops caching responses with ECS option. This is relevant to proxy configuration. Enabling/disabling support of ECS option when Citrix ADC is authoritative for a GSLB domain is supported using a knob in GSLB vserver. In all other modes, ECS option is ignored. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CachenegativeResponseS
        Cache negative responses in the DNS cache. When disabled, the appliance stops caching negative responses except referral records. This applies to all configurations - proxy, end resolver, and forwarder. However, cached responses are not flushed. The appliance does not serve negative responses from the cache until this parameter is enabled again. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CacheRecordS
        Cache resource records in the DNS cache. Applies to resource records obtained through proxy configurations only. End resolver and forwarder configurations always cache records in the DNS cache, and you cannot disable this behavior. When you disable record caching, the appliance stops caching server responses. However, cached records are not flushed. The appliance does not serve requests from the cache until record caching is enabled again. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSAnswerseclogging
        DNS answer section; if enabled, answer section in the response will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSErrorLogging
        DNS error logging; if enabled, whenever error is encountered in DNS module reason for the error will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSExtendedlogging
        DNS extended logging; if enabled, authority and additional section in the response will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSQuerylogging
        DNS query logging; if enabled, DNS query information such as DNS query id, DNS query flags , DNS domain name and DNS query type will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DropMultiQueryRequest
        Drop the DNS requests containing multiple queries. When enabled, DNS requests containing multiple queries will be dropped. In case of proxy configuration by default the DNS request containing multiple queries is forwarded to the backend and in case of ADNS and Resolver configuration NOCODE error response will be sent to the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER InsertEcs
        Insert ECS Option on DNS query. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER MaxCacheableEcsprefixLength
        The maximum ecs prefix length that will be cached. Default value: 32 Minimum value = 0 Maximum value = 32
    .PARAMETER MaxCacheableEcsprefixLength6
        The maximum ecs prefix length that will be cached for IPv6 subnets. Default value: 128 Minimum value = 0 Maximum value = 128
    .PARAMETER Recursiveresolution
        DNS recursive resolution; if enabled, will do recursive resolution for DNS query when the profile is associated with ADNS service, CS Vserver and DNS action. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Replaceecs
        Replace ECS Option on DNS query. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetDNSProfile -DNSProfileName 'example' -CacheecsResponseS ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSProfile -DNSProfileName 'example' -CacheecsResponseS ENABLED -WhatIf
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
        [string] $DNSProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CacheecsResponseS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CachenegativeResponseS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CacheRecordS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSAnswerseclogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSErrorLogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSExtendedlogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSQuerylogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DropMultiQueryRequest,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $InsertEcs,

        [Parameter()]
        [switch] $MaxCacheableEcsprefixLength,

        [Parameter()]
        [switch] $MaxCacheableEcsprefixLength6,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Recursiveresolution,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Replaceecs,

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

        $body = @{ dnsprofilename = $DNSProfileName }
        if ($PSBoundParameters.ContainsKey('CacheecsResponseS')) { $body['cacheecsresponses'] = $true }
        if ($PSBoundParameters.ContainsKey('CachenegativeResponseS')) { $body['cachenegativeresponses'] = $true }
        if ($PSBoundParameters.ContainsKey('CacheRecordS')) { $body['cacherecords'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSAnswerseclogging')) { $body['dnsanswerseclogging'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSErrorLogging')) { $body['dnserrorlogging'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSExtendedlogging')) { $body['dnsextendedlogging'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSQuerylogging')) { $body['dnsquerylogging'] = $true }
        if ($PSBoundParameters.ContainsKey('DropMultiQueryRequest')) { $body['dropmultiqueryrequest'] = $true }
        if ($PSBoundParameters.ContainsKey('InsertEcs')) { $body['insertecs'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxCacheableEcsprefixLength')) { $body['maxcacheableecsprefixlength'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxCacheableEcsprefixLength6')) { $body['maxcacheableecsprefixlength6'] = $true }
        if ($PSBoundParameters.ContainsKey('Recursiveresolution')) { $body['recursiveresolution'] = $true }
        if ($PSBoundParameters.ContainsKey('Replaceecs')) { $body['replaceecs'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$DNSProfileName", 'Clear dnsprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnsprofile -Action unset -Payload @{ dnsprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSProfile -DNSProfileName $DNSProfileName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSProfile

# region Invoke-NSUnsetDNSSOARecord
function Invoke-NSUnsetDNSSOARecord {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnssoarec resource properties.
    .DESCRIPTION
        Configuration for SOA record resource.
    .PARAMETER Domain
        Domain name for which to add the SOA record. Minimum length = 1
    .PARAMETER Expire
        Time, in seconds, after which the zone data on a secondary name server can no longer be considered authoritative because all refresh and retry attempts made during the period have failed. After the expiry period, the secondary server stops serving the zone. Typically one week. Not used by the primary server. Default value: 3600 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MinImum
        Default time to live (TTL) for all records in the zone. Can be overridden for individual records. Default value: 5 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Refresh
        Time, in seconds, for which a secondary server must wait between successive checks on the value of the serial number. Default value: 3600 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Retry
        Time, in seconds, between retries if a secondary server's attempt to contact the primary server for a zone refresh fails. Default value: 3 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Serial
        The secondary server uses this parameter to determine whether it requires a zone transfer from the primary server. Default value: 100 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSUnsetDNSSOARecord -Domain 'example' -Expire  -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSSOARecord -Domain 'example' -Expire  -WhatIf
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
        [string] $Domain,

        [Parameter()]
        [switch] $Expire,

        [Parameter()]
        [switch] $MinImum,

        [Parameter()]
        [switch] $Refresh,

        [Parameter()]
        [switch] $Retry,

        [Parameter()]
        [switch] $Serial,

        [Parameter()]
        [switch] $Ttl,

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

        $body = @{ domain = $Domain }
        if ($PSBoundParameters.ContainsKey('Expire')) { $body['expire'] = $true }
        if ($PSBoundParameters.ContainsKey('MinImum')) { $body['minimum'] = $true }
        if ($PSBoundParameters.ContainsKey('Refresh')) { $body['refresh'] = $true }
        if ($PSBoundParameters.ContainsKey('Retry')) { $body['retry'] = $true }
        if ($PSBoundParameters.ContainsKey('Serial')) { $body['serial'] = $true }
        if ($PSBoundParameters.ContainsKey('Ttl')) { $body['ttl'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Clear dnssoarec properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnssoarec -Action unset -Payload @{ dnssoarec = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSSOARecord -Domain $Domain -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSSOARecord

# region Invoke-NSUnsetDNSSRVRecord
function Invoke-NSUnsetDNSSRVRecord {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnssrvrec resource properties.
    .DESCRIPTION
        Configuration for server record resource.
    .PARAMETER Domain
        Domain name, which, by convention, is prefixed by the symbolic name of the desired service and the symbolic name of the desired protocol, each with an underscore (_) prepended. For example, if an SRV-aware client wants to discover a SIP service that is provided over UDP, in the domain example.com, the client performs a lookup for _sip._udp.example.com. Minimum length = 1
    .PARAMETER Target
        Target host for the specified service.
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSUnsetDNSSRVRecord -Domain 'example' -Target  -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSSRVRecord -Domain 'example' -Target  -WhatIf
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
        [string] $Domain,

        [Parameter()]
        [switch] $Target,

        [Parameter()]
        [switch] $Ttl,

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

        $body = @{ domain = $Domain }
        if ($PSBoundParameters.ContainsKey('Target')) { $body['target'] = $true }
        if ($PSBoundParameters.ContainsKey('Ttl')) { $body['ttl'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Domain", 'Clear dnssrvrec properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnssrvrec -Action unset -Payload @{ dnssrvrec = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSSRVRecord -Domain $Domain -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSSRVRecord

# region Invoke-NSUnsetDNSZone
function Invoke-NSUnsetDNSZone {
    <#
    .SYNOPSIS
        Clears one or more NetScaler dnszone resource properties.
    .DESCRIPTION
        Configuration for DNS zone resource.
    .PARAMETER ZoneName
        Name of the zone to create. Minimum length = 1
    .PARAMETER DNSSecoffload
        Enable dnssec offload for this zone. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Nsec
        Enable nsec generation for dnssec offload. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ProxyMode
        Deploy the zone in proxy mode. Enable in the following scenarios: * The load balanced DNS servers are authoritative for the zone and all resource records that are part of the zone. * The load balanced DNS servers are authoritative for the zone, but the Citrix ADC owns a subset of the resource records that belong to the zone (partial zone ownership configuration). Typically seen in global server load balancing (GSLB) configurations, in which the appliance responds authoritatively to queries for GSLB domain names but forwards queries for other domain names in the zone to the load balanced servers. In either scenario, do not create the zone's Start of Authority (SOA) and name server (NS) resource records on the appliance. Disable if the appliance is authoritative for the zone, but make sure that you have created the SOA and NS records on the appliance before you create the zone. Default value: YES Possible values = YES, NO
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
        Invoke-NSUnsetDNSZone -ZoneName 'example' -DNSSecoffload ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetDNSZone -ZoneName 'example' -DNSSecoffload ENABLED -WhatIf
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
        [string] $ZoneName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSSecoffload,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Nsec,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $ProxyMode,

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

        $body = @{ zonename = $ZoneName }
        if ($PSBoundParameters.ContainsKey('DNSSecoffload')) { $body['dnssecoffload'] = $true }
        if ($PSBoundParameters.ContainsKey('Nsec')) { $body['nsec'] = $true }
        if ($PSBoundParameters.ContainsKey('ProxyMode')) { $body['proxymode'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$ZoneName", 'Clear dnszone properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnszone -Action unset -Payload @{ dnszone = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetDNSZone -ZoneName $ZoneName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetDNSZone

# region Invoke-NSUnsignDNSZone
function Invoke-NSUnsignDNSZone {
    <#
    .SYNOPSIS
        Invokes the unsign operation for a NetScaler dnszone resource.
    .DESCRIPTION
        Configuration for DNS zone resource.
    .PARAMETER KeyName
        Name of the public/private DNS key pair with which to sign the zone. You can sign a zone with up to four keys. Minimum length = 1
    .PARAMETER ZoneName
        Name of the zone to create. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSUnsignDNSZone -ZoneName 'example'
    .EXAMPLE
        Invoke-NSUnsignDNSZone -ZoneName 'example' -WhatIf
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
        [string[]] $KeyName,

        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $ZoneName,

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
        if ($PSBoundParameters.ContainsKey('KeyName')) { $body['keyname'] = $KeyName }
        if ($PSBoundParameters.ContainsKey('ZoneName')) { $body['zonename'] = $ZoneName }

        if ($PSCmdlet.ShouldProcess('dnszone', 'Unsign dnszone')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type dnszone -Action unsign -Payload @{ dnszone = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSUnsignDNSZone

# region Invoke-NSUpdateDNSAction
function Invoke-NSUpdateDNSAction {
    <#
    .SYNOPSIS
        Updates a NetScaler dnsaction resource.
    .DESCRIPTION
        Configuration for DNS action resource.
    .PARAMETER ActionName
        Name of the dns action.
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the transaction for which the action is chosen. Minimum length = 1 Maximum length = 127
    .PARAMETER Ipaddress
        List of IP address to be returned in case of rewrite_response actiontype. They can be of IPV4 or IPV6 type. In case of set command We will remove all the IP address previously present in the action and will add new once given in set dns action command.
    .PARAMETER PreferredloCLISt
        The location list in priority order used for the given action. Minimum length = 1
    .PARAMETER Ttl
        Time to live, in seconds. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER ViewName
        The view name that must be used for the given action.
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
        Invoke-NSUpdateDNSAction -ActionName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSAction -ActionName 'example' -WhatIf
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
        [string] $ActionName,

        [Parameter()]
        [string] $DNSProfileName,

        [Parameter()]
        [string[]] $Ipaddress,

        [Parameter()]
        [string[]] $PreferredloCLISt,

        [Parameter()]
        [int] $Ttl,

        [Parameter()]
        [string] $ViewName,

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
    if ($PSBoundParameters.ContainsKey('ActionName')) { $properties['actionname'] = $ActionName }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('PreferredloCLISt')) { $properties['preferredloclist'] = $PreferredloCLISt }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('ViewName')) { $properties['viewname'] = $ViewName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ActionName", 'Update dnsaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnsaction -Payload @{ dnsaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSAction -ActionName $ActionName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSAction

# region Invoke-NSUpdateDNSAction64
function Invoke-NSUpdateDNSAction64 {
    <#
    .SYNOPSIS
        Updates a NetScaler dnsaction64 resource.
    .DESCRIPTION
        Configuration for dns64 action resource.
    .PARAMETER ActionName
        Name of the dns64 action.
    .PARAMETER Excluderule
        The expression to select the criteria for eliminating the corresponding ipv6 addresses from the response.
    .PARAMETER Mappedrule
        The expression to select the criteria for ipv4 addresses to be used for synthesis. Only if the mappedrule is evaluated to true the corresponding ipv4 address is used for synthesis using respective prefix, otherwise the A RR is discarded.
    .PARAMETER Prefix
        The dns64 prefix to be used if the after evaluating the rules.
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
        Invoke-NSUpdateDNSAction64 -ActionName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSAction64 -ActionName 'example' -WhatIf
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
        [string] $ActionName,

        [Parameter()]
        [string] $Excluderule,

        [Parameter()]
        [string] $Mappedrule,

        [Parameter()]
        [string] $Prefix,

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
    if ($PSBoundParameters.ContainsKey('ActionName')) { $properties['actionname'] = $ActionName }
    if ($PSBoundParameters.ContainsKey('Excluderule')) { $properties['excluderule'] = $Excluderule }
    if ($PSBoundParameters.ContainsKey('Mappedrule')) { $properties['mappedrule'] = $Mappedrule }
    if ($PSBoundParameters.ContainsKey('Prefix')) { $properties['prefix'] = $Prefix }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ActionName", 'Update dnsaction64')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnsaction64 -Payload @{ dnsaction64 = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSAction64 -ActionName $ActionName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSAction64

# region Invoke-NSUpdateDNSKey
function Invoke-NSUpdateDNSKey {
    <#
    .SYNOPSIS
        Updates a NetScaler dnskey resource.
    .DESCRIPTION
        Configuration for dns key resource.
    .PARAMETER Autorollover
        Flag to enable/disable key rollover automatically. Note: * Key name will be appended with _AR1 for successor key. For e.g. current key=k1, successor key=k1_AR1. * Key name can be truncated if current name length is more than 58 bytes to accomodate the suffix. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Expires
        Time period for which to consider the key valid, after the key is used to sign a zone. Default value: 120 Minimum value = 1 Maximum value = 32767
    .PARAMETER KeyName
        Name of the public-private key pair to publish in the zone. Minimum length = 1
    .PARAMETER Notificationperiod
        Time at which to generate notification of key expiration, specified as number of days, hours, or minutes before expiry. Must be less than the expiry period. The notification is an SNMP trap sent to an SNMP manager. To enable the appliance to send the trap, enable the DNSKEY-EXPIRY SNMP alarm. In case autorollover option is enabled, rollover for successor key will be intiated at this time. No notification trap will be sent. Default value: 7 Minimum value = 1 Maximum value = 32767
    .PARAMETER Revoke
        Revoke the key. Note: This operation is non-reversible.
    .PARAMETER RolloverMethod
        Method used for automatic rollover. * Key type: ZSK, Method: PrePublication or DoubleSignature. * Key type: KSK, Method: DoubleRRSet. Possible values = PrePublication, DoubleSignature, DoubleRRSet
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the DNSKEY resource record created in the zone. TTL is the time for which the record must be cached by the DNS proxies. If the TTL is not specified, either the DNS zone's minimum TTL or the default value of 3600 is used. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER UnitS1
        Units for the expiry period. Default value: DAYS Possible values = MINUTES, HOURS, DAYS
    .PARAMETER UnitS2
        Units for the notification period. Default value: DAYS Possible values = MINUTES, HOURS, DAYS
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
        Invoke-NSUpdateDNSKey -KeyName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSKey -KeyName 'example' -WhatIf
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
        [string] $Autorollover,

        [Parameter()]
        [int] $Expires,

        [Parameter(Mandatory, Position = 0)]
        [string] $KeyName,

        [Parameter()]
        [int] $Notificationperiod,

        [Parameter()]
        [bool] $Revoke,

        [Parameter()]
        [string] $RolloverMethod,

        [Parameter()]
        [int] $Ttl,

        [Parameter()]
        [ValidateSet('MINUTES', 'HOURS', 'DAYS')]
        [string] $UnitS1,

        [Parameter()]
        [ValidateSet('MINUTES', 'HOURS', 'DAYS')]
        [string] $UnitS2,

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

    if ($PSBoundParameters.ContainsKey('Autorollover')) {
        Assert-NSParameterValue -ParameterName 'Autorollover' -Value $Autorollover -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('RolloverMethod')) {
        Assert-NSParameterValue -ParameterName 'RolloverMethod' -Value $RolloverMethod -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('PrePublication', 'DoubleSignature', 'DoubleRRSet') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Autorollover')) { $properties['autorollover'] = $Autorollover }
    if ($PSBoundParameters.ContainsKey('Expires')) { $properties['expires'] = $Expires }
    if ($PSBoundParameters.ContainsKey('KeyName')) { $properties['keyname'] = $KeyName }
    if ($PSBoundParameters.ContainsKey('Notificationperiod')) { $properties['notificationperiod'] = $Notificationperiod }
    if ($PSBoundParameters.ContainsKey('Revoke')) { $properties['revoke'] = $Revoke }
    if ($PSBoundParameters.ContainsKey('RolloverMethod')) { $properties['rollovermethod'] = $RolloverMethod }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('UnitS1')) { $properties['units1'] = $UnitS1 }
    if ($PSBoundParameters.ContainsKey('UnitS2')) { $properties['units2'] = $UnitS2 }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$KeyName", 'Update dnskey')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnskey -Payload @{ dnskey = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSKey -KeyName $KeyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSKey

# region Invoke-NSUpdateDNSMXRecord
function Invoke-NSUpdateDNSMXRecord {
    <#
    .SYNOPSIS
        Updates a NetScaler dnsmxrec resource.
    .DESCRIPTION
        Configuration for MX record resource.
    .PARAMETER Domain
        Domain name for which to add the MX record. Minimum length = 1
    .PARAMETER Mx
        Host name of the mail exchange server. Minimum length = 1
    .PARAMETER Pref
        Priority number to assign to the mail exchange server. A domain name can have multiple mail servers, with a priority number assigned to each server. The lower the priority number, the higher the mail server's priority. When other mail servers have to deliver mail to the specified domain, they begin with the mail server with the lowest priority number, and use other configured mail servers, in priority order, as backups. Minimum value = 0 Maximum value = 65535
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSUpdateDNSMXRecord -Domain 'example' -Mx 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSMXRecord -Domain 'example' -Mx 'example' -WhatIf
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
        [string] $Domain,

        [Parameter(Mandatory)]
        [string] $Mx,

        [Parameter()]
        [int] $Pref,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Mx')) { $properties['mx'] = $Mx }
    if ($PSBoundParameters.ContainsKey('Pref')) { $properties['pref'] = $Pref }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Update dnsmxrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnsmxrec -Payload @{ dnsmxrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSMXRecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSMXRecord

# region Invoke-NSUpdateDNSNameServer
function Invoke-NSUpdateDNSNameServer {
    <#
    .SYNOPSIS
        Updates a NetScaler dnsnameserver resource.
    .DESCRIPTION
        Configuration for name server resource.
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the name server. Minimum length = 1
    .PARAMETER Ip
        IP address of an external name server or, if the Local parameter is set, IP address of a local DNS server (LDNS). Minimum length = 1
    .PARAMETER Type
        Protocol used by the name server. UDP_TCP is not valid if the name server is a DNS virtual server configured on the appliance. Default value: UDP Possible values = UDP, TCP, UDP_TCP
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
        Invoke-NSUpdateDNSNameServer -Ip 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSNameServer -Ip 'example' -WhatIf
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
        [string] $DNSProfileName,

        [Parameter(Mandatory, Position = 0)]
        [string] $Ip,

        [Parameter()]
        [ValidateSet('UDP', 'TCP', 'UDP_TCP')]
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
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('Ip')) { $properties['ip'] = $Ip }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ip", 'Update dnsnameserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnsnameserver -Payload @{ dnsnameserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSNameServer -Ip $Ip -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSNameServer

# region Invoke-NSUpdateDNSParameter
function Invoke-NSUpdateDNSParameter {
    <#
    .SYNOPSIS
        Updates a NetScaler dnsparameter resource.
    .DESCRIPTION
        Configuration for DNS parameter resource.
    .PARAMETER AutosaveKeyOps
        Flag to enable/disable saving of rollover operations executed automatically to avoid config loss. Applicable only when autorollover option is enabled on a key. Note: when you enable this, full configuration will be saved. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cacheecszeroprefix
        Cache ECS responses with a Scope Prefix length of zero. Such a cached response will be used for all queries with this domain name and any subnet. When disabled, ECS responses with Scope Prefix length of zero will be cached, but not tied to any subnet. This option has no effect if caching of ECS responses is disabled in the corresponding DNS profile. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CachehitBypass
        This parameter is applicable only in proxy mode and if this parameter is enabled we will forward all the client requests to the backend DNS server and the response served will be cached on Citrix ADC. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cachenoexpire
        If this flag is set to YES, the existing entries in cache do not age out. On reaching the max limit the cache records are frozen. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CacheRecordS
        Cache resource records in the DNS cache. Applies to resource records obtained through proxy configurations only. End resolver and forwarder configurations always cache records in the DNS cache, and you cannot disable this behavior. When you disable record caching, the appliance stops caching server responses. However, cached records are not flushed. The appliance does not serve requests from the cache until record caching is enabled again. Default value: YES Possible values = YES, NO
    .PARAMETER DNS64Timeout
        While doing DNS64 resolution, this parameter specifies the time to wait before sending an A query if no response is received from backend DNS server for AAAA query. Minimum value = 0 Maximum value = 10000
    .PARAMETER DNSRootreferral
        Send a root referral if a client queries a domain name that is unrelated to the domains configured/cached on the Citrix ADC. If the setting is disabled, the appliance sends a blank response instead of a root referral. Applicable to domains for which the appliance is authoritative. Disable the parameter when the appliance is under attack from a client that is sending a flood of queries for unrelated domains. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSSec
        Enable or disable the Domain Name System Security Extensions (DNSSEC) feature on the appliance. Note: Even when the DNSSEC feature is enabled, forwarder configurations (used by internal Citrix ADC features such as SSL VPN and Cache Redirection for name resolution) do not support the DNSSEC OK (DO) bit in the EDNS0 OPT header. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER EcsMaxSubnets
        Maximum number of subnets that can be cached corresponding to a single domain. Subnet caching will occur for responses with EDNS Client Subnet (ECS) option. Caching of such responses can be disabled using DNS profile settings. A value of zero indicates that the number of subnets cached is limited only by existing memory constraints. The default value is zero. Default value: 0 Minimum value = 0 Maximum value = 1280
    .PARAMETER MaxCachesize
        Maximum memory, in megabytes, that can be used for dns caching per Packet Engine.
    .PARAMETER MaxNegativecachesize
        Maximum memory, in megabytes, that can be used for caching of negative DNS responses per packet engine.
    .PARAMETER MaxNegcachettl
        Maximum time to live (TTL) for all negative records ( NXDONAIN and NODATA ) cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations. If the TTL of a record that is to be cached is higher than the value configured for maxnegcacheTTL, the TTL of the record is set to the value of maxnegcacheTTL before caching. When you modify this setting, the new value is applied only to those records that are cached after the modification. The TTL values of existing records are not changed. Default value: 604800 Minimum value = 1 Maximum value = 604800
    .PARAMETER MaxPipeline
        Maximum number of concurrent DNS requests to allow on a single client connection, which is identified by the <clientip:port>-<vserver ip:port> tuple. A value of 0 (zero) applies no limit to the number of concurrent DNS requests allowed on a single client connection.
    .PARAMETER MaxTtl
        Maximum time to live (TTL) for all records cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations. If the TTL of a record that is to be cached is higher than the value configured for maxTTL, the TTL of the record is set to the value of maxTTL before caching. When you modify this setting, the new value is applied only to those records that are cached after the modification. The TTL values of existing records are not changed. Default value: 604800 Minimum value = 1 Maximum value = 604800
    .PARAMETER MaxUDPPacketsize
        Maximum UDP packet size that can be handled by Citrix ADC. This is the value advertised by Citrix ADC when responding as an authoritative server and it is also used when Citrix ADC queries other name servers as a forwarder. When acting as a proxy, requests from clients are limited by this parameter - if a request contains a size greater than this value in the OPT record, it will be replaced. Default value: 1280 Minimum value = 512 Maximum value = 16384
    .PARAMETER MinTtl
        Minimum permissible time to live (TTL) for all records cached in the DNS cache by DNS proxy, end resolver, and forwarder configurations. If the TTL of a record that is to be cached is lower than the value configured for minTTL, the TTL of the record is set to the value of minTTL before caching. When you modify this setting, the new value is applied only to those records that are cached after the modification. The TTL values of existing records are not changed. Minimum value = 0 Maximum value = 604800
    .PARAMETER NameLookupPriority
        Type of lookup (DNS or WINS) to attempt first. If the first-priority lookup fails, the second-priority lookup is attempted. Used only by the SSL VPN feature. Default value: WINS Possible values = WINS, DNS
    .PARAMETER NxdomainratelimitThreshold
        Rate limit threshold for Non-Existant domain (NXDOMAIN) responses generated from Citrix ADC. Once the threshold is breached , DNS queries leading to NXDOMAIN response will be dropped. This threshold will not be applied for NXDOMAIN responses got from the backend. The threshold will be applied per packet engine and per second.
    .PARAMETER Recursion
        Function as an end resolver and recursively resolve queries for domains that are not hosted on the Citrix ADC. Also resolve queries recursively when the external name servers configured on the appliance (for a forwarder configuration) are unavailable. When external name servers are unavailable, the appliance queries a root server and resolves the request recursively, as it does for an end resolver configuration. This parameter will be effective only for queries recieved on nameserver with local flag. To enable recursion for queries recieved through ADNS service , CS vserver and LB vserver it is recommended to use recursiveResolution parameter on DNS profile. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Resolutionorder
        Type of DNS queries (A, AAAA, or both) to generate during the routine functioning of certain Citrix ADC features, such as SSL VPN, cache redirection, and the integrated cache. The queries are sent to the external name servers that are configured for the forwarder function. If you specify both query types, you can also specify the order. Available settings function as follows: * OnlyAQuery. Send queries for IPv4 address records (A records) only. * OnlyAAAAQuery. Send queries for IPv6 address records (AAAA records) instead of queries for IPv4 address records (A records). * AThenAAAAQuery. Send a query for an A record, and then send a query for an AAAA record if the query for the A record results in a NODATA response from the name server. * AAAAThenAQuery. Send a query for an AAAA record, and then send a query for an A record if the query for the AAAA record results in a NODATA response from the name server. Default value: OnlyAQuery Possible values = OnlyAQuery, OnlyAAAAQuery, AThenAAAAQuery, AAAAThenAQuery
    .PARAMETER ResolverMaxActiveresolutions
        Maximum number of active concurrent DNS resolutions per Packet Engine. Default value: 0
    .PARAMETER ResolverMaxTCPConnectionS
        Maximum DNS-TCP connections opened for recursive resolution per Packet Engine. Default value: 1000 Minimum value = 1
    .PARAMETER ResolverMaxTCPTimeout
        Maximum wait time in seconds for the response on DNS-TCP connection for recursive resolution per Packet Engine. Default value: 5 Minimum value = 1 Maximum value = 120
    .PARAMETER Retries
        Maximum number of retry attempts when no response is received for a query sent to a name server. Applies to end resolver and forwarder configurations. Default value: 5 Minimum value = 1 Maximum value = 5
    .PARAMETER SplitpktqueryProcessIng
        Processing requests split across multiple packets. Default value: ALLOW Possible values = ALLOW, DROP
    .PARAMETER Zonetransfer
        Flag to enable/disable DNS zones configuration transfer to remote GSLB site nodes. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateDNSParameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSParameter  -WhatIf
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
        [string] $AutosaveKeyOps,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Cacheecszeroprefix,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CachehitBypass,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Cachenoexpire,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CacheRecordS,

        [Parameter()]
        [int] $DNS64Timeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSRootreferral,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSSec,

        [Parameter()]
        [int] $EcsMaxSubnets,

        [Parameter()]
        [int] $MaxCachesize,

        [Parameter()]
        [int] $MaxNegativecachesize,

        [Parameter()]
        [int] $MaxNegcachettl,

        [Parameter()]
        [int] $MaxPipeline,

        [Parameter()]
        [int] $MaxTtl,

        [Parameter()]
        [int] $MaxUDPPacketsize,

        [Parameter()]
        [int] $MinTtl,

        [Parameter()]
        [ValidateSet('WINS', 'DNS')]
        [string] $NameLookupPriority,

        [Parameter()]
        [int] $NxdomainratelimitThreshold,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Recursion,

        [Parameter()]
        [ValidateSet('OnlyAQuery', 'OnlyAAAAQuery', 'AThenAAAAQuery', 'AAAAThenAQuery')]
        [string] $Resolutionorder,

        [Parameter()]
        [int] $ResolverMaxActiveresolutions,

        [Parameter()]
        [int] $ResolverMaxTCPConnectionS,

        [Parameter()]
        [int] $ResolverMaxTCPTimeout,

        [Parameter()]
        [int] $Retries,

        [Parameter()]
        [ValidateSet('ALLOW', 'DROP')]
        [string] $SplitpktqueryProcessIng,

        [Parameter()]
        [string] $Zonetransfer,

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

    if ($PSBoundParameters.ContainsKey('AutosaveKeyOps')) {
        Assert-NSParameterValue -ParameterName 'AutosaveKeyOps' -Value $AutosaveKeyOps -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Zonetransfer')) {
        Assert-NSParameterValue -ParameterName 'Zonetransfer' -Value $Zonetransfer -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AutosaveKeyOps')) { $properties['autosavekeyops'] = $AutosaveKeyOps }
    if ($PSBoundParameters.ContainsKey('Cacheecszeroprefix')) { $properties['cacheecszeroprefix'] = $Cacheecszeroprefix }
    if ($PSBoundParameters.ContainsKey('CachehitBypass')) { $properties['cachehitbypass'] = $CachehitBypass }
    if ($PSBoundParameters.ContainsKey('Cachenoexpire')) { $properties['cachenoexpire'] = $Cachenoexpire }
    if ($PSBoundParameters.ContainsKey('CacheRecordS')) { $properties['cacherecords'] = $CacheRecordS }
    if ($PSBoundParameters.ContainsKey('DNS64Timeout')) { $properties['dns64timeout'] = $DNS64Timeout }
    if ($PSBoundParameters.ContainsKey('DNSRootreferral')) { $properties['dnsrootreferral'] = $DNSRootreferral }
    if ($PSBoundParameters.ContainsKey('DNSSec')) { $properties['dnssec'] = $DNSSec }
    if ($PSBoundParameters.ContainsKey('EcsMaxSubnets')) { $properties['ecsmaxsubnets'] = $EcsMaxSubnets }
    if ($PSBoundParameters.ContainsKey('MaxCachesize')) { $properties['maxcachesize'] = $MaxCachesize }
    if ($PSBoundParameters.ContainsKey('MaxNegativecachesize')) { $properties['maxnegativecachesize'] = $MaxNegativecachesize }
    if ($PSBoundParameters.ContainsKey('MaxNegcachettl')) { $properties['maxnegcachettl'] = $MaxNegcachettl }
    if ($PSBoundParameters.ContainsKey('MaxPipeline')) { $properties['maxpipeline'] = $MaxPipeline }
    if ($PSBoundParameters.ContainsKey('MaxTtl')) { $properties['maxttl'] = $MaxTtl }
    if ($PSBoundParameters.ContainsKey('MaxUDPPacketsize')) { $properties['maxudppacketsize'] = $MaxUDPPacketsize }
    if ($PSBoundParameters.ContainsKey('MinTtl')) { $properties['minttl'] = $MinTtl }
    if ($PSBoundParameters.ContainsKey('NameLookupPriority')) { $properties['namelookuppriority'] = $NameLookupPriority }
    if ($PSBoundParameters.ContainsKey('NxdomainratelimitThreshold')) { $properties['nxdomainratelimitthreshold'] = $NxdomainratelimitThreshold }
    if ($PSBoundParameters.ContainsKey('Recursion')) { $properties['recursion'] = $Recursion }
    if ($PSBoundParameters.ContainsKey('Resolutionorder')) { $properties['resolutionorder'] = $Resolutionorder }
    if ($PSBoundParameters.ContainsKey('ResolverMaxActiveresolutions')) { $properties['resolvermaxactiveresolutions'] = $ResolverMaxActiveresolutions }
    if ($PSBoundParameters.ContainsKey('ResolverMaxTCPConnectionS')) { $properties['resolvermaxtcpconnections'] = $ResolverMaxTCPConnectionS }
    if ($PSBoundParameters.ContainsKey('ResolverMaxTCPTimeout')) { $properties['resolvermaxtcptimeout'] = $ResolverMaxTCPTimeout }
    if ($PSBoundParameters.ContainsKey('Retries')) { $properties['retries'] = $Retries }
    if ($PSBoundParameters.ContainsKey('SplitpktqueryProcessIng')) { $properties['splitpktqueryprocessing'] = $SplitpktqueryProcessIng }
    if ($PSBoundParameters.ContainsKey('Zonetransfer')) { $properties['zonetransfer'] = $Zonetransfer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('dnsparameter', 'Update dnsparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnsparameter -Payload @{ dnsparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateDNSParameter

# region Invoke-NSUpdateDNSPolicy
function Invoke-NSUpdateDNSPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler dnspolicy resource.
    .DESCRIPTION
        Configuration for DNS policy resource.
    .PARAMETER ActionName
        Name of the DNS action to perform when the rule evaluates to TRUE. The built in actions function as follows: * dns_default_act_Drop. Drop the DNS request. * dns_default_act_Cachebypass. Bypass the DNS cache and forward the request to the name server. You can create custom actions by using the add dns action command in the CLI or the DNS > Actions > Create DNS Action dialog box in the Citrix ADC configuration utility.
    .PARAMETER CacheBypass
        By pass dns cache for this. Possible values = YES, NO
    .PARAMETER Drop
        The dns packet must be dropped. Possible values = YES, NO
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the DNS policy.
    .PARAMETER Preferredlocation
        The location used for the given policy. This is deprecated attribute. Please use -prefLocList.
    .PARAMETER PreferredloCLISt
        The location list in priority order used for the given policy. Minimum length = 1
    .PARAMETER Rule
        Expression against which DNS traffic is evaluated. Note: * On the command line interface, if the expression includes blank spaces, the entire expression must be enclosed in double quotation marks. * If the expression itself includes double quotation marks, you must escape the quotations by using the character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks. Example: CLIENT.UDP.DNS.DOMAIN.EQ("domainname").
    .PARAMETER ViewName
        The view name that must be used for the given policy.
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
        Invoke-NSUpdateDNSPolicy -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSPolicy -Name 'example' -WhatIf
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
        [string] $ActionName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CacheBypass,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Drop,

        [Parameter()]
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Preferredlocation,

        [Parameter()]
        [string[]] $PreferredloCLISt,

        [Parameter()]
        [string] $Rule,

        [Parameter()]
        [string] $ViewName,

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
    if ($PSBoundParameters.ContainsKey('ActionName')) { $properties['actionname'] = $ActionName }
    if ($PSBoundParameters.ContainsKey('CacheBypass')) { $properties['cachebypass'] = $CacheBypass }
    if ($PSBoundParameters.ContainsKey('Drop')) { $properties['drop'] = $Drop }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Preferredlocation')) { $properties['preferredlocation'] = $Preferredlocation }
    if ($PSBoundParameters.ContainsKey('PreferredloCLISt')) { $properties['preferredloclist'] = $PreferredloCLISt }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('ViewName')) { $properties['viewname'] = $ViewName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update dnspolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnspolicy -Payload @{ dnspolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSPolicy

# region Invoke-NSUpdateDNSPolicy64
function Invoke-NSUpdateDNSPolicy64 {
    <#
    .SYNOPSIS
        Updates a NetScaler dnspolicy64 resource.
    .DESCRIPTION
        Configuration for dns64 policy resource.
    .PARAMETER Action
        Name of the DNS64 action to perform when the rule evaluates to TRUE. The built in actions function as follows: * A default dns64 action with prefix <default prefix> and mapped and exclude are any You can create custom actions by using the add dns action command in the CLI or the DNS64 > Actions > Create DNS64 Action dialog box in the Citrix ADC configuration utility.
    .PARAMETER Name
        Name for the DNS64 policy.
    .PARAMETER Rule
        Expression against which DNS traffic is evaluated. Note: * On the command line interface, if the expression includes blank spaces, the entire expression must be enclosed in double quotation marks. * If the expression itself includes double quotation marks, you must escape the quotations by using the character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks. Example: CLIENT.IP.SRC.IN_SUBENT(23.34.0.0/16).
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
        Invoke-NSUpdateDNSPolicy64 -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSPolicy64 -Name 'example' -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$Name", 'Update dnspolicy64')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnspolicy64 -Payload @{ dnspolicy64 = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSPolicy64 -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSPolicy64

# region Invoke-NSUpdateDNSProfile
function Invoke-NSUpdateDNSProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler dnsprofile resource.
    .DESCRIPTION
        Configuration for DNS profile resource.
    .PARAMETER CacheecsResponseS
        Cache DNS responses with EDNS Client Subnet(ECS) option in the DNS cache. When disabled, the appliance stops caching responses with ECS option. This is relevant to proxy configuration. Enabling/disabling support of ECS option when Citrix ADC is authoritative for a GSLB domain is supported using a knob in GSLB vserver. In all other modes, ECS option is ignored. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CachenegativeResponseS
        Cache negative responses in the DNS cache. When disabled, the appliance stops caching negative responses except referral records. This applies to all configurations - proxy, end resolver, and forwarder. However, cached responses are not flushed. The appliance does not serve negative responses from the cache until this parameter is enabled again. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CacheRecordS
        Cache resource records in the DNS cache. Applies to resource records obtained through proxy configurations only. End resolver and forwarder configurations always cache records in the DNS cache, and you cannot disable this behavior. When you disable record caching, the appliance stops caching server responses. However, cached records are not flushed. The appliance does not serve requests from the cache until record caching is enabled again. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSAnswerseclogging
        DNS answer section; if enabled, answer section in the response will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSErrorLogging
        DNS error logging; if enabled, whenever error is encountered in DNS module reason for the error will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSExtendedlogging
        DNS extended logging; if enabled, authority and additional section in the response will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSProfileName
        Name of the DNS profile. Minimum length = 1 Maximum length = 127
    .PARAMETER DNSQuerylogging
        DNS query logging; if enabled, DNS query information such as DNS query id, DNS query flags , DNS domain name and DNS query type will be logged. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DropMultiQueryRequest
        Drop the DNS requests containing multiple queries. When enabled, DNS requests containing multiple queries will be dropped. In case of proxy configuration by default the DNS request containing multiple queries is forwarded to the backend and in case of ADNS and Resolver configuration NOCODE error response will be sent to the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER InsertEcs
        Insert ECS Option on DNS query. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER MaxCacheableEcsprefixLength
        The maximum ecs prefix length that will be cached. Default value: 32 Minimum value = 0 Maximum value = 32
    .PARAMETER MaxCacheableEcsprefixLength6
        The maximum ecs prefix length that will be cached for IPv6 subnets. Default value: 128 Minimum value = 0 Maximum value = 128
    .PARAMETER Recursiveresolution
        DNS recursive resolution; if enabled, will do recursive resolution for DNS query when the profile is associated with ADNS service, CS Vserver and DNS action. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Replaceecs
        Replace ECS Option on DNS query. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateDNSProfile -DNSProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSProfile -DNSProfileName 'example' -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CacheecsResponseS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CachenegativeResponseS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CacheRecordS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSAnswerseclogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSErrorLogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSExtendedlogging,

        [Parameter(Mandatory, Position = 0)]
        [string] $DNSProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSQuerylogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DropMultiQueryRequest,

        [Parameter()]
        [string] $InsertEcs,

        [Parameter()]
        [int] $MaxCacheableEcsprefixLength,

        [Parameter()]
        [int] $MaxCacheableEcsprefixLength6,

        [Parameter()]
        [string] $Recursiveresolution,

        [Parameter()]
        [string] $Replaceecs,

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

    if ($PSBoundParameters.ContainsKey('InsertEcs')) {
        Assert-NSParameterValue -ParameterName 'InsertEcs' -Value $InsertEcs -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Recursiveresolution')) {
        Assert-NSParameterValue -ParameterName 'Recursiveresolution' -Value $Recursiveresolution -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Replaceecs')) {
        Assert-NSParameterValue -ParameterName 'Replaceecs' -Value $Replaceecs -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('CacheecsResponseS')) { $properties['cacheecsresponses'] = $CacheecsResponseS }
    if ($PSBoundParameters.ContainsKey('CachenegativeResponseS')) { $properties['cachenegativeresponses'] = $CachenegativeResponseS }
    if ($PSBoundParameters.ContainsKey('CacheRecordS')) { $properties['cacherecords'] = $CacheRecordS }
    if ($PSBoundParameters.ContainsKey('DNSAnswerseclogging')) { $properties['dnsanswerseclogging'] = $DNSAnswerseclogging }
    if ($PSBoundParameters.ContainsKey('DNSErrorLogging')) { $properties['dnserrorlogging'] = $DNSErrorLogging }
    if ($PSBoundParameters.ContainsKey('DNSExtendedlogging')) { $properties['dnsextendedlogging'] = $DNSExtendedlogging }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('DNSQuerylogging')) { $properties['dnsquerylogging'] = $DNSQuerylogging }
    if ($PSBoundParameters.ContainsKey('DropMultiQueryRequest')) { $properties['dropmultiqueryrequest'] = $DropMultiQueryRequest }
    if ($PSBoundParameters.ContainsKey('InsertEcs')) { $properties['insertecs'] = $InsertEcs }
    if ($PSBoundParameters.ContainsKey('MaxCacheableEcsprefixLength')) { $properties['maxcacheableecsprefixlength'] = $MaxCacheableEcsprefixLength }
    if ($PSBoundParameters.ContainsKey('MaxCacheableEcsprefixLength6')) { $properties['maxcacheableecsprefixlength6'] = $MaxCacheableEcsprefixLength6 }
    if ($PSBoundParameters.ContainsKey('Recursiveresolution')) { $properties['recursiveresolution'] = $Recursiveresolution }
    if ($PSBoundParameters.ContainsKey('Replaceecs')) { $properties['replaceecs'] = $Replaceecs }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$DNSProfileName", 'Update dnsprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnsprofile -Payload @{ dnsprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSProfile -DNSProfileName $DNSProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSProfile

# region Invoke-NSUpdateDNSSOARecord
function Invoke-NSUpdateDNSSOARecord {
    <#
    .SYNOPSIS
        Updates a NetScaler dnssoarec resource.
    .DESCRIPTION
        Configuration for SOA record resource.
    .PARAMETER Contact
        Email address of the contact to whom domain issues can be addressed. In the email address, replace the @ sign with a period (.). For example, enter domainadmin.example.com instead of domainadmin@example.com. Minimum length = 1
    .PARAMETER Domain
        Domain name for which to add the SOA record. Minimum length = 1
    .PARAMETER Expire
        Time, in seconds, after which the zone data on a secondary name server can no longer be considered authoritative because all refresh and retry attempts made during the period have failed. After the expiry period, the secondary server stops serving the zone. Typically one week. Not used by the primary server. Default value: 3600 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MinImum
        Default time to live (TTL) for all records in the zone. Can be overridden for individual records. Default value: 5 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER OriginServer
        Domain name of the name server that responds authoritatively for the domain. Minimum length = 1
    .PARAMETER Refresh
        Time, in seconds, for which a secondary server must wait between successive checks on the value of the serial number. Default value: 3600 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Retry
        Time, in seconds, between retries if a secondary server's attempt to contact the primary server for a zone refresh fails. Default value: 3 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Serial
        The secondary server uses this parameter to determine whether it requires a zone transfer from the primary server. Default value: 100 Minimum value = 0 Maximum value = 4294967294
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
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
        Invoke-NSUpdateDNSSOARecord -Domain 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSSOARecord -Domain 'example' -WhatIf
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
        [string] $Contact,

        [Parameter(Mandatory, Position = 0)]
        [string] $Domain,

        [Parameter()]
        [int] $Expire,

        [Parameter()]
        [int] $MinImum,

        [Parameter()]
        [string] $OriginServer,

        [Parameter()]
        [int] $Refresh,

        [Parameter()]
        [int] $Retry,

        [Parameter()]
        [int] $Serial,

        [Parameter()]
        [int] $Ttl,

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
    if ($PSBoundParameters.ContainsKey('Contact')) { $properties['contact'] = $Contact }
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Expire')) { $properties['expire'] = $Expire }
    if ($PSBoundParameters.ContainsKey('MinImum')) { $properties['minimum'] = $MinImum }
    if ($PSBoundParameters.ContainsKey('OriginServer')) { $properties['originserver'] = $OriginServer }
    if ($PSBoundParameters.ContainsKey('Refresh')) { $properties['refresh'] = $Refresh }
    if ($PSBoundParameters.ContainsKey('Retry')) { $properties['retry'] = $Retry }
    if ($PSBoundParameters.ContainsKey('Serial')) { $properties['serial'] = $Serial }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Update dnssoarec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnssoarec -Payload @{ dnssoarec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSSOARecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSSOARecord

# region Invoke-NSUpdateDNSSRVRecord
function Invoke-NSUpdateDNSSRVRecord {
    <#
    .SYNOPSIS
        Updates a NetScaler dnssrvrec resource.
    .DESCRIPTION
        Configuration for server record resource.
    .PARAMETER Domain
        Domain name, which, by convention, is prefixed by the symbolic name of the desired service and the symbolic name of the desired protocol, each with an underscore (_) prepended. For example, if an SRV-aware client wants to discover a SIP service that is provided over UDP, in the domain example.com, the client performs a lookup for _sip._udp.example.com. Minimum length = 1
    .PARAMETER Port
        Port on which the target host listens for client requests. Minimum value = 0 Maximum value = 65535
    .PARAMETER Priority
        Integer specifying the priority of the target host. The lower the number, the higher the priority. If multiple target hosts have the same priority, selection is based on the Weight parameter. Minimum value = 0 Maximum value = 65535
    .PARAMETER Target
        Target host for the specified service.
    .PARAMETER Ttl
        Time to Live (TTL), in seconds, for the record. TTL is the time for which the record must be cached by DNS proxies. The specified TTL is applied to all the resource records that are of the same record type and belong to the specified domain name. For example, if you add an address record, with a TTL of 36000, to the domain name example.com, the TTLs of all the address records of example.com are changed to 36000. If the TTL is not specified, the Citrix ADC uses either the DNS zone's minimum TTL or, if the SOA record is not available on the appliance, the default value of 3600. Default value: 3600 Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Weight
        Weight for the target host. Aids host selection when two or more hosts have the same priority. A larger number indicates greater weight. Minimum value = 0 Maximum value = 65535
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
        Invoke-NSUpdateDNSSRVRecord -Domain 'example' -Target 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSSRVRecord -Domain 'example' -Target 'example' -WhatIf
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
        [string] $Domain,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [int] $Priority,

        [Parameter(Mandatory)]
        [string] $Target,

        [Parameter()]
        [int] $Ttl,

        [Parameter()]
        [int] $Weight,

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
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Target')) { $properties['target'] = $Target }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Domain", 'Update dnssrvrec')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnssrvrec -Payload @{ dnssrvrec = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSSRVRecord -Domain $Domain -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSSRVRecord

# region Invoke-NSUpdateDNSZone
function Invoke-NSUpdateDNSZone {
    <#
    .SYNOPSIS
        Updates a NetScaler dnszone resource.
    .DESCRIPTION
        Configuration for DNS zone resource.
    .PARAMETER DNSSecoffload
        Enable dnssec offload for this zone. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Nsec
        Enable nsec generation for dnssec offload. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ProxyMode
        Deploy the zone in proxy mode. Enable in the following scenarios: * The load balanced DNS servers are authoritative for the zone and all resource records that are part of the zone. * The load balanced DNS servers are authoritative for the zone, but the Citrix ADC owns a subset of the resource records that belong to the zone (partial zone ownership configuration). Typically seen in global server load balancing (GSLB) configurations, in which the appliance responds authoritatively to queries for GSLB domain names but forwards queries for other domain names in the zone to the load balanced servers. In either scenario, do not create the zone's Start of Authority (SOA) and name server (NS) resource records on the appliance. Disable if the appliance is authoritative for the zone, but make sure that you have created the SOA and NS records on the appliance before you create the zone. Default value: YES Possible values = YES, NO
    .PARAMETER ZoneName
        Name of the zone to create. Minimum length = 1
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
        Invoke-NSUpdateDNSZone -ZoneName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateDNSZone -ZoneName 'example' -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNSSecoffload,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Nsec,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $ProxyMode,

        [Parameter(Mandatory, Position = 0)]
        [string] $ZoneName,

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
    if ($PSBoundParameters.ContainsKey('DNSSecoffload')) { $properties['dnssecoffload'] = $DNSSecoffload }
    if ($PSBoundParameters.ContainsKey('Nsec')) { $properties['nsec'] = $Nsec }
    if ($PSBoundParameters.ContainsKey('ProxyMode')) { $properties['proxymode'] = $ProxyMode }
    if ($PSBoundParameters.ContainsKey('ZoneName')) { $properties['zonename'] = $ZoneName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ZoneName", 'Update dnszone')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type dnszone -Payload @{ dnszone = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetDNSZone -ZoneName $ZoneName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateDNSZone

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAbbccfhSAikhKH
# OeqGNusxIaZiFYaL/tVTO98X+MRXHKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcyMIIXLgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABCpi
# ODYL8LtS2EQAAAAEKmIwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgUN3+
# vPA69FzlQPT8LS1kvTEBblCqpQNla0lgLmm5WtAwDQYJKoZIhvcNAQEBBQAEggGA
# M++aZhglUsRbQgRKsngPzaibVf1nhEg5evxRWwQPZMQfdfbUGvxVFbIWVKbuVaET
# ciuEoX0oMe8ACbPPvB3t4Fr6WO58TK3viTZ/xjFmAZ04DXBvlwE3nesQbTIMWBsj
# bNzKiq6Xm71PnftNvcAg561iqMCLSMII74wXVpwhXAoZHhCOSnVPesUoXBIwmgNr
# xP5N7wUNoCt+bp53qMHrOLmfjcYyEaAOGjc+m+zWzrMcbBHFAGSgsqECY7iwIhPi
# Peh7xWs/qX4NAMxVUpuCQsiLrRDolVaUwF62hRc/qg3VQSq4mS+h4bxbKZpECg62
# ed/hh0yKCG7mHYx2Xuoo7h/4kX+JH1/yel0kp51KBKbh7Ky7I5Lx3T2j1UYEvKwa
# Y2qDhvTIbN2wKrN1F+RTaZY3L1wqmIwfkECWFYdD0l2/WYLUBQwgGG5tkJgNMSMw
# F0SSUCYk6OV+UGrAqP47inYk84yqpD3RD2LkMJpK7R2YonxkB0Rd7x1Q5uIus3cv
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIAAeYmeqSxkzb9tH36Ey
# qlAMjlQSQHEJ1c3+yqM+9z5gAgZqNTBfoFYYEzIwMjYwODAzMTI1MTM4LjQ0OVow
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
# IgQgkkXLwJ6ihTw+4veDT+oJkQCtJdPeTn8cw2KWIEIfCkcwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCBjvs38TkZQ7iGxRP7H
# HHeWregoVp5960ewGO9kUZr6FDANBgkqhkiG9w0BAQsFAASCAgDVPHzb95x880Fv
# T6maEBmz3zPyL7unGFyySqLrkKTBG8sneV4h7tst14DvY0yYurqldEM77g/72vwW
# HtmT/wz8MMAlwPF4fXJAvvrpbE02uCKOtlRf3X0T841Q94Ld2cj+C7iKTlYiMvQd
# i6ws3LZHjoXQL9NCXO9coumZiRdAWAvarRtiqfQ+Cbj1dkNWtHW5I+8NnI9NWmig
# AROW+vgwzolz17lZxt0ivEBfGCvS/Q6nqKh/qKoe0nh1QFUW6UPQwxlcotOfBQJe
# HKWuTkCcNz8Va5Vk7XOzOEjtlOd/LdpFG93kzJ+EGCSZNGPKFQLDMfon+NHZV2OX
# sQMmCI0+xRZ4kZiBHChW3Y1Pf0q/nztKO5XIgiRBkpV8Fzdy8MWUzTuc6T7iUhEM
# rquaVJ6+ZCgTLso3TlED2chSlRXHhsAJCClVTki0f279pOzMskawDQw+uVVRM27x
# C5KhzpTec5uR1O0QYQdPK2IZ4/meQzRR/4BiyukuuglUkpObqAvdmnMTkWLOM+Ex
# vCXUCj9ejg3WYEwawb9yKHJyW0J5UZwpcW4TnvuwbbTZSqGf7jves6i9//d/2mr8
# OCVRgNZrImqV3JQknJB4kYRPgo6O9vLiASishzJK+ibo7R27iBScjf+G417RZJjP
# CjzjFT7EXxp/+WZokjXD//fcxyceCg==
# SIG # End signature block
