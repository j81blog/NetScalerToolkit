# Generated NetScalerToolkit Configuration bundle for category 'basic'.

# region Invoke-NSAddLocation
function Invoke-NSAddLocation {
    <#
    .SYNOPSIS
        Creates a NetScaler location resource.
    .DESCRIPTION
        Configuration for location resource.
    .PARAMETER Ipfrom
        First IP address in the range, in dotted decimal notation. Minimum length = 1
    .PARAMETER Ipto
        Last IP address in the range, in dotted decimal notation. Minimum length = 1
    .PARAMETER Latitude
        Numerical value, in degrees, specifying the latitude of the geographical location of the IP address-range. Note: Longitude and latitude parameters are used for selecting a service with the static proximity GSLB method. If they are not specified, selection is based on the qualifiers specified for the location. Minimum value = -90 Maximum value = 90
    .PARAMETER Longitude
        Numerical value, in degrees, specifying the longitude of the geographical location of the IP address-range. Note: Longitude and latitude parameters are used for selecting a service with the static proximity GSLB method. If they are not specified, selection is based on the qualifiers specified for the location. Minimum value = -180 Maximum value = 180
    .PARAMETER Preferredlocation
        String of qualifiers, in dotted notation, describing the geographical location of the IP address range. Each qualifier is more specific than the one that precedes it, as in continent.country.region.city.isp.organization. For example, "NA.US.CA.San Jose.ATT.citrix". Note: A qualifier that includes a dot (.) or space ( ) must be enclosed in double quotation marks. Minimum length = 1
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
        Invoke-NSAddLocation -Ipfrom 'example' -Ipto 'example' -Preferredlocation 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLocation -Ipfrom 'example' -Ipto 'example' -Preferredlocation 'example' -WhatIf
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
        [string] $Ipfrom,

        [Parameter(Mandatory)]
        [string] $Ipto,

        [Parameter()]
        [int] $Latitude,

        [Parameter()]
        [int] $Longitude,

        [Parameter(Mandatory)]
        [string] $Preferredlocation,

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
    if ($PSBoundParameters.ContainsKey('Ipfrom')) { $properties['ipfrom'] = $Ipfrom }
    if ($PSBoundParameters.ContainsKey('Ipto')) { $properties['ipto'] = $Ipto }
    if ($PSBoundParameters.ContainsKey('Latitude')) { $properties['latitude'] = $Latitude }
    if ($PSBoundParameters.ContainsKey('Longitude')) { $properties['longitude'] = $Longitude }
    if ($PSBoundParameters.ContainsKey('Preferredlocation')) { $properties['preferredlocation'] = $Preferredlocation }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ipfrom", 'Create location')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type location -Payload @{ location = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLocation -Ipfrom $Ipfrom -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLocation

# region Invoke-NSAddLocationFile
function Invoke-NSAddLocationFile {
    <#
    .SYNOPSIS
        Creates a NetScaler locationfile resource.
    .DESCRIPTION
        Configuration for location file resource.
    .PARAMETER FormAt
        Format of the location file. Required for the NetScaler to identify how to read the location file. Default value: netscaler Possible values = netscaler, ip-country, ip-country-isp, ip-country-region-city, ip-country-region-city-isp, geoip-country, geoip-region, geoip-city, geoip-country-org, geoip-country-isp, geoip-city-isp-org
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
        Invoke-NSAddLocationFile  -PassThru
    .EXAMPLE
        Invoke-NSAddLocationFile  -WhatIf
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
        [ValidateSet('netscaler', 'ip-country', 'ip-country-isp', 'ip-country-region-city', 'ip-country-region-city-isp', 'geoip-country', 'geoip-region', 'geoip-city', 'geoip-country-org', 'geoip-country-isp', 'geoip-city-isp-org')]
        [string] $FormAt,

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
    if ($PSBoundParameters.ContainsKey('FormAt')) { $properties['format'] = $FormAt }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('locationfile', 'Create locationfile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type locationfile -Payload @{ locationfile = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddLocationFile

# region Invoke-NSAddLocationFile6
function Invoke-NSAddLocationFile6 {
    <#
    .SYNOPSIS
        Creates a NetScaler locationfile6 resource.
    .DESCRIPTION
        Configuration for location file6 resource.
    .PARAMETER FormAt
        Format of the IPv6 location file. Required for the NetScaler to identify how to read the location file. Default value: netscaler6 Possible values = netscaler6, geoip-country6
    .PARAMETER LocationFile
        Name of the IPv6 location file, with or without absolute path. If the path is not included, the default path (/var/netscaler/locdb) is assumed. In a high availability setup, the static database must be stored in the same location on both NetScalers. Minimum length = 1
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
        Invoke-NSAddLocationFile6 -LocationFile 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLocationFile6 -LocationFile 'example' -WhatIf
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
        [ValidateSet('netscaler6', 'geoip-country6')]
        [string] $FormAt,

        [Parameter(Mandatory)]
        [string] $LocationFile,

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
    if ($PSBoundParameters.ContainsKey('FormAt')) { $properties['format'] = $FormAt }
    if ($PSBoundParameters.ContainsKey('LocationFile')) { $properties['Locationfile'] = $LocationFile }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('locationfile6', 'Create locationfile6')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type locationfile6 -Payload @{ locationfile6 = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddLocationFile6

# region Invoke-NSAddRADIUSNode
function Invoke-NSAddRADIUSNode {
    <#
    .SYNOPSIS
        Creates a NetScaler radiusnode resource.
    .DESCRIPTION
        Configuration for RADIUS Node resource.
    .PARAMETER Nodeprefix
        IP address/IP prefix of radius node in CIDR format.
    .PARAMETER RadKey
        The key shared between the RADIUS server and clients. Required for NetScaler to communicate with the RADIUS nodes.
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
        Invoke-NSAddRADIUSNode -Nodeprefix 'example' -RadKey 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddRADIUSNode -Nodeprefix 'example' -RadKey 'example' -WhatIf
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
        [string] $Nodeprefix,

        [Parameter(Mandatory)]
        [string] $RadKey,

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
    if ($PSBoundParameters.ContainsKey('Nodeprefix')) { $properties['nodeprefix'] = $Nodeprefix }
    if ($PSBoundParameters.ContainsKey('RadKey')) { $properties['radkey'] = $RadKey }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Nodeprefix", 'Create radiusnode')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type radiusnode -Payload @{ radiusnode = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetRADIUSNode -Nodeprefix $Nodeprefix -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddRADIUSNode

# region Invoke-NSAddServer
function Invoke-NSAddServer {
    <#
    .SYNOPSIS
        Creates a NetScaler server.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Comment
        Any information about the server.
    .PARAMETER Domain
        Domain name of the server. For a domain based configuration, you must create the server first. Minimum length = 1
    .PARAMETER Domainresolveretry
        Time, in seconds, for which the NetScaler must wait, after DNS resolution fails, before sending the next DNS query to resolve the domain name. Default value: 5 Minimum value = 5 Maximum value = 20939
    .PARAMETER Ipaddress
        IPv4 or IPv6 address of the server. If you create an IP address based server, you can specify the name of the server, instead of its IP address, when creating a service. Note: If you do not create a server entry, the server IP address that you enter when you create a service becomes the name of the server.
    .PARAMETER IPv6Address
        Support IPv6 addressing mode. If you configure a server with the IPv6 addressing mode, you cannot use the server in the IPv4 addressing mode. Default value: NO Possible values = YES, NO
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER QueryType
        Specify the type of DNS resolution to be done on the configured domain to get the backend services. Valid query types are A, AAAA and SRV with A being the default querytype. The type of DNS resolution done on the domains in SRV records is inherited from ipv6 argument. Default value: A Possible values = A, AAAA, SRV
    .PARAMETER State
        Initial state of the server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Trafficdomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER Translationip
        IP address used to transform the server's DNS-resolved IP address.
    .PARAMETER TranslationMask
        The netmask of the translation ip.
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
        Invoke-NSAddServer -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddServer -Name 'example' -WhatIf
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
        [string] $Comment,

        [Parameter()]
        [string] $Domain,

        [Parameter()]
        [int] $Domainresolveretry,

        [Parameter()]
        [string] $Ipaddress,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $IPv6Address,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('A', 'AAAA', 'SRV')]
        [string] $QueryType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $Trafficdomain,

        [Parameter()]
        [string] $Translationip,

        [Parameter()]
        [string] $TranslationMask,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('IPv6Address')) { $properties['ipv6address'] = $IPv6Address }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('QueryType')) { $properties['querytype'] = $QueryType }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Trafficdomain')) { $properties['td'] = $Trafficdomain }
    if ($PSBoundParameters.ContainsKey('Translationip')) { $properties['translationip'] = $Translationip }
    if ($PSBoundParameters.ContainsKey('TranslationMask')) { $properties['translationmask'] = $TranslationMask }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create server')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type server -Payload @{ server = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddServer

# region Invoke-NSAddService
function Invoke-NSAddService {
    <#
    .SYNOPSIS
        Creates a NetScaler service.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER AccessDown
        Use Layer 2 mode to bridge the packets sent to this service if it is marked as DOWN. If the service is DOWN, and this parameter is disabled, the packets are dropped. Default value: NO Possible values = YES, NO
    .PARAMETER AIGWProfileName
        Name of the AIGW Profile that contains AIGW Endpoint setting for the service. Minimum length = 1 Maximum length = 255
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cacheable
        Use the transparent cache redirection virtual server to forward requests to the cache server. Note: Do not specify this parameter if you set the Cache Type parameter. Default value: NO Possible values = YES, NO
    .PARAMETER CacheType
        Cache type supported by the cache server. Possible values = TRANSPARENT, REVERSE, FORWARD
    .PARAMETER CIP
        Before forwarding a request to the service, insert an HTTP header with the client's IPv4 or IPv6 address as its value. Used if the server needs the client's IP address for security, accounting, or other purposes, and setting the Use Source IP parameter is not a viable option. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name for the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If you set the Client IP parameter, and you do not specify a name for the header, the appliance uses the header name specified for the global Client IP Header parameter (the cipHeader parameter in the set ns param CLI command or the Client IP Header parameter in the Configure HTTP Parameters dialog box at System > Settings > Change HTTP parameters). If the global Client IP Header parameter is not specified, the appliance inserts a header with the name "client-ip.". Minimum length = 1
    .PARAMETER CKA
        Enable client keep-alive for the service. Possible values = YES, NO
    .PARAMETER ClearTextPort
        Port to which clear text data must be sent after the appliance decrypts incoming SSL traffic. Applicable to transparent SSL services. Minimum value = 1
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER CMP
        Enable compression for the service. Possible values = YES, NO
    .PARAMETER Comment
        Any information about the service.
    .PARAMETER ContentInSpecTionProfileName
        Name of the ContentInspection profile that contains IPS/IDS communication related setting for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER CustomServerID
        Unique identifier for the service. Used when the persistency type for the virtual server is set to Custom Server ID. Default value: "None"
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the service. DNS profile properties will applied to the transactions processed by a service. This parameter is valid only for ADNS, ADNS-TCP and ADNS-DOT services. Minimum length = 1 Maximum length = 127
    .PARAMETER DownStateFlush
        Flush all active transactions associated with a service whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER HashID
        A numerical identifier that can be used by hash based load balancing methods. Must be unique for each service. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of this service. Available settings function as follows: YES - Send probes to check the health of the service. NO - Do not send probes to check the health of the service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER HTTPProfileName
        Name of the HTTP profile that contains HTTP configuration settings for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER Ip
        IP to assign to the service. Minimum length = 1
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated to the service. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections to the service. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MaxReq
        Maximum number of requests that can be sent on a persistent connection to the service. Note: Connection requests beyond this value are rejected. Minimum value = 0 Maximum value = 65535
    .PARAMETER MonConnectionClose
        Close monitoring connections by sending the service a connection termination message with the specified bit set. Default value: NONE Possible values = RESET, FIN
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this service. Used to determine whether to mark a service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
    .PARAMETER NetProfile
        Network profile to use for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER PathMonitor
        Path monitoring for clustering. Possible values = YES, NO
    .PARAMETER PathMonitorIndv
        Individual Path monitoring decisions. Possible values = YES, NO
    .PARAMETER Port
        Port number of the service. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProcessLocal
        By turning on this option packets destined to a service in a cluster will not under go any steering. Turn this option for single packet request response mode or when the upstream device is performing a proper RSS for connection based distribution. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the service. Minimum length = 1 Maximum length = 255
    .PARAMETER RTSPSessionIDRemap
        Enable RTSP session ID mapping for the service. Default value: OFF Possible values = ON, OFF
    .PARAMETER ServerID
        The identifier for the service. This is used when the persistency type is set to Custom Server ID.
    .PARAMETER ServerName
        Name of the server that hosts the service. Minimum length = 1
    .PARAMETER ServiceType
        Protocol in which data is exchanged with the service. Possible values = HTTP, FTP, TCP, UDP, SSL, SSL_BRIDGE, SSL_TCP, DTLS, NNTP, RPCSVR, DNS, ADNS, SNMP, RTSP, DHCPRA, ANY, SIP_UDP, SIP_TCP, SIP_SSL, DNS_TCP, ADNS_TCP, MYSQL, MSSQL, ORACLE, MONGO, MONGO_TLS, RADIUS, RADIUSListener, RDP, DIAMETER, SSL_DIAMETER, TFTP, SMPP, PPTP, GRE, SYSLOGTCP, SYSLOGUDP, FIX, SSL_FIX, USER_TCP, USER_SSL_TCP, QUIC, IPFIX, LOGSTREAM, LOGSTREAM_SSL, MQTT, MQTT_TLS, QUIC_BRIDGE, DOT, ADNS_DOT, HTTP_QUIC, ADNS_DOH, KAFKA_BROKER
    .PARAMETER SP
        Enable surge protection for the service. Possible values = ON, OFF
    .PARAMETER State
        Initial state of the service. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER TCPB
        Enable TCP buffering for the service. Possible values = YES, NO
    .PARAMETER TCPProfileName
        Name of the TCP profile that contains TCP configuration settings for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER UseProxyPort
        Use the proxy port as the source port when initiating connections with the server. With the NO setting, the client-side connection port is used as the source port for the server-side connection. Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES. Possible values = YES, NO
    .PARAMETER USIP
        Use the client's IP address as the source IP address when initiating a connection to the server. When creating a service, if you do not set this parameter, the service inherits the global Use Source IP setting (available in the enable ns mode and disable ns mode CLI commands, or in the System > Settings > Configure modes > Configure Modes dialog box). However, you can override this setting after you create the service. Possible values = YES, NO
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
        Invoke-NSAddService -Name 'example' -Port 80 -ServiceType HTTP -PassThru
    .EXAMPLE
        Invoke-NSAddService -Name 'example' -Port 80 -ServiceType HTTP -WhatIf
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
        [ValidateSet('YES', 'NO')]
        [string] $AccessDown,

        [Parameter()]
        [string] $AIGWProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowLog,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Cacheable,

        [Parameter()]
        [ValidateSet('TRANSPARENT', 'REVERSE', 'FORWARD')]
        [string] $CacheType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CKA,

        [Parameter()]
        [int] $ClearTextPort,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CMP,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $ContentInSpecTionProfileName,

        [Parameter()]
        [string] $CustomServerID,

        [Parameter()]
        [string] $DNSProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [int] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HealthMonitor,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [string] $Ip,

        [Parameter()]
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [int] $MaxReq,

        [Parameter()]
        [ValidateSet('RESET', 'FIN')]
        [string] $MonConnectionClose,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitor,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitorIndv,

        [Parameter(Mandatory)]
        [int] $Port,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ProcessLocal,

        [Parameter()]
        [string] $QUICProfileName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $RTSPSessionIDRemap,

        [Parameter()]
        [int] $ServerID,

        [Parameter()]
        [string] $ServerName,

        [Parameter(Mandatory)]
        [string] $ServiceType,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SP,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $SvrTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $TCPB,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UseProxyPort,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $USIP,

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

    if ($PSBoundParameters.ContainsKey('ServiceType')) {
        Assert-NSParameterValue -ParameterName 'ServiceType' -Value $ServiceType -AllowedValuesByVersion @{ '13.1' = @('HTTP', 'FTP', 'TCP', 'UDP', 'SSL', 'SSL_BRIDGE', 'SSL_TCP', 'DTLS', 'NNTP', 'RPCSVR', 'DNS', 'ADNS', 'SNMP', 'RTSP', 'DHCPRA', 'ANY', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'DNS_TCP', 'ADNS_TCP', 'MYSQL', 'MSSQL', 'ORACLE', 'MONGO', 'MONGO_TLS', 'RADIUS', 'RADIUSListener', 'RDP', 'DIAMETER', 'SSL_DIAMETER', 'TFTP', 'SMPP', 'PPTP', 'GRE', 'SYSLOGTCP', 'SYSLOGUDP', 'FIX', 'SSL_FIX', 'USER_TCP', 'USER_SSL_TCP', 'QUIC', 'IPFIX', 'LOGSTREAM', 'LOGSTREAM_SSL', 'MQTT', 'MQTT_TLS', 'QUIC_BRIDGE'); '14.1' = @('HTTP', 'FTP', 'TCP', 'UDP', 'SSL', 'SSL_BRIDGE', 'SSL_TCP', 'DTLS', 'NNTP', 'RPCSVR', 'DNS', 'ADNS', 'SNMP', 'RTSP', 'DHCPRA', 'ANY', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'DNS_TCP', 'ADNS_TCP', 'MYSQL', 'MSSQL', 'ORACLE', 'MONGO', 'MONGO_TLS', 'RADIUS', 'RADIUSListener', 'RDP', 'DIAMETER', 'SSL_DIAMETER', 'TFTP', 'SMPP', 'PPTP', 'GRE', 'SYSLOGTCP', 'SYSLOGUDP', 'FIX', 'SSL_FIX', 'USER_TCP', 'USER_SSL_TCP', 'QUIC', 'IPFIX', 'LOGSTREAM', 'LOGSTREAM_SSL', 'MQTT', 'MQTT_TLS', 'QUIC_BRIDGE', 'DOT', 'ADNS_DOT', 'HTTP_QUIC', 'ADNS_DOH', 'KAFKA_BROKER') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AccessDown')) { $properties['accessdown'] = $AccessDown }
    if ($PSBoundParameters.ContainsKey('AIGWProfileName')) { $properties['aigwprofilename'] = $AIGWProfileName }
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('Cacheable')) { $properties['cacheable'] = $Cacheable }
    if ($PSBoundParameters.ContainsKey('CacheType')) { $properties['cachetype'] = $CacheType }
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('CKA')) { $properties['cka'] = $CKA }
    if ($PSBoundParameters.ContainsKey('ClearTextPort')) { $properties['cleartextport'] = $ClearTextPort }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('CMP')) { $properties['cmp'] = $CMP }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionProfileName')) { $properties['contentinspectionprofilename'] = $ContentInSpecTionProfileName }
    if ($PSBoundParameters.ContainsKey('CustomServerID')) { $properties['customserverid'] = $CustomServerID }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('Ip')) { $properties['ip'] = $Ip }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MaxReq')) { $properties['maxreq'] = $MaxReq }
    if ($PSBoundParameters.ContainsKey('MonConnectionClose')) { $properties['monconnectionclose'] = $MonConnectionClose }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('PathMonitor')) { $properties['pathmonitor'] = $PathMonitor }
    if ($PSBoundParameters.ContainsKey('PathMonitorIndv')) { $properties['pathmonitorindv'] = $PathMonitorIndv }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('ProcessLocal')) { $properties['processlocal'] = $ProcessLocal }
    if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $properties['quicprofilename'] = $QUICProfileName }
    if ($PSBoundParameters.ContainsKey('RTSPSessionIDRemap')) { $properties['rtspsessionidremap'] = $RTSPSessionIDRemap }
    if ($PSBoundParameters.ContainsKey('ServerID')) { $properties['serverid'] = $ServerID }
    if ($PSBoundParameters.ContainsKey('ServerName')) { $properties['servername'] = $ServerName }
    if ($PSBoundParameters.ContainsKey('ServiceType')) { $properties['servicetype'] = $ServiceType }
    if ($PSBoundParameters.ContainsKey('SP')) { $properties['sp'] = $SP }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $properties['svrtimeout'] = $SvrTimeout }
    if ($PSBoundParameters.ContainsKey('TCPB')) { $properties['tcpb'] = $TCPB }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('UseProxyPort')) { $properties['useproxyport'] = $UseProxyPort }
    if ($PSBoundParameters.ContainsKey('USIP')) { $properties['usip'] = $USIP }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create service')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type service -Payload @{ service = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetService -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddService

# region Invoke-NSAddServiceGroup
function Invoke-NSAddServiceGroup {
    <#
    .SYNOPSIS
        Creates a NetScaler servicegroup resource.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information for the specified service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER AutoDelayedTROFS
        Indicates graceful movement of IP-Port binding/s to TROFS when IP addresses are removed from DNS response. System will wait for monitor response timeout period before moving to TROFS . Default value: NO Possible values = YES, NO
    .PARAMETER AutoDisableDelay
        The time allowed (in seconds) for a graceful shutdown. During this period, new connections or requests will continue to be sent to this service for clients who already have a persistent session on the system. Connections or requests from fresh or new clients who do not yet have a persistence sessions on the system will not be sent to the service. Instead, they will be load balanced among other available services. After the delay time expires, no new requests or connections will be sent to the service.
    .PARAMETER AutoDisableGraceful
        Indicates graceful shutdown of the service. System will wait for all outstanding connections to this service to be closed before disabling the service. Default value: NO Possible values = YES, NO
    .PARAMETER Autoscale
        Auto scale option for a servicegroup. Default value: DISABLED Possible values = DISABLED, DNS, POLICY, CLOUD, API
    .PARAMETER Bootstrap
        Flag to check if kafka broker servicegroup is of type bootstrap or not. Default value: NO Possible values = YES, NO
    .PARAMETER Cacheable
        Use the transparent cache redirection virtual server to forward the request to the cache server. Note: Do not set this parameter if you set the Cache Type. Default value: NO Possible values = YES, NO
    .PARAMETER CacheType
        Cache type supported by the cache server. Possible values = TRANSPARENT, REVERSE, FORWARD
    .PARAMETER CIP
        Insert the Client IP header in requests forwarded to the service. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name of the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If client IP insertion is enabled, and the client IP header is not specified, the value of Client IP Header parameter or the value set by the set ns config command is used as client's IP header name. Minimum length = 1
    .PARAMETER CKA
        Enable client keep-alive for the service group. Possible values = YES, NO
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER CMP
        Enable compression for the specified service. Possible values = YES, NO
    .PARAMETER Comment
        Any information about the service group.
    .PARAMETER DownStateFlush
        Flush all active transactions associated with all the services in the service group whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER HealthMonitor
        Monitor the health of this service. Available settings function as follows: YES - Send probes to check the health of the service. NO - Do not send probes to check the health of the service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER HTTPProfileName
        Name of the HTTP profile that contains HTTP configuration settings for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated for all the services in the service group. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections for the service group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MaxReq
        Maximum number of requests that can be sent on a persistent connection to the service group. Note: Connection requests beyond this value are rejected. Minimum value = 0 Maximum value = 65535
    .PARAMETER MemberPort
        member port.
    .PARAMETER MonConnectionClose
        Close monitoring connections by sending the service a connection termination message with the specified bit set. Default value: NONE Possible values = RESET, FIN
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this service. Used to determine whether to mark a service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER NetProfile
        Network profile for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER PathMonitor
        Path monitoring for clustering. Possible values = YES, NO
    .PARAMETER PathMonitorIndv
        Individual Path monitoring decisions. Possible values = YES, NO
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the service group. Minimum length = 1 Maximum length = 255
    .PARAMETER RTSPSessionIDRemap
        Enable RTSP session ID mapping for the service group. Default value: OFF Possible values = ON, OFF
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER ServiceType
        Protocol used to exchange data with the service. Possible values = HTTP, FTP, TCP, UDP, SSL, SSL_BRIDGE, SSL_TCP, DTLS, NNTP, RPCSVR, DNS, ADNS, SNMP, RTSP, DHCPRA, ANY, SIP_UDP, SIP_TCP, SIP_SSL, DNS_TCP, ADNS_TCP, MYSQL, MSSQL, ORACLE, MONGO, MONGO_TLS, RADIUS, RADIUSListener, RDP, DIAMETER, SSL_DIAMETER, TFTP, SMPP, PPTP, GRE, SYSLOGTCP, SYSLOGUDP, FIX, SSL_FIX, USER_TCP, USER_SSL_TCP, QUIC, IPFIX, LOGSTREAM, LOGSTREAM_SSL, MQTT, MQTT_TLS, QUIC_BRIDGE, DOT, ADNS_DOT, HTTP_QUIC, ADNS_DOH, KAFKA_BROKER
    .PARAMETER SP
        Enable surge protection for the service group. Default value: OFF Possible values = ON, OFF
    .PARAMETER State
        Initial state of the service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER TCPB
        Enable TCP buffering for the service group. Possible values = YES, NO
    .PARAMETER TCPProfileName
        Name of the TCP profile that contains TCP configuration settings for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER TopicName
        Name of the Kafka topic.
    .PARAMETER UseProxyPort
        Use the proxy port as the source port when initiating connections with the server. With the NO setting, the client-side connection port is used as the source port for the server-side connection. Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES. Possible values = YES, NO
    .PARAMETER USIP
        Use client's IP address as the source IP address when initiating connection to the server. With the NO setting, which is the default, a mapped IP (MIP) address or subnet IP (SNIP) address is used as the source IP address to initiate server side connections. Possible values = YES, NO
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
        Invoke-NSAddServiceGroup -ServiceGroupName 'example' -ServiceType HTTP -PassThru
    .EXAMPLE
        Invoke-NSAddServiceGroup -ServiceGroupName 'example' -ServiceType HTTP -WhatIf
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
        [string] $AppFlowLog,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $AutoDelayedTROFS,

        [Parameter()]
        [int] $AutoDisableDelay,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $AutoDisableGraceful,

        [Parameter()]
        [ValidateSet('DISABLED', 'DNS', 'POLICY', 'CLOUD', 'API')]
        [string] $Autoscale,

        [Parameter()]
        [string] $Bootstrap,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Cacheable,

        [Parameter()]
        [ValidateSet('TRANSPARENT', 'REVERSE', 'FORWARD')]
        [string] $CacheType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CKA,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CMP,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HealthMonitor,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [int] $MaxReq,

        [Parameter()]
        [int] $MemberPort,

        [Parameter()]
        [ValidateSet('RESET', 'FIN')]
        [string] $MonConnectionClose,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitor,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitorIndv,

        [Parameter()]
        [string] $QUICProfileName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $RTSPSessionIDRemap,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter(Mandatory)]
        [string] $ServiceType,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SP,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $SvrTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $TCPB,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter()]
        [string] $TopicName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UseProxyPort,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $USIP,

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

    if ($PSBoundParameters.ContainsKey('Bootstrap')) {
        Assert-NSParameterValue -ParameterName 'Bootstrap' -Value $Bootstrap -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('YES', 'NO') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('ServiceType')) {
        Assert-NSParameterValue -ParameterName 'ServiceType' -Value $ServiceType -AllowedValuesByVersion @{ '13.1' = @('HTTP', 'FTP', 'TCP', 'UDP', 'SSL', 'SSL_BRIDGE', 'SSL_TCP', 'DTLS', 'NNTP', 'RPCSVR', 'DNS', 'ADNS', 'SNMP', 'RTSP', 'DHCPRA', 'ANY', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'DNS_TCP', 'ADNS_TCP', 'MYSQL', 'MSSQL', 'ORACLE', 'MONGO', 'MONGO_TLS', 'RADIUS', 'RADIUSListener', 'RDP', 'DIAMETER', 'SSL_DIAMETER', 'TFTP', 'SMPP', 'PPTP', 'GRE', 'SYSLOGTCP', 'SYSLOGUDP', 'FIX', 'SSL_FIX', 'USER_TCP', 'USER_SSL_TCP', 'QUIC', 'IPFIX', 'LOGSTREAM', 'LOGSTREAM_SSL', 'MQTT', 'MQTT_TLS', 'QUIC_BRIDGE'); '14.1' = @('HTTP', 'FTP', 'TCP', 'UDP', 'SSL', 'SSL_BRIDGE', 'SSL_TCP', 'DTLS', 'NNTP', 'RPCSVR', 'DNS', 'ADNS', 'SNMP', 'RTSP', 'DHCPRA', 'ANY', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'DNS_TCP', 'ADNS_TCP', 'MYSQL', 'MSSQL', 'ORACLE', 'MONGO', 'MONGO_TLS', 'RADIUS', 'RADIUSListener', 'RDP', 'DIAMETER', 'SSL_DIAMETER', 'TFTP', 'SMPP', 'PPTP', 'GRE', 'SYSLOGTCP', 'SYSLOGUDP', 'FIX', 'SSL_FIX', 'USER_TCP', 'USER_SSL_TCP', 'QUIC', 'IPFIX', 'LOGSTREAM', 'LOGSTREAM_SSL', 'MQTT', 'MQTT_TLS', 'QUIC_BRIDGE', 'DOT', 'ADNS_DOT', 'HTTP_QUIC', 'ADNS_DOH', 'KAFKA_BROKER') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('AutoDelayedTROFS')) { $properties['autodelayedtrofs'] = $AutoDelayedTROFS }
    if ($PSBoundParameters.ContainsKey('AutoDisableDelay')) { $properties['autodisabledelay'] = $AutoDisableDelay }
    if ($PSBoundParameters.ContainsKey('AutoDisableGraceful')) { $properties['autodisablegraceful'] = $AutoDisableGraceful }
    if ($PSBoundParameters.ContainsKey('Autoscale')) { $properties['autoscale'] = $Autoscale }
    if ($PSBoundParameters.ContainsKey('Bootstrap')) { $properties['bootstrap'] = $Bootstrap }
    if ($PSBoundParameters.ContainsKey('Cacheable')) { $properties['cacheable'] = $Cacheable }
    if ($PSBoundParameters.ContainsKey('CacheType')) { $properties['cachetype'] = $CacheType }
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('CKA')) { $properties['cka'] = $CKA }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('CMP')) { $properties['cmp'] = $CMP }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MaxReq')) { $properties['maxreq'] = $MaxReq }
    if ($PSBoundParameters.ContainsKey('MemberPort')) { $properties['memberport'] = $MemberPort }
    if ($PSBoundParameters.ContainsKey('MonConnectionClose')) { $properties['monconnectionclose'] = $MonConnectionClose }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('PathMonitor')) { $properties['pathmonitor'] = $PathMonitor }
    if ($PSBoundParameters.ContainsKey('PathMonitorIndv')) { $properties['pathmonitorindv'] = $PathMonitorIndv }
    if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $properties['quicprofilename'] = $QUICProfileName }
    if ($PSBoundParameters.ContainsKey('RTSPSessionIDRemap')) { $properties['rtspsessionidremap'] = $RTSPSessionIDRemap }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('ServiceType')) { $properties['servicetype'] = $ServiceType }
    if ($PSBoundParameters.ContainsKey('SP')) { $properties['sp'] = $SP }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $properties['svrtimeout'] = $SvrTimeout }
    if ($PSBoundParameters.ContainsKey('TCPB')) { $properties['tcpb'] = $TCPB }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('TopicName')) { $properties['topicname'] = $TopicName }
    if ($PSBoundParameters.ContainsKey('UseProxyPort')) { $properties['useproxyport'] = $UseProxyPort }
    if ($PSBoundParameters.ContainsKey('USIP')) { $properties['usip'] = $USIP }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Create servicegroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type servicegroup -Payload @{ servicegroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddServiceGroup

# region Invoke-NSAddServiceGroupLBMonitorBinding
function Invoke-NSAddServiceGroupLBMonitorBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler servicegroup_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to servicegroup.
    .PARAMETER CustomServerID
        Unique service identifier. Used when the persistency type for the virtual server is set to Custom Server ID. Default value: "None"
    .PARAMETER DBSTTL
        Specify the TTL for DNS record for domain based service.The default value of ttl is 0 which indicates to use the TTL received in DNS response for monitors. Default value: 0
    .PARAMETER HashID
        Unique numerical identifier used by hash based load balancing methods to identify a service. Minimum value = 1
    .PARAMETER MonItorName
        Monitor name.
    .PARAMETER MonState
        Monitor state. Possible values = ENABLED, DISABLED
    .PARAMETER NameServer
        Specify the nameserver to which the query for bound domain needs to be sent. If not specified, use the global nameserver.
    .PARAMETER Order
        Order number to be assigned to the servicegroup member. Minimum value = 1 Maximum value = 8192
    .PARAMETER Passive
        Indicates if load monitor is passive. A passive load monitor does not remove service from LB decision when threshold is breached.
    .PARAMETER Port
        Port number of the service. Each service must have a unique port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ServerID
        The identifier for the service. This is used when the persistency type is set to Custom Server ID.
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
    .PARAMETER State
        Initial state of the service after binding. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Weight
        Weight to assign to the servers in the service group. Specifies the capacity of the servers relative to the other servers in the load balancing configuration. The higher the weight, the higher the percentage of requests sent to the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSAddServiceGroupLBMonitorBinding -ServiceGroupName 'example' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddServiceGroupLBMonitorBinding -ServiceGroupName 'example' -Port 80 -WhatIf
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
        [string] $CustomServerID,

        [Parameter()]
        [int] $DBSTTL,

        [Parameter()]
        [int] $HashID,

        [Parameter()]
        [string] $MonItorName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $MonState,

        [Parameter()]
        [string] $NameServer,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [bool] $Passive,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [int] $ServerID,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

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
    if ($PSBoundParameters.ContainsKey('CustomServerID')) { $properties['customserverid'] = $CustomServerID }
    if ($PSBoundParameters.ContainsKey('DBSTTL')) { $properties['dbsttl'] = $DBSTTL }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('MonItorName')) { $properties['monitor_name'] = $MonItorName }
    if ($PSBoundParameters.ContainsKey('MonState')) { $properties['monstate'] = $MonState }
    if ($PSBoundParameters.ContainsKey('NameServer')) { $properties['nameserver'] = $NameServer }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('Passive')) { $properties['passive'] = $Passive }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('ServerID')) { $properties['serverid'] = $ServerID }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Create servicegroup_lbmonitor_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type servicegroup_lbmonitor_binding -Payload @{ servicegroup_lbmonitor_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetServiceGroupLBMonitorBinding -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddServiceGroupLBMonitorBinding

# region Invoke-NSAddServiceGroupServiceGroupMemberBinding
function Invoke-NSAddServiceGroupServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler servicegroup_servicegroupmember_binding resource.
    .DESCRIPTION
        Binding object showing the servicegroupmember that can be bound to servicegroup.
    .PARAMETER CustomServerID
        The identifier for this IP:Port pair. Used when the persistency type is set to Custom Server ID. Default value: "None"
    .PARAMETER DBSTTL
        Specify the TTL for DNS record for domain based service.The default value of ttl is 0 which indicates to use the TTL received in DNS response for monitors. Default value: 0
    .PARAMETER HashID
        The hash identifier for the service. This must be unique for each service. This parameter is used by hash based load balancing methods. Minimum value = 1
    .PARAMETER Ip
        IP Address.
    .PARAMETER NameServer
        Specify the nameserver to which the query for bound domain needs to be sent. If not specified, use the global nameserver.
    .PARAMETER Order
        Order number to be assigned to the servicegroup member. Minimum value = 1 Maximum value = 8192
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ServerID
        The identifier for the service. This is used when the persistency type is set to Custom Server ID.
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
    .PARAMETER State
        Initial state of the service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Weight
        Weight to assign to the servers in the service group. Specifies the capacity of the servers relative to the other servers in the load balancing configuration. The higher the weight, the higher the percentage of requests sent to the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSAddServiceGroupServiceGroupMemberBinding -ServiceGroupName 'example' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddServiceGroupServiceGroupMemberBinding -ServiceGroupName 'example' -Port 80 -WhatIf
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
        [string] $CustomServerID,

        [Parameter()]
        [int] $DBSTTL,

        [Parameter()]
        [int] $HashID,

        [Parameter()]
        [string] $Ip,

        [Parameter()]
        [string] $NameServer,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [int] $ServerID,

        [Parameter()]
        [string] $ServerName,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

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
    if ($PSBoundParameters.ContainsKey('CustomServerID')) { $properties['customserverid'] = $CustomServerID }
    if ($PSBoundParameters.ContainsKey('DBSTTL')) { $properties['dbsttl'] = $DBSTTL }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('Ip')) { $properties['ip'] = $Ip }
    if ($PSBoundParameters.ContainsKey('NameServer')) { $properties['nameserver'] = $NameServer }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('ServerID')) { $properties['serverid'] = $ServerID }
    if ($PSBoundParameters.ContainsKey('ServerName')) { $properties['servername'] = $ServerName }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Create servicegroup_servicegroupmember_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type servicegroup_servicegroupmember_binding -Payload @{ servicegroup_servicegroupmember_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetServiceGroupServiceGroupMemberBinding -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddServiceGroupServiceGroupMemberBinding

# region Invoke-NSAddServiceLBMonitorBinding
function Invoke-NSAddServiceLBMonitorBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler service_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to service.
    .PARAMETER MonItorName
        The monitor Names.
    .PARAMETER MonState
        The configured state (enable/disable) of the monitor on this server. Possible values = ENABLED, DISABLED
    .PARAMETER Name
        Name of the service to which to bind a monitor. Minimum length = 1
    .PARAMETER Passive
        Indicates if load monitor is passive. A passive load monitor does not remove service from LB decision when threshold is breached.
    .PARAMETER Weight
        Weight to assign to the monitor-service binding. When a monitor is UP, the weight assigned to its binding with the service determines how much the monitor contributes toward keeping the health of the service above the value configured for the Monitor Threshold parameter. Minimum value = 1 Maximum value = 100
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
        Invoke-NSAddServiceLBMonitorBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddServiceLBMonitorBinding -Name 'example' -WhatIf
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
        [string] $MonItorName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $MonState,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [bool] $Passive,

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
    if ($PSBoundParameters.ContainsKey('MonItorName')) { $properties['monitor_name'] = $MonItorName }
    if ($PSBoundParameters.ContainsKey('MonState')) { $properties['monstate'] = $MonState }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Passive')) { $properties['passive'] = $Passive }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create service_lbmonitor_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type service_lbmonitor_binding -Payload @{ service_lbmonitor_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetServiceLBMonitorBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddServiceLBMonitorBinding

# region Invoke-NSDeleteLocation
function Invoke-NSDeleteLocation {
    <#
    .SYNOPSIS
        Removes a NetScaler location resource.
    .DESCRIPTION
        Configuration for location resource.
    .PARAMETER Ipfrom
        First IP address in the range, in dotted decimal notation. Minimum length = 1
    .PARAMETER Ipto
        Last IP address in the range, in dotted decimal notation. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLocation -Ipfrom 'example' -Ipto 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLocation -Ipfrom 'location_example' | Invoke-NSDeleteLocation -Confirm:$false
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
        [string] $Ipfrom,

        [Parameter(Mandatory)]
        [string] $Ipto,

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
        if ($PSBoundParameters.ContainsKey('Ipto')) {
            $argumentParts += 'ipto:' + $Ipto
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Ipfrom", 'Delete location')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type location -Resource $Ipfrom -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLocation

# region Invoke-NSDeleteLocationFile
function Invoke-NSDeleteLocationFile {
    <#
    .SYNOPSIS
        Removes a NetScaler locationfile resource.
    .DESCRIPTION
        Configuration for location file resource.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLocationFile  -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLocationFile  | Invoke-NSDeleteLocationFile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess('locationfile', 'Delete locationfile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type locationfile -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLocationFile

# region Invoke-NSDeleteLocationFile6
function Invoke-NSDeleteLocationFile6 {
    <#
    .SYNOPSIS
        Removes a NetScaler locationfile6 resource.
    .DESCRIPTION
        Configuration for location file6 resource.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLocationFile6  -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLocationFile6  | Invoke-NSDeleteLocationFile6 -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess('locationfile6', 'Delete locationfile6')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type locationfile6 -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLocationFile6

# region Invoke-NSDeleteRADIUSNode
function Invoke-NSDeleteRADIUSNode {
    <#
    .SYNOPSIS
        Removes a NetScaler radiusnode resource.
    .DESCRIPTION
        Configuration for RADIUS Node resource.
    .PARAMETER Nodeprefix
        IP address/IP prefix of radius node in CIDR format.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteRADIUSNode -Nodeprefix 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetRADIUSNode -Nodeprefix 'radiusnode_example' | Invoke-NSDeleteRADIUSNode -Confirm:$false
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
        [string] $Nodeprefix,

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

        if ($PSCmdlet.ShouldProcess("$Nodeprefix", 'Delete radiusnode')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type radiusnode -Resource $Nodeprefix -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteRADIUSNode

# region Invoke-NSDeleteServer
function Invoke-NSDeleteServer {
    <#
    .SYNOPSIS
        Removes a NetScaler server.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteServer -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetServer -Name 'server_example' | Invoke-NSDeleteServer -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete server')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type server -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteServer

# region Invoke-NSDeleteService
function Invoke-NSDeleteService {
    <#
    .SYNOPSIS
        Removes a NetScaler service.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteService -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetService -Name 'service_example' | Invoke-NSDeleteService -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete service')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type service -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteService

# region Invoke-NSDeleteServiceGroup
function Invoke-NSDeleteServiceGroup {
    <#
    .SYNOPSIS
        Removes a NetScaler servicegroup resource.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteServiceGroup -ServiceGroupName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetServiceGroup -ServiceGroupName 'servicegroup_example' | Invoke-NSDeleteServiceGroup -Confirm:$false
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
        [string] $ServiceGroupName,

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

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Delete servicegroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type servicegroup -Resource $ServiceGroupName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteServiceGroup

# region Invoke-NSDeleteServiceGroupLBMonitorBinding
function Invoke-NSDeleteServiceGroupLBMonitorBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler servicegroup_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to servicegroup.
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
    .PARAMETER Port
        Port number of the service. Each service must have a unique port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER MonItorName
        Monitor name.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteServiceGroupLBMonitorBinding -ServiceGroupName 'example' -Port 80 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetServiceGroupLBMonitorBinding -ServiceGroupName 'servicegroup_lbmonitor_binding_example' | Invoke-NSDeleteServiceGroupLBMonitorBinding -Confirm:$false
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
        [string] $ServiceGroupName,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $MonItorName,

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
        if ($PSBoundParameters.ContainsKey('MonItorName')) {
            $argumentParts += 'monitor_name:' + $MonItorName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Delete servicegroup_lbmonitor_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type servicegroup_lbmonitor_binding -Resource $ServiceGroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteServiceGroupLBMonitorBinding

# region Invoke-NSDeleteServiceGroupServiceGroupMemberBinding
function Invoke-NSDeleteServiceGroupServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler servicegroup_servicegroupmember_binding resource.
    .DESCRIPTION
        Binding object showing the servicegroupmember that can be bound to servicegroup.
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
    .PARAMETER Ip
        IP Address.
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteServiceGroupServiceGroupMemberBinding -ServiceGroupName 'example' -Ip 'example' -ServerName 'example' -Port 80 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetServiceGroupServiceGroupMemberBinding -ServiceGroupName 'servicegroup_servicegroupmember_binding_example' | Invoke-NSDeleteServiceGroupServiceGroupMemberBinding -Confirm:$false
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
        [string] $ServiceGroupName,

        [Parameter()]
        [string] $Ip,

        [Parameter()]
        [string] $ServerName,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Ip')) {
            $argumentParts += 'ip:' + $Ip
        }
        if ($PSBoundParameters.ContainsKey('ServerName')) {
            $argumentParts += 'servername:' + $ServerName
        }
        if ($PSBoundParameters.ContainsKey('Port')) {
            $argumentParts += 'port:' + $Port
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Delete servicegroup_servicegroupmember_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type servicegroup_servicegroupmember_binding -Resource $ServiceGroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteServiceGroupServiceGroupMemberBinding

# region Invoke-NSDeleteServiceLBMonitorBinding
function Invoke-NSDeleteServiceLBMonitorBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler service_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to service.
    .PARAMETER Name
        Name of the service to which to bind a monitor. Minimum length = 1
    .PARAMETER MonItorName
        The monitor Names.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteServiceLBMonitorBinding -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetServiceLBMonitorBinding -Name 'service_lbmonitor_binding_example' | Invoke-NSDeleteServiceLBMonitorBinding -Confirm:$false
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
        [string] $MonItorName,

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
        if ($PSBoundParameters.ContainsKey('MonItorName')) {
            $argumentParts += 'monitor_name:' + $MonItorName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete service_lbmonitor_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type service_lbmonitor_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteServiceLBMonitorBinding

# region Invoke-NSDisableServer
function Invoke-NSDisableServer {
    <#
    .SYNOPSIS
        Disables a NetScaler server.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Delay
        Time, in seconds, after which all the services configured on the server are disabled.
    .PARAMETER Graceful
        Shut down gracefully, without accepting any new connections, and disabling each service when all of its connections are closed. Default value: NO Possible values = YES, NO
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
        Invoke-NSDisableServer -Name 'server_example' -PassThru
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
        [int] $Delay,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Graceful,

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
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('Delay')) { $body['delay'] = $Delay }
        if ($PSBoundParameters.ContainsKey('Graceful')) { $body['graceful'] = $Graceful }

        if ($PSCmdlet.ShouldProcess("$Name", 'Disable server')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type server -Action disable -Payload @{ server = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableServer

# region Invoke-NSDisableService
function Invoke-NSDisableService {
    <#
    .SYNOPSIS
        Disables a NetScaler service.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
    .PARAMETER Delay
        Time, in seconds, allocated to the NetScaler for a graceful shutdown of the service. During this period, new requests are sent to the service only for clients who already have persistent sessions on the appliance. Requests from new clients are load balanced among other available services. After the delay time expires, no requests are sent to the service, and the service is marked as unavailable (OUT OF SERVICE).
    .PARAMETER Graceful
        Shut down gracefully, not accepting any new connections, and disabling the service when all of its connections are closed. Default value: NO Possible values = YES, NO
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
        Invoke-NSDisableService -Name 'service_example' -PassThru
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
        [int] $Delay,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Graceful,

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
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('Delay')) { $body['delay'] = $Delay }
        if ($PSBoundParameters.ContainsKey('Graceful')) { $body['graceful'] = $Graceful }

        if ($PSCmdlet.ShouldProcess("$Name", 'Disable service')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type service -Action disable -Payload @{ service = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetService -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableService

# region Invoke-NSDisableServiceGroup
function Invoke-NSDisableServiceGroup {
    <#
    .SYNOPSIS
        Disables a NetScaler servicegroup resource.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Delay
        Time, in seconds, allocated for a shutdown of the services in the service group. During this period, new requests are sent to the service only for clients who already have persistent sessions on the appliance. Requests from new clients are load balanced among other available services. After the delay time expires, no requests are sent to the service, and the service is marked as unavailable (OUT OF SERVICE).
    .PARAMETER Graceful
        Wait for all existing connections to the service to terminate before shutting down the service. Default value: NO Possible values = YES, NO
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
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
        Invoke-NSDisableServiceGroup -ServiceGroupName 'servicegroup_example' -PassThru
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
        [string] $ServiceGroupName,

        [Parameter()]
        [int] $Delay,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Graceful,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $ServerName,

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
        if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $body['servicegroupname'] = $ServiceGroupName }
        if ($PSBoundParameters.ContainsKey('Delay')) { $body['delay'] = $Delay }
        if ($PSBoundParameters.ContainsKey('Graceful')) { $body['graceful'] = $Graceful }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $Port }
        if ($PSBoundParameters.ContainsKey('ServerName')) { $body['servername'] = $ServerName }

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Disable servicegroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type servicegroup -Action disable -Payload @{ servicegroup = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableServiceGroup

# region Invoke-NSEnableServer
function Invoke-NSEnableServer {
    <#
    .SYNOPSIS
        Enables a NetScaler server.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
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
        Invoke-NSEnableServer -Name 'server_example' -PassThru
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
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }

        if ($PSCmdlet.ShouldProcess("$Name", 'Enable server')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type server -Action enable -Payload @{ server = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableServer

# region Invoke-NSEnableService
function Invoke-NSEnableService {
    <#
    .SYNOPSIS
        Enables a NetScaler service.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
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
        Invoke-NSEnableService -Name 'service_example' -PassThru
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
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }

        if ($PSCmdlet.ShouldProcess("$Name", 'Enable service')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type service -Action enable -Payload @{ service = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetService -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableService

# region Invoke-NSEnableServiceGroup
function Invoke-NSEnableServiceGroup {
    <#
    .SYNOPSIS
        Enables a NetScaler servicegroup resource.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
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
        Invoke-NSEnableServiceGroup -ServiceGroupName 'servicegroup_example' -PassThru
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
        [string] $ServiceGroupName,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $ServerName,

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
        if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $body['servicegroupname'] = $ServiceGroupName }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $Port }
        if ($PSBoundParameters.ContainsKey('ServerName')) { $body['servername'] = $ServerName }

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Enable servicegroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type servicegroup -Action enable -Payload @{ servicegroup = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableServiceGroup

# region Invoke-NSGetExtendedmemoryparam
function Invoke-NSGetExtendedmemoryparam {
    <#
    .SYNOPSIS
        Gets NetScaler extendedmemoryparam configuration.
    .DESCRIPTION
        Configuration for Parameter for extended memory used by LSN and Subscriber Store resource.
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
        Invoke-NSGetExtendedmemoryparam
    .EXAMPLE
        Invoke-NSGetExtendedmemoryparam -Filter @{ servicetype = 'HTTP' }
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
            Type = 'extendedmemoryparam'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetExtendedmemoryparam

# region Invoke-NSGetLocation
function Invoke-NSGetLocation {
    <#
    .SYNOPSIS
        Gets NetScaler location configuration.
    .DESCRIPTION
        Configuration for location resource.
    .PARAMETER Ipfrom
        First IP address in the range, in dotted decimal notation. Minimum length = 1
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
        Invoke-NSGetLocation
    .EXAMPLE
        Invoke-NSGetLocation -Ipfrom 'location_example'
    .EXAMPLE
        Invoke-NSGetLocation -Filter @{ servicetype = 'HTTP' }
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
        [string] $Ipfrom,

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
            Type = 'location'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Ipfrom
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLocation

# region Invoke-NSGetLocationFile
function Invoke-NSGetLocationFile {
    <#
    .SYNOPSIS
        Gets NetScaler locationfile configuration.
    .DESCRIPTION
        Configuration for location file resource.
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
        Invoke-NSGetLocationFile
    .EXAMPLE
        Invoke-NSGetLocationFile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'locationfile'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLocationFile

# region Invoke-NSGetLocationFile6
function Invoke-NSGetLocationFile6 {
    <#
    .SYNOPSIS
        Gets NetScaler locationfile6 configuration.
    .DESCRIPTION
        Configuration for location file6 resource.
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
        Invoke-NSGetLocationFile6
    .EXAMPLE
        Invoke-NSGetLocationFile6 -Filter @{ servicetype = 'HTTP' }
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
            Type = 'locationfile6'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLocationFile6

# region Invoke-NSGetLocationparameter
function Invoke-NSGetLocationparameter {
    <#
    .SYNOPSIS
        Gets NetScaler locationparameter configuration.
    .DESCRIPTION
        Configuration for location parameter resource.
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
        Invoke-NSGetLocationparameter
    .EXAMPLE
        Invoke-NSGetLocationparameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'locationparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLocationparameter

# region Invoke-NSGetNstrace
function Invoke-NSGetNstrace {
    <#
    .SYNOPSIS
        Gets NetScaler nstrace configuration.
    .DESCRIPTION
        Configuration for nstrace operations resource.
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetNstrace
    .EXAMPLE
        Invoke-NSGetNstrace -Filter @{ servicetype = 'HTTP' }
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

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'nstrace'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetNstrace

# region Invoke-NSGetRADIUSNode
function Invoke-NSGetRADIUSNode {
    <#
    .SYNOPSIS
        Gets NetScaler radiusnode configuration.
    .DESCRIPTION
        Configuration for RADIUS Node resource.
    .PARAMETER Nodeprefix
        IP address/IP prefix of radius node in CIDR format.
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
        Invoke-NSGetRADIUSNode
    .EXAMPLE
        Invoke-NSGetRADIUSNode -Nodeprefix 'radiusnode_example'
    .EXAMPLE
        Invoke-NSGetRADIUSNode -Filter @{ servicetype = 'HTTP' }
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
        [string] $Nodeprefix,

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
            Type = 'radiusnode'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Nodeprefix
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetRADIUSNode

# region Invoke-NSGetServer
function Invoke-NSGetServer {
    <#
    .SYNOPSIS
        Gets NetScaler server configuration.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Internal
        Display names of the servers that have been created for internal use.
    .PARAMETER Ipaddress
        IPv4 or IPv6 address of the server. If you create an IP address based server, you can specify the name of the server, instead of its IP address, when creating a service. Note: If you do not create a server entry, the server IP address that you enter when you create a service becomes the name of the server.
    .PARAMETER Domain
        Domain name of the server. For a domain based configuration, you must create the server first. Minimum length = 1
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
        Invoke-NSGetServer
    .EXAMPLE
        Invoke-NSGetServer -Name 'server_example'
    .EXAMPLE
        Invoke-NSGetServer -Filter @{ servicetype = 'HTTP' }
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

        [Parameter(ParameterSetName = 'All')]
        [switch] $Internal,

        [Parameter(ParameterSetName = 'All')]
        [string] $Ipaddress,

        [Parameter(ParameterSetName = 'All')]
        [string] $Domain,

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
        if ($PSBoundParameters.ContainsKey('Internal')) {
            $argumentValue = $Internal
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'Internal:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Ipaddress')) {
            $argumentValue = $Ipaddress
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'ipaddress:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Domain')) {
            $argumentValue = $Domain
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'domain:' + $argumentValue
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
            Type = 'server'
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
# endregion Invoke-NSGetServer

# region Invoke-NSGetServerBinding
function Invoke-NSGetServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler server_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to server.
    .PARAMETER Name
        Name of the server for which to display parameters. Minimum length = 1
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
        Invoke-NSGetServerBinding
    .EXAMPLE
        Invoke-NSGetServerBinding -Name 'server_binding_example'
    .EXAMPLE
        Invoke-NSGetServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'server_binding'
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
# endregion Invoke-NSGetServerBinding

# region Invoke-NSGetServerGSLBServiceBinding
function Invoke-NSGetServerGSLBServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler server_gslbservice_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservice that can be bound to server.
    .PARAMETER Name
        Name of the server for which to display parameters. Minimum length = 1
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
        Invoke-NSGetServerGSLBServiceBinding
    .EXAMPLE
        Invoke-NSGetServerGSLBServiceBinding -Name 'server_gslbservice_binding_example'
    .EXAMPLE
        Invoke-NSGetServerGSLBServiceBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'server_gslbservice_binding'
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
# endregion Invoke-NSGetServerGSLBServiceBinding

# region Invoke-NSGetServerGSLBServiceGroupBinding
function Invoke-NSGetServerGSLBServiceGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler server_gslbservicegroup_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroup that can be bound to server.
    .PARAMETER Name
        Name of the server for which to display parameters. Minimum length = 1
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
        Invoke-NSGetServerGSLBServiceGroupBinding
    .EXAMPLE
        Invoke-NSGetServerGSLBServiceGroupBinding -Name 'server_gslbservicegroup_binding_example'
    .EXAMPLE
        Invoke-NSGetServerGSLBServiceGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'server_gslbservicegroup_binding'
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
# endregion Invoke-NSGetServerGSLBServiceGroupBinding

# region Invoke-NSGetServerServiceBinding
function Invoke-NSGetServerServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler server_service_binding configuration.
    .DESCRIPTION
        Binding object showing the service that can be bound to server.
    .PARAMETER Name
        Name of the server for which to display parameters. Minimum length = 1
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
        Invoke-NSGetServerServiceBinding
    .EXAMPLE
        Invoke-NSGetServerServiceBinding -Name 'server_service_binding_example'
    .EXAMPLE
        Invoke-NSGetServerServiceBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'server_service_binding'
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
# endregion Invoke-NSGetServerServiceBinding

# region Invoke-NSGetServerServiceGroupBinding
function Invoke-NSGetServerServiceGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler server_servicegroup_binding configuration.
    .DESCRIPTION
        Binding object showing the servicegroup that can be bound to server.
    .PARAMETER Name
        Name of the server for which to display parameters. Minimum length = 1
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
        Invoke-NSGetServerServiceGroupBinding
    .EXAMPLE
        Invoke-NSGetServerServiceGroupBinding -Name 'server_servicegroup_binding_example'
    .EXAMPLE
        Invoke-NSGetServerServiceGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'server_servicegroup_binding'
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
# endregion Invoke-NSGetServerServiceGroupBinding

# region Invoke-NSGetService
function Invoke-NSGetService {
    <#
    .SYNOPSIS
        Gets NetScaler service configuration.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER All
        Display both user-configured and dynamically learned services.
    .PARAMETER Internal
        Display only dynamically learned services.
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
        Invoke-NSGetService
    .EXAMPLE
        Invoke-NSGetService -Name 'service_example'
    .EXAMPLE
        Invoke-NSGetService -Filter @{ servicetype = 'HTTP' }
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

        [Parameter(ParameterSetName = 'All')]
        [switch] $All,

        [Parameter(ParameterSetName = 'All')]
        [switch] $Internal,

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
        if ($PSBoundParameters.ContainsKey('All')) {
            $argumentValue = $All
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'all:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Internal')) {
            $argumentValue = $Internal
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'Internal:' + $argumentValue
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
            Type = 'service'
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
# endregion Invoke-NSGetService

# region Invoke-NSGetServiceBinding
function Invoke-NSGetServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler service_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to service.
    .PARAMETER Name
        Name of the service for which to display configuration details. Minimum length = 1
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
        Invoke-NSGetServiceBinding
    .EXAMPLE
        Invoke-NSGetServiceBinding -Name 'service_binding_example'
    .EXAMPLE
        Invoke-NSGetServiceBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'service_binding'
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
# endregion Invoke-NSGetServiceBinding

# region Invoke-NSGetServiceGroup
function Invoke-NSGetServiceGroup {
    <#
    .SYNOPSIS
        Gets NetScaler servicegroup configuration.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER IncludeMembers
        Display the members of the listed service groups in addition to their settings. Can be specified when no service group name is provided in the command. In that case, the details displayed for each service group are identical to the details displayed when a service group name is provided, except that bound monitors are not displayed.
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
        Invoke-NSGetServiceGroup
    .EXAMPLE
        Invoke-NSGetServiceGroup -ServiceGroupName 'servicegroup_example'
    .EXAMPLE
        Invoke-NSGetServiceGroup -Filter @{ servicetype = 'HTTP' }
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
        [string] $ServiceGroupName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [switch] $IncludeMembers,

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
        if ($PSBoundParameters.ContainsKey('IncludeMembers')) {
            $argumentValue = $IncludeMembers
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'includemembers:' + $argumentValue
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
            Type = 'servicegroup'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ServiceGroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetServiceGroup

# region Invoke-NSGetServiceGroupBinding
function Invoke-NSGetServiceGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler servicegroup_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to servicegroup.
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
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
        Invoke-NSGetServiceGroupBinding
    .EXAMPLE
        Invoke-NSGetServiceGroupBinding -ServiceGroupName 'servicegroup_binding_example'
    .EXAMPLE
        Invoke-NSGetServiceGroupBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ServiceGroupName,

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
            Type = 'servicegroup_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ServiceGroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetServiceGroupBinding

# region Invoke-NSGetServiceGroupBindings
function Invoke-NSGetServiceGroupBindings {
    <#
    .SYNOPSIS
        Gets NetScaler servicegroupbindings configuration.
    .DESCRIPTION
        Configuration for servicegroupbind resource.
    .PARAMETER ServiceGroupName
        The name of the service. Minimum length = 1
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
        Invoke-NSGetServiceGroupBindings
    .EXAMPLE
        Invoke-NSGetServiceGroupBindings -ServiceGroupName 'servicegroupbindings_example'
    .EXAMPLE
        Invoke-NSGetServiceGroupBindings -Filter @{ servicetype = 'HTTP' }
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
        [string] $ServiceGroupName,

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
            Type = 'servicegroupbindings'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ServiceGroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetServiceGroupBindings

# region Invoke-NSGetServiceGroupLBMonitorBinding
function Invoke-NSGetServiceGroupLBMonitorBinding {
    <#
    .SYNOPSIS
        Gets NetScaler servicegroup_lbmonitor_binding configuration.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to servicegroup.
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
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
        Invoke-NSGetServiceGroupLBMonitorBinding
    .EXAMPLE
        Invoke-NSGetServiceGroupLBMonitorBinding -ServiceGroupName 'servicegroup_lbmonitor_binding_example'
    .EXAMPLE
        Invoke-NSGetServiceGroupLBMonitorBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ServiceGroupName,

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
            Type = 'servicegroup_lbmonitor_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ServiceGroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetServiceGroupLBMonitorBinding

# region Invoke-NSGetServiceGroupServiceGroupEntityMonBindingsBinding
function Invoke-NSGetServiceGroupServiceGroupEntityMonBindingsBinding {
    <#
    .SYNOPSIS
        Gets NetScaler servicegroup_servicegroupentitymonbindings_binding configuration.
    .DESCRIPTION
        Binding object showing the servicegroupentitymonbindings that can be bound to servicegroup.
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
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
        Invoke-NSGetServiceGroupServiceGroupEntityMonBindingsBinding
    .EXAMPLE
        Invoke-NSGetServiceGroupServiceGroupEntityMonBindingsBinding -ServiceGroupName 'servicegroup_servicegroupentitymonbindings_binding_example'
    .EXAMPLE
        Invoke-NSGetServiceGroupServiceGroupEntityMonBindingsBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ServiceGroupName,

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
            Type = 'servicegroup_servicegroupentitymonbindings_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ServiceGroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetServiceGroupServiceGroupEntityMonBindingsBinding

# region Invoke-NSGetServiceGroupServiceGroupMemberBinding
function Invoke-NSGetServiceGroupServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Gets NetScaler servicegroup_servicegroupmember_binding configuration.
    .DESCRIPTION
        Binding object showing the servicegroupmember that can be bound to servicegroup.
    .PARAMETER ServiceGroupName
        Name of the service group. Minimum length = 1
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
        Invoke-NSGetServiceGroupServiceGroupMemberBinding
    .EXAMPLE
        Invoke-NSGetServiceGroupServiceGroupMemberBinding -ServiceGroupName 'servicegroup_servicegroupmember_binding_example'
    .EXAMPLE
        Invoke-NSGetServiceGroupServiceGroupMemberBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ServiceGroupName,

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
            Type = 'servicegroup_servicegroupmember_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ServiceGroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetServiceGroupServiceGroupMemberBinding

# region Invoke-NSGetServiceLBMonitorBinding
function Invoke-NSGetServiceLBMonitorBinding {
    <#
    .SYNOPSIS
        Gets NetScaler service_lbmonitor_binding configuration.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to service.
    .PARAMETER Name
        Name of the service to which to bind a monitor. Minimum length = 1
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
        Invoke-NSGetServiceLBMonitorBinding
    .EXAMPLE
        Invoke-NSGetServiceLBMonitorBinding -Name 'service_lbmonitor_binding_example'
    .EXAMPLE
        Invoke-NSGetServiceLBMonitorBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'service_lbmonitor_binding'
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
# endregion Invoke-NSGetServiceLBMonitorBinding

# region Invoke-NSGetSvcBindings
function Invoke-NSGetSvcBindings {
    <#
    .SYNOPSIS
        Gets NetScaler svcbindings configuration.
    .DESCRIPTION
        Configuration for service bindings resource.
    .PARAMETER ServiceName
        The name of the service. Minimum length = 1
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
        Invoke-NSGetSvcBindings
    .EXAMPLE
        Invoke-NSGetSvcBindings -ServiceName 'svcbindings_example'
    .EXAMPLE
        Invoke-NSGetSvcBindings -Filter @{ servicetype = 'HTTP' }
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
        [string] $ServiceName,

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
            Type = 'svcbindings'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ServiceName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSvcBindings

# region Invoke-NSImportLocationFile
function Invoke-NSImportLocationFile {
    <#
    .SYNOPSIS
        Imports NetScaler locationfile data.
    .DESCRIPTION
        Configuration for location file resource.
    .PARAMETER Src
        URL \(protocol, host, path, and file name\) from where the location file will be imported. NOTE: The import fails if the object to be imported is on an HTTPS server that requires client certificate authentication for access. Minimum length = 1 Maximum length = 2047
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSImportLocationFile -Src 'example'
    .EXAMPLE
        Invoke-NSImportLocationFile -Src 'example' -WhatIf
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
        if ($PSBoundParameters.ContainsKey('Src')) { $body['src'] = $Src }

        if ($PSCmdlet.ShouldProcess('locationfile', 'Import locationfile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type locationfile -Action Import -Payload @{ locationfile = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSImportLocationFile

# region Invoke-NSImportLocationFile6
function Invoke-NSImportLocationFile6 {
    <#
    .SYNOPSIS
        Imports NetScaler locationfile6 data.
    .DESCRIPTION
        Configuration for location file6 resource.
    .PARAMETER LocationFile
        Name of the IPv6 location file, with or without absolute path. If the path is not included, the default path (/var/netscaler/locdb) is assumed. In a high availability setup, the static database must be stored in the same location on both NetScalers. Minimum length = 1
    .PARAMETER Src
        URL \(protocol, host, path, and file name\) from where the location file will be imported. NOTE: The import fails if the object to be imported is on an HTTPS server that requires client certificate authentication for access. Minimum length = 1 Maximum length = 2047
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSImportLocationFile6 -LocationFile 'example' -Src 'example'
    .EXAMPLE
        Invoke-NSImportLocationFile6 -LocationFile 'example' -Src 'example' -WhatIf
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
        [string] $LocationFile,

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
        if ($PSBoundParameters.ContainsKey('LocationFile')) { $body['Locationfile'] = $LocationFile }
        if ($PSBoundParameters.ContainsKey('Src')) { $body['src'] = $Src }

        if ($PSCmdlet.ShouldProcess('locationfile6', 'Import locationfile6')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type locationfile6 -Action Import -Payload @{ locationfile6 = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSImportLocationFile6

# region Invoke-NSRenameServer
function Invoke-NSRenameServer {
    <#
    .SYNOPSIS
        Renames a NetScaler server resource.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER NewName
        New name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Minimum length = 1
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
        Invoke-NSRenameServer -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameServer -Name 'example' -NewName 'example' -WhatIf
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
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('NewName')) { $body['newname'] = $NewName }

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename server')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type server -Action rename -Payload @{ server = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetServer -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameServer

# region Invoke-NSRenameService
function Invoke-NSRenameService {
    <#
    .SYNOPSIS
        Renames a NetScaler service resource.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
    .PARAMETER NewName
        New name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Minimum length = 1
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
        Invoke-NSRenameService -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameService -Name 'example' -NewName 'example' -WhatIf
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
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('NewName')) { $body['newname'] = $NewName }

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename service')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type service -Action rename -Payload @{ service = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetService -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameService

# region Invoke-NSRenameServiceGroup
function Invoke-NSRenameServiceGroup {
    <#
    .SYNOPSIS
        Renames a NetScaler servicegroup resource.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER NewName
        New name for the service group. Minimum length = 1
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
        Invoke-NSRenameServiceGroup -ServiceGroupName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameServiceGroup -ServiceGroupName 'example' -NewName 'example' -WhatIf
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
        [string] $ServiceGroupName,

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
        if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $body['servicegroupname'] = $ServiceGroupName }
        if ($PSBoundParameters.ContainsKey('NewName')) { $body['newname'] = $NewName }

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Rename servicegroup')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type servicegroup -Action rename -Payload @{ servicegroup = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetServiceGroup -ServiceGroupName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameServiceGroup

# region Invoke-NSStartNstrace
function Invoke-NSStartNstrace {
    <#
    .SYNOPSIS
        Invokes the start operation for a NetScaler nstrace resource.
    .DESCRIPTION
        Configuration for nstrace operations resource.
    .PARAMETER Capdroppkt
        Captures Dropped Packets if set to ENABLED. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CapSSLKeyS
        Capture SSL Master keys. Master keys will not be captured on FIPS machine. Warning: The captured keys can be used to decrypt information that may be confidential. The captured key files have to be stored in a secure environment. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Doruntimecleanup
        Enable or disable runtime temp file cleanup. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER FileId
        ID for the trace file name for uniqueness. Should be used only with -name option.
    .PARAMETER FileName
        Name of the trace file.
    .PARAMETER FileSize
        File size, in MB, treshold for rollover. If free disk space is less than 2GB at the time of rollover, trace will stop . Default value: 1024 Minimum value = 0 Maximum value = 10240
    .PARAMETER Filter
        Filter expression for nstrace. Maximum length of filter is 255 and it can be of following format: <expression> [<relop> <expression>] <relop> = ( && | || ) <expression> =: CONNECTION.<qualifier>.<qualifier-method>.(<qualifier-value>) <qualifier> = SRCIP <qualifier-method> = [ EQ | NE ] <qualifier-value> = A valid IPv4 address. example = CONNECTION.SRCIP.EQ(127.0.0.1) <qualifier> = DSTIP <qualifier-method> = [ EQ | NE ] <qualifier-value> = A valid IPv4 address. example = CONNECTION.DSTIP.EQ(127.0.0.1) <qualifier> = IP <qualifier-method> = [ EQ | NE ] <qualifier-value> = A valid IPv4 address. example = CONNECTION.IP.EQ(127.0.0.1) <qualifier> = SRCIPv6 <qualifier-method> = [ EQ | NE ] <qualifier-value> = A valid IPv6 address. example = CONNECTION.SRCIPv6.EQ(2001:db8:0:0:1::1) <qualifier> = DSTIPv6 <qualifier-method> = [ EQ | NE ] <qualifier-value> = A valid IPv6 address. example = CONNECTION.DSTIPv6.EQ(2001:db8:0:0:1::1) <qualifier> = IPv6 <qualifier-method> = [ EQ | NE ] <qualifier-value> = A valid IPv6 address. example = CONNECTION.IPv6.EQ(2001:db8:0:0:1::1) <qualifier> = SRCPORT <qualifier-method> = [ EQ | NE | GT | GE | LT | LE | BETWEEN ] <qualifier-value> = A valid port number. example = CONNECTION.SRCPORT.EQ(80) <qualifier> = DSTPORT <qualifier-method> = [ EQ | NE | GT | GE | LT | LE | BETWEEN ] <qualifier-value> = A valid port number. example = CONNECTION.DSTPORT.EQ(80) <qualifier> = PORT <qualifier-method> = [ EQ | NE | GT | GE | LT | LE | BETWEEN ] <qualifier-value> = A valid port number. example = CONNECTION.PORT.EQ(80) <qualifier> = VLANID <qualifier-method> = [ EQ | NE | GT | GE | LT | LE | BETWEEN ] <qualifier-value> = A valid VLAN ID. example = CONNECTION.VLANID.EQ(0) <qualifier> = CONNID <qualifier-method> = [ EQ | NE | GT | GE | LT | LE | BETWEEN ] <qualifier-value> = A valid PCB dev number. example = CONNECTION.CONNID.EQ(0) <qualifier> = PPEID <qualifier-method> = [ EQ | NE | GT | GE | LT | LE | BETWEEN ] <qualifier-value> = A valid core ID. example = CONNECTION.PPEID.EQ(0) <qualifier> = SVCNAME <qualifier-method> = [ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH ] <qualifier-value> = A valid text string. example = CONNECTION.SVCNAME.EQ("name") <qualifier> = LB_VSERVER.NAME <qualifier-method> = [ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH ] <qualifier-value> = LB vserver name. example = CONNECTION.LB_VSERVER.NAME.EQ("name") <qualifier> = CS_VSERVER.NAME <qualifier-method> = [ EQ | NE | CONTAINS | STARTSWITH | ENDSWITH ] <qualifier-value> = CS vserver name. example = CONNECTION.CS_VSERVER.NAME.EQ("name") <qualifier> = INTF <qualifier-method> = [ EQ | NE ] <qualifier-value> = A valid interface id in the form of x/y. example = CONNECTION.INTF.EQ("x/y") <qualifier> = SERVICE_TYPE <qualifier-method> = [ EQ | NE ] <qualifier-value> = ( SVC_HTTP | FTP | TCP | UDP | SSL | SSL_BRIDGE | SSL_TCP | NNTP | RPCSVR | RPCSVRS | RPCCLNT | SVC_DNS | ADNS | SNMP | RTSP | DHCPRA | ANY| MONITOR | MONITOR_UDP | MONITOR_PING | SIP_UDP | SVC_MYSQL | SVC_MSSQL | FIX | SSL_FIX | PKTSTEER | SVC_AAA | SERVICE_UNKNOWN ) example = CONNECTION.SERVICE_TYPE.EQ(ANY) <qualifier> = TRAFFIC_DOMAIN_ID <qualifier-method> = [ EQ | NE | GT | GE | LT | LE | BETWEEN ] <qualifier-value> = A valid traffic domain ID. example = CONNECTION.TRAFFIC_DOMAIN_ID.EQ(0) eg: start nstrace -filter "CONNECTION.SRCIP.EQ(127.0.0.1) || (CONNECTION.SVCNAME.NE("s1") && CONNECTION.SRCPORT.EQ(80))" The filter expression should be given in double quotes. common use cases: Trace capturing full sized traffic from/to ip 10.102.44.111, excluding loopback traffic start nstrace -size 0 -filter "CONNECTION.IP.NE(127.0.0.1) && CONNECTION.IP.EQ(10.102.44.111)" Trace capturing all traffic to (terminating at) port 80 or 443 start nstrace -size 0 -filter "CONNECTION.DSTPORT.EQ(443) || CONNECTION.DSTPORT.EQ(80)" Trace capturing all backend traffic specific to service service1 along with corresponding client side traffic start nstrace -size 0 -filter "CONNECTION.SVCNAME.EQ("service1")" -link ENABLED Trace capturing all traffic through NetScaler interface 1/1 start nstrace -filter "CONNECTION.INTF.EQ("1/1")" Trace capturing all traffic specific through vlan 2 start nstrace -filter "CONNECTION.VLANID.EQ(2)" Trace capturing all frontend (client side) traffic specific to lb vserver vserver1 along with corresponding server side traffic start nstrace -size 0 -filter "CONNECTION.LB_VSERVER.NAME.EQ("vserver1")" -link ENABLED .
    .PARAMETER Inmemorytrace
        Logs packets in appliance's memory and dumps the trace file on stopping the nstrace operation. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Link
        Includes filtered connection's peer traffic. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Merge
        Specify how traces across PE's are merged . Default value: 0 Possible values = ONSTOP, ONTHEFLY, NOMERGE
    .PARAMETER Mode
        Capturing mode for trace. Mode can be any of the following values or combination of these values: RX Received packets before NIC pipelining (Filter does not work when RX capturing mode is ON) NEW_RX Received packets after NIC pipelining TX Transmitted packets TXB Packets buffered for transmission IPV6 Translated IPv6 packets C2C Capture C2C message NS_FR_TX TX/TXB packets are not captured in flow receiver. MPTCP MPTCP master flow HTTP_QUIC HTTP-over-QUIC stream data and stream events Default mode: NEW_RX TXB . Default value: DEFAULT_MODE Possible values = TX, TXB, RX, IPV6, NEW_RX, C2C, NS_FR_TX, APPFW, MPTCP, PolicyBased, HTTP_QUIC
    .PARAMETER Nf
        Number of files to be generated in cycle. Default value: 24 Minimum value = 1 Maximum value = 100
    .PARAMETER Nodes
        Nodes on which tracing is started. Minimum value = 0 Maximum value = 32
    .PARAMETER Pernic
        Use separate trace files for each interface. Works only with cap format. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Size
        Size of the captured data. Set 0 for full packet trace. Default value: 164 Minimum value = 0 Maximum value = 1514
    .PARAMETER SkipLocalSsh
        skip local SSH packets. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Skiprpc
        skip RPC packets. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Time
        Time per file (sec). Default value: 3600 Minimum value = 1
    .PARAMETER Tracebuffers
        Number of 16KB trace buffers. Default value: 5000 Minimum value = 1000
    .PARAMETER TraceFormAt
        Format in which trace will be generated . Default value: 0 Possible values = NSCAP, PCAP
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSStartNstrace 
    .EXAMPLE
        Invoke-NSStartNstrace  -WhatIf
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
        [string] $Capdroppkt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CapSSLKeyS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Doruntimecleanup,

        [Parameter()]
        [string] $FileId,

        [Parameter()]
        [string] $FileName,

        [Parameter()]
        [int] $FileSize,

        [Parameter()]
        [string] $Filter,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Inmemorytrace,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Link,

        [Parameter()]
        [ValidateSet('ONSTOP', 'ONTHEFLY', 'NOMERGE')]
        [string] $Merge,

        [Parameter()]
        [ValidateSet('TX', 'TXB', 'RX', 'IPV6', 'NEW_RX', 'C2C', 'NS_FR_TX', 'APPFW', 'MPTCP', 'PolicyBased', 'HTTP_QUIC')]
        [string[]] $Mode,

        [Parameter()]
        [int] $Nf,

        [Parameter()]
        [string] $Nodes,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Pernic,

        [Parameter()]
        [int] $Size,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SkipLocalSsh,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Skiprpc,

        [Parameter()]
        [int] $Time,

        [Parameter()]
        [int] $Tracebuffers,

        [Parameter()]
        [ValidateSet('NSCAP', 'PCAP')]
        [string] $TraceFormAt,

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
        if ($PSBoundParameters.ContainsKey('Capdroppkt')) { $body['capdroppkt'] = $Capdroppkt }
        if ($PSBoundParameters.ContainsKey('CapSSLKeyS')) { $body['capsslkeys'] = $CapSSLKeyS }
        if ($PSBoundParameters.ContainsKey('Doruntimecleanup')) { $body['doruntimecleanup'] = $Doruntimecleanup }
        if ($PSBoundParameters.ContainsKey('FileId')) { $body['fileid'] = $FileId }
        if ($PSBoundParameters.ContainsKey('FileName')) { $body['filename'] = $FileName }
        if ($PSBoundParameters.ContainsKey('FileSize')) { $body['filesize'] = $FileSize }
        if ($PSBoundParameters.ContainsKey('Filter')) { $body['filter'] = $Filter }
        if ($PSBoundParameters.ContainsKey('Inmemorytrace')) { $body['inmemorytrace'] = $Inmemorytrace }
        if ($PSBoundParameters.ContainsKey('Link')) { $body['link'] = $Link }
        if ($PSBoundParameters.ContainsKey('Merge')) { $body['merge'] = $Merge }
        if ($PSBoundParameters.ContainsKey('Mode')) { $body['mode'] = $Mode }
        if ($PSBoundParameters.ContainsKey('Nf')) { $body['nf'] = $Nf }
        if ($PSBoundParameters.ContainsKey('Nodes')) { $body['nodes'] = $Nodes }
        if ($PSBoundParameters.ContainsKey('Pernic')) { $body['pernic'] = $Pernic }
        if ($PSBoundParameters.ContainsKey('Size')) { $body['size'] = $Size }
        if ($PSBoundParameters.ContainsKey('SkipLocalSsh')) { $body['skiplocalssh'] = $SkipLocalSsh }
        if ($PSBoundParameters.ContainsKey('Skiprpc')) { $body['skiprpc'] = $Skiprpc }
        if ($PSBoundParameters.ContainsKey('Time')) { $body['time'] = $Time }
        if ($PSBoundParameters.ContainsKey('Tracebuffers')) { $body['tracebuffers'] = $Tracebuffers }
        if ($PSBoundParameters.ContainsKey('TraceFormAt')) { $body['traceformat'] = $TraceFormAt }

        if ($PSCmdlet.ShouldProcess('nstrace', 'Start nstrace')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type nstrace -Action start -Payload @{ nstrace = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSStartNstrace

# region Invoke-NSUnsetExtendedmemoryparam
function Invoke-NSUnsetExtendedmemoryparam {
    <#
    .SYNOPSIS
        Clears one or more NetScaler extendedmemoryparam resource properties.
    .DESCRIPTION
        Configuration for Parameter for extended memory used by LSN and Subscriber Store resource.
    .PARAMETER Memlimit
        Amount of NetScaler memory to reserve for the memory used by LSN and Subscriber Session Store feature, in multiples of 2MB. Note: If you later reduce the value of this parameter, the amount of active memory is not reduced. Changing the configured memory limit can only increase the amount of active memory.
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
        Invoke-NSUnsetExtendedmemoryparam -Memlimit  -PassThru
    .EXAMPLE
        Invoke-NSUnsetExtendedmemoryparam -Memlimit  -WhatIf
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
        [switch] $Memlimit,

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
        if ($PSBoundParameters.ContainsKey('Memlimit')) { $body['memlimit'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('extendedmemoryparam', 'Clear extendedmemoryparam properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type extendedmemoryparam -Action unset -Payload @{ extendedmemoryparam = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetExtendedmemoryparam

# region Invoke-NSUnsetLocationparameter
function Invoke-NSUnsetLocationparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler locationparameter resource properties.
    .DESCRIPTION
        Configuration for location parameter resource.
    .PARAMETER ConText
        Context for describing locations. In geographic context, qualifier labels are assigned by default in the following sequence: Continent.Country.Region.City.ISP.Organization. In custom context, the qualifiers labels can have any meaning that you designate. Possible values = geographic, custom
    .PARAMETER Matchwildcardtoany
        Indicates whether wildcard qualifiers should match any other qualifier including non-wildcard while evaluating location based expressions. Possible values: Yes, No, Expression. Yes - Wildcard qualifiers match any other qualifiers. No - Wildcard qualifiers do not match non-wildcard qualifiers, but match other wildcard qualifiers. Expression - Wildcard qualifiers in an expression match any qualifier in an LDNS location, wildcard qualifiers in the LDNS location do not match non-wildcard qualifiers in an expression. Default value: NO Possible values = YES, NO, Expression
    .PARAMETER Q1Label
        Label specifying the meaning of the first qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q2Label
        Label specifying the meaning of the second qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q3Label
        Label specifying the meaning of the third qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q4Label
        Label specifying the meaning of the fourth qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q5Label
        Label specifying the meaning of the fifth qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q6Label
        Label specifying the meaning of the sixth qualifier. Can be specified for custom context only. Minimum length = 1
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
        Invoke-NSUnsetLocationparameter -ConText geographic -PassThru
    .EXAMPLE
        Invoke-NSUnsetLocationparameter -ConText geographic -WhatIf
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
        [ValidateSet('geographic', 'custom')]
        [switch] $ConText,

        [Parameter()]
        [ValidateSet('YES', 'NO', 'Expression')]
        [switch] $Matchwildcardtoany,

        [Parameter()]
        [switch] $Q1Label,

        [Parameter()]
        [switch] $Q2Label,

        [Parameter()]
        [switch] $Q3Label,

        [Parameter()]
        [switch] $Q4Label,

        [Parameter()]
        [switch] $Q5Label,

        [Parameter()]
        [switch] $Q6Label,

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
        if ($PSBoundParameters.ContainsKey('ConText')) { $body['context'] = $true }
        if ($PSBoundParameters.ContainsKey('Matchwildcardtoany')) { $body['matchwildcardtoany'] = $true }
        if ($PSBoundParameters.ContainsKey('Q1Label')) { $body['q1label'] = $true }
        if ($PSBoundParameters.ContainsKey('Q2Label')) { $body['q2label'] = $true }
        if ($PSBoundParameters.ContainsKey('Q3Label')) { $body['q3label'] = $true }
        if ($PSBoundParameters.ContainsKey('Q4Label')) { $body['q4label'] = $true }
        if ($PSBoundParameters.ContainsKey('Q5Label')) { $body['q5label'] = $true }
        if ($PSBoundParameters.ContainsKey('Q6Label')) { $body['q6label'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('locationparameter', 'Clear locationparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type locationparameter -Action unset -Payload @{ locationparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLocationparameter

# region Invoke-NSUnsetServer
function Invoke-NSUnsetServer {
    <#
    .SYNOPSIS
        Clears one or more NetScaler server resource properties.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Comment
        Any information about the server.
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
        Invoke-NSUnsetServer -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUnsetServer -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [switch] $Comment,

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
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear server properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type server -Action unset -Payload @{ server = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetServer -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetServer

# region Invoke-NSUnsetService
function Invoke-NSUnsetService {
    <#
    .SYNOPSIS
        Clears one or more NetScaler service resource properties.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
    .PARAMETER AccessDown
        Use Layer 2 mode to bridge the packets sent to this service if it is marked as DOWN. If the service is DOWN, and this parameter is disabled, the packets are dropped. Default value: NO Possible values = YES, NO
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cacheable
        Use the transparent cache redirection virtual server to forward requests to the cache server. Note: Do not specify this parameter if you set the Cache Type parameter. Default value: NO Possible values = YES, NO
    .PARAMETER CIP
        Before forwarding a request to the service, insert an HTTP header with the client's IPv4 or IPv6 address as its value. Used if the server needs the client's IP address for security, accounting, or other purposes, and setting the Use Source IP parameter is not a viable option. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name for the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If you set the Client IP parameter, and you do not specify a name for the header, the appliance uses the header name specified for the global Client IP Header parameter (the cipHeader parameter in the set ns param CLI command or the Client IP Header parameter in the Configure HTTP Parameters dialog box at System > Settings > Change HTTP parameters). If the global Client IP Header parameter is not specified, the appliance inserts a header with the name "client-ip.". Minimum length = 1
    .PARAMETER CKA
        Enable client keep-alive for the service. Possible values = YES, NO
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER CMP
        Enable compression for the service. Possible values = YES, NO
    .PARAMETER Comment
        Any information about the service.
    .PARAMETER ContentInSpecTionProfileName
        Name of the ContentInspection profile that contains IPS/IDS communication related setting for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER CustomServerID
        Unique identifier for the service. Used when the persistency type for the virtual server is set to Custom Server ID. Default value: "None"
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the service. DNS profile properties will applied to the transactions processed by a service. This parameter is valid only for ADNS, ADNS-TCP and ADNS-DOT services. Minimum length = 1 Maximum length = 127
    .PARAMETER DownStateFlush
        Flush all active transactions associated with a service whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER HashID
        A numerical identifier that can be used by hash based load balancing methods. Must be unique for each service. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of this service. Available settings function as follows: YES - Send probes to check the health of the service. NO - Do not send probes to check the health of the service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER HTTPProfileName
        Name of the HTTP profile that contains HTTP configuration settings for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated to the service. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections to the service. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MaxReq
        Maximum number of requests that can be sent on a persistent connection to the service. Note: Connection requests beyond this value are rejected. Minimum value = 0 Maximum value = 65535
    .PARAMETER MonConnectionClose
        Close monitoring connections by sending the service a connection termination message with the specified bit set. Default value: NONE Possible values = RESET, FIN
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this service. Used to determine whether to mark a service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER NetProfile
        Network profile to use for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER PathMonitor
        Path monitoring for clustering. Possible values = YES, NO
    .PARAMETER PathMonitorIndv
        Individual Path monitoring decisions. Possible values = YES, NO
    .PARAMETER ProcessLocal
        By turning on this option packets destined to a service in a cluster will not under go any steering. Turn this option for single packet request response mode or when the upstream device is performing a proper RSS for connection based distribution. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the service. Minimum length = 1 Maximum length = 255
    .PARAMETER RTSPSessionIDRemap
        Enable RTSP session ID mapping for the service. Default value: OFF Possible values = ON, OFF
    .PARAMETER ServerID
        The identifier for the service. This is used when the persistency type is set to Custom Server ID.
    .PARAMETER SP
        Enable surge protection for the service. Possible values = ON, OFF
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER TCPB
        Enable TCP buffering for the service. Possible values = YES, NO
    .PARAMETER TCPProfileName
        Name of the TCP profile that contains TCP configuration settings for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER UseProxyPort
        Use the proxy port as the source port when initiating connections with the server. With the NO setting, the client-side connection port is used as the source port for the server-side connection. Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES. Possible values = YES, NO
    .PARAMETER USIP
        Use the client's IP address as the source IP address when initiating a connection to the server. When creating a service, if you do not set this parameter, the service inherits the global Use Source IP setting (available in the enable ns mode and disable ns mode CLI commands, or in the System > Settings > Configure modes > Configure Modes dialog box). However, you can override this setting after you create the service. Possible values = YES, NO
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
        Invoke-NSUnsetService -Name 'example' -AccessDown YES -PassThru
    .EXAMPLE
        Invoke-NSUnsetService -Name 'example' -AccessDown YES -WhatIf
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
        [switch] $AccessDown,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowLog,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Cacheable,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CIP,

        [Parameter()]
        [switch] $CIPHeader,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $CKA,

        [Parameter()]
        [switch] $CltTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $CMP,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [switch] $ContentInSpecTionProfileName,

        [Parameter()]
        [switch] $CustomServerID,

        [Parameter()]
        [switch] $DNSProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DownStateFlush,

        [Parameter()]
        [switch] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $HealthMonitor,

        [Parameter()]
        [switch] $HTTPProfileName,

        [Parameter()]
        [switch] $MaxBandwidth,

        [Parameter()]
        [switch] $MaxClient,

        [Parameter()]
        [switch] $MaxReq,

        [Parameter()]
        [ValidateSet('RESET', 'FIN')]
        [switch] $MonConnectionClose,

        [Parameter()]
        [switch] $MonThreshold,

        [Parameter()]
        [switch] $NetProfile,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $PathMonitor,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $PathMonitorIndv,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ProcessLocal,

        [Parameter()]
        [switch] $QUICProfileName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $RTSPSessionIDRemap,

        [Parameter()]
        [switch] $ServerID,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $SP,

        [Parameter()]
        [switch] $SvrTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $TCPB,

        [Parameter()]
        [switch] $TCPProfileName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $UseProxyPort,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $USIP,

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
        if ($PSBoundParameters.ContainsKey('AccessDown')) { $body['accessdown'] = $true }
        if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $body['appflowlog'] = $true }
        if ($PSBoundParameters.ContainsKey('Cacheable')) { $body['cacheable'] = $true }
        if ($PSBoundParameters.ContainsKey('CIP')) { $body['cip'] = $true }
        if ($PSBoundParameters.ContainsKey('CIPHeader')) { $body['cipheader'] = $true }
        if ($PSBoundParameters.ContainsKey('CKA')) { $body['cka'] = $true }
        if ($PSBoundParameters.ContainsKey('CltTimeout')) { $body['clttimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('CMP')) { $body['cmp'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('ContentInSpecTionProfileName')) { $body['contentinspectionprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('CustomServerID')) { $body['customserverid'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $body['dnsprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $body['downstateflush'] = $true }
        if ($PSBoundParameters.ContainsKey('HashID')) { $body['hashid'] = $true }
        if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $body['healthmonitor'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $body['httpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $body['maxbandwidth'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxClient')) { $body['maxclient'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxReq')) { $body['maxreq'] = $true }
        if ($PSBoundParameters.ContainsKey('MonConnectionClose')) { $body['monconnectionclose'] = $true }
        if ($PSBoundParameters.ContainsKey('MonThreshold')) { $body['monthreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('NetProfile')) { $body['netprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('PathMonitor')) { $body['pathmonitor'] = $true }
        if ($PSBoundParameters.ContainsKey('PathMonitorIndv')) { $body['pathmonitorindv'] = $true }
        if ($PSBoundParameters.ContainsKey('ProcessLocal')) { $body['processlocal'] = $true }
        if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $body['quicprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('RTSPSessionIDRemap')) { $body['rtspsessionidremap'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerID')) { $body['serverid'] = $true }
        if ($PSBoundParameters.ContainsKey('SP')) { $body['sp'] = $true }
        if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $body['svrtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPB')) { $body['tcpb'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $body['tcpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('UseProxyPort')) { $body['useproxyport'] = $true }
        if ($PSBoundParameters.ContainsKey('USIP')) { $body['usip'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear service properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type service -Action unset -Payload @{ service = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetService -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetService

# region Invoke-NSUnsetServiceGroup
function Invoke-NSUnsetServiceGroup {
    <#
    .SYNOPSIS
        Clears one or more NetScaler servicegroup resource properties.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information for the specified service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER AutoDelayedTROFS
        Indicates graceful movement of IP-Port binding/s to TROFS when IP addresses are removed from DNS response. System will wait for monitor response timeout period before moving to TROFS . Default value: NO Possible values = YES, NO
    .PARAMETER AutoDisableDelay
        The time allowed (in seconds) for a graceful shutdown. During this period, new connections or requests will continue to be sent to this service for clients who already have a persistent session on the system. Connections or requests from fresh or new clients who do not yet have a persistence sessions on the system will not be sent to the service. Instead, they will be load balanced among other available services. After the delay time expires, no new requests or connections will be sent to the service.
    .PARAMETER AutoDisableGraceful
        Indicates graceful shutdown of the service. System will wait for all outstanding connections to this service to be closed before disabling the service. Default value: NO Possible values = YES, NO
    .PARAMETER Cacheable
        Use the transparent cache redirection virtual server to forward the request to the cache server. Note: Do not set this parameter if you set the Cache Type. Default value: NO Possible values = YES, NO
    .PARAMETER CIP
        Insert the Client IP header in requests forwarded to the service. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name of the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If client IP insertion is enabled, and the client IP header is not specified, the value of Client IP Header parameter or the value set by the set ns config command is used as client's IP header name. Minimum length = 1
    .PARAMETER CKA
        Enable client keep-alive for the service group. Possible values = YES, NO
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER CMP
        Enable compression for the specified service. Possible values = YES, NO
    .PARAMETER Comment
        Any information about the service group.
    .PARAMETER CustomServerID
        The identifier for this IP:Port pair. Used when the persistency type is set to Custom Server ID. Default value: "None"
    .PARAMETER DBSTTL
        Specify the TTL for DNS record for domain based service.The default value of ttl is 0 which indicates to use the TTL received in DNS response for monitors. Default value: 0
    .PARAMETER DownStateFlush
        Flush all active transactions associated with all the services in the service group whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DupWeight
        weight of the monitor that is bound to servicegroup. Minimum value = 1
    .PARAMETER HashID
        The hash identifier for the service. This must be unique for each service. This parameter is used by hash based load balancing methods. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of this service. Available settings function as follows: YES - Send probes to check the health of the service. NO - Do not send probes to check the health of the service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER HTTPProfileName
        Name of the HTTP profile that contains HTTP configuration settings for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated for all the services in the service group. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections for the service group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MaxReq
        Maximum number of requests that can be sent on a persistent connection to the service group. Note: Connection requests beyond this value are rejected. Minimum value = 0 Maximum value = 65535
    .PARAMETER MonConnectionClose
        Close monitoring connections by sending the service a connection termination message with the specified bit set. Default value: NONE Possible values = RESET, FIN
    .PARAMETER MonitorNameSvc
        Name of the monitor bound to the service group. Used to assign a weight to the monitor. Minimum length = 1
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this service. Used to determine whether to mark a service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER NameServer
        Specify the nameserver to which the query for bound domain needs to be sent. If not specified, use the global nameserver.
    .PARAMETER NetProfile
        Network profile for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER Order
        Order number to be assigned to the servicegroup member. Minimum value = 1 Maximum value = 8192
    .PARAMETER PathMonitor
        Path monitoring for clustering. Possible values = YES, NO
    .PARAMETER PathMonitorIndv
        Individual Path monitoring decisions. Possible values = YES, NO
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the service group. Minimum length = 1 Maximum length = 255
    .PARAMETER RTSPSessionIDRemap
        Enable RTSP session ID mapping for the service group. Default value: OFF Possible values = ON, OFF
    .PARAMETER ServerID
        The identifier for the service. This is used when the persistency type is set to Custom Server ID.
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
    .PARAMETER SP
        Enable surge protection for the service group. Default value: OFF Possible values = ON, OFF
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER TCPB
        Enable TCP buffering for the service group. Possible values = YES, NO
    .PARAMETER TCPProfileName
        Name of the TCP profile that contains TCP configuration settings for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER UseProxyPort
        Use the proxy port as the source port when initiating connections with the server. With the NO setting, the client-side connection port is used as the source port for the server-side connection. Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES. Possible values = YES, NO
    .PARAMETER USIP
        Use client's IP address as the source IP address when initiating connection to the server. With the NO setting, which is the default, a mapped IP (MIP) address or subnet IP (SNIP) address is used as the source IP address to initiate server side connections. Possible values = YES, NO
    .PARAMETER Weight
        Weight to assign to the servers in the service group. Specifies the capacity of the servers relative to the other servers in the load balancing configuration. The higher the weight, the higher the percentage of requests sent to the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSUnsetServiceGroup -ServiceGroupName 'example' -AppFlowLog ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetServiceGroup -ServiceGroupName 'example' -AppFlowLog ENABLED -WhatIf
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
        [string] $ServiceGroupName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowLog,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $AutoDelayedTROFS,

        [Parameter()]
        [switch] $AutoDisableDelay,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $AutoDisableGraceful,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Cacheable,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CIP,

        [Parameter()]
        [switch] $CIPHeader,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $CKA,

        [Parameter()]
        [switch] $CltTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $CMP,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [switch] $CustomServerID,

        [Parameter()]
        [switch] $DBSTTL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DownStateFlush,

        [Parameter()]
        [switch] $DupWeight,

        [Parameter()]
        [switch] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $HealthMonitor,

        [Parameter()]
        [switch] $HTTPProfileName,

        [Parameter()]
        [switch] $MaxBandwidth,

        [Parameter()]
        [switch] $MaxClient,

        [Parameter()]
        [switch] $MaxReq,

        [Parameter()]
        [ValidateSet('RESET', 'FIN')]
        [switch] $MonConnectionClose,

        [Parameter()]
        [switch] $MonitorNameSvc,

        [Parameter()]
        [switch] $MonThreshold,

        [Parameter()]
        [switch] $NameServer,

        [Parameter()]
        [switch] $NetProfile,

        [Parameter()]
        [switch] $Order,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $PathMonitor,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $PathMonitorIndv,

        [Parameter()]
        [switch] $Port,

        [Parameter()]
        [switch] $QUICProfileName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $RTSPSessionIDRemap,

        [Parameter()]
        [switch] $ServerID,

        [Parameter()]
        [switch] $ServerName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $SP,

        [Parameter()]
        [switch] $SvrTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $TCPB,

        [Parameter()]
        [switch] $TCPProfileName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $UseProxyPort,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $USIP,

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

        $body = @{ servicegroupname = $ServiceGroupName }
        if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $body['appflowlog'] = $true }
        if ($PSBoundParameters.ContainsKey('AutoDelayedTROFS')) { $body['autodelayedtrofs'] = $true }
        if ($PSBoundParameters.ContainsKey('AutoDisableDelay')) { $body['autodisabledelay'] = $true }
        if ($PSBoundParameters.ContainsKey('AutoDisableGraceful')) { $body['autodisablegraceful'] = $true }
        if ($PSBoundParameters.ContainsKey('Cacheable')) { $body['cacheable'] = $true }
        if ($PSBoundParameters.ContainsKey('CIP')) { $body['cip'] = $true }
        if ($PSBoundParameters.ContainsKey('CIPHeader')) { $body['cipheader'] = $true }
        if ($PSBoundParameters.ContainsKey('CKA')) { $body['cka'] = $true }
        if ($PSBoundParameters.ContainsKey('CltTimeout')) { $body['clttimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('CMP')) { $body['cmp'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('CustomServerID')) { $body['customserverid'] = $true }
        if ($PSBoundParameters.ContainsKey('DBSTTL')) { $body['dbsttl'] = $true }
        if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $body['downstateflush'] = $true }
        if ($PSBoundParameters.ContainsKey('DupWeight')) { $body['dup_weight'] = $true }
        if ($PSBoundParameters.ContainsKey('HashID')) { $body['hashid'] = $true }
        if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $body['healthmonitor'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $body['httpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $body['maxbandwidth'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxClient')) { $body['maxclient'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxReq')) { $body['maxreq'] = $true }
        if ($PSBoundParameters.ContainsKey('MonConnectionClose')) { $body['monconnectionclose'] = $true }
        if ($PSBoundParameters.ContainsKey('MonitorNameSvc')) { $body['monitor_name_svc'] = $true }
        if ($PSBoundParameters.ContainsKey('MonThreshold')) { $body['monthreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('NameServer')) { $body['nameserver'] = $true }
        if ($PSBoundParameters.ContainsKey('NetProfile')) { $body['netprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('Order')) { $body['order'] = $true }
        if ($PSBoundParameters.ContainsKey('PathMonitor')) { $body['pathmonitor'] = $true }
        if ($PSBoundParameters.ContainsKey('PathMonitorIndv')) { $body['pathmonitorindv'] = $true }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $true }
        if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $body['quicprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('RTSPSessionIDRemap')) { $body['rtspsessionidremap'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerID')) { $body['serverid'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerName')) { $body['servername'] = $true }
        if ($PSBoundParameters.ContainsKey('SP')) { $body['sp'] = $true }
        if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $body['svrtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPB')) { $body['tcpb'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $body['tcpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('UseProxyPort')) { $body['useproxyport'] = $true }
        if ($PSBoundParameters.ContainsKey('USIP')) { $body['usip'] = $true }
        if ($PSBoundParameters.ContainsKey('Weight')) { $body['weight'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Clear servicegroup properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type servicegroup -Action unset -Payload @{ servicegroup = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetServiceGroup

# region Invoke-NSUpdateExtendedmemoryparam
function Invoke-NSUpdateExtendedmemoryparam {
    <#
    .SYNOPSIS
        Updates a NetScaler extendedmemoryparam resource.
    .DESCRIPTION
        Configuration for Parameter for extended memory used by LSN and Subscriber Store resource.
    .PARAMETER Memlimit
        Amount of NetScaler memory to reserve for the memory used by LSN and Subscriber Session Store feature, in multiples of 2MB. Note: If you later reduce the value of this parameter, the amount of active memory is not reduced. Changing the configured memory limit can only increase the amount of active memory.
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
        Invoke-NSUpdateExtendedmemoryparam  -PassThru
    .EXAMPLE
        Invoke-NSUpdateExtendedmemoryparam  -WhatIf
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
        [int] $Memlimit,

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
    if ($PSBoundParameters.ContainsKey('Memlimit')) { $properties['memlimit'] = $Memlimit }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('extendedmemoryparam', 'Update extendedmemoryparam')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type extendedmemoryparam -Payload @{ extendedmemoryparam = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateExtendedmemoryparam

# region Invoke-NSUpdateLocationparameter
function Invoke-NSUpdateLocationparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler locationparameter resource.
    .DESCRIPTION
        Configuration for location parameter resource.
    .PARAMETER ConText
        Context for describing locations. In geographic context, qualifier labels are assigned by default in the following sequence: Continent.Country.Region.City.ISP.Organization. In custom context, the qualifiers labels can have any meaning that you designate. Possible values = geographic, custom
    .PARAMETER Matchwildcardtoany
        Indicates whether wildcard qualifiers should match any other qualifier including non-wildcard while evaluating location based expressions. Possible values: Yes, No, Expression. Yes - Wildcard qualifiers match any other qualifiers. No - Wildcard qualifiers do not match non-wildcard qualifiers, but match other wildcard qualifiers. Expression - Wildcard qualifiers in an expression match any qualifier in an LDNS location, wildcard qualifiers in the LDNS location do not match non-wildcard qualifiers in an expression. Default value: NO Possible values = YES, NO, Expression
    .PARAMETER Q1Label
        Label specifying the meaning of the first qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q2Label
        Label specifying the meaning of the second qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q3Label
        Label specifying the meaning of the third qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q4Label
        Label specifying the meaning of the fourth qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q5Label
        Label specifying the meaning of the fifth qualifier. Can be specified for custom context only. Minimum length = 1
    .PARAMETER Q6Label
        Label specifying the meaning of the sixth qualifier. Can be specified for custom context only. Minimum length = 1
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
        Invoke-NSUpdateLocationparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateLocationparameter  -WhatIf
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
        [ValidateSet('geographic', 'custom')]
        [string] $ConText,

        [Parameter()]
        [ValidateSet('YES', 'NO', 'Expression')]
        [string] $Matchwildcardtoany,

        [Parameter()]
        [string] $Q1Label,

        [Parameter()]
        [string] $Q2Label,

        [Parameter()]
        [string] $Q3Label,

        [Parameter()]
        [string] $Q4Label,

        [Parameter()]
        [string] $Q5Label,

        [Parameter()]
        [string] $Q6Label,

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
    if ($PSBoundParameters.ContainsKey('ConText')) { $properties['context'] = $ConText }
    if ($PSBoundParameters.ContainsKey('Matchwildcardtoany')) { $properties['matchwildcardtoany'] = $Matchwildcardtoany }
    if ($PSBoundParameters.ContainsKey('Q1Label')) { $properties['q1label'] = $Q1Label }
    if ($PSBoundParameters.ContainsKey('Q2Label')) { $properties['q2label'] = $Q2Label }
    if ($PSBoundParameters.ContainsKey('Q3Label')) { $properties['q3label'] = $Q3Label }
    if ($PSBoundParameters.ContainsKey('Q4Label')) { $properties['q4label'] = $Q4Label }
    if ($PSBoundParameters.ContainsKey('Q5Label')) { $properties['q5label'] = $Q5Label }
    if ($PSBoundParameters.ContainsKey('Q6Label')) { $properties['q6label'] = $Q6Label }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('locationparameter', 'Update locationparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type locationparameter -Payload @{ locationparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateLocationparameter

# region Invoke-NSUpdateRADIUSNode
function Invoke-NSUpdateRADIUSNode {
    <#
    .SYNOPSIS
        Updates a NetScaler radiusnode resource.
    .DESCRIPTION
        Configuration for RADIUS Node resource.
    .PARAMETER Nodeprefix
        IP address/IP prefix of radius node in CIDR format.
    .PARAMETER RadKey
        The key shared between the RADIUS server and clients. Required for NetScaler to communicate with the RADIUS nodes.
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
        Invoke-NSUpdateRADIUSNode -Nodeprefix 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateRADIUSNode -Nodeprefix 'example' -WhatIf
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
        [string] $Nodeprefix,

        [Parameter()]
        [string] $RadKey,

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
    if ($PSBoundParameters.ContainsKey('Nodeprefix')) { $properties['nodeprefix'] = $Nodeprefix }
    if ($PSBoundParameters.ContainsKey('RadKey')) { $properties['radkey'] = $RadKey }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Nodeprefix", 'Update radiusnode')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type radiusnode -Payload @{ radiusnode = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetRADIUSNode -Nodeprefix $Nodeprefix -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateRADIUSNode

# region Invoke-NSUpdateServer
function Invoke-NSUpdateServer {
    <#
    .SYNOPSIS
        Updates a NetScaler server.
    .DESCRIPTION
        Configuration for server resource.
    .PARAMETER Comment
        Any information about the server.
    .PARAMETER Domainresolvenow
        Immediately send a DNS query to resolve the server's domain name.
    .PARAMETER Domainresolveretry
        Time, in seconds, for which the NetScaler must wait, after DNS resolution fails, before sending the next DNS query to resolve the domain name. Default value: 5 Minimum value = 5 Maximum value = 20939
    .PARAMETER Ipaddress
        IPv4 or IPv6 address of the server. If you create an IP address based server, you can specify the name of the server, instead of its IP address, when creating a service. Note: If you do not create a server entry, the server IP address that you enter when you create a service becomes the name of the server.
    .PARAMETER Name
        Name for the server. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Translationip
        IP address used to transform the server's DNS-resolved IP address.
    .PARAMETER TranslationMask
        The netmask of the translation ip.
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
        Invoke-NSUpdateServer -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateServer -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $Comment,

        [Parameter()]
        [bool] $Domainresolvenow,

        [Parameter()]
        [int] $Domainresolveretry,

        [Parameter()]
        [string] $Ipaddress,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Translationip,

        [Parameter()]
        [string] $TranslationMask,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Domainresolvenow')) { $properties['domainresolvenow'] = $Domainresolvenow }
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Translationip')) { $properties['translationip'] = $Translationip }
    if ($PSBoundParameters.ContainsKey('TranslationMask')) { $properties['translationmask'] = $TranslationMask }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update server')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type server -Payload @{ server = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateServer

# region Invoke-NSUpdateService
function Invoke-NSUpdateService {
    <#
    .SYNOPSIS
        Updates a NetScaler service.
    .DESCRIPTION
        Configuration for service resource.
    .PARAMETER AccessDown
        Use Layer 2 mode to bridge the packets sent to this service if it is marked as DOWN. If the service is DOWN, and this parameter is disabled, the packets are dropped. Default value: NO Possible values = YES, NO
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cacheable
        Use the transparent cache redirection virtual server to forward requests to the cache server. Note: Do not specify this parameter if you set the Cache Type parameter. Default value: NO Possible values = YES, NO
    .PARAMETER CIP
        Before forwarding a request to the service, insert an HTTP header with the client's IPv4 or IPv6 address as its value. Used if the server needs the client's IP address for security, accounting, or other purposes, and setting the Use Source IP parameter is not a viable option. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name for the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If you set the Client IP parameter, and you do not specify a name for the header, the appliance uses the header name specified for the global Client IP Header parameter (the cipHeader parameter in the set ns param CLI command or the Client IP Header parameter in the Configure HTTP Parameters dialog box at System > Settings > Change HTTP parameters). If the global Client IP Header parameter is not specified, the appliance inserts a header with the name "client-ip.". Minimum length = 1
    .PARAMETER CKA
        Enable client keep-alive for the service. Possible values = YES, NO
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER CMP
        Enable compression for the service. Possible values = YES, NO
    .PARAMETER Comment
        Any information about the service.
    .PARAMETER ContentInSpecTionProfileName
        Name of the ContentInspection profile that contains IPS/IDS communication related setting for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER CustomServerID
        Unique identifier for the service. Used when the persistency type for the virtual server is set to Custom Server ID. Default value: "None"
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the service. DNS profile properties will applied to the transactions processed by a service. This parameter is valid only for ADNS, ADNS-TCP and ADNS-DOT services. Minimum length = 1 Maximum length = 127
    .PARAMETER DownStateFlush
        Flush all active transactions associated with a service whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER HashID
        A numerical identifier that can be used by hash based load balancing methods. Must be unique for each service. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of this service. Available settings function as follows: YES - Send probes to check the health of the service. NO - Do not send probes to check the health of the service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER HTTPProfileName
        Name of the HTTP profile that contains HTTP configuration settings for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER Ipaddress
        The new IP address of the service.
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated to the service. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections to the service. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MaxReq
        Maximum number of requests that can be sent on a persistent connection to the service. Note: Connection requests beyond this value are rejected. Minimum value = 0 Maximum value = 65535
    .PARAMETER MonConnectionClose
        Close monitoring connections by sending the service a connection termination message with the specified bit set. Default value: NONE Possible values = RESET, FIN
    .PARAMETER MonitorNameSvc
        Name of the monitor bound to the specified service. Minimum length = 1
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this service. Used to determine whether to mark a service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER Name
        Name for the service. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the service has been created. Minimum length = 1
    .PARAMETER NetProfile
        Network profile to use for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER PathMonitor
        Path monitoring for clustering. Possible values = YES, NO
    .PARAMETER PathMonitorIndv
        Individual Path monitoring decisions. Possible values = YES, NO
    .PARAMETER ProcessLocal
        By turning on this option packets destined to a service in a cluster will not under go any steering. Turn this option for single packet request response mode or when the upstream device is performing a proper RSS for connection based distribution. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the service. Minimum length = 1 Maximum length = 255
    .PARAMETER RTSPSessionIDRemap
        Enable RTSP session ID mapping for the service. Default value: OFF Possible values = ON, OFF
    .PARAMETER ServerID
        The identifier for the service. This is used when the persistency type is set to Custom Server ID.
    .PARAMETER SP
        Enable surge protection for the service. Possible values = ON, OFF
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER TCPB
        Enable TCP buffering for the service. Possible values = YES, NO
    .PARAMETER TCPProfileName
        Name of the TCP profile that contains TCP configuration settings for the service. Minimum length = 1 Maximum length = 127
    .PARAMETER UseProxyPort
        Use the proxy port as the source port when initiating connections with the server. With the NO setting, the client-side connection port is used as the source port for the server-side connection. Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES. Possible values = YES, NO
    .PARAMETER USIP
        Use the client's IP address as the source IP address when initiating a connection to the server. When creating a service, if you do not set this parameter, the service inherits the global Use Source IP setting (available in the enable ns mode and disable ns mode CLI commands, or in the System > Settings > Configure modes > Configure Modes dialog box). However, you can override this setting after you create the service. Possible values = YES, NO
    .PARAMETER Weight
        Weight to assign to the monitor-service binding. When a monitor is UP, the weight assigned to its binding with the service determines how much the monitor contributes toward keeping the health of the service above the value configured for the Monitor Threshold parameter. Minimum value = 1 Maximum value = 100
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
        Invoke-NSUpdateService -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateService -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [ValidateSet('YES', 'NO')]
        [string] $AccessDown,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowLog,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Cacheable,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CKA,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CMP,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $ContentInSpecTionProfileName,

        [Parameter()]
        [string] $CustomServerID,

        [Parameter()]
        [string] $DNSProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [int] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HealthMonitor,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [string] $Ipaddress,

        [Parameter()]
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [int] $MaxReq,

        [Parameter()]
        [ValidateSet('RESET', 'FIN')]
        [string] $MonConnectionClose,

        [Parameter()]
        [string] $MonitorNameSvc,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitor,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitorIndv,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ProcessLocal,

        [Parameter()]
        [string] $QUICProfileName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $RTSPSessionIDRemap,

        [Parameter()]
        [int] $ServerID,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SP,

        [Parameter()]
        [int] $SvrTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $TCPB,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UseProxyPort,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $USIP,

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
    if ($PSBoundParameters.ContainsKey('AccessDown')) { $properties['accessdown'] = $AccessDown }
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('Cacheable')) { $properties['cacheable'] = $Cacheable }
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('CKA')) { $properties['cka'] = $CKA }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('CMP')) { $properties['cmp'] = $CMP }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionProfileName')) { $properties['contentinspectionprofilename'] = $ContentInSpecTionProfileName }
    if ($PSBoundParameters.ContainsKey('CustomServerID')) { $properties['customserverid'] = $CustomServerID }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MaxReq')) { $properties['maxreq'] = $MaxReq }
    if ($PSBoundParameters.ContainsKey('MonConnectionClose')) { $properties['monconnectionclose'] = $MonConnectionClose }
    if ($PSBoundParameters.ContainsKey('MonitorNameSvc')) { $properties['monitor_name_svc'] = $MonitorNameSvc }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('PathMonitor')) { $properties['pathmonitor'] = $PathMonitor }
    if ($PSBoundParameters.ContainsKey('PathMonitorIndv')) { $properties['pathmonitorindv'] = $PathMonitorIndv }
    if ($PSBoundParameters.ContainsKey('ProcessLocal')) { $properties['processlocal'] = $ProcessLocal }
    if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $properties['quicprofilename'] = $QUICProfileName }
    if ($PSBoundParameters.ContainsKey('RTSPSessionIDRemap')) { $properties['rtspsessionidremap'] = $RTSPSessionIDRemap }
    if ($PSBoundParameters.ContainsKey('ServerID')) { $properties['serverid'] = $ServerID }
    if ($PSBoundParameters.ContainsKey('SP')) { $properties['sp'] = $SP }
    if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $properties['svrtimeout'] = $SvrTimeout }
    if ($PSBoundParameters.ContainsKey('TCPB')) { $properties['tcpb'] = $TCPB }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('UseProxyPort')) { $properties['useproxyport'] = $UseProxyPort }
    if ($PSBoundParameters.ContainsKey('USIP')) { $properties['usip'] = $USIP }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update service')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type service -Payload @{ service = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetService -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateService

# region Invoke-NSUpdateServiceGroup
function Invoke-NSUpdateServiceGroup {
    <#
    .SYNOPSIS
        Updates a NetScaler servicegroup resource.
    .DESCRIPTION
        Configuration for service group resource.
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information for the specified service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER AutoDelayedTROFS
        Indicates graceful movement of IP-Port binding/s to TROFS when IP addresses are removed from DNS response. System will wait for monitor response timeout period before moving to TROFS . Default value: NO Possible values = YES, NO
    .PARAMETER AutoDisableDelay
        The time allowed (in seconds) for a graceful shutdown. During this period, new connections or requests will continue to be sent to this service for clients who already have a persistent session on the system. Connections or requests from fresh or new clients who do not yet have a persistence sessions on the system will not be sent to the service. Instead, they will be load balanced among other available services. After the delay time expires, no new requests or connections will be sent to the service.
    .PARAMETER AutoDisableGraceful
        Indicates graceful shutdown of the service. System will wait for all outstanding connections to this service to be closed before disabling the service. Default value: NO Possible values = YES, NO
    .PARAMETER Autoscale
        Auto scale option for a servicegroup. Default value: DISABLED Possible values = DISABLED, DNS, POLICY, CLOUD, API
    .PARAMETER Cacheable
        Use the transparent cache redirection virtual server to forward the request to the cache server. Note: Do not set this parameter if you set the Cache Type. Default value: NO Possible values = YES, NO
    .PARAMETER CIP
        Insert the Client IP header in requests forwarded to the service. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name of the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If client IP insertion is enabled, and the client IP header is not specified, the value of Client IP Header parameter or the value set by the set ns config command is used as client's IP header name. Minimum length = 1
    .PARAMETER CKA
        Enable client keep-alive for the service group. Possible values = YES, NO
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER CMP
        Enable compression for the specified service. Possible values = YES, NO
    .PARAMETER Comment
        Any information about the service group.
    .PARAMETER CustomServerID
        The identifier for this IP:Port pair. Used when the persistency type is set to Custom Server ID. Default value: "None"
    .PARAMETER DBSTTL
        Specify the TTL for DNS record for domain based service.The default value of ttl is 0 which indicates to use the TTL received in DNS response for monitors. Default value: 0
    .PARAMETER DownStateFlush
        Flush all active transactions associated with all the services in the service group whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DupWeight
        weight of the monitor that is bound to servicegroup. Minimum value = 1
    .PARAMETER HashID
        The hash identifier for the service. This must be unique for each service. This parameter is used by hash based load balancing methods. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of this service. Available settings function as follows: YES - Send probes to check the health of the service. NO - Do not send probes to check the health of the service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER HTTPProfileName
        Name of the HTTP profile that contains HTTP configuration settings for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated for all the services in the service group. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections for the service group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MaxReq
        Maximum number of requests that can be sent on a persistent connection to the service group. Note: Connection requests beyond this value are rejected. Minimum value = 0 Maximum value = 65535
    .PARAMETER MonConnectionClose
        Close monitoring connections by sending the service a connection termination message with the specified bit set. Default value: NONE Possible values = RESET, FIN
    .PARAMETER MonitorNameSvc
        Name of the monitor bound to the service group. Used to assign a weight to the monitor. Minimum length = 1
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this service. Used to determine whether to mark a service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER NameServer
        Specify the nameserver to which the query for bound domain needs to be sent. If not specified, use the global nameserver.
    .PARAMETER NetProfile
        Network profile for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER Order
        Order number to be assigned to the servicegroup member. Minimum value = 1 Maximum value = 8192
    .PARAMETER PathMonitor
        Path monitoring for clustering. Possible values = YES, NO
    .PARAMETER PathMonitorIndv
        Individual Path monitoring decisions. Possible values = YES, NO
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the service group. Minimum length = 1 Maximum length = 255
    .PARAMETER RTSPSessionIDRemap
        Enable RTSP session ID mapping for the service group. Default value: OFF Possible values = ON, OFF
    .PARAMETER ServerID
        The identifier for the service. This is used when the persistency type is set to Custom Server ID.
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
    .PARAMETER ServiceGroupName
        Name of the service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER SP
        Enable surge protection for the service group. Default value: OFF Possible values = ON, OFF
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER TCPB
        Enable TCP buffering for the service group. Possible values = YES, NO
    .PARAMETER TCPProfileName
        Name of the TCP profile that contains TCP configuration settings for the service group. Minimum length = 1 Maximum length = 127
    .PARAMETER UseProxyPort
        Use the proxy port as the source port when initiating connections with the server. With the NO setting, the client-side connection port is used as the source port for the server-side connection. Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES. Possible values = YES, NO
    .PARAMETER USIP
        Use client's IP address as the source IP address when initiating connection to the server. With the NO setting, which is the default, a mapped IP (MIP) address or subnet IP (SNIP) address is used as the source IP address to initiate server side connections. Possible values = YES, NO
    .PARAMETER Weight
        Weight to assign to the servers in the service group. Specifies the capacity of the servers relative to the other servers in the load balancing configuration. The higher the weight, the higher the percentage of requests sent to the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSUpdateServiceGroup -ServiceGroupName 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateServiceGroup -ServiceGroupName 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $AppFlowLog,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $AutoDelayedTROFS,

        [Parameter()]
        [int] $AutoDisableDelay,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $AutoDisableGraceful,

        [Parameter()]
        [ValidateSet('DISABLED', 'DNS', 'POLICY', 'CLOUD', 'API')]
        [string] $Autoscale,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Cacheable,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CKA,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $CMP,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $CustomServerID,

        [Parameter()]
        [int] $DBSTTL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [int] $DupWeight,

        [Parameter()]
        [int] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HealthMonitor,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [int] $MaxReq,

        [Parameter()]
        [ValidateSet('RESET', 'FIN')]
        [string] $MonConnectionClose,

        [Parameter()]
        [string] $MonitorNameSvc,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter()]
        [string] $NameServer,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitor,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PathMonitorIndv,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $QUICProfileName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $RTSPSessionIDRemap,

        [Parameter()]
        [int] $ServerID,

        [Parameter()]
        [string] $ServerName,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SP,

        [Parameter()]
        [int] $SvrTimeout,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $TCPB,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UseProxyPort,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $USIP,

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
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('AutoDelayedTROFS')) { $properties['autodelayedtrofs'] = $AutoDelayedTROFS }
    if ($PSBoundParameters.ContainsKey('AutoDisableDelay')) { $properties['autodisabledelay'] = $AutoDisableDelay }
    if ($PSBoundParameters.ContainsKey('AutoDisableGraceful')) { $properties['autodisablegraceful'] = $AutoDisableGraceful }
    if ($PSBoundParameters.ContainsKey('Autoscale')) { $properties['autoscale'] = $Autoscale }
    if ($PSBoundParameters.ContainsKey('Cacheable')) { $properties['cacheable'] = $Cacheable }
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('CKA')) { $properties['cka'] = $CKA }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('CMP')) { $properties['cmp'] = $CMP }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('CustomServerID')) { $properties['customserverid'] = $CustomServerID }
    if ($PSBoundParameters.ContainsKey('DBSTTL')) { $properties['dbsttl'] = $DBSTTL }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('DupWeight')) { $properties['dup_weight'] = $DupWeight }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MaxReq')) { $properties['maxreq'] = $MaxReq }
    if ($PSBoundParameters.ContainsKey('MonConnectionClose')) { $properties['monconnectionclose'] = $MonConnectionClose }
    if ($PSBoundParameters.ContainsKey('MonitorNameSvc')) { $properties['monitor_name_svc'] = $MonitorNameSvc }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('NameServer')) { $properties['nameserver'] = $NameServer }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('PathMonitor')) { $properties['pathmonitor'] = $PathMonitor }
    if ($PSBoundParameters.ContainsKey('PathMonitorIndv')) { $properties['pathmonitorindv'] = $PathMonitorIndv }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $properties['quicprofilename'] = $QUICProfileName }
    if ($PSBoundParameters.ContainsKey('RTSPSessionIDRemap')) { $properties['rtspsessionidremap'] = $RTSPSessionIDRemap }
    if ($PSBoundParameters.ContainsKey('ServerID')) { $properties['serverid'] = $ServerID }
    if ($PSBoundParameters.ContainsKey('ServerName')) { $properties['servername'] = $ServerName }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('SP')) { $properties['sp'] = $SP }
    if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $properties['svrtimeout'] = $SvrTimeout }
    if ($PSBoundParameters.ContainsKey('TCPB')) { $properties['tcpb'] = $TCPB }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('UseProxyPort')) { $properties['useproxyport'] = $UseProxyPort }
    if ($PSBoundParameters.ContainsKey('USIP')) { $properties['usip'] = $USIP }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Update servicegroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type servicegroup -Payload @{ servicegroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateServiceGroup

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC7fiFMDovZxEHi
# NTAw9j4DTeVLYUIqcN5GWYBEfN6+BKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQg8tVI
# Wmmi3qo+rWe4m1NEvqYBNDcl2FU5qDfM1roLSmUwDQYJKoZIhvcNAQEBBQAEggGA
# OjLXK5idzGeFL/8Mun3J8G0+lg0EmENa4ZDr0nWyCZhztj8zUZKEVmRy8GmMwHZT
# EXN0+tzN2X1NcgNKiaAodRC2nFybKl5n+zwfA2FG/9jWX7DdNIG5vCSEX2ks8bE0
# XmpgxdDwVCQq6Gb/AzNs0d1aIA/wVpkJ+blQ27I2FpOcSJs2PLeCafWAyrSlW7eU
# Fiet0MlfxfKYgj9KG/jc95Zabcj2xMj3zoFXBPU829NVEtNWD6meq86zxNLmsRYt
# LbHNX29UiPjqY6+aqLkDKVEyMeOSl9zNKyaVKH+MawBnNKSvc0yfpWqD3AUBdwrl
# IZ6wW6iJ3nVzUgZls9uxHh7Ny2GYwiAAYdKJCZanm+v+pay+4Yys63/1NYDHth0T
# jxfL1g3if/3JwAJ75dLb1OW2RMRbityE/ckp23gFUJ/JrLmtDkDLY7cChLQzNgU9
# ie++fZ7pDZcdINC8deJ5R4bveRF3YKu0LL87q5rIwfaYCC9WZo59mJkULOp5/t7Z
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIHThYFzPdibPz1jgVCEj
# 6Ckzesrosdr8H6zah6W6uEtAAgZqNTBOPsUYEzIwMjYwNzI3MTMxMDQ5LjEwNVow
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
# IgQgLPnrOgyG5kYQcktNgL2sH0h2W+Yf7Do/Vy8yRHmyMZ0wgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCCQq79qqwkD4ea/FiBm
# C4pfvGQpmxVmt9dVg+iQDGdTljANBgkqhkiG9w0BAQsFAASCAgCwnGLYDV36t08l
# Og+McYjxeCH1gJpVq3OvdaE5AZaxXycR1eER5z5hAzqFeMvPXXULW7xyicr92Ak9
# anoZzFMLQhvCl5O0KeQSKMkmC+2PLD/lGW6MO3A1KqdlTsLqXtiehJTQUFNv+6hx
# LMxq6Je86rnmHAXAFWEUyfZs027nf4VnJd5vDMmKQjZs1Mhl/2TIfw2eX65UbloD
# eNrH6pfnnNR0k5Qq8rIw1AeuKfyssHhJcwdQgHE3xh8TOpxls9v3z7EOuenDjzJT
# qpMWYRF2NPMgr+eTAEAn7iVLD86RiCUJzMxi+3Bh6IlcAhH311mHRk68/aPALqwk
# SmHK1fmDmoN5qqwN4hsMhqaNXFryvYb/8lGH275f6x9jYKir9if7ErMVQL5urPph
# 1UzO6+bjNzVOEjL2iU5Ov8G2QD5sacr6nqv/RXZYcn84rhCUChXBpPFJGpkbF/IB
# jWdWgNPkeiQCsdBzwF8dvS4pXyobYf+xztdz+/AJHkDnrdVf4XInMTSVaemFm3Dr
# 4iQk9eurNODkbG+0GeXGHXNW/eADTLDet46SUUBKXrqiecw2STOk1SfjWNiQ+mLk
# MZTqPqzVG/8qb+75Z505Wb9nX9V8plnA1ul4TGuTU1+9mKfCROagyBuzyJAwLTMI
# 9P5kQbmCCkN99YVzQIHwNNWnDHvtew==
# SIG # End signature block
