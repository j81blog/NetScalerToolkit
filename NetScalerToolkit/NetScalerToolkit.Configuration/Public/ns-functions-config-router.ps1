# Generated NetScalerToolkit Configuration bundle for category 'router'.

# region Invoke-NSAddAcceSSLIst
function Invoke-NSAddAcceSSLIst {
    <#
    .SYNOPSIS
        Creates a NetScaler accessList resource.
    .DESCRIPTION
        Configuration for accessList resource.
    .PARAMETER Action
        Allow or deny if traffic matches the rule. Possible values: deny, permit
    .PARAMETER Address
        Address to match.
    .PARAMETER Id
        Standard access list number in the range or a ZebOS access-list name.
    .PARAMETER Remark
        Access list entry comment.
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the accessList resource.
    .PARAMETER Rules
        The rules value for the accessList resource.
    .PARAMETER Wildcard
        Wildcard bits.
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
        Invoke-NSAddAcceSSLIst  -PassThru
    .EXAMPLE
        Invoke-NSAddAcceSSLIst  -WhatIf
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

        [Parameter()]
        [string] $Address,

        [Parameter()]
        [string] $Id,

        [Parameter()]
        [string] $Remark,

        [Parameter()]
        [string] $Routerdynamicrouting,

        [Parameter()]
        [string] $Rules,

        [Parameter()]
        [string] $Wildcard,

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
    if ($PSBoundParameters.ContainsKey('Address')) { $properties['address'] = $Address }
    if ($PSBoundParameters.ContainsKey('Id')) { $properties['id'] = $Id }
    if ($PSBoundParameters.ContainsKey('Remark')) { $properties['remark'] = $Remark }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }
    if ($PSBoundParameters.ContainsKey('Rules')) { $properties['rules'] = $Rules }
    if ($PSBoundParameters.ContainsKey('Wildcard')) { $properties['wildcard'] = $Wildcard }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('accessList', 'Create accessList')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type accessList -Payload @{ accessList = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddAcceSSLIst

# region Invoke-NSAddBfdinterface
function Invoke-NSAddBfdinterface {
    <#
    .SYNOPSIS
        Creates a NetScaler bfdInterface resource.
    .DESCRIPTION
        Configuration for bfdInterface resource.
    .PARAMETER Interval
        Transmit interval for bfd packets Minimum value: 100 Maximum value: 30000
    .PARAMETER MinRx
        Minimim receive interval for bfd packets Minimum value: 100 Maximum value: 30000
    .PARAMETER MultiPlier
        Multiplier for bfd packets Minimum value: 1 Maximum value: 20
    .PARAMETER Name
        Name of the interface
    .PARAMETER Passive
        Make bfd session passive
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the bfdInterface resource.
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
        Invoke-NSAddBfdinterface -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBfdinterface -Name 'example' -WhatIf
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
        [string] $Interval,

        [Parameter()]
        [string] $MinRx,

        [Parameter()]
        [string] $MultiPlier,

        [Parameter(Mandatory)]
        [string] $Name,

        [Parameter()]
        [string] $Passive,

        [Parameter()]
        [string] $Routerdynamicrouting,

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
    if ($PSBoundParameters.ContainsKey('Interval')) { $properties['interval'] = $Interval }
    if ($PSBoundParameters.ContainsKey('MinRx')) { $properties['minrx'] = $MinRx }
    if ($PSBoundParameters.ContainsKey('MultiPlier')) { $properties['multiplier'] = $MultiPlier }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Passive')) { $properties['passive'] = $Passive }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('bfdInterface', 'Create bfdInterface')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type bfdInterface -Payload @{ bfdInterface = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddBfdinterface

# region Invoke-NSAddBgprouter
function Invoke-NSAddBgprouter {
    <#
    .SYNOPSIS
        Creates a NetScaler bgpRouter resource.
    .DESCRIPTION
        Configuration for bgpRouter resource.
    .PARAMETER Activate
        Enable the Address Family for the neighbor.
    .PARAMETER Address
        The ipv4 or ipv6 address of the neighboring router.
    .PARAMETER Addressfamily
        Address family of the routes. Possible values: ipv4, ipv6
    .PARAMETER AdvertisementInterval
        Minimum interval between sending BGP routing updates. Minimum value: 0 Maximum value: 65535
    .PARAMETER Afparams
        The afParams value for the bgpRouter resource.
    .PARAMETER AsoriginationInterval
        Minimum interval between sending AS-origination routing updates. Minimum value: 1 Maximum value: 65535
    .PARAMETER ConnEcttimer
        Time interval (in seconds) for the ConnectRetry timer. Minimum value: 1 Maximum value: 65535
    .PARAMETER Direction
        Apply the route-map to incoming routes or outgoing routes. Possible values: in, out
    .PARAMETER Holdtimerconfig
        Configured hold time for the neighbor. Minimum value: 0 Maximum value: 65535
    .PARAMETER Keepalivetimerconfig
        Configured keepalive time for the neighbor. Minimum value: 0 Maximum value: 65535
    .PARAMETER LocalAs
        Autonomous system number. Minimum value: 1 Maximum value: 4294967295
    .PARAMETER Md5password
        MD5 password for the neighbor.
    .PARAMETER MultiHopbfd
        Enable BFD for multihop session
    .PARAMETER Name
        Name of the route-map.
    .PARAMETER Neighbor
        The neighbor value for the bgpRouter resource.
    .PARAMETER Protocol
        The protocol from which routes need to be redistributed. Possible values: kernel, connected, static, rip, ospf, isis, intranet
    .PARAMETER Redistribute
        The redistribute value for the bgpRouter resource.
    .PARAMETER Remoteas
        AS number of the neighbor. Minimum value: 1 Maximum value: 4294967295
    .PARAMETER Routemap
        Route map reference
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the bgpRouter resource.
    .PARAMETER Routerid
        The router identifier for the bgp routing instance.
    .PARAMETER Singlehopbfd
        Enable BFD on this neighbor
    .PARAMETER TCPMss
        TCP maximum segment size Minimum value: 1 Maximum value: 65535
    .PARAMETER Updatesource
        Source of routing updates.
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
        Invoke-NSAddBgprouter -LocalAs 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBgprouter -LocalAs 'example' -WhatIf
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
        [string] $Activate,

        [Parameter()]
        [string] $Address,

        [Parameter()]
        [string] $Addressfamily,

        [Parameter()]
        [string] $AdvertisementInterval,

        [Parameter()]
        [string] $Afparams,

        [Parameter()]
        [string] $AsoriginationInterval,

        [Parameter()]
        [string] $ConnEcttimer,

        [Parameter()]
        [string] $Direction,

        [Parameter()]
        [string] $Holdtimerconfig,

        [Parameter()]
        [string] $Keepalivetimerconfig,

        [Parameter(Mandatory)]
        [string] $LocalAs,

        [Parameter()]
        [string] $Md5password,

        [Parameter()]
        [string] $MultiHopbfd,

        [Parameter()]
        [string] $Name,

        [Parameter()]
        [string] $Neighbor,

        [Parameter()]
        [string] $Protocol,

        [Parameter()]
        [string] $Redistribute,

        [Parameter()]
        [string] $Remoteas,

        [Parameter()]
        [string] $Routemap,

        [Parameter()]
        [string] $Routerdynamicrouting,

        [Parameter()]
        [string] $Routerid,

        [Parameter()]
        [string] $Singlehopbfd,

        [Parameter()]
        [string] $TCPMss,

        [Parameter()]
        [string] $Updatesource,

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
    if ($PSBoundParameters.ContainsKey('Activate')) { $properties['activate'] = $Activate }
    if ($PSBoundParameters.ContainsKey('Address')) { $properties['address'] = $Address }
    if ($PSBoundParameters.ContainsKey('Addressfamily')) { $properties['addressFamily'] = $Addressfamily }
    if ($PSBoundParameters.ContainsKey('AdvertisementInterval')) { $properties['advertisementInterval'] = $AdvertisementInterval }
    if ($PSBoundParameters.ContainsKey('Afparams')) { $properties['afParams'] = $Afparams }
    if ($PSBoundParameters.ContainsKey('AsoriginationInterval')) { $properties['ASOriginationInterval'] = $AsoriginationInterval }
    if ($PSBoundParameters.ContainsKey('ConnEcttimer')) { $properties['connectTimer'] = $ConnEcttimer }
    if ($PSBoundParameters.ContainsKey('Direction')) { $properties['direction'] = $Direction }
    if ($PSBoundParameters.ContainsKey('Holdtimerconfig')) { $properties['holdTimerConfig'] = $Holdtimerconfig }
    if ($PSBoundParameters.ContainsKey('Keepalivetimerconfig')) { $properties['keepaliveTimerConfig'] = $Keepalivetimerconfig }
    if ($PSBoundParameters.ContainsKey('LocalAs')) { $properties['localAS'] = $LocalAs }
    if ($PSBoundParameters.ContainsKey('Md5password')) { $properties['md5Password'] = $Md5password }
    if ($PSBoundParameters.ContainsKey('MultiHopbfd')) { $properties['multihopBfd'] = $MultiHopbfd }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Neighbor')) { $properties['neighbor'] = $Neighbor }
    if ($PSBoundParameters.ContainsKey('Protocol')) { $properties['protocol'] = $Protocol }
    if ($PSBoundParameters.ContainsKey('Redistribute')) { $properties['redistribute'] = $Redistribute }
    if ($PSBoundParameters.ContainsKey('Remoteas')) { $properties['remoteAS'] = $Remoteas }
    if ($PSBoundParameters.ContainsKey('Routemap')) { $properties['routeMap'] = $Routemap }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }
    if ($PSBoundParameters.ContainsKey('Routerid')) { $properties['routerId'] = $Routerid }
    if ($PSBoundParameters.ContainsKey('Singlehopbfd')) { $properties['singlehopBfd'] = $Singlehopbfd }
    if ($PSBoundParameters.ContainsKey('TCPMss')) { $properties['tcpMSS'] = $TCPMss }
    if ($PSBoundParameters.ContainsKey('Updatesource')) { $properties['updateSource'] = $Updatesource }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('bgpRouter', 'Create bgpRouter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type bgpRouter -Payload @{ bgpRouter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddBgprouter

# region Invoke-NSAddIproute
function Invoke-NSAddIproute {
    <#
    .SYNOPSIS
        Creates a NetScaler ipRoute resource.
    .DESCRIPTION
        Configuration for ipRoute resource.
    .PARAMETER Addressfamily
        The address family of the route. Possible values: ipv4, ipv6
    .PARAMETER Distance
        Distance value for this route Minimum value: 1 Maximum value: 255
    .PARAMETER Interface
        IP gateway interface name or pseudo interface Null
    .PARAMETER Nexthop
        IP gateway address
    .PARAMETER Prefix
        IP destination prefix.
    .PARAMETER PrefixLength
        IP destination prefix length. Minimum value: 0 Maximum value: 128
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ipRoute resource.
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
        Invoke-NSAddIproute -Addressfamily 'example' -Prefix 'example' -PrefixLength 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddIproute -Addressfamily 'example' -Prefix 'example' -PrefixLength 'example' -WhatIf
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
        [string] $Addressfamily,

        [Parameter()]
        [string] $Distance,

        [Parameter()]
        [string] $Interface,

        [Parameter()]
        [string] $Nexthop,

        [Parameter(Mandatory)]
        [string] $Prefix,

        [Parameter(Mandatory)]
        [string] $PrefixLength,

        [Parameter()]
        [string] $Routerdynamicrouting,

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
    if ($PSBoundParameters.ContainsKey('Addressfamily')) { $properties['addressFamily'] = $Addressfamily }
    if ($PSBoundParameters.ContainsKey('Distance')) { $properties['distance'] = $Distance }
    if ($PSBoundParameters.ContainsKey('Interface')) { $properties['interface'] = $Interface }
    if ($PSBoundParameters.ContainsKey('Nexthop')) { $properties['nextHop'] = $Nexthop }
    if ($PSBoundParameters.ContainsKey('Prefix')) { $properties['prefix'] = $Prefix }
    if ($PSBoundParameters.ContainsKey('PrefixLength')) { $properties['prefixLength'] = $PrefixLength }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('ipRoute', 'Create ipRoute')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ipRoute -Payload @{ ipRoute = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddIproute

# region Invoke-NSAddOspf6interface
function Invoke-NSAddOspf6interface {
    <#
    .SYNOPSIS
        Creates a NetScaler ospf6Interface resource.
    .DESCRIPTION
        Configuration for ospf6Interface resource.
    .PARAMETER Areaid
        Area on which OSPFv3 is running Minimum value: 0 Maximum value: 4294967295
    .PARAMETER Cost
        Interface cost. Minimum value: 1 Maximum value: 65535
    .PARAMETER DeadInterval
        Interval after which a neighbor is declared dead Minimum value: 1 Maximum value: 65535
    .PARAMETER HelloInterval
        Time between HELLO packets Minimum value: 1 Maximum value: 65535
    .PARAMETER Instanceid
        Interface Instance Id - for v6, for v4 Minimum value: 0 Maximum value: 255
    .PARAMETER Name
        Name of the interface
    .PARAMETER NetworkType
        Network type Possible values: broadcast, non-broadcast, point-to-multipoint, point-to-point
    .PARAMETER Priority
        Router priority. Minimum value: 0 Maximum value: 255
    .PARAMETER RetransmitInterval
        Time between retransmitting lost link state advertisements. Minimum value: 1 Maximum value: 65535
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospf6Interface resource.
    .PARAMETER Tagid
        OSPFv3 Tag
    .PARAMETER Transmitdelay
        Link state transmit delay. Minimum value: 1 Maximum value: 65535
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
        Invoke-NSAddOspf6interface -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddOspf6interface -Name 'example' -WhatIf
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
        [string] $Areaid,

        [Parameter()]
        [string] $Cost,

        [Parameter()]
        [string] $DeadInterval,

        [Parameter()]
        [string] $HelloInterval,

        [Parameter()]
        [string] $Instanceid,

        [Parameter(Mandatory)]
        [string] $Name,

        [Parameter()]
        [string] $NetworkType,

        [Parameter()]
        [string] $Priority,

        [Parameter()]
        [string] $RetransmitInterval,

        [Parameter()]
        [string] $Routerdynamicrouting,

        [Parameter()]
        [string] $Tagid,

        [Parameter()]
        [string] $Transmitdelay,

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
    if ($PSBoundParameters.ContainsKey('Areaid')) { $properties['areaId'] = $Areaid }
    if ($PSBoundParameters.ContainsKey('Cost')) { $properties['cost'] = $Cost }
    if ($PSBoundParameters.ContainsKey('DeadInterval')) { $properties['deadInterval'] = $DeadInterval }
    if ($PSBoundParameters.ContainsKey('HelloInterval')) { $properties['helloInterval'] = $HelloInterval }
    if ($PSBoundParameters.ContainsKey('Instanceid')) { $properties['instanceId'] = $Instanceid }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetworkType')) { $properties['networkType'] = $NetworkType }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('RetransmitInterval')) { $properties['retransmitInterval'] = $RetransmitInterval }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }
    if ($PSBoundParameters.ContainsKey('Tagid')) { $properties['tagId'] = $Tagid }
    if ($PSBoundParameters.ContainsKey('Transmitdelay')) { $properties['transmitDelay'] = $Transmitdelay }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('ospf6Interface', 'Create ospf6Interface')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospf6Interface -Payload @{ ospf6Interface = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddOspf6interface

# region Invoke-NSAddOspf6router
function Invoke-NSAddOspf6router {
    <#
    .SYNOPSIS
        Creates a NetScaler ospf6Router resource.
    .DESCRIPTION
        Configuration for ospf6Router resource.
    .PARAMETER Addressfamily
        IPv4 or IPv6 Address Family Possible values: ipv4, ipv6
    .PARAMETER Afparams
        The afParams value for the ospf6Router resource.
    .PARAMETER Metric
        The metric of redistributed routes. Minimum value: 0 Maximum value: 16777214
    .PARAMETER MetricType
        OSPFv3 metric type for default routes - OSPFv3 External Type 1 metrics or Type 2 metrics. Minimum value: 1 Maximum value: 2
    .PARAMETER Passiveinterface
        Suppress routing updates on an interface
    .PARAMETER Protocol
        The protocol from which routes need to be redistributed. Possible values: bgp, connected, isis, kernel, ospf, rip, static
    .PARAMETER Redistribute
        The redistribute value for the ospf6Router resource.
    .PARAMETER Routemap
        Route map reference
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospf6Router resource.
    .PARAMETER Routerid
        Router-id for the OSPFv3 process
    .PARAMETER Tagid
        OSPFv3 Tag
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
        Invoke-NSAddOspf6router -Tagid 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddOspf6router -Tagid 'example' -WhatIf
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
        [string] $Addressfamily,

        [Parameter()]
        [string] $Afparams,

        [Parameter()]
        [string] $Metric,

        [Parameter()]
        [string] $MetricType,

        [Parameter()]
        [string] $Passiveinterface,

        [Parameter()]
        [string] $Protocol,

        [Parameter()]
        [string] $Redistribute,

        [Parameter()]
        [string] $Routemap,

        [Parameter()]
        [string] $Routerdynamicrouting,

        [Parameter()]
        [string] $Routerid,

        [Parameter(Mandatory)]
        [string] $Tagid,

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
    if ($PSBoundParameters.ContainsKey('Addressfamily')) { $properties['addressFamily'] = $Addressfamily }
    if ($PSBoundParameters.ContainsKey('Afparams')) { $properties['afParams'] = $Afparams }
    if ($PSBoundParameters.ContainsKey('Metric')) { $properties['metric'] = $Metric }
    if ($PSBoundParameters.ContainsKey('MetricType')) { $properties['metricType'] = $MetricType }
    if ($PSBoundParameters.ContainsKey('Passiveinterface')) { $properties['passiveInterface'] = $Passiveinterface }
    if ($PSBoundParameters.ContainsKey('Protocol')) { $properties['protocol'] = $Protocol }
    if ($PSBoundParameters.ContainsKey('Redistribute')) { $properties['redistribute'] = $Redistribute }
    if ($PSBoundParameters.ContainsKey('Routemap')) { $properties['routeMap'] = $Routemap }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }
    if ($PSBoundParameters.ContainsKey('Routerid')) { $properties['routerId'] = $Routerid }
    if ($PSBoundParameters.ContainsKey('Tagid')) { $properties['tagId'] = $Tagid }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('ospf6Router', 'Create ospf6Router')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospf6Router -Payload @{ ospf6Router = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddOspf6router

# region Invoke-NSAddOspfinterface
function Invoke-NSAddOspfinterface {
    <#
    .SYNOPSIS
        Creates a NetScaler ospfInterface resource.
    .DESCRIPTION
        Configuration for ospfInterface resource.
    .PARAMETER AuthKey
        Authentication password (key).
    .PARAMETER AuthType
        Authentication type on the ospf interface. Possible values: null, simple, message-digest
    .PARAMETER Bfd
        Enable bfd on interface
    .PARAMETER Cost
        Interface cost. Minimum value: 1 Maximum value: 65535
    .PARAMETER DeadInterval
        Interval after which a neighbor is declared dead Minimum value: 1 Maximum value: 65535
    .PARAMETER HelloInterval
        Time between HELLO packets Minimum value: 1 Maximum value: 65535
    .PARAMETER Mtu
        OSPF interface MTU. Minimum value: 576 Maximum value: 65535
    .PARAMETER Name
        Name of the interface
    .PARAMETER NetworkType
        Network type. Possible values: broadcast, non-broadcast, point-to-multipoint, point-to-point
    .PARAMETER Priority
        Router priority. Minimum value: 0 Maximum value: 255
    .PARAMETER RetransmitInterval
        Time between retransmitting lost link state advertisements. Minimum value: 1 Maximum value: 65535
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospfInterface resource.
    .PARAMETER Transmitdelay
        Link state transmit delay. Minimum value: 1 Maximum value: 65535
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
        Invoke-NSAddOspfinterface -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddOspfinterface -Name 'example' -WhatIf
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
        [string] $AuthKey,

        [Parameter()]
        [string] $AuthType,

        [Parameter()]
        [string] $Bfd,

        [Parameter()]
        [string] $Cost,

        [Parameter()]
        [string] $DeadInterval,

        [Parameter()]
        [string] $HelloInterval,

        [Parameter()]
        [string] $Mtu,

        [Parameter(Mandatory)]
        [string] $Name,

        [Parameter()]
        [string] $NetworkType,

        [Parameter()]
        [string] $Priority,

        [Parameter()]
        [string] $RetransmitInterval,

        [Parameter()]
        [string] $Routerdynamicrouting,

        [Parameter()]
        [string] $Transmitdelay,

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
    if ($PSBoundParameters.ContainsKey('AuthKey')) { $properties['authKey'] = $AuthKey }
    if ($PSBoundParameters.ContainsKey('AuthType')) { $properties['authType'] = $AuthType }
    if ($PSBoundParameters.ContainsKey('Bfd')) { $properties['bfd'] = $Bfd }
    if ($PSBoundParameters.ContainsKey('Cost')) { $properties['cost'] = $Cost }
    if ($PSBoundParameters.ContainsKey('DeadInterval')) { $properties['deadInterval'] = $DeadInterval }
    if ($PSBoundParameters.ContainsKey('HelloInterval')) { $properties['helloInterval'] = $HelloInterval }
    if ($PSBoundParameters.ContainsKey('Mtu')) { $properties['mtu'] = $Mtu }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetworkType')) { $properties['networkType'] = $NetworkType }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('RetransmitInterval')) { $properties['retransmitInterval'] = $RetransmitInterval }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }
    if ($PSBoundParameters.ContainsKey('Transmitdelay')) { $properties['transmitDelay'] = $Transmitdelay }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('ospfInterface', 'Create ospfInterface')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospfInterface -Payload @{ ospfInterface = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddOspfinterface

# region Invoke-NSAddOspfrouter
function Invoke-NSAddOspfrouter {
    <#
    .SYNOPSIS
        Creates a NetScaler ospfRouter resource.
    .DESCRIPTION
        Configuration for ospfRouter resource.
    .PARAMETER Area
        OSPF area ID as a decimal value. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER Ipaddress
        OSPF network prefix.
    .PARAMETER Metric
        The metric of redistributed routes. Minimum value: 0 Maximum value: 16777214
    .PARAMETER MetricType
        OSPF metric type for default routes - OSPF External Type 1 metrics or Type 2 metrics. Minimum value: 1 Maximum value: 2
    .PARAMETER NetMask
        The netmask length Minimum value: 0 Maximum value: 32
    .PARAMETER Networks
        The networks value for the ospfRouter resource.
    .PARAMETER OspfProcessId
        The process ID of the ospf instance to redistribute the routes from.
    .PARAMETER Passiveinterface
        Suppress routing updates on an interface
    .PARAMETER ProcessId
        OSPF process ID Minimum value: 1 Maximum value: 65535
    .PARAMETER Protocol
        The protocol from which routes need to be redistributed. Possible values: bgp, connected, intranet, isis, kernel, ospf, rip, static
    .PARAMETER Redistribute
        The redistribute value for the ospfRouter resource.
    .PARAMETER Routemap
        Route map reference
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospfRouter resource.
    .PARAMETER Routerid
        Router-id for the OSPF process
    .PARAMETER Tag
        Set tag for routes redistributed into OSPF Minimum value: 0 Maximum value: 4294967295
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
        Invoke-NSAddOspfrouter -ProcessId 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddOspfrouter -ProcessId 'example' -WhatIf
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
        [string] $Area,

        [Parameter()]
        [string] $Ipaddress,

        [Parameter()]
        [string] $Metric,

        [Parameter()]
        [string] $MetricType,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [string] $Networks,

        [Parameter()]
        [string] $OspfProcessId,

        [Parameter()]
        [string] $Passiveinterface,

        [Parameter(Mandatory)]
        [string] $ProcessId,

        [Parameter()]
        [string] $Protocol,

        [Parameter()]
        [string] $Redistribute,

        [Parameter()]
        [string] $Routemap,

        [Parameter()]
        [string] $Routerdynamicrouting,

        [Parameter()]
        [string] $Routerid,

        [Parameter()]
        [string] $Tag,

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
    if ($PSBoundParameters.ContainsKey('Area')) { $properties['area'] = $Area }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('Metric')) { $properties['metric'] = $Metric }
    if ($PSBoundParameters.ContainsKey('MetricType')) { $properties['metricType'] = $MetricType }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }
    if ($PSBoundParameters.ContainsKey('Networks')) { $properties['networks'] = $Networks }
    if ($PSBoundParameters.ContainsKey('OspfProcessId')) { $properties['ospfProcessId'] = $OspfProcessId }
    if ($PSBoundParameters.ContainsKey('Passiveinterface')) { $properties['passiveInterface'] = $Passiveinterface }
    if ($PSBoundParameters.ContainsKey('ProcessId')) { $properties['processId'] = $ProcessId }
    if ($PSBoundParameters.ContainsKey('Protocol')) { $properties['protocol'] = $Protocol }
    if ($PSBoundParameters.ContainsKey('Redistribute')) { $properties['redistribute'] = $Redistribute }
    if ($PSBoundParameters.ContainsKey('Routemap')) { $properties['routeMap'] = $Routemap }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }
    if ($PSBoundParameters.ContainsKey('Routerid')) { $properties['routerId'] = $Routerid }
    if ($PSBoundParameters.ContainsKey('Tag')) { $properties['tag'] = $Tag }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('ospfRouter', 'Create ospfRouter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospfRouter -Payload @{ ospfRouter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddOspfrouter

# region Invoke-NSAddRoutemap
function Invoke-NSAddRoutemap {
    <#
    .SYNOPSIS
        Creates a NetScaler routeMap resource.
    .DESCRIPTION
        Configuration for routeMap resource.
    .PARAMETER Action
        Specifies if the route-map denies or permits the operations. Possible values: permit, deny
    .PARAMETER LocalPreference
        Set the BGP local preference path attribute. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER Matchaspath
        Match the BGP AS-path list.
    .PARAMETER MatchcommUnitY
        Match BGP community list.
    .PARAMETER Matchipaddress
        Match IP address of route. IP access-list number in the range or acces-list name.
    .PARAMETER Matchipnexthop
        Match next-hop address of route. IP access-list number in the range or acces-list name.
    .PARAMETER Matchmetric
        Match values from routing table. Match metric of route. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER MatchrouteType
        Match OSPF external routes of type 1 or type 2 metrics. Possible values: type-1, type-2
    .PARAMETER Name
        Route map tag.
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the routeMap resource.
    .PARAMETER Rules
        The rules value for the routeMap resource.
    .PARAMETER Sequence
        Sequence to insert to/delete from existing route-map entry. Minimum value: 1 Maximum value: 65535
    .PARAMETER Setaspath
        Set the prepend string for a BGP AS-path attribute
    .PARAMETER SetcommUnitY
        Set the BGP community attribute.
    .PARAMETER Setipnexthop
        Set next hop address of a route.
    .PARAMETER Setmetric
        Set metric value for destination routing protocol. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER SetmetricType
        Set type of metric for destination routing protocol. OSPF external type 1 metric or OSPF external type 2 metric. Possible values: type-1, type-2
    .PARAMETER Weight
        Set BGP weight for routing table. Minimum value: 0 Maximum value: 4294967295
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
        Invoke-NSAddRoutemap -Action 'example' -Name 'example' -Sequence 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddRoutemap -Action 'example' -Name 'example' -Sequence 'example' -WhatIf
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

        [Parameter()]
        [string] $LocalPreference,

        [Parameter()]
        [string] $Matchaspath,

        [Parameter()]
        [string] $MatchcommUnitY,

        [Parameter()]
        [string] $Matchipaddress,

        [Parameter()]
        [string] $Matchipnexthop,

        [Parameter()]
        [string] $Matchmetric,

        [Parameter()]
        [string] $MatchrouteType,

        [Parameter(Mandatory)]
        [string] $Name,

        [Parameter()]
        [string] $Routerdynamicrouting,

        [Parameter()]
        [string] $Rules,

        [Parameter(Mandatory)]
        [string] $Sequence,

        [Parameter()]
        [string] $Setaspath,

        [Parameter()]
        [string] $SetcommUnitY,

        [Parameter()]
        [string] $Setipnexthop,

        [Parameter()]
        [string] $Setmetric,

        [Parameter()]
        [string] $SetmetricType,

        [Parameter()]
        [string] $Weight,

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
    if ($PSBoundParameters.ContainsKey('LocalPreference')) { $properties['localPreference'] = $LocalPreference }
    if ($PSBoundParameters.ContainsKey('Matchaspath')) { $properties['matchAsPath'] = $Matchaspath }
    if ($PSBoundParameters.ContainsKey('MatchcommUnitY')) { $properties['matchCommunity'] = $MatchcommUnitY }
    if ($PSBoundParameters.ContainsKey('Matchipaddress')) { $properties['matchIpAddress'] = $Matchipaddress }
    if ($PSBoundParameters.ContainsKey('Matchipnexthop')) { $properties['matchIpNextHop'] = $Matchipnexthop }
    if ($PSBoundParameters.ContainsKey('Matchmetric')) { $properties['matchMetric'] = $Matchmetric }
    if ($PSBoundParameters.ContainsKey('MatchrouteType')) { $properties['matchRouteType'] = $MatchrouteType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $properties['routerDynamicRouting'] = $Routerdynamicrouting }
    if ($PSBoundParameters.ContainsKey('Rules')) { $properties['rules'] = $Rules }
    if ($PSBoundParameters.ContainsKey('Sequence')) { $properties['sequence'] = $Sequence }
    if ($PSBoundParameters.ContainsKey('Setaspath')) { $properties['setAsPath'] = $Setaspath }
    if ($PSBoundParameters.ContainsKey('SetcommUnitY')) { $properties['setCommunity'] = $SetcommUnitY }
    if ($PSBoundParameters.ContainsKey('Setipnexthop')) { $properties['setIpNextHop'] = $Setipnexthop }
    if ($PSBoundParameters.ContainsKey('Setmetric')) { $properties['setMetric'] = $Setmetric }
    if ($PSBoundParameters.ContainsKey('SetmetricType')) { $properties['setMetricType'] = $SetmetricType }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('routeMap', 'Create routeMap')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type routeMap -Payload @{ routeMap = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddRoutemap

# region Invoke-NSAddRouterdynamicrouting
function Invoke-NSAddRouterdynamicrouting {
    <#
    .SYNOPSIS
        Creates a NetScaler routerdynamicrouting resource.
    .DESCRIPTION
        Configuration for dynamic routing config resource.
    .PARAMETER Commandstring
        command to be executed.
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
        Invoke-NSAddRouterdynamicrouting  -PassThru
    .EXAMPLE
        Invoke-NSAddRouterdynamicrouting  -WhatIf
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
        [string] $Commandstring,

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
    if ($PSBoundParameters.ContainsKey('Commandstring')) { $properties['commandstring'] = $Commandstring }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('routerdynamicrouting', 'Create routerdynamicrouting')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type routerdynamicrouting -Payload @{ routerdynamicrouting = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddRouterdynamicrouting

# region Invoke-NSApplyRouterdynamicrouting
function Invoke-NSApplyRouterdynamicrouting {
    <#
    .SYNOPSIS
        Invokes the apply operation for a NetScaler routerdynamicrouting resource.
    .DESCRIPTION
        Configuration for dynamic routing config resource.
    .PARAMETER Commandstring
        command to be executed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSApplyRouterdynamicrouting 
    .EXAMPLE
        Invoke-NSApplyRouterdynamicrouting  -WhatIf
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
        [string] $Commandstring,

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
        if ($PSBoundParameters.ContainsKey('Commandstring')) { $body['commandstring'] = $Commandstring }

        if ($PSCmdlet.ShouldProcess('routerdynamicrouting', 'Apply routerdynamicrouting')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type routerdynamicrouting -Action apply -Payload @{ routerdynamicrouting = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSApplyRouterdynamicrouting

# region Invoke-NSDeleteAcceSSLIst
function Invoke-NSDeleteAcceSSLIst {
    <#
    .SYNOPSIS
        Removes a NetScaler accessList resource.
    .DESCRIPTION
        Configuration for accessList resource.
    .PARAMETER Id
        Standard access list number in the range or a ZebOS access-list name.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAcceSSLIst -Id 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAcceSSLIst  | Invoke-NSDeleteAcceSSLIst -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter()]
        [string] $Id,

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
        if ($PSBoundParameters.ContainsKey('Id')) {
            $argumentParts += 'id:' + $Id
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('accessList', 'Delete accessList')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type accessList -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAcceSSLIst

# region Invoke-NSDeleteBgprouter
function Invoke-NSDeleteBgprouter {
    <#
    .SYNOPSIS
        Removes a NetScaler bgpRouter resource.
    .DESCRIPTION
        Configuration for bgpRouter resource.
    .PARAMETER LocalAs
        Autonomous system number. Minimum value: 1 Maximum value: 4294967295
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBgprouter -LocalAs 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBgprouter  | Invoke-NSDeleteBgprouter -Confirm:$false
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
        [string] $LocalAs,

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
        if ($PSBoundParameters.ContainsKey('LocalAs')) {
            $argumentParts += 'localAS:' + $LocalAs
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('bgpRouter', 'Delete bgpRouter')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type bgpRouter -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBgprouter

# region Invoke-NSDeleteIproute
function Invoke-NSDeleteIproute {
    <#
    .SYNOPSIS
        Removes a NetScaler ipRoute resource.
    .DESCRIPTION
        Configuration for ipRoute resource.
    .PARAMETER Nexthop
        IP gateway address
    .PARAMETER Prefix
        IP destination prefix.
    .PARAMETER PrefixLength
        IP destination prefix length. Minimum value: 0 Maximum value: 128
    .PARAMETER Addressfamily
        The address family of the route. Possible values: ipv4, ipv6
    .PARAMETER Interface
        IP gateway interface name or pseudo interface Null
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteIproute -Prefix 'example' -PrefixLength 'example' -Addressfamily 'example' -Nexthop 'example' -Interface 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetIproute  | Invoke-NSDeleteIproute -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter()]
        [string] $Nexthop,

        [Parameter(Mandatory)]
        [string] $Prefix,

        [Parameter(Mandatory)]
        [string] $PrefixLength,

        [Parameter(Mandatory)]
        [string] $Addressfamily,

        [Parameter()]
        [string] $Interface,

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
        if ($PSBoundParameters.ContainsKey('Nexthop')) {
            $argumentParts += 'nextHop:' + $Nexthop
        }
        if ($PSBoundParameters.ContainsKey('Prefix')) {
            $argumentParts += 'prefix:' + $Prefix
        }
        if ($PSBoundParameters.ContainsKey('PrefixLength')) {
            $argumentParts += 'prefixLength:' + $PrefixLength
        }
        if ($PSBoundParameters.ContainsKey('Addressfamily')) {
            $argumentParts += 'addressFamily:' + $Addressfamily
        }
        if ($PSBoundParameters.ContainsKey('Interface')) {
            $argumentParts += 'interface:' + $Interface
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('ipRoute', 'Delete ipRoute')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type ipRoute -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteIproute

# region Invoke-NSDeleteOspf6router
function Invoke-NSDeleteOspf6router {
    <#
    .SYNOPSIS
        Removes a NetScaler ospf6Router resource.
    .DESCRIPTION
        Configuration for ospf6Router resource.
    .PARAMETER Tagid
        OSPFv3 Tag
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteOspf6router -Tagid 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetOspf6router  | Invoke-NSDeleteOspf6router -Confirm:$false
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
        [string] $Tagid,

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
        if ($PSBoundParameters.ContainsKey('Tagid')) {
            $argumentParts += 'tagId:' + $Tagid
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('ospf6Router', 'Delete ospf6Router')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type ospf6Router -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteOspf6router

# region Invoke-NSDeleteOspfrouter
function Invoke-NSDeleteOspfrouter {
    <#
    .SYNOPSIS
        Removes a NetScaler ospfRouter resource.
    .DESCRIPTION
        Configuration for ospfRouter resource.
    .PARAMETER ProcessId
        OSPF process ID Minimum value: 1 Maximum value: 65535
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteOspfrouter -ProcessId 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetOspfrouter  | Invoke-NSDeleteOspfrouter -Confirm:$false
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
        [string] $ProcessId,

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
        if ($PSBoundParameters.ContainsKey('ProcessId')) {
            $argumentParts += 'processId:' + $ProcessId
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('ospfRouter', 'Delete ospfRouter')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type ospfRouter -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteOspfrouter

# region Invoke-NSDeleteRoutemap
function Invoke-NSDeleteRoutemap {
    <#
    .SYNOPSIS
        Removes a NetScaler routeMap resource.
    .DESCRIPTION
        Configuration for routeMap resource.
    .PARAMETER Name
        Route map tag.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteRoutemap -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetRoutemap  | Invoke-NSDeleteRoutemap -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Name')) {
            $argumentParts += 'name:' + $Name
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('routeMap', 'Delete routeMap')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type routeMap -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteRoutemap

# region Invoke-NSDeleteRouterdynamicrouting
function Invoke-NSDeleteRouterdynamicrouting {
    <#
    .SYNOPSIS
        Removes a NetScaler routerdynamicrouting resource.
    .DESCRIPTION
        Configuration for dynamic routing config resource.
    .PARAMETER Commandstring
        command to be executed.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteRouterdynamicrouting -Commandstring 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetRouterdynamicrouting  | Invoke-NSDeleteRouterdynamicrouting -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter()]
        [string] $Commandstring,

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
        if ($PSBoundParameters.ContainsKey('Commandstring')) {
            $argumentParts += 'commandstring:' + $Commandstring
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('routerdynamicrouting', 'Delete routerdynamicrouting')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type routerdynamicrouting -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteRouterdynamicrouting

# region Invoke-NSGetAcceSSLIst
function Invoke-NSGetAcceSSLIst {
    <#
    .SYNOPSIS
        Gets NetScaler accessList configuration.
    .DESCRIPTION
        Configuration for accessList resource.
    .PARAMETER Id
        Standard access list number in the range or a ZebOS access-list name.
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
        Invoke-NSGetAcceSSLIst
    .EXAMPLE
        Invoke-NSGetAcceSSLIst -Filter @{ servicetype = 'HTTP' }
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
        [string] $Id,

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
        if ($PSBoundParameters.ContainsKey('Id')) {
            $argumentValue = $Id
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'id:' + $argumentValue
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
            Type = 'accessList'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAcceSSLIst

# region Invoke-NSGetBfdinterface
function Invoke-NSGetBfdinterface {
    <#
    .SYNOPSIS
        Gets NetScaler bfdInterface configuration.
    .DESCRIPTION
        Configuration for bfdInterface resource.
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
        Invoke-NSGetBfdinterface
    .EXAMPLE
        Invoke-NSGetBfdinterface -Filter @{ servicetype = 'HTTP' }
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
            Type = 'bfdInterface'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetBfdinterface

# region Invoke-NSGetBgpprefix
function Invoke-NSGetBgpprefix {
    <#
    .SYNOPSIS
        Gets NetScaler bgpPrefix configuration.
    .DESCRIPTION
        Configuration for bgpPrefix resource.
    .PARAMETER Addressfamily
        The address family of the route. Possible values: ipv4, ipv6
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
        Invoke-NSGetBgpprefix
    .EXAMPLE
        Invoke-NSGetBgpprefix -Filter @{ servicetype = 'HTTP' }
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
        [string] $Addressfamily,

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
        if ($PSBoundParameters.ContainsKey('Addressfamily')) {
            $argumentValue = $Addressfamily
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'addressFamily:' + $argumentValue
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
            Type = 'bgpPrefix'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetBgpprefix

# region Invoke-NSGetBgprouter
function Invoke-NSGetBgprouter {
    <#
    .SYNOPSIS
        Gets NetScaler bgpRouter configuration.
    .DESCRIPTION
        Configuration for bgpRouter resource.
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
        Invoke-NSGetBgprouter
    .EXAMPLE
        Invoke-NSGetBgprouter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'bgpRouter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetBgprouter

# region Invoke-NSGetIproute
function Invoke-NSGetIproute {
    <#
    .SYNOPSIS
        Gets NetScaler ipRoute configuration.
    .DESCRIPTION
        Configuration for ipRoute resource.
    .PARAMETER Addressfamily
        The address family of the route. Possible values: ipv4, ipv6
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
        Invoke-NSGetIproute
    .EXAMPLE
        Invoke-NSGetIproute -Filter @{ servicetype = 'HTTP' }
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
        [string] $Addressfamily,

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
        if ($PSBoundParameters.ContainsKey('Addressfamily')) {
            $argumentValue = $Addressfamily
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'addressFamily:' + $argumentValue
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
            Type = 'ipRoute'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetIproute

# region Invoke-NSGetOspf6DataBase
function Invoke-NSGetOspf6DataBase {
    <#
    .SYNOPSIS
        Gets NetScaler ospf6Database configuration.
    .DESCRIPTION
        Configuration for ospf6Database resource.
    .PARAMETER Tagid
        OSPFv3 process tag
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
        Invoke-NSGetOspf6DataBase
    .EXAMPLE
        Invoke-NSGetOspf6DataBase -Filter @{ servicetype = 'HTTP' }
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
        [string] $Tagid,

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
        if ($PSBoundParameters.ContainsKey('Tagid')) {
            $argumentValue = $Tagid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'tagId:' + $argumentValue
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
            Type = 'ospf6Database'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspf6DataBase

# region Invoke-NSGetOspf6interface
function Invoke-NSGetOspf6interface {
    <#
    .SYNOPSIS
        Gets NetScaler ospf6Interface configuration.
    .DESCRIPTION
        Configuration for ospf6Interface resource.
    .PARAMETER Name
        Name of the interface
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
        Invoke-NSGetOspf6interface
    .EXAMPLE
        Invoke-NSGetOspf6interface -Filter @{ servicetype = 'HTTP' }
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Name')) {
            $argumentValue = $Name
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'name:' + $argumentValue
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
            Type = 'ospf6Interface'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspf6interface

# region Invoke-NSGetOspf6neighbor
function Invoke-NSGetOspf6neighbor {
    <#
    .SYNOPSIS
        Gets NetScaler ospf6Neighbor configuration.
    .DESCRIPTION
        Configuration for ospf6Neighbor resource.
    .PARAMETER Tagid
        OSPFv3 Tag
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
        Invoke-NSGetOspf6neighbor
    .EXAMPLE
        Invoke-NSGetOspf6neighbor -Filter @{ servicetype = 'HTTP' }
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
        [string] $Tagid,

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
        if ($PSBoundParameters.ContainsKey('Tagid')) {
            $argumentValue = $Tagid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'tagId:' + $argumentValue
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
            Type = 'ospf6Neighbor'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspf6neighbor

# region Invoke-NSGetOspf6router
function Invoke-NSGetOspf6router {
    <#
    .SYNOPSIS
        Gets NetScaler ospf6Router configuration.
    .DESCRIPTION
        Configuration for ospf6Router resource.
    .PARAMETER Tagid
        OSPFv3 Tag
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
        Invoke-NSGetOspf6router
    .EXAMPLE
        Invoke-NSGetOspf6router -Filter @{ servicetype = 'HTTP' }
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
        [string] $Tagid,

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
        if ($PSBoundParameters.ContainsKey('Tagid')) {
            $argumentValue = $Tagid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'tagId:' + $argumentValue
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
            Type = 'ospf6Router'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspf6router

# region Invoke-NSGetOspfDataBase
function Invoke-NSGetOspfDataBase {
    <#
    .SYNOPSIS
        Gets NetScaler ospfDatabase configuration.
    .DESCRIPTION
        Configuration for ospfDatabase resource.
    .PARAMETER ProcessId
        OSPF process ID number
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
        Invoke-NSGetOspfDataBase
    .EXAMPLE
        Invoke-NSGetOspfDataBase -Filter @{ servicetype = 'HTTP' }
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
        [string] $ProcessId,

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
        if ($PSBoundParameters.ContainsKey('ProcessId')) {
            $argumentValue = $ProcessId
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'processId:' + $argumentValue
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
            Type = 'ospfDatabase'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspfDataBase

# region Invoke-NSGetOspfinterface
function Invoke-NSGetOspfinterface {
    <#
    .SYNOPSIS
        Gets NetScaler ospfInterface configuration.
    .DESCRIPTION
        Configuration for ospfInterface resource.
    .PARAMETER Name
        Name of the interface
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
        Invoke-NSGetOspfinterface
    .EXAMPLE
        Invoke-NSGetOspfinterface -Filter @{ servicetype = 'HTTP' }
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Name')) {
            $argumentValue = $Name
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'name:' + $argumentValue
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
            Type = 'ospfInterface'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspfinterface

# region Invoke-NSGetOspfneighbor
function Invoke-NSGetOspfneighbor {
    <#
    .SYNOPSIS
        Gets NetScaler ospfNeighbor configuration.
    .DESCRIPTION
        Configuration for ospfNeighbor resource.
    .PARAMETER Routerid
        The IpAddress that uniquely identifies the neighboring router in the Autonomous System.
    .PARAMETER ProcessId
        OSPF process ID number.
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
        Invoke-NSGetOspfneighbor
    .EXAMPLE
        Invoke-NSGetOspfneighbor -Filter @{ servicetype = 'HTTP' }
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
        [string] $Routerid,

        [Parameter(ParameterSetName = 'All')]
        [string] $ProcessId,

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
        if ($PSBoundParameters.ContainsKey('Routerid')) {
            $argumentValue = $Routerid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'routerId:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('ProcessId')) {
            $argumentValue = $ProcessId
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'processId:' + $argumentValue
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
            Type = 'ospfNeighbor'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspfneighbor

# region Invoke-NSGetOspfrouter
function Invoke-NSGetOspfrouter {
    <#
    .SYNOPSIS
        Gets NetScaler ospfRouter configuration.
    .DESCRIPTION
        Configuration for ospfRouter resource.
    .PARAMETER ProcessId
        OSPF process ID Minimum value: 1 Maximum value: 65535
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
        Invoke-NSGetOspfrouter
    .EXAMPLE
        Invoke-NSGetOspfrouter -Filter @{ servicetype = 'HTTP' }
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
        [string] $ProcessId,

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
        if ($PSBoundParameters.ContainsKey('ProcessId')) {
            $argumentValue = $ProcessId
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'processId:' + $argumentValue
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
            Type = 'ospfRouter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetOspfrouter

# region Invoke-NSGetRoutemap
function Invoke-NSGetRoutemap {
    <#
    .SYNOPSIS
        Gets NetScaler routeMap configuration.
    .DESCRIPTION
        Configuration for routeMap resource.
    .PARAMETER Name
        Route map tag.
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
        Invoke-NSGetRoutemap
    .EXAMPLE
        Invoke-NSGetRoutemap -Filter @{ servicetype = 'HTTP' }
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Name')) {
            $argumentValue = $Name
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'name:' + $argumentValue
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
            Type = 'routeMap'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetRoutemap

# region Invoke-NSGetRouterdynamicrouting
function Invoke-NSGetRouterdynamicrouting {
    <#
    .SYNOPSIS
        Gets NetScaler routerdynamicrouting configuration.
    .DESCRIPTION
        Configuration for dynamic routing config resource.
    .PARAMETER Commandstring
        command to be executed.
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
        Invoke-NSGetRouterdynamicrouting
    .EXAMPLE
        Invoke-NSGetRouterdynamicrouting -Filter @{ servicetype = 'HTTP' }
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
        [string] $Commandstring,

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
        if ($PSBoundParameters.ContainsKey('Commandstring')) {
            $argumentValue = $Commandstring
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'commandstring:' + $argumentValue
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
            Type = 'routerdynamicrouting'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetRouterdynamicrouting

# region Invoke-NSUnsetAcceSSLIst
function Invoke-NSUnsetAcceSSLIst {
    <#
    .SYNOPSIS
        Clears one or more NetScaler accessList resource properties.
    .DESCRIPTION
        Configuration for accessList resource.
    .PARAMETER Action
        Allow or deny if traffic matches the rule. Possible values: deny, permit
    .PARAMETER Address
        Address to match.
    .PARAMETER Id
        Standard access list number in the range or a ZebOS access-list name.
    .PARAMETER Remark
        Access list entry comment.
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the accessList resource.
    .PARAMETER Rules
        The rules value for the accessList resource.
    .PARAMETER Wildcard
        Wildcard bits.
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
        Invoke-NSUnsetAcceSSLIst -Action  -PassThru
    .EXAMPLE
        Invoke-NSUnsetAcceSSLIst -Action  -WhatIf
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
        [switch] $Action,

        [Parameter()]
        [switch] $Address,

        [Parameter()]
        [switch] $Id,

        [Parameter()]
        [switch] $Remark,

        [Parameter()]
        [switch] $Routerdynamicrouting,

        [Parameter()]
        [switch] $Rules,

        [Parameter()]
        [switch] $Wildcard,

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
        if ($PSBoundParameters.ContainsKey('Action')) { $body['action'] = $true }
        if ($PSBoundParameters.ContainsKey('Address')) { $body['address'] = $true }
        if ($PSBoundParameters.ContainsKey('Id')) { $body['id'] = $true }
        if ($PSBoundParameters.ContainsKey('Remark')) { $body['remark'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }
        if ($PSBoundParameters.ContainsKey('Rules')) { $body['rules'] = $true }
        if ($PSBoundParameters.ContainsKey('Wildcard')) { $body['wildcard'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('accessList', 'Clear accessList properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type accessList -Action unset -Payload @{ accessList = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAcceSSLIst

# region Invoke-NSUnsetBfdinterface
function Invoke-NSUnsetBfdinterface {
    <#
    .SYNOPSIS
        Clears one or more NetScaler bfdInterface resource properties.
    .DESCRIPTION
        Configuration for bfdInterface resource.
    .PARAMETER Name
        Name of the interface
    .PARAMETER Passive
        Make bfd session passive
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the bfdInterface resource.
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
        Invoke-NSUnsetBfdinterface -Name  -PassThru
    .EXAMPLE
        Invoke-NSUnsetBfdinterface -Name  -WhatIf
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
        [switch] $Name,

        [Parameter()]
        [switch] $Passive,

        [Parameter()]
        [switch] $Routerdynamicrouting,

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
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $true }
        if ($PSBoundParameters.ContainsKey('Passive')) { $body['passive'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('bfdInterface', 'Clear bfdInterface properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type bfdInterface -Action unset -Payload @{ bfdInterface = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetBfdinterface

# region Invoke-NSUnsetBgprouter
function Invoke-NSUnsetBgprouter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler bgpRouter resource properties.
    .DESCRIPTION
        Configuration for bgpRouter resource.
    .PARAMETER Activate
        Enable the Address Family for the neighbor.
    .PARAMETER Address
        The ipv4 or ipv6 address of the neighboring router.
    .PARAMETER Addressfamily
        Address family of the routes. Possible values: ipv4, ipv6
    .PARAMETER AdvertisementInterval
        Minimum interval between sending BGP routing updates. Minimum value: 0 Maximum value: 65535
    .PARAMETER Afparams
        The afParams value for the bgpRouter resource.
    .PARAMETER AsoriginationInterval
        Minimum interval between sending AS-origination routing updates. Minimum value: 1 Maximum value: 65535
    .PARAMETER ConnEcttimer
        Time interval (in seconds) for the ConnectRetry timer. Minimum value: 1 Maximum value: 65535
    .PARAMETER Direction
        Apply the route-map to incoming routes or outgoing routes. Possible values: in, out
    .PARAMETER Keepalivetimerconfig
        Configured keepalive time for the neighbor. Minimum value: 0 Maximum value: 65535
    .PARAMETER LocalAs
        Autonomous system number. Minimum value: 1 Maximum value: 4294967295
    .PARAMETER Md5password
        MD5 password for the neighbor.
    .PARAMETER MultiHopbfd
        Enable BFD for multihop session
    .PARAMETER Name
        Name of the route-map.
    .PARAMETER Neighbor
        The neighbor value for the bgpRouter resource.
    .PARAMETER Protocol
        The protocol from which routes need to be redistributed. Possible values: kernel, connected, static, rip, ospf, isis, intranet
    .PARAMETER Redistribute
        The redistribute value for the bgpRouter resource.
    .PARAMETER Remoteas
        AS number of the neighbor. Minimum value: 1 Maximum value: 4294967295
    .PARAMETER Routemap
        Route map reference
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the bgpRouter resource.
    .PARAMETER Routerid
        The router identifier for the bgp routing instance.
    .PARAMETER Singlehopbfd
        Enable BFD on this neighbor
    .PARAMETER TCPMss
        TCP maximum segment size Minimum value: 1 Maximum value: 65535
    .PARAMETER Updatesource
        Source of routing updates.
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
        Invoke-NSUnsetBgprouter -Activate  -PassThru
    .EXAMPLE
        Invoke-NSUnsetBgprouter -Activate  -WhatIf
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
        [switch] $Activate,

        [Parameter()]
        [switch] $Address,

        [Parameter()]
        [switch] $Addressfamily,

        [Parameter()]
        [switch] $AdvertisementInterval,

        [Parameter()]
        [switch] $Afparams,

        [Parameter()]
        [switch] $AsoriginationInterval,

        [Parameter()]
        [switch] $ConnEcttimer,

        [Parameter()]
        [switch] $Direction,

        [Parameter()]
        [switch] $Keepalivetimerconfig,

        [Parameter()]
        [switch] $LocalAs,

        [Parameter()]
        [switch] $Md5password,

        [Parameter()]
        [switch] $MultiHopbfd,

        [Parameter()]
        [switch] $Name,

        [Parameter()]
        [switch] $Neighbor,

        [Parameter()]
        [switch] $Protocol,

        [Parameter()]
        [switch] $Redistribute,

        [Parameter()]
        [switch] $Remoteas,

        [Parameter()]
        [switch] $Routemap,

        [Parameter()]
        [switch] $Routerdynamicrouting,

        [Parameter()]
        [switch] $Routerid,

        [Parameter()]
        [switch] $Singlehopbfd,

        [Parameter()]
        [switch] $TCPMss,

        [Parameter()]
        [switch] $Updatesource,

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
        if ($PSBoundParameters.ContainsKey('Activate')) { $body['activate'] = $true }
        if ($PSBoundParameters.ContainsKey('Address')) { $body['address'] = $true }
        if ($PSBoundParameters.ContainsKey('Addressfamily')) { $body['addressFamily'] = $true }
        if ($PSBoundParameters.ContainsKey('AdvertisementInterval')) { $body['advertisementInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Afparams')) { $body['afParams'] = $true }
        if ($PSBoundParameters.ContainsKey('AsoriginationInterval')) { $body['ASOriginationInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('ConnEcttimer')) { $body['connectTimer'] = $true }
        if ($PSBoundParameters.ContainsKey('Direction')) { $body['direction'] = $true }
        if ($PSBoundParameters.ContainsKey('Keepalivetimerconfig')) { $body['keepaliveTimerConfig'] = $true }
        if ($PSBoundParameters.ContainsKey('LocalAs')) { $body['localAS'] = $true }
        if ($PSBoundParameters.ContainsKey('Md5password')) { $body['md5Password'] = $true }
        if ($PSBoundParameters.ContainsKey('MultiHopbfd')) { $body['multihopBfd'] = $true }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $true }
        if ($PSBoundParameters.ContainsKey('Neighbor')) { $body['neighbor'] = $true }
        if ($PSBoundParameters.ContainsKey('Protocol')) { $body['protocol'] = $true }
        if ($PSBoundParameters.ContainsKey('Redistribute')) { $body['redistribute'] = $true }
        if ($PSBoundParameters.ContainsKey('Remoteas')) { $body['remoteAS'] = $true }
        if ($PSBoundParameters.ContainsKey('Routemap')) { $body['routeMap'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerid')) { $body['routerId'] = $true }
        if ($PSBoundParameters.ContainsKey('Singlehopbfd')) { $body['singlehopBfd'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPMss')) { $body['tcpMSS'] = $true }
        if ($PSBoundParameters.ContainsKey('Updatesource')) { $body['updateSource'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('bgpRouter', 'Clear bgpRouter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type bgpRouter -Action unset -Payload @{ bgpRouter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetBgprouter

# region Invoke-NSUnsetOspf6interface
function Invoke-NSUnsetOspf6interface {
    <#
    .SYNOPSIS
        Clears one or more NetScaler ospf6Interface resource properties.
    .DESCRIPTION
        Configuration for ospf6Interface resource.
    .PARAMETER Areaid
        Area on which OSPFv3 is running Minimum value: 0 Maximum value: 4294967295
    .PARAMETER Cost
        Interface cost. Minimum value: 1 Maximum value: 65535
    .PARAMETER DeadInterval
        Interval after which a neighbor is declared dead Minimum value: 1 Maximum value: 65535
    .PARAMETER HelloInterval
        Time between HELLO packets Minimum value: 1 Maximum value: 65535
    .PARAMETER Instanceid
        Interface Instance Id - for v6, for v4 Minimum value: 0 Maximum value: 255
    .PARAMETER Name
        Name of the interface
    .PARAMETER NetworkType
        Network type Possible values: broadcast, non-broadcast, point-to-multipoint, point-to-point
    .PARAMETER Priority
        Router priority. Minimum value: 0 Maximum value: 255
    .PARAMETER RetransmitInterval
        Time between retransmitting lost link state advertisements. Minimum value: 1 Maximum value: 65535
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospf6Interface resource.
    .PARAMETER Tagid
        OSPFv3 Tag
    .PARAMETER Transmitdelay
        Link state transmit delay. Minimum value: 1 Maximum value: 65535
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
        Invoke-NSUnsetOspf6interface -Areaid  -PassThru
    .EXAMPLE
        Invoke-NSUnsetOspf6interface -Areaid  -WhatIf
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
        [switch] $Areaid,

        [Parameter()]
        [switch] $Cost,

        [Parameter()]
        [switch] $DeadInterval,

        [Parameter()]
        [switch] $HelloInterval,

        [Parameter()]
        [switch] $Instanceid,

        [Parameter()]
        [switch] $Name,

        [Parameter()]
        [switch] $NetworkType,

        [Parameter()]
        [switch] $Priority,

        [Parameter()]
        [switch] $RetransmitInterval,

        [Parameter()]
        [switch] $Routerdynamicrouting,

        [Parameter()]
        [switch] $Tagid,

        [Parameter()]
        [switch] $Transmitdelay,

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
        if ($PSBoundParameters.ContainsKey('Areaid')) { $body['areaId'] = $true }
        if ($PSBoundParameters.ContainsKey('Cost')) { $body['cost'] = $true }
        if ($PSBoundParameters.ContainsKey('DeadInterval')) { $body['deadInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('HelloInterval')) { $body['helloInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Instanceid')) { $body['instanceId'] = $true }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $true }
        if ($PSBoundParameters.ContainsKey('NetworkType')) { $body['networkType'] = $true }
        if ($PSBoundParameters.ContainsKey('Priority')) { $body['priority'] = $true }
        if ($PSBoundParameters.ContainsKey('RetransmitInterval')) { $body['retransmitInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }
        if ($PSBoundParameters.ContainsKey('Tagid')) { $body['tagId'] = $true }
        if ($PSBoundParameters.ContainsKey('Transmitdelay')) { $body['transmitDelay'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('ospf6Interface', 'Clear ospf6Interface properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospf6Interface -Action unset -Payload @{ ospf6Interface = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetOspf6interface

# region Invoke-NSUnsetOspf6router
function Invoke-NSUnsetOspf6router {
    <#
    .SYNOPSIS
        Clears one or more NetScaler ospf6Router resource properties.
    .DESCRIPTION
        Configuration for ospf6Router resource.
    .PARAMETER Addressfamily
        IPv4 or IPv6 Address Family Possible values: ipv4, ipv6
    .PARAMETER Afparams
        The afParams value for the ospf6Router resource.
    .PARAMETER Metric
        The metric of redistributed routes. Minimum value: 0 Maximum value: 16777214
    .PARAMETER MetricType
        OSPFv3 metric type for default routes - OSPFv3 External Type 1 metrics or Type 2 metrics. Minimum value: 1 Maximum value: 2
    .PARAMETER Passiveinterface
        Suppress routing updates on an interface
    .PARAMETER Protocol
        The protocol from which routes need to be redistributed. Possible values: bgp, connected, isis, kernel, ospf, rip, static
    .PARAMETER Redistribute
        The redistribute value for the ospf6Router resource.
    .PARAMETER Routemap
        Route map reference
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospf6Router resource.
    .PARAMETER Routerid
        Router-id for the OSPFv3 process
    .PARAMETER Tagid
        OSPFv3 Tag
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
        Invoke-NSUnsetOspf6router -Addressfamily  -PassThru
    .EXAMPLE
        Invoke-NSUnsetOspf6router -Addressfamily  -WhatIf
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
        [switch] $Addressfamily,

        [Parameter()]
        [switch] $Afparams,

        [Parameter()]
        [switch] $Metric,

        [Parameter()]
        [switch] $MetricType,

        [Parameter()]
        [switch] $Passiveinterface,

        [Parameter()]
        [switch] $Protocol,

        [Parameter()]
        [switch] $Redistribute,

        [Parameter()]
        [switch] $Routemap,

        [Parameter()]
        [switch] $Routerdynamicrouting,

        [Parameter()]
        [switch] $Routerid,

        [Parameter()]
        [switch] $Tagid,

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
        if ($PSBoundParameters.ContainsKey('Addressfamily')) { $body['addressFamily'] = $true }
        if ($PSBoundParameters.ContainsKey('Afparams')) { $body['afParams'] = $true }
        if ($PSBoundParameters.ContainsKey('Metric')) { $body['metric'] = $true }
        if ($PSBoundParameters.ContainsKey('MetricType')) { $body['metricType'] = $true }
        if ($PSBoundParameters.ContainsKey('Passiveinterface')) { $body['passiveInterface'] = $true }
        if ($PSBoundParameters.ContainsKey('Protocol')) { $body['protocol'] = $true }
        if ($PSBoundParameters.ContainsKey('Redistribute')) { $body['redistribute'] = $true }
        if ($PSBoundParameters.ContainsKey('Routemap')) { $body['routeMap'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerid')) { $body['routerId'] = $true }
        if ($PSBoundParameters.ContainsKey('Tagid')) { $body['tagId'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('ospf6Router', 'Clear ospf6Router properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospf6Router -Action unset -Payload @{ ospf6Router = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetOspf6router

# region Invoke-NSUnsetOspfinterface
function Invoke-NSUnsetOspfinterface {
    <#
    .SYNOPSIS
        Clears one or more NetScaler ospfInterface resource properties.
    .DESCRIPTION
        Configuration for ospfInterface resource.
    .PARAMETER AuthKey
        Authentication password (key).
    .PARAMETER AuthType
        Authentication type on the ospf interface. Possible values: null, simple, message-digest
    .PARAMETER Bfd
        Enable bfd on interface
    .PARAMETER Cost
        Interface cost. Minimum value: 1 Maximum value: 65535
    .PARAMETER DeadInterval
        Interval after which a neighbor is declared dead Minimum value: 1 Maximum value: 65535
    .PARAMETER HelloInterval
        Time between HELLO packets Minimum value: 1 Maximum value: 65535
    .PARAMETER Mtu
        OSPF interface MTU. Minimum value: 576 Maximum value: 65535
    .PARAMETER Name
        Name of the interface
    .PARAMETER NetworkType
        Network type. Possible values: broadcast, non-broadcast, point-to-multipoint, point-to-point
    .PARAMETER Priority
        Router priority. Minimum value: 0 Maximum value: 255
    .PARAMETER RetransmitInterval
        Time between retransmitting lost link state advertisements. Minimum value: 1 Maximum value: 65535
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospfInterface resource.
    .PARAMETER Transmitdelay
        Link state transmit delay. Minimum value: 1 Maximum value: 65535
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
        Invoke-NSUnsetOspfinterface -AuthKey  -PassThru
    .EXAMPLE
        Invoke-NSUnsetOspfinterface -AuthKey  -WhatIf
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
        [switch] $AuthKey,

        [Parameter()]
        [switch] $AuthType,

        [Parameter()]
        [switch] $Bfd,

        [Parameter()]
        [switch] $Cost,

        [Parameter()]
        [switch] $DeadInterval,

        [Parameter()]
        [switch] $HelloInterval,

        [Parameter()]
        [switch] $Mtu,

        [Parameter()]
        [switch] $Name,

        [Parameter()]
        [switch] $NetworkType,

        [Parameter()]
        [switch] $Priority,

        [Parameter()]
        [switch] $RetransmitInterval,

        [Parameter()]
        [switch] $Routerdynamicrouting,

        [Parameter()]
        [switch] $Transmitdelay,

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
        if ($PSBoundParameters.ContainsKey('AuthKey')) { $body['authKey'] = $true }
        if ($PSBoundParameters.ContainsKey('AuthType')) { $body['authType'] = $true }
        if ($PSBoundParameters.ContainsKey('Bfd')) { $body['bfd'] = $true }
        if ($PSBoundParameters.ContainsKey('Cost')) { $body['cost'] = $true }
        if ($PSBoundParameters.ContainsKey('DeadInterval')) { $body['deadInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('HelloInterval')) { $body['helloInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Mtu')) { $body['mtu'] = $true }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $true }
        if ($PSBoundParameters.ContainsKey('NetworkType')) { $body['networkType'] = $true }
        if ($PSBoundParameters.ContainsKey('Priority')) { $body['priority'] = $true }
        if ($PSBoundParameters.ContainsKey('RetransmitInterval')) { $body['retransmitInterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }
        if ($PSBoundParameters.ContainsKey('Transmitdelay')) { $body['transmitDelay'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('ospfInterface', 'Clear ospfInterface properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospfInterface -Action unset -Payload @{ ospfInterface = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetOspfinterface

# region Invoke-NSUnsetOspfrouter
function Invoke-NSUnsetOspfrouter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler ospfRouter resource properties.
    .DESCRIPTION
        Configuration for ospfRouter resource.
    .PARAMETER Area
        OSPF area ID as a decimal value. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER Ipaddress
        OSPF network prefix.
    .PARAMETER Metric
        The metric of redistributed routes. Minimum value: 0 Maximum value: 16777214
    .PARAMETER MetricType
        OSPF metric type for default routes - OSPF External Type 1 metrics or Type 2 metrics. Minimum value: 1 Maximum value: 2
    .PARAMETER NetMask
        The netmask length Minimum value: 0 Maximum value: 32
    .PARAMETER Networks
        The networks value for the ospfRouter resource.
    .PARAMETER OspfProcessId
        The process ID of the ospf instance to redistribute the routes from.
    .PARAMETER Passiveinterface
        Suppress routing updates on an interface
    .PARAMETER ProcessId
        OSPF process ID Minimum value: 1 Maximum value: 65535
    .PARAMETER Protocol
        The protocol from which routes need to be redistributed. Possible values: bgp, connected, intranet, isis, kernel, ospf, rip, static
    .PARAMETER Redistribute
        The redistribute value for the ospfRouter resource.
    .PARAMETER Routemap
        Route map reference
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the ospfRouter resource.
    .PARAMETER Routerid
        Router-id for the OSPF process
    .PARAMETER Tag
        Set tag for routes redistributed into OSPF Minimum value: 0 Maximum value: 4294967295
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
        Invoke-NSUnsetOspfrouter -Area  -PassThru
    .EXAMPLE
        Invoke-NSUnsetOspfrouter -Area  -WhatIf
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
        [switch] $Area,

        [Parameter()]
        [switch] $Ipaddress,

        [Parameter()]
        [switch] $Metric,

        [Parameter()]
        [switch] $MetricType,

        [Parameter()]
        [switch] $NetMask,

        [Parameter()]
        [switch] $Networks,

        [Parameter()]
        [switch] $OspfProcessId,

        [Parameter()]
        [switch] $Passiveinterface,

        [Parameter()]
        [switch] $ProcessId,

        [Parameter()]
        [switch] $Protocol,

        [Parameter()]
        [switch] $Redistribute,

        [Parameter()]
        [switch] $Routemap,

        [Parameter()]
        [switch] $Routerdynamicrouting,

        [Parameter()]
        [switch] $Routerid,

        [Parameter()]
        [switch] $Tag,

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
        if ($PSBoundParameters.ContainsKey('Area')) { $body['area'] = $true }
        if ($PSBoundParameters.ContainsKey('Ipaddress')) { $body['ipaddress'] = $true }
        if ($PSBoundParameters.ContainsKey('Metric')) { $body['metric'] = $true }
        if ($PSBoundParameters.ContainsKey('MetricType')) { $body['metricType'] = $true }
        if ($PSBoundParameters.ContainsKey('NetMask')) { $body['netmask'] = $true }
        if ($PSBoundParameters.ContainsKey('Networks')) { $body['networks'] = $true }
        if ($PSBoundParameters.ContainsKey('OspfProcessId')) { $body['ospfProcessId'] = $true }
        if ($PSBoundParameters.ContainsKey('Passiveinterface')) { $body['passiveInterface'] = $true }
        if ($PSBoundParameters.ContainsKey('ProcessId')) { $body['processId'] = $true }
        if ($PSBoundParameters.ContainsKey('Protocol')) { $body['protocol'] = $true }
        if ($PSBoundParameters.ContainsKey('Redistribute')) { $body['redistribute'] = $true }
        if ($PSBoundParameters.ContainsKey('Routemap')) { $body['routeMap'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerid')) { $body['routerId'] = $true }
        if ($PSBoundParameters.ContainsKey('Tag')) { $body['tag'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('ospfRouter', 'Clear ospfRouter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ospfRouter -Action unset -Payload @{ ospfRouter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetOspfrouter

# region Invoke-NSUnsetRoutemap
function Invoke-NSUnsetRoutemap {
    <#
    .SYNOPSIS
        Clears one or more NetScaler routeMap resource properties.
    .DESCRIPTION
        Configuration for routeMap resource.
    .PARAMETER Action
        Specifies if the route-map denies or permits the operations. Possible values: permit, deny
    .PARAMETER LocalPreference
        Set the BGP local preference path attribute. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER Matchaspath
        Match the BGP AS-path list.
    .PARAMETER MatchcommUnitY
        Match BGP community list.
    .PARAMETER Matchipaddress
        Match IP address of route. IP access-list number in the range or acces-list name.
    .PARAMETER Matchipnexthop
        Match next-hop address of route. IP access-list number in the range or acces-list name.
    .PARAMETER Matchmetric
        Match values from routing table. Match metric of route. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER MatchrouteType
        Match OSPF external routes of type 1 or type 2 metrics. Possible values: type-1, type-2
    .PARAMETER Name
        Route map tag.
    .PARAMETER Routerdynamicrouting
        The routerDynamicRouting value for the routeMap resource.
    .PARAMETER Rules
        The rules value for the routeMap resource.
    .PARAMETER Sequence
        Sequence to insert to/delete from existing route-map entry. Minimum value: 1 Maximum value: 65535
    .PARAMETER Setaspath
        Set the prepend string for a BGP AS-path attribute
    .PARAMETER SetcommUnitY
        Set the BGP community attribute.
    .PARAMETER Setipnexthop
        Set next hop address of a route.
    .PARAMETER Setmetric
        Set metric value for destination routing protocol. Minimum value: 0 Maximum value: 4294967295
    .PARAMETER SetmetricType
        Set type of metric for destination routing protocol. OSPF external type 1 metric or OSPF external type 2 metric. Possible values: type-1, type-2
    .PARAMETER Weight
        Set BGP weight for routing table. Minimum value: 0 Maximum value: 4294967295
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
        Invoke-NSUnsetRoutemap -Action  -PassThru
    .EXAMPLE
        Invoke-NSUnsetRoutemap -Action  -WhatIf
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
        [switch] $Action,

        [Parameter()]
        [switch] $LocalPreference,

        [Parameter()]
        [switch] $Matchaspath,

        [Parameter()]
        [switch] $MatchcommUnitY,

        [Parameter()]
        [switch] $Matchipaddress,

        [Parameter()]
        [switch] $Matchipnexthop,

        [Parameter()]
        [switch] $Matchmetric,

        [Parameter()]
        [switch] $MatchrouteType,

        [Parameter()]
        [switch] $Name,

        [Parameter()]
        [switch] $Routerdynamicrouting,

        [Parameter()]
        [switch] $Rules,

        [Parameter()]
        [switch] $Sequence,

        [Parameter()]
        [switch] $Setaspath,

        [Parameter()]
        [switch] $SetcommUnitY,

        [Parameter()]
        [switch] $Setipnexthop,

        [Parameter()]
        [switch] $Setmetric,

        [Parameter()]
        [switch] $SetmetricType,

        [Parameter()]
        [switch] $Weight,

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
        if ($PSBoundParameters.ContainsKey('Action')) { $body['action'] = $true }
        if ($PSBoundParameters.ContainsKey('LocalPreference')) { $body['localPreference'] = $true }
        if ($PSBoundParameters.ContainsKey('Matchaspath')) { $body['matchAsPath'] = $true }
        if ($PSBoundParameters.ContainsKey('MatchcommUnitY')) { $body['matchCommunity'] = $true }
        if ($PSBoundParameters.ContainsKey('Matchipaddress')) { $body['matchIpAddress'] = $true }
        if ($PSBoundParameters.ContainsKey('Matchipnexthop')) { $body['matchIpNextHop'] = $true }
        if ($PSBoundParameters.ContainsKey('Matchmetric')) { $body['matchMetric'] = $true }
        if ($PSBoundParameters.ContainsKey('MatchrouteType')) { $body['matchRouteType'] = $true }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $true }
        if ($PSBoundParameters.ContainsKey('Routerdynamicrouting')) { $body['routerDynamicRouting'] = $true }
        if ($PSBoundParameters.ContainsKey('Rules')) { $body['rules'] = $true }
        if ($PSBoundParameters.ContainsKey('Sequence')) { $body['sequence'] = $true }
        if ($PSBoundParameters.ContainsKey('Setaspath')) { $body['setAsPath'] = $true }
        if ($PSBoundParameters.ContainsKey('SetcommUnitY')) { $body['setCommunity'] = $true }
        if ($PSBoundParameters.ContainsKey('Setipnexthop')) { $body['setIpNextHop'] = $true }
        if ($PSBoundParameters.ContainsKey('Setmetric')) { $body['setMetric'] = $true }
        if ($PSBoundParameters.ContainsKey('SetmetricType')) { $body['setMetricType'] = $true }
        if ($PSBoundParameters.ContainsKey('Weight')) { $body['weight'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('routeMap', 'Clear routeMap properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type routeMap -Action unset -Payload @{ routeMap = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetRoutemap

# region Invoke-NSUnsetRouterdynamicrouting
function Invoke-NSUnsetRouterdynamicrouting {
    <#
    .SYNOPSIS
        Clears one or more NetScaler routerdynamicrouting resource properties.
    .DESCRIPTION
        Configuration for dynamic routing config resource.
    .PARAMETER Commandstring
        command to be executed.
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
        Invoke-NSUnsetRouterdynamicrouting -Commandstring  -PassThru
    .EXAMPLE
        Invoke-NSUnsetRouterdynamicrouting -Commandstring  -WhatIf
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
        [switch] $Commandstring,

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
        if ($PSBoundParameters.ContainsKey('Commandstring')) { $body['commandstring'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('routerdynamicrouting', 'Clear routerdynamicrouting properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type routerdynamicrouting -Action unset -Payload @{ routerdynamicrouting = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetRouterdynamicrouting

# region Invoke-NSUpdateRouterdynamicrouting
function Invoke-NSUpdateRouterdynamicrouting {
    <#
    .SYNOPSIS
        Updates a NetScaler routerdynamicrouting resource.
    .DESCRIPTION
        Configuration for dynamic routing config resource.
    .PARAMETER Commandstring
        command to be executed.
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
        Invoke-NSUpdateRouterdynamicrouting  -PassThru
    .EXAMPLE
        Invoke-NSUpdateRouterdynamicrouting  -WhatIf
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
        [string] $Commandstring,

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
    if ($PSBoundParameters.ContainsKey('Commandstring')) { $properties['commandstring'] = $Commandstring }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('routerdynamicrouting', 'Update routerdynamicrouting')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type routerdynamicrouting -Payload @{ routerdynamicrouting = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateRouterdynamicrouting

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDO75fxM3eGQ6Kt
# 9kbFb7xecT5IZoue9XsgDq5Oxil7XqCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgyIC6
# yj5YNRN7coaSy3bKxfPedHN6DxhOMkVTjKQYwTYwDQYJKoZIhvcNAQEBBQAEggGA
# vpFLad/We4FmQ3LJ3Alj77or4UL55l5qe4EoacS/dbDfUsahlAX9kTsywY68nC1Q
# ofT9LtJ0X38ALvj4DAVzxm3pVTRddINr+BZ9Ng8JF79fo36q/fiIysiJzj8FQjzT
# 1DfOD8TwGO6mrDpFlhZ6Ul6GKP2J3wpBSr3Epw6bVtKYwYd4AXDLy/Gj+6sM2Ert
# MdTIglvQii/vXcCZYrTwQ9HlKkJTijJ6HYIfAJ62axWz7vsB8E1BdJ9BS4SUDsSd
# ZU16V5TPwFtM4BAFRKiNiKvANBk8s7TLkK06mzTuEsXg8Ljbbk7NJ77wAJ9QopHB
# wf+o9rPzIQAurUu9RkTp0GQjdhWutEd/Y5w1+5bizHYZ6+P84MrBPOKWwYWNzOES
# yaEXMqzzyNfKbgiVVRHnejrhGABkiooKPcg5aKJcZlsHiPP/sbo5HjNBlNd/OREq
# mOi1RAdPnlXStx8gPzBFw0yEbMnAvw74HgGDvSrkuy5+P1xOJCrqW2YmziVhAPHg
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIFMBkw9KrS+HTSCbWsCc
# hPBbo2m54XoapSCbYjmtn28oAgZqNWdtxIIYEzIwMjYwODAzMTI1MjI3Ljk3Nlow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYD
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
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAW0q1jUEybdx0AAAAAABbMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwNVoXDTI3MDEwNzE4NTkwNVow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAJBUzBbbnlDXee0B0KD5G4/475thFyfctCyu
# ESTWQXvlLi4Wx/td2qUdeq4ideeg6VWhiOHfu3wJV4TUGSRtqh9Ccr1BmiBKv9iu
# FpgHyIBu5Qx38ZsxwlFeXVS+ZqJJKnXRbDNQdcYSoC/6c0hQJ/PH50DBRDQkPXVw
# yFizLrRH9AlrJeUg7BKeT23zftS8/KOJLvEEbHOF6pSOY3ZVprZUWbWjWwRTmoHa
# Q/E8vrWtLNyEJ+b089VW1Ikra3t4GTB5Wby3CL1K2zYnAxBIvafsKMFyj9OuXHcT
# PKMDoFSMeamG9MKOMb6uoG1PjdnDgsLP6EOMRSzrLL7jED1mbB9RSd9fhty+HQr6
# vZgsBn6oUy+YTpNVLskwdtUM82WYAkPztlOt3AiL0qyV7/U3j/uq3vHMjPM0w034
# 0M57Nei0g4BCcMt0dbqoc91VgCb3/36sHQANontn1HOF2oLk8190QRS43isHVra8
# H8sf5+GlqIYsYiCKX04HZiOzZW826nVI6d++8lyTeWmpj90Ua9uPbJhVjwE3oh6t
# O510ySqmSMSLEN07p3Ibe3E6BAb2w93rWzb26+dpSthbKF4kApofqBsWPX4MEtHK
# SOftPmVTCQ47tghrVuHia9jY+Hsj01m4KW4WtkmVm3L6hMZECMa4sjMxAXz+bX/A
# JhWTe6TZAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQU7/LqUlWWYhXJdXwgYKx4b8Gv
# 0rYwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQAAH+zd+XKh4OxXYMWFmtgilXAQGctOjCUB1w/uBiC/OXcH
# 3Ia4/XbdUhKzFbaiTbIE6vYZKd1p4u7nKOLkawymAMVyuO7LSl6rLKttZIyLhWjT
# K0zXOz0u4xLq9+bRtBEKJvA6sD5nJwH1IO6z1YizyuIRoalMCnbrUixfWxQn4TAm
# N7t9uk+X2FUThEa3ewzRwhtG+xwaAbLMkxRmR24JnfXd1VxKo90+m7Wzuov96Uug
# x5wZdewiIIm1ZWTj4lCJHup679LcOa7tAxJMipVaSltQH9fm9TOKczlfxtWuBcLU
# 4duZfqwgsILsH7PMkcX1zwQzQD0yAtPhnYz9KNG125bX+iilOe1S8RHqv2bbBpMp
# ao4kcUvQI6dMgKRvFmm1eLbhSNOQplDMTGD1tNVdNGkI96jUu+troUjWMMi46TQf
# BAHxtDTpRhIu/87vAVQ8Z6RHhFxesz4Ed5JThaIQRAy6GcO/Jk+QzDzoZ0arRIkI
# sGJ7rZgOVAjx9ctfw8lH9RfjcwB3wdGBYNMNVJqQpUai2Taddf5pXzTZEHIqLEF5
# 3SrBjIeInoQrP7U5VlXiMQsxewLdINrAE2l2TR3KBikb+RQRygbTp8jj2yiC0NCU
# wG+K+ndglN5RMbXjFW6aKa59Xq+b8XzK/DK+AJtgOpHgJv8Qrk62A+twOVLOpjGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABbSrWNQTJt3HQAAAAAAFswDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgLw2itcBovDEMGVOckDUR5BfboZH5aerP39PnxxcQW2wwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCAvMQNVXZ0b0xxlGw8X/3IEybObuT6a5W1d61CW+cGD
# 7zB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzAiBCAbqG4YmPPZjXQMdTxD
# kTahOynpFQpsK7T7qt7engOZRjANBgkqhkiG9w0BAQsFAASCAgAlKEJu8Mjo+gmQ
# WN2+PoDjv2caJ3+QB7q/mAWAu3bKiuT0JlK7JP1jUK4DnQrH1x6NsGjFCiVcxuKI
# AMcWJAMMuJPX60E8O9C8rlwqSDk0B0KgIPC/oym4EvfqqnP2+Xl2q9h6vlRSqdka
# 69J/c0zb/8cXChzG09mviQ5j1ASoJKbXbf5hYrmdO7O8cH+/t6fDodnsYlVocU9m
# pETpFI8clO3BDvRuPfG7Vg9WxHVcKspvFj2t4Pq8O8mIpWIk6jZR+vmd3aV460uQ
# bZJdB5Sl4Xz0amqdiHlTm9RxkvGl+oGtZ9mTrWB6gvpknuv/RcpoLlGrjvPNXcVd
# XBw42mULG0WTO5ULTiUDItGwwY3oN7yNmbFvk91iuqpAJCJjuSvPTyy0GD2JYDE9
# +44KqmKErpunvJke3gpjAyZSKqRZzdTc49G8pvHPktlc4PA+zqygbvsdG0lYr764
# j8F+viWTija1lVcHnTYYhfHypik305mWxVkZpNEwjJWgSt6Skj+1BKsPRks6S8P7
# 0c+feyjE1OaznMkGr1xnE6VtMWqk6NwePp2pkU+NcPbuzX3pwBZ8Xkz5KpqBZThW
# 0elplIUfP2qRX52QpHRKkIuMMirSYiEiPgQaU7gwWmI3pyHXbMN+yUwqXdke27AR
# XJXmctf70oTD99d5WHThujnDy3g1cw==
# SIG # End signature block
