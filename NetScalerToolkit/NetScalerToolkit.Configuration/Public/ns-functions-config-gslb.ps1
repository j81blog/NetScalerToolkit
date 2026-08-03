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
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDS/X+U1wVKfkbC
# rVro5aBvt0R/qCFu2Qxt2bPxOwpfHaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQggeDc
# HK1DFu005Z4p9zv+wMMV7lb5aXRn2+D9lpB/N90wDQYJKoZIhvcNAQEBBQAEggGA
# MsJ6hUI07XYIFcIxZtm2P4FZZWB5J4BnQ1oV69hL/x7hwN1OPvWe2FHiwdpm6Cmd
# 2pfulw3eUiGPFRAdZfYgLGGkeXBQkfhtX/WeNo2BgBOrtxLwbLwhKZ/C2f99luU4
# CAbLyz7jq5FCKXiG2l0mNbjdnuIcKGjAUAvxbMZikxv8LkCUeAzZqOivW48ajdwK
# CY38wHEEseZnSfx4pWW7GDQnMKcv/IstKtvNRYmzt5NzIBWEaDsDJm8CAI0EWyxc
# tB/qgeR0uA0LRnkTv2P1g5g1zWukyCKIE/aDzJorLpwytGhTL+uiIAB/5IC11/bt
# s9Oh1AppQKTx9DDPVwP53ej7iaF37oQN/byIzSfI/o+sLDIJj+wl/ANG/weqqe0G
# jEC2zWhWYL23tiT8eBBh0JB6v5JhUJUjH5BrRww3J5/Q7xKFnn6jlZ+oFWKLSoJN
# aGASzGH1mNewKRFEVLMcH2xcABXH3i0TK5SJUmfGr0EiCNI0Xtqd9wBw8u91jleY
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIDBEz4mOLPKrw79bCLf7
# 2VxvcvChgHqh9aDkoEK3i1MbAgZqNTBfoH4YEzIwMjYwODAzMTI1MTQ1LjgyOFow
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
# IgQgRvY+RAHqMGSz1KJhJT6blgRgIkTw1pwryHsYWwf1h1Ywgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCBjvs38TkZQ7iGxRP7H
# HHeWregoVp5960ewGO9kUZr6FDANBgkqhkiG9w0BAQsFAASCAgDs0mA+smyaZnYL
# x/ive8SUrVTXaMYv5jllvTdfrBvDUZ8GQT4zBCojwEXvk784hjnCQjAG+w07u96D
# XTl2f4vyR/kgMGFx6YMMBVxQtk8Q822PYk4A0daVlMfHNLHsc+CwW2OwWsg8OfPa
# jYvDFrVZIOQ54u+dnZLizynUqucg0H1LBQxCa29jJEm3FdMWSfc4YdG1Kwp0rXuh
# ebR9Pi63fY2+zWV9PrU9tqb4LLEMPLuD1LMV9uLu0w4H7p6AX2dD2Ycm2hveUt4r
# hMFoPhL6d626bPcCEpwSS4nAm/OUY1D7JyKalMiVl7CBen31PBDub8j6mTbZG9nV
# Ht6m5s/8xweazIuQ6JMKKix616ZHLXPjEWrbMPDCJnRDr0t5e0VFN7w+3fLneTFh
# 7Wg17FNySNGNIpT0Uq3DaK2q7v2JSTNE2X+gghz+CzMmDIzHCi4DmL11HlJonj2s
# 4/07dUYUcJ9Wc/s6+nPLHS/LbTwxpfvTyTgwuOVkK6ZOast6MC8hmmFt+xD6w5SE
# kIdTSAYO+3sx5PD5r3FIGWoyAbUirIxf+LKEivtRQsR+xMgaSeiSPVzdZikknQAD
# gt5995sI4Uu7twCc2FRrA8M8CL7dchLclK1oQNQsIGbZU2MqjR40XJ94h+XGz1sk
# jHaSUaKXcmNVWQNjL3gclLWT6jMh+A==
# SIG # End signature block
