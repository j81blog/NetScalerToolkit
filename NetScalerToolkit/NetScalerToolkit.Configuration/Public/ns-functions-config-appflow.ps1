# Generated NetScalerToolkit Configuration bundle for category 'appflow'.

# region Invoke-NSAddAppFlowAction
function Invoke-NSAddAppFlowAction {
    <#
    .SYNOPSIS
        Creates a NetScaler appflowaction resource.
    .DESCRIPTION
        Configuration for AppFlow action resource.
    .PARAMETER BotInsight
        On enabling this option, the Citrix ADC will send the bot insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ciinsight
        On enabling this option, the Citrix ADC will send the ContentInspection Insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ClientsIdemeasurements
        On enabling this option, the Citrix ADC will collect the time required to load and render the mainpage on the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Collectors
        Name(s) of collector(s) to be associated with the AppFlow action. Minimum length = 1
    .PARAMETER Comment
        Any comments about this action. In the CLI, if including spaces between words, enclose the comment in quotation marks. (The quotation marks are not required in the configuration utility.). Maximum length = 256
    .PARAMETER Distributionalgorithm
        On enabling this option, the Citrix ADC will distribute records among the collectors. Else, all records will be sent to all the collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Metricslog
        If only the stats records are to be exported, turn on this option.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
    .PARAMETER PageTracking
        On enabling this option, the Citrix ADC will start tracking the page for waterfall chart by inserting a NS_ESNS cookie in the response. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Securityinsight
        On enabling this option, the Citrix ADC will send the security insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER TransActionLog
        Log ANOMALOUS or ALL transactions. Default value: ALL Possible values = ALL, ANOMALOUS
    .PARAMETER VideoAnalytics
        On enabling this option, the Citrix ADC will send the videoinsight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER WebInsight
        On enabling this option, the Citrix ADC will send the webinsight records to the configured collectors. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAppFlowAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAppFlowAction -Name 'example' -WhatIf
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
        [string] $BotInsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ciinsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ClientsIdemeasurements,

        [Parameter()]
        [string[]] $Collectors,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Distributionalgorithm,

        [Parameter()]
        [bool] $Metricslog,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PageTracking,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Securityinsight,

        [Parameter()]
        [ValidateSet('ALL', 'ANOMALOUS')]
        [string] $TransActionLog,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $VideoAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $WebInsight,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('BotInsight')) { $properties['botinsight'] = $BotInsight }
    if ($PSBoundParameters.ContainsKey('Ciinsight')) { $properties['ciinsight'] = $Ciinsight }
    if ($PSBoundParameters.ContainsKey('ClientsIdemeasurements')) { $properties['clientsidemeasurements'] = $ClientsIdemeasurements }
    if ($PSBoundParameters.ContainsKey('Collectors')) { $properties['collectors'] = $Collectors }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Distributionalgorithm')) { $properties['distributionalgorithm'] = $Distributionalgorithm }
    if ($PSBoundParameters.ContainsKey('Metricslog')) { $properties['metricslog'] = $Metricslog }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PageTracking')) { $properties['pagetracking'] = $PageTracking }
    if ($PSBoundParameters.ContainsKey('Securityinsight')) { $properties['securityinsight'] = $Securityinsight }
    if ($PSBoundParameters.ContainsKey('TransActionLog')) { $properties['transactionlog'] = $TransActionLog }
    if ($PSBoundParameters.ContainsKey('VideoAnalytics')) { $properties['videoanalytics'] = $VideoAnalytics }
    if ($PSBoundParameters.ContainsKey('WebInsight')) { $properties['webinsight'] = $WebInsight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create appflowaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowaction -Payload @{ appflowaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAppFlowAction

# region Invoke-NSAddAppFlowActionAnalyticsProfileBinding
function Invoke-NSAddAppFlowActionAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler appflowaction_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to appflowaction.
    .PARAMETER AnalyticsProfile
        Analytics profile to be bound to the appflow action.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAppFlowActionAnalyticsProfileBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAppFlowActionAnalyticsProfileBinding -Name 'example' -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$Name", 'Create appflowaction_analyticsprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowaction_analyticsprofile_binding -Payload @{ appflowaction_analyticsprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowActionAnalyticsProfileBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAppFlowActionAnalyticsProfileBinding

# region Invoke-NSAddAppFlowCollector
function Invoke-NSAddAppFlowCollector {
    <#
    .SYNOPSIS
        Creates a NetScaler appflowcollector resource.
    .DESCRIPTION
        Configuration for AppFlow collector resource.
    .PARAMETER Ipaddress
        IPv4 address of the collector.
    .PARAMETER Name
        Name for the collector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Only four collectors can be configured. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow collector" or 'my appflow collector'). Minimum length = 1 Maximum length = 127
    .PARAMETER NetProfile
        Netprofile to associate with the collector. The IP address defined in the profile is used as the source IP address for AppFlow traffic for this collector. If you do not set this parameter, the Citrix ADC IP (NSIP) address is used as the source IP address. Maximum length = 128
    .PARAMETER Port
        Port on which the collector listens.
    .PARAMETER TransPort
        Type of collector: either logstream or ipfix or rest. Default value: ipfix, Possible values = ipfix, logstream
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAppFlowCollector -Name 'example' -Ipaddress 'example' -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddAppFlowCollector -Name 'example' -Ipaddress 'example' -Port 80 -WhatIf
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
        [string] $Ipaddress,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $TransPort,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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

    if ($PSBoundParameters.ContainsKey('TransPort')) {
        Assert-NSParameterValue -ParameterName 'TransPort' -Value $TransPort -AllowedValuesByVersion @{ '13.1' = @('ipfix', 'logstream', 'rest'); '14.1' = @('ipfix', 'logstream') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('TransPort')) { $properties['transport'] = $TransPort }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create appflowcollector')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowcollector -Payload @{ appflowcollector = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowCollector -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAppFlowCollector

# region Invoke-NSAddAppFlowGlobalAppFlowPolicyBinding
function Invoke-NSAddAppFlowGlobalAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler appflowglobal_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to appflowglobal.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke policies bound to a virtual server or a user-defined policy label. After the invoked policies are evaluated, the flow returns to the policy with the next priority.
    .PARAMETER LabelName
        Name of the label to invoke if the current policy evaluates to TRUE.
    .PARAMETER LabelType
        Type of policy label to invoke. Specify vserver for a policy label associated with a virtual server, or policylabel for a user-defined policy label. Possible values = vserver, policylabel
    .PARAMETER PolicyName
        Name of the AppFlow policy.
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Type
        Global bind point for which to show detailed information about the policies bound to the bind point. Possible values = REQ_OVERRIDE, REQ_DEFAULT, OVERRIDE, DEFAULT, OTHERTCP_REQ_OVERRIDE, OTHERTCP_REQ_DEFAULT, MSSQL_REQ_OVERRIDE, MSSQL_REQ_DEFAULT, MYSQL_REQ_OVERRIDE, MYSQL_REQ_DEFAULT, ICA_REQ_OVERRIDE, ICA_REQ_DEFAULT, ORACLE_REQ_OVERRIDE, ORACLE_REQ_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAppFlowGlobalAppFlowPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddAppFlowGlobalAppFlowPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'OVERRIDE', 'DEFAULT', 'OTHERTCP_REQ_OVERRIDE', 'OTHERTCP_REQ_DEFAULT', 'MSSQL_REQ_OVERRIDE', 'MSSQL_REQ_DEFAULT', 'MYSQL_REQ_OVERRIDE', 'MYSQL_REQ_DEFAULT', 'ICA_REQ_OVERRIDE', 'ICA_REQ_DEFAULT', 'ORACLE_REQ_OVERRIDE', 'ORACLE_REQ_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT')]
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

    if ($PSCmdlet.ShouldProcess('appflowglobal_appflowpolicy_binding', 'Create appflowglobal_appflowpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowglobal_appflowpolicy_binding -Payload @{ appflowglobal_appflowpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddAppFlowGlobalAppFlowPolicyBinding

# region Invoke-NSAddAppFlowPolicy
function Invoke-NSAddAppFlowPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler appflowpolicy resource.
    .DESCRIPTION
        Configuration for AppFlow policy resource.
    .PARAMETER Action
        Name of the action to be associated with this policy.
    .PARAMETER Comment
        Any comments about this policy.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policy" or 'my appflow policy').
    .PARAMETER Rule
        Expression or other value against which the traffic is evaluated. Must be a Boolean expression. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER UndefAction
        Name of the appflow action to be associated with this policy when an undef event occurs.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAppFlowPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAppFlowPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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
        [string] $Comment,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create appflowpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowpolicy -Payload @{ appflowpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAppFlowPolicy

# region Invoke-NSAddAppFlowPolicyLabel
function Invoke-NSAddAppFlowPolicyLabel {
    <#
    .SYNOPSIS
        Creates a NetScaler appflowpolicylabel resource.
    .DESCRIPTION
        Configuration for AppFlow policy label resource.
    .PARAMETER LabelName
        Name of the AppFlow policy label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policylabel" or 'my appflow policylabel'). Minimum length = 1
    .PARAMETER PolicyLabelType
        Type of traffic evaluated by the policies bound to the policy label. Default value: HTTP Possible values = HTTP, OTHERTCP, HTTP_QUIC
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAppFlowPolicyLabel -LabelName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAppFlowPolicyLabel -LabelName 'example' -WhatIf
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

        [Parameter()]
        [ValidateSet('HTTP', 'OTHERTCP', 'HTTP_QUIC')]
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
    if ($PSBoundParameters.ContainsKey('LabelName')) { $properties['labelname'] = $LabelName }
    if ($PSBoundParameters.ContainsKey('PolicyLabelType')) { $properties['policylabeltype'] = $PolicyLabelType }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create appflowpolicylabel')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowpolicylabel -Payload @{ appflowpolicylabel = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowPolicyLabel -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAppFlowPolicyLabel

# region Invoke-NSAddAppFlowPolicyLabelAppFlowPolicyBinding
function Invoke-NSAddAppFlowPolicyLabelAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler appflowpolicylabel_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to appflowpolicylabel.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        Invoke policies bound to a virtual server or a user-defined policy label. After the invoked policies are evaluated, the flow returns to the policy with the next priority.
    .PARAMETER InvokeLabelName
        Name of the label to invoke if the current policy evaluates to TRUE.
    .PARAMETER LabelName
        Name of the policy label to which to bind the policy. Minimum length = 1
    .PARAMETER LabelType
        Type of policy label to be invoked. Possible values = vserver, policylabel
    .PARAMETER PolicyName
        Name of the AppFlow policy.
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
        Invoke-NSAddAppFlowPolicyLabelAppFlowPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddAppFlowPolicyLabelAppFlowPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create appflowpolicylabel_appflowpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowpolicylabel_appflowpolicy_binding -Payload @{ appflowpolicylabel_appflowpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAppFlowPolicyLabelAppFlowPolicyBinding

# region Invoke-NSDeleteAppFlowAction
function Invoke-NSDeleteAppFlowAction {
    <#
    .SYNOPSIS
        Removes a NetScaler appflowaction resource.
    .DESCRIPTION
        Configuration for AppFlow action resource.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAppFlowAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAppFlowAction -Name 'appflowaction_example' | Invoke-NSDeleteAppFlowAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete appflowaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type appflowaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAppFlowAction

# region Invoke-NSDeleteAppFlowActionAnalyticsProfileBinding
function Invoke-NSDeleteAppFlowActionAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler appflowaction_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to appflowaction.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
    .PARAMETER AnalyticsProfile
        Analytics profile to be bound to the appflow action.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAppFlowActionAnalyticsProfileBinding -Name 'example' -AnalyticsProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAppFlowActionAnalyticsProfileBinding -Name 'appflowaction_analyticsprofile_binding_example' | Invoke-NSDeleteAppFlowActionAnalyticsProfileBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete appflowaction_analyticsprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type appflowaction_analyticsprofile_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAppFlowActionAnalyticsProfileBinding

# region Invoke-NSDeleteAppFlowCollector
function Invoke-NSDeleteAppFlowCollector {
    <#
    .SYNOPSIS
        Removes a NetScaler appflowcollector resource.
    .DESCRIPTION
        Configuration for AppFlow collector resource.
    .PARAMETER Name
        Name for the collector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Only four collectors can be configured. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow collector" or 'my appflow collector'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAppFlowCollector -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAppFlowCollector -Name 'appflowcollector_example' | Invoke-NSDeleteAppFlowCollector -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete appflowcollector')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type appflowcollector -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAppFlowCollector

# region Invoke-NSDeleteAppFlowGlobalAppFlowPolicyBinding
function Invoke-NSDeleteAppFlowGlobalAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler appflowglobal_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to appflowglobal.
    .PARAMETER PolicyName
        Name of the AppFlow policy.
    .PARAMETER Type
        Global bind point for which to show detailed information about the policies bound to the bind point. Possible values = REQ_OVERRIDE, REQ_DEFAULT, OVERRIDE, DEFAULT, OTHERTCP_REQ_OVERRIDE, OTHERTCP_REQ_DEFAULT, MSSQL_REQ_OVERRIDE, MSSQL_REQ_DEFAULT, MYSQL_REQ_OVERRIDE, MYSQL_REQ_DEFAULT, ICA_REQ_OVERRIDE, ICA_REQ_DEFAULT, ORACLE_REQ_OVERRIDE, ORACLE_REQ_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
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
        Invoke-NSDeleteAppFlowGlobalAppFlowPolicyBinding -PolicyName 'example' -Priority 1 -Type REQ_OVERRIDE -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAppFlowGlobalAppFlowPolicyBinding  | Invoke-NSDeleteAppFlowGlobalAppFlowPolicyBinding -Confirm:$false
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'OVERRIDE', 'DEFAULT', 'OTHERTCP_REQ_OVERRIDE', 'OTHERTCP_REQ_DEFAULT', 'MSSQL_REQ_OVERRIDE', 'MSSQL_REQ_DEFAULT', 'MYSQL_REQ_OVERRIDE', 'MYSQL_REQ_DEFAULT', 'ICA_REQ_OVERRIDE', 'ICA_REQ_DEFAULT', 'ORACLE_REQ_OVERRIDE', 'ORACLE_REQ_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT')]
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

        if ($PSCmdlet.ShouldProcess('appflowglobal_appflowpolicy_binding', 'Delete appflowglobal_appflowpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type appflowglobal_appflowpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAppFlowGlobalAppFlowPolicyBinding

# region Invoke-NSDeleteAppFlowPolicy
function Invoke-NSDeleteAppFlowPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler appflowpolicy resource.
    .DESCRIPTION
        Configuration for AppFlow policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policy" or 'my appflow policy').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAppFlowPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAppFlowPolicy -Name 'appflowpolicy_example' | Invoke-NSDeleteAppFlowPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete appflowpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type appflowpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAppFlowPolicy

# region Invoke-NSDeleteAppFlowPolicyLabel
function Invoke-NSDeleteAppFlowPolicyLabel {
    <#
    .SYNOPSIS
        Removes a NetScaler appflowpolicylabel resource.
    .DESCRIPTION
        Configuration for AppFlow policy label resource.
    .PARAMETER LabelName
        Name of the AppFlow policy label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policylabel" or 'my appflow policylabel'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAppFlowPolicyLabel -LabelName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabel -LabelName 'appflowpolicylabel_example' | Invoke-NSDeleteAppFlowPolicyLabel -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete appflowpolicylabel')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type appflowpolicylabel -Resource $LabelName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAppFlowPolicyLabel

# region Invoke-NSDeleteAppFlowPolicyLabelAppFlowPolicyBinding
function Invoke-NSDeleteAppFlowPolicyLabelAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler appflowpolicylabel_appflowpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to appflowpolicylabel.
    .PARAMETER LabelName
        Name of the policy label to which to bind the policy. Minimum length = 1
    .PARAMETER PolicyName
        Name of the AppFlow policy.
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
        Invoke-NSDeleteAppFlowPolicyLabelAppFlowPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding -LabelName 'appflowpolicylabel_appflowpolicy_binding_example' | Invoke-NSDeleteAppFlowPolicyLabelAppFlowPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete appflowpolicylabel_appflowpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type appflowpolicylabel_appflowpolicy_binding -Resource $LabelName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAppFlowPolicyLabelAppFlowPolicyBinding

# region Invoke-NSGetAppFlowAction
function Invoke-NSGetAppFlowAction {
    <#
    .SYNOPSIS
        Gets NetScaler appflowaction configuration.
    .DESCRIPTION
        Configuration for AppFlow action resource.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
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
        Invoke-NSGetAppFlowAction
    .EXAMPLE
        Invoke-NSGetAppFlowAction -Name 'appflowaction_example'
    .EXAMPLE
        Invoke-NSGetAppFlowAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowaction'
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
# endregion Invoke-NSGetAppFlowAction

# region Invoke-NSGetAppFlowActionAnalyticsProfileBinding
function Invoke-NSGetAppFlowActionAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowaction_analyticsprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to appflowaction.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
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
        Invoke-NSGetAppFlowActionAnalyticsProfileBinding
    .EXAMPLE
        Invoke-NSGetAppFlowActionAnalyticsProfileBinding -Name 'appflowaction_analyticsprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowActionAnalyticsProfileBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowaction_analyticsprofile_binding'
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
# endregion Invoke-NSGetAppFlowActionAnalyticsProfileBinding

# region Invoke-NSGetAppFlowActionBinding
function Invoke-NSGetAppFlowActionBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowaction_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to appflowaction.
    .PARAMETER Name
        Name of the action about which to display information.
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
        Invoke-NSGetAppFlowActionBinding
    .EXAMPLE
        Invoke-NSGetAppFlowActionBinding -Name 'appflowaction_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowActionBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowaction_binding'
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
# endregion Invoke-NSGetAppFlowActionBinding

# region Invoke-NSGetAppFlowCollector
function Invoke-NSGetAppFlowCollector {
    <#
    .SYNOPSIS
        Gets NetScaler appflowcollector configuration.
    .DESCRIPTION
        Configuration for AppFlow collector resource.
    .PARAMETER Name
        Name for the collector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Only four collectors can be configured. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow collector" or 'my appflow collector'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetAppFlowCollector
    .EXAMPLE
        Invoke-NSGetAppFlowCollector -Name 'appflowcollector_example'
    .EXAMPLE
        Invoke-NSGetAppFlowCollector -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowcollector'
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
# endregion Invoke-NSGetAppFlowCollector

# region Invoke-NSGetAppFlowGlobalAppFlowPolicyBinding
function Invoke-NSGetAppFlowGlobalAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowglobal_appflowpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to appflowglobal.
    .PARAMETER Type
        Global bind point for which to show detailed information about the policies bound to the bind point. Possible values = REQ_OVERRIDE, REQ_DEFAULT, OVERRIDE, DEFAULT, OTHERTCP_REQ_OVERRIDE, OTHERTCP_REQ_DEFAULT, MSSQL_REQ_OVERRIDE, MSSQL_REQ_DEFAULT, MYSQL_REQ_OVERRIDE, MYSQL_REQ_DEFAULT, ICA_REQ_OVERRIDE, ICA_REQ_DEFAULT, ORACLE_REQ_OVERRIDE, ORACLE_REQ_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT
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
        Invoke-NSGetAppFlowGlobalAppFlowPolicyBinding
    .EXAMPLE
        Invoke-NSGetAppFlowGlobalAppFlowPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT', 'OVERRIDE', 'DEFAULT', 'OTHERTCP_REQ_OVERRIDE', 'OTHERTCP_REQ_DEFAULT', 'MSSQL_REQ_OVERRIDE', 'MSSQL_REQ_DEFAULT', 'MYSQL_REQ_OVERRIDE', 'MYSQL_REQ_DEFAULT', 'ICA_REQ_OVERRIDE', 'ICA_REQ_DEFAULT', 'ORACLE_REQ_OVERRIDE', 'ORACLE_REQ_DEFAULT', 'HTTPQUIC_REQ_OVERRIDE', 'HTTPQUIC_REQ_DEFAULT')]
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
            Type = 'appflowglobal_appflowpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAppFlowGlobalAppFlowPolicyBinding

# region Invoke-NSGetAppFlowGlobalBinding
function Invoke-NSGetAppFlowGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to appflowglobal.
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
        Invoke-NSGetAppFlowGlobalBinding
    .EXAMPLE
        Invoke-NSGetAppFlowGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAppFlowGlobalBinding

# region Invoke-NSGetAppFlowParam
function Invoke-NSGetAppFlowParam {
    <#
    .SYNOPSIS
        Gets NetScaler appflowparam configuration.
    .DESCRIPTION
        Configuration for AppFlow parameter resource.
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
        Invoke-NSGetAppFlowParam
    .EXAMPLE
        Invoke-NSGetAppFlowParam -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowparam'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAppFlowParam

# region Invoke-NSGetAppFlowPolicy
function Invoke-NSGetAppFlowPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicy configuration.
    .DESCRIPTION
        Configuration for AppFlow policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policy" or 'my appflow policy').
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
        Invoke-NSGetAppFlowPolicy
    .EXAMPLE
        Invoke-NSGetAppFlowPolicy -Name 'appflowpolicy_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicy'
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
# endregion Invoke-NSGetAppFlowPolicy

# region Invoke-NSGetAppFlowPolicyAppFlowGlobalBinding
function Invoke-NSGetAppFlowPolicyAppFlowGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicy_appflowglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the appflowglobal that can be bound to appflowpolicy.
    .PARAMETER Name
        Name of the policy about which to display detailed information.
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
        Invoke-NSGetAppFlowPolicyAppFlowGlobalBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyAppFlowGlobalBinding -Name 'appflowpolicy_appflowglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyAppFlowGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicy_appflowglobal_binding'
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
# endregion Invoke-NSGetAppFlowPolicyAppFlowGlobalBinding

# region Invoke-NSGetAppFlowPolicyAppFlowPolicyLabelBinding
function Invoke-NSGetAppFlowPolicyAppFlowPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicy_appflowpolicylabel_binding configuration.
    .DESCRIPTION
        Binding object showing the appflowpolicylabel that can be bound to appflowpolicy.
    .PARAMETER Name
        Name of the policy about which to display detailed information.
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
        Invoke-NSGetAppFlowPolicyAppFlowPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyAppFlowPolicyLabelBinding -Name 'appflowpolicy_appflowpolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyAppFlowPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicy_appflowpolicylabel_binding'
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
# endregion Invoke-NSGetAppFlowPolicyAppFlowPolicyLabelBinding

# region Invoke-NSGetAppFlowPolicyBinding
function Invoke-NSGetAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to appflowpolicy.
    .PARAMETER Name
        Name of the policy about which to display detailed information.
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
        Invoke-NSGetAppFlowPolicyBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyBinding -Name 'appflowpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicy_binding'
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
# endregion Invoke-NSGetAppFlowPolicyBinding

# region Invoke-NSGetAppFlowPolicyCSVServerBinding
function Invoke-NSGetAppFlowPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to appflowpolicy.
    .PARAMETER Name
        Name of the policy about which to display detailed information.
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
        Invoke-NSGetAppFlowPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyCSVServerBinding -Name 'appflowpolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicy_csvserver_binding'
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
# endregion Invoke-NSGetAppFlowPolicyCSVServerBinding

# region Invoke-NSGetAppFlowPolicyLabel
function Invoke-NSGetAppFlowPolicyLabel {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicylabel configuration.
    .DESCRIPTION
        Configuration for AppFlow policy label resource.
    .PARAMETER LabelName
        Name of the AppFlow policy label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policylabel" or 'my appflow policylabel'). Minimum length = 1
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
        Invoke-NSGetAppFlowPolicyLabel
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabel -LabelName 'appflowpolicylabel_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabel -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicylabel'
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
# endregion Invoke-NSGetAppFlowPolicyLabel

# region Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding
function Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicylabel_appflowpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the appflowpolicy that can be bound to appflowpolicylabel.
    .PARAMETER LabelName
        Name of the policy label to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding -LabelName 'appflowpolicylabel_appflowpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicylabel_appflowpolicy_binding'
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
# endregion Invoke-NSGetAppFlowPolicyLabelAppFlowPolicyBinding

# region Invoke-NSGetAppFlowPolicyLabelBinding
function Invoke-NSGetAppFlowPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicylabel_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to appflowpolicylabel.
    .PARAMETER LabelName
        Name of the policy label about which to display detailed information. Minimum length = 1
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
        Invoke-NSGetAppFlowPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabelBinding -LabelName 'appflowpolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicylabel_binding'
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
# endregion Invoke-NSGetAppFlowPolicyLabelBinding

# region Invoke-NSGetAppFlowPolicyLBVServerBinding
function Invoke-NSGetAppFlowPolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to appflowpolicy.
    .PARAMETER Name
        Name of the policy about which to display detailed information.
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
        Invoke-NSGetAppFlowPolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLBVServerBinding -Name 'appflowpolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicy_lbvserver_binding'
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
# endregion Invoke-NSGetAppFlowPolicyLBVServerBinding

# region Invoke-NSGetAppFlowPolicyVPNVServerBinding
function Invoke-NSGetAppFlowPolicyVPNVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler appflowpolicy_vpnvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to appflowpolicy.
    .PARAMETER Name
        Name of the policy about which to display detailed information.
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
        Invoke-NSGetAppFlowPolicyVPNVServerBinding
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyVPNVServerBinding -Name 'appflowpolicy_vpnvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAppFlowPolicyVPNVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'appflowpolicy_vpnvserver_binding'
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
# endregion Invoke-NSGetAppFlowPolicyVPNVServerBinding

# region Invoke-NSRenameAppFlowAction
function Invoke-NSRenameAppFlowAction {
    <#
    .SYNOPSIS
        Renames a NetScaler appflowaction resource.
    .DESCRIPTION
        Configuration for AppFlow action resource.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
    .PARAMETER NewName
        New name for the AppFlow action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameAppFlowAction -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameAppFlowAction -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename appflowaction')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowaction -Action rename -Payload @{ appflowaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAppFlowAction -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameAppFlowAction

# region Invoke-NSRenameAppFlowCollector
function Invoke-NSRenameAppFlowCollector {
    <#
    .SYNOPSIS
        Renames a NetScaler appflowcollector resource.
    .DESCRIPTION
        Configuration for AppFlow collector resource.
    .PARAMETER Name
        Name for the collector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Only four collectors can be configured. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow collector" or 'my appflow collector'). Minimum length = 1 Maximum length = 127
    .PARAMETER NewName
        New name for the collector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at(@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow coll" or 'my appflow coll'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameAppFlowCollector -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameAppFlowCollector -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename appflowcollector')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowcollector -Action rename -Payload @{ appflowcollector = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAppFlowCollector -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameAppFlowCollector

# region Invoke-NSRenameAppFlowPolicy
function Invoke-NSRenameAppFlowPolicy {
    <#
    .SYNOPSIS
        Renames a NetScaler appflowpolicy resource.
    .DESCRIPTION
        Configuration for AppFlow policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policy" or 'my appflow policy').
    .PARAMETER NewName
        New name for the policy. Must begin with an ASCII alphabetic or underscore (_)character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policy" or 'my appflow policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameAppFlowPolicy -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameAppFlowPolicy -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename appflowpolicy')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowpolicy -Action rename -Payload @{ appflowpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAppFlowPolicy -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameAppFlowPolicy

# region Invoke-NSRenameAppFlowPolicyLabel
function Invoke-NSRenameAppFlowPolicyLabel {
    <#
    .SYNOPSIS
        Renames a NetScaler appflowpolicylabel resource.
    .DESCRIPTION
        Configuration for AppFlow policy label resource.
    .PARAMETER LabelName
        Name of the AppFlow policy label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policylabel" or 'my appflow policylabel'). Minimum length = 1
    .PARAMETER NewName
        New name for the policy label. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policylabel" or 'my appflow policylabel'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameAppFlowPolicyLabel -LabelName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameAppFlowPolicyLabel -LabelName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Rename appflowpolicylabel')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowpolicylabel -Action rename -Payload @{ appflowpolicylabel = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAppFlowPolicyLabel -LabelName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameAppFlowPolicyLabel

# region Invoke-NSUnsetAppFlowAction
function Invoke-NSUnsetAppFlowAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler appflowaction resource properties.
    .DESCRIPTION
        Configuration for AppFlow action resource.
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
    .PARAMETER BotInsight
        On enabling this option, the Citrix ADC will send the bot insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ciinsight
        On enabling this option, the Citrix ADC will send the ContentInspection Insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ClientsIdemeasurements
        On enabling this option, the Citrix ADC will collect the time required to load and render the mainpage on the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Collectors
        Name(s) of collector(s) to be associated with the AppFlow action. Minimum length = 1
    .PARAMETER Comment
        Any comments about this action. In the CLI, if including spaces between words, enclose the comment in quotation marks. (The quotation marks are not required in the configuration utility.). Maximum length = 256
    .PARAMETER Distributionalgorithm
        On enabling this option, the Citrix ADC will distribute records among the collectors. Else, all records will be sent to all the collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PageTracking
        On enabling this option, the Citrix ADC will start tracking the page for waterfall chart by inserting a NS_ESNS cookie in the response. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Securityinsight
        On enabling this option, the Citrix ADC will send the security insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER VideoAnalytics
        On enabling this option, the Citrix ADC will send the videoinsight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER WebInsight
        On enabling this option, the Citrix ADC will send the webinsight records to the configured collectors. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetAppFlowAction -Name 'example' -BotInsight ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetAppFlowAction -Name 'example' -BotInsight ENABLED -WhatIf
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
        [switch] $BotInsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Ciinsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ClientsIdemeasurements,

        [Parameter()]
        [switch] $Collectors,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Distributionalgorithm,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $PageTracking,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Securityinsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $VideoAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $WebInsight,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('BotInsight')) { $body['botinsight'] = $true }
        if ($PSBoundParameters.ContainsKey('Ciinsight')) { $body['ciinsight'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientsIdemeasurements')) { $body['clientsidemeasurements'] = $true }
        if ($PSBoundParameters.ContainsKey('Collectors')) { $body['collectors'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('Distributionalgorithm')) { $body['distributionalgorithm'] = $true }
        if ($PSBoundParameters.ContainsKey('PageTracking')) { $body['pagetracking'] = $true }
        if ($PSBoundParameters.ContainsKey('Securityinsight')) { $body['securityinsight'] = $true }
        if ($PSBoundParameters.ContainsKey('VideoAnalytics')) { $body['videoanalytics'] = $true }
        if ($PSBoundParameters.ContainsKey('WebInsight')) { $body['webinsight'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear appflowaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowaction -Action unset -Payload @{ appflowaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAppFlowAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAppFlowAction

# region Invoke-NSUnsetAppFlowCollector
function Invoke-NSUnsetAppFlowCollector {
    <#
    .SYNOPSIS
        Clears one or more NetScaler appflowcollector resource properties.
    .DESCRIPTION
        Configuration for AppFlow collector resource.
    .PARAMETER Name
        Name for the collector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Only four collectors can be configured. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow collector" or 'my appflow collector'). Minimum length = 1 Maximum length = 127
    .PARAMETER Ipaddress
        IPv4 address of the collector.
    .PARAMETER NetProfile
        Netprofile to associate with the collector. The IP address defined in the profile is used as the source IP address for AppFlow traffic for this collector. If you do not set this parameter, the Citrix ADC IP (NSIP) address is used as the source IP address. Maximum length = 128
    .PARAMETER Port
        Port on which the collector listens.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetAppFlowCollector -Name 'example' -Ipaddress  -PassThru
    .EXAMPLE
        Invoke-NSUnsetAppFlowCollector -Name 'example' -Ipaddress  -WhatIf
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
        [switch] $Ipaddress,

        [Parameter()]
        [switch] $NetProfile,

        [Parameter()]
        [switch] $Port,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('Ipaddress')) { $body['ipaddress'] = $true }
        if ($PSBoundParameters.ContainsKey('NetProfile')) { $body['netprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear appflowcollector properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowcollector -Action unset -Payload @{ appflowcollector = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAppFlowCollector -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAppFlowCollector

# region Invoke-NSUnsetAppFlowParam
function Invoke-NSUnsetAppFlowParam {
    <#
    .SYNOPSIS
        Clears one or more NetScaler appflowparam resource properties.
    .DESCRIPTION
        Configuration for AppFlow parameter resource.
    .PARAMETER AAAUserName
        Enable AppFlow AAA Username logging. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER AnalyticsAuthtoken
        Authentication token to be set by the agent. Maximum length = 256
    .PARAMETER AppNameRefresh
        Interval, in seconds, at which to send Appnames to the configured collectors. Appname refers to the name of an entity (virtual server, service, or service group) in the Citrix ADC. Default value: 600 Minimum value = 60 Maximum value = 3600
    .PARAMETER AuditLogs
        Enable Auditlogs to be sent to the Telemetry Agent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cacheinsight
        Flag to determine whether cache records need to be exported or not. If this flag is true and IC is enabled, cache records are exported instead of L7 HTTP records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ClientTrafficonly
        Generate AppFlow records for only the traffic from the client. Default value: NO Possible values = YES, NO
    .PARAMETER ConnectionChaining
        Enable connection chaining so that the client server flows of a connection are linked. Also the connection chain ID is propagated across Citrix ADCs, so that in a multi-hop environment the flows belonging to the same logical connection are linked. This id is also logged as part of appflow record. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CqarePortIng
        TCP CQA reporting enable/disable knob. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Distributedtracing
        Enable generation of the distributed tracing templates in the Appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Disttracingsamplingrate
        Sampling rate for Distributed Tracing. Default value: 0 Minimum value = 0 Maximum value = 100
    .PARAMETER EmailAddress
        Enable AppFlow user email-id logging. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Events
        Enable Events to be sent to the Telemetry Agent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER FlowRecordInterval
        Interval, in seconds, at which to send flow records to the configured collectors. Default value: 60 Minimum value = 60 Maximum value = 3600
    .PARAMETER GxsessionrePortIng
        Enable this option for Gx session reporting. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPAuthorization
        Include the HTTP Authorization header information. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPContentType
        Include the HTTP Content-Type header sent from the server to the client to determine the type of the content sent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPCookie
        Include the cookie that was in the HTTP request the appliance received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPDomain
        Include the http domain request to be exported. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPHost
        Include the host identified in the HTTP request that the appliance received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPLocation
        Include the HTTP location headers returned from the HTTP responses. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPMethod
        Include the method that was specified in the HTTP request that the appliance received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPQuerywithURL
        Include the HTTP query segment along with the URL that the Citrix ADC received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPReferer
        Include the web page that was last visited by the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie
        Include the Set-cookie header sent from the server to the client in response to a HTTP request. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie2
        Include the Set-cookie header sent from the server to the client in response to a HTTP request. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPURL
        Include the http URL that the Citrix ADC received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPUserAgent
        Include the client application through which the HTTP request was received by the Citrix ADC. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPVia
        Include the httpVia header which contains the IP address of proxy server through which the client accessed the server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPXforwardedfor
        Include the httpXForwardedFor header, which contains the original IP Address of the client using a proxy server to access the server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER IdentifierName
        Include the stream identifier name to be exported. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER IdentifiersessionName
        Include the stream identifier session name to be exported. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogstreamovernSIP
        To use the Citrix ADC IP to send Logstream records instead of the SNIP. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Lsnlogging
        On enabling this option, the Citrix ADC will send the Large Scale Nat(LSN) records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Metrics
        Enable Citrix ADC Stats to be sent to the Telemetry Agent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Observationdomainid
        An observation domain groups a set of Citrix ADCs based on deployment: cluster, HA etc. A unique Observation Domain ID is required to be assigned to each such group. Default value: 0 Minimum value = 1000
    .PARAMETER ObservationdomainName
        Name of the Observation Domain defined by the observation domain ID. Maximum length = 127
    .PARAMETER Observationpointid
        An observation point ID is identifier for the NetScaler from which appflow records are being exported. By default, the NetScaler IP is the observation point ID. Minimum value = 1
    .PARAMETER SecurityinsightRecordInterval
        Interval, in seconds, at which to send security insight flow records to the configured collectors. Default value: 600 Minimum value = 60 Maximum value = 3600
    .PARAMETER Securityinsighttraffic
        Enable/disable the feature individually on appflow action. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SkipcacheRedirectIonHTTPTransAction
        Skip Cache http transaction. This HTTP transaction is specific to Cache Redirection module. In Case of Cache Miss there will be another HTTP transaction initiated by the cache server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberawareness
        Enable this option for logging end user MSISDN in L4/L7 appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberidobfuscation
        Enable this option for obfuscating MSISDN in L4/L7 appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberidobfuscationalgo
        Algorithm(MD5 or SHA256) to be used for obfuscating MSISDN. Default value: MD5 Possible values = MD5, SHA256
    .PARAMETER TCPAttackcounterInterval
        Interval, in seconds, at which to send tcp attack counters to the configured collectors. If 0 is configured, the record is not sent. Default value: 0 Minimum value = 0 Maximum value = 3600
    .PARAMETER Templaterefresh
        Refresh interval, in seconds, at which to export the template data. Because data transmission is in UDP, the templates must be resent at regular intervals. Default value: 600 Minimum value = 60 Maximum value = 3600
    .PARAMETER TimeseriesovernSIP
        To use the Citrix ADC IP to send Time series data such as metrics and events, instead of the SNIP. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER UDPPmtu
        MTU, in bytes, for IPFIX UDP packets. Default value: 1472 Minimum value = 128 Maximum value = 1472
    .PARAMETER URLCategory
        Include the URL category record. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER UsageRecordInterval
        On enabling this option, the NGS will send bandwidth usage record to configured collectors. Default value: 0 Minimum value = 0 Maximum value = 7200
    .PARAMETER Videoinsight
        Enable/disable the feature individually on appflow action. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER WebSaasappusagerePortIng
        On enabling this option, NGS will send data used by Web/saas app at the end of every HTTP transaction to configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetAppFlowParam -AAAUserName ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetAppFlowParam -AAAUserName ENABLED -WhatIf
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
        [switch] $AAAUserName,

        [Parameter()]
        [switch] $AnalyticsAuthtoken,

        [Parameter()]
        [switch] $AppNameRefresh,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AuditLogs,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Cacheinsight,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $ClientTrafficonly,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ConnectionChaining,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CqarePortIng,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Distributedtracing,

        [Parameter()]
        [switch] $Disttracingsamplingrate,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $EmailAddress,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Events,

        [Parameter()]
        [switch] $FlowRecordInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $GxsessionrePortIng,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPAuthorization,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPContentType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPDomain,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPHost,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPLocation,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPQuerywithURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPReferer,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPSEtCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPSEtCookie2,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPUserAgent,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPVia,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPXforwardedfor,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $IdentifierName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $IdentifiersessionName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $LogstreamovernSIP,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Lsnlogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Metrics,

        [Parameter()]
        [switch] $Observationdomainid,

        [Parameter()]
        [switch] $ObservationdomainName,

        [Parameter()]
        [switch] $Observationpointid,

        [Parameter()]
        [switch] $SecurityinsightRecordInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Securityinsighttraffic,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SkipcacheRedirectIonHTTPTransAction,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Subscriberawareness,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Subscriberidobfuscation,

        [Parameter()]
        [ValidateSet('MD5', 'SHA256')]
        [switch] $Subscriberidobfuscationalgo,

        [Parameter()]
        [switch] $TCPAttackcounterInterval,

        [Parameter()]
        [switch] $Templaterefresh,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $TimeseriesovernSIP,

        [Parameter()]
        [switch] $UDPPmtu,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $URLCategory,

        [Parameter()]
        [switch] $UsageRecordInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Videoinsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $WebSaasappusagerePortIng,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('AAAUserName')) { $body['aaausername'] = $true }
        if ($PSBoundParameters.ContainsKey('AnalyticsAuthtoken')) { $body['analyticsauthtoken'] = $true }
        if ($PSBoundParameters.ContainsKey('AppNameRefresh')) { $body['appnamerefresh'] = $true }
        if ($PSBoundParameters.ContainsKey('AuditLogs')) { $body['auditlogs'] = $true }
        if ($PSBoundParameters.ContainsKey('Cacheinsight')) { $body['cacheinsight'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientTrafficonly')) { $body['clienttrafficonly'] = $true }
        if ($PSBoundParameters.ContainsKey('ConnectionChaining')) { $body['connectionchaining'] = $true }
        if ($PSBoundParameters.ContainsKey('CqarePortIng')) { $body['cqareporting'] = $true }
        if ($PSBoundParameters.ContainsKey('Distributedtracing')) { $body['distributedtracing'] = $true }
        if ($PSBoundParameters.ContainsKey('Disttracingsamplingrate')) { $body['disttracingsamplingrate'] = $true }
        if ($PSBoundParameters.ContainsKey('EmailAddress')) { $body['emailaddress'] = $true }
        if ($PSBoundParameters.ContainsKey('Events')) { $body['events'] = $true }
        if ($PSBoundParameters.ContainsKey('FlowRecordInterval')) { $body['flowrecordinterval'] = $true }
        if ($PSBoundParameters.ContainsKey('GxsessionrePortIng')) { $body['gxsessionreporting'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPAuthorization')) { $body['httpauthorization'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPContentType')) { $body['httpcontenttype'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPCookie')) { $body['httpcookie'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPDomain')) { $body['httpdomain'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPHost')) { $body['httphost'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPLocation')) { $body['httplocation'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPMethod')) { $body['httpmethod'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPQuerywithURL')) { $body['httpquerywithurl'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPReferer')) { $body['httpreferer'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPSEtCookie')) { $body['httpsetcookie'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPSEtCookie2')) { $body['httpsetcookie2'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPURL')) { $body['httpurl'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPUserAgent')) { $body['httpuseragent'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPVia')) { $body['httpvia'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPXforwardedfor')) { $body['httpxforwardedfor'] = $true }
        if ($PSBoundParameters.ContainsKey('IdentifierName')) { $body['identifiername'] = $true }
        if ($PSBoundParameters.ContainsKey('IdentifiersessionName')) { $body['identifiersessionname'] = $true }
        if ($PSBoundParameters.ContainsKey('LogstreamovernSIP')) { $body['logstreamovernsip'] = $true }
        if ($PSBoundParameters.ContainsKey('Lsnlogging')) { $body['lsnlogging'] = $true }
        if ($PSBoundParameters.ContainsKey('Metrics')) { $body['metrics'] = $true }
        if ($PSBoundParameters.ContainsKey('Observationdomainid')) { $body['observationdomainid'] = $true }
        if ($PSBoundParameters.ContainsKey('ObservationdomainName')) { $body['observationdomainname'] = $true }
        if ($PSBoundParameters.ContainsKey('Observationpointid')) { $body['observationpointid'] = $true }
        if ($PSBoundParameters.ContainsKey('SecurityinsightRecordInterval')) { $body['securityinsightrecordinterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Securityinsighttraffic')) { $body['securityinsighttraffic'] = $true }
        if ($PSBoundParameters.ContainsKey('SkipcacheRedirectIonHTTPTransAction')) { $body['skipcacheredirectionhttptransaction'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscriberawareness')) { $body['subscriberawareness'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscriberidobfuscation')) { $body['subscriberidobfuscation'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscriberidobfuscationalgo')) { $body['subscriberidobfuscationalgo'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPAttackcounterInterval')) { $body['tcpattackcounterinterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Templaterefresh')) { $body['templaterefresh'] = $true }
        if ($PSBoundParameters.ContainsKey('TimeseriesovernSIP')) { $body['timeseriesovernsip'] = $true }
        if ($PSBoundParameters.ContainsKey('UDPPmtu')) { $body['udppmtu'] = $true }
        if ($PSBoundParameters.ContainsKey('URLCategory')) { $body['urlcategory'] = $true }
        if ($PSBoundParameters.ContainsKey('UsageRecordInterval')) { $body['usagerecordinterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Videoinsight')) { $body['videoinsight'] = $true }
        if ($PSBoundParameters.ContainsKey('WebSaasappusagerePortIng')) { $body['websaasappusagereporting'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('appflowparam', 'Clear appflowparam properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowparam -Action unset -Payload @{ appflowparam = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAppFlowParam

# region Invoke-NSUnsetAppFlowPolicy
function Invoke-NSUnsetAppFlowPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler appflowpolicy resource properties.
    .DESCRIPTION
        Configuration for AppFlow policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policy" or 'my appflow policy').
    .PARAMETER Comment
        Any comments about this policy.
    .PARAMETER UndefAction
        Name of the appflow action to be associated with this policy when an undef event occurs.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetAppFlowPolicy -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUnsetAppFlowPolicy -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('UndefAction')) { $body['undefaction'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear appflowpolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type appflowpolicy -Action unset -Payload @{ appflowpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAppFlowPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAppFlowPolicy

# region Invoke-NSUpdateAppFlowAction
function Invoke-NSUpdateAppFlowAction {
    <#
    .SYNOPSIS
        Updates a NetScaler appflowaction resource.
    .DESCRIPTION
        Configuration for AppFlow action resource.
    .PARAMETER BotInsight
        On enabling this option, the Citrix ADC will send the bot insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ciinsight
        On enabling this option, the Citrix ADC will send the ContentInspection Insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ClientsIdemeasurements
        On enabling this option, the Citrix ADC will collect the time required to load and render the mainpage on the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Collectors
        Name(s) of collector(s) to be associated with the AppFlow action. Minimum length = 1
    .PARAMETER Comment
        Any comments about this action. In the CLI, if including spaces between words, enclose the comment in quotation marks. (The quotation marks are not required in the configuration utility.). Maximum length = 256
    .PARAMETER Distributionalgorithm
        On enabling this option, the Citrix ADC will distribute records among the collectors. Else, all records will be sent to all the collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Name
        Name for the action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow action" or 'my appflow action').
    .PARAMETER PageTracking
        On enabling this option, the Citrix ADC will start tracking the page for waterfall chart by inserting a NS_ESNS cookie in the response. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Securityinsight
        On enabling this option, the Citrix ADC will send the security insight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER VideoAnalytics
        On enabling this option, the Citrix ADC will send the videoinsight records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER WebInsight
        On enabling this option, the Citrix ADC will send the webinsight records to the configured collectors. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateAppFlowAction -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAppFlowAction -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $BotInsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ciinsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ClientsIdemeasurements,

        [Parameter()]
        [string[]] $Collectors,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Distributionalgorithm,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PageTracking,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Securityinsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $VideoAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $WebInsight,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('BotInsight')) { $properties['botinsight'] = $BotInsight }
    if ($PSBoundParameters.ContainsKey('Ciinsight')) { $properties['ciinsight'] = $Ciinsight }
    if ($PSBoundParameters.ContainsKey('ClientsIdemeasurements')) { $properties['clientsidemeasurements'] = $ClientsIdemeasurements }
    if ($PSBoundParameters.ContainsKey('Collectors')) { $properties['collectors'] = $Collectors }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Distributionalgorithm')) { $properties['distributionalgorithm'] = $Distributionalgorithm }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PageTracking')) { $properties['pagetracking'] = $PageTracking }
    if ($PSBoundParameters.ContainsKey('Securityinsight')) { $properties['securityinsight'] = $Securityinsight }
    if ($PSBoundParameters.ContainsKey('VideoAnalytics')) { $properties['videoanalytics'] = $VideoAnalytics }
    if ($PSBoundParameters.ContainsKey('WebInsight')) { $properties['webinsight'] = $WebInsight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update appflowaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type appflowaction -Payload @{ appflowaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAppFlowAction

# region Invoke-NSUpdateAppFlowCollector
function Invoke-NSUpdateAppFlowCollector {
    <#
    .SYNOPSIS
        Updates a NetScaler appflowcollector resource.
    .DESCRIPTION
        Configuration for AppFlow collector resource.
    .PARAMETER Ipaddress
        IPv4 address of the collector.
    .PARAMETER Name
        Name for the collector. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Only four collectors can be configured. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow collector" or 'my appflow collector'). Minimum length = 1 Maximum length = 127
    .PARAMETER NetProfile
        Netprofile to associate with the collector. The IP address defined in the profile is used as the source IP address for AppFlow traffic for this collector. If you do not set this parameter, the Citrix ADC IP (NSIP) address is used as the source IP address. Maximum length = 128
    .PARAMETER Port
        Port on which the collector listens.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateAppFlowCollector -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAppFlowCollector -Name 'example' -WhatIf
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
        [string] $Ipaddress,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update appflowcollector')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type appflowcollector -Payload @{ appflowcollector = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowCollector -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAppFlowCollector

# region Invoke-NSUpdateAppFlowParam
function Invoke-NSUpdateAppFlowParam {
    <#
    .SYNOPSIS
        Updates a NetScaler appflowparam resource.
    .DESCRIPTION
        Configuration for AppFlow parameter resource.
    .PARAMETER AAAUserName
        Enable AppFlow AAA Username logging. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER AnalyticsAuthtoken
        Authentication token to be set by the agent. Maximum length = 256
    .PARAMETER AppNameRefresh
        Interval, in seconds, at which to send Appnames to the configured collectors. Appname refers to the name of an entity (virtual server, service, or service group) in the Citrix ADC. Default value: 600 Minimum value = 60 Maximum value = 3600
    .PARAMETER AuditLogs
        Enable Auditlogs to be sent to the Telemetry Agent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Cacheinsight
        Flag to determine whether cache records need to be exported or not. If this flag is true and IC is enabled, cache records are exported instead of L7 HTTP records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER ClientTrafficonly
        Generate AppFlow records for only the traffic from the client. Default value: NO Possible values = YES, NO
    .PARAMETER ConnectionChaining
        Enable connection chaining so that the client server flows of a connection are linked. Also the connection chain ID is propagated across Citrix ADCs, so that in a multi-hop environment the flows belonging to the same logical connection are linked. This id is also logged as part of appflow record. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CqarePortIng
        TCP CQA reporting enable/disable knob. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Distributedtracing
        Enable generation of the distributed tracing templates in the Appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Disttracingsamplingrate
        Sampling rate for Distributed Tracing. Default value: 0 Minimum value = 0 Maximum value = 100
    .PARAMETER EmailAddress
        Enable AppFlow user email-id logging. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Events
        Enable Events to be sent to the Telemetry Agent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER FlowRecordInterval
        Interval, in seconds, at which to send flow records to the configured collectors. Default value: 60 Minimum value = 60 Maximum value = 3600
    .PARAMETER GxsessionrePortIng
        Enable this option for Gx session reporting. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPAuthorization
        Include the HTTP Authorization header information. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPContentType
        Include the HTTP Content-Type header sent from the server to the client to determine the type of the content sent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPCookie
        Include the cookie that was in the HTTP request the appliance received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPDomain
        Include the http domain request to be exported. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPHost
        Include the host identified in the HTTP request that the appliance received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPLocation
        Include the HTTP location headers returned from the HTTP responses. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPMethod
        Include the method that was specified in the HTTP request that the appliance received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPQuerywithURL
        Include the HTTP query segment along with the URL that the Citrix ADC received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPReferer
        Include the web page that was last visited by the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie
        Include the Set-cookie header sent from the server to the client in response to a HTTP request. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie2
        Include the Set-cookie header sent from the server to the client in response to a HTTP request. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPURL
        Include the http URL that the Citrix ADC received from the client. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPUserAgent
        Include the client application through which the HTTP request was received by the Citrix ADC. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPVia
        Include the httpVia header which contains the IP address of proxy server through which the client accessed the server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPXforwardedfor
        Include the httpXForwardedFor header, which contains the original IP Address of the client using a proxy server to access the server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER IdentifierName
        Include the stream identifier name to be exported. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER IdentifiersessionName
        Include the stream identifier session name to be exported. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogstreamovernSIP
        To use the Citrix ADC IP to send Logstream records instead of the SNIP. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Lsnlogging
        On enabling this option, the Citrix ADC will send the Large Scale Nat(LSN) records to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Metrics
        Enable Citrix ADC Stats to be sent to the Telemetry Agent. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Observationdomainid
        An observation domain groups a set of Citrix ADCs based on deployment: cluster, HA etc. A unique Observation Domain ID is required to be assigned to each such group. Default value: 0 Minimum value = 1000
    .PARAMETER ObservationdomainName
        Name of the Observation Domain defined by the observation domain ID. Maximum length = 127
    .PARAMETER Observationpointid
        An observation point ID is identifier for the NetScaler from which appflow records are being exported. By default, the NetScaler IP is the observation point ID. Minimum value = 1
    .PARAMETER SecurityinsightRecordInterval
        Interval, in seconds, at which to send security insight flow records to the configured collectors. Default value: 600 Minimum value = 60 Maximum value = 3600
    .PARAMETER Securityinsighttraffic
        Enable/disable the feature individually on appflow action. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SkipcacheRedirectIonHTTPTransAction
        Skip Cache http transaction. This HTTP transaction is specific to Cache Redirection module. In Case of Cache Miss there will be another HTTP transaction initiated by the cache server. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberawareness
        Enable this option for logging end user MSISDN in L4/L7 appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberidobfuscation
        Enable this option for obfuscating MSISDN in L4/L7 appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberidobfuscationalgo
        Algorithm(MD5 or SHA256) to be used for obfuscating MSISDN. Default value: MD5 Possible values = MD5, SHA256
    .PARAMETER TCPAttackcounterInterval
        Interval, in seconds, at which to send tcp attack counters to the configured collectors. If 0 is configured, the record is not sent. Default value: 0 Minimum value = 0 Maximum value = 3600
    .PARAMETER Templaterefresh
        Refresh interval, in seconds, at which to export the template data. Because data transmission is in UDP, the templates must be resent at regular intervals. Default value: 600 Minimum value = 60 Maximum value = 3600
    .PARAMETER TimeseriesovernSIP
        To use the Citrix ADC IP to send Time series data such as metrics and events, instead of the SNIP. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER UDPPmtu
        MTU, in bytes, for IPFIX UDP packets. Default value: 1472 Minimum value = 128 Maximum value = 1472
    .PARAMETER URLCategory
        Include the URL category record. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER UsageRecordInterval
        On enabling this option, the NGS will send bandwidth usage record to configured collectors. Default value: 0 Minimum value = 0 Maximum value = 7200
    .PARAMETER Videoinsight
        Enable/disable the feature individually on appflow action. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER WebSaasappusagerePortIng
        On enabling this option, NGS will send data used by Web/saas app at the end of every HTTP transaction to configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateAppFlowParam  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAppFlowParam  -WhatIf
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
        [string] $AAAUserName,

        [Parameter()]
        [string] $AnalyticsAuthtoken,

        [Parameter()]
        [int] $AppNameRefresh,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AuditLogs,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Cacheinsight,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $ClientTrafficonly,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ConnectionChaining,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CqarePortIng,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Distributedtracing,

        [Parameter()]
        [int] $Disttracingsamplingrate,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $EmailAddress,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Events,

        [Parameter()]
        [int] $FlowRecordInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $GxsessionrePortIng,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPAuthorization,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPContentType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPDomain,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPHost,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPLocation,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPQuerywithURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPReferer,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPSEtCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPSEtCookie2,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPUserAgent,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPVia,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPXforwardedfor,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $IdentifierName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $IdentifiersessionName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LogstreamovernSIP,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Lsnlogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Metrics,

        [Parameter()]
        [int] $Observationdomainid,

        [Parameter()]
        [string] $ObservationdomainName,

        [Parameter()]
        [int] $Observationpointid,

        [Parameter()]
        [int] $SecurityinsightRecordInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Securityinsighttraffic,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SkipcacheRedirectIonHTTPTransAction,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberawareness,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberidobfuscation,

        [Parameter()]
        [ValidateSet('MD5', 'SHA256')]
        [string] $Subscriberidobfuscationalgo,

        [Parameter()]
        [int] $TCPAttackcounterInterval,

        [Parameter()]
        [int] $Templaterefresh,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $TimeseriesovernSIP,

        [Parameter()]
        [int] $UDPPmtu,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLCategory,

        [Parameter()]
        [int] $UsageRecordInterval,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Videoinsight,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $WebSaasappusagerePortIng,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('AAAUserName')) { $properties['aaausername'] = $AAAUserName }
    if ($PSBoundParameters.ContainsKey('AnalyticsAuthtoken')) { $properties['analyticsauthtoken'] = $AnalyticsAuthtoken }
    if ($PSBoundParameters.ContainsKey('AppNameRefresh')) { $properties['appnamerefresh'] = $AppNameRefresh }
    if ($PSBoundParameters.ContainsKey('AuditLogs')) { $properties['auditlogs'] = $AuditLogs }
    if ($PSBoundParameters.ContainsKey('Cacheinsight')) { $properties['cacheinsight'] = $Cacheinsight }
    if ($PSBoundParameters.ContainsKey('ClientTrafficonly')) { $properties['clienttrafficonly'] = $ClientTrafficonly }
    if ($PSBoundParameters.ContainsKey('ConnectionChaining')) { $properties['connectionchaining'] = $ConnectionChaining }
    if ($PSBoundParameters.ContainsKey('CqarePortIng')) { $properties['cqareporting'] = $CqarePortIng }
    if ($PSBoundParameters.ContainsKey('Distributedtracing')) { $properties['distributedtracing'] = $Distributedtracing }
    if ($PSBoundParameters.ContainsKey('Disttracingsamplingrate')) { $properties['disttracingsamplingrate'] = $Disttracingsamplingrate }
    if ($PSBoundParameters.ContainsKey('EmailAddress')) { $properties['emailaddress'] = $EmailAddress }
    if ($PSBoundParameters.ContainsKey('Events')) { $properties['events'] = $Events }
    if ($PSBoundParameters.ContainsKey('FlowRecordInterval')) { $properties['flowrecordinterval'] = $FlowRecordInterval }
    if ($PSBoundParameters.ContainsKey('GxsessionrePortIng')) { $properties['gxsessionreporting'] = $GxsessionrePortIng }
    if ($PSBoundParameters.ContainsKey('HTTPAuthorization')) { $properties['httpauthorization'] = $HTTPAuthorization }
    if ($PSBoundParameters.ContainsKey('HTTPContentType')) { $properties['httpcontenttype'] = $HTTPContentType }
    if ($PSBoundParameters.ContainsKey('HTTPCookie')) { $properties['httpcookie'] = $HTTPCookie }
    if ($PSBoundParameters.ContainsKey('HTTPDomain')) { $properties['httpdomain'] = $HTTPDomain }
    if ($PSBoundParameters.ContainsKey('HTTPHost')) { $properties['httphost'] = $HTTPHost }
    if ($PSBoundParameters.ContainsKey('HTTPLocation')) { $properties['httplocation'] = $HTTPLocation }
    if ($PSBoundParameters.ContainsKey('HTTPMethod')) { $properties['httpmethod'] = $HTTPMethod }
    if ($PSBoundParameters.ContainsKey('HTTPQuerywithURL')) { $properties['httpquerywithurl'] = $HTTPQuerywithURL }
    if ($PSBoundParameters.ContainsKey('HTTPReferer')) { $properties['httpreferer'] = $HTTPReferer }
    if ($PSBoundParameters.ContainsKey('HTTPSEtCookie')) { $properties['httpsetcookie'] = $HTTPSEtCookie }
    if ($PSBoundParameters.ContainsKey('HTTPSEtCookie2')) { $properties['httpsetcookie2'] = $HTTPSEtCookie2 }
    if ($PSBoundParameters.ContainsKey('HTTPURL')) { $properties['httpurl'] = $HTTPURL }
    if ($PSBoundParameters.ContainsKey('HTTPUserAgent')) { $properties['httpuseragent'] = $HTTPUserAgent }
    if ($PSBoundParameters.ContainsKey('HTTPVia')) { $properties['httpvia'] = $HTTPVia }
    if ($PSBoundParameters.ContainsKey('HTTPXforwardedfor')) { $properties['httpxforwardedfor'] = $HTTPXforwardedfor }
    if ($PSBoundParameters.ContainsKey('IdentifierName')) { $properties['identifiername'] = $IdentifierName }
    if ($PSBoundParameters.ContainsKey('IdentifiersessionName')) { $properties['identifiersessionname'] = $IdentifiersessionName }
    if ($PSBoundParameters.ContainsKey('LogstreamovernSIP')) { $properties['logstreamovernsip'] = $LogstreamovernSIP }
    if ($PSBoundParameters.ContainsKey('Lsnlogging')) { $properties['lsnlogging'] = $Lsnlogging }
    if ($PSBoundParameters.ContainsKey('Metrics')) { $properties['metrics'] = $Metrics }
    if ($PSBoundParameters.ContainsKey('Observationdomainid')) { $properties['observationdomainid'] = $Observationdomainid }
    if ($PSBoundParameters.ContainsKey('ObservationdomainName')) { $properties['observationdomainname'] = $ObservationdomainName }
    if ($PSBoundParameters.ContainsKey('Observationpointid')) { $properties['observationpointid'] = $Observationpointid }
    if ($PSBoundParameters.ContainsKey('SecurityinsightRecordInterval')) { $properties['securityinsightrecordinterval'] = $SecurityinsightRecordInterval }
    if ($PSBoundParameters.ContainsKey('Securityinsighttraffic')) { $properties['securityinsighttraffic'] = $Securityinsighttraffic }
    if ($PSBoundParameters.ContainsKey('SkipcacheRedirectIonHTTPTransAction')) { $properties['skipcacheredirectionhttptransaction'] = $SkipcacheRedirectIonHTTPTransAction }
    if ($PSBoundParameters.ContainsKey('Subscriberawareness')) { $properties['subscriberawareness'] = $Subscriberawareness }
    if ($PSBoundParameters.ContainsKey('Subscriberidobfuscation')) { $properties['subscriberidobfuscation'] = $Subscriberidobfuscation }
    if ($PSBoundParameters.ContainsKey('Subscriberidobfuscationalgo')) { $properties['subscriberidobfuscationalgo'] = $Subscriberidobfuscationalgo }
    if ($PSBoundParameters.ContainsKey('TCPAttackcounterInterval')) { $properties['tcpattackcounterinterval'] = $TCPAttackcounterInterval }
    if ($PSBoundParameters.ContainsKey('Templaterefresh')) { $properties['templaterefresh'] = $Templaterefresh }
    if ($PSBoundParameters.ContainsKey('TimeseriesovernSIP')) { $properties['timeseriesovernsip'] = $TimeseriesovernSIP }
    if ($PSBoundParameters.ContainsKey('UDPPmtu')) { $properties['udppmtu'] = $UDPPmtu }
    if ($PSBoundParameters.ContainsKey('URLCategory')) { $properties['urlcategory'] = $URLCategory }
    if ($PSBoundParameters.ContainsKey('UsageRecordInterval')) { $properties['usagerecordinterval'] = $UsageRecordInterval }
    if ($PSBoundParameters.ContainsKey('Videoinsight')) { $properties['videoinsight'] = $Videoinsight }
    if ($PSBoundParameters.ContainsKey('WebSaasappusagerePortIng')) { $properties['websaasappusagereporting'] = $WebSaasappusagerePortIng }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('appflowparam', 'Update appflowparam')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type appflowparam -Payload @{ appflowparam = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAppFlowParam

# region Invoke-NSUpdateAppFlowPolicy
function Invoke-NSUpdateAppFlowPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler appflowpolicy resource.
    .DESCRIPTION
        Configuration for AppFlow policy resource.
    .PARAMETER Action
        Name of the action to be associated with this policy.
    .PARAMETER Comment
        Any comments about this policy.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow policy" or 'my appflow policy').
    .PARAMETER Rule
        Expression or other value against which the traffic is evaluated. Must be a Boolean expression. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER UndefAction
        Name of the appflow action to be associated with this policy when an undef event occurs.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateAppFlowPolicy -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAppFlowPolicy -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $Comment,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update appflowpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type appflowpolicy -Payload @{ appflowpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAppFlowPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAppFlowPolicy

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAoEJWaXWeJUDTC
# 92ex2JFUQo3gTMMHHQcdU1+IS6CKNKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgzfPl
# ajUug8oGYVYTj+HPym8pdPt5tUSM3x/iVDtumuQwDQYJKoZIhvcNAQEBBQAEggGA
# begUc5lVbGEpfzcqkhx4SLUm6RWA5NKpe9Pp9nziYK0gCEm/H5AAx3gVvXp2vmFg
# +XJc2XZ1AS4X9wGGZXmatsH4oc8ksPa7RWHZXawlX7JjDcV4p+7eliJ7sC+4NZh0
# 7JmVL3/17hXPigPsT9FWTuXFRO9ok1wfjCnFmngYlUBbeVZh9zkR0eTmJ6VbOKtR
# 3IWlTzniUFStV1s2fND3f6ii8fezyDrVFtBxc9odPhEoDQ4tVusXexj1PjW7I105
# UqqG7h9KWX07Rv07HW6kbtevB1Jku+cBF0L9jx/+dlHQrlgn9yaHIeHN2yAVQpF7
# AIgLDeTpDhqKwLrje/BjYtaPsWDcVFKoMpY+T/0N/qdhgVa9jzufMgfyW4K9cDks
# Ne062eNR0vyz8ANVCEHVyTzooVFE9Fk1fHBi9Lomldne7fgLspwBanqEk7Hc9D29
# CVT1oJERLi0aI2r0Y7LACxS6xRhLkgnETSB//+TPQYgIDAKNaJ98o3RlheLz0iG3
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEINsS1RTj6+TXPFsonBJz
# ebrHq/mWqqvzJkI/fRNO+OiBAgZq7cEb7ucYEzIwMjYxMTEwMTAyMTU0LjAxOVow
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
# IgQgbGzcUZ6qRIFaNyHRprpczd8Grd9UxvvBvFxR/2aBoVowgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCAvMQNVXZ0b0xxlGw8X/3IEybObuT6a5W1d61CW+cGD
# 7zB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzAiBCD24jAOeXv9DTZCuIWf
# lyXBcS1oHMZZkw0MN8R/nw1gZDANBgkqhkiG9w0BAQsFAASCAgB8jliIh9+I0vWc
# 8vSesPWp05r0teFM5FkJpMrwh13mlgUcd2Y904Jpe0RKpXnbzvG1bK3jfs1yR08P
# Hdy+FdZO9YvIXtqa3U0jVS9z2wPwcEU1OwPjVLdmNHqgrsYz2nMiUyyTbMc2PbVm
# Zc5hyYU8UzWvCOGqGP028buba7cgz8oVRVQD6zBQ6jnbGdm4wlpUj1L+7zUVJb8z
# RL2Crf3d/W8I2SOvwtP4KFu5bCiRv06ds82dp+gjXu2QfzzUH82mL2EUQO7XiTmB
# n0mucItfwcMxTrzt72MBsUZy7dwn6n+jbtwmeUqzv8lWzaz3KciCgZPyoSpcJ8NZ
# Ve3IA6ROaRtZjwyKyPdZo3gcoklKERWNuPkRPQpEIO8Y7HHvWLYed0aN7B5RXBhx
# W1XOdO+5KOb5ufuY/8hLhv/piNg6D7K4erK7nm5vrSQfJQkhsPsbIOOaJA9EjD+p
# hLNQ3YfVZacXYUC/DuZq+2l9LmT9HNKeK/Q22xmyczrKsSG4fAe0sMaRG77J4PQ5
# 0/NmBRCcKQwJOGU/ZSA8uLKwkisdxhHyZiAQOLfn0CLRWs+gfhxHJ6hzeVCKY1qS
# daU0TWTDQBa9QCO0JC2t2uyagnTDc6YyhHULnEhZGSbYB86utoqf0JnwLFbhtW+q
# bI7fDTXGpPMZjwX8qaAGns10AjVKNw==
# SIG # End signature block
