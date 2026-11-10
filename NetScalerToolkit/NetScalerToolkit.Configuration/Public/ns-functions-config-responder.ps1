# Generated NetScalerToolkit Configuration bundle for category 'responder'.

# region Invoke-NSAddResponderAction
function Invoke-NSAddResponderAction {
    <#
    .SYNOPSIS
        Creates a NetScaler responderaction resource.
    .DESCRIPTION
        Configuration for responder action resource.
    .PARAMETER BypassSafetycheck
        Bypass the safety check, allowing potentially unsafe expressions. An unsafe expression in a response is one that contains references to request elements that might not be present in all requests. If a response refers to a missing request element, an empty string is used instead. Default value: NO Possible values = YES, NO
    .PARAMETER Comment
        Comment. Any type of information about this responder action.
    .PARAMETER HeaderS
        One or more headers to insert into the HTTP response. Each header is specified as "name(expr)", where expr is an expression that is evaluated at runtime to provide the value for the named header. You can configure a maximum of eight headers for a responder action.
    .PARAMETER HTMLPage
        For respondwithhtmlpage policies, name of the HTML page object to use as the response. You must first import the page object. Minimum length = 1
    .PARAMETER Name
        Name for the responder action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder action" or 'my responder action').
    .PARAMETER Reasonphrase
        Expression specifying the reason phrase of the HTTP response. The reason phrase may be a string literal with quotes or a PI expression. For example: "Invalid URL: " + HTTP.REQ.URL. Minimum length = 1
    .PARAMETER ResponseStatuscode
        HTTP response status code, for example 200, 302, 404, etc. The default value for the redirect action type is 302 and for respondwithhtmlpage is 200. Minimum value = 100 Maximum value = 599
    .PARAMETER Target
        Expression specifying what to respond with. Typically a URL for redirect policies or a default-syntax expression. In addition to Citrix ADC default-syntax expressions that refer to information in the request, a stringbuilder expression can contain text and HTML, and simple escape codes that define new lines and paragraphs. Enclose each stringbuilder expression element (either a Citrix ADC default-syntax expression or a string) in double quotation marks. Use the plus (+) character to join the elements. Examples: 1) Respondwith expression that sends an HTTP 1.1 200 OK response: "HTTP/1.1 200 OK\r\n\r\n" 2) Redirect expression that redirects user to the specified web host and appends the request URL to the redirect. "http://backupsite2.com" + HTTP.REQ.URL 3) Respondwith expression that sends an HTTP 1.1 404 Not Found response with the request URL included in the response: "HTTP/1.1 404 Not Found\r\n\r\n"+ "HTTP.REQ.URL.HTTP_URL_SAFE" + "does not exist on the web server." The following requirement applies only to the Citrix ADC CLI: Enclose the entire expression in single quotation marks. (Citrix ADC expression elements should be included inside the single quotation marks for the entire expression, but do not need to be enclosed in double quotation marks.).
    .PARAMETER Type
        Type of responder action. Available settings function as follows: * respondwith <target> - Respond to the request with the expression specified as the target. * respondwithhtmlpage - Respond to the request with the uploaded HTML page object specified as the target. * redirect - Redirect the request to the URL specified as the target. * sqlresponse_ok - Send an SQL OK response. * sqlresponse_error - Send an SQL ERROR response. Possible values = noop, respondwith, redirect, respondwithhtmlpage, sqlresponse_ok, sqlresponse_error
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddResponderAction -Name 'example' -Type noop -PassThru
    .EXAMPLE
        Invoke-NSAddResponderAction -Name 'example' -Type noop -WhatIf
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
        [string] $BypassSafetycheck,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string[]] $HeaderS,

        [Parameter()]
        [string] $HTMLPage,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Reasonphrase,

        [Parameter()]
        [int] $ResponseStatuscode,

        [Parameter()]
        [string] $Target,

        [Parameter(Mandatory)]
        [ValidateSet('noop', 'respondwith', 'redirect', 'respondwithhtmlpage', 'sqlresponse_ok', 'sqlresponse_error')]
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
    if ($PSBoundParameters.ContainsKey('BypassSafetycheck')) { $properties['bypasssafetycheck'] = $BypassSafetycheck }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('HeaderS')) { $properties['headers'] = $HeaderS }
    if ($PSBoundParameters.ContainsKey('HTMLPage')) { $properties['htmlpage'] = $HTMLPage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Reasonphrase')) { $properties['reasonphrase'] = $Reasonphrase }
    if ($PSBoundParameters.ContainsKey('ResponseStatuscode')) { $properties['responsestatuscode'] = $ResponseStatuscode }
    if ($PSBoundParameters.ContainsKey('Target')) { $properties['target'] = $Target }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create responderaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderaction -Payload @{ responderaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetResponderAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddResponderAction

# region Invoke-NSAddResponderGlobalResponderPolicyBinding
function Invoke-NSAddResponderGlobalResponderPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler responderglobal_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to responderglobal.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        If the current policy evaluates to TRUE, terminate evaluation of policies bound to the current policy label, and then forward the request to the specified virtual server or evaluate the specified policy label.
    .PARAMETER LabelName
        Name of the policy label to invoke. If the current policy evaluates to TRUE, the invoke parameter is set, and Label Type is policylabel.
    .PARAMETER LabelType
        Type of invocation, Available settings function as follows: * vserver - Forward the request to the specified virtual server. * policylabel - Invoke the specified policy label. Possible values = vserver, policylabel
    .PARAMETER PolicyName
        Name of the responder policy.
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Type
        Specifies the bind point whose policies you want to display. Available settings function as follows: * REQ_OVERRIDE - Request override. Binds the policy to the priority request queue. * REQ_DEFAULT - Binds the policy to the default request queue. * OTHERTCP_REQ_OVERRIDE - Binds the policy to the non-HTTP TCP priority request queue. * OTHERTCP_REQ_DEFAULT - Binds the policy to the non-HTTP TCP default request queue.. * SIPUDP_REQ_OVERRIDE - Binds the policy to the SIP UDP priority response queue.. * SIPUDP_REQ_DEFAULT - Binds the policy to the SIP UDP default response queue. * RADIUS_REQ_OVERRIDE - Binds the policy to the RADIUS priority response queue.. * RADIUS_REQ_DEFAULT - Binds the policy to the RADIUS default response queue. * MSSQL_REQ_OVERRIDE - Binds the policy to the Microsoft SQL priority response queue.. * MSSQL_REQ_DEFAULT - Binds the policy to the Microsoft SQL default response queue. * MYSQL_REQ_OVERRIDE - Binds the policy to the MySQL priority response queue. * MYSQL_REQ_DEFAULT - Binds the policy to the MySQL default response queue. * HTTPQUIC_REQ_OVERRIDE - Binds the policy to the HTTP_QUIC override response queue. * HTTPQUIC_REQ_DEFAULT - Binds the policy to the HTTP_QUIC default response queue. Possible values = REQ_OVERRIDE, REQ_DEFAULT, OVERRIDE, DEFAULT, OTHERTCP_REQ_OVERRIDE, OTHERTCP_REQ_DEFAULT, SIPUDP_REQ_OVERRIDE, SIPUDP_REQ_DEFAULT, SIPTCP_REQ_OVERRIDE, SIPTCP_REQ_DEFAULT, MSSQL_REQ_OVERRIDE, MSSQL_REQ_DEFAULT, MYSQL_REQ_OVERRIDE, MYSQL_REQ_DEFAULT, NAT_REQ_OVERRIDE, NAT_REQ_DEFAULT, DIAMETER_REQ_OVERRIDE, DIAMETER_REQ_DEFAULT, RADIUS_REQ_OVERRIDE, RADIUS_REQ_DEFAULT, DNS_REQ_OVERRIDE, DNS_REQ_DEFAULT, MQTT_REQ_OVERRIDE, MQTT_REQ_DEFAULT, MQTT_JUMBO_REQ_OVERRIDE, MQTT_JUMBO_REQ_DEFAULT, QUIC_OVERRIDE, QUIC_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddResponderGlobalResponderPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddResponderGlobalResponderPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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
        [ValidateSet('vserver', 'policylabel')]
        [string] $LabelType,

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'OVERRIDE', 'DEFAULT', 'OTHERTCP_REQ_OVERRIDE', 'OTHERTCP_REQ_DEFAULT', 'SIPUDP_REQ_OVERRIDE', 'SIPUDP_REQ_DEFAULT', 'SIPTCP_REQ_OVERRIDE', 'SIPTCP_REQ_DEFAULT', 'MSSQL_REQ_OVERRIDE', 'MSSQL_REQ_DEFAULT', 'MYSQL_REQ_OVERRIDE', 'MYSQL_REQ_DEFAULT', 'NAT_REQ_OVERRIDE', 'NAT_REQ_DEFAULT', 'DIAMETER_REQ_OVERRIDE', 'DIAMETER_REQ_DEFAULT', 'RADIUS_REQ_OVERRIDE', 'RADIUS_REQ_DEFAULT', 'DNS_REQ_OVERRIDE', 'DNS_REQ_DEFAULT', 'MQTT_REQ_OVERRIDE', 'MQTT_REQ_DEFAULT', 'MQTT_JUMBO_REQ_OVERRIDE', 'MQTT_JUMBO_REQ_DEFAULT', 'QUIC_OVERRIDE', 'QUIC_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT')]
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

    if ($PSCmdlet.ShouldProcess('responderglobal_responderpolicy_binding', 'Create responderglobal_responderpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderglobal_responderpolicy_binding -Payload @{ responderglobal_responderpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddResponderGlobalResponderPolicyBinding

# region Invoke-NSAddResponderPolicy
function Invoke-NSAddResponderPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler responderpolicy resource.
    .DESCRIPTION
        Configuration for responder policy resource.
    .PARAMETER Action
        Name of the responder action to perform if the request matches this responder policy. There are also some built-in actions which can be used. These are: * NOOP - Send the request to the protected server instead of responding to it. * RESET - Reset the client connection by closing it. The client program, such as a browser, will handle this and may inform the user. The client may then resend the request if desired. * DROP - Drop the request without sending a response to the user.
    .PARAMETER AppFlowAction
        AppFlow action to invoke for requests that match this policy.
    .PARAMETER Comment
        Any type of information about this responder policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the responder policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy" or 'my responder policy').
    .PARAMETER Rule
        Expression that the policy uses to determine whether to respond to the specified request.
    .PARAMETER UndefAction
        Action to perform if the result of policy evaluation is undefined (UNDEF). An UNDEF event indicates an internal error condition. Only the above built-in actions can be used.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddResponderPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddResponderPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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
        [string] $AppFlowAction,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Rule,

        [Parameter()]
        [string] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('AppFlowAction')) { $properties['appflowaction'] = $AppFlowAction }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create responderpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderpolicy -Payload @{ responderpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetResponderPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddResponderPolicy

# region Invoke-NSAddResponderPolicyLabel
function Invoke-NSAddResponderPolicyLabel {
    <#
    .SYNOPSIS
        Creates a NetScaler responderpolicylabel resource.
    .DESCRIPTION
        Configuration for responder policy label resource.
    .PARAMETER Comment
        Any comments to preserve information about this responder policy label.
    .PARAMETER LabelName
        Name for the responder policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
    .PARAMETER PolicyLabelType
        Type of responses sent by the policies bound to this policy label. Types are: * HTTP - HTTP responses. * OTHERTCP - NON-HTTP TCP responses. * SIP_UDP - SIP responses. * RADIUS - RADIUS responses. * MYSQL - SQL responses in MySQL format. * MSSQL - SQL responses in Microsoft SQL format. * NAT - NAT response. * MQTT - Trigger policies bind with MQTT type. * MQTT_JUMBO - Trigger policies bind with MQTT Jumbo type. Default value: HTTP Possible values = HTTP, OTHERTCP, SIP_UDP, SIP_TCP, MYSQL, MSSQL, NAT, DIAMETER, RADIUS, DNS, MQTT, MQTT_JUMBO, QUIC_BRIDGE, HTTP_QUIC
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddResponderPolicyLabel -LabelName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddResponderPolicyLabel -LabelName 'example' -WhatIf
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
        [string] $LabelName,

        [Parameter()]
        [ValidateSet('HTTP', 'OTHERTCP', 'SIP_UDP', 'SIP_TCP', 'MYSQL', 'MSSQL', 'NAT', 'DIAMETER', 'RADIUS', 'DNS', 'MQTT', 'MQTT_JUMBO', 'QUIC_BRIDGE', 'HTTP_QUIC')]
        [string] $PolicyLabelType,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('PolicyLabelType')) { $properties['policylabeltype'] = $PolicyLabelType }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create responderpolicylabel')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderpolicylabel -Payload @{ responderpolicylabel = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetResponderPolicyLabel -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddResponderPolicyLabel

# region Invoke-NSAddResponderPolicyLabelResponderPolicyBinding
function Invoke-NSAddResponderPolicyLabelResponderPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler responderpolicylabel_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to responderpolicylabel.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        If the current policy evaluates to TRUE, terminate evaluation of policies bound to the current policy label and evaluate the specified policy label.
    .PARAMETER InvokeLabelName
        * If labelType is policylabel, name of the policy label to invoke. * If labelType is reqvserver or resvserver, name of the virtual server.
    .PARAMETER LabelName
        Name of the responder policy label to which to bind the policy.
    .PARAMETER LabelType
        Type of policy label to invoke. Available settings function as follows: * vserver - Invoke an unnamed policy label associated with a virtual server. * policylabel - Invoke a user-defined policy label. Possible values = vserver, policylabel
    .PARAMETER PolicyName
        Name of the responder policy.
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
        Invoke-NSAddResponderPolicyLabelResponderPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddResponderPolicyLabelResponderPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -WhatIf
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
        [ValidateSet('vserver', 'policylabel')]
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

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create responderpolicylabel_responderpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderpolicylabel_responderpolicy_binding -Payload @{ responderpolicylabel_responderpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetResponderPolicyLabelResponderPolicyBinding -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddResponderPolicyLabelResponderPolicyBinding

# region Invoke-NSDeleteResponderAction
function Invoke-NSDeleteResponderAction {
    <#
    .SYNOPSIS
        Removes a NetScaler responderaction resource.
    .DESCRIPTION
        Configuration for responder action resource.
    .PARAMETER Name
        Name for the responder action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder action" or 'my responder action').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteResponderAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetResponderAction -Name 'responderaction_example' | Invoke-NSDeleteResponderAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete responderaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type responderaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteResponderAction

# region Invoke-NSDeleteResponderGlobalResponderPolicyBinding
function Invoke-NSDeleteResponderGlobalResponderPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler responderglobal_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to responderglobal.
    .PARAMETER PolicyName
        Name of the responder policy.
    .PARAMETER Type
        Specifies the bind point whose policies you want to display. Available settings function as follows: * REQ_OVERRIDE - Request override. Binds the policy to the priority request queue. * REQ_DEFAULT - Binds the policy to the default request queue. * OTHERTCP_REQ_OVERRIDE - Binds the policy to the non-HTTP TCP priority request queue. * OTHERTCP_REQ_DEFAULT - Binds the policy to the non-HTTP TCP default request queue.. * SIPUDP_REQ_OVERRIDE - Binds the policy to the SIP UDP priority response queue.. * SIPUDP_REQ_DEFAULT - Binds the policy to the SIP UDP default response queue. * RADIUS_REQ_OVERRIDE - Binds the policy to the RADIUS priority response queue.. * RADIUS_REQ_DEFAULT - Binds the policy to the RADIUS default response queue. * MSSQL_REQ_OVERRIDE - Binds the policy to the Microsoft SQL priority response queue.. * MSSQL_REQ_DEFAULT - Binds the policy to the Microsoft SQL default response queue. * MYSQL_REQ_OVERRIDE - Binds the policy to the MySQL priority response queue. * MYSQL_REQ_DEFAULT - Binds the policy to the MySQL default response queue. * HTTPQUIC_REQ_OVERRIDE - Binds the policy to the HTTP_QUIC override response queue. * HTTPQUIC_REQ_DEFAULT - Binds the policy to the HTTP_QUIC default response queue. Possible values = REQ_OVERRIDE, REQ_DEFAULT, OVERRIDE, DEFAULT, OTHERTCP_REQ_OVERRIDE, OTHERTCP_REQ_DEFAULT, SIPUDP_REQ_OVERRIDE, SIPUDP_REQ_DEFAULT, SIPTCP_REQ_OVERRIDE, SIPTCP_REQ_DEFAULT, MSSQL_REQ_OVERRIDE, MSSQL_REQ_DEFAULT, MYSQL_REQ_OVERRIDE, MYSQL_REQ_DEFAULT, NAT_REQ_OVERRIDE, NAT_REQ_DEFAULT, DIAMETER_REQ_OVERRIDE, DIAMETER_REQ_DEFAULT, RADIUS_REQ_OVERRIDE, RADIUS_REQ_DEFAULT, DNS_REQ_OVERRIDE, DNS_REQ_DEFAULT, MQTT_REQ_OVERRIDE, MQTT_REQ_DEFAULT, MQTT_JUMBO_REQ_OVERRIDE, MQTT_JUMBO_REQ_DEFAULT, QUIC_OVERRIDE, QUIC_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
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
        Invoke-NSDeleteResponderGlobalResponderPolicyBinding -PolicyName 'example' -Priority 1 -Type REQ_OVERRIDE -Confirm:$false
    .EXAMPLE
        Invoke-NSGetResponderGlobalResponderPolicyBinding  | Invoke-NSDeleteResponderGlobalResponderPolicyBinding -Confirm:$false
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'OVERRIDE', 'DEFAULT', 'OTHERTCP_REQ_OVERRIDE', 'OTHERTCP_REQ_DEFAULT', 'SIPUDP_REQ_OVERRIDE', 'SIPUDP_REQ_DEFAULT', 'SIPTCP_REQ_OVERRIDE', 'SIPTCP_REQ_DEFAULT', 'MSSQL_REQ_OVERRIDE', 'MSSQL_REQ_DEFAULT', 'MYSQL_REQ_OVERRIDE', 'MYSQL_REQ_DEFAULT', 'NAT_REQ_OVERRIDE', 'NAT_REQ_DEFAULT', 'DIAMETER_REQ_OVERRIDE', 'DIAMETER_REQ_DEFAULT', 'RADIUS_REQ_OVERRIDE', 'RADIUS_REQ_DEFAULT', 'DNS_REQ_OVERRIDE', 'DNS_REQ_DEFAULT', 'MQTT_REQ_OVERRIDE', 'MQTT_REQ_DEFAULT', 'MQTT_JUMBO_REQ_OVERRIDE', 'MQTT_JUMBO_REQ_DEFAULT', 'QUIC_OVERRIDE', 'QUIC_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT')]
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

        if ($PSCmdlet.ShouldProcess('responderglobal_responderpolicy_binding', 'Delete responderglobal_responderpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type responderglobal_responderpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteResponderGlobalResponderPolicyBinding

# region Invoke-NSDeleteResponderHTMLPage
function Invoke-NSDeleteResponderHTMLPage {
    <#
    .SYNOPSIS
        Removes a NetScaler responderhtmlpage resource.
    .DESCRIPTION
        Configuration for Responder HTML page resource.
    .PARAMETER Name
        Name to assign to the HTML page object on the Citrix ADC. Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteResponderHTMLPage -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetResponderHTMLPage -Name 'responderhtmlpage_example' | Invoke-NSDeleteResponderHTMLPage -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete responderhtmlpage')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type responderhtmlpage -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteResponderHTMLPage

# region Invoke-NSDeleteResponderPolicy
function Invoke-NSDeleteResponderPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler responderpolicy resource.
    .DESCRIPTION
        Configuration for responder policy resource.
    .PARAMETER Name
        Name for the responder policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy" or 'my responder policy').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteResponderPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetResponderPolicy -Name 'responderpolicy_example' | Invoke-NSDeleteResponderPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete responderpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type responderpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteResponderPolicy

# region Invoke-NSDeleteResponderPolicyLabel
function Invoke-NSDeleteResponderPolicyLabel {
    <#
    .SYNOPSIS
        Removes a NetScaler responderpolicylabel resource.
    .DESCRIPTION
        Configuration for responder policy label resource.
    .PARAMETER LabelName
        Name for the responder policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteResponderPolicyLabel -LabelName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabel -LabelName 'responderpolicylabel_example' | Invoke-NSDeleteResponderPolicyLabel -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete responderpolicylabel')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type responderpolicylabel -Resource $LabelName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteResponderPolicyLabel

# region Invoke-NSDeleteResponderPolicyLabelResponderPolicyBinding
function Invoke-NSDeleteResponderPolicyLabelResponderPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler responderpolicylabel_responderpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to responderpolicylabel.
    .PARAMETER LabelName
        Name of the responder policy label to which to bind the policy.
    .PARAMETER PolicyName
        Name of the responder policy.
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
        Invoke-NSDeleteResponderPolicyLabelResponderPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabelResponderPolicyBinding -LabelName 'responderpolicylabel_responderpolicy_binding_example' | Invoke-NSDeleteResponderPolicyLabelResponderPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete responderpolicylabel_responderpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type responderpolicylabel_responderpolicy_binding -Resource $LabelName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteResponderPolicyLabelResponderPolicyBinding

# region Invoke-NSGetResponderAction
function Invoke-NSGetResponderAction {
    <#
    .SYNOPSIS
        Gets NetScaler responderaction configuration.
    .DESCRIPTION
        Configuration for responder action resource.
    .PARAMETER Name
        Name for the responder action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder action" or 'my responder action').
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
        Invoke-NSGetResponderAction
    .EXAMPLE
        Invoke-NSGetResponderAction -Name 'responderaction_example'
    .EXAMPLE
        Invoke-NSGetResponderAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderaction'
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
# endregion Invoke-NSGetResponderAction

# region Invoke-NSGetResponderGlobalBinding
function Invoke-NSGetResponderGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to responderglobal.
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
        Invoke-NSGetResponderGlobalBinding
    .EXAMPLE
        Invoke-NSGetResponderGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetResponderGlobalBinding

# region Invoke-NSGetResponderGlobalResponderPolicyBinding
function Invoke-NSGetResponderGlobalResponderPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderglobal_responderpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to responderglobal.
    .PARAMETER Type
        Specifies the bind point whose policies you want to display. Available settings function as follows: * REQ_OVERRIDE - Request override. Binds the policy to the priority request queue. * REQ_DEFAULT - Binds the policy to the default request queue. * OTHERTCP_REQ_OVERRIDE - Binds the policy to the non-HTTP TCP priority request queue. * OTHERTCP_REQ_DEFAULT - Binds the policy to the non-HTTP TCP default request queue.. * SIPUDP_REQ_OVERRIDE - Binds the policy to the SIP UDP priority response queue.. * SIPUDP_REQ_DEFAULT - Binds the policy to the SIP UDP default response queue. * RADIUS_REQ_OVERRIDE - Binds the policy to the RADIUS priority response queue.. * RADIUS_REQ_DEFAULT - Binds the policy to the RADIUS default response queue. * MSSQL_REQ_OVERRIDE - Binds the policy to the Microsoft SQL priority response queue.. * MSSQL_REQ_DEFAULT - Binds the policy to the Microsoft SQL default response queue. * MYSQL_REQ_OVERRIDE - Binds the policy to the MySQL priority response queue. * MYSQL_REQ_DEFAULT - Binds the policy to the MySQL default response queue. * HTTPQUIC_REQ_OVERRIDE - Binds the policy to the HTTP_QUIC override response queue. * HTTPQUIC_REQ_DEFAULT - Binds the policy to the HTTP_QUIC default response queue. Possible values = REQ_OVERRIDE, REQ_DEFAULT, OVERRIDE, DEFAULT, OTHERTCP_REQ_OVERRIDE, OTHERTCP_REQ_DEFAULT, SIPUDP_REQ_OVERRIDE, SIPUDP_REQ_DEFAULT, SIPTCP_REQ_OVERRIDE, SIPTCP_REQ_DEFAULT, MSSQL_REQ_OVERRIDE, MSSQL_REQ_DEFAULT, MYSQL_REQ_OVERRIDE, MYSQL_REQ_DEFAULT, NAT_REQ_OVERRIDE, NAT_REQ_DEFAULT, DIAMETER_REQ_OVERRIDE, DIAMETER_REQ_DEFAULT, RADIUS_REQ_OVERRIDE, RADIUS_REQ_DEFAULT, DNS_REQ_OVERRIDE, DNS_REQ_DEFAULT, MQTT_REQ_OVERRIDE, MQTT_REQ_DEFAULT, MQTT_JUMBO_REQ_OVERRIDE, MQTT_JUMBO_REQ_DEFAULT, QUIC_OVERRIDE, QUIC_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
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
        Invoke-NSGetResponderGlobalResponderPolicyBinding
    .EXAMPLE
        Invoke-NSGetResponderGlobalResponderPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'OVERRIDE', 'DEFAULT', 'OTHERTCP_REQ_OVERRIDE', 'OTHERTCP_REQ_DEFAULT', 'SIPUDP_REQ_OVERRIDE', 'SIPUDP_REQ_DEFAULT', 'SIPTCP_REQ_OVERRIDE', 'SIPTCP_REQ_DEFAULT', 'MSSQL_REQ_OVERRIDE', 'MSSQL_REQ_DEFAULT', 'MYSQL_REQ_OVERRIDE', 'MYSQL_REQ_DEFAULT', 'NAT_REQ_OVERRIDE', 'NAT_REQ_DEFAULT', 'DIAMETER_REQ_OVERRIDE', 'DIAMETER_REQ_DEFAULT', 'RADIUS_REQ_OVERRIDE', 'RADIUS_REQ_DEFAULT', 'DNS_REQ_OVERRIDE', 'DNS_REQ_DEFAULT', 'MQTT_REQ_OVERRIDE', 'MQTT_REQ_DEFAULT', 'MQTT_JUMBO_REQ_OVERRIDE', 'MQTT_JUMBO_REQ_DEFAULT', 'QUIC_OVERRIDE', 'QUIC_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT')]
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
            Type = 'responderglobal_responderpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetResponderGlobalResponderPolicyBinding

# region Invoke-NSGetResponderHTMLPage
function Invoke-NSGetResponderHTMLPage {
    <#
    .SYNOPSIS
        Gets NetScaler responderhtmlpage configuration.
    .DESCRIPTION
        Configuration for Responder HTML page resource.
    .PARAMETER Name
        Name to assign to the HTML page object on the Citrix ADC. Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetResponderHTMLPage
    .EXAMPLE
        Invoke-NSGetResponderHTMLPage -Name 'responderhtmlpage_example'
    .EXAMPLE
        Invoke-NSGetResponderHTMLPage -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderhtmlpage'
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
# endregion Invoke-NSGetResponderHTMLPage

# region Invoke-NSGetResponderParam
function Invoke-NSGetResponderParam {
    <#
    .SYNOPSIS
        Gets NetScaler responderparam configuration.
    .DESCRIPTION
        Configuration for responser parameter resource.
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
        Invoke-NSGetResponderParam
    .EXAMPLE
        Invoke-NSGetResponderParam -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderparam'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetResponderParam

# region Invoke-NSGetResponderPolicy
function Invoke-NSGetResponderPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy configuration.
    .DESCRIPTION
        Configuration for responder policy resource.
    .PARAMETER Name
        Name for the responder policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy" or 'my responder policy').
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
        Invoke-NSGetResponderPolicy
    .EXAMPLE
        Invoke-NSGetResponderPolicy -Name 'responderpolicy_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy'
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
# endregion Invoke-NSGetResponderPolicy

# region Invoke-NSGetResponderPolicyBinding
function Invoke-NSGetResponderPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to responderpolicy.
    .PARAMETER Name
        Name of the responder policy for which to display settings.
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
        Invoke-NSGetResponderPolicyBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyBinding -Name 'responderpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy_binding'
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
# endregion Invoke-NSGetResponderPolicyBinding

# region Invoke-NSGetResponderPolicyCRVServerBinding
function Invoke-NSGetResponderPolicyCRVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy_crvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the crvserver that can be bound to responderpolicy.
    .PARAMETER Name
        Name of the responder policy for which to display settings.
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
        Invoke-NSGetResponderPolicyCRVServerBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyCRVServerBinding -Name 'responderpolicy_crvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyCRVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy_crvserver_binding'
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
# endregion Invoke-NSGetResponderPolicyCRVServerBinding

# region Invoke-NSGetResponderPolicyCSVServerBinding
function Invoke-NSGetResponderPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to responderpolicy.
    .PARAMETER Name
        Name of the responder policy for which to display settings.
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
        Invoke-NSGetResponderPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyCSVServerBinding -Name 'responderpolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy_csvserver_binding'
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
# endregion Invoke-NSGetResponderPolicyCSVServerBinding

# region Invoke-NSGetResponderPolicyLabel
function Invoke-NSGetResponderPolicyLabel {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicylabel configuration.
    .DESCRIPTION
        Configuration for responder policy label resource.
    .PARAMETER LabelName
        Name for the responder policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
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
        Invoke-NSGetResponderPolicyLabel
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabel -LabelName 'responderpolicylabel_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabel -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicylabel'
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
# endregion Invoke-NSGetResponderPolicyLabel

# region Invoke-NSGetResponderPolicyLabelBinding
function Invoke-NSGetResponderPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicylabel_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to responderpolicylabel.
    .PARAMETER LabelName
        Name of the responder policy label.
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
        Invoke-NSGetResponderPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabelBinding -LabelName 'responderpolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicylabel_binding'
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
# endregion Invoke-NSGetResponderPolicyLabelBinding

# region Invoke-NSGetResponderPolicyLabelPolicyBindingBinding
function Invoke-NSGetResponderPolicyLabelPolicyBindingBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicylabel_policybinding_binding configuration.
    .DESCRIPTION
        Binding object showing the policybinding that can be bound to responderpolicylabel.
    .PARAMETER LabelName
        Name of the responder policy label to which to bind the policy.
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
        Invoke-NSGetResponderPolicyLabelPolicyBindingBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabelPolicyBindingBinding -LabelName 'responderpolicylabel_policybinding_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabelPolicyBindingBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicylabel_policybinding_binding'
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
# endregion Invoke-NSGetResponderPolicyLabelPolicyBindingBinding

# region Invoke-NSGetResponderPolicyLabelResponderPolicyBinding
function Invoke-NSGetResponderPolicyLabelResponderPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicylabel_responderpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the responderpolicy that can be bound to responderpolicylabel.
    .PARAMETER LabelName
        Name of the responder policy label to which to bind the policy.
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
        Invoke-NSGetResponderPolicyLabelResponderPolicyBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabelResponderPolicyBinding -LabelName 'responderpolicylabel_responderpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyLabelResponderPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicylabel_responderpolicy_binding'
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
# endregion Invoke-NSGetResponderPolicyLabelResponderPolicyBinding

# region Invoke-NSGetResponderPolicyLBVServerBinding
function Invoke-NSGetResponderPolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to responderpolicy.
    .PARAMETER Name
        Name of the responder policy for which to display settings.
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
        Invoke-NSGetResponderPolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyLBVServerBinding -Name 'responderpolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy_lbvserver_binding'
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
# endregion Invoke-NSGetResponderPolicyLBVServerBinding

# region Invoke-NSGetResponderPolicyResponderGlobalBinding
function Invoke-NSGetResponderPolicyResponderGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy_responderglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the responderglobal that can be bound to responderpolicy.
    .PARAMETER Name
        Name of the responder policy for which to display settings.
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
        Invoke-NSGetResponderPolicyResponderGlobalBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyResponderGlobalBinding -Name 'responderpolicy_responderglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyResponderGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy_responderglobal_binding'
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
# endregion Invoke-NSGetResponderPolicyResponderGlobalBinding

# region Invoke-NSGetResponderPolicyResponderPolicyLabelBinding
function Invoke-NSGetResponderPolicyResponderPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy_responderpolicylabel_binding configuration.
    .DESCRIPTION
        Binding object showing the responderpolicylabel that can be bound to responderpolicy.
    .PARAMETER Name
        Name of the responder policy for which to display settings.
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
        Invoke-NSGetResponderPolicyResponderPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyResponderPolicyLabelBinding -Name 'responderpolicy_responderpolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyResponderPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy_responderpolicylabel_binding'
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
# endregion Invoke-NSGetResponderPolicyResponderPolicyLabelBinding

# region Invoke-NSGetResponderPolicyVPNVServerBinding
function Invoke-NSGetResponderPolicyVPNVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler responderpolicy_vpnvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to responderpolicy.
    .PARAMETER Name
        Name of the responder policy for which to display settings.
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
        Invoke-NSGetResponderPolicyVPNVServerBinding
    .EXAMPLE
        Invoke-NSGetResponderPolicyVPNVServerBinding -Name 'responderpolicy_vpnvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetResponderPolicyVPNVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'responderpolicy_vpnvserver_binding'
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
# endregion Invoke-NSGetResponderPolicyVPNVServerBinding

# region Invoke-NSImportResponderHTMLPage
function Invoke-NSImportResponderHTMLPage {
    <#
    .SYNOPSIS
        Imports NetScaler responderhtmlpage data.
    .DESCRIPTION
        Configuration for Responder HTML page resource.
    .PARAMETER CaCertFile
        CA certificate file name which will be used to verify the peer's certificate. The certificate should be imported using "import ssl certfile" CLI command or equivalent in API or GUI. If certificate name is not configured, then default root CA certificates are used for peer's certificate verification.
    .PARAMETER Comment
        Any comments to preserve information about the HTML page object. Maximum length = 128
    .PARAMETER Name
        Name to assign to the HTML page object on the Citrix ADC. Minimum length = 1 Maximum length = 31
    .PARAMETER Overwrite
        Overwrites the existing file.
    .PARAMETER Src
        Local path or URL (protocol, host, path, and file name) for the file from which to retrieve the imported HTML page. NOTE: The import fails if the object to be imported is on an HTTPS server that requires client certificate authentication for access. Minimum length = 1 Maximum length = 2047
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSImportResponderHTMLPage -Name 'example'
    .EXAMPLE
        Invoke-NSImportResponderHTMLPage -Name 'example' -WhatIf
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
        [string] $CaCertFile,

        [Parameter()]
        [string] $Comment,

        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [bool] $Overwrite,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('CaCertFile')) { $body['cacertfile'] = $CaCertFile }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $Comment }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('Overwrite')) { $body['overwrite'] = $Overwrite }
        if ($PSBoundParameters.ContainsKey('Src')) { $body['src'] = $Src }

        if ($PSCmdlet.ShouldProcess('responderhtmlpage', 'Import responderhtmlpage')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderhtmlpage -Action Import -Payload @{ responderhtmlpage = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSImportResponderHTMLPage

# region Invoke-NSRenameResponderAction
function Invoke-NSRenameResponderAction {
    <#
    .SYNOPSIS
        Renames a NetScaler responderaction resource.
    .DESCRIPTION
        Configuration for responder action resource.
    .PARAMETER Name
        Name for the responder action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder action" or 'my responder action').
    .PARAMETER NewName
        New name for the responder action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder action" or my responder action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameResponderAction -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameResponderAction -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename responderaction')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderaction -Action rename -Payload @{ responderaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetResponderAction -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameResponderAction

# region Invoke-NSRenameResponderPolicy
function Invoke-NSRenameResponderPolicy {
    <#
    .SYNOPSIS
        Renames a NetScaler responderpolicy resource.
    .DESCRIPTION
        Configuration for responder policy resource.
    .PARAMETER Name
        Name for the responder policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy" or 'my responder policy').
    .PARAMETER NewName
        New name for the responder policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy" or 'my responder policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameResponderPolicy -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameResponderPolicy -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename responderpolicy')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderpolicy -Action rename -Payload @{ responderpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetResponderPolicy -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameResponderPolicy

# region Invoke-NSRenameResponderPolicyLabel
function Invoke-NSRenameResponderPolicyLabel {
    <#
    .SYNOPSIS
        Renames a NetScaler responderpolicylabel resource.
    .DESCRIPTION
        Configuration for responder policy label resource.
    .PARAMETER LabelName
        Name for the responder policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
    .PARAMETER NewName
        New name for the responder policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameResponderPolicyLabel -LabelName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameResponderPolicyLabel -LabelName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Rename responderpolicylabel')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderpolicylabel -Action rename -Payload @{ responderpolicylabel = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetResponderPolicyLabel -LabelName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameResponderPolicyLabel

# region Invoke-NSUnsetResponderAction
function Invoke-NSUnsetResponderAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler responderaction resource properties.
    .DESCRIPTION
        Configuration for responder action resource.
    .PARAMETER Name
        Name for the responder action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder action" or 'my responder action').
    .PARAMETER Comment
        Comment. Any type of information about this responder action.
    .PARAMETER HeaderS
        One or more headers to insert into the HTTP response. Each header is specified as "name(expr)", where expr is an expression that is evaluated at runtime to provide the value for the named header. You can configure a maximum of eight headers for a responder action.
    .PARAMETER Reasonphrase
        Expression specifying the reason phrase of the HTTP response. The reason phrase may be a string literal with quotes or a PI expression. For example: "Invalid URL: " + HTTP.REQ.URL. Minimum length = 1
    .PARAMETER ResponseStatuscode
        HTTP response status code, for example 200, 302, 404, etc. The default value for the redirect action type is 302 and for respondwithhtmlpage is 200. Minimum value = 100 Maximum value = 599
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetResponderAction -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUnsetResponderAction -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [switch] $HeaderS,

        [Parameter()]
        [switch] $Reasonphrase,

        [Parameter()]
        [switch] $ResponseStatuscode,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('HeaderS')) { $body['headers'] = $true }
        if ($PSBoundParameters.ContainsKey('Reasonphrase')) { $body['reasonphrase'] = $true }
        if ($PSBoundParameters.ContainsKey('ResponseStatuscode')) { $body['responsestatuscode'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear responderaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderaction -Action unset -Payload @{ responderaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetResponderAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetResponderAction

# region Invoke-NSUnsetResponderParam
function Invoke-NSUnsetResponderParam {
    <#
    .SYNOPSIS
        Clears one or more NetScaler responderparam resource properties.
    .DESCRIPTION
        Configuration for responser parameter resource.
    .PARAMETER Timeout
        Maximum time in milliseconds to allow for processing all the policies and their selected actions without interruption. If the timeout is reached then the evaluation causes an UNDEF to be raised and no further processing is performed. Default value: 3900 Minimum value = 1 Maximum value = 5000
    .PARAMETER UndefAction
        Action to perform when policy evaluation creates an UNDEF condition. Available settings function as follows: * NOOP - Send the request to the protected server. * RESET - Reset the request and notify the user's browser, so that the user can resend the request. * DROP - Drop the request without sending a response to the user. Default value: "NOOP"
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetResponderParam -Timeout  -PassThru
    .EXAMPLE
        Invoke-NSUnsetResponderParam -Timeout  -WhatIf
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
        [switch] $Timeout,

        [Parameter()]
        [switch] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('Timeout')) { $body['timeout'] = $true }
        if ($PSBoundParameters.ContainsKey('UndefAction')) { $body['undefaction'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('responderparam', 'Clear responderparam properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderparam -Action unset -Payload @{ responderparam = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetResponderParam

# region Invoke-NSUnsetResponderPolicy
function Invoke-NSUnsetResponderPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler responderpolicy resource properties.
    .DESCRIPTION
        Configuration for responder policy resource.
    .PARAMETER Name
        Name for the responder policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy" or 'my responder policy').
    .PARAMETER AppFlowAction
        AppFlow action to invoke for requests that match this policy.
    .PARAMETER Comment
        Any type of information about this responder policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER UndefAction
        Action to perform if the result of policy evaluation is undefined (UNDEF). An UNDEF event indicates an internal error condition. Only the above built-in actions can be used.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetResponderPolicy -Name 'example' -AppFlowAction  -PassThru
    .EXAMPLE
        Invoke-NSUnsetResponderPolicy -Name 'example' -AppFlowAction  -WhatIf
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
        [switch] $AppFlowAction,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [switch] $LogAction,

        [Parameter()]
        [switch] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('AppFlowAction')) { $body['appflowaction'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('LogAction')) { $body['logaction'] = $true }
        if ($PSBoundParameters.ContainsKey('UndefAction')) { $body['undefaction'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear responderpolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderpolicy -Action unset -Payload @{ responderpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetResponderPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetResponderPolicy

# region Invoke-NSUpdateResponderAction
function Invoke-NSUpdateResponderAction {
    <#
    .SYNOPSIS
        Updates a NetScaler responderaction resource.
    .DESCRIPTION
        Configuration for responder action resource.
    .PARAMETER BypassSafetycheck
        Bypass the safety check, allowing potentially unsafe expressions. An unsafe expression in a response is one that contains references to request elements that might not be present in all requests. If a response refers to a missing request element, an empty string is used instead. Default value: NO Possible values = YES, NO
    .PARAMETER Comment
        Comment. Any type of information about this responder action.
    .PARAMETER HeaderS
        One or more headers to insert into the HTTP response. Each header is specified as "name(expr)", where expr is an expression that is evaluated at runtime to provide the value for the named header. You can configure a maximum of eight headers for a responder action.
    .PARAMETER HTMLPage
        For respondwithhtmlpage policies, name of the HTML page object to use as the response. You must first import the page object. Minimum length = 1
    .PARAMETER Name
        Name for the responder action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder action" or 'my responder action').
    .PARAMETER Reasonphrase
        Expression specifying the reason phrase of the HTTP response. The reason phrase may be a string literal with quotes or a PI expression. For example: "Invalid URL: " + HTTP.REQ.URL. Minimum length = 1
    .PARAMETER ResponseStatuscode
        HTTP response status code, for example 200, 302, 404, etc. The default value for the redirect action type is 302 and for respondwithhtmlpage is 200. Minimum value = 100 Maximum value = 599
    .PARAMETER Target
        Expression specifying what to respond with. Typically a URL for redirect policies or a default-syntax expression. In addition to Citrix ADC default-syntax expressions that refer to information in the request, a stringbuilder expression can contain text and HTML, and simple escape codes that define new lines and paragraphs. Enclose each stringbuilder expression element (either a Citrix ADC default-syntax expression or a string) in double quotation marks. Use the plus (+) character to join the elements. Examples: 1) Respondwith expression that sends an HTTP 1.1 200 OK response: "HTTP/1.1 200 OK\r\n\r\n" 2) Redirect expression that redirects user to the specified web host and appends the request URL to the redirect. "http://backupsite2.com" + HTTP.REQ.URL 3) Respondwith expression that sends an HTTP 1.1 404 Not Found response with the request URL included in the response: "HTTP/1.1 404 Not Found\r\n\r\n"+ "HTTP.REQ.URL.HTTP_URL_SAFE" + "does not exist on the web server." The following requirement applies only to the Citrix ADC CLI: Enclose the entire expression in single quotation marks. (Citrix ADC expression elements should be included inside the single quotation marks for the entire expression, but do not need to be enclosed in double quotation marks.).
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateResponderAction -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateResponderAction -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $BypassSafetycheck,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string[]] $HeaderS,

        [Parameter()]
        [string] $HTMLPage,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Reasonphrase,

        [Parameter()]
        [int] $ResponseStatuscode,

        [Parameter()]
        [string] $Target,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('BypassSafetycheck')) { $properties['bypasssafetycheck'] = $BypassSafetycheck }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('HeaderS')) { $properties['headers'] = $HeaderS }
    if ($PSBoundParameters.ContainsKey('HTMLPage')) { $properties['htmlpage'] = $HTMLPage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Reasonphrase')) { $properties['reasonphrase'] = $Reasonphrase }
    if ($PSBoundParameters.ContainsKey('ResponseStatuscode')) { $properties['responsestatuscode'] = $ResponseStatuscode }
    if ($PSBoundParameters.ContainsKey('Target')) { $properties['target'] = $Target }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update responderaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type responderaction -Payload @{ responderaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetResponderAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateResponderAction

# region Invoke-NSUpdateResponderHTMLPage
function Invoke-NSUpdateResponderHTMLPage {
    <#
    .SYNOPSIS
        Invokes the change operation for a NetScaler responderhtmlpage resource.
    .DESCRIPTION
        Configuration for Responder HTML page resource.
    .PARAMETER Name
        Name to assign to the HTML page object on the Citrix ADC. Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSUpdateResponderHTMLPage -Name 'example'
    .EXAMPLE
        Invoke-NSUpdateResponderHTMLPage -Name 'example' -WhatIf
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
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }

        if ($PSCmdlet.ShouldProcess('responderhtmlpage', 'Change responderhtmlpage')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type responderhtmlpage -Action update -Payload @{ responderhtmlpage = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSUpdateResponderHTMLPage

# region Invoke-NSUpdateResponderParam
function Invoke-NSUpdateResponderParam {
    <#
    .SYNOPSIS
        Updates a NetScaler responderparam resource.
    .DESCRIPTION
        Configuration for responser parameter resource.
    .PARAMETER Timeout
        Maximum time in milliseconds to allow for processing all the policies and their selected actions without interruption. If the timeout is reached then the evaluation causes an UNDEF to be raised and no further processing is performed. Default value: 3900 Minimum value = 1 Maximum value = 5000
    .PARAMETER UndefAction
        Action to perform when policy evaluation creates an UNDEF condition. Available settings function as follows: * NOOP - Send the request to the protected server. * RESET - Reset the request and notify the user's browser, so that the user can resend the request. * DROP - Drop the request without sending a response to the user. Default value: "NOOP"
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateResponderParam  -PassThru
    .EXAMPLE
        Invoke-NSUpdateResponderParam  -WhatIf
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
        [int] $Timeout,

        [Parameter()]
        [string] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('Timeout')) { $properties['timeout'] = $Timeout }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('responderparam', 'Update responderparam')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type responderparam -Payload @{ responderparam = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateResponderParam

# region Invoke-NSUpdateResponderPolicy
function Invoke-NSUpdateResponderPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler responderpolicy resource.
    .DESCRIPTION
        Configuration for responder policy resource.
    .PARAMETER Action
        Name of the responder action to perform if the request matches this responder policy. There are also some built-in actions which can be used. These are: * NOOP - Send the request to the protected server instead of responding to it. * RESET - Reset the client connection by closing it. The client program, such as a browser, will handle this and may inform the user. The client may then resend the request if desired. * DROP - Drop the request without sending a response to the user.
    .PARAMETER AppFlowAction
        AppFlow action to invoke for requests that match this policy.
    .PARAMETER Comment
        Any type of information about this responder policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the responder policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the responder policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy" or 'my responder policy').
    .PARAMETER Rule
        Expression that the policy uses to determine whether to respond to the specified request.
    .PARAMETER UndefAction
        Action to perform if the result of policy evaluation is undefined (UNDEF). An UNDEF event indicates an internal error condition. Only the above built-in actions can be used.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateResponderPolicy -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateResponderPolicy -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $AppFlowAction,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Rule,

        [Parameter()]
        [string] $UndefAction,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('AppFlowAction')) { $properties['appflowaction'] = $AppFlowAction }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update responderpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type responderpolicy -Payload @{ responderpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetResponderPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateResponderPolicy

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAmF+8EnFxWOctI
# OTjBbbZZbza/8rt37ceA81sscWgj66CCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAurCt6s
# uD46eyRCAAAAC6sKMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYxMTA5MDE1NDMxWhcNMjYxMTEy
# MDE1NDMxWjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAzV8KpcpErJZ5+WezJL1oD0MO
# 4I+G+P+oJJILgQ5imTksdffUO7+SvvITM7ZvMxxTpLJhJJ20ILGbcfP/0g267tFM
# q/EzO3ClRzAQVZSoolP+v34Ch+aXtuVw+yk3gI68Txdgp1SzQP1iVKzkhD4f8luq
# hFib3eImENRvbBMQMXCT8uWS0HEPBSR5g+fEE7njdQhUb6HuIh6KsM5R/skQ30T3
# LprHb516F00X1L3sn9Z78jxtwuJK88kT22FxyJYlk15znumEiQ9w55zLkAHKNgk4
# i+dp6ljoVqRt/Kv+D7ZWfleOHoRHjB0UNnPMSjC0B51bS40gxJpXOBaq0V1nESZL
# zA6tZPpmvXnxNIEROyKr3/PRNYPTbzfXjWhnX2YVUzD6CJxArctYup6Typp5dfxo
# OxHqZ3ddrcQXNumGcMSYQv30GjByUYJ1KXlP3DPN1w+p9VTH1aInB0MCxe65PzzS
# hzOB2U+qZ5JdILqf5Ea2fG5dASB9Q/UuQJPukpFRAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# PWlH3ZJGiiEWFhCkCohRoCSnbB4wHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAHkf
# P4Tud8oXugiRGeDRMrb6mqaFKwjFCzAr+WlAcrN/gHMK8xj4Za97T7ptRDpae+Yo
# 2BnzfFgKQOfavQkK/0xx9TNWYasJMUH+pXsr2AD+BJ+7Xcq9DryAjVJk6u6+Ap6Z
# 9IfDce6n0Bc5Kh32dMDXcYiqI6wKoRtFjRflmAhATGbmSdkxSF520fhd88ohgmmi
# ua2hMNE1N0BFiNg5mj+fbyvanTwqzuq+73TZz4g3Z5qkau1dWfZj2l2NZ2hZQD4u
# m5q+RTUZtxu8xoAWbVanl28qZ9ZMFQPszBva6vpYUSYYvBreuvJrnXhNi+x5HZL5
# MlfKpnZPhAD9A0HdAAaFOyrLJWCdW5c/XLJljtKILhzCRCIC7CBkPvn6DsnZcNoA
# jYLj1Dgz9n7RQsbbnoYRAB0GJjTueO2vyDLoG86DnoYfgljwKVWrAZeA5oan4JYS
# j0nFqQy43Tqh7JXqwKJfUA3J0iSw7dWsn3WVkfUA2lVqr3ogbB4rY+xqiyNwe5kh
# G5SMyfQ+pZHf4acDXc/+SY0+Tu8phNScJWht9goe8uSkuvZBIoe9XH2kzUmWyVrn
# SZzhW+oZL6aRLEcn1gAK8Ys9ZmidhukiKlmZf7HW1hNU6ttFkI2LT/tQzg8Y0tLy
# q5uDgBA7Vgh3gD+bVbDTiV3hhaOXxvb3asjn+F0IMIIGwDCCBKigAwIBAgITMwAL
# qwrerLg+OnskQgAAAAurCjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MTEwOTAxNTQzMVoXDTI2
# MTExMjAxNTQzMVowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAM1fCqXKRKyWeflnsyS9
# aA9DDuCPhvj/qCSSC4EOYpk5LHX31Du/kr7yEzO2bzMcU6SyYSSdtCCxm3Hz/9IN
# uu7RTKvxMztwpUcwEFWUqKJT/r9+Aofml7blcPspN4COvE8XYKdUs0D9YlSs5IQ+
# H/JbqoRYm93iJhDUb2wTEDFwk/LlktBxDwUkeYPnxBO543UIVG+h7iIeirDOUf7J
# EN9E9y6ax2+dehdNF9S97J/We/I8bcLiSvPJE9thcciWJZNec57phIkPcOecy5AB
# yjYJOIvnaepY6Fakbfyr/g+2Vn5Xjh6ER4wdFDZzzEowtAedW0uNIMSaVzgWqtFd
# ZxEmS8wOrWT6Zr158TSBETsiq9/z0TWD0283141oZ19mFVMw+gicQK3LWLqek8qa
# eXX8aDsR6md3Xa3EFzbphnDEmEL99BowclGCdSl5T9wzzdcPqfVUx9WiJwdDAsXu
# uT880oczgdlPqmeSXSC6n+RGtnxuXQEgfUP1LkCT7pKRUQIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFD1pR92SRoohFhYQpAqIUaAkp2weMB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQB5Hz+E7nfKF7oIkRng0TK2+pqmhSsIxQswK/lpQHKzf4BzCvMY+GWve0+6bUQ6
# WnvmKNgZ83xYCkDn2r0JCv9McfUzVmGrCTFB/qV7K9gA/gSfu13KvQ68gI1SZOru
# vgKemfSHw3Hup9AXOSod9nTA13GIqiOsCqEbRY0X5ZgIQExm5knZMUhedtH4XfPK
# IYJpormtoTDRNTdARYjYOZo/n28r2p08Ks7qvu902c+IN2eapGrtXVn2Y9pdjWdo
# WUA+LpuavkU1GbcbvMaAFm1Wp5dvKmfWTBUD7Mwb2ur6WFEmGLwa3rrya514TYvs
# eR2S+TJXyqZ2T4QA/QNB3QAGhTsqyyVgnVuXP1yyZY7SiC4cwkQiAuwgZD75+g7J
# 2XDaAI2C49Q4M/Z+0ULG256GEQAdBiY07njtr8gy6BvOg56GH4JY8ClVqwGXgOaG
# p+CWEo9JxakMuN06oeyV6sCiX1ANydIksO3VrJ91lZH1ANpVaq96IGweK2Psaosj
# cHuZIRuUjMn0PqWR3+GnA13P/kmNPk7vKYTUnCVobfYKHvLkpLr2QSKHvVx9pM1J
# lsla50mc4VvqGS+mkSxHJ9YACvGLPWZonYbpIipZmX+x1tYTVOrbRZCNi0/7UM4P
# GNLS8qubg4AQO1YId4A/m1Ww04ld4YWjl8b292rI5/hdCDCCBygwggUQoAMCAQIC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAC6sK
# 3qy4Pjp7JEIAAAALqwowDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgv7X4
# Nr7FE1UxgyOrQiVxkGMIQcxilc5tfXiOYnx7FQcwDQYJKoZIhvcNAQEBBQAEggGA
# c1etrSPFg1FLT9wwbghRp9Wo1vmy0CtLPVnQcUhBsjlugWDrcZfKSyQjVtRvB6Mo
# IA90H8iJzRAleHYdoC/73qa2+iTFVtxQGDybfmOHfgmULiCofIJAHUor5iBlJQMN
# 8dTbk6W5ng4gfvgdzTdHSo8uEd2mLoeyG55XQ5MESCUPuMtQC8jnw2XBl/m0LU7i
# paRVNyjsnuIHxI0SkpjN377qaH9i5oEFxRPJVGSEU2uomXK2RGR3CTB4MnPbbKOf
# J6ov3oGFAuGJnj3VLA6KRdiBDXR8IaKBneLjMmISq0U9HqVkixo1z534VGC4+6TK
# 3WLx1RdyOcQAvSotzKWTyPs8CQ27iMnZapVG41JvN8kHVNzMU5AndJTK7tUzvPg8
# p1sBlC11J3lrRoiuKIw3O5hJ/S3kIQbr+F+ZlWYozIx+WTmv6Tcvy5g485aBfJt/
# gNg6JNUHVKLMvnrcJQxulQcDxaz+1RUIUexUoo/IZoBzGckng7zQtbp3ClOL9Wru
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIAxzEjz7dlGERAoBSIGY
# be82XITVvDuyb2OZxA8+zIL9AgZq7cEb8EQYEzIwMjYxMTEwMTAyMzE2LjI2OVow
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
# IgQg4qjpe71d9Q+ziZhZCSTHNXfikad6FcNdAvDlI8vVPwUwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCAvMQNVXZ0b0xxlGw8X/3IEybObuT6a5W1d61CW+cGD
# 7zB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzAiBCD24jAOeXv9DTZCuIWf
# lyXBcS1oHMZZkw0MN8R/nw1gZDANBgkqhkiG9w0BAQsFAASCAgBqaWymtpJC9cmm
# i8CDK8jR3c7J7IjrSQcElaYbwK+mFODSVjgt6WIdX1x7RdDunEUftDkFOHKzTlf6
# IuWynloVa28W/LDjyiubotIAMhiv3JZW+DWI9SbX7j3FcKWNHSYcTA2iVSbGHkV4
# D8Eu3I+SJ/Z5D7fr4i+w3mK/g7p9xyT+Enn34sDfjFVURjnn14HrRyD6qvQ3CX1D
# hFUuCrPKNStWsPRn103UfI5iwFRqh2zEWaXmCX7oZhBD85W09o8NTmUcc9LyS+Z2
# RRqOgiZO9KIOXuxYG5hvueZNHjwGzCOwl3uz0az4evi4ac1GqN5F8Ehr86Q+2Hu/
# 43L7oBMECqM9gV23tc2M/lHH4R22Z4nC3+vH/CxeCpCicohzzPFoyKR9LGCcggAz
# VZ94N+1owP7LKwr7fMOPdLqILtpLE707bTO8iyT1XgUAnjh3l4DWwV2UzR6WbaM+
# iJfd+NfwndR1Sj50vDii//UGBEzOmrRPA71cx30jtmIm5HEJ7jNI1cL7fIPqwoOZ
# 0/R8g/fid3oLE9ALGABJoCr3l0feG1WImlaArFfJXtf/vr3ZgV0m6iNnz8a4m8pZ
# r3kqimNFog6vEyikKxKkSOfTM8wrYc46vSG2bw6wOsPUgLBhmdrpe5lAYFB728SD
# Crpfcdz/JfWkc280ybG0aPamMK/aLw==
# SIG # End signature block
