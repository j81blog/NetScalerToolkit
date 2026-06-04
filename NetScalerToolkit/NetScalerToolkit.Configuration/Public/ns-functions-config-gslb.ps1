# Generated NetScalerToolkit Configuration bundle for category 'gslb'.

# region Invoke-NSAddGSLBService
function Invoke-NSAddGSLBService {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbservice resource.
    .DESCRIPTION
        Configuration for GSLB service resource.
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIP
        In the request that is forwarded to the GSLB service, insert a header that stores the client's IP address. Client IP header insertion is used in connection-proxy based site persistence. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name for the HTTP header that stores the client's IP address. Used with the Client IP option. If client IP header insertion is enabled on the service and a name is not specified for the header, the Citrix ADC uses the name specified by the cipHeader parameter in the set ns param command or, in the GUI, the Client IP Header parameter in the Configure HTTP Parameters dialog box. Minimum length = 1
    .PARAMETER CltTimeout
        Idle time, in seconds, after which a client connection is terminated. Applicable if connection proxy based site persistence is used. Minimum value = 0 Maximum value = 31536000
    .PARAMETER CNameEntry
        Canonical name of the GSLB service. Used in CNAME-based GSLB. Minimum length = 1
    .PARAMETER Comment
        Any comments that you might want to associate with the GSLB service.
    .PARAMETER CookieTimeout
        Timeout value, in minutes, for the cookie, when cookie based site persistence is enabled. Minimum value = 0 Maximum value = 1440
    .PARAMETER DownStateFlush
        Flush all active transactions associated with the GSLB service when its state transitions from UP to DOWN. Do not enable this option for services that must complete their transactions. Applicable if connection proxy based site persistence is used. Possible values = ENABLED, DISABLED
    .PARAMETER HashID
        Unique hash identifier for the GSLB service, used by hash based load balancing methods. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of the GSLB service. Default value: YES Possible values = YES, NO
    .PARAMETER Ip
        IP address for the GSLB service. Should represent a load balancing, content switching, or VPN virtual server on the Citrix ADC, or the IP address of another load balancing device. Minimum length = 1
    .PARAMETER MaxAAAUserS
        Maximum number of SSL VPN users that can be logged on concurrently to the VPN virtual server that is represented by this GSLB service. A GSLB service whose user count reaches the maximum is not considered when a GSLB decision is made, until the count drops below the maximum. Minimum value = 0 Maximum value = 65535
    .PARAMETER MaxBandwidth
        Integer specifying the maximum bandwidth allowed for the service. A GSLB service whose bandwidth reaches the maximum is not considered when a GSLB decision is made, until its bandwidth consumption drops below the maximum.
    .PARAMETER MaxClient
        The maximum number of open connections that the service can support at any given time. A GSLB service whose connection count reaches the maximum is not considered when a GSLB decision is made, until the connection count drops below the maximum. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MonThreshold
        Monitoring threshold value for the GSLB service. If the sum of the weights of the monitors that are bound to this GSLB service and are in the UP state is not equal to or greater than this threshold value, the service is marked as DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER Naptrdomainttl
        Modify the TTL of the internally created naptr domain. Default value: 3600 Minimum value = 1
    .PARAMETER Naptrorder
        An integer specifying the order in which the NAPTR records MUST be processed in order to accurately represent the ordered list of Rules. The ordering is from lowest to highest. Default value: 1 Minimum value = 1 Maximum value = 65535
    .PARAMETER Naptrpreference
        An integer specifying the preference of this NAPTR among NAPTR records having same order. lower the number, higher the preference. Default value: 1 Minimum value = 1 Maximum value = 65535
    .PARAMETER Naptrreplacement
        The replacement domain name for this NAPTR. Maximum length = 255
    .PARAMETER NaptrServiceS
        Service Parameters applicable to this delegation path. Maximum length = 255
    .PARAMETER Port
        Port on which the load balancing entity represented by this GSLB service listens. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Publicip
        The public IP address that a NAT device translates to the GSLB service's private IP address. Optional.
    .PARAMETER PublicPort
        The public port associated with the GSLB service's public IP address. The port is mapped to the service's private port number. Applicable to the local GSLB service. Optional.
    .PARAMETER ServerName
        Name of the server hosting the GSLB service. Minimum length = 1
    .PARAMETER ServiceName
        Name for the GSLB service. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the GSLB service is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsvc" or 'my gslbsvc'). Minimum length = 1
    .PARAMETER ServiceType
        Type of service to create. Default value: NSSVC_SERVICE_UNKNOWN Possible values = HTTP, FTP, TCP, UDP, SSL, SSL_BRIDGE, SSL_TCP, NNTP, ANY, SIP_UDP, SIP_TCP, SIP_SSL, RADIUS, RDP, RTSP, MYSQL, MSSQL, ORACLE
    .PARAMETER SiteName
        Name of the GSLB site to which the service belongs. Minimum length = 1
    .PARAMETER SitePersistence
        Use cookie-based site persistence. Applicable only to HTTP and SSL GSLB services. Possible values = ConnectionProxy, HTTPRedirect, NONE
    .PARAMETER Siteprefix
        The site's prefix string. When the service is bound to a GSLB virtual server, a GSLB site domain is generated internally for each bound service-domain pair by concatenating the site prefix of the service and the name of the domain. If the special string NONE is specified, the site-prefix string is unset. When implementing HTTP redirect site persistence, the Citrix ADC redirects GSLB requests to GSLB services by using their site domains.
    .PARAMETER State
        Enable or disable the service. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SvrTimeout
        Idle time, in seconds, after which a server connection is terminated. Applicable if connection proxy based site persistence is used. Minimum value = 0 Maximum value = 31536000
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
        Invoke-NSAddGSLBService -ServiceName 'example' -SiteName 'example' -ServiceType HTTP -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBService -ServiceName 'example' -SiteName 'example' -ServiceType HTTP -Port 80 -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [string] $CNameEntry,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [int] $CookieTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [int] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HealthMonitor,

        [Parameter()]
        [string] $Ip,

        [Parameter()]
        [int] $MaxAAAUserS,

        [Parameter()]
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter()]
        [int] $Naptrdomainttl,

        [Parameter()]
        [int] $Naptrorder,

        [Parameter()]
        [int] $Naptrpreference,

        [Parameter()]
        [string] $Naptrreplacement,

        [Parameter()]
        [string] $NaptrServiceS,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $Publicip,

        [Parameter()]
        [int] $PublicPort,

        [Parameter()]
        [string] $ServerName,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceName,

        [Parameter()]
        [ValidateSet('HTTP', 'FTP', 'TCP', 'UDP', 'SSL', 'SSL_BRIDGE', 'SSL_TCP', 'NNTP', 'ANY', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'RADIUS', 'RDP', 'RTSP', 'MYSQL', 'MSSQL', 'ORACLE')]
        [string] $ServiceType,

        [Parameter(Mandatory)]
        [string] $SiteName,

        [Parameter()]
        [ValidateSet('ConnectionProxy', 'HTTPRedirect', 'NONE')]
        [string] $SitePersistence,

        [Parameter()]
        [string] $Siteprefix,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $SvrTimeout,

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
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('CNameEntry')) { $properties['cnameentry'] = $CNameEntry }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('CookieTimeout')) { $properties['cookietimeout'] = $CookieTimeout }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('Ip')) { $properties['ip'] = $Ip }
    if ($PSBoundParameters.ContainsKey('MaxAAAUserS')) { $properties['maxaaausers'] = $MaxAAAUserS }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('Naptrdomainttl')) { $properties['naptrdomainttl'] = $Naptrdomainttl }
    if ($PSBoundParameters.ContainsKey('Naptrorder')) { $properties['naptrorder'] = $Naptrorder }
    if ($PSBoundParameters.ContainsKey('Naptrpreference')) { $properties['naptrpreference'] = $Naptrpreference }
    if ($PSBoundParameters.ContainsKey('Naptrreplacement')) { $properties['naptrreplacement'] = $Naptrreplacement }
    if ($PSBoundParameters.ContainsKey('NaptrServiceS')) { $properties['naptrservices'] = $NaptrServiceS }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Publicip')) { $properties['publicip'] = $Publicip }
    if ($PSBoundParameters.ContainsKey('PublicPort')) { $properties['publicport'] = $PublicPort }
    if ($PSBoundParameters.ContainsKey('ServerName')) { $properties['servername'] = $ServerName }
    if ($PSBoundParameters.ContainsKey('ServiceName')) { $properties['servicename'] = $ServiceName }
    if ($PSBoundParameters.ContainsKey('ServiceType')) { $properties['servicetype'] = $ServiceType }
    if ($PSBoundParameters.ContainsKey('SiteName')) { $properties['sitename'] = $SiteName }
    if ($PSBoundParameters.ContainsKey('SitePersistence')) { $properties['sitepersistence'] = $SitePersistence }
    if ($PSBoundParameters.ContainsKey('Siteprefix')) { $properties['siteprefix'] = $Siteprefix }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $properties['svrtimeout'] = $SvrTimeout }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceName", 'Create gslbservice')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservice -Payload @{ gslbservice = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBService -ServiceName $ServiceName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBService

# region Invoke-NSAddGSLBServiceDNSViewBinding
function Invoke-NSAddGSLBServiceDNSViewBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbservice_dnsview_binding resource.
    .DESCRIPTION
        Binding object showing the dnsview that can be bound to gslbservice.
    .PARAMETER ServiceName
        Name of the GSLB service. Minimum length = 1
    .PARAMETER Viewip
        IP address to be used for the given view.
    .PARAMETER ViewName
        Name of the DNS view of the service. A DNS view is used in global server load balancing (GSLB) to return a predetermined IP address to a specific group of clients, which are identified by using a DNS policy. Minimum length = 1
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
        Invoke-NSAddGSLBServiceDNSViewBinding -ServiceName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBServiceDNSViewBinding -ServiceName 'example' -WhatIf
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
        [string] $ServiceName,

        [Parameter()]
        [string] $Viewip,

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
    if ($PSBoundParameters.ContainsKey('ServiceName')) { $properties['servicename'] = $ServiceName }
    if ($PSBoundParameters.ContainsKey('Viewip')) { $properties['viewip'] = $Viewip }
    if ($PSBoundParameters.ContainsKey('ViewName')) { $properties['viewname'] = $ViewName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceName", 'Create gslbservice_dnsview_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservice_dnsview_binding -Payload @{ gslbservice_dnsview_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBServiceDNSViewBinding -ServiceName $ServiceName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBServiceDNSViewBinding

# region Invoke-NSAddGSLBServiceGroup
function Invoke-NSAddGSLBServiceGroup {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbservicegroup resource.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information for the specified GSLB service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER AutoDelayedTROFS
        Indicates graceful movement of the service to TROFS. System will wait for monitor response time out before moving to TROFS. Default value: NO Possible values = YES, NO
    .PARAMETER Autoscale
        Auto scale option for a GSLB servicegroup. Default value: DISABLED Possible values = DISABLED, DNS
    .PARAMETER CIP
        Insert the Client IP header in requests forwarded to the GSLB service. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name of the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If client IP insertion is enabled, and the client IP header is not specified, the value of Client IP Header parameter or the value set by the set ns config command is used as client's IP header name. Minimum length = 1
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Any information about the GSLB service group.
    .PARAMETER DownStateFlush
        Flush all active transactions associated with all the services in the GSLB service group whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER HealthMonitor
        Monitor the health of this GSLB service.Available settings function are as follows: YES - Send probes to check the health of the GSLB service. NO - Do not send probes to check the health of the GSLB service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated for all the services in the GSLB service group. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections for the GSLB service group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this GSLB service. Used to determine whether to mark a GSLB service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER ServiceType
        Protocol used to exchange data with the GSLB service. Possible values = HTTP, FTP, TCP, UDP, SSL, SSL_BRIDGE, SSL_TCP, NNTP, ANY, SIP_UDP, SIP_TCP, SIP_SSL, RADIUS, RDP, RTSP, MYSQL, MSSQL, ORACLE
    .PARAMETER SiteName
        Name of the GSLB site to which the service group belongs. Minimum length = 1
    .PARAMETER SitePersistence
        Use cookie-based site persistence. Applicable only to HTTP and SSL non-autoscale enabled GSLB servicegroups. Possible values = ConnectionProxy, HTTPRedirect, NONE
    .PARAMETER State
        Initial state of the GSLB service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
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
        Invoke-NSAddGSLBServiceGroup -ServiceGroupName 'example' -ServiceType HTTP -SiteName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBServiceGroup -ServiceGroupName 'example' -ServiceType HTTP -SiteName 'example' -WhatIf
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
        [ValidateSet('DISABLED', 'DNS')]
        [string] $Autoscale,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HealthMonitor,

        [Parameter()]
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter(Mandatory)]
        [ValidateSet('HTTP', 'FTP', 'TCP', 'UDP', 'SSL', 'SSL_BRIDGE', 'SSL_TCP', 'NNTP', 'ANY', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'RADIUS', 'RDP', 'RTSP', 'MYSQL', 'MSSQL', 'ORACLE')]
        [string] $ServiceType,

        [Parameter(Mandatory)]
        [string] $SiteName,

        [Parameter()]
        [ValidateSet('ConnectionProxy', 'HTTPRedirect', 'NONE')]
        [string] $SitePersistence,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $SvrTimeout,

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
    if ($PSBoundParameters.ContainsKey('Autoscale')) { $properties['autoscale'] = $Autoscale }
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('ServiceType')) { $properties['servicetype'] = $ServiceType }
    if ($PSBoundParameters.ContainsKey('SiteName')) { $properties['sitename'] = $SiteName }
    if ($PSBoundParameters.ContainsKey('SitePersistence')) { $properties['sitepersistence'] = $SitePersistence }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $properties['svrtimeout'] = $SvrTimeout }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Create gslbservicegroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservicegroup -Payload @{ gslbservicegroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBServiceGroup

# region Invoke-NSAddGSLBServiceGroupGSLBServiceGroupMemberBinding
function Invoke-NSAddGSLBServiceGroupGSLBServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbservicegroup_gslbservicegroupmember_binding resource.
    .DESCRIPTION
        Binding object showing the gslbservicegroupmember that can be bound to gslbservicegroup.
    .PARAMETER HashID
        The hash identifier for the service. This must be unique for each service. This parameter is used by hash based load balancing methods. Minimum value = 1
    .PARAMETER Ip
        IP Address.
    .PARAMETER Order
        Order number to be assigned to the gslb servicegroup member. Minimum value = 1 Maximum value = 8192
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Publicip
        The public IP address that a NAT device translates to the GSLB service's private IP address. Optional. Minimum length = 1
    .PARAMETER PublicPort
        The public port associated with the GSLB service's public IP address. The port is mapped to the service's private port number. Applicable to the local GSLB service. Optional.
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
    .PARAMETER Siteprefix
        The site's prefix string. When the GSLB service group is bound to a GSLB virtual server, a GSLB site domain is generated internally for each bound serviceitem-domain pair by concatenating the site prefix of the service item and the name of the domain. If the special string NONE is specified, the site-prefix string is unset. When implementing HTTP redirect site persistence, the Citrix ADC redirects GSLB requests to GSLB services by using their site domains.
    .PARAMETER State
        Initial state of the GSLB service group. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSAddGSLBServiceGroupGSLBServiceGroupMemberBinding -ServiceGroupName 'example' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBServiceGroupGSLBServiceGroupMemberBinding -ServiceGroupName 'example' -Port 80 -WhatIf
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
        [int] $HashID,

        [Parameter()]
        [string] $Ip,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $Publicip,

        [Parameter()]
        [int] $PublicPort,

        [Parameter()]
        [string] $ServerName,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter()]
        [string] $Siteprefix,

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
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('Ip')) { $properties['ip'] = $Ip }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Publicip')) { $properties['publicip'] = $Publicip }
    if ($PSBoundParameters.ContainsKey('PublicPort')) { $properties['publicport'] = $PublicPort }
    if ($PSBoundParameters.ContainsKey('ServerName')) { $properties['servername'] = $ServerName }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('Siteprefix')) { $properties['siteprefix'] = $Siteprefix }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Create gslbservicegroup_gslbservicegroupmember_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservicegroup_gslbservicegroupmember_binding -Payload @{ gslbservicegroup_gslbservicegroupmember_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBServiceGroupGSLBServiceGroupMemberBinding

# region Invoke-NSAddGSLBServiceGroupLBMonitorBinding
function Invoke-NSAddGSLBServiceGroupLBMonitorBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbservicegroup_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to gslbservicegroup.
    .PARAMETER HashID
        Unique numerical identifier used by hash based load balancing methods to identify a service. Minimum value = 1
    .PARAMETER MonItorName
        Monitor name.
    .PARAMETER MonState
        Monitor state. Possible values = ENABLED, DISABLED
    .PARAMETER Order
        Order number to be assigned to the gslb servicegroup member.
    .PARAMETER Passive
        Indicates if load monitor is passive. A passive load monitor does not remove service from LB decision when threshold is breached.
    .PARAMETER Port
        Port number of the GSLB service. Each service must have a unique port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Publicip
        The public IP address that a NAT device translates to the GSLB service's private IP address. Optional.
    .PARAMETER PublicPort
        The public port associated with the GSLB service's public IP address. The port is mapped to the service's private port number. Applicable to the local GSLB service. Optional.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
    .PARAMETER Siteprefix
        The site's prefix string. When the GSLB service group is bound to a GSLB virtual server, a GSLB site domain is generated internally for each bound serviceitem-domain pair by concatenating the site prefix of the service item and the name of the domain. If the special string NONE is specified, the site-prefix string is unset. When implementing HTTP redirect site persistence, the Citrix ADC redirects GSLB requests to GSLB services by using their site domains.
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
        Invoke-NSAddGSLBServiceGroupLBMonitorBinding -ServiceGroupName 'example' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBServiceGroupLBMonitorBinding -ServiceGroupName 'example' -Port 80 -WhatIf
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
        [int] $HashID,

        [Parameter()]
        [string] $MonItorName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $MonState,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [bool] $Passive,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $Publicip,

        [Parameter()]
        [int] $PublicPort,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter()]
        [string] $Siteprefix,

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
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('MonItorName')) { $properties['monitor_name'] = $MonItorName }
    if ($PSBoundParameters.ContainsKey('MonState')) { $properties['monstate'] = $MonState }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('Passive')) { $properties['passive'] = $Passive }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Publicip')) { $properties['publicip'] = $Publicip }
    if ($PSBoundParameters.ContainsKey('PublicPort')) { $properties['publicport'] = $PublicPort }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('Siteprefix')) { $properties['siteprefix'] = $Siteprefix }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Create gslbservicegroup_lbmonitor_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservicegroup_lbmonitor_binding -Payload @{ gslbservicegroup_lbmonitor_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBServiceGroupLBMonitorBinding -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBServiceGroupLBMonitorBinding

# region Invoke-NSAddGSLBServiceLBMonitorBinding
function Invoke-NSAddGSLBServiceLBMonitorBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbservice_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to gslbservice.
    .PARAMETER MonItorName
        Monitor name.
    .PARAMETER MonState
        State of the monitor bound to gslb service. Possible values = ENABLED, DISABLED
    .PARAMETER ServiceName
        Name of the GSLB service. Minimum length = 1
    .PARAMETER Weight
        Weight to assign to the monitor-service binding. A larger number specifies a greater weight. Contributes to the monitoring threshold, which determines the state of the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSAddGSLBServiceLBMonitorBinding -ServiceName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBServiceLBMonitorBinding -ServiceName 'example' -WhatIf
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
        [string] $ServiceName,

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
    if ($PSBoundParameters.ContainsKey('ServiceName')) { $properties['servicename'] = $ServiceName }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceName", 'Create gslbservice_lbmonitor_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservice_lbmonitor_binding -Payload @{ gslbservice_lbmonitor_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBServiceLBMonitorBinding -ServiceName $ServiceName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBServiceLBMonitorBinding

# region Invoke-NSAddGSLBSite
function Invoke-NSAddGSLBSite {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbsite resource.
    .DESCRIPTION
        Configuration for GSLB site resource.
    .PARAMETER BackupParentlist
        The list of backup gslb sites configured in preferred order. Need to be parent gsb sites. Default value: "None"
    .PARAMETER CLIP
        Cluster IP address. Specify this parameter to connect to the remote cluster site for GSLB auto-sync. Note: The cluster IP address is defined when creating the cluster.
    .PARAMETER Krpcnodesrcip
        Source IP address to be used to communicate with this GSLB site. Minimum length = 1
    .PARAMETER Metricexchange
        Exchange metrics with other sites. Metrics are exchanged by using Metric Exchange Protocol (MEP). The appliances in the GSLB setup exchange health information once every second. If you disable metrics exchange, you can use only static load balancing methods (such as round robin, static proximity, or the hash-based methods), and if you disable metrics exchange when a dynamic load balancing method (such as least connection) is in operation, the appliance falls back to round robin. Also, if you disable metrics exchange, you must use a monitor to determine the state of GSLB services. Otherwise, the service is marked as DOWN. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Naptrreplacementsuffix
        The naptr replacement suffix configured here will be used to construct the naptr replacement field in NAPTR record. Minimum length = 1
    .PARAMETER Nwmetricexchange
        Exchange, with other GSLB sites, network metrics such as round-trip time (RTT), learned from communications with various local DNS (LDNS) servers used by clients. RTT information is used in the dynamic RTT load balancing method, and is exchanged every 5 seconds. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Parentsite
        Parent site of the GSLB site, in a parent-child topology.
    .PARAMETER PublicCLIP
        IP address to be used to globally access the remote cluster when it is deployed behind a NAT. It can be same as the normal cluster IP address.
    .PARAMETER Publicip
        Public IP address for the local site. Required only if the appliance is deployed in a private address space and the site has a public IP address hosted on an external firewall or a NAT device. Minimum length = 1
    .PARAMETER Sessionexchange
        Exchange persistent session entries with other GSLB sites every five seconds. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Siteipaddress
        IP address for the GSLB site. The GSLB site uses this IP address to communicate with other GSLB sites. For a local site, use any IP address that is owned by the appliance (for example, a SNIP or MIP address, or the IP address of the ADNS service). Minimum length = 1
    .PARAMETER SiteName
        Name for the GSLB site. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsite" or 'my gslbsite'). Minimum length = 1
    .PARAMETER Sitepassword
        Password to be used for mep communication between gslb site nodes.
    .PARAMETER SiteType
        Type of site to create. If the type is not specified, the appliance automatically detects and sets the type on the basis of the IP address being assigned to the site. If the specified site IP address is owned by the appliance (for example, a MIP address or SNIP address), the site is a local site. Otherwise, it is a remote site. Default value: NONE Possible values = REMOTE, LOCAL
    .PARAMETER TriggerMonItor
        Specify the conditions under which the GSLB service must be monitored by a monitor, if one is bound. Available settings function as follows: * ALWAYS - Monitor the GSLB service at all times. * MEPDOWN - Monitor the GSLB service only when the exchange of metrics through the Metrics Exchange Protocol (MEP) is disabled. MEPDOWN_SVCDOWN - Monitor the service in either of the following situations: * The exchange of metrics through MEP is disabled. * The exchange of metrics through MEP is enabled but the status of the service, learned through metrics exchange, is DOWN. Default value: ALWAYS Possible values = ALWAYS, MEPDOWN, MEPDOWN_SVCDOWN
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
        Invoke-NSAddGSLBSite -SiteName 'example' -Siteipaddress 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBSite -SiteName 'example' -Siteipaddress 'example' -WhatIf
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
        [string[]] $BackupParentlist,

        [Parameter()]
        [string] $CLIP,

        [Parameter()]
        [string] $Krpcnodesrcip,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Metricexchange,

        [Parameter()]
        [string] $Naptrreplacementsuffix,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Nwmetricexchange,

        [Parameter()]
        [string] $Parentsite,

        [Parameter()]
        [string] $PublicCLIP,

        [Parameter()]
        [string] $Publicip,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Sessionexchange,

        [Parameter(Mandatory)]
        [string] $Siteipaddress,

        [Parameter(Mandatory, Position = 0)]
        [string] $SiteName,

        [Parameter()]
        [string] $Sitepassword,

        [Parameter()]
        [ValidateSet('REMOTE', 'LOCAL')]
        [string] $SiteType,

        [Parameter()]
        [ValidateSet('ALWAYS', 'MEPDOWN', 'MEPDOWN_SVCDOWN')]
        [string] $TriggerMonItor,

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
    if ($PSBoundParameters.ContainsKey('BackupParentlist')) { $properties['backupparentlist'] = $BackupParentlist }
    if ($PSBoundParameters.ContainsKey('CLIP')) { $properties['clip'] = $CLIP }
    if ($PSBoundParameters.ContainsKey('Krpcnodesrcip')) { $properties['krpcnodesrcip'] = $Krpcnodesrcip }
    if ($PSBoundParameters.ContainsKey('Metricexchange')) { $properties['metricexchange'] = $Metricexchange }
    if ($PSBoundParameters.ContainsKey('Naptrreplacementsuffix')) { $properties['naptrreplacementsuffix'] = $Naptrreplacementsuffix }
    if ($PSBoundParameters.ContainsKey('Nwmetricexchange')) { $properties['nwmetricexchange'] = $Nwmetricexchange }
    if ($PSBoundParameters.ContainsKey('Parentsite')) { $properties['parentsite'] = $Parentsite }
    if ($PSBoundParameters.ContainsKey('PublicCLIP')) { $properties['publicclip'] = $PublicCLIP }
    if ($PSBoundParameters.ContainsKey('Publicip')) { $properties['publicip'] = $Publicip }
    if ($PSBoundParameters.ContainsKey('Sessionexchange')) { $properties['sessionexchange'] = $Sessionexchange }
    if ($PSBoundParameters.ContainsKey('Siteipaddress')) { $properties['siteipaddress'] = $Siteipaddress }
    if ($PSBoundParameters.ContainsKey('SiteName')) { $properties['sitename'] = $SiteName }
    if ($PSBoundParameters.ContainsKey('Sitepassword')) { $properties['sitepassword'] = $Sitepassword }
    if ($PSBoundParameters.ContainsKey('SiteType')) { $properties['sitetype'] = $SiteType }
    if ($PSBoundParameters.ContainsKey('TriggerMonItor')) { $properties['triggermonitor'] = $TriggerMonItor }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$SiteName", 'Create gslbsite')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbsite -Payload @{ gslbsite = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBSite -SiteName $SiteName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBSite

# region Invoke-NSAddGSLBVServer
function Invoke-NSAddGSLBVServer {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbvserver resource.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER BackupLBMethod
        Backup load balancing method. Becomes operational if the primary load balancing method fails or cannot be used. Valid only if the primary method is based on either round-trip time (RTT) or static proximity. Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API
    .PARAMETER BackupSessionTimeout
        A non zero value enables the feature whose minimum value is 2 minutes. The feature can be disabled by setting the value to zero. The created session is in effect for a specific client per domain. Minimum value = 0 Maximum value = 1440
    .PARAMETER Comment
        Any comments that you might want to associate with the GSLB virtual server.
    .PARAMETER Considereffectivestate
        If the primary state of all bound GSLB services is DOWN, consider the effective states of all the GSLB services, obtained through the Metrics Exchange Protocol (MEP), when determining the state of the GSLB virtual server. To consider the effective state, set the parameter to STATE_ONLY. To disregard the effective state, set the parameter to NONE. The effective state of a GSLB service is the ability of the corresponding virtual server to serve traffic. The effective state of the load balancing virtual server, which is transferred to the GSLB service, is UP even if only one virtual server in the backup chain of virtual servers is in the UP state. Default value: NONE Possible values = NONE, STATE_ONLY
    .PARAMETER DisablePrimaryOnDown
        Continue to direct traffic to the backup chain even after the primary GSLB virtual server returns to the UP state. Used when spillover is configured for the virtual server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSRecordType
        DNS record type to associate with the GSLB virtual server's domain name. Default value: A Possible values = A, AAAA, CNAME, NAPTR
    .PARAMETER Dynamicweight
        Specify if the appliance should consider the service count, service weights, or ignore both when using weight-based load balancing methods. The state of the number of services bound to the virtual server help the appliance to select the service. Default value: DISABLED Possible values = SERVICECOUNT, SERVICEWEIGHT, DISABLED
    .PARAMETER Ecs
        If enabled, respond with EDNS Client Subnet (ECS) option in the response for a DNS query with ECS. The ECS address will be used for persistence and spillover persistence (if enabled) instead of the LDNS address. Persistence mask is ignored if ECS is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ecsaddrvalidation
        Validate if ECS address is a private or unroutable address and in such cases, use the LDNS IP. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Edr
        Send clients an empty DNS response when the GSLB virtual server is DOWN. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER IpType
        The IP type for this GSLB vserver. Default value: IPV4 Possible values = IPV4, IPV6
    .PARAMETER LBMethod
        Load balancing method for the GSLB virtual server. Default value: LEASTCONNECTION Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API
    .PARAMETER Mir
        Include multiple IP addresses in the DNS responses sent to clients. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
    .PARAMETER NetMask
        IPv4 network mask for use in the SOURCEIPHASH load balancing method. Minimum length = 1
    .PARAMETER OrderThreshold
        This option is used to to specify the threshold of minimum number of services to be UP in an order, for it to be considered in Lb decision. Default value: 0 Minimum value = 0 Maximum value = 100
    .PARAMETER PersistenceId
        The persistence ID for the GSLB virtual server. The ID is a positive integer that enables GSLB sites to identify the GSLB virtual server, and is required if source IP address based or spill over based persistence is enabled on the virtual server. Minimum value = 0 Maximum value = 65535
    .PARAMETER PersistenceType
        Use source IP address based persistence for the virtual server. After the load balancing method selects a service for the first packet, the IP address received in response to the DNS query is used for subsequent requests from the same client. Possible values = SOURCEIP, NONE
    .PARAMETER PersistMask
        The optional IPv4 network mask applied to IPv4 addresses to establish source IP address based persistence. Minimum length = 1
    .PARAMETER Rule
        Expression, or name of a named expression, against which traffic is evaluated. This field is applicable only if gslb method or gslb backup method are set to API. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks. Default value: "none"
    .PARAMETER ServiceType
        Protocol used by services bound to the virtual server. Possible values = HTTP, FTP, TCP, UDP, SSL, SSL_BRIDGE, SSL_TCP, NNTP, ANY, SIP_UDP, SIP_TCP, SIP_SSL, RADIUS, RDP, RTSP, MYSQL, MSSQL, ORACLE
    .PARAMETER SoBackupAction
        Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists. Possible values = DROP, ACCEPT, REDIRECT
    .PARAMETER SoMethod
        Type of threshold that, when exceeded, triggers spillover. Available settings function as follows: * CONNECTION - Spillover occurs when the number of client connections exceeds the threshold. * DYNAMICCONNECTION - Spillover occurs when the number of client connections at the GSLB virtual server exceeds the sum of the maximum client (Max Clients) settings for bound GSLB services. Do not specify a spillover threshold for this setting, because the threshold is implied by the Max Clients settings of the bound GSLB services. * BANDWIDTH - Spillover occurs when the bandwidth consumed by the GSLB virtual server's incoming and outgoing traffic exceeds the threshold. * HEALTH - Spillover occurs when the percentage of weights of the GSLB services that are UP drops below the threshold. For example, if services gslbSvc1, gslbSvc2, and gslbSvc3 are bound to a virtual server, with weights 1, 2, and 3, and the spillover threshold is 50%, spillover occurs if gslbSvc1 and gslbSvc3 or gslbSvc2 and gslbSvc3 transition to DOWN. * NONE - Spillover does not occur. Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE
    .PARAMETER SoPersistence
        If spillover occurs, maintain source IP address based persistence for both primary and backup GSLB virtual servers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SoPersistenceTimeout
        Timeout for spillover persistence, in minutes. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER SoThreshold
        Threshold at which spillover occurs. Specify an integer for the CONNECTION spillover method, a bandwidth value in kilobits per second for the BANDWIDTH method (do not enter the units), or a percentage for the HEALTH method (do not enter the percentage symbol). Minimum value = 1 Maximum value = 4294967287
    .PARAMETER State
        State of the GSLB virtual server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Timeout
        Idle time, in minutes, after which a persistence entry is cleared. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER ToggleOrder
        Configure this option to toggle order preference. Default value: ASCENDING Possible values = ASCENDING, DESCENDING
    .PARAMETER Tolerance
        Tolerance in milliseconds. Tolerance value is used in deciding which sites in a GSLB configuration must be considered for implementing the RTT load balancing method. The sites having the RTT value less than or equal to the sum of the lowest RTT and tolerance value are considered. NetScaler implements the round robin method of global server load balancing among these considered sites. The sites that have RTT value greater than this value are not considered. The logic is applied for each LDNS and based on the LDNS, the sites that are considered might change. For example, a site that is considered for requests coming from LDNS1 might not be considered for requests coming from LDNS2. Minimum value = 0 Maximum value = 100
    .PARAMETER V6NetmaskLen
        Number of bits to consider, in an IPv6 source IP address, for creating the hash that is required by the SOURCEIPHASH load balancing method. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER V6PersistMaskLen
        Number of bits to consider in an IPv6 source IP address when creating source IP address based persistence sessions. Default value: 128 Minimum value = 1 Maximum value = 128
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
        Invoke-NSAddGSLBVServer -Name 'example' -ServiceType HTTP -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBVServer -Name 'example' -ServiceType HTTP -WhatIf
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
        [ValidateSet('ROUNDROBIN', 'LEASTCONNECTION', 'LEASTRESPONSETIME', 'SOURCEIPHASH', 'LEASTBANDWIDTH', 'LEASTPACKETS', 'STATICPROXIMITY', 'RTT', 'CUSTOMLOAD', 'API')]
        [string] $BackupLBMethod,

        [Parameter()]
        [int] $BackupSessionTimeout,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('NONE', 'STATE_ONLY')]
        [string] $Considereffectivestate,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisablePrimaryOnDown,

        [Parameter()]
        [ValidateSet('A', 'AAAA', 'CNAME', 'NAPTR')]
        [string] $DNSRecordType,

        [Parameter()]
        [ValidateSet('SERVICECOUNT', 'SERVICEWEIGHT', 'DISABLED')]
        [string] $Dynamicweight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ecs,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ecsaddrvalidation,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Edr,

        [Parameter()]
        [ValidateSet('IPV4', 'IPV6')]
        [string] $IpType,

        [Parameter()]
        [ValidateSet('ROUNDROBIN', 'LEASTCONNECTION', 'LEASTRESPONSETIME', 'SOURCEIPHASH', 'LEASTBANDWIDTH', 'LEASTPACKETS', 'STATICPROXIMITY', 'RTT', 'CUSTOMLOAD', 'API')]
        [string] $LBMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Mir,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [int] $OrderThreshold,

        [Parameter()]
        [int] $PersistenceId,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'NONE')]
        [string] $PersistenceType,

        [Parameter()]
        [string] $PersistMask,

        [Parameter()]
        [string] $Rule,

        [Parameter(Mandatory)]
        [ValidateSet('HTTP', 'FTP', 'TCP', 'UDP', 'SSL', 'SSL_BRIDGE', 'SSL_TCP', 'NNTP', 'ANY', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'RADIUS', 'RDP', 'RTSP', 'MYSQL', 'MSSQL', 'ORACLE')]
        [string] $ServiceType,

        [Parameter()]
        [ValidateSet('DROP', 'ACCEPT', 'REDIRECT')]
        [string] $SoBackupAction,

        [Parameter()]
        [string] $SoMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SoPersistence,

        [Parameter()]
        [int] $SoPersistenceTimeout,

        [Parameter()]
        [int] $SoThreshold,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $Timeout,

        [Parameter()]
        [ValidateSet('ASCENDING', 'DESCENDING')]
        [string] $ToggleOrder,

        [Parameter()]
        [int] $Tolerance,

        [Parameter()]
        [int] $V6NetmaskLen,

        [Parameter()]
        [int] $V6PersistMaskLen,

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

    if ($PSBoundParameters.ContainsKey('SoMethod')) {
        Assert-NSParameterValue -ParameterName 'SoMethod' -Value $SoMethod -AllowedValuesByVersion @{ '13.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'NONE'); '14.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'LLMQUOTA', 'NONE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('BackupLBMethod')) { $properties['backuplbmethod'] = $BackupLBMethod }
    if ($PSBoundParameters.ContainsKey('BackupSessionTimeout')) { $properties['backupsessiontimeout'] = $BackupSessionTimeout }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Considereffectivestate')) { $properties['considereffectivestate'] = $Considereffectivestate }
    if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $properties['disableprimaryondown'] = $DisablePrimaryOnDown }
    if ($PSBoundParameters.ContainsKey('DNSRecordType')) { $properties['dnsrecordtype'] = $DNSRecordType }
    if ($PSBoundParameters.ContainsKey('Dynamicweight')) { $properties['dynamicweight'] = $Dynamicweight }
    if ($PSBoundParameters.ContainsKey('Ecs')) { $properties['ecs'] = $Ecs }
    if ($PSBoundParameters.ContainsKey('Ecsaddrvalidation')) { $properties['ecsaddrvalidation'] = $Ecsaddrvalidation }
    if ($PSBoundParameters.ContainsKey('Edr')) { $properties['edr'] = $Edr }
    if ($PSBoundParameters.ContainsKey('IpType')) { $properties['iptype'] = $IpType }
    if ($PSBoundParameters.ContainsKey('LBMethod')) { $properties['lbmethod'] = $LBMethod }
    if ($PSBoundParameters.ContainsKey('Mir')) { $properties['mir'] = $Mir }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }
    if ($PSBoundParameters.ContainsKey('OrderThreshold')) { $properties['orderthreshold'] = $OrderThreshold }
    if ($PSBoundParameters.ContainsKey('PersistenceId')) { $properties['persistenceid'] = $PersistenceId }
    if ($PSBoundParameters.ContainsKey('PersistenceType')) { $properties['persistencetype'] = $PersistenceType }
    if ($PSBoundParameters.ContainsKey('PersistMask')) { $properties['persistmask'] = $PersistMask }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('ServiceType')) { $properties['servicetype'] = $ServiceType }
    if ($PSBoundParameters.ContainsKey('SoBackupAction')) { $properties['sobackupaction'] = $SoBackupAction }
    if ($PSBoundParameters.ContainsKey('SoMethod')) { $properties['somethod'] = $SoMethod }
    if ($PSBoundParameters.ContainsKey('SoPersistence')) { $properties['sopersistence'] = $SoPersistence }
    if ($PSBoundParameters.ContainsKey('SoPersistenceTimeout')) { $properties['sopersistencetimeout'] = $SoPersistenceTimeout }
    if ($PSBoundParameters.ContainsKey('SoThreshold')) { $properties['sothreshold'] = $SoThreshold }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Timeout')) { $properties['timeout'] = $Timeout }
    if ($PSBoundParameters.ContainsKey('ToggleOrder')) { $properties['toggleorder'] = $ToggleOrder }
    if ($PSBoundParameters.ContainsKey('Tolerance')) { $properties['tolerance'] = $Tolerance }
    if ($PSBoundParameters.ContainsKey('V6NetmaskLen')) { $properties['v6netmasklen'] = $V6NetmaskLen }
    if ($PSBoundParameters.ContainsKey('V6PersistMaskLen')) { $properties['v6persistmasklen'] = $V6PersistMaskLen }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create gslbvserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver -Payload @{ gslbvserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBVServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBVServer

# region Invoke-NSAddGSLBVServerDomainBinding
function Invoke-NSAddGSLBVServerDomainBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbvserver_domain_binding resource.
    .DESCRIPTION
        Binding object showing the domain that can be bound to gslbvserver.
    .PARAMETER BackupIp
        The IP address of the backup service for the specified domain name. Used when all the services bound to the domain are down, or when the backup chain of virtual servers is down. Minimum length = 1
    .PARAMETER CookieDomain
        The cookie domain for the GSLB site. Used when inserting the GSLB site cookie in the HTTP response. Minimum length = 1
    .PARAMETER CookieTimeout
        Timeout, in minutes, for the GSLB site cookie. Minimum value = 0 Maximum value = 1440
    .PARAMETER DomainName
        Domain name for which to change the time to live (TTL) and/or backup service IP address. Minimum length = 1
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER Order
        Order number to be assigned to the service when it is bound to the lb vserver. Minimum value = 1 Maximum value = 8192
    .PARAMETER Sitedomainttl
        TTL, in seconds, for all internally created site domains (created when a site prefix is configured on a GSLB service) that are associated with this virtual server. Minimum value = 1
    .PARAMETER Ttl
        Time to live (TTL) for the domain. Minimum value = 1
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
        Invoke-NSAddGSLBVServerDomainBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBVServerDomainBinding -Name 'example' -WhatIf
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
        [string] $BackupIp,

        [Parameter()]
        [string] $CookieDomain,

        [Parameter()]
        [int] $CookieTimeout,

        [Parameter()]
        [string] $DomainName,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [int] $Sitedomainttl,

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
    if ($PSBoundParameters.ContainsKey('BackupIp')) { $properties['backupip'] = $BackupIp }
    if ($PSBoundParameters.ContainsKey('CookieDomain')) { $properties['cookie_domain'] = $CookieDomain }
    if ($PSBoundParameters.ContainsKey('CookieTimeout')) { $properties['cookietimeout'] = $CookieTimeout }
    if ($PSBoundParameters.ContainsKey('DomainName')) { $properties['domainname'] = $DomainName }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('Sitedomainttl')) { $properties['sitedomainttl'] = $Sitedomainttl }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create gslbvserver_domain_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver_domain_binding -Payload @{ gslbvserver_domain_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBVServerDomainBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBVServerDomainBinding

# region Invoke-NSAddGSLBVServerGSLBServiceBinding
function Invoke-NSAddGSLBVServerGSLBServiceBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbvserver_gslbservice_binding resource.
    .DESCRIPTION
        Binding object showing the gslbservice that can be bound to gslbvserver.
    .PARAMETER DomainName
        Domain name for which to change the time to live (TTL) and/or backup service IP address. Minimum length = 1
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER Order
        Order number to be assigned to the service when it is bound to the lb vserver. Minimum value = 1 Maximum value = 8192
    .PARAMETER ServiceName
        Name of the GSLB service for which to change the weight. Minimum length = 1
    .PARAMETER Weight
        Weight for the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSAddGSLBVServerGSLBServiceBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBVServerGSLBServiceBinding -Name 'example' -WhatIf
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
        [string] $DomainName,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [string] $ServiceName,

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
    if ($PSBoundParameters.ContainsKey('DomainName')) { $properties['domainname'] = $DomainName }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('ServiceName')) { $properties['servicename'] = $ServiceName }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create gslbvserver_gslbservice_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver_gslbservice_binding -Payload @{ gslbvserver_gslbservice_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBVServerGSLBServiceBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBVServerGSLBServiceBinding

# region Invoke-NSAddGSLBVServerGSLBServiceGroupBinding
function Invoke-NSAddGSLBVServerGSLBServiceGroupBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbvserver_gslbservicegroup_binding resource.
    .DESCRIPTION
        Binding object showing the gslbservicegroup that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER Order
        Order number to be assigned to the service when it is bound to the lb vserver. Minimum value = 1 Maximum value = 8192
    .PARAMETER ServiceGroupName
        The GSLB service group name bound to the selected GSLB virtual server.
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
        Invoke-NSAddGSLBVServerGSLBServiceGroupBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBVServerGSLBServiceGroupBinding -Name 'example' -WhatIf
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
        [string] $Name,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [string] $ServiceGroupName,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create gslbvserver_gslbservicegroup_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver_gslbservicegroup_binding -Payload @{ gslbvserver_gslbservicegroup_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBVServerGSLBServiceGroupBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBVServerGSLBServiceGroupBinding

# region Invoke-NSAddGSLBVServerLBPolicyBinding
function Invoke-NSAddGSLBVServerLBPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbvserver_lbpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the lbpolicy that can be bound to gslbvserver.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE. o If gotoPriorityExpression is not present or if it is equal to END then the policy bank evaluation ends here o Else if the gotoPriorityExpression is equal to NEXT then the next policy in the priority order is evaluated. o Else gotoPriorityExpression is evaluated. The result of gotoPriorityExpression (which has to be a number) is processed as follows: - An UNDEF event is triggered if . gotoPriorityExpression cannot be evaluated . gotoPriorityExpression evaluates to number which is smaller than the maximum priority in the policy bank but is not same as any policy's priority . gotoPriorityExpression evaluates to a priority that is smaller than the current policy's priority - If the gotoPriorityExpression evaluates to the priority of the current policy then the next policy in the priority order is evaluated. - If the gotoPriorityExpression evaluates to the priority of a policy further ahead in the list then that policy will be evaluated next. This field is applicable only to rewrite and responder policies.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER Order
        Order number to be assigned to the service when it is bound to the lb vserver. Minimum value = 1 Maximum value = 8192
    .PARAMETER PolicyName
        Name of the policy bound to the GSLB vserver.
    .PARAMETER Priority
        Priority. Minimum value = 1 Maximum value = 2147483647
    .PARAMETER Type
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, MQTT_JUMBO_REQ
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
        Invoke-NSAddGSLBVServerLBPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBVServerLBPolicyBinding -Name 'example' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'RESPONSE', 'MQTT_JUMBO_REQ')]
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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create gslbvserver_lbpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver_lbpolicy_binding -Payload @{ gslbvserver_lbpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBVServerLBPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBVServerLBPolicyBinding

# region Invoke-NSAddGSLBVServerSpilloverPolicyBinding
function Invoke-NSAddGSLBVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler gslbvserver_spilloverpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to gslbvserver.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE. o If gotoPriorityExpression is not present or if it is equal to END then the policy bank evaluation ends here o Else if the gotoPriorityExpression is equal to NEXT then the next policy in the priority order is evaluated. o Else gotoPriorityExpression is evaluated. The result of gotoPriorityExpression (which has to be a number) is processed as follows: - An UNDEF event is triggered if . gotoPriorityExpression cannot be evaluated . gotoPriorityExpression evaluates to number which is smaller than the maximum priority in the policy bank but is not same as any policy's priority . gotoPriorityExpression evaluates to a priority that is smaller than the current policy's priority - If the gotoPriorityExpression evaluates to the priority of the current policy then the next policy in the priority order is evaluated. - If the gotoPriorityExpression evaluates to the priority of a policy further ahead in the list then that policy will be evaluated next. This field is applicable only to rewrite and responder policies.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER Order
        Order number to be assigned to the service when it is bound to the lb vserver. Minimum value = 1 Maximum value = 8192
    .PARAMETER PolicyName
        Name of the policy bound to the GSLB vserver.
    .PARAMETER Priority
        Priority. Minimum value = 1 Maximum value = 2147483647
    .PARAMETER Type
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, MQTT_JUMBO_REQ
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
        Invoke-NSAddGSLBVServerSpilloverPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddGSLBVServerSpilloverPolicyBinding -Name 'example' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'RESPONSE', 'MQTT_JUMBO_REQ')]
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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create gslbvserver_spilloverpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver_spilloverpolicy_binding -Payload @{ gslbvserver_spilloverpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBVServerSpilloverPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddGSLBVServerSpilloverPolicyBinding

# region Invoke-NSDeleteGSLBService
function Invoke-NSDeleteGSLBService {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbservice resource.
    .DESCRIPTION
        Configuration for GSLB service resource.
    .PARAMETER ServiceName
        Name for the GSLB service. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the GSLB service is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsvc" or 'my gslbsvc'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBService -ServiceName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBService -ServiceName 'gslbservice_example' | Invoke-NSDeleteGSLBService -Confirm:$false
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
        [string] $ServiceName,

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

        if ($PSCmdlet.ShouldProcess("$ServiceName", 'Delete gslbservice')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbservice -Resource $ServiceName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBService

# region Invoke-NSDeleteGSLBServiceDNSViewBinding
function Invoke-NSDeleteGSLBServiceDNSViewBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbservice_dnsview_binding resource.
    .DESCRIPTION
        Binding object showing the dnsview that can be bound to gslbservice.
    .PARAMETER ServiceName
        Name of the GSLB service. Minimum length = 1
    .PARAMETER ViewName
        Name of the DNS view of the service. A DNS view is used in global server load balancing (GSLB) to return a predetermined IP address to a specific group of clients, which are identified by using a DNS policy. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBServiceDNSViewBinding -ServiceName 'example' -ViewName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBServiceDNSViewBinding -ServiceName 'gslbservice_dnsview_binding_example' | Invoke-NSDeleteGSLBServiceDNSViewBinding -Confirm:$false
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
        [string] $ServiceName,

        [Parameter()]
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('ViewName')) {
            $argumentParts += 'viewname:' + $ViewName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$ServiceName", 'Delete gslbservice_dnsview_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbservice_dnsview_binding -Resource $ServiceName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBServiceDNSViewBinding

# region Invoke-NSDeleteGSLBServiceGroup
function Invoke-NSDeleteGSLBServiceGroup {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbservicegroup resource.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBServiceGroup -ServiceGroupName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroup -ServiceGroupName 'gslbservicegroup_example' | Invoke-NSDeleteGSLBServiceGroup -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Delete gslbservicegroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbservicegroup -Resource $ServiceGroupName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBServiceGroup

# region Invoke-NSDeleteGSLBServiceGroupGSLBServiceGroupMemberBinding
function Invoke-NSDeleteGSLBServiceGroupGSLBServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbservicegroup_gslbservicegroupmember_binding resource.
    .DESCRIPTION
        Binding object showing the gslbservicegroupmember that can be bound to gslbservicegroup.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
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
        Invoke-NSDeleteGSLBServiceGroupGSLBServiceGroupMemberBinding -ServiceGroupName 'example' -Ip 'example' -ServerName 'example' -Port 80 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding -ServiceGroupName 'gslbservicegroup_gslbservicegroupmember_binding_example' | Invoke-NSDeleteGSLBServiceGroupGSLBServiceGroupMemberBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Delete gslbservicegroup_gslbservicegroupmember_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbservicegroup_gslbservicegroupmember_binding -Resource $ServiceGroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBServiceGroupGSLBServiceGroupMemberBinding

# region Invoke-NSDeleteGSLBServiceGroupLBMonitorBinding
function Invoke-NSDeleteGSLBServiceGroupLBMonitorBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbservicegroup_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to gslbservicegroup.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
    .PARAMETER Port
        Port number of the GSLB service. Each service must have a unique port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
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
        Invoke-NSDeleteGSLBServiceGroupLBMonitorBinding -ServiceGroupName 'example' -Port 80 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupLBMonitorBinding -ServiceGroupName 'gslbservicegroup_lbmonitor_binding_example' | Invoke-NSDeleteGSLBServiceGroupLBMonitorBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Delete gslbservicegroup_lbmonitor_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbservicegroup_lbmonitor_binding -Resource $ServiceGroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBServiceGroupLBMonitorBinding

# region Invoke-NSDeleteGSLBServiceLBMonitorBinding
function Invoke-NSDeleteGSLBServiceLBMonitorBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbservice_lbmonitor_binding resource.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to gslbservice.
    .PARAMETER ServiceName
        Name of the GSLB service. Minimum length = 1
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
        Invoke-NSDeleteGSLBServiceLBMonitorBinding -ServiceName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBServiceLBMonitorBinding -ServiceName 'gslbservice_lbmonitor_binding_example' | Invoke-NSDeleteGSLBServiceLBMonitorBinding -Confirm:$false
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
        [string] $ServiceName,

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

        if ($PSCmdlet.ShouldProcess("$ServiceName", 'Delete gslbservice_lbmonitor_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbservice_lbmonitor_binding -Resource $ServiceName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBServiceLBMonitorBinding

# region Invoke-NSDeleteGSLBSite
function Invoke-NSDeleteGSLBSite {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbsite resource.
    .DESCRIPTION
        Configuration for GSLB site resource.
    .PARAMETER SiteName
        Name for the GSLB site. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsite" or 'my gslbsite'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBSite -SiteName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBSite -SiteName 'gslbsite_example' | Invoke-NSDeleteGSLBSite -Confirm:$false
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
        [string] $SiteName,

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

        if ($PSCmdlet.ShouldProcess("$SiteName", 'Delete gslbsite')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbsite -Resource $SiteName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBSite

# region Invoke-NSDeleteGSLBVServer
function Invoke-NSDeleteGSLBVServer {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbvserver resource.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBVServer -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBVServer -Name 'gslbvserver_example' | Invoke-NSDeleteGSLBVServer -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete gslbvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbvserver -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBVServer

# region Invoke-NSDeleteGSLBVServerDomainBinding
function Invoke-NSDeleteGSLBVServerDomainBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbvserver_domain_binding resource.
    .DESCRIPTION
        Binding object showing the domain that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER DomainName
        Domain name for which to change the time to live (TTL) and/or backup service IP address. Minimum length = 1
    .PARAMETER BackupIpflag
        The IP address of the backup service for the specified domain name. Used when all the services bound to the domain are down, or when the backup chain of virtual servers is down.
    .PARAMETER CookieDomainflag
        The cookie domain for the GSLB site. Used when inserting the GSLB site cookie in the HTTP response.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBVServerDomainBinding -Name 'example' -DomainName 'example' -BackupIpflag $true -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBVServerDomainBinding -Name 'gslbvserver_domain_binding_example' | Invoke-NSDeleteGSLBVServerDomainBinding -Confirm:$false
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
        [string] $DomainName,

        [Parameter()]
        [bool] $BackupIpflag,

        [Parameter()]
        [bool] $CookieDomainflag,

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
        if ($PSBoundParameters.ContainsKey('DomainName')) {
            $argumentParts += 'domainname:' + $DomainName
        }
        if ($PSBoundParameters.ContainsKey('BackupIpflag')) {
            $argumentParts += 'backupipflag:' + $BackupIpflag
        }
        if ($PSBoundParameters.ContainsKey('CookieDomainflag')) {
            $argumentParts += 'cookie_domainflag:' + $CookieDomainflag
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete gslbvserver_domain_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbvserver_domain_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBVServerDomainBinding

# region Invoke-NSDeleteGSLBVServerGSLBServiceBinding
function Invoke-NSDeleteGSLBVServerGSLBServiceBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbvserver_gslbservice_binding resource.
    .DESCRIPTION
        Binding object showing the gslbservice that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER ServiceName
        Name of the GSLB service for which to change the weight. Minimum length = 1
    .PARAMETER DomainName
        Domain name for which to change the time to live (TTL) and/or backup service IP address. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBVServerGSLBServiceBinding -Name 'example' -ServiceName 'example' -DomainName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceBinding -Name 'gslbvserver_gslbservice_binding_example' | Invoke-NSDeleteGSLBVServerGSLBServiceBinding -Confirm:$false
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
        [string] $ServiceName,

        [Parameter()]
        [string] $DomainName,

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
        if ($PSBoundParameters.ContainsKey('ServiceName')) {
            $argumentParts += 'servicename:' + $ServiceName
        }
        if ($PSBoundParameters.ContainsKey('DomainName')) {
            $argumentParts += 'domainname:' + $DomainName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete gslbvserver_gslbservice_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbvserver_gslbservice_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBVServerGSLBServiceBinding

# region Invoke-NSDeleteGSLBVServerGSLBServiceGroupBinding
function Invoke-NSDeleteGSLBVServerGSLBServiceGroupBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbvserver_gslbservicegroup_binding resource.
    .DESCRIPTION
        Binding object showing the gslbservicegroup that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER ServiceGroupName
        The GSLB service group name bound to the selected GSLB virtual server.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBVServerGSLBServiceGroupBinding -Name 'example' -ServiceGroupName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceGroupBinding -Name 'gslbvserver_gslbservicegroup_binding_example' | Invoke-NSDeleteGSLBVServerGSLBServiceGroupBinding -Confirm:$false
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('ServiceGroupName')) {
            $argumentParts += 'servicegroupname:' + $ServiceGroupName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete gslbvserver_gslbservicegroup_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbvserver_gslbservicegroup_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBVServerGSLBServiceGroupBinding

# region Invoke-NSDeleteGSLBVServerLBPolicyBinding
function Invoke-NSDeleteGSLBVServerLBPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbvserver_lbpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the lbpolicy that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER PolicyName
        Name of the policy bound to the GSLB vserver.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBVServerLBPolicyBinding -Name 'example' -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBVServerLBPolicyBinding -Name 'gslbvserver_lbpolicy_binding_example' | Invoke-NSDeleteGSLBVServerLBPolicyBinding -Confirm:$false
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('PolicyName')) {
            $argumentParts += 'policyname:' + $PolicyName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete gslbvserver_lbpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbvserver_lbpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBVServerLBPolicyBinding

# region Invoke-NSDeleteGSLBVServerSpilloverPolicyBinding
function Invoke-NSDeleteGSLBVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler gslbvserver_spilloverpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
    .PARAMETER PolicyName
        Name of the policy bound to the GSLB vserver.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteGSLBVServerSpilloverPolicyBinding -Name 'example' -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetGSLBVServerSpilloverPolicyBinding -Name 'gslbvserver_spilloverpolicy_binding_example' | Invoke-NSDeleteGSLBVServerSpilloverPolicyBinding -Confirm:$false
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

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('PolicyName')) {
            $argumentParts += 'policyname:' + $PolicyName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete gslbvserver_spilloverpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type gslbvserver_spilloverpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteGSLBVServerSpilloverPolicyBinding

# region Invoke-NSDisableGSLBServiceGroup
function Invoke-NSDisableGSLBServiceGroup {
    <#
    .SYNOPSIS
        Disables a NetScaler gslbservicegroup resource.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Delay
        The time allowed (in seconds) for a graceful shutdown. During this period, new connections or requests will continue to be sent to this service for clients who already have a persistent session on the system. Connections or requests from fresh or new clients who do not yet have a persistence sessions on the system will not be sent to the service. Instead, they will be load balanced among other available services. After the delay time expires, no new requests or connections will be sent to the service.
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
        Invoke-NSDisableGSLBServiceGroup -ServiceGroupName 'gslbservicegroup_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Disable gslbservicegroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservicegroup -Action disable -Payload @{ gslbservicegroup = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetGSLBServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableGSLBServiceGroup

# region Invoke-NSDisableGSLBVServer
function Invoke-NSDisableGSLBVServer {
    <#
    .SYNOPSIS
        Disables a NetScaler gslbvserver resource.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
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
        Invoke-NSDisableGSLBVServer -Name 'gslbvserver_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Disable gslbvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver -Action disable -Payload @{ gslbvserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetGSLBVServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableGSLBVServer

# region Invoke-NSEnableGSLBServiceGroup
function Invoke-NSEnableGSLBServiceGroup {
    <#
    .SYNOPSIS
        Enables a NetScaler gslbservicegroup resource.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
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
        Invoke-NSEnableGSLBServiceGroup -ServiceGroupName 'gslbservicegroup_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Enable gslbservicegroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservicegroup -Action enable -Payload @{ gslbservicegroup = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetGSLBServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableGSLBServiceGroup

# region Invoke-NSEnableGSLBVServer
function Invoke-NSEnableGSLBVServer {
    <#
    .SYNOPSIS
        Enables a NetScaler gslbvserver resource.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
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
        Invoke-NSEnableGSLBVServer -Name 'gslbvserver_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Enable gslbvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver -Action enable -Payload @{ gslbvserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetGSLBVServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableGSLBVServer

# region Invoke-NSGetGSLBDomain
function Invoke-NSGetGSLBDomain {
    <#
    .SYNOPSIS
        Gets NetScaler gslbdomain configuration.
    .DESCRIPTION
        Configuration for GSLB domain resource.
    .PARAMETER Name
        Name of the Domain. Minimum length = 1
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
        Invoke-NSGetGSLBDomain
    .EXAMPLE
        Invoke-NSGetGSLBDomain -Name 'gslbdomain_example'
    .EXAMPLE
        Invoke-NSGetGSLBDomain -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbdomain'
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
# endregion Invoke-NSGetGSLBDomain

# region Invoke-NSGetGSLBDomainBinding
function Invoke-NSGetGSLBDomainBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbdomain_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to gslbdomain.
    .PARAMETER Name
        Name of the Domain. Minimum length = 1
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
        Invoke-NSGetGSLBDomainBinding
    .EXAMPLE
        Invoke-NSGetGSLBDomainBinding -Name 'gslbdomain_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBDomainBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbdomain_binding'
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
# endregion Invoke-NSGetGSLBDomainBinding

# region Invoke-NSGetGSLBDomainGSLBServiceBinding
function Invoke-NSGetGSLBDomainGSLBServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbdomain_gslbservice_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservice that can be bound to gslbdomain.
    .PARAMETER Name
        Name of the Domain. Minimum length = 1
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
        Invoke-NSGetGSLBDomainGSLBServiceBinding
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBServiceBinding -Name 'gslbdomain_gslbservice_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBServiceBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbdomain_gslbservice_binding'
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
# endregion Invoke-NSGetGSLBDomainGSLBServiceBinding

# region Invoke-NSGetGSLBDomainGSLBServiceGroupBinding
function Invoke-NSGetGSLBDomainGSLBServiceGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbdomain_gslbservicegroup_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroup that can be bound to gslbdomain.
    .PARAMETER Name
        Name of the Domain. Minimum length = 1
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
        Invoke-NSGetGSLBDomainGSLBServiceGroupBinding
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBServiceGroupBinding -Name 'gslbdomain_gslbservicegroup_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBServiceGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbdomain_gslbservicegroup_binding'
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
# endregion Invoke-NSGetGSLBDomainGSLBServiceGroupBinding

# region Invoke-NSGetGSLBDomainGSLBServiceGroupMemberBinding
function Invoke-NSGetGSLBDomainGSLBServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbdomain_gslbservicegroupmember_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroupmember that can be bound to gslbdomain.
    .PARAMETER Name
        Name of the Domain. Minimum length = 1
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
        Invoke-NSGetGSLBDomainGSLBServiceGroupMemberBinding
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBServiceGroupMemberBinding -Name 'gslbdomain_gslbservicegroupmember_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBServiceGroupMemberBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbdomain_gslbservicegroupmember_binding'
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
# endregion Invoke-NSGetGSLBDomainGSLBServiceGroupMemberBinding

# region Invoke-NSGetGSLBDomainGSLBVServerBinding
function Invoke-NSGetGSLBDomainGSLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbdomain_gslbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbvserver that can be bound to gslbdomain.
    .PARAMETER Name
        Name of the Domain. Minimum length = 1
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
        Invoke-NSGetGSLBDomainGSLBVServerBinding
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBVServerBinding -Name 'gslbdomain_gslbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBDomainGSLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbdomain_gslbvserver_binding'
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
# endregion Invoke-NSGetGSLBDomainGSLBVServerBinding

# region Invoke-NSGetGSLBDomainLBMonitorBinding
function Invoke-NSGetGSLBDomainLBMonitorBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbdomain_lbmonitor_binding configuration.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to gslbdomain.
    .PARAMETER Name
        Name of the Domain. Minimum length = 1
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
        Invoke-NSGetGSLBDomainLBMonitorBinding
    .EXAMPLE
        Invoke-NSGetGSLBDomainLBMonitorBinding -Name 'gslbdomain_lbmonitor_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBDomainLBMonitorBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbdomain_lbmonitor_binding'
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
# endregion Invoke-NSGetGSLBDomainLBMonitorBinding

# region Invoke-NSGetGSLBLDNSEntries
function Invoke-NSGetGSLBLDNSEntries {
    <#
    .SYNOPSIS
        Gets NetScaler gslbldnsentries configuration.
    .DESCRIPTION
        Configuration for LDNS entry resource.
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
        Invoke-NSGetGSLBLDNSEntries
    .EXAMPLE
        Invoke-NSGetGSLBLDNSEntries -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbldnsentries'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBLDNSEntries

# region Invoke-NSGetGSLBParameter
function Invoke-NSGetGSLBParameter {
    <#
    .SYNOPSIS
        Gets NetScaler gslbparameter configuration.
    .DESCRIPTION
        Configuration for GSLB parameter resource.
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
        Invoke-NSGetGSLBParameter
    .EXAMPLE
        Invoke-NSGetGSLBParameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBParameter

# region Invoke-NSGetGSLBRunningconfig
function Invoke-NSGetGSLBRunningconfig {
    <#
    .SYNOPSIS
        Gets NetScaler gslbrunningconfig configuration.
    .DESCRIPTION
        Configuration for running GSLB configuration resource.
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
        Invoke-NSGetGSLBRunningconfig
    .EXAMPLE
        Invoke-NSGetGSLBRunningconfig -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbrunningconfig'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBRunningconfig

# region Invoke-NSGetGSLBService
function Invoke-NSGetGSLBService {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservice configuration.
    .DESCRIPTION
        Configuration for GSLB service resource.
    .PARAMETER ServiceName
        Name for the GSLB service. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the GSLB service is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsvc" or 'my gslbsvc'). Minimum length = 1
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
        Invoke-NSGetGSLBService
    .EXAMPLE
        Invoke-NSGetGSLBService -ServiceName 'gslbservice_example'
    .EXAMPLE
        Invoke-NSGetGSLBService -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservice'
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
# endregion Invoke-NSGetGSLBService

# region Invoke-NSGetGSLBServiceBinding
function Invoke-NSGetGSLBServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservice_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to gslbservice.
    .PARAMETER ServiceName
        Name of the GSLB service. Minimum length = 1
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
        Invoke-NSGetGSLBServiceBinding
    .EXAMPLE
        Invoke-NSGetGSLBServiceBinding -ServiceName 'gslbservice_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservice_binding'
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
# endregion Invoke-NSGetGSLBServiceBinding

# region Invoke-NSGetGSLBServiceDNSViewBinding
function Invoke-NSGetGSLBServiceDNSViewBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservice_dnsview_binding configuration.
    .DESCRIPTION
        Binding object showing the dnsview that can be bound to gslbservice.
    .PARAMETER ServiceName
        Name of the GSLB service. Minimum length = 1
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
        Invoke-NSGetGSLBServiceDNSViewBinding
    .EXAMPLE
        Invoke-NSGetGSLBServiceDNSViewBinding -ServiceName 'gslbservice_dnsview_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceDNSViewBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservice_dnsview_binding'
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
# endregion Invoke-NSGetGSLBServiceDNSViewBinding

# region Invoke-NSGetGSLBServiceGroup
function Invoke-NSGetGSLBServiceGroup {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservicegroup configuration.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER IncludeMembers
        Display the members of the listed GSLB service groups in addition to their settings. Can be specified when no service group name is provided in the command. In that case, the details displayed for each service group are identical to the details displayed when a service group name is provided, except that bound monitors are not displayed.
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
        Invoke-NSGetGSLBServiceGroup
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroup -ServiceGroupName 'gslbservicegroup_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroup -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservicegroup'
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
# endregion Invoke-NSGetGSLBServiceGroup

# region Invoke-NSGetGSLBServiceGroupBinding
function Invoke-NSGetGSLBServiceGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservicegroup_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to gslbservicegroup.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
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
        Invoke-NSGetGSLBServiceGroupBinding
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupBinding -ServiceGroupName 'gslbservicegroup_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservicegroup_binding'
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
# endregion Invoke-NSGetGSLBServiceGroupBinding

# region Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding
function Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservicegroup_gslbservicegroupmember_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroupmember that can be bound to gslbservicegroup.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
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
        Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding -ServiceGroupName 'gslbservicegroup_gslbservicegroupmember_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservicegroup_gslbservicegroupmember_binding'
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
# endregion Invoke-NSGetGSLBServiceGroupGSLBServiceGroupMemberBinding

# region Invoke-NSGetGSLBServiceGroupLBMonitorBinding
function Invoke-NSGetGSLBServiceGroupLBMonitorBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservicegroup_lbmonitor_binding configuration.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to gslbservicegroup.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
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
        Invoke-NSGetGSLBServiceGroupLBMonitorBinding
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupLBMonitorBinding -ServiceGroupName 'gslbservicegroup_lbmonitor_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupLBMonitorBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservicegroup_lbmonitor_binding'
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
# endregion Invoke-NSGetGSLBServiceGroupLBMonitorBinding

# region Invoke-NSGetGSLBServiceGroupServiceGroupEntityMonBindingsBinding
function Invoke-NSGetGSLBServiceGroupServiceGroupEntityMonBindingsBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservicegroup_servicegroupentitymonbindings_binding configuration.
    .DESCRIPTION
        Binding object showing the servicegroupentitymonbindings that can be bound to gslbservicegroup.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Minimum length = 1
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
        Invoke-NSGetGSLBServiceGroupServiceGroupEntityMonBindingsBinding
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupServiceGroupEntityMonBindingsBinding -ServiceGroupName 'gslbservicegroup_servicegroupentitymonbindings_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceGroupServiceGroupEntityMonBindingsBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservicegroup_servicegroupentitymonbindings_binding'
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
# endregion Invoke-NSGetGSLBServiceGroupServiceGroupEntityMonBindingsBinding

# region Invoke-NSGetGSLBServiceLBMonitorBinding
function Invoke-NSGetGSLBServiceLBMonitorBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbservice_lbmonitor_binding configuration.
    .DESCRIPTION
        Binding object showing the lbmonitor that can be bound to gslbservice.
    .PARAMETER ServiceName
        Name of the GSLB service. Minimum length = 1
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
        Invoke-NSGetGSLBServiceLBMonitorBinding
    .EXAMPLE
        Invoke-NSGetGSLBServiceLBMonitorBinding -ServiceName 'gslbservice_lbmonitor_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBServiceLBMonitorBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbservice_lbmonitor_binding'
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
# endregion Invoke-NSGetGSLBServiceLBMonitorBinding

# region Invoke-NSGetGSLBSite
function Invoke-NSGetGSLBSite {
    <#
    .SYNOPSIS
        Gets NetScaler gslbsite configuration.
    .DESCRIPTION
        Configuration for GSLB site resource.
    .PARAMETER SiteName
        Name for the GSLB site. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsite" or 'my gslbsite'). Minimum length = 1
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
        Invoke-NSGetGSLBSite
    .EXAMPLE
        Invoke-NSGetGSLBSite -SiteName 'gslbsite_example'
    .EXAMPLE
        Invoke-NSGetGSLBSite -Filter @{ servicetype = 'HTTP' }
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
        [string] $SiteName,

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
            Type = 'gslbsite'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $SiteName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBSite

# region Invoke-NSGetGSLBSiteBinding
function Invoke-NSGetGSLBSiteBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbsite_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to gslbsite.
    .PARAMETER SiteName
        Name of the GSLB site. If you specify a site name, details of all the site's constituent services are also displayed. Minimum length = 1
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
        Invoke-NSGetGSLBSiteBinding
    .EXAMPLE
        Invoke-NSGetGSLBSiteBinding -SiteName 'gslbsite_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBSiteBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $SiteName,

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
            Type = 'gslbsite_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $SiteName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBSiteBinding

# region Invoke-NSGetGSLBSiteGSLBServiceBinding
function Invoke-NSGetGSLBSiteGSLBServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbsite_gslbservice_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservice that can be bound to gslbsite.
    .PARAMETER SiteName
        Name of the GSLB site. If you specify a site name, details of all the site's constituent services are also displayed. Minimum length = 1
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
        Invoke-NSGetGSLBSiteGSLBServiceBinding
    .EXAMPLE
        Invoke-NSGetGSLBSiteGSLBServiceBinding -SiteName 'gslbsite_gslbservice_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBSiteGSLBServiceBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $SiteName,

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
            Type = 'gslbsite_gslbservice_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $SiteName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBSiteGSLBServiceBinding

# region Invoke-NSGetGSLBSiteGSLBServiceGroupBinding
function Invoke-NSGetGSLBSiteGSLBServiceGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbsite_gslbservicegroup_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroup that can be bound to gslbsite.
    .PARAMETER SiteName
        Name of the GSLB site. If you specify a site name, details of all the site's constituent services are also displayed. Minimum length = 1
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
        Invoke-NSGetGSLBSiteGSLBServiceGroupBinding
    .EXAMPLE
        Invoke-NSGetGSLBSiteGSLBServiceGroupBinding -SiteName 'gslbsite_gslbservicegroup_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBSiteGSLBServiceGroupBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $SiteName,

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
            Type = 'gslbsite_gslbservicegroup_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $SiteName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBSiteGSLBServiceGroupBinding

# region Invoke-NSGetGSLBSiteGSLBServiceGroupMemberBinding
function Invoke-NSGetGSLBSiteGSLBServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbsite_gslbservicegroupmember_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroupmember that can be bound to gslbsite.
    .PARAMETER SiteName
        Name of the GSLB site. If you specify a site name, details of all the site's constituent services are also displayed. Minimum length = 1
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
        Invoke-NSGetGSLBSiteGSLBServiceGroupMemberBinding
    .EXAMPLE
        Invoke-NSGetGSLBSiteGSLBServiceGroupMemberBinding -SiteName 'gslbsite_gslbservicegroupmember_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBSiteGSLBServiceGroupMemberBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $SiteName,

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
            Type = 'gslbsite_gslbservicegroupmember_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $SiteName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBSiteGSLBServiceGroupMemberBinding

# region Invoke-NSGetGSLBSyncstatus
function Invoke-NSGetGSLBSyncstatus {
    <#
    .SYNOPSIS
        Gets NetScaler gslbsyncstatus configuration.
    .DESCRIPTION
        Configuration for sync status resource.
    .PARAMETER Summary
        sync status summary to be displayed in one line (Success/Failure), in case of Failure stating reason for failure.
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
        Invoke-NSGetGSLBSyncstatus
    .EXAMPLE
        Invoke-NSGetGSLBSyncstatus -Filter @{ servicetype = 'HTTP' }
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
        [switch] $Summary,

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
        if ($PSBoundParameters.ContainsKey('Summary')) {
            $argumentValue = $Summary
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'summary:' + $argumentValue
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
            Type = 'gslbsyncstatus'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetGSLBSyncstatus

# region Invoke-NSGetGSLBVServer
function Invoke-NSGetGSLBVServer {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver configuration.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
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
        Invoke-NSGetGSLBVServer
    .EXAMPLE
        Invoke-NSGetGSLBVServer -Name 'gslbvserver_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServer -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver'
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
# endregion Invoke-NSGetGSLBVServer

# region Invoke-NSGetGSLBVServerBinding
function Invoke-NSGetGSLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to gslbvserver.
    .PARAMETER Name
        Name of the GSLB virtual server. Minimum length = 1
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
        Invoke-NSGetGSLBVServerBinding
    .EXAMPLE
        Invoke-NSGetGSLBVServerBinding -Name 'gslbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver_binding'
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
# endregion Invoke-NSGetGSLBVServerBinding

# region Invoke-NSGetGSLBVServerDomainBinding
function Invoke-NSGetGSLBVServerDomainBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver_domain_binding configuration.
    .DESCRIPTION
        Binding object showing the domain that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
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
        Invoke-NSGetGSLBVServerDomainBinding
    .EXAMPLE
        Invoke-NSGetGSLBVServerDomainBinding -Name 'gslbvserver_domain_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServerDomainBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver_domain_binding'
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
# endregion Invoke-NSGetGSLBVServerDomainBinding

# region Invoke-NSGetGSLBVServerGSLBServiceBinding
function Invoke-NSGetGSLBVServerGSLBServiceBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver_gslbservice_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservice that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
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
        Invoke-NSGetGSLBVServerGSLBServiceBinding
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceBinding -Name 'gslbvserver_gslbservice_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver_gslbservice_binding'
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
# endregion Invoke-NSGetGSLBVServerGSLBServiceBinding

# region Invoke-NSGetGSLBVServerGSLBServiceGroupBinding
function Invoke-NSGetGSLBVServerGSLBServiceGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver_gslbservicegroup_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroup that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
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
        Invoke-NSGetGSLBVServerGSLBServiceGroupBinding
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceGroupBinding -Name 'gslbvserver_gslbservicegroup_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver_gslbservicegroup_binding'
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
# endregion Invoke-NSGetGSLBVServerGSLBServiceGroupBinding

# region Invoke-NSGetGSLBVServerGSLBServiceGroupMemberBinding
function Invoke-NSGetGSLBVServerGSLBServiceGroupMemberBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver_gslbservicegroupmember_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbservicegroupmember that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
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
        Invoke-NSGetGSLBVServerGSLBServiceGroupMemberBinding
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceGroupMemberBinding -Name 'gslbvserver_gslbservicegroupmember_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServerGSLBServiceGroupMemberBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver_gslbservicegroupmember_binding'
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
# endregion Invoke-NSGetGSLBVServerGSLBServiceGroupMemberBinding

# region Invoke-NSGetGSLBVServerLBPolicyBinding
function Invoke-NSGetGSLBVServerLBPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver_lbpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the lbpolicy that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
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
        Invoke-NSGetGSLBVServerLBPolicyBinding
    .EXAMPLE
        Invoke-NSGetGSLBVServerLBPolicyBinding -Name 'gslbvserver_lbpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServerLBPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver_lbpolicy_binding'
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
# endregion Invoke-NSGetGSLBVServerLBPolicyBinding

# region Invoke-NSGetGSLBVServerSpilloverPolicyBinding
function Invoke-NSGetGSLBVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler gslbvserver_spilloverpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to gslbvserver.
    .PARAMETER Name
        Name of the virtual server on which to perform the binding operation. Minimum length = 1
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
        Invoke-NSGetGSLBVServerSpilloverPolicyBinding
    .EXAMPLE
        Invoke-NSGetGSLBVServerSpilloverPolicyBinding -Name 'gslbvserver_spilloverpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetGSLBVServerSpilloverPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'gslbvserver_spilloverpolicy_binding'
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
# endregion Invoke-NSGetGSLBVServerSpilloverPolicyBinding

# region Invoke-NSRenameGSLBService
function Invoke-NSRenameGSLBService {
    <#
    .SYNOPSIS
        Renames a NetScaler gslbservice resource.
    .DESCRIPTION
        Configuration for GSLB service resource.
    .PARAMETER ServiceName
        Name for the GSLB service. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the GSLB service is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsvc" or 'my gslbsvc'). Minimum length = 1
    .PARAMETER NewName
        New name for the GSLB service. Minimum length = 1
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
        Invoke-NSRenameGSLBService -ServiceName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameGSLBService -ServiceName 'example' -NewName 'example' -WhatIf
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
        [string] $ServiceName,

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
        if ($PSBoundParameters.ContainsKey('ServiceName')) { $body['servicename'] = $ServiceName }
        if ($PSBoundParameters.ContainsKey('NewName')) { $body['newname'] = $NewName }

        if ($PSCmdlet.ShouldProcess("$ServiceName", 'Rename gslbservice')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservice -Action rename -Payload @{ gslbservice = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBService -ServiceName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameGSLBService

# region Invoke-NSRenameGSLBServiceGroup
function Invoke-NSRenameGSLBServiceGroup {
    <#
    .SYNOPSIS
        Renames a NetScaler gslbservicegroup resource.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER NewName
        New name for the GSLB service group. Minimum length = 1
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
        Invoke-NSRenameGSLBServiceGroup -ServiceGroupName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameGSLBServiceGroup -ServiceGroupName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Rename gslbservicegroup')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservicegroup -Action rename -Payload @{ gslbservicegroup = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBServiceGroup -ServiceGroupName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameGSLBServiceGroup

# region Invoke-NSRenameGSLBSite
function Invoke-NSRenameGSLBSite {
    <#
    .SYNOPSIS
        Renames a NetScaler gslbsite resource.
    .DESCRIPTION
        Configuration for GSLB site resource.
    .PARAMETER SiteName
        Name for the GSLB site. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsite" or 'my gslbsite'). Minimum length = 1
    .PARAMETER NewName
        New name for the GSLB site. Minimum length = 1 Maximum length = 31
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
        Invoke-NSRenameGSLBSite -SiteName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameGSLBSite -SiteName 'example' -NewName 'example' -WhatIf
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
        [string] $SiteName,

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
        if ($PSBoundParameters.ContainsKey('SiteName')) { $body['sitename'] = $SiteName }
        if ($PSBoundParameters.ContainsKey('NewName')) { $body['newname'] = $NewName }

        if ($PSCmdlet.ShouldProcess("$SiteName", 'Rename gslbsite')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbsite -Action rename -Payload @{ gslbsite = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBSite -SiteName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameGSLBSite

# region Invoke-NSRenameGSLBVServer
function Invoke-NSRenameGSLBVServer {
    <#
    .SYNOPSIS
        Renames a NetScaler gslbvserver resource.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
    .PARAMETER NewName
        New name for the GSLB virtual server. Minimum length = 1
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
        Invoke-NSRenameGSLBVServer -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameGSLBVServer -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename gslbvserver')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver -Action rename -Payload @{ gslbvserver = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBVServer -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameGSLBVServer

# region Invoke-NSUnsetGSLBParameter
function Invoke-NSUnsetGSLBParameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler gslbparameter resource properties.
    .DESCRIPTION
        Configuration for GSLB parameter resource.
    .PARAMETER Automaticconfigsync
        GSLB configuration will be synced automatically to remote gslb sites if enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DroplDNSReq
        Drop LDNS requests if round-trip time (RTT) information is not available. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GSLBConfigsyncMonItor
        If enabled, remote gslb site's rsync port will be monitored and site is considered for configuration sync only when the monitor is successful. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GSLBSvcstatedelaytime
        Amount of delay in updating the state of GSLB service to DOWN when MEP goes down. This parameter is applicable only if monitors are not bound to GSLB services. Default value: 0 Minimum value = 0 Maximum value = 3600
    .PARAMETER GSLBSyncInterval
        Time duartion (in seconds) for which the gslb sync process will wait before checking for config changes. Default value: 10 Minimum value = 1
    .PARAMETER GSLBSynclocFileS
        If disabled, Location files will not be synced to the remote sites as part of manual sync and automatic sync. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER GSLBSyncMode
        Mode in which configuration will be synced from master site to remote sites. Default value: IncrementalSync Possible values = IncrementalSync, FullSync
    .PARAMETER GSLBSyncsaveconfigcommand
        If enabled, 'save ns config' command will be treated as other GSLB commands and synced to GSLB nodes when auto gslb sync option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER LDNSEntryTimeout
        Time, in seconds, after which an inactive LDNS entry is removed. Default value: 180 Minimum value = 30 Maximum value = 65534
    .PARAMETER LDNSMask
        The IPv4 network mask with which to create LDNS entries. Minimum length = 1
    .PARAMETER LDNSProbeOrder
        Order in which monitors should be initiated to calculate RTT. Possible values = PING, DNS, TCP
    .PARAMETER MepkeepaliveTimeout
        Time duartion (in seconds) during which if no new packets received by Local gslb site from Remote gslb site then mark the MEP connection DOWN. Default value: 10 Minimum value = 1
    .PARAMETER Rtttolerance
        Tolerance, in milliseconds, for newly learned round-trip time (RTT) values. If the difference between the old RTT value and the newly computed RTT value is less than or equal to the specified tolerance value, the LDNS entry in the network metric table is not updated with the new RTT value. Prevents the exchange of metrics when variations in RTT values are negligible. Default value: 5 Minimum value = 1 Maximum value = 100
    .PARAMETER Sourceipwhitelisting
        If enabled, local gslb site private IP would be used as the source IP while initiating MEP/GSLB sync connection if srcIP is not configured for GSLB site. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SvcstateLearningTime
        Time (in seconds) within which local or child site services remain in learning phase. GSLB site will enter the learning phase after reboot, HA failover, Cluster GSLB owner node changes or MEP being enabled on local node. Backup parent (if configured) will selectively move the adopted children's GSLB services to learning phase when primary parent goes down. While a service is in learning period, remote site will not honour the state and stats got through MEP for that service. State can be learnt from health monitor if bound explicitly. Default value: 0 Minimum value = 0 Maximum value = 3600
    .PARAMETER UndefAction
        Action to perform when policy evaluation creates an UNDEF condition. Available settings function as follows: * NOLBACTION - Does not consider LB action in making LB decision. * RESET - Reset the request and notify the user, so that the user can resend the request. * DROP - Drop the request without sending a response to the user. Default value: "NOLBACTION"
    .PARAMETER Usekrpcchannelforsync
        This option is to use Krpc channel for GSLB sync. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER V6lDNSMaskLen
        Mask for creating LDNS entries for IPv6 source addresses. The mask is defined as the number of leading bits to consider, in the source IP address, when creating an LDNS entry. Default value: 128 Minimum value = 1 Maximum value = 128
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
        Invoke-NSUnsetGSLBParameter -Automaticconfigsync ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetGSLBParameter -Automaticconfigsync ENABLED -WhatIf
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
        [switch] $Automaticconfigsync,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DroplDNSReq,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $GSLBConfigsyncMonItor,

        [Parameter()]
        [switch] $GSLBSvcstatedelaytime,

        [Parameter()]
        [switch] $GSLBSyncInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $GSLBSynclocFileS,

        [Parameter()]
        [ValidateSet('IncrementalSync', 'FullSync')]
        [switch] $GSLBSyncMode,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $GSLBSyncsaveconfigcommand,

        [Parameter()]
        [switch] $LDNSEntryTimeout,

        [Parameter()]
        [switch] $LDNSMask,

        [Parameter()]
        [ValidateSet('PING', 'DNS', 'TCP')]
        [switch] $LDNSProbeOrder,

        [Parameter()]
        [switch] $MepkeepaliveTimeout,

        [Parameter()]
        [switch] $Rtttolerance,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Sourceipwhitelisting,

        [Parameter()]
        [switch] $SvcstateLearningTime,

        [Parameter()]
        [switch] $UndefAction,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Usekrpcchannelforsync,

        [Parameter()]
        [switch] $V6lDNSMaskLen,

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
        if ($PSBoundParameters.ContainsKey('Automaticconfigsync')) { $body['automaticconfigsync'] = $true }
        if ($PSBoundParameters.ContainsKey('DroplDNSReq')) { $body['dropldnsreq'] = $true }
        if ($PSBoundParameters.ContainsKey('GSLBConfigsyncMonItor')) { $body['gslbconfigsyncmonitor'] = $true }
        if ($PSBoundParameters.ContainsKey('GSLBSvcstatedelaytime')) { $body['gslbsvcstatedelaytime'] = $true }
        if ($PSBoundParameters.ContainsKey('GSLBSyncInterval')) { $body['gslbsyncinterval'] = $true }
        if ($PSBoundParameters.ContainsKey('GSLBSynclocFileS')) { $body['gslbsynclocfiles'] = $true }
        if ($PSBoundParameters.ContainsKey('GSLBSyncMode')) { $body['gslbsyncmode'] = $true }
        if ($PSBoundParameters.ContainsKey('GSLBSyncsaveconfigcommand')) { $body['gslbsyncsaveconfigcommand'] = $true }
        if ($PSBoundParameters.ContainsKey('LDNSEntryTimeout')) { $body['ldnsentrytimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('LDNSMask')) { $body['ldnsmask'] = $true }
        if ($PSBoundParameters.ContainsKey('LDNSProbeOrder')) { $body['ldnsprobeorder'] = $true }
        if ($PSBoundParameters.ContainsKey('MepkeepaliveTimeout')) { $body['mepkeepalivetimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Rtttolerance')) { $body['rtttolerance'] = $true }
        if ($PSBoundParameters.ContainsKey('Sourceipwhitelisting')) { $body['sourceipwhitelisting'] = $true }
        if ($PSBoundParameters.ContainsKey('SvcstateLearningTime')) { $body['svcstatelearningtime'] = $true }
        if ($PSBoundParameters.ContainsKey('UndefAction')) { $body['undefaction'] = $true }
        if ($PSBoundParameters.ContainsKey('Usekrpcchannelforsync')) { $body['usekrpcchannelforsync'] = $true }
        if ($PSBoundParameters.ContainsKey('V6lDNSMaskLen')) { $body['v6ldnsmasklen'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('gslbparameter', 'Clear gslbparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbparameter -Action unset -Payload @{ gslbparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetGSLBParameter

# region Invoke-NSUnsetGSLBService
function Invoke-NSUnsetGSLBService {
    <#
    .SYNOPSIS
        Clears one or more NetScaler gslbservice resource properties.
    .DESCRIPTION
        Configuration for GSLB service resource.
    .PARAMETER ServiceName
        Name for the GSLB service. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the GSLB service is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsvc" or 'my gslbsvc'). Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIP
        In the request that is forwarded to the GSLB service, insert a header that stores the client's IP address. Client IP header insertion is used in connection-proxy based site persistence. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name for the HTTP header that stores the client's IP address. Used with the Client IP option. If client IP header insertion is enabled on the service and a name is not specified for the header, the Citrix ADC uses the name specified by the cipHeader parameter in the set ns param command or, in the GUI, the Client IP Header parameter in the Configure HTTP Parameters dialog box. Minimum length = 1
    .PARAMETER Comment
        Any comments that you might want to associate with the GSLB service.
    .PARAMETER DownStateFlush
        Flush all active transactions associated with the GSLB service when its state transitions from UP to DOWN. Do not enable this option for services that must complete their transactions. Applicable if connection proxy based site persistence is used. Possible values = ENABLED, DISABLED
    .PARAMETER HashID
        Unique hash identifier for the GSLB service, used by hash based load balancing methods. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of the GSLB service. Default value: YES Possible values = YES, NO
    .PARAMETER MaxAAAUserS
        Maximum number of SSL VPN users that can be logged on concurrently to the VPN virtual server that is represented by this GSLB service. A GSLB service whose user count reaches the maximum is not considered when a GSLB decision is made, until the count drops below the maximum. Minimum value = 0 Maximum value = 65535
    .PARAMETER MaxBandwidth
        Integer specifying the maximum bandwidth allowed for the service. A GSLB service whose bandwidth reaches the maximum is not considered when a GSLB decision is made, until its bandwidth consumption drops below the maximum.
    .PARAMETER MaxClient
        The maximum number of open connections that the service can support at any given time. A GSLB service whose connection count reaches the maximum is not considered when a GSLB decision is made, until the connection count drops below the maximum. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MonThreshold
        Monitoring threshold value for the GSLB service. If the sum of the weights of the monitors that are bound to this GSLB service and are in the UP state is not equal to or greater than this threshold value, the service is marked as DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER Naptrdomainttl
        Modify the TTL of the internally created naptr domain. Default value: 3600 Minimum value = 1
    .PARAMETER Naptrorder
        An integer specifying the order in which the NAPTR records MUST be processed in order to accurately represent the ordered list of Rules. The ordering is from lowest to highest. Default value: 1 Minimum value = 1 Maximum value = 65535
    .PARAMETER Naptrpreference
        An integer specifying the preference of this NAPTR among NAPTR records having same order. lower the number, higher the preference. Default value: 1 Minimum value = 1 Maximum value = 65535
    .PARAMETER Naptrreplacement
        The replacement domain name for this NAPTR. Maximum length = 255
    .PARAMETER NaptrServiceS
        Service Parameters applicable to this delegation path. Maximum length = 255
    .PARAMETER Publicip
        The public IP address that a NAT device translates to the GSLB service's private IP address. Optional.
    .PARAMETER PublicPort
        The public port associated with the GSLB service's public IP address. The port is mapped to the service's private port number. Applicable to the local GSLB service. Optional.
    .PARAMETER SitePersistence
        Use cookie-based site persistence. Applicable only to HTTP and SSL GSLB services. Possible values = ConnectionProxy, HTTPRedirect, NONE
    .PARAMETER Siteprefix
        The site's prefix string. When the service is bound to a GSLB virtual server, a GSLB site domain is generated internally for each bound service-domain pair by concatenating the site prefix of the service and the name of the domain. If the special string NONE is specified, the site-prefix string is unset. When implementing HTTP redirect site persistence, the Citrix ADC redirects GSLB requests to GSLB services by using their site domains.
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
        Invoke-NSUnsetGSLBService -ServiceName 'example' -AppFlowLog ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetGSLBService -ServiceName 'example' -AppFlowLog ENABLED -WhatIf
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
        [string] $ServiceName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowLog,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CIP,

        [Parameter()]
        [switch] $CIPHeader,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DownStateFlush,

        [Parameter()]
        [switch] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $HealthMonitor,

        [Parameter()]
        [switch] $MaxAAAUserS,

        [Parameter()]
        [switch] $MaxBandwidth,

        [Parameter()]
        [switch] $MaxClient,

        [Parameter()]
        [switch] $MonThreshold,

        [Parameter()]
        [switch] $Naptrdomainttl,

        [Parameter()]
        [switch] $Naptrorder,

        [Parameter()]
        [switch] $Naptrpreference,

        [Parameter()]
        [switch] $Naptrreplacement,

        [Parameter()]
        [switch] $NaptrServiceS,

        [Parameter()]
        [switch] $Publicip,

        [Parameter()]
        [switch] $PublicPort,

        [Parameter()]
        [ValidateSet('ConnectionProxy', 'HTTPRedirect', 'NONE')]
        [switch] $SitePersistence,

        [Parameter()]
        [switch] $Siteprefix,

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

        $body = @{ servicename = $ServiceName }
        if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $body['appflowlog'] = $true }
        if ($PSBoundParameters.ContainsKey('CIP')) { $body['cip'] = $true }
        if ($PSBoundParameters.ContainsKey('CIPHeader')) { $body['cipheader'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $body['downstateflush'] = $true }
        if ($PSBoundParameters.ContainsKey('HashID')) { $body['hashid'] = $true }
        if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $body['healthmonitor'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxAAAUserS')) { $body['maxaaausers'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $body['maxbandwidth'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxClient')) { $body['maxclient'] = $true }
        if ($PSBoundParameters.ContainsKey('MonThreshold')) { $body['monthreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('Naptrdomainttl')) { $body['naptrdomainttl'] = $true }
        if ($PSBoundParameters.ContainsKey('Naptrorder')) { $body['naptrorder'] = $true }
        if ($PSBoundParameters.ContainsKey('Naptrpreference')) { $body['naptrpreference'] = $true }
        if ($PSBoundParameters.ContainsKey('Naptrreplacement')) { $body['naptrreplacement'] = $true }
        if ($PSBoundParameters.ContainsKey('NaptrServiceS')) { $body['naptrservices'] = $true }
        if ($PSBoundParameters.ContainsKey('Publicip')) { $body['publicip'] = $true }
        if ($PSBoundParameters.ContainsKey('PublicPort')) { $body['publicport'] = $true }
        if ($PSBoundParameters.ContainsKey('SitePersistence')) { $body['sitepersistence'] = $true }
        if ($PSBoundParameters.ContainsKey('Siteprefix')) { $body['siteprefix'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$ServiceName", 'Clear gslbservice properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservice -Action unset -Payload @{ gslbservice = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBService -ServiceName $ServiceName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetGSLBService

# region Invoke-NSUnsetGSLBServiceGroup
function Invoke-NSUnsetGSLBServiceGroup {
    <#
    .SYNOPSIS
        Clears one or more NetScaler gslbservicegroup resource properties.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information for the specified GSLB service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIP
        Insert the Client IP header in requests forwarded to the GSLB service. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name of the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If client IP insertion is enabled, and the client IP header is not specified, the value of Client IP Header parameter or the value set by the set ns config command is used as client's IP header name. Minimum length = 1
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Any information about the GSLB service group.
    .PARAMETER DownStateFlush
        Flush all active transactions associated with all the services in the GSLB service group whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DupWeight
        weight of the monitor that is bound to GSLB servicegroup. Minimum value = 1
    .PARAMETER HashID
        The hash identifier for the service. This must be unique for each service. This parameter is used by hash based load balancing methods. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of this GSLB service.Available settings function are as follows: YES - Send probes to check the health of the GSLB service. NO - Do not send probes to check the health of the GSLB service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated for all the services in the GSLB service group. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections for the GSLB service group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MonitorNameSvc
        Name of the monitor bound to the GSLB service group. Used to assign a weight to the monitor. Minimum length = 1
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this GSLB service. Used to determine whether to mark a GSLB service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER Order
        Order number to be assigned to the gslb servicegroup member. Minimum value = 1 Maximum value = 8192
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Publicip
        The public IP address that a NAT device translates to the GSLB service's private IP address. Optional. Minimum length = 1
    .PARAMETER PublicPort
        The public port associated with the GSLB service's public IP address. The port is mapped to the service's private port number. Applicable to the local GSLB service. Optional.
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
    .PARAMETER SitePersistence
        Use cookie-based site persistence. Applicable only to HTTP and SSL non-autoscale enabled GSLB servicegroups. Possible values = ConnectionProxy, HTTPRedirect, NONE
    .PARAMETER Siteprefix
        The site's prefix string. When the GSLB service group is bound to a GSLB virtual server, a GSLB site domain is generated internally for each bound serviceitem-domain pair by concatenating the site prefix of the service item and the name of the domain. If the special string NONE is specified, the site-prefix string is unset. When implementing HTTP redirect site persistence, the Citrix ADC redirects GSLB requests to GSLB services by using their site domains.
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
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
        Invoke-NSUnsetGSLBServiceGroup -ServiceGroupName 'example' -AppFlowLog ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetGSLBServiceGroup -ServiceGroupName 'example' -AppFlowLog ENABLED -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CIP,

        [Parameter()]
        [switch] $CIPHeader,

        [Parameter()]
        [switch] $CltTimeout,

        [Parameter()]
        [switch] $Comment,

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
        [switch] $MaxBandwidth,

        [Parameter()]
        [switch] $MaxClient,

        [Parameter()]
        [switch] $MonitorNameSvc,

        [Parameter()]
        [switch] $MonThreshold,

        [Parameter()]
        [switch] $Order,

        [Parameter()]
        [switch] $Port,

        [Parameter()]
        [switch] $Publicip,

        [Parameter()]
        [switch] $PublicPort,

        [Parameter()]
        [switch] $ServerName,

        [Parameter()]
        [ValidateSet('ConnectionProxy', 'HTTPRedirect', 'NONE')]
        [switch] $SitePersistence,

        [Parameter()]
        [switch] $Siteprefix,

        [Parameter()]
        [switch] $SvrTimeout,

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
        if ($PSBoundParameters.ContainsKey('CIP')) { $body['cip'] = $true }
        if ($PSBoundParameters.ContainsKey('CIPHeader')) { $body['cipheader'] = $true }
        if ($PSBoundParameters.ContainsKey('CltTimeout')) { $body['clttimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $body['downstateflush'] = $true }
        if ($PSBoundParameters.ContainsKey('DupWeight')) { $body['dup_weight'] = $true }
        if ($PSBoundParameters.ContainsKey('HashID')) { $body['hashid'] = $true }
        if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $body['healthmonitor'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $body['maxbandwidth'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxClient')) { $body['maxclient'] = $true }
        if ($PSBoundParameters.ContainsKey('MonitorNameSvc')) { $body['monitor_name_svc'] = $true }
        if ($PSBoundParameters.ContainsKey('MonThreshold')) { $body['monthreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('Order')) { $body['order'] = $true }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $true }
        if ($PSBoundParameters.ContainsKey('Publicip')) { $body['publicip'] = $true }
        if ($PSBoundParameters.ContainsKey('PublicPort')) { $body['publicport'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerName')) { $body['servername'] = $true }
        if ($PSBoundParameters.ContainsKey('SitePersistence')) { $body['sitepersistence'] = $true }
        if ($PSBoundParameters.ContainsKey('Siteprefix')) { $body['siteprefix'] = $true }
        if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $body['svrtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Weight')) { $body['weight'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Clear gslbservicegroup properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbservicegroup -Action unset -Payload @{ gslbservicegroup = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetGSLBServiceGroup

# region Invoke-NSUnsetGSLBSite
function Invoke-NSUnsetGSLBSite {
    <#
    .SYNOPSIS
        Clears one or more NetScaler gslbsite resource properties.
    .DESCRIPTION
        Configuration for GSLB site resource.
    .PARAMETER SiteName
        Name for the GSLB site. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsite" or 'my gslbsite'). Minimum length = 1
    .PARAMETER BackupParentlist
        The list of backup gslb sites configured in preferred order. Need to be parent gsb sites. Default value: "None"
    .PARAMETER Krpcnodesrcip
        Source IP address to be used to communicate with this GSLB site. Minimum length = 1
    .PARAMETER Metricexchange
        Exchange metrics with other sites. Metrics are exchanged by using Metric Exchange Protocol (MEP). The appliances in the GSLB setup exchange health information once every second. If you disable metrics exchange, you can use only static load balancing methods (such as round robin, static proximity, or the hash-based methods), and if you disable metrics exchange when a dynamic load balancing method (such as least connection) is in operation, the appliance falls back to round robin. Also, if you disable metrics exchange, you must use a monitor to determine the state of GSLB services. Otherwise, the service is marked as DOWN. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Naptrreplacementsuffix
        The naptr replacement suffix configured here will be used to construct the naptr replacement field in NAPTR record. Minimum length = 1
    .PARAMETER Nwmetricexchange
        Exchange, with other GSLB sites, network metrics such as round-trip time (RTT), learned from communications with various local DNS (LDNS) servers used by clients. RTT information is used in the dynamic RTT load balancing method, and is exchanged every 5 seconds. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Sessionexchange
        Exchange persistent session entries with other GSLB sites every five seconds. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER TriggerMonItor
        Specify the conditions under which the GSLB service must be monitored by a monitor, if one is bound. Available settings function as follows: * ALWAYS - Monitor the GSLB service at all times. * MEPDOWN - Monitor the GSLB service only when the exchange of metrics through the Metrics Exchange Protocol (MEP) is disabled. MEPDOWN_SVCDOWN - Monitor the service in either of the following situations: * The exchange of metrics through MEP is disabled. * The exchange of metrics through MEP is enabled but the status of the service, learned through metrics exchange, is DOWN. Default value: ALWAYS Possible values = ALWAYS, MEPDOWN, MEPDOWN_SVCDOWN
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
        Invoke-NSUnsetGSLBSite -SiteName 'example' -BackupParentlist  -PassThru
    .EXAMPLE
        Invoke-NSUnsetGSLBSite -SiteName 'example' -BackupParentlist  -WhatIf
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
        [string] $SiteName,

        [Parameter()]
        [switch] $BackupParentlist,

        [Parameter()]
        [switch] $Krpcnodesrcip,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Metricexchange,

        [Parameter()]
        [switch] $Naptrreplacementsuffix,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Nwmetricexchange,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Sessionexchange,

        [Parameter()]
        [ValidateSet('ALWAYS', 'MEPDOWN', 'MEPDOWN_SVCDOWN')]
        [switch] $TriggerMonItor,

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

        $body = @{ sitename = $SiteName }
        if ($PSBoundParameters.ContainsKey('BackupParentlist')) { $body['backupparentlist'] = $true }
        if ($PSBoundParameters.ContainsKey('Krpcnodesrcip')) { $body['krpcnodesrcip'] = $true }
        if ($PSBoundParameters.ContainsKey('Metricexchange')) { $body['metricexchange'] = $true }
        if ($PSBoundParameters.ContainsKey('Naptrreplacementsuffix')) { $body['naptrreplacementsuffix'] = $true }
        if ($PSBoundParameters.ContainsKey('Nwmetricexchange')) { $body['nwmetricexchange'] = $true }
        if ($PSBoundParameters.ContainsKey('Sessionexchange')) { $body['sessionexchange'] = $true }
        if ($PSBoundParameters.ContainsKey('TriggerMonItor')) { $body['triggermonitor'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$SiteName", 'Clear gslbsite properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbsite -Action unset -Payload @{ gslbsite = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBSite -SiteName $SiteName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetGSLBSite

# region Invoke-NSUnsetGSLBVServer
function Invoke-NSUnsetGSLBVServer {
    <#
    .SYNOPSIS
        Clears one or more NetScaler gslbvserver resource properties.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER BackupLBMethod
        Backup load balancing method. Becomes operational if the primary load balancing method fails or cannot be used. Valid only if the primary method is based on either round-trip time (RTT) or static proximity. Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API
    .PARAMETER BackupSessionTimeout
        A non zero value enables the feature whose minimum value is 2 minutes. The feature can be disabled by setting the value to zero. The created session is in effect for a specific client per domain. Minimum value = 0 Maximum value = 1440
    .PARAMETER BackupVServer
        Name of the backup GSLB virtual server to which the appliance should to forward requests if the status of the primary GSLB virtual server is down or exceeds its spillover threshold. Minimum length = 1
    .PARAMETER Comment
        Any comments that you might want to associate with the GSLB virtual server.
    .PARAMETER Considereffectivestate
        If the primary state of all bound GSLB services is DOWN, consider the effective states of all the GSLB services, obtained through the Metrics Exchange Protocol (MEP), when determining the state of the GSLB virtual server. To consider the effective state, set the parameter to STATE_ONLY. To disregard the effective state, set the parameter to NONE. The effective state of a GSLB service is the ability of the corresponding virtual server to serve traffic. The effective state of the load balancing virtual server, which is transferred to the GSLB service, is UP even if only one virtual server in the backup chain of virtual servers is in the UP state. Default value: NONE Possible values = NONE, STATE_ONLY
    .PARAMETER DisablePrimaryOnDown
        Continue to direct traffic to the backup chain even after the primary GSLB virtual server returns to the UP state. Used when spillover is configured for the virtual server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSRecordType
        DNS record type to associate with the GSLB virtual server's domain name. Default value: A Possible values = A, AAAA, CNAME, NAPTR
    .PARAMETER Dynamicweight
        Specify if the appliance should consider the service count, service weights, or ignore both when using weight-based load balancing methods. The state of the number of services bound to the virtual server help the appliance to select the service. Default value: DISABLED Possible values = SERVICECOUNT, SERVICEWEIGHT, DISABLED
    .PARAMETER Ecs
        If enabled, respond with EDNS Client Subnet (ECS) option in the response for a DNS query with ECS. The ECS address will be used for persistence and spillover persistence (if enabled) instead of the LDNS address. Persistence mask is ignored if ECS is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ecsaddrvalidation
        Validate if ECS address is a private or unroutable address and in such cases, use the LDNS IP. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Edr
        Send clients an empty DNS response when the GSLB virtual server is DOWN. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER IpType
        The IP type for this GSLB vserver. Default value: IPV4 Possible values = IPV4, IPV6
    .PARAMETER LBMethod
        Load balancing method for the GSLB virtual server. Default value: LEASTCONNECTION Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API
    .PARAMETER Mir
        Include multiple IP addresses in the DNS responses sent to clients. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER NetMask
        IPv4 network mask for use in the SOURCEIPHASH load balancing method. Minimum length = 1
    .PARAMETER Order
        Order number to be assigned to the service when it is bound to the lb vserver. Minimum value = 1 Maximum value = 8192
    .PARAMETER OrderThreshold
        This option is used to to specify the threshold of minimum number of services to be UP in an order, for it to be considered in Lb decision. Default value: 0 Minimum value = 0 Maximum value = 100
    .PARAMETER PersistenceId
        The persistence ID for the GSLB virtual server. The ID is a positive integer that enables GSLB sites to identify the GSLB virtual server, and is required if source IP address based or spill over based persistence is enabled on the virtual server. Minimum value = 0 Maximum value = 65535
    .PARAMETER PersistenceType
        Use source IP address based persistence for the virtual server. After the load balancing method selects a service for the first packet, the IP address received in response to the DNS query is used for subsequent requests from the same client. Possible values = SOURCEIP, NONE
    .PARAMETER PersistMask
        The optional IPv4 network mask applied to IPv4 addresses to establish source IP address based persistence. Minimum length = 1
    .PARAMETER Rule
        Expression, or name of a named expression, against which traffic is evaluated. This field is applicable only if gslb method or gslb backup method are set to API. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks. Default value: "none"
    .PARAMETER ServiceGroupName
        The GSLB service group name bound to the selected GSLB virtual server.
    .PARAMETER ServiceName
        Name of the GSLB service for which to change the weight. Minimum length = 1
    .PARAMETER SoBackupAction
        Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists. Possible values = DROP, ACCEPT, REDIRECT
    .PARAMETER SoMethod
        Type of threshold that, when exceeded, triggers spillover. Available settings function as follows: * CONNECTION - Spillover occurs when the number of client connections exceeds the threshold. * DYNAMICCONNECTION - Spillover occurs when the number of client connections at the GSLB virtual server exceeds the sum of the maximum client (Max Clients) settings for bound GSLB services. Do not specify a spillover threshold for this setting, because the threshold is implied by the Max Clients settings of the bound GSLB services. * BANDWIDTH - Spillover occurs when the bandwidth consumed by the GSLB virtual server's incoming and outgoing traffic exceeds the threshold. * HEALTH - Spillover occurs when the percentage of weights of the GSLB services that are UP drops below the threshold. For example, if services gslbSvc1, gslbSvc2, and gslbSvc3 are bound to a virtual server, with weights 1, 2, and 3, and the spillover threshold is 50%, spillover occurs if gslbSvc1 and gslbSvc3 or gslbSvc2 and gslbSvc3 transition to DOWN. * NONE - Spillover does not occur. Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE
    .PARAMETER SoPersistence
        If spillover occurs, maintain source IP address based persistence for both primary and backup GSLB virtual servers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SoPersistenceTimeout
        Timeout for spillover persistence, in minutes. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER SoThreshold
        Threshold at which spillover occurs. Specify an integer for the CONNECTION spillover method, a bandwidth value in kilobits per second for the BANDWIDTH method (do not enter the units), or a percentage for the HEALTH method (do not enter the percentage symbol). Minimum value = 1 Maximum value = 4294967287
    .PARAMETER Timeout
        Idle time, in minutes, after which a persistence entry is cleared. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER ToggleOrder
        Configure this option to toggle order preference. Default value: ASCENDING Possible values = ASCENDING, DESCENDING
    .PARAMETER Tolerance
        Tolerance in milliseconds. Tolerance value is used in deciding which sites in a GSLB configuration must be considered for implementing the RTT load balancing method. The sites having the RTT value less than or equal to the sum of the lowest RTT and tolerance value are considered. NetScaler implements the round robin method of global server load balancing among these considered sites. The sites that have RTT value greater than this value are not considered. The logic is applied for each LDNS and based on the LDNS, the sites that are considered might change. For example, a site that is considered for requests coming from LDNS1 might not be considered for requests coming from LDNS2. Minimum value = 0 Maximum value = 100
    .PARAMETER V6NetmaskLen
        Number of bits to consider, in an IPv6 source IP address, for creating the hash that is required by the SOURCEIPHASH load balancing method. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER V6PersistMaskLen
        Number of bits to consider in an IPv6 source IP address when creating source IP address based persistence sessions. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER Weight
        Weight for the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSUnsetGSLBVServer -Name 'example' -AppFlowLog ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetGSLBVServer -Name 'example' -AppFlowLog ENABLED -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowLog,

        [Parameter()]
        [ValidateSet('ROUNDROBIN', 'LEASTCONNECTION', 'LEASTRESPONSETIME', 'SOURCEIPHASH', 'LEASTBANDWIDTH', 'LEASTPACKETS', 'STATICPROXIMITY', 'RTT', 'CUSTOMLOAD', 'API')]
        [switch] $BackupLBMethod,

        [Parameter()]
        [switch] $BackupSessionTimeout,

        [Parameter()]
        [switch] $BackupVServer,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [ValidateSet('NONE', 'STATE_ONLY')]
        [switch] $Considereffectivestate,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DisablePrimaryOnDown,

        [Parameter()]
        [ValidateSet('A', 'AAAA', 'CNAME', 'NAPTR')]
        [switch] $DNSRecordType,

        [Parameter()]
        [ValidateSet('SERVICECOUNT', 'SERVICEWEIGHT', 'DISABLED')]
        [switch] $Dynamicweight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Ecs,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Ecsaddrvalidation,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Edr,

        [Parameter()]
        [ValidateSet('IPV4', 'IPV6')]
        [switch] $IpType,

        [Parameter()]
        [ValidateSet('ROUNDROBIN', 'LEASTCONNECTION', 'LEASTRESPONSETIME', 'SOURCEIPHASH', 'LEASTBANDWIDTH', 'LEASTPACKETS', 'STATICPROXIMITY', 'RTT', 'CUSTOMLOAD', 'API')]
        [switch] $LBMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Mir,

        [Parameter()]
        [switch] $NetMask,

        [Parameter()]
        [switch] $Order,

        [Parameter()]
        [switch] $OrderThreshold,

        [Parameter()]
        [switch] $PersistenceId,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'NONE')]
        [switch] $PersistenceType,

        [Parameter()]
        [switch] $PersistMask,

        [Parameter()]
        [switch] $Rule,

        [Parameter()]
        [switch] $ServiceGroupName,

        [Parameter()]
        [switch] $ServiceName,

        [Parameter()]
        [ValidateSet('DROP', 'ACCEPT', 'REDIRECT')]
        [switch] $SoBackupAction,

        [Parameter()]
        [ValidateSet('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'LLMQUOTA', 'NONE')]
        [switch] $SoMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SoPersistence,

        [Parameter()]
        [switch] $SoPersistenceTimeout,

        [Parameter()]
        [switch] $SoThreshold,

        [Parameter()]
        [switch] $Timeout,

        [Parameter()]
        [ValidateSet('ASCENDING', 'DESCENDING')]
        [switch] $ToggleOrder,

        [Parameter()]
        [switch] $Tolerance,

        [Parameter()]
        [switch] $V6NetmaskLen,

        [Parameter()]
        [switch] $V6PersistMaskLen,

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

        $body = @{ name = $Name }
        if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $body['appflowlog'] = $true }
        if ($PSBoundParameters.ContainsKey('BackupLBMethod')) { $body['backuplbmethod'] = $true }
        if ($PSBoundParameters.ContainsKey('BackupSessionTimeout')) { $body['backupsessiontimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('BackupVServer')) { $body['backupvserver'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('Considereffectivestate')) { $body['considereffectivestate'] = $true }
        if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $body['disableprimaryondown'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSRecordType')) { $body['dnsrecordtype'] = $true }
        if ($PSBoundParameters.ContainsKey('Dynamicweight')) { $body['dynamicweight'] = $true }
        if ($PSBoundParameters.ContainsKey('Ecs')) { $body['ecs'] = $true }
        if ($PSBoundParameters.ContainsKey('Ecsaddrvalidation')) { $body['ecsaddrvalidation'] = $true }
        if ($PSBoundParameters.ContainsKey('Edr')) { $body['edr'] = $true }
        if ($PSBoundParameters.ContainsKey('IpType')) { $body['iptype'] = $true }
        if ($PSBoundParameters.ContainsKey('LBMethod')) { $body['lbmethod'] = $true }
        if ($PSBoundParameters.ContainsKey('Mir')) { $body['mir'] = $true }
        if ($PSBoundParameters.ContainsKey('NetMask')) { $body['netmask'] = $true }
        if ($PSBoundParameters.ContainsKey('Order')) { $body['order'] = $true }
        if ($PSBoundParameters.ContainsKey('OrderThreshold')) { $body['orderthreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistenceId')) { $body['persistenceid'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistenceType')) { $body['persistencetype'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistMask')) { $body['persistmask'] = $true }
        if ($PSBoundParameters.ContainsKey('Rule')) { $body['rule'] = $true }
        if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $body['servicegroupname'] = $true }
        if ($PSBoundParameters.ContainsKey('ServiceName')) { $body['servicename'] = $true }
        if ($PSBoundParameters.ContainsKey('SoBackupAction')) { $body['sobackupaction'] = $true }
        if ($PSBoundParameters.ContainsKey('SoMethod')) { $body['somethod'] = $true }
        if ($PSBoundParameters.ContainsKey('SoPersistence')) { $body['sopersistence'] = $true }
        if ($PSBoundParameters.ContainsKey('SoPersistenceTimeout')) { $body['sopersistencetimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('SoThreshold')) { $body['sothreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('Timeout')) { $body['timeout'] = $true }
        if ($PSBoundParameters.ContainsKey('ToggleOrder')) { $body['toggleorder'] = $true }
        if ($PSBoundParameters.ContainsKey('Tolerance')) { $body['tolerance'] = $true }
        if ($PSBoundParameters.ContainsKey('V6NetmaskLen')) { $body['v6netmasklen'] = $true }
        if ($PSBoundParameters.ContainsKey('V6PersistMaskLen')) { $body['v6persistmasklen'] = $true }
        if ($PSBoundParameters.ContainsKey('Weight')) { $body['weight'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear gslbvserver properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type gslbvserver -Action unset -Payload @{ gslbvserver = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetGSLBVServer -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetGSLBVServer

# region Invoke-NSUpdateGSLBParameter
function Invoke-NSUpdateGSLBParameter {
    <#
    .SYNOPSIS
        Updates a NetScaler gslbparameter resource.
    .DESCRIPTION
        Configuration for GSLB parameter resource.
    .PARAMETER Automaticconfigsync
        GSLB configuration will be synced automatically to remote gslb sites if enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DroplDNSReq
        Drop LDNS requests if round-trip time (RTT) information is not available. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GSLBConfigsyncMonItor
        If enabled, remote gslb site's rsync port will be monitored and site is considered for configuration sync only when the monitor is successful. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GSLBSvcstatedelaytime
        Amount of delay in updating the state of GSLB service to DOWN when MEP goes down. This parameter is applicable only if monitors are not bound to GSLB services. Default value: 0 Minimum value = 0 Maximum value = 3600
    .PARAMETER GSLBSyncInterval
        Time duartion (in seconds) for which the gslb sync process will wait before checking for config changes. Default value: 10 Minimum value = 1
    .PARAMETER GSLBSynclocFileS
        If disabled, Location files will not be synced to the remote sites as part of manual sync and automatic sync. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER GSLBSyncMode
        Mode in which configuration will be synced from master site to remote sites. Default value: IncrementalSync Possible values = IncrementalSync, FullSync
    .PARAMETER GSLBSyncsaveconfigcommand
        If enabled, 'save ns config' command will be treated as other GSLB commands and synced to GSLB nodes when auto gslb sync option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER LDNSEntryTimeout
        Time, in seconds, after which an inactive LDNS entry is removed. Default value: 180 Minimum value = 30 Maximum value = 65534
    .PARAMETER LDNSMask
        The IPv4 network mask with which to create LDNS entries. Minimum length = 1
    .PARAMETER LDNSProbeOrder
        Order in which monitors should be initiated to calculate RTT. Possible values = PING, DNS, TCP
    .PARAMETER MepkeepaliveTimeout
        Time duartion (in seconds) during which if no new packets received by Local gslb site from Remote gslb site then mark the MEP connection DOWN. Default value: 10 Minimum value = 1
    .PARAMETER Rtttolerance
        Tolerance, in milliseconds, for newly learned round-trip time (RTT) values. If the difference between the old RTT value and the newly computed RTT value is less than or equal to the specified tolerance value, the LDNS entry in the network metric table is not updated with the new RTT value. Prevents the exchange of metrics when variations in RTT values are negligible. Default value: 5 Minimum value = 1 Maximum value = 100
    .PARAMETER Sourceipwhitelisting
        If enabled, local gslb site private IP would be used as the source IP while initiating MEP/GSLB sync connection if srcIP is not configured for GSLB site. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SvcstateLearningTime
        Time (in seconds) within which local or child site services remain in learning phase. GSLB site will enter the learning phase after reboot, HA failover, Cluster GSLB owner node changes or MEP being enabled on local node. Backup parent (if configured) will selectively move the adopted children's GSLB services to learning phase when primary parent goes down. While a service is in learning period, remote site will not honour the state and stats got through MEP for that service. State can be learnt from health monitor if bound explicitly. Default value: 0 Minimum value = 0 Maximum value = 3600
    .PARAMETER UndefAction
        Action to perform when policy evaluation creates an UNDEF condition. Available settings function as follows: * NOLBACTION - Does not consider LB action in making LB decision. * RESET - Reset the request and notify the user, so that the user can resend the request. * DROP - Drop the request without sending a response to the user. Default value: "NOLBACTION"
    .PARAMETER Usekrpcchannelforsync
        This option is to use Krpc channel for GSLB sync. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER V6lDNSMaskLen
        Mask for creating LDNS entries for IPv6 source addresses. The mask is defined as the number of leading bits to consider, in the source IP address, when creating an LDNS entry. Default value: 128 Minimum value = 1 Maximum value = 128
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
        Invoke-NSUpdateGSLBParameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateGSLBParameter  -WhatIf
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
        [string] $Automaticconfigsync,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DroplDNSReq,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $GSLBConfigsyncMonItor,

        [Parameter()]
        [int] $GSLBSvcstatedelaytime,

        [Parameter()]
        [int] $GSLBSyncInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $GSLBSynclocFileS,

        [Parameter()]
        [ValidateSet('IncrementalSync', 'FullSync')]
        [string] $GSLBSyncMode,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $GSLBSyncsaveconfigcommand,

        [Parameter()]
        [int] $LDNSEntryTimeout,

        [Parameter()]
        [string] $LDNSMask,

        [Parameter()]
        [ValidateSet('PING', 'DNS', 'TCP')]
        [string[]] $LDNSProbeOrder,

        [Parameter()]
        [int] $MepkeepaliveTimeout,

        [Parameter()]
        [int] $Rtttolerance,

        [Parameter()]
        [string] $Sourceipwhitelisting,

        [Parameter()]
        [int] $SvcstateLearningTime,

        [Parameter()]
        [string] $UndefAction,

        [Parameter()]
        [string] $Usekrpcchannelforsync,

        [Parameter()]
        [int] $V6lDNSMaskLen,

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

    if ($PSBoundParameters.ContainsKey('Sourceipwhitelisting')) {
        Assert-NSParameterValue -ParameterName 'Sourceipwhitelisting' -Value $Sourceipwhitelisting -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Usekrpcchannelforsync')) {
        Assert-NSParameterValue -ParameterName 'Usekrpcchannelforsync' -Value $Usekrpcchannelforsync -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Automaticconfigsync')) { $properties['automaticconfigsync'] = $Automaticconfigsync }
    if ($PSBoundParameters.ContainsKey('DroplDNSReq')) { $properties['dropldnsreq'] = $DroplDNSReq }
    if ($PSBoundParameters.ContainsKey('GSLBConfigsyncMonItor')) { $properties['gslbconfigsyncmonitor'] = $GSLBConfigsyncMonItor }
    if ($PSBoundParameters.ContainsKey('GSLBSvcstatedelaytime')) { $properties['gslbsvcstatedelaytime'] = $GSLBSvcstatedelaytime }
    if ($PSBoundParameters.ContainsKey('GSLBSyncInterval')) { $properties['gslbsyncinterval'] = $GSLBSyncInterval }
    if ($PSBoundParameters.ContainsKey('GSLBSynclocFileS')) { $properties['gslbsynclocfiles'] = $GSLBSynclocFileS }
    if ($PSBoundParameters.ContainsKey('GSLBSyncMode')) { $properties['gslbsyncmode'] = $GSLBSyncMode }
    if ($PSBoundParameters.ContainsKey('GSLBSyncsaveconfigcommand')) { $properties['gslbsyncsaveconfigcommand'] = $GSLBSyncsaveconfigcommand }
    if ($PSBoundParameters.ContainsKey('LDNSEntryTimeout')) { $properties['ldnsentrytimeout'] = $LDNSEntryTimeout }
    if ($PSBoundParameters.ContainsKey('LDNSMask')) { $properties['ldnsmask'] = $LDNSMask }
    if ($PSBoundParameters.ContainsKey('LDNSProbeOrder')) { $properties['ldnsprobeorder'] = $LDNSProbeOrder }
    if ($PSBoundParameters.ContainsKey('MepkeepaliveTimeout')) { $properties['mepkeepalivetimeout'] = $MepkeepaliveTimeout }
    if ($PSBoundParameters.ContainsKey('Rtttolerance')) { $properties['rtttolerance'] = $Rtttolerance }
    if ($PSBoundParameters.ContainsKey('Sourceipwhitelisting')) { $properties['sourceipwhitelisting'] = $Sourceipwhitelisting }
    if ($PSBoundParameters.ContainsKey('SvcstateLearningTime')) { $properties['svcstatelearningtime'] = $SvcstateLearningTime }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }
    if ($PSBoundParameters.ContainsKey('Usekrpcchannelforsync')) { $properties['usekrpcchannelforsync'] = $Usekrpcchannelforsync }
    if ($PSBoundParameters.ContainsKey('V6lDNSMaskLen')) { $properties['v6ldnsmasklen'] = $V6lDNSMaskLen }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('gslbparameter', 'Update gslbparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type gslbparameter -Payload @{ gslbparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateGSLBParameter

# region Invoke-NSUpdateGSLBService
function Invoke-NSUpdateGSLBService {
    <#
    .SYNOPSIS
        Updates a NetScaler gslbservice resource.
    .DESCRIPTION
        Configuration for GSLB service resource.
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIP
        In the request that is forwarded to the GSLB service, insert a header that stores the client's IP address. Client IP header insertion is used in connection-proxy based site persistence. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name for the HTTP header that stores the client's IP address. Used with the Client IP option. If client IP header insertion is enabled on the service and a name is not specified for the header, the Citrix ADC uses the name specified by the cipHeader parameter in the set ns param command or, in the GUI, the Client IP Header parameter in the Configure HTTP Parameters dialog box. Minimum length = 1
    .PARAMETER Comment
        Any comments that you might want to associate with the GSLB service.
    .PARAMETER DownStateFlush
        Flush all active transactions associated with the GSLB service when its state transitions from UP to DOWN. Do not enable this option for services that must complete their transactions. Applicable if connection proxy based site persistence is used. Possible values = ENABLED, DISABLED
    .PARAMETER HashID
        Unique hash identifier for the GSLB service, used by hash based load balancing methods. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of the GSLB service. Default value: YES Possible values = YES, NO
    .PARAMETER Ipaddress
        The new IP address of the service.
    .PARAMETER MaxAAAUserS
        Maximum number of SSL VPN users that can be logged on concurrently to the VPN virtual server that is represented by this GSLB service. A GSLB service whose user count reaches the maximum is not considered when a GSLB decision is made, until the count drops below the maximum. Minimum value = 0 Maximum value = 65535
    .PARAMETER MaxBandwidth
        Integer specifying the maximum bandwidth allowed for the service. A GSLB service whose bandwidth reaches the maximum is not considered when a GSLB decision is made, until its bandwidth consumption drops below the maximum.
    .PARAMETER MaxClient
        The maximum number of open connections that the service can support at any given time. A GSLB service whose connection count reaches the maximum is not considered when a GSLB decision is made, until the connection count drops below the maximum. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MonitorNameSvc
        Name of the monitor to bind to the service. Minimum length = 1
    .PARAMETER MonThreshold
        Monitoring threshold value for the GSLB service. If the sum of the weights of the monitors that are bound to this GSLB service and are in the UP state is not equal to or greater than this threshold value, the service is marked as DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER Naptrdomainttl
        Modify the TTL of the internally created naptr domain. Default value: 3600 Minimum value = 1
    .PARAMETER Naptrorder
        An integer specifying the order in which the NAPTR records MUST be processed in order to accurately represent the ordered list of Rules. The ordering is from lowest to highest. Default value: 1 Minimum value = 1 Maximum value = 65535
    .PARAMETER Naptrpreference
        An integer specifying the preference of this NAPTR among NAPTR records having same order. lower the number, higher the preference. Default value: 1 Minimum value = 1 Maximum value = 65535
    .PARAMETER Naptrreplacement
        The replacement domain name for this NAPTR. Maximum length = 255
    .PARAMETER NaptrServiceS
        Service Parameters applicable to this delegation path. Maximum length = 255
    .PARAMETER Publicip
        The public IP address that a NAT device translates to the GSLB service's private IP address. Optional.
    .PARAMETER PublicPort
        The public port associated with the GSLB service's public IP address. The port is mapped to the service's private port number. Applicable to the local GSLB service. Optional.
    .PARAMETER ServiceName
        Name for the GSLB service. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the GSLB service is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsvc" or 'my gslbsvc'). Minimum length = 1
    .PARAMETER SiteName
        Name of the GSLB site to which the service belongs. Minimum length = 1
    .PARAMETER SitePersistence
        Use cookie-based site persistence. Applicable only to HTTP and SSL GSLB services. Possible values = ConnectionProxy, HTTPRedirect, NONE
    .PARAMETER Siteprefix
        The site's prefix string. When the service is bound to a GSLB virtual server, a GSLB site domain is generated internally for each bound service-domain pair by concatenating the site prefix of the service and the name of the domain. If the special string NONE is specified, the site-prefix string is unset. When implementing HTTP redirect site persistence, the Citrix ADC redirects GSLB requests to GSLB services by using their site domains.
    .PARAMETER Viewip
        IP address to be used for the given view.
    .PARAMETER ViewName
        Name of the DNS view of the service. A DNS view is used in global server load balancing (GSLB) to return a predetermined IP address to a specific group of clients, which are identified by using a DNS policy. Minimum length = 1
    .PARAMETER Weight
        Weight to assign to the monitor-service binding. A larger number specifies a greater weight. Contributes to the monitoring threshold, which determines the state of the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSUpdateGSLBService -ServiceName 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateGSLBService -ServiceName 'example' -Comment 'Updated by automation' -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [int] $HashID,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HealthMonitor,

        [Parameter()]
        [string] $Ipaddress,

        [Parameter()]
        [int] $MaxAAAUserS,

        [Parameter()]
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [string] $MonitorNameSvc,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter()]
        [int] $Naptrdomainttl,

        [Parameter()]
        [int] $Naptrorder,

        [Parameter()]
        [int] $Naptrpreference,

        [Parameter()]
        [string] $Naptrreplacement,

        [Parameter()]
        [string] $NaptrServiceS,

        [Parameter()]
        [string] $Publicip,

        [Parameter()]
        [int] $PublicPort,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceName,

        [Parameter()]
        [string] $SiteName,

        [Parameter()]
        [ValidateSet('ConnectionProxy', 'HTTPRedirect', 'NONE')]
        [string] $SitePersistence,

        [Parameter()]
        [string] $Siteprefix,

        [Parameter()]
        [string] $Viewip,

        [Parameter()]
        [string] $ViewName,

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
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('MaxAAAUserS')) { $properties['maxaaausers'] = $MaxAAAUserS }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MonitorNameSvc')) { $properties['monitor_name_svc'] = $MonitorNameSvc }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('Naptrdomainttl')) { $properties['naptrdomainttl'] = $Naptrdomainttl }
    if ($PSBoundParameters.ContainsKey('Naptrorder')) { $properties['naptrorder'] = $Naptrorder }
    if ($PSBoundParameters.ContainsKey('Naptrpreference')) { $properties['naptrpreference'] = $Naptrpreference }
    if ($PSBoundParameters.ContainsKey('Naptrreplacement')) { $properties['naptrreplacement'] = $Naptrreplacement }
    if ($PSBoundParameters.ContainsKey('NaptrServiceS')) { $properties['naptrservices'] = $NaptrServiceS }
    if ($PSBoundParameters.ContainsKey('Publicip')) { $properties['publicip'] = $Publicip }
    if ($PSBoundParameters.ContainsKey('PublicPort')) { $properties['publicport'] = $PublicPort }
    if ($PSBoundParameters.ContainsKey('ServiceName')) { $properties['servicename'] = $ServiceName }
    if ($PSBoundParameters.ContainsKey('SiteName')) { $properties['sitename'] = $SiteName }
    if ($PSBoundParameters.ContainsKey('SitePersistence')) { $properties['sitepersistence'] = $SitePersistence }
    if ($PSBoundParameters.ContainsKey('Siteprefix')) { $properties['siteprefix'] = $Siteprefix }
    if ($PSBoundParameters.ContainsKey('Viewip')) { $properties['viewip'] = $Viewip }
    if ($PSBoundParameters.ContainsKey('ViewName')) { $properties['viewname'] = $ViewName }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceName", 'Update gslbservice')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type gslbservice -Payload @{ gslbservice = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBService -ServiceName $ServiceName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateGSLBService

# region Invoke-NSUpdateGSLBServiceGroup
function Invoke-NSUpdateGSLBServiceGroup {
    <#
    .SYNOPSIS
        Updates a NetScaler gslbservicegroup resource.
    .DESCRIPTION
        Configuration for GSLB service group resource.
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information for the specified GSLB service group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER CIP
        Insert the Client IP header in requests forwarded to the GSLB service. Possible values = ENABLED, DISABLED
    .PARAMETER CIPHeader
        Name of the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If client IP insertion is enabled, and the client IP header is not specified, the value of Client IP Header parameter or the value set by the set ns config command is used as client's IP header name. Minimum length = 1
    .PARAMETER CltTimeout
        Time, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Any information about the GSLB service group.
    .PARAMETER DownStateFlush
        Flush all active transactions associated with all the services in the GSLB service group whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DupWeight
        weight of the monitor that is bound to GSLB servicegroup. Minimum value = 1
    .PARAMETER HashID
        The hash identifier for the service. This must be unique for each service. This parameter is used by hash based load balancing methods. Minimum value = 1
    .PARAMETER HealthMonitor
        Monitor the health of this GSLB service.Available settings function are as follows: YES - Send probes to check the health of the GSLB service. NO - Do not send probes to check the health of the GSLB service. With the NO option, the appliance shows the service as UP at all times. Default value: YES Possible values = YES, NO
    .PARAMETER MaxBandwidth
        Maximum bandwidth, in Kbps, allocated for all the services in the GSLB service group. Minimum value = 0 Maximum value = 4294967287
    .PARAMETER MaxClient
        Maximum number of simultaneous open connections for the GSLB service group. Minimum value = 0 Maximum value = 4294967294
    .PARAMETER MonitorNameSvc
        Name of the monitor bound to the GSLB service group. Used to assign a weight to the monitor. Minimum length = 1
    .PARAMETER MonThreshold
        Minimum sum of weights of the monitors that are bound to this GSLB service. Used to determine whether to mark a GSLB service as UP or DOWN. Minimum value = 0 Maximum value = 65535
    .PARAMETER Order
        Order number to be assigned to the gslb servicegroup member. Minimum value = 1 Maximum value = 8192
    .PARAMETER Port
        Server port number. Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Publicip
        The public IP address that a NAT device translates to the GSLB service's private IP address. Optional. Minimum length = 1
    .PARAMETER PublicPort
        The public port associated with the GSLB service's public IP address. The port is mapped to the service's private port number. Applicable to the local GSLB service. Optional.
    .PARAMETER ServerName
        Name of the server to which to bind the service group. Minimum length = 1
    .PARAMETER ServiceGroupName
        Name of the GSLB service group. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the name is created. Minimum length = 1
    .PARAMETER SiteName
        Name of the GSLB site to which the service group belongs. Minimum length = 1
    .PARAMETER SitePersistence
        Use cookie-based site persistence. Applicable only to HTTP and SSL non-autoscale enabled GSLB servicegroups. Possible values = ConnectionProxy, HTTPRedirect, NONE
    .PARAMETER Siteprefix
        The site's prefix string. When the GSLB service group is bound to a GSLB virtual server, a GSLB site domain is generated internally for each bound serviceitem-domain pair by concatenating the site prefix of the service item and the name of the domain. If the special string NONE is specified, the site-prefix string is unset. When implementing HTTP redirect site persistence, the Citrix ADC redirects GSLB requests to GSLB services by using their site domains.
    .PARAMETER SvrTimeout
        Time, in seconds, after which to terminate an idle server connection. Minimum value = 0 Maximum value = 31536000
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
        Invoke-NSUpdateGSLBServiceGroup -ServiceGroupName 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateGSLBServiceGroup -ServiceGroupName 'example' -Comment 'Updated by automation' -WhatIf
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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CIP,

        [Parameter()]
        [string] $CIPHeader,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [string] $Comment,

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
        [int] $MaxBandwidth,

        [Parameter()]
        [int] $MaxClient,

        [Parameter()]
        [string] $MonitorNameSvc,

        [Parameter()]
        [int] $MonThreshold,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $Publicip,

        [Parameter()]
        [int] $PublicPort,

        [Parameter()]
        [string] $ServerName,

        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceGroupName,

        [Parameter()]
        [string] $SiteName,

        [Parameter()]
        [ValidateSet('ConnectionProxy', 'HTTPRedirect', 'NONE')]
        [string] $SitePersistence,

        [Parameter()]
        [string] $Siteprefix,

        [Parameter()]
        [int] $SvrTimeout,

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
    if ($PSBoundParameters.ContainsKey('CIP')) { $properties['cip'] = $CIP }
    if ($PSBoundParameters.ContainsKey('CIPHeader')) { $properties['cipheader'] = $CIPHeader }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('DupWeight')) { $properties['dup_weight'] = $DupWeight }
    if ($PSBoundParameters.ContainsKey('HashID')) { $properties['hashid'] = $HashID }
    if ($PSBoundParameters.ContainsKey('HealthMonitor')) { $properties['healthmonitor'] = $HealthMonitor }
    if ($PSBoundParameters.ContainsKey('MaxBandwidth')) { $properties['maxbandwidth'] = $MaxBandwidth }
    if ($PSBoundParameters.ContainsKey('MaxClient')) { $properties['maxclient'] = $MaxClient }
    if ($PSBoundParameters.ContainsKey('MonitorNameSvc')) { $properties['monitor_name_svc'] = $MonitorNameSvc }
    if ($PSBoundParameters.ContainsKey('MonThreshold')) { $properties['monthreshold'] = $MonThreshold }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Publicip')) { $properties['publicip'] = $Publicip }
    if ($PSBoundParameters.ContainsKey('PublicPort')) { $properties['publicport'] = $PublicPort }
    if ($PSBoundParameters.ContainsKey('ServerName')) { $properties['servername'] = $ServerName }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('SiteName')) { $properties['sitename'] = $SiteName }
    if ($PSBoundParameters.ContainsKey('SitePersistence')) { $properties['sitepersistence'] = $SitePersistence }
    if ($PSBoundParameters.ContainsKey('Siteprefix')) { $properties['siteprefix'] = $Siteprefix }
    if ($PSBoundParameters.ContainsKey('SvrTimeout')) { $properties['svrtimeout'] = $SvrTimeout }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ServiceGroupName", 'Update gslbservicegroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type gslbservicegroup -Payload @{ gslbservicegroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBServiceGroup -ServiceGroupName $ServiceGroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateGSLBServiceGroup

# region Invoke-NSUpdateGSLBSite
function Invoke-NSUpdateGSLBSite {
    <#
    .SYNOPSIS
        Updates a NetScaler gslbsite resource.
    .DESCRIPTION
        Configuration for GSLB site resource.
    .PARAMETER BackupParentlist
        The list of backup gslb sites configured in preferred order. Need to be parent gsb sites. Default value: "None"
    .PARAMETER Krpcnodesrcip
        Source IP address to be used to communicate with this GSLB site. Minimum length = 1
    .PARAMETER Metricexchange
        Exchange metrics with other sites. Metrics are exchanged by using Metric Exchange Protocol (MEP). The appliances in the GSLB setup exchange health information once every second. If you disable metrics exchange, you can use only static load balancing methods (such as round robin, static proximity, or the hash-based methods), and if you disable metrics exchange when a dynamic load balancing method (such as least connection) is in operation, the appliance falls back to round robin. Also, if you disable metrics exchange, you must use a monitor to determine the state of GSLB services. Otherwise, the service is marked as DOWN. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Naptrreplacementsuffix
        The naptr replacement suffix configured here will be used to construct the naptr replacement field in NAPTR record. Minimum length = 1
    .PARAMETER Nwmetricexchange
        Exchange, with other GSLB sites, network metrics such as round-trip time (RTT), learned from communications with various local DNS (LDNS) servers used by clients. RTT information is used in the dynamic RTT load balancing method, and is exchanged every 5 seconds. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Parentsite
        Parent site of the GSLB site, in a parent-child topology.
    .PARAMETER Publicip
        Public IP address for the local site. Required only if the appliance is deployed in a private address space and the site has a public IP address hosted on an external firewall or a NAT device. Minimum length = 1
    .PARAMETER Sessionexchange
        Exchange persistent session entries with other GSLB sites every five seconds. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Siteipaddress
        IP address for the GSLB site. The GSLB site uses this IP address to communicate with other GSLB sites. For a local site, use any IP address that is owned by the appliance (for example, a SNIP or MIP address, or the IP address of the ADNS service). Minimum length = 1
    .PARAMETER SiteName
        Name for the GSLB site. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my gslbsite" or 'my gslbsite'). Minimum length = 1
    .PARAMETER TriggerMonItor
        Specify the conditions under which the GSLB service must be monitored by a monitor, if one is bound. Available settings function as follows: * ALWAYS - Monitor the GSLB service at all times. * MEPDOWN - Monitor the GSLB service only when the exchange of metrics through the Metrics Exchange Protocol (MEP) is disabled. MEPDOWN_SVCDOWN - Monitor the service in either of the following situations: * The exchange of metrics through MEP is disabled. * The exchange of metrics through MEP is enabled but the status of the service, learned through metrics exchange, is DOWN. Default value: ALWAYS Possible values = ALWAYS, MEPDOWN, MEPDOWN_SVCDOWN
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
        Invoke-NSUpdateGSLBSite -SiteName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateGSLBSite -SiteName 'example' -WhatIf
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
        [string[]] $BackupParentlist,

        [Parameter()]
        [string] $Krpcnodesrcip,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Metricexchange,

        [Parameter()]
        [string] $Naptrreplacementsuffix,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Nwmetricexchange,

        [Parameter()]
        [string] $Parentsite,

        [Parameter()]
        [string] $Publicip,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Sessionexchange,

        [Parameter()]
        [string] $Siteipaddress,

        [Parameter(Mandatory, Position = 0)]
        [string] $SiteName,

        [Parameter()]
        [ValidateSet('ALWAYS', 'MEPDOWN', 'MEPDOWN_SVCDOWN')]
        [string] $TriggerMonItor,

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
    if ($PSBoundParameters.ContainsKey('BackupParentlist')) { $properties['backupparentlist'] = $BackupParentlist }
    if ($PSBoundParameters.ContainsKey('Krpcnodesrcip')) { $properties['krpcnodesrcip'] = $Krpcnodesrcip }
    if ($PSBoundParameters.ContainsKey('Metricexchange')) { $properties['metricexchange'] = $Metricexchange }
    if ($PSBoundParameters.ContainsKey('Naptrreplacementsuffix')) { $properties['naptrreplacementsuffix'] = $Naptrreplacementsuffix }
    if ($PSBoundParameters.ContainsKey('Nwmetricexchange')) { $properties['nwmetricexchange'] = $Nwmetricexchange }
    if ($PSBoundParameters.ContainsKey('Parentsite')) { $properties['parentsite'] = $Parentsite }
    if ($PSBoundParameters.ContainsKey('Publicip')) { $properties['publicip'] = $Publicip }
    if ($PSBoundParameters.ContainsKey('Sessionexchange')) { $properties['sessionexchange'] = $Sessionexchange }
    if ($PSBoundParameters.ContainsKey('Siteipaddress')) { $properties['siteipaddress'] = $Siteipaddress }
    if ($PSBoundParameters.ContainsKey('SiteName')) { $properties['sitename'] = $SiteName }
    if ($PSBoundParameters.ContainsKey('TriggerMonItor')) { $properties['triggermonitor'] = $TriggerMonItor }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$SiteName", 'Update gslbsite')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type gslbsite -Payload @{ gslbsite = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBSite -SiteName $SiteName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateGSLBSite

# region Invoke-NSUpdateGSLBVServer
function Invoke-NSUpdateGSLBVServer {
    <#
    .SYNOPSIS
        Updates a NetScaler gslbvserver resource.
    .DESCRIPTION
        Configuration for Global Server Load Balancing Virtual Server resource.
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER BackupIp
        The IP address of the backup service for the specified domain name. Used when all the services bound to the domain are down, or when the backup chain of virtual servers is down. Minimum length = 1
    .PARAMETER BackupLBMethod
        Backup load balancing method. Becomes operational if the primary load balancing method fails or cannot be used. Valid only if the primary method is based on either round-trip time (RTT) or static proximity. Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API
    .PARAMETER BackupSessionTimeout
        A non zero value enables the feature whose minimum value is 2 minutes. The feature can be disabled by setting the value to zero. The created session is in effect for a specific client per domain. Minimum value = 0 Maximum value = 1440
    .PARAMETER BackupVServer
        Name of the backup GSLB virtual server to which the appliance should to forward requests if the status of the primary GSLB virtual server is down or exceeds its spillover threshold. Minimum length = 1
    .PARAMETER Comment
        Any comments that you might want to associate with the GSLB virtual server.
    .PARAMETER Considereffectivestate
        If the primary state of all bound GSLB services is DOWN, consider the effective states of all the GSLB services, obtained through the Metrics Exchange Protocol (MEP), when determining the state of the GSLB virtual server. To consider the effective state, set the parameter to STATE_ONLY. To disregard the effective state, set the parameter to NONE. The effective state of a GSLB service is the ability of the corresponding virtual server to serve traffic. The effective state of the load balancing virtual server, which is transferred to the GSLB service, is UP even if only one virtual server in the backup chain of virtual servers is in the UP state. Default value: NONE Possible values = NONE, STATE_ONLY
    .PARAMETER CookieDomain
        The cookie domain for the GSLB site. Used when inserting the GSLB site cookie in the HTTP response. Minimum length = 1
    .PARAMETER CookieTimeout
        Timeout, in minutes, for the GSLB site cookie. Minimum value = 0 Maximum value = 1440
    .PARAMETER DisablePrimaryOnDown
        Continue to direct traffic to the backup chain even after the primary GSLB virtual server returns to the UP state. Used when spillover is configured for the virtual server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSRecordType
        DNS record type to associate with the GSLB virtual server's domain name. Default value: A Possible values = A, AAAA, CNAME, NAPTR
    .PARAMETER DomainName
        Domain name for which to change the time to live (TTL) and/or backup service IP address. Minimum length = 1
    .PARAMETER Dynamicweight
        Specify if the appliance should consider the service count, service weights, or ignore both when using weight-based load balancing methods. The state of the number of services bound to the virtual server help the appliance to select the service. Default value: DISABLED Possible values = SERVICECOUNT, SERVICEWEIGHT, DISABLED
    .PARAMETER Ecs
        If enabled, respond with EDNS Client Subnet (ECS) option in the response for a DNS query with ECS. The ECS address will be used for persistence and spillover persistence (if enabled) instead of the LDNS address. Persistence mask is ignored if ECS is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ecsaddrvalidation
        Validate if ECS address is a private or unroutable address and in such cases, use the LDNS IP. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Edr
        Send clients an empty DNS response when the GSLB virtual server is DOWN. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER IpType
        The IP type for this GSLB vserver. Default value: IPV4 Possible values = IPV4, IPV6
    .PARAMETER LBMethod
        Load balancing method for the GSLB virtual server. Default value: LEASTCONNECTION Possible values = ROUNDROBIN, LEASTCONNECTION, LEASTRESPONSETIME, SOURCEIPHASH, LEASTBANDWIDTH, LEASTPACKETS, STATICPROXIMITY, RTT, CUSTOMLOAD, API
    .PARAMETER Mir
        Include multiple IP addresses in the DNS responses sent to clients. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Name
        Name for the GSLB virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Can be changed after the virtual server is created. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my vserver" or 'my vserver'). Minimum length = 1
    .PARAMETER NetMask
        IPv4 network mask for use in the SOURCEIPHASH load balancing method. Minimum length = 1
    .PARAMETER Order
        Order number to be assigned to the service when it is bound to the lb vserver. Minimum value = 1 Maximum value = 8192
    .PARAMETER OrderThreshold
        This option is used to to specify the threshold of minimum number of services to be UP in an order, for it to be considered in Lb decision. Default value: 0 Minimum value = 0 Maximum value = 100
    .PARAMETER PersistenceId
        The persistence ID for the GSLB virtual server. The ID is a positive integer that enables GSLB sites to identify the GSLB virtual server, and is required if source IP address based or spill over based persistence is enabled on the virtual server. Minimum value = 0 Maximum value = 65535
    .PARAMETER PersistenceType
        Use source IP address based persistence for the virtual server. After the load balancing method selects a service for the first packet, the IP address received in response to the DNS query is used for subsequent requests from the same client. Possible values = SOURCEIP, NONE
    .PARAMETER PersistMask
        The optional IPv4 network mask applied to IPv4 addresses to establish source IP address based persistence. Minimum length = 1
    .PARAMETER Rule
        Expression, or name of a named expression, against which traffic is evaluated. This field is applicable only if gslb method or gslb backup method are set to API. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks. Default value: "none"
    .PARAMETER ServiceGroupName
        The GSLB service group name bound to the selected GSLB virtual server.
    .PARAMETER ServiceName
        Name of the GSLB service for which to change the weight. Minimum length = 1
    .PARAMETER Sitedomainttl
        TTL, in seconds, for all internally created site domains (created when a site prefix is configured on a GSLB service) that are associated with this virtual server. Minimum value = 1
    .PARAMETER SoBackupAction
        Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists. Possible values = DROP, ACCEPT, REDIRECT
    .PARAMETER SoMethod
        Type of threshold that, when exceeded, triggers spillover. Available settings function as follows: * CONNECTION - Spillover occurs when the number of client connections exceeds the threshold. * DYNAMICCONNECTION - Spillover occurs when the number of client connections at the GSLB virtual server exceeds the sum of the maximum client (Max Clients) settings for bound GSLB services. Do not specify a spillover threshold for this setting, because the threshold is implied by the Max Clients settings of the bound GSLB services. * BANDWIDTH - Spillover occurs when the bandwidth consumed by the GSLB virtual server's incoming and outgoing traffic exceeds the threshold. * HEALTH - Spillover occurs when the percentage of weights of the GSLB services that are UP drops below the threshold. For example, if services gslbSvc1, gslbSvc2, and gslbSvc3 are bound to a virtual server, with weights 1, 2, and 3, and the spillover threshold is 50%, spillover occurs if gslbSvc1 and gslbSvc3 or gslbSvc2 and gslbSvc3 transition to DOWN. * NONE - Spillover does not occur. Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE
    .PARAMETER SoPersistence
        If spillover occurs, maintain source IP address based persistence for both primary and backup GSLB virtual servers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SoPersistenceTimeout
        Timeout for spillover persistence, in minutes. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER SoThreshold
        Threshold at which spillover occurs. Specify an integer for the CONNECTION spillover method, a bandwidth value in kilobits per second for the BANDWIDTH method (do not enter the units), or a percentage for the HEALTH method (do not enter the percentage symbol). Minimum value = 1 Maximum value = 4294967287
    .PARAMETER Timeout
        Idle time, in minutes, after which a persistence entry is cleared. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER ToggleOrder
        Configure this option to toggle order preference. Default value: ASCENDING Possible values = ASCENDING, DESCENDING
    .PARAMETER Tolerance
        Tolerance in milliseconds. Tolerance value is used in deciding which sites in a GSLB configuration must be considered for implementing the RTT load balancing method. The sites having the RTT value less than or equal to the sum of the lowest RTT and tolerance value are considered. NetScaler implements the round robin method of global server load balancing among these considered sites. The sites that have RTT value greater than this value are not considered. The logic is applied for each LDNS and based on the LDNS, the sites that are considered might change. For example, a site that is considered for requests coming from LDNS1 might not be considered for requests coming from LDNS2. Minimum value = 0 Maximum value = 100
    .PARAMETER Ttl
        Time to live (TTL) for the domain. Minimum value = 1
    .PARAMETER V6NetmaskLen
        Number of bits to consider, in an IPv6 source IP address, for creating the hash that is required by the SOURCEIPHASH load balancing method. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER V6PersistMaskLen
        Number of bits to consider in an IPv6 source IP address when creating source IP address based persistence sessions. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER Weight
        Weight for the service. Minimum value = 1 Maximum value = 100
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
        Invoke-NSUpdateGSLBVServer -Name 'example' -LBMethod ROUNDROBIN -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateGSLBVServer -Name 'example' -LBMethod ROUNDROBIN -Comment 'Updated by automation' -WhatIf
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
        [string] $BackupIp,

        [Parameter()]
        [ValidateSet('ROUNDROBIN', 'LEASTCONNECTION', 'LEASTRESPONSETIME', 'SOURCEIPHASH', 'LEASTBANDWIDTH', 'LEASTPACKETS', 'STATICPROXIMITY', 'RTT', 'CUSTOMLOAD', 'API')]
        [string] $BackupLBMethod,

        [Parameter()]
        [int] $BackupSessionTimeout,

        [Parameter()]
        [string] $BackupVServer,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('NONE', 'STATE_ONLY')]
        [string] $Considereffectivestate,

        [Parameter()]
        [string] $CookieDomain,

        [Parameter()]
        [int] $CookieTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisablePrimaryOnDown,

        [Parameter()]
        [ValidateSet('A', 'AAAA', 'CNAME', 'NAPTR')]
        [string] $DNSRecordType,

        [Parameter()]
        [string] $DomainName,

        [Parameter()]
        [ValidateSet('SERVICECOUNT', 'SERVICEWEIGHT', 'DISABLED')]
        [string] $Dynamicweight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ecs,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ecsaddrvalidation,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Edr,

        [Parameter()]
        [ValidateSet('IPV4', 'IPV6')]
        [string] $IpType,

        [Parameter()]
        [ValidateSet('ROUNDROBIN', 'LEASTCONNECTION', 'LEASTRESPONSETIME', 'SOURCEIPHASH', 'LEASTBANDWIDTH', 'LEASTPACKETS', 'STATICPROXIMITY', 'RTT', 'CUSTOMLOAD', 'API')]
        [string] $LBMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Mir,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [int] $Order,

        [Parameter()]
        [int] $OrderThreshold,

        [Parameter()]
        [int] $PersistenceId,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'NONE')]
        [string] $PersistenceType,

        [Parameter()]
        [string] $PersistMask,

        [Parameter()]
        [string] $Rule,

        [Parameter()]
        [string] $ServiceGroupName,

        [Parameter()]
        [string] $ServiceName,

        [Parameter()]
        [int] $Sitedomainttl,

        [Parameter()]
        [ValidateSet('DROP', 'ACCEPT', 'REDIRECT')]
        [string] $SoBackupAction,

        [Parameter()]
        [string] $SoMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SoPersistence,

        [Parameter()]
        [int] $SoPersistenceTimeout,

        [Parameter()]
        [int] $SoThreshold,

        [Parameter()]
        [int] $Timeout,

        [Parameter()]
        [ValidateSet('ASCENDING', 'DESCENDING')]
        [string] $ToggleOrder,

        [Parameter()]
        [int] $Tolerance,

        [Parameter()]
        [int] $Ttl,

        [Parameter()]
        [int] $V6NetmaskLen,

        [Parameter()]
        [int] $V6PersistMaskLen,

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

    if ($PSBoundParameters.ContainsKey('SoMethod')) {
        Assert-NSParameterValue -ParameterName 'SoMethod' -Value $SoMethod -AllowedValuesByVersion @{ '13.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'NONE'); '14.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'LLMQUOTA', 'NONE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('BackupIp')) { $properties['backupip'] = $BackupIp }
    if ($PSBoundParameters.ContainsKey('BackupLBMethod')) { $properties['backuplbmethod'] = $BackupLBMethod }
    if ($PSBoundParameters.ContainsKey('BackupSessionTimeout')) { $properties['backupsessiontimeout'] = $BackupSessionTimeout }
    if ($PSBoundParameters.ContainsKey('BackupVServer')) { $properties['backupvserver'] = $BackupVServer }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Considereffectivestate')) { $properties['considereffectivestate'] = $Considereffectivestate }
    if ($PSBoundParameters.ContainsKey('CookieDomain')) { $properties['cookie_domain'] = $CookieDomain }
    if ($PSBoundParameters.ContainsKey('CookieTimeout')) { $properties['cookietimeout'] = $CookieTimeout }
    if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $properties['disableprimaryondown'] = $DisablePrimaryOnDown }
    if ($PSBoundParameters.ContainsKey('DNSRecordType')) { $properties['dnsrecordtype'] = $DNSRecordType }
    if ($PSBoundParameters.ContainsKey('DomainName')) { $properties['domainname'] = $DomainName }
    if ($PSBoundParameters.ContainsKey('Dynamicweight')) { $properties['dynamicweight'] = $Dynamicweight }
    if ($PSBoundParameters.ContainsKey('Ecs')) { $properties['ecs'] = $Ecs }
    if ($PSBoundParameters.ContainsKey('Ecsaddrvalidation')) { $properties['ecsaddrvalidation'] = $Ecsaddrvalidation }
    if ($PSBoundParameters.ContainsKey('Edr')) { $properties['edr'] = $Edr }
    if ($PSBoundParameters.ContainsKey('IpType')) { $properties['iptype'] = $IpType }
    if ($PSBoundParameters.ContainsKey('LBMethod')) { $properties['lbmethod'] = $LBMethod }
    if ($PSBoundParameters.ContainsKey('Mir')) { $properties['mir'] = $Mir }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }
    if ($PSBoundParameters.ContainsKey('Order')) { $properties['order'] = $Order }
    if ($PSBoundParameters.ContainsKey('OrderThreshold')) { $properties['orderthreshold'] = $OrderThreshold }
    if ($PSBoundParameters.ContainsKey('PersistenceId')) { $properties['persistenceid'] = $PersistenceId }
    if ($PSBoundParameters.ContainsKey('PersistenceType')) { $properties['persistencetype'] = $PersistenceType }
    if ($PSBoundParameters.ContainsKey('PersistMask')) { $properties['persistmask'] = $PersistMask }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('ServiceGroupName')) { $properties['servicegroupname'] = $ServiceGroupName }
    if ($PSBoundParameters.ContainsKey('ServiceName')) { $properties['servicename'] = $ServiceName }
    if ($PSBoundParameters.ContainsKey('Sitedomainttl')) { $properties['sitedomainttl'] = $Sitedomainttl }
    if ($PSBoundParameters.ContainsKey('SoBackupAction')) { $properties['sobackupaction'] = $SoBackupAction }
    if ($PSBoundParameters.ContainsKey('SoMethod')) { $properties['somethod'] = $SoMethod }
    if ($PSBoundParameters.ContainsKey('SoPersistence')) { $properties['sopersistence'] = $SoPersistence }
    if ($PSBoundParameters.ContainsKey('SoPersistenceTimeout')) { $properties['sopersistencetimeout'] = $SoPersistenceTimeout }
    if ($PSBoundParameters.ContainsKey('SoThreshold')) { $properties['sothreshold'] = $SoThreshold }
    if ($PSBoundParameters.ContainsKey('Timeout')) { $properties['timeout'] = $Timeout }
    if ($PSBoundParameters.ContainsKey('ToggleOrder')) { $properties['toggleorder'] = $ToggleOrder }
    if ($PSBoundParameters.ContainsKey('Tolerance')) { $properties['tolerance'] = $Tolerance }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('V6NetmaskLen')) { $properties['v6netmasklen'] = $V6NetmaskLen }
    if ($PSBoundParameters.ContainsKey('V6PersistMaskLen')) { $properties['v6persistmasklen'] = $V6PersistMaskLen }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update gslbvserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type gslbvserver -Payload @{ gslbvserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetGSLBVServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateGSLBVServer

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDS/X+U1wVKfkbC
# rVro5aBvt0R/qCFu2Qxt2bPxOwpfHaCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCCB4NwcrUMW7TTlnin3O/7AwxXuVvlpdGfb4P2WkH83
# 3TANBgkqhkiG9w0BAQEFAASCAYDEwO+jwoeDMPJZ21v82Vm+Pm2Oa8Y3CVHrxcbC
# qqlmMcE7KRypO7z9NCpm8DY4FiM7SCurfvlC6V3G04bBPcxOdGTS2IUEyJENJkZQ
# 72vhzIZvqszJ31xD5MgCN10NKE8TogAO6+gpa9bbYcExokX5G1DKLgT5nZ21MEdb
# g+mM3vKPpwHjxACGNYXqXOCCamc1WU/osJ6Rv9kfHhtq7x9ag2ZPfSQGS66aEe8j
# 2jkK4PC8dkgSMROpRvnzFFqFvURr8AwyPVPsaNUgG3xA+bqekS9YcIoZ/m0GXS8k
# HVNn75d/+WLzeSVwiMBjgWHhq8vZq0expOHWw4Jd7Sv6LWq84PX/GhXaL7oQnckB
# GkOZm63Gw4qN8JCKM51pItuYaZtSjHgAQlLc4onIUtTa/7nCdQBePXiti1Oia7Ux
# K3CX7yEAxE+3v7RDIESN3LzQcQfQSOW99GVR1m25d3xFD0uTC+/3batz705yZ4is
# 4fra4g5dl1anfwZ9v7JjH3hqUOChggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU1MjNaMD8GCSqGSIb3
# DQEJBDEyBDAe1+rUEo2n9I4/grZFQsXluL4WgL+0/mEtdESQ8txTYHqFb30cWh9a
# 2FJE6EEpejwwDQYJKoZIhvcNAQEBBQAEggIAXEVfyvCXGoDhHdP7udpa8xpOPjnm
# KdtnwJ5XGKfwbipsZrFzmAFAdK7WfWKs90zxyn0Wjn+USHqu9ezcTOQqa6FxWkKV
# WEcHJ92heDG07EEHaf2/5Wk0y/qBqEAPTq9xXvGy9592nN5jWwJsAcKVcXEUkTp3
# 7tR1QCJCqS3YCSgtKsVcWTPUwBtgYgaJLdckUeYry8puz6+qsvLtkZTu9y9r41Dw
# KwOX/L/zRarTzi/BXapnqSIXPDGJE5piUxfFhY7TG/Cf5d89AvvrGCCtQs8RcXXV
# s9LwAB7NxftGgi3xhciOmh+G5tBzFTP3vE1PMuV3xf5r5zpZWylUiQ+c+UQuzDtz
# ET/Iu6m1xOVKrsNac6tiHg7nKI0vqcPA1rsIRdWMmwJlNdiQFFKh/mTRprSCyJKc
# m6QNgJ12x25O4L6QGL950uuPJNOcc+wJJHpYgG/OZPzuZZ7PK2kZyAymPJAeUC+v
# JeyipCWs9lJ6RSaytRViDSb5ECaI2SMmbSQGjC8YZFAd7z8yE5ahhMoDTozNN6a4
# BoVEZMCvwROu1WVWC/52nOL8g5Qek3Ob89L33yl6V6vQPHKlSbIqdecwYSro6Uxw
# wy5rqo7A1+Zl5hlTwH1r+MtjH8gyT1HXeEsJT0VlKnO7r6cOZFDlImb/j/jmpbIu
# b7TZcT44vy+XcYA=
# SIG # End signature block
