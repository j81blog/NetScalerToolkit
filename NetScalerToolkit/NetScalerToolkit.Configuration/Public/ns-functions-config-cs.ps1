# Generated NetScalerToolkit Configuration bundle for category 'cs'.

# region Invoke-NSAddCSAction
function Invoke-NSAddCSAction {
    <#
    .SYNOPSIS
        Creates a NetScaler csaction resource.
    .DESCRIPTION
        Configuration for Content Switching action resource.
    .PARAMETER Comment
        Comments associated with this cs action.
    .PARAMETER Name
        Name for the content switching action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the content switching action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
    .PARAMETER TargetlbVServer
        Name of the load balancing virtual server to which the content is switched.
    .PARAMETER TargetVServer
        Name of the VPN, GSLB or Authentication virtual server to which the content is switched.
    .PARAMETER TargetVServerExpr
        Information about this content switching action. Maximum length = 1499
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
        Invoke-NSAddCSAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSAction -Name 'example' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $TargetlbVServer,

        [Parameter()]
        [string] $TargetVServer,

        [Parameter()]
        [string] $TargetVServerExpr,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }
    if ($PSBoundParameters.ContainsKey('TargetVServerExpr')) { $properties['targetvserverexpr'] = $TargetVServerExpr }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csaction -Payload @{ csaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSAction

# region Invoke-NSAddCSPolicy
function Invoke-NSAddCSPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler cspolicy resource.
    .DESCRIPTION
        Configuration for content-switching policy resource.
    .PARAMETER Action
        Content switching action that names the target load balancing virtual server to which the traffic is switched.
    .PARAMETER LogAction
        The log action associated with the content switching policy.
    .PARAMETER PolicyName
        Name for the content switching policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Expression, or name of a named expression, against which traffic is evaluated. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
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
        Invoke-NSAddCSPolicy -PolicyName 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSPolicy -PolicyName 'example' -Rule 'example' -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$PolicyName", 'Create cspolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cspolicy -Payload @{ cspolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSPolicy -PolicyName $PolicyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSPolicy

# region Invoke-NSAddCSPolicyLabel
function Invoke-NSAddCSPolicyLabel {
    <#
    .SYNOPSIS
        Creates a NetScaler cspolicylabel resource.
    .DESCRIPTION
        Configuration for CS policy label resource.
    .PARAMETER CsPolicyLabelType
        Protocol supported by the policy label. All policies bound to the policy label must either match the specified protocol or be a subtype of that protocol. Available settings function as follows: * HTTP - Supports policies that process HTTP traffic. Used to access unencrypted Web sites. (The default.) * SSL - Supports policies that process HTTPS/SSL encrypted traffic. Used to access encrypted Web sites. * TCP - Supports policies that process any type of TCP traffic, including HTTP. * SSL_TCP - Supports policies that process SSL-encrypted TCP traffic, including SSL. * UDP - Supports policies that process any type of UDP-based traffic, including DNS. * DNS - Supports policies that process DNS traffic. * ANY - Supports all types of policies except HTTP, SSL, and TCP. * SIP_UDP - Supports policies that process UDP based Session Initiation Protocol (SIP) traffic. SIP initiates, manages, and terminates multimedia communications sessions, and has emerged as the standard for Internet telephony (VoIP). * RTSP - Supports policies that process Real Time Streaming Protocol (RTSP) traffic. RTSP provides delivery of multimedia and other streaming data, such as audio, video, and other types of streamed media. * RADIUS - Supports policies that process Remote Authentication Dial In User Service (RADIUS) traffic. RADIUS supports combined authentication, authorization, and auditing services for network management. * MYSQL - Supports policies that process MYSQL traffic. * MSSQL - Supports policies that process Microsoft SQL traffic. Possible values = HTTP, TCP, RTSP, SSL, SSL_TCP, UDP, DNS, SIP_UDP, SIP_TCP, ANY, RADIUS, RDP, MYSQL, MSSQL, ORACLE, DIAMETER, SSL_DIAMETER, FTP, DNS_TCP, SMPP, MQTT, MQTT_TLS, HTTP_QUIC
    .PARAMETER LabelName
        Name for the policy label. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. The label name must be unique within the list of policy labels for content switching. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policylabel" or 'my policylabel').
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
        Invoke-NSAddCSPolicyLabel -LabelName 'example' -CsPolicyLabelType HTTP -PassThru
    .EXAMPLE
        Invoke-NSAddCSPolicyLabel -LabelName 'example' -CsPolicyLabelType HTTP -WhatIf
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
        [ValidateSet('HTTP', 'TCP', 'RTSP', 'SSL', 'SSL_TCP', 'UDP', 'DNS', 'SIP_UDP', 'SIP_TCP', 'ANY', 'RADIUS', 'RDP', 'MYSQL', 'MSSQL', 'ORACLE', 'DIAMETER', 'SSL_DIAMETER', 'FTP', 'DNS_TCP', 'SMPP', 'MQTT', 'MQTT_TLS', 'HTTP_QUIC')]
        [string] $CsPolicyLabelType,

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
    if ($PSBoundParameters.ContainsKey('CsPolicyLabelType')) { $properties['cspolicylabeltype'] = $CsPolicyLabelType }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create cspolicylabel')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cspolicylabel -Payload @{ cspolicylabel = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSPolicyLabel -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSPolicyLabel

# region Invoke-NSAddCSPolicyLabelCSPolicyBinding
function Invoke-NSAddCSPolicyLabelCSPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler cspolicylabel_cspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to cspolicylabel.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        .
    .PARAMETER InvokeLabelName
        Name of the label to invoke if the current policy rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the policy label to which to bind a content switching policy.
    .PARAMETER LabelType
        Type of policy label invocation. Possible values = policylabel
    .PARAMETER PolicyName
        Name of the content switching policy.
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER TargetVServer
        Name of the virtual server to which to forward requests that match the policy.
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
        Invoke-NSAddCSPolicyLabelCSPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddCSPolicyLabelCSPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -WhatIf
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
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('Invoke')) { $properties['invoke'] = $Invoke }
    if ($PSBoundParameters.ContainsKey('InvokeLabelName')) { $properties['invoke_labelname'] = $InvokeLabelName }
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('LabelType')) { $properties['labeltype'] = $LabelType }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create cspolicylabel_cspolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cspolicylabel_cspolicy_binding -Payload @{ cspolicylabel_cspolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSPolicyLabelCSPolicyBinding -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSPolicyLabelCSPolicyBinding

# region Invoke-NSAddCSVServer
function Invoke-NSAddCSVServer {
    <#
    .SYNOPSIS
        Creates a NetScaler content switching virtual server.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER APIProfile
        The API profile where one or more API specs are bounded to. Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Authentication
        Authenticate users who request a connection to the content switching virtual server. Default value: OFF Possible values = ON, OFF
    .PARAMETER AuthenticationHost
        FQDN of the authentication virtual server. The service type of the virtual server should be either HTTP or SSL. Minimum length = 3 Maximum length = 252
    .PARAMETER Authn401
        Enable HTTP 401-response based authentication. Default value: OFF Possible values = ON, OFF
    .PARAMETER AuthnProfile
        Name of the authentication profile to be used when authentication is turned on.
    .PARAMETER AuthnVServerName
        Name of authentication virtual server that authenticates the incoming user requests to this content switching virtual server. . Minimum length = 1 Maximum length = 252
    .PARAMETER BackupPersistenceTimeout
        Time period for which backup persistence is in effect. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER BackupVServer
        Name of the backup virtual server that you are configuring. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the backup virtual server is created. You can assign a different backup virtual server or rename the existing virtual server. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks. Minimum length = 1
    .PARAMETER Cacheable
        Use this option to specify whether a virtual server, used for load balancing or content switching, routes requests to the cache redirection virtual server before sending it to the configured servers. Default value: NO Possible values = YES, NO
    .PARAMETER Casesensitive
        Consider case in URLs (for policies that use URLs instead of RULES). For example, with the ON setting, the URLs /a/1.html and /A/1.HTML are treated differently and can have different targets (set by content switching policies). With the OFF setting, /a/1.html and /A/1.HTML are switched to the same target. Default value: ON Possible values = ON, OFF
    .PARAMETER CltTimeout
        Idle time, in seconds, after which the client connection is terminated. The default values are: 180 seconds for HTTP/SSL-based services. 9000 seconds for other TCP-based services. 120 seconds for DNS-based services. 120 seconds for other UDP-based services. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Information about this virtual server.
    .PARAMETER CookieName
        Use this parameter to specify the cookie name for COOKIE peristence type. It specifies the name of cookie with a maximum of 32 characters. If not specified, cookie name is internally generated.
    .PARAMETER DBProfileName
        Name of the DB profile. Minimum length = 1 Maximum length = 127
    .PARAMETER DisablePrimaryOnDown
        Continue forwarding the traffic to backup virtual server even after the primary server comes UP from the DOWN state. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSOverHTTPS
        This option is used to enable/disable DNS over HTTPS (DoH) processing. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the VServer. DNS profile properties will applied to the transactions processed by a VServer. This parameter is valid only for DNS and DNS-TCP VServers. Minimum length = 1 Maximum length = 127
    .PARAMETER DNSRecordType
        . Default value: NSGSLB_IPV4 Possible values = A, AAAA, CNAME, NAPTR
    .PARAMETER DownStateFlush
        Flush all active transactions associated with a virtual server whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Dtls
        This option starts/stops the dtls service on the vserver. Default value: OFF Possible values = ON, OFF
    .PARAMETER HTTPProfileName
        Name of the HTTP profile containing HTTP configuration settings for the virtual server. The service type of the virtual server should be either HTTP or SSL. Minimum length = 1 Maximum length = 127
    .PARAMETER HTTPSRedirectURL
        URL to which all HTTP traffic received on the port specified in the -redirectFromPort parameter is redirected.
    .PARAMETER ICMPVsrResponse
        Can be active or passive. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER InsertVServerIPPort
        Insert the virtual server's VIP address and port number in the request header. Available values function as follows: VIPADDR - Header contains the vserver's IP address and port number without any translation. OFF - The virtual IP and port header insertion option is disabled. V6TOV4MAPPING - Header contains the mapped IPv4 address corresponding to the IPv6 address of the vserver and the port number. An IPv6 address can be mapped to a user-specified IPv4 address using the set ns ip6 command. Possible values = OFF, VIPADDR, V6TOV4MAPPING
    .PARAMETER IPMask
        IP mask, in dotted decimal notation, for the IP Pattern parameter. Can have leading or trailing non-zero octets (for example, 255.255.240.0 or 0.0.255.255). Accordingly, the mask specifies whether the first n bits or the last n bits of the destination IP address in a client request are to be matched with the corresponding bits in the IP pattern. The former is called a forward mask. The latter is called a reverse mask.
    .PARAMETER IPPattern
        IP address pattern, in dotted decimal notation, for identifying packets to be accepted by the virtual server. The IP Mask parameter specifies which part of the destination IP address is matched against the pattern. Mutually exclusive with the IP Address parameter. For example, if the IP pattern assigned to the virtual server is 198.51.100.0 and the IP mask is 255.255.240.0 (a forward mask), the first 20 bits in the destination IP addresses are matched with the first 20 bits in the pattern. The virtual server accepts requests with IP addresses that range from 198.51.96.1 to 198.51.111.254. You can also use a pattern such as 0.0.2.2 and a mask such as 0.0.255.255 (a reverse mask). If a destination IP address matches more than one IP pattern, the pattern with the longest match is selected, and the associated virtual server processes the request. For example, if the virtual servers, vs1 and vs2, have the same IP pattern, 0.0.100.128, but different IP masks of 0.0.255.255 and 0.0.224.255, a destination IP address of 198.51.100.128 has the longest match with the IP pattern of vs1. If a destination IP address matches two or more virtual servers to the same extent, the request is processed by the virtual server whose port number matches the port number in the request.
    .PARAMETER IPSet
        The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cs vserver. Minimum length = 1
    .PARAMETER IPv46
        IP address of the content switching virtual server. Minimum length = 1
    .PARAMETER L2Conn
        Use L2 Parameters to identify a connection. Possible values = ON, OFF
    .PARAMETER ListenPolicy
        String specifying the listen policy for the content switching virtual server. Can be either the name of an existing expression or an in-line expression. Default value: "NONE"
    .PARAMETER ListenPriority
        Integer specifying the priority of the listen policy. A higher number specifies a lower priority. If a request matches the listen policies of more than one virtual server the virtual server whose listen policy has the highest priority (the lowest priority number) accepts the request. Default value: 101 Minimum value = 0 Maximum value = 100
    .PARAMETER MSSQLServerVersion
        The version of the MSSQL server. Default value: 2008R2 Possible values = 70, 2000, 2000SP1, 2005, 2008, 2008R2, 2012, 2014
    .PARAMETER MySQLCharacterSet
        The character set returned by the mysql vserver. Default value: 8
    .PARAMETER MySQLProtocolVersion
        The protocol version returned by the mysql vserver. Default value: 10
    .PARAMETER MySQLServerCapabilities
        The server capabilities returned by the mysql vserver. Default value: 41613
    .PARAMETER MySQLServerVersion
        The server version string returned by the mysql vserver. Minimum length = 1 Maximum length = 31
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
    .PARAMETER NetProfile
        The name of the network profile. Minimum length = 1 Maximum length = 127
    .PARAMETER OracleServerVersion
        Oracle server version. Default value: 10G Possible values = 10G, 11G
    .PARAMETER PersistenceBackup
        Backup persistence type for the virtual server. Becomes operational if the primary persistence mechanism fails. Possible values = SOURCEIP, NONE
    .PARAMETER PersistenceId
        . Minimum value = 0 Maximum value = 65535
    .PARAMETER PersistenceType
        Type of persistence for the virtual server. Available settings function as follows: * SOURCEIP - Connections from the same client IP address belong to the same persistence session. * COOKIEINSERT - Connections that have the same HTTP Cookie, inserted by a Set-Cookie directive from a server, belong to the same persistence session. * SSLSESSION - Connections that have the same SSL Session ID belong to the same persistence session. Possible values = SOURCEIP, COOKIEINSERT, SSLSESSION, NONE
    .PARAMETER PersistMask
        Persistence mask for IP based persistence types, for IPv4 virtual servers. Minimum length = 1
    .PARAMETER Port
        Port number for content switching virtual server. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Precedence
        Type of precedence to use for both RULE-based and URL-based policies on the content switching virtual server. With the default (RULE) setting, incoming requests are evaluated against the rule-based content switching policies. If none of the rules match, the URL in the request is evaluated against the URL-based content switching policies. Default value: RULE Possible values = RULE, URL
    .PARAMETER ProbePort
        Citrix ADC provides support for external health check of the vserver status. Select port for HTTP/TCP monitring. Default value: 0 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProbeProtocol
        Citrix ADC provides support for external health check of the vserver status. Select HTTP or TCP probes for healthcheck. Possible values = TCP, HTTP
    .PARAMETER ProbeSuccessResponseCode
        HTTP code to return in SUCCESS case. Default value: "200 OK" Minimum length = 1 Maximum length = 64
    .PARAMETER Push
        Process traffic with the push virtual server that is bound to this content switching virtual server (specified by the Push VServer parameter). The service type of the push virtual server should be either HTTP or SSL. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PushLabel
        Expression for extracting the label from the response received from server. This string can be either an existing rule name or an inline expression. The service type of the virtual server should be either HTTP or SSL. Default value: "none"
    .PARAMETER PushMultiClients
        Allow multiple Web 2.0 connections from the same client to connect to the virtual server and expect updates. Default value: NO Possible values = YES, NO
    .PARAMETER PushVServer
        Name of the load balancing virtual server, of type PUSH or SSL_PUSH, to which the server pushes updates received on the client-facing load balancing virtual server. Minimum length = 1
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the Content Switching VServer. Minimum length = 1 Maximum length = 255
    .PARAMETER Range
        Number of consecutive IP addresses, starting with the address specified by the IP Address parameter, to include in a range of addresses assigned to this virtual server. Default value: 1 Minimum value = 1 Maximum value = 254
    .PARAMETER RedirectFromPort
        Port number for the virtual server, from which we absorb the traffic for http redirect. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER RedirectPortRewrite
        State of port rewrite while performing HTTP redirect. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER RedirectURL
        URL to which traffic is redirected if the virtual server becomes unavailable. The service type of the virtual server should be either HTTP or SSL. Caution: Make sure that the domain in the URL does not match the domain specified for a content switching policy. If it does, requests are continuously redirected to the unavailable virtual server. Minimum length = 1
    .PARAMETER Rhistate
        A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute. * If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP. * If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER RTSPNAT
        Enable network address translation (NAT) for real-time streaming protocol (RTSP) connections. Default value: OFF Possible values = ON, OFF
    .PARAMETER ServiceType
        Protocol used by the virtual server. Possible values = HTTP, SSL, TCP, FTP, RTSP, SSL_TCP, UDP, DNS, SIP_UDP, SIP_TCP, SIP_SSL, ANY, RADIUS, RDP, MYSQL, MSSQL, DIAMETER, SSL_DIAMETER, DNS_TCP, ORACLE, SMPP, PROXY, MONGO, MONGO_TLS, MQTT, MQTT_TLS, HTTP_QUIC, DOT, SSL_PROXY
    .PARAMETER SoBackupAction
        Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists. Possible values = DROP, ACCEPT, REDIRECT
    .PARAMETER SoMethod
        Type of spillover used to divert traffic to the backup virtual server when the primary virtual server reaches the spillover threshold. Connection spillover is based on the number of connections. Bandwidth spillover is based on the total Kbps of incoming and outgoing traffic. Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE
    .PARAMETER SoPersistence
        Maintain source-IP based persistence on primary and backup virtual servers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SoPersistenceTimeout
        Time-out value, in minutes, for spillover persistence. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER SoThreshold
        Depending on the spillover method, the maximum number of connections or the maximum total bandwidth (Kbps) that a virtual server can handle before spillover occurs. Minimum value = 1 Maximum value = 4294967287
    .PARAMETER State
        Initial state of the load balancing virtual server. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Stateupdate
        Enable state updates for a specific content switching virtual server. By default, the Content Switching virtual server is always UP, regardless of the state of the Load Balancing virtual servers bound to it. This parameter interacts with the global setting as follows: Global Level | Vserver Level | Result ENABLED ENABLED ENABLED ENABLED DISABLED ENABLED DISABLED ENABLED ENABLED DISABLED DISABLED DISABLED If you want to enable state updates for only some content switching virtual servers, be sure to disable the state update parameter. Default value: DISABLED Possible values = ENABLED, DISABLED, UPDATEONBACKENDUPDATE
    .PARAMETER TargetType
        Virtual server target type. Possible values = GSLB
    .PARAMETER TCPProbePort
        Port number for external TCP probe. NetScaler provides support for external TCP health check of the vserver status over the selected port. This option is only supported for vservers assigned with an IPAddress or ipset. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER TCPProfileName
        Name of the TCP profile containing TCP configuration settings for the virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER Trafficdomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER Timeout
        Time period for which a persistence session is in effect. Default value: 2 Minimum value = 0 Maximum value = 1440
    .PARAMETER V6PersistMaskLen
        Persistence mask for IP based persistence types, for IPv6 virtual servers. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER VIPHeader
        Name of virtual server IP and port header, for use with the VServer IP Port Insertion parameter. Minimum length = 1
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
        Invoke-NSAddCSVServer -Name 'example' -ServiceType HTTP -IPv46 '192.0.2.10' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServer -Name 'example' -ServiceType HTTP -IPv46 '192.0.2.10' -Port 80 -WhatIf
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
        [string] $APIProfile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowLog,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Authentication,

        [Parameter()]
        [string] $AuthenticationHost,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Authn401,

        [Parameter()]
        [string] $AuthnProfile,

        [Parameter()]
        [string] $AuthnVServerName,

        [Parameter()]
        [int] $BackupPersistenceTimeout,

        [Parameter()]
        [string] $BackupVServer,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Cacheable,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Casesensitive,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $CookieName,

        [Parameter()]
        [string] $DBProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisablePrimaryOnDown,

        [Parameter()]
        [string] $DNSOverHTTPS,

        [Parameter()]
        [string] $DNSProfileName,

        [Parameter()]
        [ValidateSet('A', 'AAAA', 'CNAME', 'NAPTR')]
        [string] $DNSRecordType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Dtls,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [string] $HTTPSRedirectURL,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $ICMPVsrResponse,

        [Parameter()]
        [ValidateSet('OFF', 'VIPADDR', 'V6TOV4MAPPING')]
        [string] $InsertVServerIPPort,

        [Parameter()]
        [string] $IPMask,

        [Parameter()]
        [string] $IPPattern,

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
        [ValidateSet('70', '2000', '2000SP1', '2005', '2008', '2008R2', '2012', '2014')]
        [string] $MSSQLServerVersion,

        [Parameter()]
        [int] $MySQLCharacterSet,

        [Parameter()]
        [int] $MySQLProtocolVersion,

        [Parameter()]
        [int] $MySQLServerCapabilities,

        [Parameter()]
        [string] $MySQLServerVersion,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [ValidateSet('10G', '11G')]
        [string] $OracleServerVersion,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'NONE')]
        [string] $PersistenceBackup,

        [Parameter()]
        [int] $PersistenceId,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'COOKIEINSERT', 'SSLSESSION', 'NONE')]
        [string] $PersistenceType,

        [Parameter()]
        [string] $PersistMask,

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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Push,

        [Parameter()]
        [string] $PushLabel,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PushMultiClients,

        [Parameter()]
        [string] $PushVServer,

        [Parameter()]
        [string] $QUICProfileName,

        [Parameter()]
        [int] $Range,

        [Parameter()]
        [int] $RedirectFromPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $RedirectPortRewrite,

        [Parameter()]
        [string] $RedirectURL,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $Rhistate,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $RTSPNAT,

        [Parameter(Mandatory)]
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
        [ValidateSet('ENABLED', 'DISABLED', 'UPDATEONBACKENDUPDATE')]
        [string] $Stateupdate,

        [Parameter()]
        [ValidateSet('GSLB')]
        [string] $TargetType,

        [Parameter()]
        [int] $TCPProbePort,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [int] $Trafficdomain,

        [Parameter()]
        [int] $Timeout,

        [Parameter()]
        [int] $V6PersistMaskLen,

        [Parameter()]
        [string] $VIPHeader,

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

    if ($PSBoundParameters.ContainsKey('DNSOverHTTPS')) {
        Assert-NSParameterValue -ParameterName 'DNSOverHTTPS' -Value $DNSOverHTTPS -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('ServiceType')) {
        Assert-NSParameterValue -ParameterName 'ServiceType' -Value $ServiceType -AllowedValuesByVersion @{ '13.1' = @('HTTP', 'SSL', 'TCP', 'FTP', 'RTSP', 'SSL_TCP', 'UDP', 'DNS', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'ANY', 'RADIUS', 'RDP', 'MYSQL', 'MSSQL', 'DIAMETER', 'SSL_DIAMETER', 'DNS_TCP', 'ORACLE', 'SMPP', 'PROXY', 'MONGO', 'MONGO_TLS', 'MQTT', 'MQTT_TLS', 'HTTP_QUIC'); '14.1' = @('HTTP', 'SSL', 'TCP', 'FTP', 'RTSP', 'SSL_TCP', 'UDP', 'DNS', 'SIP_UDP', 'SIP_TCP', 'SIP_SSL', 'ANY', 'RADIUS', 'RDP', 'MYSQL', 'MSSQL', 'DIAMETER', 'SSL_DIAMETER', 'DNS_TCP', 'ORACLE', 'SMPP', 'PROXY', 'MONGO', 'MONGO_TLS', 'MQTT', 'MQTT_TLS', 'HTTP_QUIC', 'DOT', 'SSL_PROXY') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('SoMethod')) {
        Assert-NSParameterValue -ParameterName 'SoMethod' -Value $SoMethod -AllowedValuesByVersion @{ '13.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'NONE'); '14.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'LLMQUOTA', 'NONE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('APIProfile')) { $properties['apiprofile'] = $APIProfile }
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('Authentication')) { $properties['authentication'] = $Authentication }
    if ($PSBoundParameters.ContainsKey('AuthenticationHost')) { $properties['authenticationhost'] = $AuthenticationHost }
    if ($PSBoundParameters.ContainsKey('Authn401')) { $properties['authn401'] = $Authn401 }
    if ($PSBoundParameters.ContainsKey('AuthnProfile')) { $properties['authnprofile'] = $AuthnProfile }
    if ($PSBoundParameters.ContainsKey('AuthnVServerName')) { $properties['authnvsname'] = $AuthnVServerName }
    if ($PSBoundParameters.ContainsKey('BackupPersistenceTimeout')) { $properties['backuppersistencetimeout'] = $BackupPersistenceTimeout }
    if ($PSBoundParameters.ContainsKey('BackupVServer')) { $properties['backupvserver'] = $BackupVServer }
    if ($PSBoundParameters.ContainsKey('Cacheable')) { $properties['cacheable'] = $Cacheable }
    if ($PSBoundParameters.ContainsKey('Casesensitive')) { $properties['casesensitive'] = $Casesensitive }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('CookieName')) { $properties['cookiename'] = $CookieName }
    if ($PSBoundParameters.ContainsKey('DBProfileName')) { $properties['dbprofilename'] = $DBProfileName }
    if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $properties['disableprimaryondown'] = $DisablePrimaryOnDown }
    if ($PSBoundParameters.ContainsKey('DNSOverHTTPS')) { $properties['dnsoverhttps'] = $DNSOverHTTPS }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('DNSRecordType')) { $properties['dnsrecordtype'] = $DNSRecordType }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('Dtls')) { $properties['dtls'] = $Dtls }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('HTTPSRedirectURL')) { $properties['httpsredirecturl'] = $HTTPSRedirectURL }
    if ($PSBoundParameters.ContainsKey('ICMPVsrResponse')) { $properties['icmpvsrresponse'] = $ICMPVsrResponse }
    if ($PSBoundParameters.ContainsKey('InsertVServerIPPort')) { $properties['insertvserveripport'] = $InsertVServerIPPort }
    if ($PSBoundParameters.ContainsKey('IPMask')) { $properties['ipmask'] = $IPMask }
    if ($PSBoundParameters.ContainsKey('IPPattern')) { $properties['ippattern'] = $IPPattern }
    if ($PSBoundParameters.ContainsKey('IPSet')) { $properties['ipset'] = $IPSet }
    if ($PSBoundParameters.ContainsKey('IPv46')) { $properties['ipv46'] = $IPv46 }
    if ($PSBoundParameters.ContainsKey('L2Conn')) { $properties['l2conn'] = $L2Conn }
    if ($PSBoundParameters.ContainsKey('ListenPolicy')) { $properties['listenpolicy'] = $ListenPolicy }
    if ($PSBoundParameters.ContainsKey('ListenPriority')) { $properties['listenpriority'] = $ListenPriority }
    if ($PSBoundParameters.ContainsKey('MSSQLServerVersion')) { $properties['mssqlserverversion'] = $MSSQLServerVersion }
    if ($PSBoundParameters.ContainsKey('MySQLCharacterSet')) { $properties['mysqlcharacterset'] = $MySQLCharacterSet }
    if ($PSBoundParameters.ContainsKey('MySQLProtocolVersion')) { $properties['mysqlprotocolversion'] = $MySQLProtocolVersion }
    if ($PSBoundParameters.ContainsKey('MySQLServerCapabilities')) { $properties['mysqlservercapabilities'] = $MySQLServerCapabilities }
    if ($PSBoundParameters.ContainsKey('MySQLServerVersion')) { $properties['mysqlserverversion'] = $MySQLServerVersion }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('OracleServerVersion')) { $properties['oracleserverversion'] = $OracleServerVersion }
    if ($PSBoundParameters.ContainsKey('PersistenceBackup')) { $properties['persistencebackup'] = $PersistenceBackup }
    if ($PSBoundParameters.ContainsKey('PersistenceId')) { $properties['persistenceid'] = $PersistenceId }
    if ($PSBoundParameters.ContainsKey('PersistenceType')) { $properties['persistencetype'] = $PersistenceType }
    if ($PSBoundParameters.ContainsKey('PersistMask')) { $properties['persistmask'] = $PersistMask }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('Precedence')) { $properties['precedence'] = $Precedence }
    if ($PSBoundParameters.ContainsKey('ProbePort')) { $properties['probeport'] = $ProbePort }
    if ($PSBoundParameters.ContainsKey('ProbeProtocol')) { $properties['probeprotocol'] = $ProbeProtocol }
    if ($PSBoundParameters.ContainsKey('ProbeSuccessResponseCode')) { $properties['probesuccessresponsecode'] = $ProbeSuccessResponseCode }
    if ($PSBoundParameters.ContainsKey('Push')) { $properties['push'] = $Push }
    if ($PSBoundParameters.ContainsKey('PushLabel')) { $properties['pushlabel'] = $PushLabel }
    if ($PSBoundParameters.ContainsKey('PushMultiClients')) { $properties['pushmulticlients'] = $PushMultiClients }
    if ($PSBoundParameters.ContainsKey('PushVServer')) { $properties['pushvserver'] = $PushVServer }
    if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $properties['quicprofilename'] = $QUICProfileName }
    if ($PSBoundParameters.ContainsKey('Range')) { $properties['range'] = $Range }
    if ($PSBoundParameters.ContainsKey('RedirectFromPort')) { $properties['redirectfromport'] = $RedirectFromPort }
    if ($PSBoundParameters.ContainsKey('RedirectPortRewrite')) { $properties['redirectportrewrite'] = $RedirectPortRewrite }
    if ($PSBoundParameters.ContainsKey('RedirectURL')) { $properties['redirecturl'] = $RedirectURL }
    if ($PSBoundParameters.ContainsKey('Rhistate')) { $properties['rhistate'] = $Rhistate }
    if ($PSBoundParameters.ContainsKey('RTSPNAT')) { $properties['rtspnat'] = $RTSPNAT }
    if ($PSBoundParameters.ContainsKey('ServiceType')) { $properties['servicetype'] = $ServiceType }
    if ($PSBoundParameters.ContainsKey('SoBackupAction')) { $properties['sobackupaction'] = $SoBackupAction }
    if ($PSBoundParameters.ContainsKey('SoMethod')) { $properties['somethod'] = $SoMethod }
    if ($PSBoundParameters.ContainsKey('SoPersistence')) { $properties['sopersistence'] = $SoPersistence }
    if ($PSBoundParameters.ContainsKey('SoPersistenceTimeout')) { $properties['sopersistencetimeout'] = $SoPersistenceTimeout }
    if ($PSBoundParameters.ContainsKey('SoThreshold')) { $properties['sothreshold'] = $SoThreshold }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('Stateupdate')) { $properties['stateupdate'] = $Stateupdate }
    if ($PSBoundParameters.ContainsKey('TargetType')) { $properties['targettype'] = $TargetType }
    if ($PSBoundParameters.ContainsKey('TCPProbePort')) { $properties['tcpprobeport'] = $TCPProbePort }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('Trafficdomain')) { $properties['td'] = $Trafficdomain }
    if ($PSBoundParameters.ContainsKey('Timeout')) { $properties['timeout'] = $Timeout }
    if ($PSBoundParameters.ContainsKey('V6PersistMaskLen')) { $properties['v6persistmasklen'] = $V6PersistMaskLen }
    if ($PSBoundParameters.ContainsKey('VIPHeader')) { $properties['vipheader'] = $VIPHeader }
    if ($PSBoundParameters.ContainsKey('WASMModule')) { $properties['wasmmodule'] = $WASMModule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver -Payload @{ csvserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServer

# region Invoke-NSAddCSVServerAnalyticsProfileBinding
function Invoke-NSAddCSVServerAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to csvserver.
    .PARAMETER AnalyticsProfile
        Name of the analytics profile bound to the LB vserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSAddCSVServerAnalyticsProfileBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerAnalyticsProfileBinding -Name 'example' -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_analyticsprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_analyticsprofile_binding -Payload @{ csvserver_analyticsprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerAnalyticsProfileBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerAnalyticsProfileBinding

# region Invoke-NSAddCSVServerAppFlowPolicyBinding
function Invoke-NSAddCSVServerAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerAppFlowPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerAppFlowPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_appflowpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_appflowpolicy_binding -Payload @{ csvserver_appflowpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerAppFlowPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerAppFlowPolicyBinding

# region Invoke-NSAddCSVServerAppFwPolicyBinding
function Invoke-NSAddCSVServerAppFwPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_appfwpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appfwpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerAppFwPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerAppFwPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_appfwpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_appfwpolicy_binding -Payload @{ csvserver_appfwpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerAppFwPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerAppFwPolicyBinding

# region Invoke-NSAddCSVServerAppQoEPolicyBinding
function Invoke-NSAddCSVServerAppQoEPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_appqoepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appqoepolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerAppQoEPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerAppQoEPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_appqoepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_appqoepolicy_binding -Payload @{ csvserver_appqoepolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerAppQoEPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerAppQoEPolicyBinding

# region Invoke-NSAddCSVServerAuditNSLogPolicyBinding
function Invoke-NSAddCSVServerAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerAuditNSLogPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerAuditNSLogPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_auditnslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_auditnslogpolicy_binding -Payload @{ csvserver_auditnslogpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerAuditNSLogPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerAuditNSLogPolicyBinding

# region Invoke-NSAddCSVServerAuditSyslogPolicyBinding
function Invoke-NSAddCSVServerAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerAuditSyslogPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerAuditSyslogPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_auditsyslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_auditsyslogpolicy_binding -Payload @{ csvserver_auditsyslogpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerAuditSyslogPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerAuditSyslogPolicyBinding

# region Invoke-NSAddCSVServerAuthorizationPolicyBinding
function Invoke-NSAddCSVServerAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_authorizationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerAuthorizationPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerAuthorizationPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_authorizationpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_authorizationpolicy_binding -Payload @{ csvserver_authorizationpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerAuthorizationPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerAuthorizationPolicyBinding

# region Invoke-NSAddCSVServerBotPolicyBinding
function Invoke-NSAddCSVServerBotPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_botpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerBotPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerBotPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_botpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_botpolicy_binding -Payload @{ csvserver_botpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerBotPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerBotPolicyBinding

# region Invoke-NSAddCSVServerCachePolicyBinding
function Invoke-NSAddCSVServerCachePolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerCachePolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerCachePolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_cachepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_cachepolicy_binding -Payload @{ csvserver_cachepolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerCachePolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerCachePolicyBinding

# region Invoke-NSAddCSVServerCMPPolicyBinding
function Invoke-NSAddCSVServerCMPPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_cmppolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cmppolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerCMPPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerCMPPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_cmppolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_cmppolicy_binding -Payload @{ csvserver_cmppolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerCMPPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerCMPPolicyBinding

# region Invoke-NSAddCSVServerContentInspectionPolicyBinding
function Invoke-NSAddCSVServerContentInspectionPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_contentinspectionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the contentinspectionpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerContentInspectionPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerContentInspectionPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_contentinspectionpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_contentinspectionpolicy_binding -Payload @{ csvserver_contentinspectionpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerContentInspectionPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerContentInspectionPolicyBinding

# region Invoke-NSAddCSVServerCSPolicyBinding
function Invoke-NSAddCSVServerCSPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_cspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        target vserver name.
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
        Invoke-NSAddCSVServerCSPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerCSPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_cspolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_cspolicy_binding -Payload @{ csvserver_cspolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerCSPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerCSPolicyBinding

# region Invoke-NSAddCSVServerDomainBinding
function Invoke-NSAddCSVServerDomainBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_domain_binding resource.
    .DESCRIPTION
        Binding object showing the domain that can be bound to csvserver.
    .PARAMETER BackupIp
        . Minimum length = 1
    .PARAMETER CookieDomain
        . Minimum length = 1
    .PARAMETER CookieTimeout
        . Minimum value = 0 Maximum value = 1440
    .PARAMETER DomainName
        Domain name for which to change the time to live (TTL) and/or backup service IP address. Minimum length = 1
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER Sitedomainttl
        . Minimum value = 1
    .PARAMETER Ttl
        . Minimum value = 1
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
        Invoke-NSAddCSVServerDomainBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerDomainBinding -Name 'example' -WhatIf
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
    if ($PSBoundParameters.ContainsKey('CookieDomain')) { $properties['cookiedomain'] = $CookieDomain }
    if ($PSBoundParameters.ContainsKey('CookieTimeout')) { $properties['cookietimeout'] = $CookieTimeout }
    if ($PSBoundParameters.ContainsKey('DomainName')) { $properties['domainname'] = $DomainName }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Sitedomainttl')) { $properties['sitedomainttl'] = $Sitedomainttl }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_domain_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_domain_binding -Payload @{ csvserver_domain_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerDomainBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerDomainBinding

# region Invoke-NSAddCSVServerFEOPolicyBinding
function Invoke-NSAddCSVServerFEOPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_feopolicy_binding resource.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerFEOPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerFEOPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_feopolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_feopolicy_binding -Payload @{ csvserver_feopolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerFEOPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerFEOPolicyBinding

# region Invoke-NSAddCSVServerGSLBVServerBinding
function Invoke-NSAddCSVServerGSLBVServerBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_gslbvserver_binding resource.
    .DESCRIPTION
        Binding object showing the gslbvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER VServer
        Name of the default gslb or vpn vserver bound to CS vserver of type GSLB/VPN. For Example: bind cs vserver cs1 -vserver gslb1 or bind cs vserver cs1 -vserver vpn1. Minimum length = 1
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
        Invoke-NSAddCSVServerGSLBVServerBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerGSLBVServerBinding -Name 'example' -WhatIf
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
        [string] $VServer,

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
    if ($PSBoundParameters.ContainsKey('VServer')) { $properties['vserver'] = $VServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_gslbvserver_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_gslbvserver_binding -Payload @{ csvserver_gslbvserver_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerGSLBVServerBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerGSLBVServerBinding

# region Invoke-NSAddCSVServerLBVServerBinding
function Invoke-NSAddCSVServerLBVServerBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_lbvserver_binding resource.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to csvserver.
    .PARAMETER LBVServer
        Name of the default lb vserver bound. Use this param for Default binding only. For Example: bind cs vserver cs1 -lbvserver lb1. Minimum length = 1
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER TargetVServer
        The virtual server name (created with the add lb vserver command) to which content will be switched. Minimum length = 1
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
        Invoke-NSAddCSVServerLBVServerBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerLBVServerBinding -Name 'example' -WhatIf
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
    if ($PSBoundParameters.ContainsKey('LBVServer')) { $properties['lbvserver'] = $LBVServer }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_lbvserver_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_lbvserver_binding -Payload @{ csvserver_lbvserver_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerLBVServerBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerLBVServerBinding

# region Invoke-NSAddCSVServerResponderPolicyBinding
function Invoke-NSAddCSVServerResponderPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerResponderPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerResponderPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_responderpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_responderpolicy_binding -Payload @{ csvserver_responderpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerResponderPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerResponderPolicyBinding

# region Invoke-NSAddCSVServerRewritePolicyBinding
function Invoke-NSAddCSVServerRewritePolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_rewritepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the rewritepolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerRewritePolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerRewritePolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_rewritepolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_rewritepolicy_binding -Payload @{ csvserver_rewritepolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerRewritePolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerRewritePolicyBinding

# region Invoke-NSAddCSVServerSpilloverPolicyBinding
function Invoke-NSAddCSVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_spilloverpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerSpilloverPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerSpilloverPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_spilloverpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_spilloverpolicy_binding -Payload @{ csvserver_spilloverpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerSpilloverPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerSpilloverPolicyBinding

# region Invoke-NSAddCSVServerTMTrafficPolicyBinding
function Invoke-NSAddCSVServerTMTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_tmtrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmtrafficpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Invoke
        Invoke a policy label if this policy's rule evaluates to TRUE.
    .PARAMETER LabelName
        Name of the label to be invoked.
    .PARAMETER LabelType
        Type of label to be invoked. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerTMTrafficPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerTMTrafficPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_tmtrafficpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_tmtrafficpolicy_binding -Payload @{ csvserver_tmtrafficpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerTMTrafficPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerTMTrafficPolicyBinding

# region Invoke-NSAddCSVServerTransformPolicyBinding
function Invoke-NSAddCSVServerTransformPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_transformpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the transformpolicy that can be bound to csvserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke flag.
    .PARAMETER LabelName
        Name of the label invoked.
    .PARAMETER LabelType
        The invocation type. Possible values = reqvserver, resvserver, policylabel
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER TargetlbVServer
        Name of the Load Balancing virtual server to which the content is switched, if policy rule is evaluated to be TRUE. Example: bind cs vs cs1 -policyname pol1 -priority 101 -targetLBVserver lb1 Note: Use this parameter only in case of Content Switching policy bind operations to a CS vserver. Minimum length = 1
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
        Invoke-NSAddCSVServerTransformPolicyBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerTransformPolicyBinding -Name 'example' -WhatIf
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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
        [string] $TargetlbVServer,

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
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_transformpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_transformpolicy_binding -Payload @{ csvserver_transformpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerTransformPolicyBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerTransformPolicyBinding

# region Invoke-NSAddCSVServerVPNVServerBinding
function Invoke-NSAddCSVServerVPNVServerBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler csvserver_vpnvserver_binding resource.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER VServer
        Name of the default gslb or vpn vserver bound to CS vserver of type GSLB/VPN. For Example: bind cs vserver cs1 -vserver gslb1 or bind cs vserver cs1 -vserver vpn1. Minimum length = 1
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
        Invoke-NSAddCSVServerVPNVServerBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddCSVServerVPNVServerBinding -Name 'example' -WhatIf
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
        [string] $VServer,

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
    if ($PSBoundParameters.ContainsKey('VServer')) { $properties['vserver'] = $VServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create csvserver_vpnvserver_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver_vpnvserver_binding -Payload @{ csvserver_vpnvserver_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServerVPNVServerBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddCSVServerVPNVServerBinding

# region Invoke-NSDeleteCSAction
function Invoke-NSDeleteCSAction {
    <#
    .SYNOPSIS
        Removes a NetScaler csaction resource.
    .DESCRIPTION
        Configuration for Content Switching action resource.
    .PARAMETER Name
        Name for the content switching action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the content switching action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSAction -Name 'csaction_example' | Invoke-NSDeleteCSAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSAction

# region Invoke-NSDeleteCSPolicy
function Invoke-NSDeleteCSPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler cspolicy resource.
    .DESCRIPTION
        Configuration for content-switching policy resource.
    .PARAMETER PolicyName
        Name for the content switching policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSPolicy -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSPolicy -PolicyName 'cspolicy_example' | Invoke-NSDeleteCSPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Delete cspolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cspolicy -Resource $PolicyName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSPolicy

# region Invoke-NSDeleteCSPolicyLabel
function Invoke-NSDeleteCSPolicyLabel {
    <#
    .SYNOPSIS
        Removes a NetScaler cspolicylabel resource.
    .DESCRIPTION
        Configuration for CS policy label resource.
    .PARAMETER LabelName
        Name for the policy label. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. The label name must be unique within the list of policy labels for content switching. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policylabel" or 'my policylabel').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSPolicyLabel -LabelName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSPolicyLabel -LabelName 'cspolicylabel_example' | Invoke-NSDeleteCSPolicyLabel -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete cspolicylabel')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cspolicylabel -Resource $LabelName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSPolicyLabel

# region Invoke-NSDeleteCSPolicyLabelCSPolicyBinding
function Invoke-NSDeleteCSPolicyLabelCSPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler cspolicylabel_cspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to cspolicylabel.
    .PARAMETER LabelName
        Name of the policy label to which to bind a content switching policy.
    .PARAMETER PolicyName
        Name of the content switching policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSPolicyLabelCSPolicyBinding -LabelName 'example' -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSPolicyLabelCSPolicyBinding -LabelName 'cspolicylabel_cspolicy_binding_example' | Invoke-NSDeleteCSPolicyLabelCSPolicyBinding -Confirm:$false
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

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete cspolicylabel_cspolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type cspolicylabel_cspolicy_binding -Resource $LabelName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSPolicyLabelCSPolicyBinding

# region Invoke-NSDeleteCSVServer
function Invoke-NSDeleteCSVServer {
    <#
    .SYNOPSIS
        Removes a NetScaler content switching virtual server.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServer -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServer -Name 'csvserver_example' | Invoke-NSDeleteCSVServer -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServer

# region Invoke-NSDeleteCSVServerAnalyticsProfileBinding
function Invoke-NSDeleteCSVServerAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER AnalyticsProfile
        Name of the analytics profile bound to the LB vserver.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerAnalyticsProfileBinding -Name 'example' -AnalyticsProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerAnalyticsProfileBinding -Name 'csvserver_analyticsprofile_binding_example' | Invoke-NSDeleteCSVServerAnalyticsProfileBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_analyticsprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_analyticsprofile_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerAnalyticsProfileBinding

# region Invoke-NSDeleteCSVServerAppFlowPolicyBinding
function Invoke-NSDeleteCSVServerAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerAppFlowPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerAppFlowPolicyBinding -Name 'csvserver_appflowpolicy_binding_example' | Invoke-NSDeleteCSVServerAppFlowPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_appflowpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_appflowpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerAppFlowPolicyBinding

# region Invoke-NSDeleteCSVServerAppFwPolicyBinding
function Invoke-NSDeleteCSVServerAppFwPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_appfwpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appfwpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerAppFwPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerAppFwPolicyBinding -Name 'csvserver_appfwpolicy_binding_example' | Invoke-NSDeleteCSVServerAppFwPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_appfwpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_appfwpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerAppFwPolicyBinding

# region Invoke-NSDeleteCSVServerAppQoEPolicyBinding
function Invoke-NSDeleteCSVServerAppQoEPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_appqoepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appqoepolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerAppQoEPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerAppQoEPolicyBinding -Name 'csvserver_appqoepolicy_binding_example' | Invoke-NSDeleteCSVServerAppQoEPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_appqoepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_appqoepolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerAppQoEPolicyBinding

# region Invoke-NSDeleteCSVServerAuditNSLogPolicyBinding
function Invoke-NSDeleteCSVServerAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerAuditNSLogPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerAuditNSLogPolicyBinding -Name 'csvserver_auditnslogpolicy_binding_example' | Invoke-NSDeleteCSVServerAuditNSLogPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_auditnslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_auditnslogpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerAuditNSLogPolicyBinding

# region Invoke-NSDeleteCSVServerAuditSyslogPolicyBinding
function Invoke-NSDeleteCSVServerAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerAuditSyslogPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerAuditSyslogPolicyBinding -Name 'csvserver_auditsyslogpolicy_binding_example' | Invoke-NSDeleteCSVServerAuditSyslogPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_auditsyslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_auditsyslogpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerAuditSyslogPolicyBinding

# region Invoke-NSDeleteCSVServerAuthorizationPolicyBinding
function Invoke-NSDeleteCSVServerAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_authorizationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerAuthorizationPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerAuthorizationPolicyBinding -Name 'csvserver_authorizationpolicy_binding_example' | Invoke-NSDeleteCSVServerAuthorizationPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_authorizationpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_authorizationpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerAuthorizationPolicyBinding

# region Invoke-NSDeleteCSVServerBotPolicyBinding
function Invoke-NSDeleteCSVServerBotPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_botpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerBotPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerBotPolicyBinding -Name 'csvserver_botpolicy_binding_example' | Invoke-NSDeleteCSVServerBotPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_botpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_botpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerBotPolicyBinding

# region Invoke-NSDeleteCSVServerCachePolicyBinding
function Invoke-NSDeleteCSVServerCachePolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_cachepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerCachePolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerCachePolicyBinding -Name 'csvserver_cachepolicy_binding_example' | Invoke-NSDeleteCSVServerCachePolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_cachepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_cachepolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerCachePolicyBinding

# region Invoke-NSDeleteCSVServerCMPPolicyBinding
function Invoke-NSDeleteCSVServerCMPPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_cmppolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cmppolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerCMPPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerCMPPolicyBinding -Name 'csvserver_cmppolicy_binding_example' | Invoke-NSDeleteCSVServerCMPPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_cmppolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_cmppolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerCMPPolicyBinding

# region Invoke-NSDeleteCSVServerContentInspectionPolicyBinding
function Invoke-NSDeleteCSVServerContentInspectionPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_contentinspectionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the contentinspectionpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerContentInspectionPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerContentInspectionPolicyBinding -Name 'csvserver_contentinspectionpolicy_binding_example' | Invoke-NSDeleteCSVServerContentInspectionPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_contentinspectionpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_contentinspectionpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerContentInspectionPolicyBinding

# region Invoke-NSDeleteCSVServerCSPolicyBinding
function Invoke-NSDeleteCSVServerCSPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_cspolicy_binding resource.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerCSPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerCSPolicyBinding -Name 'csvserver_cspolicy_binding_example' | Invoke-NSDeleteCSVServerCSPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_cspolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_cspolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerCSPolicyBinding

# region Invoke-NSDeleteCSVServerDomainBinding
function Invoke-NSDeleteCSVServerDomainBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_domain_binding resource.
    .DESCRIPTION
        Binding object showing the domain that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSDeleteCSVServerDomainBinding -Name 'example' -DomainName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerDomainBinding -Name 'csvserver_domain_binding_example' | Invoke-NSDeleteCSVServerDomainBinding -Confirm:$false
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
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_domain_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_domain_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerDomainBinding

# region Invoke-NSDeleteCSVServerFEOPolicyBinding
function Invoke-NSDeleteCSVServerFEOPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_feopolicy_binding resource.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerFEOPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerFEOPolicyBinding -Name 'csvserver_feopolicy_binding_example' | Invoke-NSDeleteCSVServerFEOPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_feopolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_feopolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerFEOPolicyBinding

# region Invoke-NSDeleteCSVServerGSLBVServerBinding
function Invoke-NSDeleteCSVServerGSLBVServerBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_gslbvserver_binding resource.
    .DESCRIPTION
        Binding object showing the gslbvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER VServer
        Name of the default gslb or vpn vserver bound to CS vserver of type GSLB/VPN. For Example: bind cs vserver cs1 -vserver gslb1 or bind cs vserver cs1 -vserver vpn1. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerGSLBVServerBinding -Name 'example' -VServer 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerGSLBVServerBinding -Name 'csvserver_gslbvserver_binding_example' | Invoke-NSDeleteCSVServerGSLBVServerBinding -Confirm:$false
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
        [string] $VServer,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('VServer')) {
            $argumentParts += 'vserver:' + $VServer
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_gslbvserver_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_gslbvserver_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerGSLBVServerBinding

# region Invoke-NSDeleteCSVServerLBVServerBinding
function Invoke-NSDeleteCSVServerLBVServerBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_lbvserver_binding resource.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER LBVServer
        Name of the default lb vserver bound. Use this param for Default binding only. For Example: bind cs vserver cs1 -lbvserver lb1. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerLBVServerBinding -Name 'example' -LBVServer 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerLBVServerBinding -Name 'csvserver_lbvserver_binding_example' | Invoke-NSDeleteCSVServerLBVServerBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_lbvserver_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_lbvserver_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerLBVServerBinding

# region Invoke-NSDeleteCSVServerResponderPolicyBinding
function Invoke-NSDeleteCSVServerResponderPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerResponderPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerResponderPolicyBinding -Name 'csvserver_responderpolicy_binding_example' | Invoke-NSDeleteCSVServerResponderPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_responderpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_responderpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerResponderPolicyBinding

# region Invoke-NSDeleteCSVServerRewritePolicyBinding
function Invoke-NSDeleteCSVServerRewritePolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_rewritepolicy_binding resource.
    .DESCRIPTION
        Binding object showing the rewritepolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerRewritePolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerRewritePolicyBinding -Name 'csvserver_rewritepolicy_binding_example' | Invoke-NSDeleteCSVServerRewritePolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_rewritepolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_rewritepolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerRewritePolicyBinding

# region Invoke-NSDeleteCSVServerSpilloverPolicyBinding
function Invoke-NSDeleteCSVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_spilloverpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerSpilloverPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerSpilloverPolicyBinding -Name 'csvserver_spilloverpolicy_binding_example' | Invoke-NSDeleteCSVServerSpilloverPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_spilloverpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_spilloverpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerSpilloverPolicyBinding

# region Invoke-NSDeleteCSVServerTMTrafficPolicyBinding
function Invoke-NSDeleteCSVServerTMTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_tmtrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmtrafficpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        Bind point at which policy needs to be bound. Note: Content switching policies are evaluated only at request time. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerTMTrafficPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerTMTrafficPolicyBinding -Name 'csvserver_tmtrafficpolicy_binding_example' | Invoke-NSDeleteCSVServerTMTrafficPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_tmtrafficpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_tmtrafficpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerTMTrafficPolicyBinding

# region Invoke-NSDeleteCSVServerTransformPolicyBinding
function Invoke-NSDeleteCSVServerTransformPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_transformpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the transformpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER PolicyName
        Policies bound to this vserver.
    .PARAMETER Bindpoint
        The bindpoint to which the policy is bound. Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, MQTT_JUMBO_REQ
    .PARAMETER Priority
        Priority for the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerTransformPolicyBinding -Name 'example' -PolicyName 'example' -Bindpoint REQUEST -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerTransformPolicyBinding -Name 'csvserver_transformpolicy_binding_example' | Invoke-NSDeleteCSVServerTransformPolicyBinding -Confirm:$false
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
        [ValidateSet('REQUEST', 'RESPONSE', 'ICA_REQUEST', 'OTHERTCP_REQUEST', 'MQTT_JUMBO_REQ')]
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_transformpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_transformpolicy_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerTransformPolicyBinding

# region Invoke-NSDeleteCSVServerVPNVServerBinding
function Invoke-NSDeleteCSVServerVPNVServerBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler csvserver_vpnvserver_binding resource.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
    .PARAMETER VServer
        Name of the default gslb or vpn vserver bound to CS vserver of type GSLB/VPN. For Example: bind cs vserver cs1 -vserver gslb1 or bind cs vserver cs1 -vserver vpn1. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteCSVServerVPNVServerBinding -Name 'example' -VServer 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetCSVServerVPNVServerBinding -Name 'csvserver_vpnvserver_binding_example' | Invoke-NSDeleteCSVServerVPNVServerBinding -Confirm:$false
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
        [string] $VServer,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('VServer')) {
            $argumentParts += 'vserver:' + $VServer
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete csvserver_vpnvserver_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type csvserver_vpnvserver_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteCSVServerVPNVServerBinding

# region Invoke-NSDisableCSVServer
function Invoke-NSDisableCSVServer {
    <#
    .SYNOPSIS
        Disables a NetScaler content switching virtual server.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
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
        Invoke-NSDisableCSVServer -Name 'csvserver_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Disable csvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver -Action disable -Payload @{ csvserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetCSVServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableCSVServer

# region Invoke-NSEnableCSVServer
function Invoke-NSEnableCSVServer {
    <#
    .SYNOPSIS
        Enables a NetScaler content switching virtual server.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
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
        Invoke-NSEnableCSVServer -Name 'csvserver_example' -PassThru
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Enable csvserver')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver -Action enable -Payload @{ csvserver = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetCSVServer -Name $Name -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableCSVServer

# region Invoke-NSGetCSAction
function Invoke-NSGetCSAction {
    <#
    .SYNOPSIS
        Gets NetScaler csaction configuration.
    .DESCRIPTION
        Configuration for Content Switching action resource.
    .PARAMETER Name
        Name for the content switching action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the content switching action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
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
        Invoke-NSGetCSAction
    .EXAMPLE
        Invoke-NSGetCSAction -Name 'csaction_example'
    .EXAMPLE
        Invoke-NSGetCSAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csaction'
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
# endregion Invoke-NSGetCSAction

# region Invoke-NSGetCsparameter
function Invoke-NSGetCsparameter {
    <#
    .SYNOPSIS
        Gets NetScaler csparameter configuration.
    .DESCRIPTION
        Configuration for CS parameter resource.
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
        Invoke-NSGetCsparameter
    .EXAMPLE
        Invoke-NSGetCsparameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCsparameter

# region Invoke-NSGetCSPolicy
function Invoke-NSGetCSPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicy configuration.
    .DESCRIPTION
        Configuration for content-switching policy resource.
    .PARAMETER PolicyName
        Name for the content switching policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
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
        Invoke-NSGetCSPolicy
    .EXAMPLE
        Invoke-NSGetCSPolicy -PolicyName 'cspolicy_example'
    .EXAMPLE
        Invoke-NSGetCSPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicy'
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
# endregion Invoke-NSGetCSPolicy

# region Invoke-NSGetCSPolicyBinding
function Invoke-NSGetCSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to cspolicy.
    .PARAMETER PolicyName
        Name of the content switching policy to display. If this parameter is omitted, details of all the policies are displayed. Minimum length = 1
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
        Invoke-NSGetCSPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSPolicyBinding -PolicyName 'cspolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicy_binding'
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
# endregion Invoke-NSGetCSPolicyBinding

# region Invoke-NSGetCSPolicyCRVServerBinding
function Invoke-NSGetCSPolicyCRVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicy_crvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the crvserver that can be bound to cspolicy.
    .PARAMETER PolicyName
        Name of the content switching policy to display. If this parameter is omitted, details of all the policies are displayed. Minimum length = 1
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
        Invoke-NSGetCSPolicyCRVServerBinding
    .EXAMPLE
        Invoke-NSGetCSPolicyCRVServerBinding -PolicyName 'cspolicy_crvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCSPolicyCRVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicy_crvserver_binding'
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
# endregion Invoke-NSGetCSPolicyCRVServerBinding

# region Invoke-NSGetCSPolicyCSPolicyLabelBinding
function Invoke-NSGetCSPolicyCSPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicy_cspolicylabel_binding configuration.
    .DESCRIPTION
        Binding object showing the cspolicylabel that can be bound to cspolicy.
    .PARAMETER PolicyName
        Name of the content switching policy to display. If this parameter is omitted, details of all the policies are displayed. Minimum length = 1
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
        Invoke-NSGetCSPolicyCSPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetCSPolicyCSPolicyLabelBinding -PolicyName 'cspolicy_cspolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetCSPolicyCSPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicy_cspolicylabel_binding'
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
# endregion Invoke-NSGetCSPolicyCSPolicyLabelBinding

# region Invoke-NSGetCSPolicyCSVServerBinding
function Invoke-NSGetCSPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to cspolicy.
    .PARAMETER PolicyName
        Name of the content switching policy to display. If this parameter is omitted, details of all the policies are displayed. Minimum length = 1
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
        Invoke-NSGetCSPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetCSPolicyCSVServerBinding -PolicyName 'cspolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCSPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicy_csvserver_binding'
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
# endregion Invoke-NSGetCSPolicyCSVServerBinding

# region Invoke-NSGetCSPolicyLabel
function Invoke-NSGetCSPolicyLabel {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicylabel configuration.
    .DESCRIPTION
        Configuration for CS policy label resource.
    .PARAMETER LabelName
        Name for the policy label. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. The label name must be unique within the list of policy labels for content switching. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policylabel" or 'my policylabel').
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
        Invoke-NSGetCSPolicyLabel
    .EXAMPLE
        Invoke-NSGetCSPolicyLabel -LabelName 'cspolicylabel_example'
    .EXAMPLE
        Invoke-NSGetCSPolicyLabel -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicylabel'
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
# endregion Invoke-NSGetCSPolicyLabel

# region Invoke-NSGetCSPolicyLabelBinding
function Invoke-NSGetCSPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicylabel_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to cspolicylabel.
    .PARAMETER LabelName
        Name of the content switching policy label to display.
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
        Invoke-NSGetCSPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetCSPolicyLabelBinding -LabelName 'cspolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetCSPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicylabel_binding'
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
# endregion Invoke-NSGetCSPolicyLabelBinding

# region Invoke-NSGetCSPolicyLabelCSPolicyBinding
function Invoke-NSGetCSPolicyLabelCSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler cspolicylabel_cspolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to cspolicylabel.
    .PARAMETER LabelName
        Name of the policy label to which to bind a content switching policy.
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
        Invoke-NSGetCSPolicyLabelCSPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSPolicyLabelCSPolicyBinding -LabelName 'cspolicylabel_cspolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSPolicyLabelCSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'cspolicylabel_cspolicy_binding'
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
# endregion Invoke-NSGetCSPolicyLabelCSPolicyBinding

# region Invoke-NSGetCSVServer
function Invoke-NSGetCSVServer {
    <#
    .SYNOPSIS
        Gets NetScaler content switching virtual server configuration.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
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
        Invoke-NSGetCSVServer
    .EXAMPLE
        Invoke-NSGetCSVServer -Name 'csvserver_example'
    .EXAMPLE
        Invoke-NSGetCSVServer -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver'
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
# endregion Invoke-NSGetCSVServer

# region Invoke-NSGetCSVServerAnalyticsProfileBinding
function Invoke-NSGetCSVServerAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_analyticsprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerAnalyticsProfileBinding
    .EXAMPLE
        Invoke-NSGetCSVServerAnalyticsProfileBinding -Name 'csvserver_analyticsprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerAnalyticsProfileBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_analyticsprofile_binding'
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
# endregion Invoke-NSGetCSVServerAnalyticsProfileBinding

# region Invoke-NSGetCSVServerAppFlowPolicyBinding
function Invoke-NSGetCSVServerAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_appflowpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerAppFlowPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerAppFlowPolicyBinding -Name 'csvserver_appflowpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerAppFlowPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_appflowpolicy_binding'
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
# endregion Invoke-NSGetCSVServerAppFlowPolicyBinding

# region Invoke-NSGetCSVServerAppFwPolicyBinding
function Invoke-NSGetCSVServerAppFwPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_appfwpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appfwpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerAppFwPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerAppFwPolicyBinding -Name 'csvserver_appfwpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerAppFwPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_appfwpolicy_binding'
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
# endregion Invoke-NSGetCSVServerAppFwPolicyBinding

# region Invoke-NSGetCSVServerAppQoEPolicyBinding
function Invoke-NSGetCSVServerAppQoEPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_appqoepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appqoepolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerAppQoEPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerAppQoEPolicyBinding -Name 'csvserver_appqoepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerAppQoEPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_appqoepolicy_binding'
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
# endregion Invoke-NSGetCSVServerAppQoEPolicyBinding

# region Invoke-NSGetCSVServerAuditNSLogPolicyBinding
function Invoke-NSGetCSVServerAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_auditnslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerAuditNSLogPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerAuditNSLogPolicyBinding -Name 'csvserver_auditnslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerAuditNSLogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_auditnslogpolicy_binding'
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
# endregion Invoke-NSGetCSVServerAuditNSLogPolicyBinding

# region Invoke-NSGetCSVServerAuditSyslogPolicyBinding
function Invoke-NSGetCSVServerAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_auditsyslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerAuditSyslogPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerAuditSyslogPolicyBinding -Name 'csvserver_auditsyslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerAuditSyslogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_auditsyslogpolicy_binding'
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
# endregion Invoke-NSGetCSVServerAuditSyslogPolicyBinding

# region Invoke-NSGetCSVServerAuthorizationPolicyBinding
function Invoke-NSGetCSVServerAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_authorizationpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerAuthorizationPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerAuthorizationPolicyBinding -Name 'csvserver_authorizationpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerAuthorizationPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_authorizationpolicy_binding'
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
# endregion Invoke-NSGetCSVServerAuthorizationPolicyBinding

# region Invoke-NSGetCSVServerBinding
function Invoke-NSGetCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to csvserver.
    .PARAMETER Name
        Name of a content switching virtual server for which to display information, including the policies bound to the virtual server. To display a list of all configured Content Switching virtual servers, do not specify a value for this parameter. Minimum length = 1
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
        Invoke-NSGetCSVServerBinding
    .EXAMPLE
        Invoke-NSGetCSVServerBinding -Name 'csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_binding'
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
# endregion Invoke-NSGetCSVServerBinding

# region Invoke-NSGetCSVServerBotPolicyBinding
function Invoke-NSGetCSVServerBotPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_botpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerBotPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerBotPolicyBinding -Name 'csvserver_botpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerBotPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_botpolicy_binding'
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
# endregion Invoke-NSGetCSVServerBotPolicyBinding

# region Invoke-NSGetCSVServerCachePolicyBinding
function Invoke-NSGetCSVServerCachePolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_cachepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cachepolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerCachePolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerCachePolicyBinding -Name 'csvserver_cachepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerCachePolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_cachepolicy_binding'
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
# endregion Invoke-NSGetCSVServerCachePolicyBinding

# region Invoke-NSGetCSVServerCMPPolicyBinding
function Invoke-NSGetCSVServerCMPPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_cmppolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cmppolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerCMPPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerCMPPolicyBinding -Name 'csvserver_cmppolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerCMPPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_cmppolicy_binding'
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
# endregion Invoke-NSGetCSVServerCMPPolicyBinding

# region Invoke-NSGetCSVServerContentInspectionPolicyBinding
function Invoke-NSGetCSVServerContentInspectionPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_contentinspectionpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the contentinspectionpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerContentInspectionPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerContentInspectionPolicyBinding -Name 'csvserver_contentinspectionpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerContentInspectionPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_contentinspectionpolicy_binding'
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
# endregion Invoke-NSGetCSVServerContentInspectionPolicyBinding

# region Invoke-NSGetCSVServerCSPolicyBinding
function Invoke-NSGetCSVServerCSPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_cspolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the cspolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerCSPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerCSPolicyBinding -Name 'csvserver_cspolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerCSPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_cspolicy_binding'
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
# endregion Invoke-NSGetCSVServerCSPolicyBinding

# region Invoke-NSGetCSVServerDomainBinding
function Invoke-NSGetCSVServerDomainBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_domain_binding configuration.
    .DESCRIPTION
        Binding object showing the domain that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerDomainBinding
    .EXAMPLE
        Invoke-NSGetCSVServerDomainBinding -Name 'csvserver_domain_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerDomainBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_domain_binding'
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
# endregion Invoke-NSGetCSVServerDomainBinding

# region Invoke-NSGetCSVServerFEOPolicyBinding
function Invoke-NSGetCSVServerFEOPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_feopolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the feopolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerFEOPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerFEOPolicyBinding -Name 'csvserver_feopolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerFEOPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_feopolicy_binding'
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
# endregion Invoke-NSGetCSVServerFEOPolicyBinding

# region Invoke-NSGetCSVServerGSLBVServerBinding
function Invoke-NSGetCSVServerGSLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_gslbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the gslbvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerGSLBVServerBinding
    .EXAMPLE
        Invoke-NSGetCSVServerGSLBVServerBinding -Name 'csvserver_gslbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerGSLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_gslbvserver_binding'
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
# endregion Invoke-NSGetCSVServerGSLBVServerBinding

# region Invoke-NSGetCSVServerLBVServerBinding
function Invoke-NSGetCSVServerLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerLBVServerBinding
    .EXAMPLE
        Invoke-NSGetCSVServerLBVServerBinding -Name 'csvserver_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_lbvserver_binding'
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
# endregion Invoke-NSGetCSVServerLBVServerBinding

# region Invoke-NSGetCSVServerResponderPolicyBinding
function Invoke-NSGetCSVServerResponderPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_responderpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerResponderPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerResponderPolicyBinding -Name 'csvserver_responderpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerResponderPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_responderpolicy_binding'
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
# endregion Invoke-NSGetCSVServerResponderPolicyBinding

# region Invoke-NSGetCSVServerRewritePolicyBinding
function Invoke-NSGetCSVServerRewritePolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_rewritepolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the rewritepolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerRewritePolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerRewritePolicyBinding -Name 'csvserver_rewritepolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerRewritePolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_rewritepolicy_binding'
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
# endregion Invoke-NSGetCSVServerRewritePolicyBinding

# region Invoke-NSGetCSVServerSpilloverPolicyBinding
function Invoke-NSGetCSVServerSpilloverPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_spilloverpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the spilloverpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerSpilloverPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerSpilloverPolicyBinding -Name 'csvserver_spilloverpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerSpilloverPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_spilloverpolicy_binding'
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
# endregion Invoke-NSGetCSVServerSpilloverPolicyBinding

# region Invoke-NSGetCSVServerTMTrafficPolicyBinding
function Invoke-NSGetCSVServerTMTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_tmtrafficpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the tmtrafficpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerTMTrafficPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerTMTrafficPolicyBinding -Name 'csvserver_tmtrafficpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerTMTrafficPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_tmtrafficpolicy_binding'
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
# endregion Invoke-NSGetCSVServerTMTrafficPolicyBinding

# region Invoke-NSGetCSVServerTransformPolicyBinding
function Invoke-NSGetCSVServerTransformPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_transformpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the transformpolicy that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerTransformPolicyBinding
    .EXAMPLE
        Invoke-NSGetCSVServerTransformPolicyBinding -Name 'csvserver_transformpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerTransformPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_transformpolicy_binding'
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
# endregion Invoke-NSGetCSVServerTransformPolicyBinding

# region Invoke-NSGetCSVServerVPNVServerBinding
function Invoke-NSGetCSVServerVPNVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler csvserver_vpnvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to csvserver.
    .PARAMETER Name
        Name of the content switching virtual server to which the content switching policy applies. Minimum length = 1
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
        Invoke-NSGetCSVServerVPNVServerBinding
    .EXAMPLE
        Invoke-NSGetCSVServerVPNVServerBinding -Name 'csvserver_vpnvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetCSVServerVPNVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'csvserver_vpnvserver_binding'
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
# endregion Invoke-NSGetCSVServerVPNVServerBinding

# region Invoke-NSRenameCSAction
function Invoke-NSRenameCSAction {
    <#
    .SYNOPSIS
        Renames a NetScaler csaction resource.
    .DESCRIPTION
        Configuration for Content Switching action resource.
    .PARAMETER Name
        Name for the content switching action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the content switching action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
    .PARAMETER NewName
        New name for the content switching action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my name" or 'my name'). Minimum length = 1
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
        Invoke-NSRenameCSAction -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCSAction -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename csaction')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csaction -Action rename -Payload @{ csaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCSAction -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCSAction

# region Invoke-NSRenameCSPolicy
function Invoke-NSRenameCSPolicy {
    <#
    .SYNOPSIS
        Renames a NetScaler cspolicy resource.
    .DESCRIPTION
        Configuration for content-switching policy resource.
    .PARAMETER PolicyName
        Name for the content switching policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
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
        Invoke-NSRenameCSPolicy -PolicyName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCSPolicy -PolicyName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Rename cspolicy')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cspolicy -Action rename -Payload @{ cspolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCSPolicy -PolicyName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCSPolicy

# region Invoke-NSRenameCSPolicyLabel
function Invoke-NSRenameCSPolicyLabel {
    <#
    .SYNOPSIS
        Renames a NetScaler cspolicylabel resource.
    .DESCRIPTION
        Configuration for CS policy label resource.
    .PARAMETER LabelName
        Name for the policy label. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. The label name must be unique within the list of policy labels for content switching. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policylabel" or 'my policylabel').
    .PARAMETER NewName
        The new name of the content switching policylabel. Minimum length = 1
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
        Invoke-NSRenameCSPolicyLabel -LabelName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCSPolicyLabel -LabelName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Rename cspolicylabel')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cspolicylabel -Action rename -Payload @{ cspolicylabel = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCSPolicyLabel -LabelName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCSPolicyLabel

# region Invoke-NSRenameCSVServer
function Invoke-NSRenameCSVServer {
    <#
    .SYNOPSIS
        Renames a NetScaler csvserver resource.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
    .PARAMETER NewName
        New name for the virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my name" or 'my name'). Minimum length = 1
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
        Invoke-NSRenameCSVServer -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameCSVServer -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename csvserver')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver -Action rename -Payload @{ csvserver = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCSVServer -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameCSVServer

# region Invoke-NSUnsetCSAction
function Invoke-NSUnsetCSAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler csaction resource properties.
    .DESCRIPTION
        Configuration for Content Switching action resource.
    .PARAMETER Name
        Name for the content switching action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the content switching action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
    .PARAMETER Comment
        Comments associated with this cs action.
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
        Invoke-NSUnsetCSAction -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUnsetCSAction -Name 'example' -Comment 'Updated by automation' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear csaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csaction -Action unset -Payload @{ csaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCSAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCSAction

# region Invoke-NSUnsetCsparameter
function Invoke-NSUnsetCsparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler csparameter resource properties.
    .DESCRIPTION
        Configuration for CS parameter resource.
    .PARAMETER Stateupdate
        Specifies whether the virtual server checks the attached load balancing server for state information. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetCsparameter -Stateupdate ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetCsparameter -Stateupdate ENABLED -WhatIf
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
        [switch] $Stateupdate,

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
        if ($PSBoundParameters.ContainsKey('Stateupdate')) { $body['stateupdate'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('csparameter', 'Clear csparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csparameter -Action unset -Payload @{ csparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCsparameter

# region Invoke-NSUnsetCSPolicy
function Invoke-NSUnsetCSPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler cspolicy resource properties.
    .DESCRIPTION
        Configuration for content-switching policy resource.
    .PARAMETER PolicyName
        Name for the content switching policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER LogAction
        The log action associated with the content switching policy.
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
        Invoke-NSUnsetCSPolicy -PolicyName 'example' -LogAction  -PassThru
    .EXAMPLE
        Invoke-NSUnsetCSPolicy -PolicyName 'example' -LogAction  -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$PolicyName", 'Clear cspolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type cspolicy -Action unset -Payload @{ cspolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCSPolicy -PolicyName $PolicyName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCSPolicy

# region Invoke-NSUnsetCSVServer
function Invoke-NSUnsetCSVServer {
    <#
    .SYNOPSIS
        Clears one or more NetScaler csvserver resource properties.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
    .PARAMETER APIProfile
        The API profile where one or more API specs are bounded to. Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Authentication
        Authenticate users who request a connection to the content switching virtual server. Default value: OFF Possible values = ON, OFF
    .PARAMETER AuthenticationHost
        FQDN of the authentication virtual server. The service type of the virtual server should be either HTTP or SSL. Minimum length = 3 Maximum length = 252
    .PARAMETER Authn401
        Enable HTTP 401-response based authentication. Default value: OFF Possible values = ON, OFF
    .PARAMETER AuthnProfile
        Name of the authentication profile to be used when authentication is turned on.
    .PARAMETER AuthnVServerName
        Name of authentication virtual server that authenticates the incoming user requests to this content switching virtual server. . Minimum length = 1 Maximum length = 252
    .PARAMETER BackupPersistenceTimeout
        Time period for which backup persistence is in effect. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER BackupVServer
        Name of the backup virtual server that you are configuring. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the backup virtual server is created. You can assign a different backup virtual server or rename the existing virtual server. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks. Minimum length = 1
    .PARAMETER Cacheable
        Use this option to specify whether a virtual server, used for load balancing or content switching, routes requests to the cache redirection virtual server before sending it to the configured servers. Default value: NO Possible values = YES, NO
    .PARAMETER Casesensitive
        Consider case in URLs (for policies that use URLs instead of RULES). For example, with the ON setting, the URLs /a/1.html and /A/1.HTML are treated differently and can have different targets (set by content switching policies). With the OFF setting, /a/1.html and /A/1.HTML are switched to the same target. Default value: ON Possible values = ON, OFF
    .PARAMETER CltTimeout
        Idle time, in seconds, after which the client connection is terminated. The default values are: 180 seconds for HTTP/SSL-based services. 9000 seconds for other TCP-based services. 120 seconds for DNS-based services. 120 seconds for other UDP-based services. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Information about this virtual server.
    .PARAMETER CookieName
        Use this parameter to specify the cookie name for COOKIE peristence type. It specifies the name of cookie with a maximum of 32 characters. If not specified, cookie name is internally generated.
    .PARAMETER DBProfileName
        Name of the DB profile. Minimum length = 1 Maximum length = 127
    .PARAMETER DisablePrimaryOnDown
        Continue forwarding the traffic to backup virtual server even after the primary server comes UP from the DOWN state. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSOverHTTPS
        This option is used to enable/disable DNS over HTTPS (DoH) processing. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the VServer. DNS profile properties will applied to the transactions processed by a VServer. This parameter is valid only for DNS and DNS-TCP VServers. Minimum length = 1 Maximum length = 127
    .PARAMETER DNSRecordType
        . Default value: NSGSLB_IPV4 Possible values = A, AAAA, CNAME, NAPTR
    .PARAMETER DownStateFlush
        Flush all active transactions associated with a virtual server whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Dtls
        This option starts/stops the dtls service on the vserver. Default value: OFF Possible values = ON, OFF
    .PARAMETER HTTPProfileName
        Name of the HTTP profile containing HTTP configuration settings for the virtual server. The service type of the virtual server should be either HTTP or SSL. Minimum length = 1 Maximum length = 127
    .PARAMETER HTTPSRedirectURL
        URL to which all HTTP traffic received on the port specified in the -redirectFromPort parameter is redirected.
    .PARAMETER ICMPVsrResponse
        Can be active or passive. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER InsertVServerIPPort
        Insert the virtual server's VIP address and port number in the request header. Available values function as follows: VIPADDR - Header contains the vserver's IP address and port number without any translation. OFF - The virtual IP and port header insertion option is disabled. V6TOV4MAPPING - Header contains the mapped IPv4 address corresponding to the IPv6 address of the vserver and the port number. An IPv6 address can be mapped to a user-specified IPv4 address using the set ns ip6 command. Possible values = OFF, VIPADDR, V6TOV4MAPPING
    .PARAMETER IPSet
        The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cs vserver. Minimum length = 1
    .PARAMETER L2Conn
        Use L2 Parameters to identify a connection. Possible values = ON, OFF
    .PARAMETER ListenPolicy
        String specifying the listen policy for the content switching virtual server. Can be either the name of an existing expression or an in-line expression. Default value: "NONE"
    .PARAMETER ListenPriority
        Integer specifying the priority of the listen policy. A higher number specifies a lower priority. If a request matches the listen policies of more than one virtual server the virtual server whose listen policy has the highest priority (the lowest priority number) accepts the request. Default value: 101 Minimum value = 0 Maximum value = 100
    .PARAMETER MSSQLServerVersion
        The version of the MSSQL server. Default value: 2008R2 Possible values = 70, 2000, 2000SP1, 2005, 2008, 2008R2, 2012, 2014
    .PARAMETER MySQLCharacterSet
        The character set returned by the mysql vserver. Default value: 8
    .PARAMETER MySQLProtocolVersion
        The protocol version returned by the mysql vserver. Default value: 10
    .PARAMETER MySQLServerCapabilities
        The server capabilities returned by the mysql vserver. Default value: 41613
    .PARAMETER MySQLServerVersion
        The server version string returned by the mysql vserver. Minimum length = 1 Maximum length = 31
    .PARAMETER NetProfile
        The name of the network profile. Minimum length = 1 Maximum length = 127
    .PARAMETER OracleServerVersion
        Oracle server version. Default value: 10G Possible values = 10G, 11G
    .PARAMETER PersistenceBackup
        Backup persistence type for the virtual server. Becomes operational if the primary persistence mechanism fails. Possible values = SOURCEIP, NONE
    .PARAMETER PersistenceId
        . Minimum value = 0 Maximum value = 65535
    .PARAMETER PersistenceType
        Type of persistence for the virtual server. Available settings function as follows: * SOURCEIP - Connections from the same client IP address belong to the same persistence session. * COOKIEINSERT - Connections that have the same HTTP Cookie, inserted by a Set-Cookie directive from a server, belong to the same persistence session. * SSLSESSION - Connections that have the same SSL Session ID belong to the same persistence session. Possible values = SOURCEIP, COOKIEINSERT, SSLSESSION, NONE
    .PARAMETER PersistMask
        Persistence mask for IP based persistence types, for IPv4 virtual servers. Minimum length = 1
    .PARAMETER Precedence
        Type of precedence to use for both RULE-based and URL-based policies on the content switching virtual server. With the default (RULE) setting, incoming requests are evaluated against the rule-based content switching policies. If none of the rules match, the URL in the request is evaluated against the URL-based content switching policies. Default value: RULE Possible values = RULE, URL
    .PARAMETER ProbeProtocol
        Citrix ADC provides support for external health check of the vserver status. Select HTTP or TCP probes for healthcheck. Possible values = TCP, HTTP
    .PARAMETER ProbeSuccessResponseCode
        HTTP code to return in SUCCESS case. Default value: "200 OK" Minimum length = 1 Maximum length = 64
    .PARAMETER Push
        Process traffic with the push virtual server that is bound to this content switching virtual server (specified by the Push VServer parameter). The service type of the push virtual server should be either HTTP or SSL. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PushLabel
        Expression for extracting the label from the response received from server. This string can be either an existing rule name or an inline expression. The service type of the virtual server should be either HTTP or SSL. Default value: "none"
    .PARAMETER PushMultiClients
        Allow multiple Web 2.0 connections from the same client to connect to the virtual server and expect updates. Default value: NO Possible values = YES, NO
    .PARAMETER PushVServer
        Name of the load balancing virtual server, of type PUSH or SSL_PUSH, to which the server pushes updates received on the client-facing load balancing virtual server. Minimum length = 1
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the Content Switching VServer. Minimum length = 1 Maximum length = 255
    .PARAMETER RedirectFromPort
        Port number for the virtual server, from which we absorb the traffic for http redirect. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER RedirectPortRewrite
        State of port rewrite while performing HTTP redirect. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER RedirectURL
        URL to which traffic is redirected if the virtual server becomes unavailable. The service type of the virtual server should be either HTTP or SSL. Caution: Make sure that the domain in the URL does not match the domain specified for a content switching policy. If it does, requests are continuously redirected to the unavailable virtual server. Minimum length = 1
    .PARAMETER Rhistate
        A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute. * If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP. * If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER RTSPNAT
        Enable network address translation (NAT) for real-time streaming protocol (RTSP) connections. Default value: OFF Possible values = ON, OFF
    .PARAMETER SoBackupAction
        Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists. Possible values = DROP, ACCEPT, REDIRECT
    .PARAMETER SoMethod
        Type of spillover used to divert traffic to the backup virtual server when the primary virtual server reaches the spillover threshold. Connection spillover is based on the number of connections. Bandwidth spillover is based on the total Kbps of incoming and outgoing traffic. Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE
    .PARAMETER SoPersistence
        Maintain source-IP based persistence on primary and backup virtual servers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SoPersistenceTimeout
        Time-out value, in minutes, for spillover persistence. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER SoThreshold
        Depending on the spillover method, the maximum number of connections or the maximum total bandwidth (Kbps) that a virtual server can handle before spillover occurs. Minimum value = 1 Maximum value = 4294967287
    .PARAMETER Stateupdate
        Enable state updates for a specific content switching virtual server. By default, the Content Switching virtual server is always UP, regardless of the state of the Load Balancing virtual servers bound to it. This parameter interacts with the global setting as follows: Global Level | Vserver Level | Result ENABLED ENABLED ENABLED ENABLED DISABLED ENABLED DISABLED ENABLED ENABLED DISABLED DISABLED DISABLED If you want to enable state updates for only some content switching virtual servers, be sure to disable the state update parameter. Default value: DISABLED Possible values = ENABLED, DISABLED, UPDATEONBACKENDUPDATE
    .PARAMETER TCPProbePort
        Port number for external TCP probe. NetScaler provides support for external TCP health check of the vserver status over the selected port. This option is only supported for vservers assigned with an IPAddress or ipset. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER TCPProfileName
        Name of the TCP profile containing TCP configuration settings for the virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER Timeout
        Time period for which a persistence session is in effect. Default value: 2 Minimum value = 0 Maximum value = 1440
    .PARAMETER V6PersistMaskLen
        Persistence mask for IP based persistence types, for IPv6 virtual servers. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER VIPHeader
        Name of virtual server IP and port header, for use with the VServer IP Port Insertion parameter. Minimum length = 1
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
        Invoke-NSUnsetCSVServer -Name 'example' -APIProfile  -PassThru
    .EXAMPLE
        Invoke-NSUnsetCSVServer -Name 'example' -APIProfile  -WhatIf
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
        [switch] $APIProfile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowLog,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Authentication,

        [Parameter()]
        [switch] $AuthenticationHost,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Authn401,

        [Parameter()]
        [switch] $AuthnProfile,

        [Parameter()]
        [switch] $AuthnVServerName,

        [Parameter()]
        [switch] $BackupPersistenceTimeout,

        [Parameter()]
        [switch] $BackupVServer,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Cacheable,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Casesensitive,

        [Parameter()]
        [switch] $CltTimeout,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [switch] $CookieName,

        [Parameter()]
        [switch] $DBProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DisablePrimaryOnDown,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNSOverHTTPS,

        [Parameter()]
        [switch] $DNSProfileName,

        [Parameter()]
        [ValidateSet('A', 'AAAA', 'CNAME', 'NAPTR')]
        [switch] $DNSRecordType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DownStateFlush,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Dtls,

        [Parameter()]
        [switch] $HTTPProfileName,

        [Parameter()]
        [switch] $HTTPSRedirectURL,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [switch] $ICMPVsrResponse,

        [Parameter()]
        [ValidateSet('OFF', 'VIPADDR', 'V6TOV4MAPPING')]
        [switch] $InsertVServerIPPort,

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
        [ValidateSet('70', '2000', '2000SP1', '2005', '2008', '2008R2', '2012', '2014')]
        [switch] $MSSQLServerVersion,

        [Parameter()]
        [switch] $MySQLCharacterSet,

        [Parameter()]
        [switch] $MySQLProtocolVersion,

        [Parameter()]
        [switch] $MySQLServerCapabilities,

        [Parameter()]
        [switch] $MySQLServerVersion,

        [Parameter()]
        [switch] $NetProfile,

        [Parameter()]
        [ValidateSet('10G', '11G')]
        [switch] $OracleServerVersion,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'NONE')]
        [switch] $PersistenceBackup,

        [Parameter()]
        [switch] $PersistenceId,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'COOKIEINSERT', 'SSLSESSION', 'NONE')]
        [switch] $PersistenceType,

        [Parameter()]
        [switch] $PersistMask,

        [Parameter()]
        [ValidateSet('RULE', 'URL')]
        [switch] $Precedence,

        [Parameter()]
        [ValidateSet('TCP', 'HTTP')]
        [switch] $ProbeProtocol,

        [Parameter()]
        [switch] $ProbeSuccessResponseCode,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Push,

        [Parameter()]
        [switch] $PushLabel,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $PushMultiClients,

        [Parameter()]
        [switch] $PushVServer,

        [Parameter()]
        [switch] $QUICProfileName,

        [Parameter()]
        [switch] $RedirectFromPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $RedirectPortRewrite,

        [Parameter()]
        [switch] $RedirectURL,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [switch] $Rhistate,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $RTSPNAT,

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
        [ValidateSet('ENABLED', 'DISABLED', 'UPDATEONBACKENDUPDATE')]
        [switch] $Stateupdate,

        [Parameter()]
        [switch] $TCPProbePort,

        [Parameter()]
        [switch] $TCPProfileName,

        [Parameter()]
        [switch] $Timeout,

        [Parameter()]
        [switch] $V6PersistMaskLen,

        [Parameter()]
        [switch] $VIPHeader,

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
        if ($PSBoundParameters.ContainsKey('APIProfile')) { $body['apiprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $body['appflowlog'] = $true }
        if ($PSBoundParameters.ContainsKey('Authentication')) { $body['authentication'] = $true }
        if ($PSBoundParameters.ContainsKey('AuthenticationHost')) { $body['authenticationhost'] = $true }
        if ($PSBoundParameters.ContainsKey('Authn401')) { $body['authn401'] = $true }
        if ($PSBoundParameters.ContainsKey('AuthnProfile')) { $body['authnprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('AuthnVServerName')) { $body['authnvsname'] = $true }
        if ($PSBoundParameters.ContainsKey('BackupPersistenceTimeout')) { $body['backuppersistencetimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('BackupVServer')) { $body['backupvserver'] = $true }
        if ($PSBoundParameters.ContainsKey('Cacheable')) { $body['cacheable'] = $true }
        if ($PSBoundParameters.ContainsKey('Casesensitive')) { $body['casesensitive'] = $true }
        if ($PSBoundParameters.ContainsKey('CltTimeout')) { $body['clttimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('CookieName')) { $body['cookiename'] = $true }
        if ($PSBoundParameters.ContainsKey('DBProfileName')) { $body['dbprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $body['disableprimaryondown'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSOverHTTPS')) { $body['dnsoverhttps'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $body['dnsprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('DNSRecordType')) { $body['dnsrecordtype'] = $true }
        if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $body['downstateflush'] = $true }
        if ($PSBoundParameters.ContainsKey('Dtls')) { $body['dtls'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $body['httpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPSRedirectURL')) { $body['httpsredirecturl'] = $true }
        if ($PSBoundParameters.ContainsKey('ICMPVsrResponse')) { $body['icmpvsrresponse'] = $true }
        if ($PSBoundParameters.ContainsKey('InsertVServerIPPort')) { $body['insertvserveripport'] = $true }
        if ($PSBoundParameters.ContainsKey('IPSet')) { $body['ipset'] = $true }
        if ($PSBoundParameters.ContainsKey('L2Conn')) { $body['l2conn'] = $true }
        if ($PSBoundParameters.ContainsKey('ListenPolicy')) { $body['listenpolicy'] = $true }
        if ($PSBoundParameters.ContainsKey('ListenPriority')) { $body['listenpriority'] = $true }
        if ($PSBoundParameters.ContainsKey('MSSQLServerVersion')) { $body['mssqlserverversion'] = $true }
        if ($PSBoundParameters.ContainsKey('MySQLCharacterSet')) { $body['mysqlcharacterset'] = $true }
        if ($PSBoundParameters.ContainsKey('MySQLProtocolVersion')) { $body['mysqlprotocolversion'] = $true }
        if ($PSBoundParameters.ContainsKey('MySQLServerCapabilities')) { $body['mysqlservercapabilities'] = $true }
        if ($PSBoundParameters.ContainsKey('MySQLServerVersion')) { $body['mysqlserverversion'] = $true }
        if ($PSBoundParameters.ContainsKey('NetProfile')) { $body['netprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('OracleServerVersion')) { $body['oracleserverversion'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistenceBackup')) { $body['persistencebackup'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistenceId')) { $body['persistenceid'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistenceType')) { $body['persistencetype'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistMask')) { $body['persistmask'] = $true }
        if ($PSBoundParameters.ContainsKey('Precedence')) { $body['precedence'] = $true }
        if ($PSBoundParameters.ContainsKey('ProbeProtocol')) { $body['probeprotocol'] = $true }
        if ($PSBoundParameters.ContainsKey('ProbeSuccessResponseCode')) { $body['probesuccessresponsecode'] = $true }
        if ($PSBoundParameters.ContainsKey('Push')) { $body['push'] = $true }
        if ($PSBoundParameters.ContainsKey('PushLabel')) { $body['pushlabel'] = $true }
        if ($PSBoundParameters.ContainsKey('PushMultiClients')) { $body['pushmulticlients'] = $true }
        if ($PSBoundParameters.ContainsKey('PushVServer')) { $body['pushvserver'] = $true }
        if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $body['quicprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectFromPort')) { $body['redirectfromport'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectPortRewrite')) { $body['redirectportrewrite'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectURL')) { $body['redirecturl'] = $true }
        if ($PSBoundParameters.ContainsKey('Rhistate')) { $body['rhistate'] = $true }
        if ($PSBoundParameters.ContainsKey('RTSPNAT')) { $body['rtspnat'] = $true }
        if ($PSBoundParameters.ContainsKey('SoBackupAction')) { $body['sobackupaction'] = $true }
        if ($PSBoundParameters.ContainsKey('SoMethod')) { $body['somethod'] = $true }
        if ($PSBoundParameters.ContainsKey('SoPersistence')) { $body['sopersistence'] = $true }
        if ($PSBoundParameters.ContainsKey('SoPersistenceTimeout')) { $body['sopersistencetimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('SoThreshold')) { $body['sothreshold'] = $true }
        if ($PSBoundParameters.ContainsKey('Stateupdate')) { $body['stateupdate'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProbePort')) { $body['tcpprobeport'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $body['tcpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('Timeout')) { $body['timeout'] = $true }
        if ($PSBoundParameters.ContainsKey('V6PersistMaskLen')) { $body['v6persistmasklen'] = $true }
        if ($PSBoundParameters.ContainsKey('VIPHeader')) { $body['vipheader'] = $true }
        if ($PSBoundParameters.ContainsKey('WASMModule')) { $body['wasmmodule'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear csvserver properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type csvserver -Action unset -Payload @{ csvserver = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetCSVServer -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCSVServer

# region Invoke-NSUpdateCSAction
function Invoke-NSUpdateCSAction {
    <#
    .SYNOPSIS
        Updates a NetScaler csaction resource.
    .DESCRIPTION
        Configuration for Content Switching action resource.
    .PARAMETER Comment
        Comments associated with this cs action.
    .PARAMETER Name
        Name for the content switching action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the content switching action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
    .PARAMETER TargetlbVServer
        Name of the load balancing virtual server to which the content is switched.
    .PARAMETER TargetVServer
        Name of the VPN, GSLB or Authentication virtual server to which the content is switched.
    .PARAMETER TargetVServerExpr
        Information about this content switching action. Maximum length = 1499
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
        Invoke-NSUpdateCSAction -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCSAction -Name 'example' -Comment 'Updated by automation' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $TargetlbVServer,

        [Parameter()]
        [string] $TargetVServer,

        [Parameter()]
        [string] $TargetVServerExpr,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('TargetlbVServer')) { $properties['targetlbvserver'] = $TargetlbVServer }
    if ($PSBoundParameters.ContainsKey('TargetVServer')) { $properties['targetvserver'] = $TargetVServer }
    if ($PSBoundParameters.ContainsKey('TargetVServerExpr')) { $properties['targetvserverexpr'] = $TargetVServerExpr }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update csaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type csaction -Payload @{ csaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCSAction

# region Invoke-NSUpdateCsparameter
function Invoke-NSUpdateCsparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler csparameter resource.
    .DESCRIPTION
        Configuration for CS parameter resource.
    .PARAMETER Stateupdate
        Specifies whether the virtual server checks the attached load balancing server for state information. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateCsparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateCsparameter  -WhatIf
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
        [string] $Stateupdate,

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
    if ($PSBoundParameters.ContainsKey('Stateupdate')) { $properties['stateupdate'] = $Stateupdate }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('csparameter', 'Update csparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type csparameter -Payload @{ csparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateCsparameter

# region Invoke-NSUpdateCSPolicy
function Invoke-NSUpdateCSPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler cspolicy resource.
    .DESCRIPTION
        Configuration for content-switching policy resource.
    .PARAMETER Action
        Content switching action that names the target load balancing virtual server to which the traffic is switched.
    .PARAMETER LogAction
        The log action associated with the content switching policy.
    .PARAMETER PolicyName
        Name for the content switching policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Expression, or name of a named expression, against which traffic is evaluated. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
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
        Invoke-NSUpdateCSPolicy -PolicyName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCSPolicy -PolicyName 'example' -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$PolicyName", 'Update cspolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type cspolicy -Payload @{ cspolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSPolicy -PolicyName $PolicyName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCSPolicy

# region Invoke-NSUpdateCSVServer
function Invoke-NSUpdateCSVServer {
    <#
    .SYNOPSIS
        Updates a NetScaler content switching virtual server.
    .DESCRIPTION
        Configuration for CS virtual server resource.
    .PARAMETER APIProfile
        The API profile where one or more API specs are bounded to. Minimum length = 1
    .PARAMETER AppFlowLog
        Enable logging appflow flow information. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Authentication
        Authenticate users who request a connection to the content switching virtual server. Default value: OFF Possible values = ON, OFF
    .PARAMETER AuthenticationHost
        FQDN of the authentication virtual server. The service type of the virtual server should be either HTTP or SSL. Minimum length = 3 Maximum length = 252
    .PARAMETER Authn401
        Enable HTTP 401-response based authentication. Default value: OFF Possible values = ON, OFF
    .PARAMETER AuthnProfile
        Name of the authentication profile to be used when authentication is turned on.
    .PARAMETER AuthnVServerName
        Name of authentication virtual server that authenticates the incoming user requests to this content switching virtual server. . Minimum length = 1 Maximum length = 252
    .PARAMETER BackupIp
        . Minimum length = 1
    .PARAMETER BackupPersistenceTimeout
        Time period for which backup persistence is in effect. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER BackupVServer
        Name of the backup virtual server that you are configuring. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Can be changed after the backup virtual server is created. You can assign a different backup virtual server or rename the existing virtual server. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks. Minimum length = 1
    .PARAMETER Cacheable
        Use this option to specify whether a virtual server, used for load balancing or content switching, routes requests to the cache redirection virtual server before sending it to the configured servers. Default value: NO Possible values = YES, NO
    .PARAMETER Casesensitive
        Consider case in URLs (for policies that use URLs instead of RULES). For example, with the ON setting, the URLs /a/1.html and /A/1.HTML are treated differently and can have different targets (set by content switching policies). With the OFF setting, /a/1.html and /A/1.HTML are switched to the same target. Default value: ON Possible values = ON, OFF
    .PARAMETER CltTimeout
        Idle time, in seconds, after which the client connection is terminated. The default values are: 180 seconds for HTTP/SSL-based services. 9000 seconds for other TCP-based services. 120 seconds for DNS-based services. 120 seconds for other UDP-based services. Minimum value = 0 Maximum value = 31536000
    .PARAMETER Comment
        Information about this virtual server.
    .PARAMETER CookieDomain
        . Minimum length = 1
    .PARAMETER CookieName
        Use this parameter to specify the cookie name for COOKIE peristence type. It specifies the name of cookie with a maximum of 32 characters. If not specified, cookie name is internally generated.
    .PARAMETER CookieTimeout
        . Minimum value = 0 Maximum value = 1440
    .PARAMETER DBProfileName
        Name of the DB profile. Minimum length = 1 Maximum length = 127
    .PARAMETER DisablePrimaryOnDown
        Continue forwarding the traffic to backup virtual server even after the primary server comes UP from the DOWN state. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSOverHTTPS
        This option is used to enable/disable DNS over HTTPS (DoH) processing. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DNSProfileName
        Name of the DNS profile to be associated with the VServer. DNS profile properties will applied to the transactions processed by a VServer. This parameter is valid only for DNS and DNS-TCP VServers. Minimum length = 1 Maximum length = 127
    .PARAMETER DNSRecordType
        . Default value: NSGSLB_IPV4 Possible values = A, AAAA, CNAME, NAPTR
    .PARAMETER DomainName
        Domain name for which to change the time to live (TTL) and/or backup service IP address. Minimum length = 1
    .PARAMETER DownStateFlush
        Flush all active transactions associated with a virtual server whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Dtls
        This option starts/stops the dtls service on the vserver. Default value: OFF Possible values = ON, OFF
    .PARAMETER HTTPProfileName
        Name of the HTTP profile containing HTTP configuration settings for the virtual server. The service type of the virtual server should be either HTTP or SSL. Minimum length = 1 Maximum length = 127
    .PARAMETER HTTPSRedirectURL
        URL to which all HTTP traffic received on the port specified in the -redirectFromPort parameter is redirected.
    .PARAMETER ICMPVsrResponse
        Can be active or passive. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER InsertVServerIPPort
        Insert the virtual server's VIP address and port number in the request header. Available values function as follows: VIPADDR - Header contains the vserver's IP address and port number without any translation. OFF - The virtual IP and port header insertion option is disabled. V6TOV4MAPPING - Header contains the mapped IPv4 address corresponding to the IPv6 address of the vserver and the port number. An IPv6 address can be mapped to a user-specified IPv4 address using the set ns ip6 command. Possible values = OFF, VIPADDR, V6TOV4MAPPING
    .PARAMETER IPMask
        IP mask, in dotted decimal notation, for the IP Pattern parameter. Can have leading or trailing non-zero octets (for example, 255.255.240.0 or 0.0.255.255). Accordingly, the mask specifies whether the first n bits or the last n bits of the destination IP address in a client request are to be matched with the corresponding bits in the IP pattern. The former is called a forward mask. The latter is called a reverse mask.
    .PARAMETER IPPattern
        IP address pattern, in dotted decimal notation, for identifying packets to be accepted by the virtual server. The IP Mask parameter specifies which part of the destination IP address is matched against the pattern. Mutually exclusive with the IP Address parameter. For example, if the IP pattern assigned to the virtual server is 198.51.100.0 and the IP mask is 255.255.240.0 (a forward mask), the first 20 bits in the destination IP addresses are matched with the first 20 bits in the pattern. The virtual server accepts requests with IP addresses that range from 198.51.96.1 to 198.51.111.254. You can also use a pattern such as 0.0.2.2 and a mask such as 0.0.255.255 (a reverse mask). If a destination IP address matches more than one IP pattern, the pattern with the longest match is selected, and the associated virtual server processes the request. For example, if the virtual servers, vs1 and vs2, have the same IP pattern, 0.0.100.128, but different IP masks of 0.0.255.255 and 0.0.224.255, a destination IP address of 198.51.100.128 has the longest match with the IP pattern of vs1. If a destination IP address matches two or more virtual servers to the same extent, the request is processed by the virtual server whose port number matches the port number in the request.
    .PARAMETER IPSet
        The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current cs vserver. Minimum length = 1
    .PARAMETER IPv46
        IP address of the content switching virtual server. Minimum length = 1
    .PARAMETER L2Conn
        Use L2 Parameters to identify a connection. Possible values = ON, OFF
    .PARAMETER ListenPolicy
        String specifying the listen policy for the content switching virtual server. Can be either the name of an existing expression or an in-line expression. Default value: "NONE"
    .PARAMETER ListenPriority
        Integer specifying the priority of the listen policy. A higher number specifies a lower priority. If a request matches the listen policies of more than one virtual server the virtual server whose listen policy has the highest priority (the lowest priority number) accepts the request. Default value: 101 Minimum value = 0 Maximum value = 100
    .PARAMETER MSSQLServerVersion
        The version of the MSSQL server. Default value: 2008R2 Possible values = 70, 2000, 2000SP1, 2005, 2008, 2008R2, 2012, 2014
    .PARAMETER MySQLCharacterSet
        The character set returned by the mysql vserver. Default value: 8
    .PARAMETER MySQLProtocolVersion
        The protocol version returned by the mysql vserver. Default value: 10
    .PARAMETER MySQLServerCapabilities
        The server capabilities returned by the mysql vserver. Default value: 41613
    .PARAMETER MySQLServerVersion
        The server version string returned by the mysql vserver. Minimum length = 1 Maximum length = 31
    .PARAMETER Name
        Name for the content switching virtual server. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after the CS virtual server is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my server or my server). Minimum length = 1
    .PARAMETER NetProfile
        The name of the network profile. Minimum length = 1 Maximum length = 127
    .PARAMETER OracleServerVersion
        Oracle server version. Default value: 10G Possible values = 10G, 11G
    .PARAMETER PersistenceBackup
        Backup persistence type for the virtual server. Becomes operational if the primary persistence mechanism fails. Possible values = SOURCEIP, NONE
    .PARAMETER PersistenceId
        . Minimum value = 0 Maximum value = 65535
    .PARAMETER PersistenceType
        Type of persistence for the virtual server. Available settings function as follows: * SOURCEIP - Connections from the same client IP address belong to the same persistence session. * COOKIEINSERT - Connections that have the same HTTP Cookie, inserted by a Set-Cookie directive from a server, belong to the same persistence session. * SSLSESSION - Connections that have the same SSL Session ID belong to the same persistence session. Possible values = SOURCEIP, COOKIEINSERT, SSLSESSION, NONE
    .PARAMETER PersistMask
        Persistence mask for IP based persistence types, for IPv4 virtual servers. Minimum length = 1
    .PARAMETER Precedence
        Type of precedence to use for both RULE-based and URL-based policies on the content switching virtual server. With the default (RULE) setting, incoming requests are evaluated against the rule-based content switching policies. If none of the rules match, the URL in the request is evaluated against the URL-based content switching policies. Default value: RULE Possible values = RULE, URL
    .PARAMETER ProbePort
        Citrix ADC provides support for external health check of the vserver status. Select port for HTTP/TCP monitring. Default value: 0 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProbeProtocol
        Citrix ADC provides support for external health check of the vserver status. Select HTTP or TCP probes for healthcheck. Possible values = TCP, HTTP
    .PARAMETER ProbeSuccessResponseCode
        HTTP code to return in SUCCESS case. Default value: "200 OK" Minimum length = 1 Maximum length = 64
    .PARAMETER Push
        Process traffic with the push virtual server that is bound to this content switching virtual server (specified by the Push VServer parameter). The service type of the push virtual server should be either HTTP or SSL. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PushLabel
        Expression for extracting the label from the response received from server. This string can be either an existing rule name or an inline expression. The service type of the virtual server should be either HTTP or SSL. Default value: "none"
    .PARAMETER PushMultiClients
        Allow multiple Web 2.0 connections from the same client to connect to the virtual server and expect updates. Default value: NO Possible values = YES, NO
    .PARAMETER PushVServer
        Name of the load balancing virtual server, of type PUSH or SSL_PUSH, to which the server pushes updates received on the client-facing load balancing virtual server. Minimum length = 1
    .PARAMETER QUICProfileName
        Name of QUIC profile which will be attached to the Content Switching VServer. Minimum length = 1 Maximum length = 255
    .PARAMETER RedirectFromPort
        Port number for the virtual server, from which we absorb the traffic for http redirect. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER RedirectPortRewrite
        State of port rewrite while performing HTTP redirect. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER RedirectURL
        URL to which traffic is redirected if the virtual server becomes unavailable. The service type of the virtual server should be either HTTP or SSL. Caution: Make sure that the domain in the URL does not match the domain specified for a content switching policy. If it does, requests are continuously redirected to the unavailable virtual server. Minimum length = 1
    .PARAMETER Rhistate
        A host route is injected according to the setting on the virtual servers * If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute. * If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP. * If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance, injects even if one virtual server set to ACTIVE is UP. Default value: PASSIVE Possible values = PASSIVE, ACTIVE
    .PARAMETER RTSPNAT
        Enable network address translation (NAT) for real-time streaming protocol (RTSP) connections. Default value: OFF Possible values = ON, OFF
    .PARAMETER Sitedomainttl
        . Minimum value = 1
    .PARAMETER SoBackupAction
        Action to be performed if spillover is to take effect, but no backup chain to spillover is usable or exists. Possible values = DROP, ACCEPT, REDIRECT
    .PARAMETER SoMethod
        Type of spillover used to divert traffic to the backup virtual server when the primary virtual server reaches the spillover threshold. Connection spillover is based on the number of connections. Bandwidth spillover is based on the total Kbps of incoming and outgoing traffic. Possible values = CONNECTION, DYNAMICCONNECTION, BANDWIDTH, HEALTH, LLMQUOTA, NONE
    .PARAMETER SoPersistence
        Maintain source-IP based persistence on primary and backup virtual servers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SoPersistenceTimeout
        Time-out value, in minutes, for spillover persistence. Default value: 2 Minimum value = 2 Maximum value = 1440
    .PARAMETER SoThreshold
        Depending on the spillover method, the maximum number of connections or the maximum total bandwidth (Kbps) that a virtual server can handle before spillover occurs. Minimum value = 1 Maximum value = 4294967287
    .PARAMETER Stateupdate
        Enable state updates for a specific content switching virtual server. By default, the Content Switching virtual server is always UP, regardless of the state of the Load Balancing virtual servers bound to it. This parameter interacts with the global setting as follows: Global Level | Vserver Level | Result ENABLED ENABLED ENABLED ENABLED DISABLED ENABLED DISABLED ENABLED ENABLED DISABLED DISABLED DISABLED If you want to enable state updates for only some content switching virtual servers, be sure to disable the state update parameter. Default value: DISABLED Possible values = ENABLED, DISABLED, UPDATEONBACKENDUPDATE
    .PARAMETER TCPProbePort
        Port number for external TCP probe. NetScaler provides support for external TCP health check of the vserver status over the selected port. This option is only supported for vservers assigned with an IPAddress or ipset. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER TCPProfileName
        Name of the TCP profile containing TCP configuration settings for the virtual server. Minimum length = 1 Maximum length = 127
    .PARAMETER Timeout
        Time period for which a persistence session is in effect. Default value: 2 Minimum value = 0 Maximum value = 1440
    .PARAMETER Ttl
        . Minimum value = 1
    .PARAMETER V6PersistMaskLen
        Persistence mask for IP based persistence types, for IPv6 virtual servers. Default value: 128 Minimum value = 1 Maximum value = 128
    .PARAMETER VIPHeader
        Name of virtual server IP and port header, for use with the VServer IP Port Insertion parameter. Minimum length = 1
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
        Invoke-NSUpdateCSVServer -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateCSVServer -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $APIProfile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowLog,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Authentication,

        [Parameter()]
        [string] $AuthenticationHost,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Authn401,

        [Parameter()]
        [string] $AuthnProfile,

        [Parameter()]
        [string] $AuthnVServerName,

        [Parameter()]
        [string] $BackupIp,

        [Parameter()]
        [int] $BackupPersistenceTimeout,

        [Parameter()]
        [string] $BackupVServer,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Cacheable,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Casesensitive,

        [Parameter()]
        [int] $CltTimeout,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $CookieDomain,

        [Parameter()]
        [string] $CookieName,

        [Parameter()]
        [int] $CookieTimeout,

        [Parameter()]
        [string] $DBProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DisablePrimaryOnDown,

        [Parameter()]
        [string] $DNSOverHTTPS,

        [Parameter()]
        [string] $DNSProfileName,

        [Parameter()]
        [ValidateSet('A', 'AAAA', 'CNAME', 'NAPTR')]
        [string] $DNSRecordType,

        [Parameter()]
        [string] $DomainName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DownStateFlush,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Dtls,

        [Parameter()]
        [string] $HTTPProfileName,

        [Parameter()]
        [string] $HTTPSRedirectURL,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $ICMPVsrResponse,

        [Parameter()]
        [ValidateSet('OFF', 'VIPADDR', 'V6TOV4MAPPING')]
        [string] $InsertVServerIPPort,

        [Parameter()]
        [string] $IPMask,

        [Parameter()]
        [string] $IPPattern,

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
        [ValidateSet('70', '2000', '2000SP1', '2005', '2008', '2008R2', '2012', '2014')]
        [string] $MSSQLServerVersion,

        [Parameter()]
        [int] $MySQLCharacterSet,

        [Parameter()]
        [int] $MySQLProtocolVersion,

        [Parameter()]
        [int] $MySQLServerCapabilities,

        [Parameter()]
        [string] $MySQLServerVersion,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [ValidateSet('10G', '11G')]
        [string] $OracleServerVersion,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'NONE')]
        [string] $PersistenceBackup,

        [Parameter()]
        [int] $PersistenceId,

        [Parameter()]
        [ValidateSet('SOURCEIP', 'COOKIEINSERT', 'SSLSESSION', 'NONE')]
        [string] $PersistenceType,

        [Parameter()]
        [string] $PersistMask,

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
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Push,

        [Parameter()]
        [string] $PushLabel,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $PushMultiClients,

        [Parameter()]
        [string] $PushVServer,

        [Parameter()]
        [string] $QUICProfileName,

        [Parameter()]
        [int] $RedirectFromPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $RedirectPortRewrite,

        [Parameter()]
        [string] $RedirectURL,

        [Parameter()]
        [ValidateSet('PASSIVE', 'ACTIVE')]
        [string] $Rhistate,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $RTSPNAT,

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
        [ValidateSet('ENABLED', 'DISABLED', 'UPDATEONBACKENDUPDATE')]
        [string] $Stateupdate,

        [Parameter()]
        [int] $TCPProbePort,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [int] $Timeout,

        [Parameter()]
        [int] $Ttl,

        [Parameter()]
        [int] $V6PersistMaskLen,

        [Parameter()]
        [string] $VIPHeader,

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

    if ($PSBoundParameters.ContainsKey('DNSOverHTTPS')) {
        Assert-NSParameterValue -ParameterName 'DNSOverHTTPS' -Value $DNSOverHTTPS -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('SoMethod')) {
        Assert-NSParameterValue -ParameterName 'SoMethod' -Value $SoMethod -AllowedValuesByVersion @{ '13.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'NONE'); '14.1' = @('CONNECTION', 'DYNAMICCONNECTION', 'BANDWIDTH', 'HEALTH', 'LLMQUOTA', 'NONE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('APIProfile')) { $properties['apiprofile'] = $APIProfile }
    if ($PSBoundParameters.ContainsKey('AppFlowLog')) { $properties['appflowlog'] = $AppFlowLog }
    if ($PSBoundParameters.ContainsKey('Authentication')) { $properties['authentication'] = $Authentication }
    if ($PSBoundParameters.ContainsKey('AuthenticationHost')) { $properties['authenticationhost'] = $AuthenticationHost }
    if ($PSBoundParameters.ContainsKey('Authn401')) { $properties['authn401'] = $Authn401 }
    if ($PSBoundParameters.ContainsKey('AuthnProfile')) { $properties['authnprofile'] = $AuthnProfile }
    if ($PSBoundParameters.ContainsKey('AuthnVServerName')) { $properties['authnvsname'] = $AuthnVServerName }
    if ($PSBoundParameters.ContainsKey('BackupIp')) { $properties['backupip'] = $BackupIp }
    if ($PSBoundParameters.ContainsKey('BackupPersistenceTimeout')) { $properties['backuppersistencetimeout'] = $BackupPersistenceTimeout }
    if ($PSBoundParameters.ContainsKey('BackupVServer')) { $properties['backupvserver'] = $BackupVServer }
    if ($PSBoundParameters.ContainsKey('Cacheable')) { $properties['cacheable'] = $Cacheable }
    if ($PSBoundParameters.ContainsKey('Casesensitive')) { $properties['casesensitive'] = $Casesensitive }
    if ($PSBoundParameters.ContainsKey('CltTimeout')) { $properties['clttimeout'] = $CltTimeout }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('CookieDomain')) { $properties['cookiedomain'] = $CookieDomain }
    if ($PSBoundParameters.ContainsKey('CookieName')) { $properties['cookiename'] = $CookieName }
    if ($PSBoundParameters.ContainsKey('CookieTimeout')) { $properties['cookietimeout'] = $CookieTimeout }
    if ($PSBoundParameters.ContainsKey('DBProfileName')) { $properties['dbprofilename'] = $DBProfileName }
    if ($PSBoundParameters.ContainsKey('DisablePrimaryOnDown')) { $properties['disableprimaryondown'] = $DisablePrimaryOnDown }
    if ($PSBoundParameters.ContainsKey('DNSOverHTTPS')) { $properties['dnsoverhttps'] = $DNSOverHTTPS }
    if ($PSBoundParameters.ContainsKey('DNSProfileName')) { $properties['dnsprofilename'] = $DNSProfileName }
    if ($PSBoundParameters.ContainsKey('DNSRecordType')) { $properties['dnsrecordtype'] = $DNSRecordType }
    if ($PSBoundParameters.ContainsKey('DomainName')) { $properties['domainname'] = $DomainName }
    if ($PSBoundParameters.ContainsKey('DownStateFlush')) { $properties['downstateflush'] = $DownStateFlush }
    if ($PSBoundParameters.ContainsKey('Dtls')) { $properties['dtls'] = $Dtls }
    if ($PSBoundParameters.ContainsKey('HTTPProfileName')) { $properties['httpprofilename'] = $HTTPProfileName }
    if ($PSBoundParameters.ContainsKey('HTTPSRedirectURL')) { $properties['httpsredirecturl'] = $HTTPSRedirectURL }
    if ($PSBoundParameters.ContainsKey('ICMPVsrResponse')) { $properties['icmpvsrresponse'] = $ICMPVsrResponse }
    if ($PSBoundParameters.ContainsKey('InsertVServerIPPort')) { $properties['insertvserveripport'] = $InsertVServerIPPort }
    if ($PSBoundParameters.ContainsKey('IPMask')) { $properties['ipmask'] = $IPMask }
    if ($PSBoundParameters.ContainsKey('IPPattern')) { $properties['ippattern'] = $IPPattern }
    if ($PSBoundParameters.ContainsKey('IPSet')) { $properties['ipset'] = $IPSet }
    if ($PSBoundParameters.ContainsKey('IPv46')) { $properties['ipv46'] = $IPv46 }
    if ($PSBoundParameters.ContainsKey('L2Conn')) { $properties['l2conn'] = $L2Conn }
    if ($PSBoundParameters.ContainsKey('ListenPolicy')) { $properties['listenpolicy'] = $ListenPolicy }
    if ($PSBoundParameters.ContainsKey('ListenPriority')) { $properties['listenpriority'] = $ListenPriority }
    if ($PSBoundParameters.ContainsKey('MSSQLServerVersion')) { $properties['mssqlserverversion'] = $MSSQLServerVersion }
    if ($PSBoundParameters.ContainsKey('MySQLCharacterSet')) { $properties['mysqlcharacterset'] = $MySQLCharacterSet }
    if ($PSBoundParameters.ContainsKey('MySQLProtocolVersion')) { $properties['mysqlprotocolversion'] = $MySQLProtocolVersion }
    if ($PSBoundParameters.ContainsKey('MySQLServerCapabilities')) { $properties['mysqlservercapabilities'] = $MySQLServerCapabilities }
    if ($PSBoundParameters.ContainsKey('MySQLServerVersion')) { $properties['mysqlserverversion'] = $MySQLServerVersion }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('OracleServerVersion')) { $properties['oracleserverversion'] = $OracleServerVersion }
    if ($PSBoundParameters.ContainsKey('PersistenceBackup')) { $properties['persistencebackup'] = $PersistenceBackup }
    if ($PSBoundParameters.ContainsKey('PersistenceId')) { $properties['persistenceid'] = $PersistenceId }
    if ($PSBoundParameters.ContainsKey('PersistenceType')) { $properties['persistencetype'] = $PersistenceType }
    if ($PSBoundParameters.ContainsKey('PersistMask')) { $properties['persistmask'] = $PersistMask }
    if ($PSBoundParameters.ContainsKey('Precedence')) { $properties['precedence'] = $Precedence }
    if ($PSBoundParameters.ContainsKey('ProbePort')) { $properties['probeport'] = $ProbePort }
    if ($PSBoundParameters.ContainsKey('ProbeProtocol')) { $properties['probeprotocol'] = $ProbeProtocol }
    if ($PSBoundParameters.ContainsKey('ProbeSuccessResponseCode')) { $properties['probesuccessresponsecode'] = $ProbeSuccessResponseCode }
    if ($PSBoundParameters.ContainsKey('Push')) { $properties['push'] = $Push }
    if ($PSBoundParameters.ContainsKey('PushLabel')) { $properties['pushlabel'] = $PushLabel }
    if ($PSBoundParameters.ContainsKey('PushMultiClients')) { $properties['pushmulticlients'] = $PushMultiClients }
    if ($PSBoundParameters.ContainsKey('PushVServer')) { $properties['pushvserver'] = $PushVServer }
    if ($PSBoundParameters.ContainsKey('QUICProfileName')) { $properties['quicprofilename'] = $QUICProfileName }
    if ($PSBoundParameters.ContainsKey('RedirectFromPort')) { $properties['redirectfromport'] = $RedirectFromPort }
    if ($PSBoundParameters.ContainsKey('RedirectPortRewrite')) { $properties['redirectportrewrite'] = $RedirectPortRewrite }
    if ($PSBoundParameters.ContainsKey('RedirectURL')) { $properties['redirecturl'] = $RedirectURL }
    if ($PSBoundParameters.ContainsKey('Rhistate')) { $properties['rhistate'] = $Rhistate }
    if ($PSBoundParameters.ContainsKey('RTSPNAT')) { $properties['rtspnat'] = $RTSPNAT }
    if ($PSBoundParameters.ContainsKey('Sitedomainttl')) { $properties['sitedomainttl'] = $Sitedomainttl }
    if ($PSBoundParameters.ContainsKey('SoBackupAction')) { $properties['sobackupaction'] = $SoBackupAction }
    if ($PSBoundParameters.ContainsKey('SoMethod')) { $properties['somethod'] = $SoMethod }
    if ($PSBoundParameters.ContainsKey('SoPersistence')) { $properties['sopersistence'] = $SoPersistence }
    if ($PSBoundParameters.ContainsKey('SoPersistenceTimeout')) { $properties['sopersistencetimeout'] = $SoPersistenceTimeout }
    if ($PSBoundParameters.ContainsKey('SoThreshold')) { $properties['sothreshold'] = $SoThreshold }
    if ($PSBoundParameters.ContainsKey('Stateupdate')) { $properties['stateupdate'] = $Stateupdate }
    if ($PSBoundParameters.ContainsKey('TCPProbePort')) { $properties['tcpprobeport'] = $TCPProbePort }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('Timeout')) { $properties['timeout'] = $Timeout }
    if ($PSBoundParameters.ContainsKey('Ttl')) { $properties['ttl'] = $Ttl }
    if ($PSBoundParameters.ContainsKey('V6PersistMaskLen')) { $properties['v6persistmasklen'] = $V6PersistMaskLen }
    if ($PSBoundParameters.ContainsKey('VIPHeader')) { $properties['vipheader'] = $VIPHeader }
    if ($PSBoundParameters.ContainsKey('WASMModule')) { $properties['wasmmodule'] = $WASMModule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update csvserver')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type csvserver -Payload @{ csvserver = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetCSVServer -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateCSVServer

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCi3s7jEceOaPHp
# pRKz1iFp6dKYICQxNMXH13i6gD3U9aCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCC3tMdTe5pTAZFGTr/QYrq9/Jk8Z241Aqj1HP/VzXHt
# GzANBgkqhkiG9w0BAQEFAASCAYC5NTQTu9WNVqbZgNFfo07LWCaCEoiS3sIWQGGw
# HzfXYAMBqTKWwBXjvwLpkiNFU5wCUjhuFJMR5H+q7kLZZViQZ9bJTHj+/tqZqa7n
# fw79OJTHVkilommYZoWUY+XB8Deug+FvwPd/9XeUg33FclK9zd09W18zBx4wJBBV
# 3gtNdzmoK44iMX4rqoiAiuGYmYBv++bI/ZKD9LUuyFFgRjeFb0d3MX0FkGB+0O62
# lWyvmWuSJvse4ffOe6quce2DzsoiVSAXT9g7ouE9KVTLEmh34lKf6NlLa2PM6otG
# dgi+rgXzvvaj5oyCpgbU/4DXq3Qa2xJLWjOYj+mvDKUBIARtI+ra4TpfmmOrvIiz
# jE+SgLHinc6kls+Lz4/x773mkgiZMcY2HeqpUGAHOLFfW4e1LHkCQ76PALbV+4Yn
# C4xRnhrRgI1ShlEYF6r9yIbpuRAN0wFvuOGg29GCRG5tPLNuif3QGRyAw14vrKaL
# fhTjgaDVY26N4CaDLjq7gIU+GbuhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU1MDJaMD8GCSqGSIb3
# DQEJBDEyBDBAlZyFmpk+l0XMzW6WFg0W3Gey21XGXmQUwxnj2lYhIs2RZ8g9ud3F
# 8X6SU/b5MxgwDQYJKoZIhvcNAQEBBQAEggIAYi41jF/0gU2omBQmv84bryP5MxSh
# J5d7yLlMhZM8jEUf6GMxE0711TlhTR6e1PKZVaJRJlfwJDBpEnq9YITpvWZgYnwd
# /NDSFdVuN5HZgETpg9bZC3NSfVZbjcOANdQ4tlci3YBl9hB7voMvV7sDarCM0xQL
# dcLhsFq9fwFPTNj4F6q9Fwt65MpOTG5bH7V2c4DJTodvPN5svz+BMG7Npx4yf4YY
# pxXbmNfahFLX7SyLNZ6j0ZpZSUnxkTi4qWOK/eGMSVqEaWmCMAH4xbqwwrotAulN
# 0eVb7r/zpZlD/kIaQ4B0o0TrpXbv3HeS0BMt47stp6r44zD5EtEM2Mhnjfpi+mNN
# a0ScE/Idkbpp0XYskUFAfxkxp2J43Phqrc+fpUl1IKGFV29I3Ms3B68MNX6lo1t0
# uwvDnVoV4+vuuPWNNgGxgeSJtex0/5zya+ULIvjmsgBplfPk1DY+jUXjLEMechGZ
# enavDULRZGBriNJjyglSzomd6A1DNzDmCgojDBi5gVpfBQmBdyXzkspqLevaE2Ga
# YQVxJyDOQo4TztVsKxCLhHcBjmxIi8Gg0TwAmGizGLbkAf6Gw54653DQSJEBmoJ9
# D9TKgS8LS1tN5X+9aoW476pAkiUfVpZCZQP5dJQe94UZjcb/I3dKfgAAZdOAUPxE
# /SDhMoBSooS0HrU=
# SIG # End signature block
