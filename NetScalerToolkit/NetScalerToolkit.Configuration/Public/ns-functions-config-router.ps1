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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDO75fxM3eGQ6Kt
# 9kbFb7xecT5IZoue9XsgDq5Oxil7XqCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCDIgLrKPlg1E3tyhpLLdsrF8950c3oPGE4yRVOMpBjB
# NjANBgkqhkiG9w0BAQEFAASCAYDCAKZOO82PqMOZ+mUct+70MFnN3wp6MiEzM2OR
# iDXMyngXRSIr3QtX6WBD9tX19QNKL6pvSGrlMqZtzbh2Ej/vLMSE7isDKZCNP472
# w078/KM0tuMmsJzU0Ex2OFnwcFe/73hS3sYQ7KoFStEflmcDTJ4c161dH5Ca+gDz
# 3heSMvwR2Jx+RPAfKs24kIQekti4yOtpvXMCrj+gs7yyxn0xDcocsh1E3wKxp4AT
# M/HTOe4A2YskU5Qi1g0czYbwngYtKXyqXMp04V132TYDBpqL5e4pOrIX8f0dQwV5
# e+YQZQDPERH/1oiq1+JhVlvJ+VNUAsw5e74RbDd6GSVo0Tu9pAoIZx6Cjtd7H637
# Yecj8JdqkJZckWTLzn47ka2P2PH8hmV8H1LNIRZbEQX7lTUQt4KNVzCVvOMlNiwy
# 0/HuLPQ/OorI80OtTg4PQhHDb/tCV9NREKr6dt4HxqYIej/bHLrKURkDjlWw2KrN
# se79dBA941+19tW0kMy32kxwiaihggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU2MjlaMD8GCSqGSIb3
# DQEJBDEyBDBYBTJ9sHSjlVjjtFHMwPBB/wrMkHADxWyQXtvJSR6qQu1kYFAd6WQV
# T+Y1p3xZhSEwDQYJKoZIhvcNAQEBBQAEggIAFclpVGeQPAQBy5BVSId1Hh4Vna25
# ANcxa5elmbu7RZrzaZuLayqSL8bsPO4VwF56f/MmA/nzvqPN/mHsQk5rKmWUqsjd
# IG7+nsQr8irG69AkCqoyEPj5zuCa5lCjH+yVuMD1o/BHJJA/M/E72iYuG9XCwq28
# WEx17Fffq9Ju9qFyZVd/yRe2VZRfYrYieeEEVs5kBNeod914fPz8WZwB2dHlkLjq
# xPCBgPNOqbDiAo9tyJA0qGflMNlzPEt/DfqBwZtrWdh67JaWjvqlbGwIlSeXckR2
# SE+u0wRWp42ldM6CdvDMeGF2kQpRsDdITOho457X1DPqIPmNShjXMYs2zBMXyde3
# IE5MVYohY7ljnPv62Z8rkjiv0vxVQwfFgecc9ZfvNzXhXuZsANqayoo/jW070hc0
# nl2tg6m+cYeaLvk6mu8ASRfgt6bod0U5PYYUbhhCcTATf3m5vq4ejQiDwioiorVC
# rG8fhl4bfXXIccVeHn8efQ03lZ/wU3md54dI0+cJKYFChcaxLL4xSNrKnlS08WWO
# xBIpdE4j36kJDaizXU98iuCjTBpcH/gtywYZaPne4KbJqWkLl/qBBJDFVtfwckI7
# eQ2ukU9NnBNoY0xDmh7jZhRBQhYpaxb4tkKrv1mdo16AfA7ajC0XSSM/LRdSwHpn
# ArPlowhedt/HGWY=
# SIG # End signature block
