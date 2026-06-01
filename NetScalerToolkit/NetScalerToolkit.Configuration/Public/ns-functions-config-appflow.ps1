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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAucBtLpsIMeOYW
# /d1hDcZccK/CFlhvSyAu12razHRwJKCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCDHRYY+nXmvV9wajRemh9IJsfsepwjL56nMT+er0TEc
# 9jANBgkqhkiG9w0BAQEFAASCAYAB/OHreU145YVXMl+Ks/i1TZRpINSpvCH586xY
# HlFCsp/l6Yt+4ZH5d9WhBCOl4dq5CFLY/hqPqq4h9zou9ND1RBgbayGF1/N7lGE1
# C/QYxxf7BKdoyZoMobn2rvIANz/5Bq0Oi4SK83y+Zwa8uiKIE0Tmtu3pVViNRdDe
# GFmrERfUydipN4V/qiRs81mpZR7O5MN6+21u6ehOYbSAyNiRukFvJ3NEh/g9bE8k
# o8yAioDXJGfJqDjjeZGDJYGQKQBFY9B8Yw5f5J6skGJnpBcQTz/IaFvGNVEZ2Ehc
# RsxExBgXVurO8xnhPVEEhzGObmRHBDH1Djksjuwm7RaRBGdeh9XlUGwL8fAYJkFQ
# hxCf6Fd+72aPp0cBZo+WW+XXrpJ1E1/uiy7o2hJQcF1SDw/lSPNCKao7ObUz+RlX
# ijA0YvvM56Wynggr78W9Xb6YvHXv8SFzsFyKPLNW/xzj1pn8rFU60FYBNNgbGitC
# lS5gsJ7ZAC6CIbUf5SZnrTPkO4ahggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU0MDhaMD8GCSqGSIb3
# DQEJBDEyBDAkFPrY+Of4OGzgqGnZ1zwsSzgSHu3hBQiCrJexTwWiWHT4m/RzAce7
# Uts2VcG6jYkwDQYJKoZIhvcNAQEBBQAEggIAgoEtaotrpY9tfvCW3U3QdXLmF8d7
# Y7uenlPwqrEb/idhZXWFnmv0Go25e6OAiK/iiDmCtNf1EzApRZUhkGvkYgxSP6XH
# 4TUWXpoQenUN0NacOlSdR+h7qNsB4PqXR/7I9NCCup1tOilvmK5CIV5RVlpiISi+
# ZBq/njElCU3QDbDgqD9LX2+I2nLbTKzlLtrsZcwiY26ijH4teTjfrQ7Q5l0ulpgH
# tM+paFwkgmnxv62Hifovi8LE+s7EQzMvt5ihEo24KSjFmdpX2TDbbJ6VZlBkDRl8
# kXHnOVd9zH9F2wMnD+DMEAe2CZsDbj49Q9skQeGjSl/OACEfN9Drh/cJ9o+igj6U
# EyjMjZqg6KVAtIxQhabYjvfTlBzphWS2q86W/8QNN/p+NpmJJiUZ1q/tXRqQXMk8
# 5YE3kUZxLo9LHow2ZHKcRGgOI9MhnUySqxwZR6edEjb22dXOdevoovjg2VmhFDiK
# tfucAtc8crPdGTP63Pqhsaahcegz7twwmfIi8D0+jsmFh/5jNYvXxG7G1qeSTvAC
# hYr9qxkp+dqY9yAIvSixOWvOuAhfgGmO/6Zwsi1WNVKJMnZ1f2diQGibCjqZmhpQ
# CDqJiXgrMnfQ7JqbV+j8ehQeZqhmLPx0ciEM+iCADnd546sTgXgGmmHMjuQikwI4
# rM8YMtmoifYeYjY=
# SIG # End signature block
