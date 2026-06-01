# Generated NetScalerToolkit Configuration bundle for category 'cr'.

# region Invoke-NSAddCRPolicy
function Invoke-NSAddCRPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler crpolicy resource.
    .DESCRIPTION
        Configuration for cache redirection policy resource.
    .PARAMETER Action
        Name of the built-in cache redirection action: CACHE/ORIGIN.
    .PARAMETER LogAction
        The log action associated with the cache redirection policy.
    .PARAMETER PolicyName
        Name for the cache redirection policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Expression, or name of a named expression, against which traffic is evaluated. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
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
        Invoke-NSAddCRPolicy -PolicyName 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRPolicy -PolicyName 'example' -Rule 'example' -WhatIf
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
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $PolicyName,

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
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$PolicyName", 'Create crpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crpolicy -Payload @{ crpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRPolicy -PolicyName $PolicyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRPolicy

# region Invoke-NSAddCRVServer
function Invoke-NSAddCRVServer {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver resource.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Arp
        Use ARP to determine the destination MAC address. Possible values = ON, OFF
    .PARAMETER BackendSSL
        Decides whether the backend connection made by Citrix ADC to the origin server will be HTTP or SSL. Applicable only for SSL type CR Forward proxy vserver. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER BackupVServer
        Name of the backup virtual server to which traffic is forwarded if the active server becomes unavailable. Minimum length = 1
    .PARAMETER CacheType
        Mode of operation for the cache redirection virtual server. Available settings function as follows: * TRANSPARENT - Intercept all traffic flowing to the appliance and apply cache redirection policies to determine whether content should be served from the cache or from the origin server. * FORWARD - Resolve the hostname of the incoming request, by using a DNS server, and forward requests for non-cacheable content to the resolved origin servers. Cacheable requests are sent to the configured cache servers. * REVERSE - Configure reverse proxy caches for specific origin servers. Incoming traffic directed to the reverse proxy can either be served from a cache server or be sent to the origin server with or without modification to the URL. The default value for cache type is TRANSPARENT if service is HTTP or SSL whereas the default cache type is FORWARD if the service is HDX. Possible values = TRANSPARENT, REVERSE, FORWARD
    .PARAMETER CacheVServer
        Name of the default cache virtual server to which to redirect requests (the default target of the cache redirection virtual server). Minimum length = 1
    .PARAMETER CltTimeout
        Time-out value, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Comments associated with this virtual server. Maximum length = 256
    .PARAMETER DestinationVServer
        Destination virtual server for a transparent or forward proxy cache redirection virtual server. Minimum length = 1
    .PARAMETER DisablePrimaryOnDown
        Continue sending traffic to a backup virtual server even after the primary virtual server comes UP from the DOWN state. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DisallowServiceAccess
        This is effective when a FORWARD type cr vserver is added. By default, this parameter is DISABLED. When it is ENABLED, backend services cannot be accessed through a FORWARD type cr vserver. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSVServerName
        Name of the DNS virtual server that resolves domain names arriving at the forward proxy virtual server. Note: This parameter applies only to forward proxy virtual servers, not reverse or transparent. Minimum length = 1
    .PARAMETER Domain
        Default domain for reverse proxies. Domains are configured to direct an incoming request from a specified source domain to a specified target domain. There can be several configured pairs of source and target domains. You can select one pair to be the default. If the host header or URL of an incoming request does not include a source domain, this option sends the request to the specified target domain. Minimum length = 1
    .PARAMETER DownStateFlush
        Perform delayed cleanup of connections to this virtual server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER FormAt
        . Possible values = ON, OFF
    .PARAMETER GHost
        . Possible values = ON, OFF
    .PARAMETER HTTPProfileName
        Name of the profile containing HTTP configuration information for cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER ICMPVsrResponse
        Criterion for responding to PING requests sent to this virtual server. If ACTIVE, respond only if the virtual server is available. If PASSIVE, respond even if the virtual server is not available. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER IPSet
        The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cr vserver. Minimum length = 1
    .PARAMETER IPv46
        IPv4 or IPv6 address of the cache redirection virtual server. Usually a public IP address. Clients send connection requests to this IP address. Note: For a transparent cache redirection virtual server, use an asterisk (*) to specify a wildcard virtual server address.
    .PARAMETER L2Conn
        Use L2 parameters, such as MAC, VLAN, and channel to identify a connection. Possible values = ON, OFF
    .PARAMETER ListenPolicy
        String specifying the listen policy for the cache redirection virtual server. Can be either an in-line expression or the name of a named expression. Default value: "NONE"
    .PARAMETER ListenPriority
        Priority of the listen policy specified by the Listen Policy parameter. The lower the number, higher the priority. Default value: 101 Minimum value = 0 Maximum value = 100
    .PARAMETER Map
        Obsolete. Possible values = ON, OFF
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
    .PARAMETER NetProfile
        Name of the network profile containing network configurations for the cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER OnPolicyMatch
        Redirect requests that match the policy to either the cache or the origin server, as specified. Note: For this option to work, you must set the cache redirection type to POLICY. Default value: ORIGIN Possible values = CACHE, ORIGIN
    .PARAMETER OriginuSIP
        Use the client's IP address as the source IP address in requests sent to the origin server. Note: You can enable this parameter to implement fully transparent CR deployment. Possible values = ON, OFF
    .PARAMETER Port
        Port number of the virtual server. Default value: 80 Minimum value = 1 Maximum value = 65534
    .PARAMETER Precedence
        Type of policy (URL or RULE) that takes precedence on the cache redirection virtual server. Applies only to cache redirection virtual servers that have both URL and RULE based policies. If you specify URL, URL based policies are applied first, in the following order: 1. Domain and exact URL 2. Domain, prefix and suffix 3. Domain and suffix 4. Domain and prefix 5. Domain only 6. Exact URL 7. Prefix and suffix 8. Suffix only 9. Prefix only 10. Default If you specify RULE, the rule based policies are applied before URL based policies are applied. Default value: RULE Possible values = RULE, URL
    .PARAMETER ProbePort
        Citrix ADC provides support for external health check of the vserver status. Select port for HTTP/TCP monitring. Default value: 0 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProbeProtocol
        Citrix ADC provides support for external health check of the vserver status. Select HTTP or TCP probes for healthcheck. Possible values = TCP, HTTP
    .PARAMETER ProbeSuccessResponseCode
        HTTP code to return in SUCCESS case. Default value: "200 OK" Minimum length = 1 Maximum length = 64
    .PARAMETER Range
        Number of consecutive IP addresses, starting with the address specified by the IPAddress parameter, to include in a range of addresses assigned to this virtual server. Default value: 1 Minimum value = 1 Maximum value = 254
    .PARAMETER Redirect
        Type of cache server to which to redirect HTTP requests. Available settings function as follows: * CACHE - Direct all requests to the cache. * POLICY - Apply the cache redirection policy to determine whether the request should be directed to the cache or to the origin. * ORIGIN - Direct all requests to the origin server. Default value: POLICY Possible values = CACHE, POLICY, ORIGIN
    .PARAMETER RedirectURL
        URL of the server to which to redirect traffic if the cache redirection virtual server configured on the Citrix ADC becomes unavailable. Minimum length = 1 Maximum length = 128
    .PARAMETER Reuse
        Reuse TCP connections to the origin server across client connections. Do not set this parameter unless the Service Type parameter is set to HTTP. If you set this parameter to OFF, the possible settings of the Redirect parameter function as follows: * CACHE - TCP connections to the cache servers are not reused. * ORIGIN - TCP connections to the origin servers are not reused. * POLICY - TCP connections to the origin servers are not reused. If you set the Reuse parameter to ON, connections to origin servers and connections to cache servers are reused. Default value: ON Possible values = ON, OFF
    .PARAMETER Rhistate
        A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute. * If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP. * If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER ServiceType
        Protocol (type of service) handled by the virtual server. Possible values = HTTP, SSL, NNTP, HDX
    .PARAMETER SoPersistenceTimeout
        Time-out, in minutes, for spillover persistence. Minimum value = 2 Maximum value = 24
    .PARAMETER SoThreshold
        For CONNECTION (or) DYNAMICCONNECTION spillover, the number of connections above which the virtual server enters spillover mode. For BANDWIDTH spillover, the amount of incoming and outgoing traffic (in Kbps) before spillover. For HEALTH spillover, the percentage of active services (by weight) below which spillover occurs. Minimum value = 1
    .PARAMETER Srcipexpr
        Expression used to extract the source IP addresses from the requests originating from the cache. Can be either an in-line expression or the name of a named expression. Minimum length = 1 Maximum length = 1500
    .PARAMETER State
        Initial state of the cache redirection virtual server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER TCPProbePort
        Port number for external TCP probe. NetScaler provides support for external TCP health check of the vserver status over the selected port. This option is only supported for vservers assigned with an IPAddress or ipset. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER TCPProfileName
        Name of the profile containing TCP configuration information for the cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER UseoriginipPortForcache
        Use origin ip/port while forwarding request to the cache. Change the destination IP, destination port of the request came to CR vserver to Origin IP and Origin Port and forward it to Cache. Default value: NO Possible values = YES, NO
    .PARAMETER UsePortRange
        Use a port number from the port range (set by using the set ns param command, or in the Create Virtual Server (Cache Redirection) dialog box) as the source port in the requests sent to the origin server. Default value: OFF Possible values = ON, OFF
    .PARAMETER Via
        Insert a via header in each HTTP request. In the case of a cache miss, the request is redirected from the cache server to the origin server. This header indicates whether the request is being sent from a cache server. Default value: ON Possible values = ON, OFF
    .PARAMETER WASMModule
        Name of the WASM module to assign to this virtual server.
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
        Invoke-NSAddCRVServer -Name 'example' -ServiceType HTTP -IPv46 '192.0.2.10' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServer -Name 'example' -ServiceType HTTP -IPv46 '192.0.2.10' -Port 80 -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [string] $Arp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $BackendSSL,

        [Parameter()]
        [string] $BackupVServer,

        [Parameter()]
        [ValidateSet('TRANSPARENT', 'REVERSE', 'FORWARD')]
        [string] $CacheType,

        [Parameter()]
        [string] $CacheVServer,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $DestinationVServer,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisablePrimaryOnDown,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisallowServiceAccess,

        [Parameter()]
        [string] $DNSVServerName,

        [Parameter()]
        [string] $Domain,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $FormAt,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $GHost,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $ICMPVsrResponse,

        [Parameter()]
        [string] $IPSet,

        [Parameter()]
        [string] $IPv46,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $L2Conn,

        [Parameter()]
        [string] $ListenPolicy,

        [Parameter()]
        [int] $ListenPriority,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Map,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [ValidateSet('CACHE', 'ORIGIN')]
        [string] $OnPolicyMatch,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $OriginuSIP,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [ValidateSet('RULE', 'URL')]
        [string] $Precedence,

        [Parameter()]
        [int] $ProbePort,

        [Parameter()]
        [ValidateSet('TCP', 'HTTP')]
        [string] $ProbeProtocol,

        [Parameter()]
        [string] $ProbeSuccessResponseCode,

        [Parameter()]
        [int] $Range,

        [Parameter()]
        [ValidateSet('CACHE', 'POLICY', 'ORIGIN')]
        [string] $Redirect,

        [Parameter()]
        [string] $RedirectURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Reuse,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $Rhistate,

        [Parameter(Mandatory)]
        [ValidateSet('HTTP', 'SSL', 'NNTP', 'HDX')]
        [string] $ServiceType,

        [Parameter()]
        [int] $SoPersistenceTimeout,

        [Parameter()]
        [int] $SoThreshold,

        [Parameter()]
        [string] $Srcipexpr,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $TCPProbePort,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UseoriginipPortForcache,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $UsePortRange,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Via,

        [Parameter()]
        [string] $WASMModule,

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
    if ($PSBoundParameters.ContainsKey('Arp')) { $properties['arp'] = $Arp }
    if ($PSBoundParameters.ContainsKey('BackendSSL')) { $properties['backendssl'] = $BackendSSL }
    if ($PSBoundParameters.ContainsKey('BackupVServer')) { $properties['backupvserver'] = $BackupVServer }
    if ($PSBoundParameters.ContainsKey('CacheType')) { $properties['cachetype'] = $CacheType }
    if ($PSBoundParameters.ContainsKey('CacheVServer')) { $properties['cachevserver'] = $CacheVServer }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('DestinationVServer')) { $properties['destinationvserver'] = $DestinationVServer }
    if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $properties['disableprimaryondown'] = $DisablePrimaryOnDown }
    if ($PSBoundParameters.ContainsKey('DisallowServiceAccess')) { $properties['disallowserviceaccess'] = $DisallowServiceAccess }
    if ($PSBoundParameters.ContainsKey('DNSVServerName')) { $properties['dnsvservername'] = $DNSVServerName }
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('FormAt')) { $properties['format'] = $FormAt }
    if ($PSBoundParameters.ContainsKey('GHost')) { $properties['ghost'] = $GHost }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('ICMPVsrResponse')) { $properties['icmpvsrresponse'] = $ICMPVsrResponse }
    if ($PSBoundParameters.ContainsKey('IPSet')) { $properties['ipset'] = $IPSet }
    if ($PSBoundParameters.ContainsKey('IPv46')) { $properties['ipv46'] = $IPv46 }
    if ($PSBoundParameters.ContainsKey('L2Conn')) { $properties['l2conn'] = $L2Conn }
    if ($PSBoundParameters.ContainsKey('ListenPolicy')) { $properties['listenpolicy'] = $ListenPolicy }
    if ($PSBoundParameters.ContainsKey('ListenPriority')) { $properties['listenpriority'] = $ListenPriority }
    if ($PSBoundParameters.ContainsKey('Map')) { $properties['map'] = $Map }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('OnPolicyMatch')) { $properties['onpolicymatch'] = $OnPolicyMatch }
    if ($PSBoundParameters.ContainsKey('OriginuSIP')) { $properties['originusip'] = $OriginuSIP }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Precedence')) { $properties['precedence'] = $Precedence }
    if ($PSBoundParameters.ContainsKey('ProbePort')) { $properties['probeport'] = $ProbePort }
    if ($PSBoundParameters.ContainsKey('ProbeProtocol')) { $properties['probeprotocol'] = $ProbeProtocol }
    if ($PSBoundParameters.ContainsKey('ProbeSuccessResponseCode')) { $properties['probesuccessresponsecode'] = $ProbeSuccessResponseCode }
    if ($PSBoundParameters.ContainsKey('Range')) { $properties['range'] = $Range }
    if ($PSBoundParameters.ContainsKey('Redirect')) { $properties['redirect'] = $Redirect }
    if ($PSBoundParameters.ContainsKey('RedirectURL')) { $properties['redirecturl'] = $RedirectURL }
    if ($PSBoundParameters.ContainsKey('Reuse')) { $properties['reuse'] = $Reuse }
    if ($PSBoundParameters.ContainsKey('Rhistate')) { $properties['rhistate'] = $Rhistate }
    if ($PSBoundParameters.ContainsKey('ServiceType')) { $properties['servicetype'] = $ServiceType }
    if ($PSBoundParameters.ContainsKey('SoPersistenceTimeout')) { $properties['sopersistencetimeout'] = $SoPersistenceTimeout }
    if ($PSBoundParameters.ContainsKey('SoThreshold')) { $properties['sothreshold'] = $SoThreshold }
    if ($PSBoundParameters.ContainsKey('Srcipexpr')) { $properties['srcipexpr'] = $Srcipexpr }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('TCPProbePort')) { $properties['tcpprobeport'] = $TCPProbePort }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('UseoriginipPortForcache')) { $properties['useoriginipportforcache'] = $UseoriginipPortForcache }
    if ($PSBoundParameters.ContainsKey('UsePortRange')) { $properties['useportrange'] = $UsePortRange }
    if ($PSBoundParameters.ContainsKey('Via')) { $properties['via'] = $Via }
    if ($PSBoundParameters.ContainsKey('WASMModule')) { $properties['wasmmodule'] = $WASMModule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver -Payload @{ crvserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServer

# region Invoke-NSAddCRVServerAnalyticsProfileBinding
function Invoke-NSAddCRVServerAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to crvserver.
    .PARAMETER AnalyticsProfile
        Name of the analytics profile bound to the CR vserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSAddCRVServerAnalyticsProfileBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerAnalyticsProfileBinding -Name 'example' -WhatIf
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
        [string] $AnalyticsProfile,

        [Parameter(Mandatory, Position = 0)]
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

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AnalyticsProfile')) { $properties['analyticsprofile'] = $AnalyticsProfile }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_analyticsprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_analyticsprofile_binding -Payload @{ crvserver_analyticsprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerAnalyticsProfileBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerAnalyticsProfileBinding

# region Invoke-NSAddCRVServerAppFlowPolicyBinding
function Invoke-NSAddCRVServerAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerAppFlowPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerAppFlowPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_appflowpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_appflowpolicy_binding -Payload @{ crvserver_appflowpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerAppFlowPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerAppFlowPolicyBinding

# region Invoke-NSAddCRVServerAppFwPolicyBinding
function Invoke-NSAddCRVServerAppFwPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_appfwpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appfwpolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerAppFwPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerAppFwPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_appfwpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_appfwpolicy_binding -Payload @{ crvserver_appfwpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerAppFwPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerAppFwPolicyBinding

# region Invoke-NSAddCRVServerAppQoEPolicyBinding
function Invoke-NSAddCRVServerAppQoEPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_appqoepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appqoepolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerAppQoEPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerAppQoEPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_appqoepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_appqoepolicy_binding -Payload @{ crvserver_appqoepolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerAppQoEPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerAppQoEPolicyBinding

# region Invoke-NSAddCRVServerCachePolicyBinding
function Invoke-NSAddCRVServerCachePolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerCachePolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerCachePolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_cachepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_cachepolicy_binding -Payload @{ crvserver_cachepolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerCachePolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerCachePolicyBinding

# region Invoke-NSAddCRVServerCMPPolicyBinding
function Invoke-NSAddCRVServerCMPPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_cmppolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cmppolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerCMPPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerCMPPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_cmppolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_cmppolicy_binding -Payload @{ crvserver_cmppolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerCMPPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerCMPPolicyBinding

# region Invoke-NSAddCRVServerCRPolicyBinding
function Invoke-NSAddCRVServerCRPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_crpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the crpolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerCRPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerCRPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_crpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_crpolicy_binding -Payload @{ crvserver_crpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerCRPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerCRPolicyBinding

# region Invoke-NSAddCRVServerCSPolicyBinding
function Invoke-NSAddCRVServerCSPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_cspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        The CSW target server names.
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
        Invoke-NSAddCRVServerCSPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerCSPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_cspolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_cspolicy_binding -Payload @{ crvserver_cspolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerCSPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerCSPolicyBinding

# region Invoke-NSAddCRVServerFEOPolicyBinding
function Invoke-NSAddCRVServerFEOPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_feopolicy_binding resource.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerFEOPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerFEOPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_feopolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_feopolicy_binding -Payload @{ crvserver_feopolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerFEOPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerFEOPolicyBinding

# region Invoke-NSAddCRVServerICAPolicyBinding
function Invoke-NSAddCRVServerICAPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_icapolicy_binding resource.
    .DESCRIPTION
        Binding object showing the icapolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerICAPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerICAPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_icapolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_icapolicy_binding -Payload @{ crvserver_icapolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerICAPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerICAPolicyBinding

# region Invoke-NSAddCRVServerLBVServerBinding
function Invoke-NSAddCRVServerLBVServerBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_lbvserver_binding resource.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to crvserver.
    .PARAMETER LBVServer
        The Default target server name. Minimum length = 1
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSAddCRVServerLBVServerBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerLBVServerBinding -Name 'example' -WhatIf
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
        [string] $LBVServer,

        [Parameter(Mandatory, Position = 0)]
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

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('LBVServer')) { $properties['lbvserver'] = $LBVServer }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_lbvserver_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_lbvserver_binding -Payload @{ crvserver_lbvserver_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerLBVServerBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerLBVServerBinding

# region Invoke-NSAddCRVServerPolicyMapBinding
function Invoke-NSAddCRVServerPolicyMapBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_policymap_binding resource.
    .DESCRIPTION
        Binding object showing the policymap that can be bound to crvserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), b ut does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number incr ements by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        An unsigned integer that determines the priority of the policy relative to other policies bound to this cache redirection virtual server. The lower the value, higher the priority. Note: This option is available only when binding content switching, filtering, and compression policies to a cache redirection virtual server.
    .PARAMETER TargetVServer
        The CSW target server names.
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
        Invoke-NSAddCRVServerPolicyMapBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerPolicyMapBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_policymap_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_policymap_binding -Payload @{ crvserver_policymap_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerPolicyMapBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerPolicyMapBinding

# region Invoke-NSAddCRVServerResponderPolicyBinding
function Invoke-NSAddCRVServerResponderPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerResponderPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerResponderPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_responderpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_responderpolicy_binding -Payload @{ crvserver_responderpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerResponderPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerResponderPolicyBinding

# region Invoke-NSAddCRVServerRewritePolicyBinding
function Invoke-NSAddCRVServerRewritePolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_rewritepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the rewritepolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerRewritePolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerRewritePolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_rewritepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_rewritepolicy_binding -Payload @{ crvserver_rewritepolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerRewritePolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerRewritePolicyBinding

# region Invoke-NSAddCRVServerSpilloverPolicyBinding
function Invoke-NSAddCRVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler crvserver_spilloverpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to crvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which content is forwarded. Applicable only if the policy is a map policy and the cache redirection virtual server is of type REVERSE. Minimum length = 1
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
        Invoke-NSAddCRVServerSpilloverPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCRVServerSpilloverPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
        [string] $GotoPriorityExpression,

        [Parameter()]
        [bool] $Invoke,

        [Parameter()]
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('reqvserver', 'resvserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $PolicyName,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [string] $TargetVServer,

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
    if ($PSBoundParameters.ContainsKey('Bindpoint')) { $properties['bindpoint'] = $Bindpoint }
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create crvserver_spilloverpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver_spilloverpolicy_binding -Payload @{ crvserver_spilloverpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServerSpilloverPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCRVServerSpilloverPolicyBinding

# region Invoke-NSDeleteCRPolicy
function Invoke-NSDeleteCRPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler crpolicy resource.
    .DESCRIPTION
        Configuration for cache redirection policy resource.
    .PARAMETER PolicyName
        Name for the cache redirection policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRPolicy -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRPolicy -PolicyName 'crpolicy_example' | Invoke-NSDeleteCRPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Delete crpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crpolicy -Resource $PolicyName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRPolicy

# region Invoke-NSDeleteCRVServer
function Invoke-NSDeleteCRVServer {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver resource.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServer -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServer -Name 'crvserver_example' | Invoke-NSDeleteCRVServer -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServer

# region Invoke-NSDeleteCRVServerAnalyticsProfileBinding
function Invoke-NSDeleteCRVServerAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER AnalyticsProfile
        Name of the analytics profile bound to the CR vserver.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerAnalyticsProfileBinding -Name 'example' -AnalyticsProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerAnalyticsProfileBinding -Name 'crvserver_analyticsprofile_binding_example' | Invoke-NSDeleteCRVServerAnalyticsProfileBinding -Confirm:$false
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
        [string] $AnalyticsProfile,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('AnalyticsProfile')) {
            $argumentParts += 'analyticsprofile:' + $AnalyticsProfile
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_analyticsprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_analyticsprofile_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerAnalyticsProfileBinding

# region Invoke-NSDeleteCRVServerAppFlowPolicyBinding
function Invoke-NSDeleteCRVServerAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerAppFlowPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerAppFlowPolicyBinding -Name 'crvserver_appflowpolicy_binding_example' | Invoke-NSDeleteCRVServerAppFlowPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_appflowpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_appflowpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerAppFlowPolicyBinding

# region Invoke-NSDeleteCRVServerAppFwPolicyBinding
function Invoke-NSDeleteCRVServerAppFwPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_appfwpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appfwpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerAppFwPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerAppFwPolicyBinding -Name 'crvserver_appfwpolicy_binding_example' | Invoke-NSDeleteCRVServerAppFwPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_appfwpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_appfwpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerAppFwPolicyBinding

# region Invoke-NSDeleteCRVServerAppQoEPolicyBinding
function Invoke-NSDeleteCRVServerAppQoEPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_appqoepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appqoepolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerAppQoEPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerAppQoEPolicyBinding -Name 'crvserver_appqoepolicy_binding_example' | Invoke-NSDeleteCRVServerAppQoEPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_appqoepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_appqoepolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerAppQoEPolicyBinding

# region Invoke-NSDeleteCRVServerCachePolicyBinding
function Invoke-NSDeleteCRVServerCachePolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerCachePolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerCachePolicyBinding -Name 'crvserver_cachepolicy_binding_example' | Invoke-NSDeleteCRVServerCachePolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_cachepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_cachepolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerCachePolicyBinding

# region Invoke-NSDeleteCRVServerCMPPolicyBinding
function Invoke-NSDeleteCRVServerCMPPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_cmppolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cmppolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerCMPPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerCMPPolicyBinding -Name 'crvserver_cmppolicy_binding_example' | Invoke-NSDeleteCRVServerCMPPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_cmppolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_cmppolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerCMPPolicyBinding

# region Invoke-NSDeleteCRVServerCRPolicyBinding
function Invoke-NSDeleteCRVServerCRPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_crpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the crpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerCRPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerCRPolicyBinding -Name 'crvserver_crpolicy_binding_example' | Invoke-NSDeleteCRVServerCRPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_crpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_crpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerCRPolicyBinding

# region Invoke-NSDeleteCRVServerCSPolicyBinding
function Invoke-NSDeleteCRVServerCSPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_cspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerCSPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerCSPolicyBinding -Name 'crvserver_cspolicy_binding_example' | Invoke-NSDeleteCRVServerCSPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_cspolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_cspolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerCSPolicyBinding

# region Invoke-NSDeleteCRVServerFEOPolicyBinding
function Invoke-NSDeleteCRVServerFEOPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_feopolicy_binding resource.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerFEOPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerFEOPolicyBinding -Name 'crvserver_feopolicy_binding_example' | Invoke-NSDeleteCRVServerFEOPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_feopolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_feopolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerFEOPolicyBinding

# region Invoke-NSDeleteCRVServerICAPolicyBinding
function Invoke-NSDeleteCRVServerICAPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_icapolicy_binding resource.
    .DESCRIPTION
        Binding object showing the icapolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerICAPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerICAPolicyBinding -Name 'crvserver_icapolicy_binding_example' | Invoke-NSDeleteCRVServerICAPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_icapolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_icapolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerICAPolicyBinding

# region Invoke-NSDeleteCRVServerLBVServerBinding
function Invoke-NSDeleteCRVServerLBVServerBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_lbvserver_binding resource.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER LBVServer
        The Default target server name. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerLBVServerBinding -Name 'example' -LBVServer 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerLBVServerBinding -Name 'crvserver_lbvserver_binding_example' | Invoke-NSDeleteCRVServerLBVServerBinding -Confirm:$false
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
        [string] $LBVServer,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('LBVServer')) {
            $argumentParts += 'lbvserver:' + $LBVServer
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_lbvserver_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_lbvserver_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerLBVServerBinding

# region Invoke-NSDeleteCRVServerPolicyMapBinding
function Invoke-NSDeleteCRVServerPolicyMapBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_policymap_binding resource.
    .DESCRIPTION
        Binding object showing the policymap that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        An unsigned integer that determines the priority of the policy relative to other policies bound to this cache redirection virtual server. The lower the value, higher the priority. Note: This option is available only when binding content switching, filtering, and compression policies to a cache redirection virtual server.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerPolicyMapBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerPolicyMapBinding -Name 'crvserver_policymap_binding_example' | Invoke-NSDeleteCRVServerPolicyMapBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_policymap_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_policymap_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerPolicyMapBinding

# region Invoke-NSDeleteCRVServerResponderPolicyBinding
function Invoke-NSDeleteCRVServerResponderPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        For a rewrite policy, the bind point to which to bind the policy. Note: This parameter applies only to rewrite policies, because content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerResponderPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerResponderPolicyBinding -Name 'crvserver_responderpolicy_binding_example' | Invoke-NSDeleteCRVServerResponderPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_responderpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_responderpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerResponderPolicyBinding

# region Invoke-NSDeleteCRVServerRewritePolicyBinding
function Invoke-NSDeleteCRVServerRewritePolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_rewritepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the rewritepolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerRewritePolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerRewritePolicyBinding -Name 'crvserver_rewritepolicy_binding_example' | Invoke-NSDeleteCRVServerRewritePolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_rewritepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_rewritepolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerRewritePolicyBinding

# region Invoke-NSDeleteCRVServerSpilloverPolicyBinding
function Invoke-NSDeleteCRVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler crvserver_spilloverpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST
    .PARAMETER Priority
        The priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCRVServerSpilloverPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCRVServerSpilloverPolicyBinding -Name 'crvserver_spilloverpolicy_binding_example' | Invoke-NSDeleteCRVServerSpilloverPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST')]
        [string] $Bindpoint,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Bindpoint')) {
            $argumentParts += 'bindpoint:' + $Bindpoint
        }
        if ($PSBoundParameters.ContainsKey('Priority')) {
            $argumentParts += 'priority:' + $Priority
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete crvserver_spilloverpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type crvserver_spilloverpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCRVServerSpilloverPolicyBinding

# region Invoke-NSDisableCRVServer
function Invoke-NSDisableCRVServer {
    <#
    .SYNOPSIS
        Disables a NetScaler crvserver resource.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
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
        Invoke-NSDisableCRVServer -Name 'crvserver_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Disable crvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver -Action disable -Payload @{ crvserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetCRVServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableCRVServer

# region Invoke-NSEnableCRVServer
function Invoke-NSEnableCRVServer {
    <#
    .SYNOPSIS
        Enables a NetScaler crvserver resource.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
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
        Invoke-NSEnableCRVServer -Name 'crvserver_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Enable crvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver -Action enable -Payload @{ crvserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetCRVServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableCRVServer

# region Invoke-NSGetCRAction
function Invoke-NSGetCRAction {
    <#
    .SYNOPSIS
        Gets NetScaler craction configuration.
    .DESCRIPTION
        Configuration for cache redirection action resource.
    .PARAMETER Name
        Name of the action for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetCRAction
    .EXAMPLE
        Invoke-NSGetCRAction -Name 'craction_example'
    .EXAMPLE
        Invoke-NSGetCRAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'craction'
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
# endregion Invoke-NSGetCRAction

# region Invoke-NSGetCRPolicy
function Invoke-NSGetCRPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler crpolicy configuration.
    .DESCRIPTION
        Configuration for cache redirection policy resource.
    .PARAMETER PolicyName
        Name for the cache redirection policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
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
        Invoke-NSGetCRPolicy
    .EXAMPLE
        Invoke-NSGetCRPolicy -PolicyName 'crpolicy_example'
    .EXAMPLE
        Invoke-NSGetCRPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crpolicy'
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
# endregion Invoke-NSGetCRPolicy

# region Invoke-NSGetCRPolicyBinding
function Invoke-NSGetCRPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to crpolicy.
    .PARAMETER PolicyName
        Name of the cache redirection policy to display. If this parameter is omitted, details of all the policies are displayed. Minimum length = 1
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
        Invoke-NSGetCRPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRPolicyBinding -PolicyName 'crpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crpolicy_binding'
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
# endregion Invoke-NSGetCRPolicyBinding

# region Invoke-NSGetCRPolicyCRVServerBinding
function Invoke-NSGetCRPolicyCRVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crpolicy_crvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the crvserver that can be bound to crpolicy.
    .PARAMETER PolicyName
        Name of the cache redirection policy to display. If this parameter is omitted, details of all the policies are displayed. Minimum length = 1
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
        Invoke-NSGetCRPolicyCRVServerBinding
    .EXAMPLE
        Invoke-NSGetCRPolicyCRVServerBinding -PolicyName 'crpolicy_crvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCRPolicyCRVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crpolicy_crvserver_binding'
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
# endregion Invoke-NSGetCRPolicyCRVServerBinding

# region Invoke-NSGetCRVServer
function Invoke-NSGetCRVServer {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver configuration.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
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
        Invoke-NSGetCRVServer
    .EXAMPLE
        Invoke-NSGetCRVServer -Name 'crvserver_example'
    .EXAMPLE
        Invoke-NSGetCRVServer -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver'
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
# endregion Invoke-NSGetCRVServer

# region Invoke-NSGetCRVServerAnalyticsProfileBinding
function Invoke-NSGetCRVServerAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_analyticsprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerAnalyticsProfileBinding
    .EXAMPLE
        Invoke-NSGetCRVServerAnalyticsProfileBinding -Name 'crvserver_analyticsprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerAnalyticsProfileBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_analyticsprofile_binding'
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
# endregion Invoke-NSGetCRVServerAnalyticsProfileBinding

# region Invoke-NSGetCRVServerAppFlowPolicyBinding
function Invoke-NSGetCRVServerAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_appflowpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerAppFlowPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerAppFlowPolicyBinding -Name 'crvserver_appflowpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerAppFlowPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_appflowpolicy_binding'
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
# endregion Invoke-NSGetCRVServerAppFlowPolicyBinding

# region Invoke-NSGetCRVServerAppFwPolicyBinding
function Invoke-NSGetCRVServerAppFwPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_appfwpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appfwpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerAppFwPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerAppFwPolicyBinding -Name 'crvserver_appfwpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerAppFwPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_appfwpolicy_binding'
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
# endregion Invoke-NSGetCRVServerAppFwPolicyBinding

# region Invoke-NSGetCRVServerAppQoEPolicyBinding
function Invoke-NSGetCRVServerAppQoEPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_appqoepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appqoepolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerAppQoEPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerAppQoEPolicyBinding -Name 'crvserver_appqoepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerAppQoEPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_appqoepolicy_binding'
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
# endregion Invoke-NSGetCRVServerAppQoEPolicyBinding

# region Invoke-NSGetCRVServerBinding
function Invoke-NSGetCRVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to crvserver.
    .PARAMETER Name
        Name of a cache redirection virtual server about which to display detailed information. Minimum length = 1
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
        Invoke-NSGetCRVServerBinding
    .EXAMPLE
        Invoke-NSGetCRVServerBinding -Name 'crvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_binding'
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
# endregion Invoke-NSGetCRVServerBinding

# region Invoke-NSGetCRVServerCachePolicyBinding
function Invoke-NSGetCRVServerCachePolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_cachepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerCachePolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerCachePolicyBinding -Name 'crvserver_cachepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerCachePolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_cachepolicy_binding'
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
# endregion Invoke-NSGetCRVServerCachePolicyBinding

# region Invoke-NSGetCRVServerCMPPolicyBinding
function Invoke-NSGetCRVServerCMPPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_cmppolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cmppolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerCMPPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerCMPPolicyBinding -Name 'crvserver_cmppolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerCMPPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_cmppolicy_binding'
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
# endregion Invoke-NSGetCRVServerCMPPolicyBinding

# region Invoke-NSGetCRVServerCRPolicyBinding
function Invoke-NSGetCRVServerCRPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_crpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the crpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerCRPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerCRPolicyBinding -Name 'crvserver_crpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerCRPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_crpolicy_binding'
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
# endregion Invoke-NSGetCRVServerCRPolicyBinding

# region Invoke-NSGetCRVServerCSPolicyBinding
function Invoke-NSGetCRVServerCSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_cspolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerCSPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerCSPolicyBinding -Name 'crvserver_cspolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerCSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_cspolicy_binding'
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
# endregion Invoke-NSGetCRVServerCSPolicyBinding

# region Invoke-NSGetCRVServerFEOPolicyBinding
function Invoke-NSGetCRVServerFEOPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_feopolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerFEOPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerFEOPolicyBinding -Name 'crvserver_feopolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerFEOPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_feopolicy_binding'
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
# endregion Invoke-NSGetCRVServerFEOPolicyBinding

# region Invoke-NSGetCRVServerICAPolicyBinding
function Invoke-NSGetCRVServerICAPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_icapolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the icapolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerICAPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerICAPolicyBinding -Name 'crvserver_icapolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerICAPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_icapolicy_binding'
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
# endregion Invoke-NSGetCRVServerICAPolicyBinding

# region Invoke-NSGetCRVServerLBVServerBinding
function Invoke-NSGetCRVServerLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerLBVServerBinding
    .EXAMPLE
        Invoke-NSGetCRVServerLBVServerBinding -Name 'crvserver_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_lbvserver_binding'
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
# endregion Invoke-NSGetCRVServerLBVServerBinding

# region Invoke-NSGetCRVServerPolicyMapBinding
function Invoke-NSGetCRVServerPolicyMapBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_policymap_binding configuration.
    .DESCRIPTION
        Binding object showing the policymap that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerPolicyMapBinding
    .EXAMPLE
        Invoke-NSGetCRVServerPolicyMapBinding -Name 'crvserver_policymap_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerPolicyMapBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_policymap_binding'
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
# endregion Invoke-NSGetCRVServerPolicyMapBinding

# region Invoke-NSGetCRVServerResponderPolicyBinding
function Invoke-NSGetCRVServerResponderPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_responderpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerResponderPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerResponderPolicyBinding -Name 'crvserver_responderpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerResponderPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_responderpolicy_binding'
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
# endregion Invoke-NSGetCRVServerResponderPolicyBinding

# region Invoke-NSGetCRVServerRewritePolicyBinding
function Invoke-NSGetCRVServerRewritePolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_rewritepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the rewritepolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerRewritePolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerRewritePolicyBinding -Name 'crvserver_rewritepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerRewritePolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_rewritepolicy_binding'
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
# endregion Invoke-NSGetCRVServerRewritePolicyBinding

# region Invoke-NSGetCRVServerSpilloverPolicyBinding
function Invoke-NSGetCRVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler crvserver_spilloverpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to crvserver.
    .PARAMETER Name
        Name of the cache redirection virtual server to which to bind the cache redirection policy. Minimum length = 1
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
        Invoke-NSGetCRVServerSpilloverPolicyBinding
    .EXAMPLE
        Invoke-NSGetCRVServerSpilloverPolicyBinding -Name 'crvserver_spilloverpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCRVServerSpilloverPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'crvserver_spilloverpolicy_binding'
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
# endregion Invoke-NSGetCRVServerSpilloverPolicyBinding

# region Invoke-NSRenameCRPolicy
function Invoke-NSRenameCRPolicy {
    <#
    .SYNOPSIS
        Renames a NetScaler crpolicy resource.
    .DESCRIPTION
        Configuration for cache redirection policy resource.
    .PARAMETER PolicyName
        Name for the cache redirection policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER NewName
        The new name of the content switching policy. Minimum length = 1
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
        Invoke-NSRenameCRPolicy -PolicyName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCRPolicy -PolicyName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Rename crpolicy')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crpolicy -Action rename -Payload @{ crpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCRPolicy -PolicyName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCRPolicy

# region Invoke-NSRenameCRVServer
function Invoke-NSRenameCRVServer {
    <#
    .SYNOPSIS
        Renames a NetScaler crvserver resource.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
    .PARAMETER NewName
        New name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my name" or 'my name'). Minimum length = 1
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
        Invoke-NSRenameCRVServer -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCRVServer -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename crvserver')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver -Action rename -Payload @{ crvserver = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCRVServer -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCRVServer

# region Invoke-NSUnsetCRPolicy
function Invoke-NSUnsetCRPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler crpolicy resource properties.
    .DESCRIPTION
        Configuration for cache redirection policy resource.
    .PARAMETER PolicyName
        Name for the cache redirection policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER LogAction
        The log action associated with the cache redirection policy.
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
        Invoke-NSUnsetCRPolicy -PolicyName 'example' -LogAction  -PassThru
    .EXAMPLE
        Invoke-NSUnsetCRPolicy -PolicyName 'example' -LogAction  -WhatIf
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

        $body = @{ policyname = $PolicyName }
        if ($PSBoundParameters.ContainsKey('LogAction')) { $body['logaction'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Clear crpolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crpolicy -Action unset -Payload @{ crpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCRPolicy -PolicyName $PolicyName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCRPolicy

# region Invoke-NSUnsetCRVServer
function Invoke-NSUnsetCRVServer {
    <#
    .SYNOPSIS
        Clears one or more NetScaler crvserver resource properties.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Arp
        Use ARP to determine the destination MAC address. Possible values = ON, OFF
    .PARAMETER BackendSSL
        Decides whether the backend connection made by Citrix ADC to the origin server will be HTTP or SSL. Applicable only for SSL type CR Forward proxy vserver. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER BackupVServer
        Name of the backup virtual server to which traffic is forwarded if the active server becomes unavailable. Minimum length = 1
    .PARAMETER CacheVServer
        Name of the default cache virtual server to which to redirect requests (the default target of the cache redirection virtual server). Minimum length = 1
    .PARAMETER CltTimeout
        Time-out value, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Comments associated with this virtual server. Maximum length = 256
    .PARAMETER DestinationVServer
        Destination virtual server for a transparent or forward proxy cache redirection virtual server. Minimum length = 1
    .PARAMETER DisablePrimaryOnDown
        Continue sending traffic to a backup virtual server even after the primary virtual server comes UP from the DOWN state. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DisallowServiceAccess
        This is effective when a FORWARD type cr vserver is added. By default, this parameter is DISABLED. When it is ENABLED, backend services cannot be accessed through a FORWARD type cr vserver. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSVServerName
        Name of the DNS virtual server that resolves domain names arriving at the forward proxy virtual server. Note: This parameter applies only to forward proxy virtual servers, not reverse or transparent. Minimum length = 1
    .PARAMETER Domain
        Default domain for reverse proxies. Domains are configured to direct an incoming request from a specified source domain to a specified target domain. There can be several configured pairs of source and target domains. You can select one pair to be the default. If the host header or URL of an incoming request does not include a source domain, this option sends the request to the specified target domain. Minimum length = 1
    .PARAMETER DownStateFlush
        Perform delayed cleanup of connections to this virtual server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPProfileName
        Name of the profile containing HTTP configuration information for cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER ICMPVsrResponse
        Criterion for responding to PING requests sent to this virtual server. If ACTIVE, respond only if the virtual server is available. If PASSIVE, respond even if the virtual server is not available. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER IPSet
        The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cr vserver. Minimum length = 1
    .PARAMETER L2Conn
        Use L2 parameters, such as MAC, VLAN, and channel to identify a connection. Possible values = ON, OFF
    .PARAMETER ListenPolicy
        String specifying the listen policy for the cache redirection virtual server. Can be either an in-line expression or the name of a named expression. Default value: "NONE"
    .PARAMETER ListenPriority
        Priority of the listen policy specified by the Listen Policy parameter. The lower the number, higher the priority. Default value: 101 Minimum value = 0 Maximum value = 100
    .PARAMETER NetProfile
        Name of the network profile containing network configurations for the cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER OnPolicyMatch
        Redirect requests that match the policy to either the cache or the origin server, as specified. Note: For this option to work, you must set the cache redirection type to POLICY. Default value: ORIGIN Possible values = CACHE, ORIGIN
    .PARAMETER OriginuSIP
        Use the client's IP address as the source IP address in requests sent to the origin server. Note: You can enable this parameter to implement fully transparent CR deployment. Possible values = ON, OFF
    .PARAMETER Precedence
        Type of policy (URL or RULE) that takes precedence on the cache redirection virtual server. Applies only to cache redirection virtual servers that have both URL and RULE based policies. If you specify URL, URL based policies are applied first, in the following order: 1. Domain and exact URL 2. Domain, prefix and suffix 3. Domain and suffix 4. Domain and prefix 5. Domain only 6. Exact URL 7. Prefix and suffix 8. Suffix only 9. Prefix only 10. Default If you specify RULE, the rule based policies are applied before URL based policies are applied. Default value: RULE Possible values = RULE, URL
    .PARAMETER ProbeProtocol
        Citrix ADC provides support for external health check of the vserver status. Select HTTP or TCP probes for healthcheck. Possible values = TCP, HTTP
    .PARAMETER ProbeSuccessResponseCode
        HTTP code to return in SUCCESS case. Default value: "200 OK" Minimum length = 1 Maximum length = 64
    .PARAMETER Redirect
        Type of cache server to which to redirect HTTP requests. Available settings function as follows: * CACHE - Direct all requests to the cache. * POLICY - Apply the cache redirection policy to determine whether the request should be directed to the cache or to the origin. * ORIGIN - Direct all requests to the origin server. Default value: POLICY Possible values = CACHE, POLICY, ORIGIN
    .PARAMETER RedirectURL
        URL of the server to which to redirect traffic if the cache redirection virtual server configured on the Citrix ADC becomes unavailable. Minimum length = 1 Maximum length = 128
    .PARAMETER Reuse
        Reuse TCP connections to the origin server across client connections. Do not set this parameter unless the Service Type parameter is set to HTTP. If you set this parameter to OFF, the possible settings of the Redirect parameter function as follows: * CACHE - TCP connections to the cache servers are not reused. * ORIGIN - TCP connections to the origin servers are not reused. * POLICY - TCP connections to the origin servers are not reused. If you set the Reuse parameter to ON, connections to origin servers and connections to cache servers are reused. Default value: ON Possible values = ON, OFF
    .PARAMETER Rhistate
        A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute. * If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP. * If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER Srcipexpr
        Expression used to extract the source IP addresses from the requests originating from the cache. Can be either an in-line expression or the name of a named expression. Minimum length = 1 Maximum length = 1500
    .PARAMETER TCPProbePort
        Port number for external TCP probe. NetScaler provides support for external TCP health check of the vserver status over the selected port. This option is only supported for vservers assigned with an IPAddress or ipset. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER TCPProfileName
        Name of the profile containing TCP configuration information for the cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER UseoriginipPortForcache
        Use origin ip/port while forwarding request to the cache. Change the destination IP, destination port of the request came to CR vserver to Origin IP and Origin Port and forward it to Cache. Default value: NO Possible values = YES, NO
    .PARAMETER UsePortRange
        Use a port number from the port range (set by using the set ns param command, or in the Create Virtual Server (Cache Redirection) dialog box) as the source port in the requests sent to the origin server. Default value: OFF Possible values = ON, OFF
    .PARAMETER Via
        Insert a via header in each HTTP request. In the case of a cache miss, the request is redirected from the cache server to the origin server. This header indicates whether the request is being sent from a cache server. Default value: ON Possible values = ON, OFF
    .PARAMETER WASMModule
        Name of the WASM module to assign to this virtual server.
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
        Invoke-NSUnsetCRVServer -Name 'example' -AppFlowLog ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetCRVServer -Name 'example' -AppFlowLog ENABLED -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [switch] $Arp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $BackendSSL,

        [Parameter()]
        [switch] $BackupVServer,

        [Parameter()]
        [switch] $CacheVServer,

        [Parameter()]
        [switch] $CltTimeout,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [switch] $DestinationVServer,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DisablePrimaryOnDown,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DisallowServiceAccess,

        [Parameter()]
        [switch] $DNSVServerName,

        [Parameter()]
        [switch] $Domain,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DownStateFlush,

        [Parameter()]
        [switch] $HTTPProfileName,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [switch] $ICMPVsrResponse,

        [Parameter()]
        [switch] $IPSet,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $L2Conn,

        [Parameter()]
        [switch] $ListenPolicy,

        [Parameter()]
        [switch] $ListenPriority,

        [Parameter()]
        [switch] $NetProfile,

        [Parameter()]
        [ValidateSet('CACHE', 'ORIGIN')]
        [switch] $OnPolicyMatch,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $OriginuSIP,

        [Parameter()]
        [ValidateSet('RULE', 'URL')]
        [switch] $Precedence,

        [Parameter()]
        [ValidateSet('TCP', 'HTTP')]
        [switch] $ProbeProtocol,

        [Parameter()]
        [switch] $ProbeSuccessResponseCode,

        [Parameter()]
        [ValidateSet('CACHE', 'POLICY', 'ORIGIN')]
        [switch] $Redirect,

        [Parameter()]
        [switch] $RedirectURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Reuse,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [switch] $Rhistate,

        [Parameter()]
        [switch] $Srcipexpr,

        [Parameter()]
        [switch] $TCPProbePort,

        [Parameter()]
        [switch] $TCPProfileName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $UseoriginipPortForcache,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $UsePortRange,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Via,

        [Parameter()]
        [switch] $WASMModule,

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
        if ($PSBoundParameters.ContainsKey('Arp')) { $body['arp'] = $true }
        if ($PSBoundParameters.ContainsKey('BackendSSL')) { $body['backendssl'] = $true }
        if ($PSBoundParameters.ContainsKey('BackupVServer')) { $body['backupvserver'] = $true }
        if ($PSBoundParameters.ContainsKey('CacheVServer')) { $body['cachevserver'] = $true }
        if ($PSBoundParameters.ContainsKey('CltTimeout')) { $body['clttimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('DestinationVServer')) { $body['destinationvserver'] = $true }
        if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $body['disableprimaryondown'] = $true }
        if ($PSBoundParameters.ContainsKey('DisallowServiceAccess')) { $body['disallowserviceaccess'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSVServerName')) { $body['dnsvservername'] = $true }
        if ($PSBoundParameters.ContainsKey('Domain')) { $body['domain'] = $true }
        if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $body['downstateflush'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $body['httpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('ICMPVsrResponse')) { $body['icmpvsrresponse'] = $true }
        if ($PSBoundParameters.ContainsKey('IPSet')) { $body['ipset'] = $true }
        if ($PSBoundParameters.ContainsKey('L2Conn')) { $body['l2conn'] = $true }
        if ($PSBoundParameters.ContainsKey('ListenPolicy')) { $body['listenpolicy'] = $true }
        if ($PSBoundParameters.ContainsKey('ListenPriority')) { $body['listenpriority'] = $true }
        if ($PSBoundParameters.ContainsKey('NetProfile')) { $body['netprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('OnPolicyMatch')) { $body['onpolicymatch'] = $true }
        if ($PSBoundParameters.ContainsKey('OriginuSIP')) { $body['originusip'] = $true }
        if ($PSBoundParameters.ContainsKey('Precedence')) { $body['precedence'] = $true }
        if ($PSBoundParameters.ContainsKey('ProbeProtocol')) { $body['probeprotocol'] = $true }
        if ($PSBoundParameters.ContainsKey('ProbeSuccessResponseCode')) { $body['probesuccessresponsecode'] = $true }
        if ($PSBoundParameters.ContainsKey('Redirect')) { $body['redirect'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectURL')) { $body['redirecturl'] = $true }
        if ($PSBoundParameters.ContainsKey('Reuse')) { $body['reuse'] = $true }
        if ($PSBoundParameters.ContainsKey('Rhistate')) { $body['rhistate'] = $true }
        if ($PSBoundParameters.ContainsKey('Srcipexpr')) { $body['srcipexpr'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProbePort')) { $body['tcpprobeport'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $body['tcpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('UseoriginipPortForcache')) { $body['useoriginipportforcache'] = $true }
        if ($PSBoundParameters.ContainsKey('UsePortRange')) { $body['useportrange'] = $true }
        if ($PSBoundParameters.ContainsKey('Via')) { $body['via'] = $true }
        if ($PSBoundParameters.ContainsKey('WASMModule')) { $body['wasmmodule'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear crvserver properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type crvserver -Action unset -Payload @{ crvserver = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCRVServer -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCRVServer

# region Invoke-NSUpdateCRPolicy
function Invoke-NSUpdateCRPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler crpolicy resource.
    .DESCRIPTION
        Configuration for cache redirection policy resource.
    .PARAMETER Action
        Name of the built-in cache redirection action: CACHE/ORIGIN.
    .PARAMETER LogAction
        The log action associated with the cache redirection policy.
    .PARAMETER PolicyName
        Name for the cache redirection policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Expression, or name of a named expression, against which traffic is evaluated. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
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
        Invoke-NSUpdateCRPolicy -PolicyName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCRPolicy -PolicyName 'example' -WhatIf
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
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $PolicyName,

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
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$PolicyName", 'Update crpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type crpolicy -Payload @{ crpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRPolicy -PolicyName $PolicyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCRPolicy

# region Invoke-NSUpdateCRVServer
function Invoke-NSUpdateCRVServer {
    <#
    .SYNOPSIS
        Updates a NetScaler crvserver resource.
    .DESCRIPTION
        Configuration for CR virtual server resource.
    .PARAMETER AppFlowLog
        Enable logging of AppFlow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Arp
        Use ARP to determine the destination MAC address. Possible values = ON, OFF
    .PARAMETER BackendSSL
        Decides whether the backend connection made by Citrix ADC to the origin server will be HTTP or SSL. Applicable only for SSL type CR Forward proxy vserver. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER BackupVServer
        Name of the backup virtual server to which traffic is forwarded if the active server becomes unavailable. Minimum length = 1
    .PARAMETER CacheVServer
        Name of the default cache virtual server to which to redirect requests (the default target of the cache redirection virtual server). Minimum length = 1
    .PARAMETER CltTimeout
        Time-out value, in seconds, after which to terminate an idle client connection. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Comments associated with this virtual server. Maximum length = 256
    .PARAMETER DestinationVServer
        Destination virtual server for a transparent or forward proxy cache redirection virtual server. Minimum length = 1
    .PARAMETER DisablePrimaryOnDown
        Continue sending traffic to a backup virtual server even after the primary virtual server comes UP from the DOWN state. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DisallowServiceAccess
        This is effective when a FORWARD type cr vserver is added. By default, this parameter is DISABLED. When it is ENABLED, backend services cannot be accessed through a FORWARD type cr vserver. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSVServerName
        Name of the DNS virtual server that resolves domain names arriving at the forward proxy virtual server. Note: This parameter applies only to forward proxy virtual servers, not reverse or transparent. Minimum length = 1
    .PARAMETER Domain
        Default domain for reverse proxies. Domains are configured to direct an incoming request from a specified source domain to a specified target domain. There can be several configured pairs of source and target domains. You can select one pair to be the default. If the host header or URL of an incoming request does not include a source domain, this option sends the request to the specified target domain. Minimum length = 1
    .PARAMETER DownStateFlush
        Perform delayed cleanup of connections to this virtual server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPProfileName
        Name of the profile containing HTTP configuration information for cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER ICMPVsrResponse
        Criterion for responding to PING requests sent to this virtual server. If ACTIVE, respond only if the virtual server is available. If PASSIVE, respond even if the virtual server is not available. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER IPSet
        The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cr vserver. Minimum length = 1
    .PARAMETER IPv46
        IPv4 or IPv6 address of the cache redirection virtual server. Usually a public IP address. Clients send connection requests to this IP address. Note: For a transparent cache redirection virtual server, use an asterisk (*) to specify a wildcard virtual server address.
    .PARAMETER L2Conn
        Use L2 parameters, such as MAC, VLAN, and channel to identify a connection. Possible values = ON, OFF
    .PARAMETER ListenPolicy
        String specifying the listen policy for the cache redirection virtual server. Can be either an in-line expression or the name of a named expression. Default value: "NONE"
    .PARAMETER ListenPriority
        Priority of the listen policy specified by the Listen Policy parameter. The lower the number, higher the priority. Default value: 101 Minimum value = 0 Maximum value = 100
    .PARAMETER Name
        Name for the cache redirection virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the cache redirection virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server'). Minimum length = 1
    .PARAMETER NetProfile
        Name of the network profile containing network configurations for the cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER OnPolicyMatch
        Redirect requests that match the policy to either the cache or the origin server, as specified. Note: For this option to work, you must set the cache redirection type to POLICY. Default value: ORIGIN Possible values = CACHE, ORIGIN
    .PARAMETER OriginuSIP
        Use the client's IP address as the source IP address in requests sent to the origin server. Note: You can enable this parameter to implement fully transparent CR deployment. Possible values = ON, OFF
    .PARAMETER Precedence
        Type of policy (URL or RULE) that takes precedence on the cache redirection virtual server. Applies only to cache redirection virtual servers that have both URL and RULE based policies. If you specify URL, URL based policies are applied first, in the following order: 1. Domain and exact URL 2. Domain, prefix and suffix 3. Domain and suffix 4. Domain and prefix 5. Domain only 6. Exact URL 7. Prefix and suffix 8. Suffix only 9. Prefix only 10. Default If you specify RULE, the rule based policies are applied before URL based policies are applied. Default value: RULE Possible values = RULE, URL
    .PARAMETER ProbePort
        Citrix ADC provides support for external health check of the vserver status. Select port for HTTP/TCP monitring. Default value: 0 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProbeProtocol
        Citrix ADC provides support for external health check of the vserver status. Select HTTP or TCP probes for healthcheck. Possible values = TCP, HTTP
    .PARAMETER ProbeSuccessResponseCode
        HTTP code to return in SUCCESS case. Default value: "200 OK" Minimum length = 1 Maximum length = 64
    .PARAMETER Redirect
        Type of cache server to which to redirect HTTP requests. Available settings function as follows: * CACHE - Direct all requests to the cache. * POLICY - Apply the cache redirection policy to determine whether the request should be directed to the cache or to the origin. * ORIGIN - Direct all requests to the origin server. Default value: POLICY Possible values = CACHE, POLICY, ORIGIN
    .PARAMETER RedirectURL
        URL of the server to which to redirect traffic if the cache redirection virtual server configured on the Citrix ADC becomes unavailable. Minimum length = 1 Maximum length = 128
    .PARAMETER Reuse
        Reuse TCP connections to the origin server across client connections. Do not set this parameter unless the Service Type parameter is set to HTTP. If you set this parameter to OFF, the possible settings of the Redirect parameter function as follows: * CACHE - TCP connections to the cache servers are not reused. * ORIGIN - TCP connections to the origin servers are not reused. * POLICY - TCP connections to the origin servers are not reused. If you set the Reuse parameter to ON, connections to origin servers and connections to cache servers are reused. Default value: ON Possible values = ON, OFF
    .PARAMETER Rhistate
        A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute. * If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP. * If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER Srcipexpr
        Expression used to extract the source IP addresses from the requests originating from the cache. Can be either an in-line expression or the name of a named expression. Minimum length = 1 Maximum length = 1500
    .PARAMETER TCPProbePort
        Port number for external TCP probe. NetScaler provides support for external TCP health check of the vserver status over the selected port. This option is only supported for vservers assigned with an IPAddress or ipset. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER TCPProfileName
        Name of the profile containing TCP configuration information for the cache redirection virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER UseoriginipPortForcache
        Use origin ip/port while forwarding request to the cache. Change the destination IP, destination port of the request came to CR vserver to Origin IP and Origin Port and forward it to Cache. Default value: NO Possible values = YES, NO
    .PARAMETER UsePortRange
        Use a port number from the port range (set by using the set ns param command, or in the Create Virtual Server (Cache Redirection) dialog box) as the source port in the requests sent to the origin server. Default value: OFF Possible values = ON, OFF
    .PARAMETER Via
        Insert a via header in each HTTP request. In the case of a cache miss, the request is redirected from the cache server to the origin server. This header indicates whether the request is being sent from a cache server. Default value: ON Possible values = ON, OFF
    .PARAMETER WASMModule
        Name of the WASM module to assign to this virtual server.
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
        Invoke-NSUpdateCRVServer -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCRVServer -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [string] $Arp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $BackendSSL,

        [Parameter()]
        [string] $BackupVServer,

        [Parameter()]
        [string] $CacheVServer,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $DestinationVServer,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisablePrimaryOnDown,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisallowServiceAccess,

        [Parameter()]
        [string] $DNSVServerName,

        [Parameter()]
        [string] $Domain,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $ICMPVsrResponse,

        [Parameter()]
        [string] $IPSet,

        [Parameter()]
        [string] $IPv46,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $L2Conn,

        [Parameter()]
        [string] $ListenPolicy,

        [Parameter()]
        [int] $ListenPriority,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [ValidateSet('CACHE', 'ORIGIN')]
        [string] $OnPolicyMatch,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $OriginuSIP,

        [Parameter()]
        [ValidateSet('RULE', 'URL')]
        [string] $Precedence,

        [Parameter()]
        [int] $ProbePort,

        [Parameter()]
        [ValidateSet('TCP', 'HTTP')]
        [string] $ProbeProtocol,

        [Parameter()]
        [string] $ProbeSuccessResponseCode,

        [Parameter()]
        [ValidateSet('CACHE', 'POLICY', 'ORIGIN')]
        [string] $Redirect,

        [Parameter()]
        [string] $RedirectURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Reuse,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $Rhistate,

        [Parameter()]
        [string] $Srcipexpr,

        [Parameter()]
        [int] $TCPProbePort,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UseoriginipPortForcache,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $UsePortRange,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Via,

        [Parameter()]
        [string] $WASMModule,

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
    if ($PSBoundParameters.ContainsKey('Arp')) { $properties['arp'] = $Arp }
    if ($PSBoundParameters.ContainsKey('BackendSSL')) { $properties['backendssl'] = $BackendSSL }
    if ($PSBoundParameters.ContainsKey('BackupVServer')) { $properties['backupvserver'] = $BackupVServer }
    if ($PSBoundParameters.ContainsKey('CacheVServer')) { $properties['cachevserver'] = $CacheVServer }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('DestinationVServer')) { $properties['destinationvserver'] = $DestinationVServer }
    if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $properties['disableprimaryondown'] = $DisablePrimaryOnDown }
    if ($PSBoundParameters.ContainsKey('DisallowServiceAccess')) { $properties['disallowserviceaccess'] = $DisallowServiceAccess }
    if ($PSBoundParameters.ContainsKey('DNSVServerName')) { $properties['dnsvservername'] = $DNSVServerName }
    if ($PSBoundParameters.ContainsKey('Domain')) { $properties['domain'] = $Domain }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('ICMPVsrResponse')) { $properties['icmpvsrresponse'] = $ICMPVsrResponse }
    if ($PSBoundParameters.ContainsKey('IPSet')) { $properties['ipset'] = $IPSet }
    if ($PSBoundParameters.ContainsKey('IPv46')) { $properties['ipv46'] = $IPv46 }
    if ($PSBoundParameters.ContainsKey('L2Conn')) { $properties['l2conn'] = $L2Conn }
    if ($PSBoundParameters.ContainsKey('ListenPolicy')) { $properties['listenpolicy'] = $ListenPolicy }
    if ($PSBoundParameters.ContainsKey('ListenPriority')) { $properties['listenpriority'] = $ListenPriority }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('OnPolicyMatch')) { $properties['onpolicymatch'] = $OnPolicyMatch }
    if ($PSBoundParameters.ContainsKey('OriginuSIP')) { $properties['originusip'] = $OriginuSIP }
    if ($PSBoundParameters.ContainsKey('Precedence')) { $properties['precedence'] = $Precedence }
    if ($PSBoundParameters.ContainsKey('ProbePort')) { $properties['probeport'] = $ProbePort }
    if ($PSBoundParameters.ContainsKey('ProbeProtocol')) { $properties['probeprotocol'] = $ProbeProtocol }
    if ($PSBoundParameters.ContainsKey('ProbeSuccessResponseCode')) { $properties['probesuccessresponsecode'] = $ProbeSuccessResponseCode }
    if ($PSBoundParameters.ContainsKey('Redirect')) { $properties['redirect'] = $Redirect }
    if ($PSBoundParameters.ContainsKey('RedirectURL')) { $properties['redirecturl'] = $RedirectURL }
    if ($PSBoundParameters.ContainsKey('Reuse')) { $properties['reuse'] = $Reuse }
    if ($PSBoundParameters.ContainsKey('Rhistate')) { $properties['rhistate'] = $Rhistate }
    if ($PSBoundParameters.ContainsKey('Srcipexpr')) { $properties['srcipexpr'] = $Srcipexpr }
    if ($PSBoundParameters.ContainsKey('TCPProbePort')) { $properties['tcpprobeport'] = $TCPProbePort }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('UseoriginipPortForcache')) { $properties['useoriginipportforcache'] = $UseoriginipPortForcache }
    if ($PSBoundParameters.ContainsKey('UsePortRange')) { $properties['useportrange'] = $UsePortRange }
    if ($PSBoundParameters.ContainsKey('Via')) { $properties['via'] = $Via }
    if ($PSBoundParameters.ContainsKey('WASMModule')) { $properties['wasmmodule'] = $WASMModule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update crvserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type crvserver -Payload @{ crvserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCRVServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCRVServer

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCSs3/NyHqiR1aQ
# WOPORQi78wj9ZDPdY4RfN9sGxPLnxqCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCB3NSlIrKh07B9UiOxpfEbs3L2V30VN33/dUVSpOKpP
# VDANBgkqhkiG9w0BAQEFAASCAYClNsEdB5gVK8MdR5co5FxCSS+qgHP3665CyYuN
# +hSdaBln5ofEllUDzetkOMU534msL3aAhs4A1VnB073cjKy5+ANKiomu/6nWC2S6
# yqLVXrWClLZPyjMc9kTf2iHiWF+lnkBGMu9Yr3TnFNK5XDyuJ4LK3SfzuObxPboa
# mJvLZNaftl88CL9zjZ4hUAdpCB2yOl+a1ZM61rVQTcRRDWY7KFkHYpNtQYQoNadz
# iGbyyNsA519+pROpy7l5aHyHBqL6FSCa5IlAd603r19NxtrbcUoudy+9Nsu8e5Qs
# JQ1VqqfnBHOKLrqCPPVvymBuVQ3bhQ4SniszBAYvlqBde/wblHvKHmEyqJzUC8QH
# tW3xEMJqHrU0LpNke6GKTTjWLEAPQpuJidfjO1wjN7qaiQRzA9g2PzQTT+LuGT0e
# 17H/G1udXXVaeGLBhz7odaQ2eNaKIafjlVVo02SrDvb0PzGnCKhskjR5+xJvUQCS
# cYn7WJP0WDeaLoeA9LTzgV1GKgGhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU0NTlaMD8GCSqGSIb3
# DQEJBDEyBDBpU34P9ycIWbMndcpmGt962Z8XBZgmDF9DcGAOeh5YVqSckK0EwMS/
# VrUcxM85ZakwDQYJKoZIhvcNAQEBBQAEggIAtvhLQTzFW88AKZYjEXGoXmvuPFps
# iVsXUB5PwooKIPbN8vzTuM6xBkUg0obEU6vUankFxvE2Z3Ueee86OLwtEN6URcgQ
# 2NpdqirC8Cv1h9ODAlp3VsFMlJ4CEcFju1FGJe77eKAIcPkUJnXdxwCbeib2lSkW
# 662tyP0lzb8Rx5ELsAtbHYM6QPnjaKAOBfjGOyfFD60d7Ezzv4Lqf8Aq/mnJy9rt
# sjL3dPOilA5nARMGespwgsXa7e2VRbNecVL9diX2l9HevtnBt4IPaicen8oJ3lGc
# 3vL4Df2/M6qE1LUcHRxpISxwSpfkMeZ+lYsZkHHkr3BrZlXacphsnuSXTId9Y8r5
# fcW6WpZ4OkqUX8neqOC+qyq4wFBdXMum33ej5+mETCNUNVBfftoviPmZ4UmZyGal
# rmKCRfNmyUUtzAD/6Bf21/kAZxl7iV/xgsigoFqxmJdQKAjyV7YoMLDRgEycEuPa
# /2lqHx/2aRCae22M0CsmxeY+T5qUdoyOSfNoVAbxSEHhQ7EZxy7/VEtLeLPBdXpk
# cta4V3QQVLdLk97A+p13DaWX+xjJIvgVXTZuDvY2uzaCBr5bQJ/4FBrNl6jEETL0
# nbRh8pRpP2dtAu6/IJU9rVpthoufO0e27wxAUhzSy61EAByiEHPIS39UhkVsM4B5
# jRPrzx/Yb2i5d/U=
# SIG # End signature block
