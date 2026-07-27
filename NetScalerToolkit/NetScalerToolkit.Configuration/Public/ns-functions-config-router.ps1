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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgyIC6
# yj5YNRN7coaSy3bKxfPedHN6DxhOMkVTjKQYwTYwDQYJKoZIhvcNAQEBBQAEggGA
# V6HAYIcQbRAo/SvOFCNApHZtURoHjbGWO3ZxQxF/lRiqIoeRGOArHtstYlhIiIji
# NtWT06KDO82nx2BabaXlzbiXy/AZJk+EAKiN1d+1Mxd05P68INtiEvb+908bfsM1
# vZuN3H1Uii0pqvZIBdEEGankLW7Jo721rAZJy039z1Y0zP/fLDZqg8fOf0TRA7WB
# G53Gq0qV68/7vUqhFrnebEHylSinw1OuCdRqGJFCBhpI/DK4mdvPpvS39QYCCK74
# dM7ywpPmNXwQ6VE+JaqsqoGPaZgx/srOs5kFBXqir3QjppPRfmouY8BqzJm0Xn6F
# Gr+rewPcAkiaeFbALwZ7phrye9lyXUFvfyC/D4Wb7KvWgPSwTiAzWDpIE8G/fshI
# 59EehcAPnGzLkaeGsJ6YrqnIyCKcTPITsdxrgLP/k6z8use1PVZ8X4PtWv27/yQ/
# V3YYd0C9B8murhRs+98RbQaNRWnsdXajpFeLL9slNVsA6ECbLr4UsBKZtVbzHGmg
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIHSqR0J6ekbkq14vNFeZ
# hUatvHxtG9ld5yxC04vKmSbyAgZqNTBOQRsYEzIwMjYwNzI3MTMxMjI1LjMxMVow
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
# IgQg0IwfK9xJFC1n+1h3HKhZMmqQQc+ESLtya73Y4hQv6Zowgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCCQq79qqwkD4ea/FiBm
# C4pfvGQpmxVmt9dVg+iQDGdTljANBgkqhkiG9w0BAQsFAASCAgB9bZkBTvFIVbYU
# ZnWj2zKKtR7HLe+3RcCpYxPESOUsoDneqw11P/riuDLCI8wk+ckBanLYoQwYbKoD
# jFZkfw1rWeSdB0HSka2mlaasCDKTCAfL7jmCCA/b6QwxI82qStNl8LD+RklIWpC0
# vBmGjHCOwc8HzFuyEiBdCuWskMmsRMMYEAhnqAtZwRsi8pI5gZLFTaGSYMKShDqR
# 5XV5cyub6U9UDNa4XUWmaTiBwXtbowDpjGfAvmvUsWaU3A1QQWTQd9OzJ7CwF7vk
# 3qA9SFWqzwcIRmVV4QNHe2cqfrufNUJEim2qibtTzlo8V0UoDRWf9ibVem88sFmy
# BSm1JpLtnQo772ux3lBlr5q5pqGKIXEPVD+cTOnCxuRtyqT0KELRul4Kj5XSWQ8s
# hHvA6L4WP+5G4G/XETzEBwUrMKGDGK/uQ+hdy30GaD2pcpu2sxQVOMvySkXAUgQO
# 8TEzPDsqXUmpaDdfsmJuI9cVmCjEFnlgCEx00CyshcewmHsuMQLLWvDfTzcFLLWe
# YPL/MtCwEbN4qSe0q1zqIA2ketinVBZjDWpjpbS06ESvneruGbumfcW4jAoFKCjf
# RUXDLOMgOluQBwZOmNjfPV7GJnELTYPqLRFat61viXypzmOkpi9hbNyBphhkYwUd
# 3tp7IRa84spVpgY0GynBxGLVlagfWA==
# SIG # End signature block
