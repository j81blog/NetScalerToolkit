# Generated NetScalerToolkit Configuration bundle for category 'aaa'.

# region Invoke-NSAddAAAGlobalAAAPreauthenticationPolicyBinding
function Invoke-NSAddAAAGlobalAAAPreauthenticationPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaaglobal_aaapreauthenticationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the aaapreauthenticationpolicy that can be bound to aaaglobal.
    .PARAMETER Policy
        Name of the policy to be unbound. Minimum length = 1
    .PARAMETER Priority
        Priority of the bound policy.
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
        Invoke-NSAddAAAGlobalAAAPreauthenticationPolicyBinding  -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGlobalAAAPreauthenticationPolicyBinding  -WhatIf
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
        [string] $Policy,

        [Parameter()]
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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaaglobal_aaapreauthenticationpolicy_binding', 'Create aaaglobal_aaapreauthenticationpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaaglobal_aaapreauthenticationpolicy_binding -Payload @{ aaaglobal_aaapreauthenticationpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddAAAGlobalAAAPreauthenticationPolicyBinding

# region Invoke-NSAddAAAGlobalAuthenticationNegotiateActionBinding
function Invoke-NSAddAAAGlobalAuthenticationNegotiateActionBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaaglobal_authenticationnegotiateaction_binding resource.
    .DESCRIPTION
        Binding object showing the authenticationnegotiateaction that can be bound to aaaglobal.
    .PARAMETER WindowsProfile
        Name of the negotiate profile to be bound. Minimum length = 1 Maximum length = 32
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
        Invoke-NSAddAAAGlobalAuthenticationNegotiateActionBinding  -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGlobalAuthenticationNegotiateActionBinding  -WhatIf
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
        [string] $WindowsProfile,

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
    if ($PSBoundParameters.ContainsKey('WindowsProfile')) { $properties['windowsprofile'] = $WindowsProfile }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaaglobal_authenticationnegotiateaction_binding', 'Create aaaglobal_authenticationnegotiateaction_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaaglobal_authenticationnegotiateaction_binding -Payload @{ aaaglobal_authenticationnegotiateaction_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddAAAGlobalAuthenticationNegotiateActionBinding

# region Invoke-NSAddAAAGroup
function Invoke-NSAddAAAGroup {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup resource.
    .DESCRIPTION
        Configuration for AAA group resource.
    .PARAMETER GroupName
        Name for the group. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the group is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa group" or 'my aaa group'). Minimum length = 1
    .PARAMETER Weight
        Weight of this group with respect to other configured aaa groups (lower the number higher the weight). Default value: 0 Minimum value = 0 Maximum value = 65535
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
        Invoke-NSAddAAAGroup -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroup -GroupName 'example' -WhatIf
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
        [string] $GroupName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Weight')) { $properties['weight'] = $Weight }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup -Payload @{ aaagroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroup -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroup

# region Invoke-NSAddAAAGroupAAAUserBinding
function Invoke-NSAddAAAGroupAAAUserBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_aaauser_binding resource.
    .DESCRIPTION
        Binding object showing the aaauser that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER UserName
        The user name.
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
        Invoke-NSAddAAAGroupAAAUserBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupAAAUserBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_aaauser_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_aaauser_binding -Payload @{ aaagroup_aaauser_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupAAAUserBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupAAAUserBinding

# region Invoke-NSAddAAAGroupAuditNSLogPolicyBinding
function Invoke-NSAddAAAGroupAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies is 64000. Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
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
        Invoke-NSAddAAAGroupAuditNSLogPolicyBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupAuditNSLogPolicyBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_auditnslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_auditnslogpolicy_binding -Payload @{ aaagroup_auditnslogpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupAuditNSLogPolicyBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupAuditNSLogPolicyBinding

# region Invoke-NSAddAAAGroupAuditSyslogPolicyBinding
function Invoke-NSAddAAAGroupAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Adds a NetScaler AAA group audit syslog policy binding.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies is 64000. Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
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
        Invoke-NSAddAAAGroupAuditSyslogPolicyBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupAuditSyslogPolicyBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_auditsyslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaagroup_auditsyslogpolicy_binding -Payload @{ aaagroup_auditsyslogpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupAuditSyslogPolicyBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupAuditSyslogPolicyBinding

# region Invoke-NSAddAAAGroupAuthorizationPolicyBinding
function Invoke-NSAddAAAGroupAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_authorizationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies is 64000. Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
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
        Invoke-NSAddAAAGroupAuthorizationPolicyBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupAuthorizationPolicyBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_authorizationpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_authorizationpolicy_binding -Payload @{ aaagroup_authorizationpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupAuthorizationPolicyBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupAuthorizationPolicyBinding

# region Invoke-NSAddAAAGroupIntranetIp6Binding
function Invoke-NSAddAAAGroupIntranetIp6Binding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_intranetip6_binding resource.
    .DESCRIPTION
        Binding object showing the intranetip6 that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER IntranetIp6
        The Intranet IP6(s) bound to the group.
    .PARAMETER Numaddr
        Numbers of ipv6 address bound starting with intranetip6.
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
        Invoke-NSAddAAAGroupIntranetIp6Binding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupIntranetIp6Binding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $IntranetIp6,

        [Parameter()]
        [int] $Numaddr,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('IntranetIp6')) { $properties['intranetip6'] = $IntranetIp6 }
    if ($PSBoundParameters.ContainsKey('Numaddr')) { $properties['numaddr'] = $Numaddr }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_intranetip6_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_intranetip6_binding -Payload @{ aaagroup_intranetip6_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupIntranetIp6Binding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupIntranetIp6Binding

# region Invoke-NSAddAAAGroupIntranetIPBinding
function Invoke-NSAddAAAGroupIntranetIPBinding {
    <#
    .SYNOPSIS
        Adds a NetScaler AAA group intranet IP binding.
    .DESCRIPTION
        Binding object showing the intranetip that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER IntranetIP
        The Intranet IP(s) bound to the group.
    .PARAMETER NetMask
        The netmask for the Intranet IP.
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
        Invoke-NSAddAAAGroupIntranetIPBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupIntranetIPBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $IntranetIP,

        [Parameter()]
        [string] $NetMask,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('IntranetIP')) { $properties['intranetip'] = $IntranetIP }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_intranetip_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaagroup_intranetip_binding -Payload @{ aaagroup_intranetip_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupIntranetIPBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupIntranetIPBinding

# region Invoke-NSAddAAAGroupTMSessionPolicyBinding
function Invoke-NSAddAAAGroupTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_tmsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies is 64000. Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
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
        Invoke-NSAddAAAGroupTMSessionPolicyBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupTMSessionPolicyBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_tmsessionpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_tmsessionpolicy_binding -Payload @{ aaagroup_tmsessionpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupTMSessionPolicyBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupTMSessionPolicyBinding

# region Invoke-NSAddAAAGroupVPNIntranetApplicationBinding
function Invoke-NSAddAAAGroupVPNIntranetApplicationBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_vpnintranetapplication_binding resource.
    .DESCRIPTION
        Binding object showing the vpnintranetapplication that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER IntranetApplication
        Bind the group to the specified intranet VPN application.
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
        Invoke-NSAddAAAGroupVPNIntranetApplicationBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupVPNIntranetApplicationBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $IntranetApplication,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('IntranetApplication')) { $properties['intranetapplication'] = $IntranetApplication }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_vpnintranetapplication_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_vpnintranetapplication_binding -Payload @{ aaagroup_vpnintranetapplication_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupVPNIntranetApplicationBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupVPNIntranetApplicationBinding

# region Invoke-NSAddAAAGroupVPNSecurePrivateAccessProfileBinding
function Invoke-NSAddAAAGroupVPNSecurePrivateAccessProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_vpnsecureprivateaccessprofile_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsecureprivateaccessprofile that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER SecureprivateaccessProfile
        Name of the Secure Private Access Profile bound to the group.
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
        Invoke-NSAddAAAGroupVPNSecurePrivateAccessProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupVPNSecurePrivateAccessProfileBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $SecureprivateaccessProfile,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('SecureprivateaccessProfile')) { $properties['secureprivateaccessprofile'] = $SecureprivateaccessProfile }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_vpnsecureprivateaccessprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_vpnsecureprivateaccessprofile_binding -Payload @{ aaagroup_vpnsecureprivateaccessprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupVPNSecurePrivateAccessProfileBinding

# region Invoke-NSAddAAAGroupVPNSessionPolicyBinding
function Invoke-NSAddAAAGroupVPNSessionPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_vpnsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsessionpolicy that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies is 64000. Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
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
        Invoke-NSAddAAAGroupVPNSessionPolicyBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupVPNSessionPolicyBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_vpnsessionpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_vpnsessionpolicy_binding -Payload @{ aaagroup_vpnsessionpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupVPNSessionPolicyBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupVPNSessionPolicyBinding

# region Invoke-NSAddAAAGroupVPNTrafficPolicyBinding
function Invoke-NSAddAAAGroupVPNTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_vpntrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpntrafficpolicy that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies is 64000. Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
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
        Invoke-NSAddAAAGroupVPNTrafficPolicyBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupVPNTrafficPolicyBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_vpntrafficpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_vpntrafficpolicy_binding -Payload @{ aaagroup_vpntrafficpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupVPNTrafficPolicyBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupVPNTrafficPolicyBinding

# region Invoke-NSAddAAAGroupVPNURLBinding
function Invoke-NSAddAAAGroupVPNURLBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_vpnurl_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurl that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER URLName
        The intranet url.
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
        Invoke-NSAddAAAGroupVPNURLBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupVPNURLBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $URLName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('URLName')) { $properties['urlname'] = $URLName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_vpnurl_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_vpnurl_binding -Payload @{ aaagroup_vpnurl_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupVPNURLBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupVPNURLBinding

# region Invoke-NSAddAAAGroupVPNURLPolicyBinding
function Invoke-NSAddAAAGroupVPNURLPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaagroup_vpnurlpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurlpolicy that can be bound to aaagroup.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies is 64000. Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
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
        Invoke-NSAddAAAGroupVPNURLPolicyBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAGroupVPNURLPolicyBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create aaagroup_vpnurlpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaagroup_vpnurlpolicy_binding -Payload @{ aaagroup_vpnurlpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAGroupVPNURLPolicyBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAGroupVPNURLPolicyBinding

# region Invoke-NSAddAAAKCDAccount
function Invoke-NSAddAAAKCDAccount {
    <#
    .SYNOPSIS
        Creates a NetScaler aaakcdaccount resource.
    .DESCRIPTION
        Configuration for Kerberos constrained delegation account resource.
    .PARAMETER CaCert
        CA Cert for UserCert or when doing PKINIT backchannel.
    .PARAMETER DelegatedUser
        Username that can perform kerberos constrained delegation.
    .PARAMETER Enterpriserealm
        Enterprise Realm of the user. This should be given only in certain KDC deployments where KDC expects Enterprise username instead of Principal Name.
    .PARAMETER KCDAccount
        The name of the KCD account. Minimum length = 1
    .PARAMETER KCDPassword
        Password for Delegated User.
    .PARAMETER KeyTab
        The path to the keytab file. If specified other parameters in this command need not be given.
    .PARAMETER Realmstr
        Kerberos Realm.
    .PARAMETER Saltexpression
        Salt expression used by Kerberos impersonation. When configured, this expression will be used for key derivation with AES-128 or AES-256 encryption types. For RC4 encryption, the salt is not used. If the salt expression is not set, the default behavior is to derive the salt value from the Kerberos principal.
    .PARAMETER ServiceSpn
        Service SPN. When specified, this will be used to fetch kerberos tickets. If not specified, Citrix ADC will construct SPN using service fqdn.
    .PARAMETER UserCert
        SSL Cert (including private key) for Delegated User.
    .PARAMETER UserRealm
        Realm of the user.
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
        Invoke-NSAddAAAKCDAccount -KCDAccount 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAKCDAccount -KCDAccount 'example' -WhatIf
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
        [string] $CaCert,

        [Parameter()]
        [string] $DelegatedUser,

        [Parameter()]
        [string] $Enterpriserealm,

        [Parameter(Mandatory, Position = 0)]
        [string] $KCDAccount,

        [Parameter()]
        [string] $KCDPassword,

        [Parameter()]
        [string] $KeyTab,

        [Parameter()]
        [string] $Realmstr,

        [Parameter()]
        [string] $Saltexpression,

        [Parameter()]
        [string] $ServiceSpn,

        [Parameter()]
        [string] $UserCert,

        [Parameter()]
        [string] $UserRealm,

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
    if ($PSBoundParameters.ContainsKey('CaCert')) { $properties['cacert'] = $CaCert }
    if ($PSBoundParameters.ContainsKey('DelegatedUser')) { $properties['delegateduser'] = $DelegatedUser }
    if ($PSBoundParameters.ContainsKey('Enterpriserealm')) { $properties['enterpriserealm'] = $Enterpriserealm }
    if ($PSBoundParameters.ContainsKey('KCDAccount')) { $properties['kcdaccount'] = $KCDAccount }
    if ($PSBoundParameters.ContainsKey('KCDPassword')) { $properties['kcdpassword'] = $KCDPassword }
    if ($PSBoundParameters.ContainsKey('KeyTab')) { $properties['keytab'] = $KeyTab }
    if ($PSBoundParameters.ContainsKey('Realmstr')) { $properties['realmstr'] = $Realmstr }
    if ($PSBoundParameters.ContainsKey('Saltexpression')) { $properties['saltexpression'] = $Saltexpression }
    if ($PSBoundParameters.ContainsKey('ServiceSpn')) { $properties['servicespn'] = $ServiceSpn }
    if ($PSBoundParameters.ContainsKey('UserCert')) { $properties['usercert'] = $UserCert }
    if ($PSBoundParameters.ContainsKey('UserRealm')) { $properties['userrealm'] = $UserRealm }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$KCDAccount", 'Create aaakcdaccount')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaakcdaccount -Payload @{ aaakcdaccount = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAKCDAccount -KCDAccount $KCDAccount -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAKCDAccount

# region Invoke-NSAddAAAPreauthenticationAction
function Invoke-NSAddAAAPreauthenticationAction {
    <#
    .SYNOPSIS
        Creates a NetScaler aaapreauthenticationaction resource.
    .DESCRIPTION
        Configuration for pre authentication action resource.
    .PARAMETER DefaultepaGroup
        This is the default group that is chosen when the EPA check succeeds. Maximum length = 64
    .PARAMETER DeleteFileS
        String specifying the path(s) and name(s) of the files to be deleted by the endpoint analysis (EPA) tool.
    .PARAMETER KillProcess
        String specifying the name of a process to be terminated by the endpoint analysis (EPA) tool.
    .PARAMETER Name
        Name for the preauthentication action. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after preauthentication action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa action" or 'my aaa action'). Minimum length = 1
    .PARAMETER PreauthenticationAction
        Allow or deny logon after endpoint analysis (EPA) results. Possible values = ALLOW, DENY
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
        Invoke-NSAddAAAPreauthenticationAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAPreauthenticationAction -Name 'example' -WhatIf
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
        [string] $DefaultepaGroup,

        [Parameter()]
        [string] $DeleteFileS,

        [Parameter()]
        [string] $KillProcess,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('ALLOW', 'DENY')]
        [string] $PreauthenticationAction,

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
    if ($PSBoundParameters.ContainsKey('DefaultepaGroup')) { $properties['defaultepagroup'] = $DefaultepaGroup }
    if ($PSBoundParameters.ContainsKey('DeleteFileS')) { $properties['deletefiles'] = $DeleteFileS }
    if ($PSBoundParameters.ContainsKey('KillProcess')) { $properties['killprocess'] = $KillProcess }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PreauthenticationAction')) { $properties['preauthenticationaction'] = $PreauthenticationAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create aaapreauthenticationaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaapreauthenticationaction -Payload @{ aaapreauthenticationaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAPreauthenticationAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAPreauthenticationAction

# region Invoke-NSAddAAAPreauthenticationPolicy
function Invoke-NSAddAAAPreauthenticationPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler aaapreauthenticationpolicy resource.
    .DESCRIPTION
        Configuration for pre authentication policy resource.
    .PARAMETER Name
        Name for the preauthentication policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the preauthentication policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER ReqAction
        Name of the action that the policy is to invoke when a connection matches the policy. Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, defining connections that match the policy.
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
        Invoke-NSAddAAAPreauthenticationPolicy -Name 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAPreauthenticationPolicy -Name 'example' -Rule 'example' -WhatIf
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
        [string] $ReqAction,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ReqAction')) { $properties['reqaction'] = $ReqAction }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create aaapreauthenticationpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaapreauthenticationpolicy -Payload @{ aaapreauthenticationpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAPreauthenticationPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAPreauthenticationPolicy

# region Invoke-NSAddAAASSOProfile
function Invoke-NSAddAAASSOProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler aaassoprofile resource.
    .DESCRIPTION
        Configuration for aaa sso profile resource.
    .PARAMETER Name
        Name for the SSO Profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a SSO Profile is created. The following requirement applies only to the NetScaler CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Password
        Password with which the user logs on. Required for Single sign on to external server. Minimum length = 1
    .PARAMETER UserName
        Name for the user. Must begin with a letter, number, or the underscore (_) character, and must contain only alphanumeric, hyphen (-), period (.), hash (#), space ( ), at (@), equal (=), colon (:), and underscore characters. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my group" or 'my group'). Minimum length = 1
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
        Invoke-NSAddAAASSOProfile -Name 'example' -Password 'example' -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAASSOProfile -Name 'example' -Password 'example' -UserName 'example' -WhatIf
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

        [Parameter(Mandatory)]
        [string] $Password,

        [Parameter(Mandatory)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Password')) { $properties['password'] = $Password }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create aaassoprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaassoprofile -Payload @{ aaassoprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAASSOProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAASSOProfile

# region Invoke-NSAddAAAUser
function Invoke-NSAddAAAUser {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser resource.
    .DESCRIPTION
        Configuration for AAA user resource.
    .PARAMETER Password
        Password with which the user logs on. Required for any user account that does not exist on an external authentication server. If you are not using an external authentication server, all user accounts must have a password. If you are using an external authentication server, you must provide a password for local user accounts that do not exist on the authentication server. Minimum length = 1
    .PARAMETER UserName
        Name for the user. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the user is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa user" or "my aaa user"). Minimum length = 1
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
        Invoke-NSAddAAAUser -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUser -UserName 'example' -WhatIf
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
        [string] $Password,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Password')) { $properties['password'] = $Password }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser -Payload @{ aaauser = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUser -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUser

# region Invoke-NSAddAAAUserAuditNSLogPolicyBinding
function Invoke-NSAddAAAUserAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies max priority is 64000. . Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserAuditNSLogPolicyBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserAuditNSLogPolicyBinding -UserName 'example' -WhatIf
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
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_auditnslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_auditnslogpolicy_binding -Payload @{ aaauser_auditnslogpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserAuditNSLogPolicyBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserAuditNSLogPolicyBinding

# region Invoke-NSAddAAAUserAuditSyslogPolicyBinding
function Invoke-NSAddAAAUserAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies max priority is 64000. . Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserAuditSyslogPolicyBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserAuditSyslogPolicyBinding -UserName 'example' -WhatIf
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
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_auditsyslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_auditsyslogpolicy_binding -Payload @{ aaauser_auditsyslogpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserAuditSyslogPolicyBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserAuditSyslogPolicyBinding

# region Invoke-NSAddAAAUserAuthorizationPolicyBinding
function Invoke-NSAddAAAUserAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_authorizationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies max priority is 64000. . Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserAuthorizationPolicyBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserAuthorizationPolicyBinding -UserName 'example' -WhatIf
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
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_authorizationpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_authorizationpolicy_binding -Payload @{ aaauser_authorizationpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserAuthorizationPolicyBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserAuthorizationPolicyBinding

# region Invoke-NSAddAAAUserIntranetIp6Binding
function Invoke-NSAddAAAUserIntranetIp6Binding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_intranetip6_binding resource.
    .DESCRIPTION
        Binding object showing the intranetip6 that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER IntranetIp6
        The Intranet IP6 bound to the user.
    .PARAMETER Numaddr
        Numbers of ipv6 address bound starting with intranetip6.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserIntranetIp6Binding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserIntranetIp6Binding -UserName 'example' -WhatIf
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
        [string] $IntranetIp6,

        [Parameter()]
        [int] $Numaddr,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('IntranetIp6')) { $properties['intranetip6'] = $IntranetIp6 }
    if ($PSBoundParameters.ContainsKey('Numaddr')) { $properties['numaddr'] = $Numaddr }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_intranetip6_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_intranetip6_binding -Payload @{ aaauser_intranetip6_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserIntranetIp6Binding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserIntranetIp6Binding

# region Invoke-NSAddAAAUserIntranetIPBinding
function Invoke-NSAddAAAUserIntranetIPBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_intranetip_binding resource.
    .DESCRIPTION
        Binding object showing the intranetip that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER IntranetIP
        The Intranet IP bound to the user.
    .PARAMETER NetMask
        The netmask for the Intranet IP.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserIntranetIPBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserIntranetIPBinding -UserName 'example' -WhatIf
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
        [string] $IntranetIP,

        [Parameter()]
        [string] $NetMask,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('IntranetIP')) { $properties['intranetip'] = $IntranetIP }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_intranetip_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_intranetip_binding -Payload @{ aaauser_intranetip_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserIntranetIPBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserIntranetIPBinding

# region Invoke-NSAddAAAUserTMSessionPolicyBinding
function Invoke-NSAddAAAUserTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_tmsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies max priority is 64000. . Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserTMSessionPolicyBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserTMSessionPolicyBinding -UserName 'example' -WhatIf
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
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_tmsessionpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_tmsessionpolicy_binding -Payload @{ aaauser_tmsessionpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserTMSessionPolicyBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserTMSessionPolicyBinding

# region Invoke-NSAddAAAUserVPNIntranetApplicationBinding
function Invoke-NSAddAAAUserVPNIntranetApplicationBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_vpnintranetapplication_binding resource.
    .DESCRIPTION
        Binding object showing the vpnintranetapplication that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER IntranetApplication
        Name of the intranet VPN application to which the policy applies.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserVPNIntranetApplicationBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserVPNIntranetApplicationBinding -UserName 'example' -WhatIf
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
        [string] $IntranetApplication,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('IntranetApplication')) { $properties['intranetapplication'] = $IntranetApplication }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_vpnintranetapplication_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_vpnintranetapplication_binding -Payload @{ aaauser_vpnintranetapplication_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserVPNIntranetApplicationBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserVPNIntranetApplicationBinding

# region Invoke-NSAddAAAUserVPNSecurePrivateAccessProfileBinding
function Invoke-NSAddAAAUserVPNSecurePrivateAccessProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_vpnsecureprivateaccessprofile_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsecureprivateaccessprofile that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER SecureprivateaccessProfile
        Name of the Secure Private Access Profile bound to the user.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserVPNSecurePrivateAccessProfileBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserVPNSecurePrivateAccessProfileBinding -UserName 'example' -WhatIf
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
        [string] $SecureprivateaccessProfile,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('SecureprivateaccessProfile')) { $properties['secureprivateaccessprofile'] = $SecureprivateaccessProfile }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_vpnsecureprivateaccessprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_vpnsecureprivateaccessprofile_binding -Payload @{ aaauser_vpnsecureprivateaccessprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserVPNSecurePrivateAccessProfileBinding

# region Invoke-NSAddAAAUserVPNSessionPolicyBinding
function Invoke-NSAddAAAUserVPNSessionPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_vpnsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsessionpolicy that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies max priority is 64000. . Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserVPNSessionPolicyBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserVPNSessionPolicyBinding -UserName 'example' -WhatIf
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
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_vpnsessionpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_vpnsessionpolicy_binding -Payload @{ aaauser_vpnsessionpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserVPNSessionPolicyBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserVPNSessionPolicyBinding

# region Invoke-NSAddAAAUserVPNTrafficPolicyBinding
function Invoke-NSAddAAAUserVPNTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_vpntrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpntrafficpolicy that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies max priority is 64000. . Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserVPNTrafficPolicyBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserVPNTrafficPolicyBinding -UserName 'example' -WhatIf
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
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_vpntrafficpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_vpntrafficpolicy_binding -Payload @{ aaauser_vpntrafficpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserVPNTrafficPolicyBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserVPNTrafficPolicyBinding

# region Invoke-NSAddAAAUserVPNURLBinding
function Invoke-NSAddAAAUserVPNURLBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_vpnurl_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurl that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER URLName
        The intranet url.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserVPNURLBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserVPNURLBinding -UserName 'example' -WhatIf
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
        [string] $URLName,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('URLName')) { $properties['urlname'] = $URLName }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_vpnurl_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_vpnurl_binding -Payload @{ aaauser_vpnurl_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserVPNURLBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserVPNURLBinding

# region Invoke-NSAddAAAUserVPNURLPolicyBinding
function Invoke-NSAddAAAUserVPNURLPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler aaauser_vpnurlpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurlpolicy that can be bound to aaauser.
    .PARAMETER GotoPriorityExpression
        Expression or other value specifying the next policy to evaluate if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * USE_INVOCATION_RESULT - Applicable if this policy invokes another policy label. If the final goto in the invoked policy label has a value of END, the evaluation stops. If the final goto is anything other than END, the current policy label performs a NEXT. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a number that is larger than the largest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Priority
        Integer specifying the priority of the policy. A lower number indicates a higher priority. Policies are evaluated in the order of their priority numbers. Maximum value for default syntax policies is 2147483647 and for classic policies max priority is 64000. . Minimum value = 0 Maximum value = 2147483647
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSAddAAAUserVPNURLPolicyBinding -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAAAUserVPNURLPolicyBinding -UserName 'example' -WhatIf
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
        [string] $Policy,

        [Parameter()]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Policy')) { $properties['policy'] = $Policy }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Create aaauser_vpnurlpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser_vpnurlpolicy_binding -Payload @{ aaauser_vpnurlpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUserVPNURLPolicyBinding -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAAAUserVPNURLPolicyBinding

# region Invoke-NSCheckAAAKCDAccount
function Invoke-NSCheckAAAKCDAccount {
    <#
    .SYNOPSIS
        Invokes the check operation for a NetScaler aaakcdaccount resource.
    .DESCRIPTION
        Configuration for Kerberos constrained delegation account resource.
    .PARAMETER DelegatedUser
        Username that can perform kerberos constrained delegation.
    .PARAMETER KCDPassword
        Password for Delegated User.
    .PARAMETER Realmstr
        Kerberos Realm.
    .PARAMETER Saltexpression
        Salt expression used by Kerberos impersonation. When configured, this expression will be used for key derivation with AES-128 or AES-256 encryption types. For RC4 encryption, the salt is not used. If the salt expression is not set, the default behavior is to derive the salt value from the Kerberos principal.
    .PARAMETER ServiceSpn
        Service SPN. When specified, this will be used to fetch kerberos tickets. If not specified, Citrix ADC will construct SPN using service fqdn.
    .PARAMETER UserRealm
        Realm of the user.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSCheckAAAKCDAccount -DelegatedUser 'example' -KCDPassword 'example' -Realmstr 'example' -ServiceSpn 'example'
    .EXAMPLE
        Invoke-NSCheckAAAKCDAccount -DelegatedUser 'example' -KCDPassword 'example' -Realmstr 'example' -ServiceSpn 'example' -WhatIf
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
        [string] $DelegatedUser,

        [Parameter(Mandatory)]
        [string] $KCDPassword,

        [Parameter(Mandatory)]
        [string] $Realmstr,

        [Parameter()]
        [string] $Saltexpression,

        [Parameter(Mandatory)]
        [string] $ServiceSpn,

        [Parameter()]
        [string] $UserRealm,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

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
        if ($PSBoundParameters.ContainsKey('DelegatedUser')) { $body['delegateduser'] = $DelegatedUser }
        if ($PSBoundParameters.ContainsKey('KCDPassword')) { $body['kcdpassword'] = $KCDPassword }
        if ($PSBoundParameters.ContainsKey('Realmstr')) { $body['realmstr'] = $Realmstr }
        if ($PSBoundParameters.ContainsKey('Saltexpression')) { $body['saltexpression'] = $Saltexpression }
        if ($PSBoundParameters.ContainsKey('ServiceSpn')) { $body['servicespn'] = $ServiceSpn }
        if ($PSBoundParameters.ContainsKey('UserRealm')) { $body['userrealm'] = $UserRealm }

        if ($PSCmdlet.ShouldProcess('aaakcdaccount', 'Check aaakcdaccount')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaakcdaccount -Action check -Payload @{ aaakcdaccount = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSCheckAAAKCDAccount

# region Invoke-NSDeleteAAAGlobalAAAPreauthenticationPolicyBinding
function Invoke-NSDeleteAAAGlobalAAAPreauthenticationPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaaglobal_aaapreauthenticationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the aaapreauthenticationpolicy that can be bound to aaaglobal.
    .PARAMETER Policy
        Name of the policy to be unbound. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGlobalAAAPreauthenticationPolicyBinding -Policy 'policy_example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGlobalAAAPreauthenticationPolicyBinding  | Invoke-NSDeleteAAAGlobalAAAPreauthenticationPolicyBinding -Confirm:$false
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
        [string] $Policy,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('aaaglobal_aaapreauthenticationpolicy_binding', 'Delete aaaglobal_aaapreauthenticationpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaaglobal_aaapreauthenticationpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGlobalAAAPreauthenticationPolicyBinding

# region Invoke-NSDeleteAAAGlobalAuthenticationNegotiateActionBinding
function Invoke-NSDeleteAAAGlobalAuthenticationNegotiateActionBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaaglobal_authenticationnegotiateaction_binding resource.
    .DESCRIPTION
        Binding object showing the authenticationnegotiateaction that can be bound to aaaglobal.
    .PARAMETER WindowsProfile
        Name of the negotiate profile to be bound. Minimum length = 1 Maximum length = 32
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGlobalAuthenticationNegotiateActionBinding -WindowsProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGlobalAuthenticationNegotiateActionBinding  | Invoke-NSDeleteAAAGlobalAuthenticationNegotiateActionBinding -Confirm:$false
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
        [string] $WindowsProfile,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('WindowsProfile')) {
            $argumentParts += 'windowsprofile:' + $WindowsProfile
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('aaaglobal_authenticationnegotiateaction_binding', 'Delete aaaglobal_authenticationnegotiateaction_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaaglobal_authenticationnegotiateaction_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGlobalAuthenticationNegotiateActionBinding

# region Invoke-NSDeleteAAAGroup
function Invoke-NSDeleteAAAGroup {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup resource.
    .DESCRIPTION
        Configuration for AAA group resource.
    .PARAMETER GroupName
        Name for the group. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the group is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa group" or 'my aaa group'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroup -GroupName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroup -GroupName 'aaagroup_example' | Invoke-NSDeleteAAAGroup -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup -Resource $GroupName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroup

# region Invoke-NSDeleteAAAGroupAAAUserBinding
function Invoke-NSDeleteAAAGroupAAAUserBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_aaauser_binding resource.
    .DESCRIPTION
        Binding object showing the aaauser that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER UserName
        The user name.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupAAAUserBinding -GroupName 'example' -UserName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupAAAUserBinding -GroupName 'aaagroup_aaauser_binding_example' | Invoke-NSDeleteAAAGroupAAAUserBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $UserName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('UserName')) {
            $argumentParts += 'username:' + $UserName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_aaauser_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_aaauser_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupAAAUserBinding

# region Invoke-NSDeleteAAAGroupAuditNSLogPolicyBinding
function Invoke-NSDeleteAAAGroupAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupAuditNSLogPolicyBinding -GroupName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupAuditNSLogPolicyBinding -GroupName 'aaagroup_auditnslogpolicy_binding_example' | Invoke-NSDeleteAAAGroupAuditNSLogPolicyBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_auditnslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_auditnslogpolicy_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupAuditNSLogPolicyBinding

# region Invoke-NSDeleteAAAGroupAuditSyslogPolicyBinding
function Invoke-NSDeleteAAAGroupAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler AAA group audit syslog policy binding.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupAuditSyslogPolicyBinding -GroupName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupAuditSyslogPolicyBinding -GroupName 'aaagroup_auditsyslogpolicy_binding_example' | Invoke-NSDeleteAAAGroupAuditSyslogPolicyBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter(Mandatory)]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_auditsyslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_auditsyslogpolicy_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupAuditSyslogPolicyBinding

# region Invoke-NSDeleteAAAGroupAuthorizationPolicyBinding
function Invoke-NSDeleteAAAGroupAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_authorizationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupAuthorizationPolicyBinding -GroupName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupAuthorizationPolicyBinding -GroupName 'aaagroup_authorizationpolicy_binding_example' | Invoke-NSDeleteAAAGroupAuthorizationPolicyBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_authorizationpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_authorizationpolicy_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupAuthorizationPolicyBinding

# region Invoke-NSDeleteAAAGroupIntranetIp6Binding
function Invoke-NSDeleteAAAGroupIntranetIp6Binding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_intranetip6_binding resource.
    .DESCRIPTION
        Binding object showing the intranetip6 that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER IntranetIp6
        The Intranet IP6(s) bound to the group.
    .PARAMETER Numaddr
        Numbers of ipv6 address bound starting with intranetip6.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupIntranetIp6Binding -GroupName 'example' -IntranetIp6 'example' -Numaddr 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupIntranetIp6Binding -GroupName 'aaagroup_intranetip6_binding_example' | Invoke-NSDeleteAAAGroupIntranetIp6Binding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $IntranetIp6,

        [Parameter()]
        [int] $Numaddr,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('IntranetIp6')) {
            $argumentParts += 'intranetip6:' + $IntranetIp6
        }
        if ($PSBoundParameters.ContainsKey('Numaddr')) {
            $argumentParts += 'numaddr:' + $Numaddr
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_intranetip6_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_intranetip6_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupIntranetIp6Binding

# region Invoke-NSDeleteAAAGroupIntranetIPBinding
function Invoke-NSDeleteAAAGroupIntranetIPBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler AAA group intranet IP binding.
    .DESCRIPTION
        Binding object showing the intranetip that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER IntranetIP
        The Intranet IP(s) bound to the group.
    .PARAMETER NetMask
        The netmask for the Intranet IP.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupIntranetIPBinding -GroupName 'example' -IntranetIP '192.0.2.10' -NetMask '255.255.255.255' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupIntranetIPBinding -GroupName 'aaagroup_intranetip_binding_example' | Invoke-NSDeleteAAAGroupIntranetIPBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter(Mandatory)]
        [string] $IntranetIP,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('IntranetIP')) {
            $argumentParts += 'intranetip:' + $IntranetIP
        }
        if ($PSBoundParameters.ContainsKey('NetMask')) {
            $argumentParts += 'netmask:' + $NetMask
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_intranetip_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_intranetip_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupIntranetIPBinding

# region Invoke-NSDeleteAAAGroupTMSessionPolicyBinding
function Invoke-NSDeleteAAAGroupTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_tmsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupTMSessionPolicyBinding -GroupName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupTMSessionPolicyBinding -GroupName 'aaagroup_tmsessionpolicy_binding_example' | Invoke-NSDeleteAAAGroupTMSessionPolicyBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_tmsessionpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_tmsessionpolicy_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupTMSessionPolicyBinding

# region Invoke-NSDeleteAAAGroupVPNIntranetApplicationBinding
function Invoke-NSDeleteAAAGroupVPNIntranetApplicationBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_vpnintranetapplication_binding resource.
    .DESCRIPTION
        Binding object showing the vpnintranetapplication that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER IntranetApplication
        Bind the group to the specified intranet VPN application.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupVPNIntranetApplicationBinding -GroupName 'example' -IntranetApplication 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNIntranetApplicationBinding -GroupName 'aaagroup_vpnintranetapplication_binding_example' | Invoke-NSDeleteAAAGroupVPNIntranetApplicationBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $IntranetApplication,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('IntranetApplication')) {
            $argumentParts += 'intranetapplication:' + $IntranetApplication
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_vpnintranetapplication_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_vpnintranetapplication_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupVPNIntranetApplicationBinding

# region Invoke-NSDeleteAAAGroupVPNSecurePrivateAccessProfileBinding
function Invoke-NSDeleteAAAGroupVPNSecurePrivateAccessProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_vpnsecureprivateaccessprofile_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsecureprivateaccessprofile that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER SecureprivateaccessProfile
        Name of the Secure Private Access Profile bound to the group.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupVPNSecurePrivateAccessProfileBinding -GroupName 'example' -SecureprivateaccessProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding -GroupName 'aaagroup_vpnsecureprivateaccessprofile_binding_example' | Invoke-NSDeleteAAAGroupVPNSecurePrivateAccessProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $SecureprivateaccessProfile,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('SecureprivateaccessProfile')) {
            $argumentParts += 'secureprivateaccessprofile:' + $SecureprivateaccessProfile
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_vpnsecureprivateaccessprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_vpnsecureprivateaccessprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupVPNSecurePrivateAccessProfileBinding

# region Invoke-NSDeleteAAAGroupVPNSessionPolicyBinding
function Invoke-NSDeleteAAAGroupVPNSessionPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_vpnsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsessionpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupVPNSessionPolicyBinding -GroupName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNSessionPolicyBinding -GroupName 'aaagroup_vpnsessionpolicy_binding_example' | Invoke-NSDeleteAAAGroupVPNSessionPolicyBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_vpnsessionpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_vpnsessionpolicy_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupVPNSessionPolicyBinding

# region Invoke-NSDeleteAAAGroupVPNTrafficPolicyBinding
function Invoke-NSDeleteAAAGroupVPNTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_vpntrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpntrafficpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupVPNTrafficPolicyBinding -GroupName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNTrafficPolicyBinding -GroupName 'aaagroup_vpntrafficpolicy_binding_example' | Invoke-NSDeleteAAAGroupVPNTrafficPolicyBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_vpntrafficpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_vpntrafficpolicy_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupVPNTrafficPolicyBinding

# region Invoke-NSDeleteAAAGroupVPNURLBinding
function Invoke-NSDeleteAAAGroupVPNURLBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_vpnurl_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurl that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER URLName
        The intranet url.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupVPNURLBinding -GroupName 'example' -URLName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNURLBinding -GroupName 'aaagroup_vpnurl_binding_example' | Invoke-NSDeleteAAAGroupVPNURLBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $URLName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('URLName')) {
            $argumentParts += 'urlname:' + $URLName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_vpnurl_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_vpnurl_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupVPNURLBinding

# region Invoke-NSDeleteAAAGroupVPNURLPolicyBinding
function Invoke-NSDeleteAAAGroupVPNURLPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaagroup_vpnurlpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurlpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
    .PARAMETER Policy
        The policy name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAGroupVPNURLPolicyBinding -GroupName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNURLPolicyBinding -GroupName 'aaagroup_vpnurlpolicy_binding_example' | Invoke-NSDeleteAAAGroupVPNURLPolicyBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete aaagroup_vpnurlpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaagroup_vpnurlpolicy_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAGroupVPNURLPolicyBinding

# region Invoke-NSDeleteAAAKCDAccount
function Invoke-NSDeleteAAAKCDAccount {
    <#
    .SYNOPSIS
        Removes a NetScaler aaakcdaccount resource.
    .DESCRIPTION
        Configuration for Kerberos constrained delegation account resource.
    .PARAMETER KCDAccount
        The name of the KCD account. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAKCDAccount -KCDAccount 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAKCDAccount -KCDAccount 'aaakcdaccount_example' | Invoke-NSDeleteAAAKCDAccount -Confirm:$false
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
        [string] $KCDAccount,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$KCDAccount", 'Delete aaakcdaccount')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaakcdaccount -Resource $KCDAccount -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAKCDAccount

# region Invoke-NSDeleteAAAPreauthenticationAction
function Invoke-NSDeleteAAAPreauthenticationAction {
    <#
    .SYNOPSIS
        Removes a NetScaler aaapreauthenticationaction resource.
    .DESCRIPTION
        Configuration for pre authentication action resource.
    .PARAMETER Name
        Name for the preauthentication action. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after preauthentication action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa action" or 'my aaa action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAPreauthenticationAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationAction -Name 'aaapreauthenticationaction_example' | Invoke-NSDeleteAAAPreauthenticationAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete aaapreauthenticationaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaapreauthenticationaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAPreauthenticationAction

# region Invoke-NSDeleteAAAPreauthenticationPolicy
function Invoke-NSDeleteAAAPreauthenticationPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler aaapreauthenticationpolicy resource.
    .DESCRIPTION
        Configuration for pre authentication policy resource.
    .PARAMETER Name
        Name for the preauthentication policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the preauthentication policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAPreauthenticationPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicy -Name 'aaapreauthenticationpolicy_example' | Invoke-NSDeleteAAAPreauthenticationPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete aaapreauthenticationpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaapreauthenticationpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAPreauthenticationPolicy

# region Invoke-NSDeleteAAASSOProfile
function Invoke-NSDeleteAAASSOProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler aaassoprofile resource.
    .DESCRIPTION
        Configuration for aaa sso profile resource.
    .PARAMETER Name
        Name for the SSO Profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a SSO Profile is created. The following requirement applies only to the NetScaler CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAASSOProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAASSOProfile -Name 'aaassoprofile_example' | Invoke-NSDeleteAAASSOProfile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete aaassoprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaassoprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAASSOProfile

# region Invoke-NSDeleteAAAUser
function Invoke-NSDeleteAAAUser {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser resource.
    .DESCRIPTION
        Configuration for AAA user resource.
    .PARAMETER UserName
        Name for the user. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the user is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa user" or "my aaa user"). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUser -UserName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUser -UserName 'aaauser_example' | Invoke-NSDeleteAAAUser -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser -Resource $UserName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUser

# region Invoke-NSDeleteAAAUserAuditNSLogPolicyBinding
function Invoke-NSDeleteAAAUserAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserAuditNSLogPolicyBinding -UserName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserAuditNSLogPolicyBinding -UserName 'aaauser_auditnslogpolicy_binding_example' | Invoke-NSDeleteAAAUserAuditNSLogPolicyBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_auditnslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_auditnslogpolicy_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserAuditNSLogPolicyBinding

# region Invoke-NSDeleteAAAUserAuditSyslogPolicyBinding
function Invoke-NSDeleteAAAUserAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserAuditSyslogPolicyBinding -UserName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserAuditSyslogPolicyBinding -UserName 'aaauser_auditsyslogpolicy_binding_example' | Invoke-NSDeleteAAAUserAuditSyslogPolicyBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_auditsyslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_auditsyslogpolicy_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserAuditSyslogPolicyBinding

# region Invoke-NSDeleteAAAUserAuthorizationPolicyBinding
function Invoke-NSDeleteAAAUserAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_authorizationpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserAuthorizationPolicyBinding -UserName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserAuthorizationPolicyBinding -UserName 'aaauser_authorizationpolicy_binding_example' | Invoke-NSDeleteAAAUserAuthorizationPolicyBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_authorizationpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_authorizationpolicy_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserAuthorizationPolicyBinding

# region Invoke-NSDeleteAAAUserIntranetIp6Binding
function Invoke-NSDeleteAAAUserIntranetIp6Binding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_intranetip6_binding resource.
    .DESCRIPTION
        Binding object showing the intranetip6 that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER IntranetIp6
        The Intranet IP6 bound to the user.
    .PARAMETER Numaddr
        Numbers of ipv6 address bound starting with intranetip6.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserIntranetIp6Binding -UserName 'example' -IntranetIp6 'example' -Numaddr 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserIntranetIp6Binding -UserName 'aaauser_intranetip6_binding_example' | Invoke-NSDeleteAAAUserIntranetIp6Binding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $IntranetIp6,

        [Parameter()]
        [int] $Numaddr,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('IntranetIp6')) {
            $argumentParts += 'intranetip6:' + $IntranetIp6
        }
        if ($PSBoundParameters.ContainsKey('Numaddr')) {
            $argumentParts += 'numaddr:' + $Numaddr
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_intranetip6_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_intranetip6_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserIntranetIp6Binding

# region Invoke-NSDeleteAAAUserIntranetIPBinding
function Invoke-NSDeleteAAAUserIntranetIPBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_intranetip_binding resource.
    .DESCRIPTION
        Binding object showing the intranetip that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER IntranetIP
        The Intranet IP bound to the user.
    .PARAMETER NetMask
        The netmask for the Intranet IP.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserIntranetIPBinding -UserName 'example' -IntranetIP '192.0.2.10' -NetMask '255.255.255.255' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserIntranetIPBinding -UserName 'aaauser_intranetip_binding_example' | Invoke-NSDeleteAAAUserIntranetIPBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $IntranetIP,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('IntranetIP')) {
            $argumentParts += 'intranetip:' + $IntranetIP
        }
        if ($PSBoundParameters.ContainsKey('NetMask')) {
            $argumentParts += 'netmask:' + $NetMask
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_intranetip_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_intranetip_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserIntranetIPBinding

# region Invoke-NSDeleteAAAUserTMSessionPolicyBinding
function Invoke-NSDeleteAAAUserTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_tmsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserTMSessionPolicyBinding -UserName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserTMSessionPolicyBinding -UserName 'aaauser_tmsessionpolicy_binding_example' | Invoke-NSDeleteAAAUserTMSessionPolicyBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_tmsessionpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_tmsessionpolicy_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserTMSessionPolicyBinding

# region Invoke-NSDeleteAAAUserVPNIntranetApplicationBinding
function Invoke-NSDeleteAAAUserVPNIntranetApplicationBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_vpnintranetapplication_binding resource.
    .DESCRIPTION
        Binding object showing the vpnintranetapplication that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER IntranetApplication
        Name of the intranet VPN application to which the policy applies.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserVPNIntranetApplicationBinding -UserName 'example' -IntranetApplication 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserVPNIntranetApplicationBinding -UserName 'aaauser_vpnintranetapplication_binding_example' | Invoke-NSDeleteAAAUserVPNIntranetApplicationBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $IntranetApplication,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('IntranetApplication')) {
            $argumentParts += 'intranetapplication:' + $IntranetApplication
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_vpnintranetapplication_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_vpnintranetapplication_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserVPNIntranetApplicationBinding

# region Invoke-NSDeleteAAAUserVPNSecurePrivateAccessProfileBinding
function Invoke-NSDeleteAAAUserVPNSecurePrivateAccessProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_vpnsecureprivateaccessprofile_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsecureprivateaccessprofile that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER SecureprivateaccessProfile
        Name of the Secure Private Access Profile bound to the user.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserVPNSecurePrivateAccessProfileBinding -UserName 'example' -SecureprivateaccessProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding -UserName 'aaauser_vpnsecureprivateaccessprofile_binding_example' | Invoke-NSDeleteAAAUserVPNSecurePrivateAccessProfileBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $SecureprivateaccessProfile,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('SecureprivateaccessProfile')) {
            $argumentParts += 'secureprivateaccessprofile:' + $SecureprivateaccessProfile
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_vpnsecureprivateaccessprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_vpnsecureprivateaccessprofile_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserVPNSecurePrivateAccessProfileBinding

# region Invoke-NSDeleteAAAUserVPNSessionPolicyBinding
function Invoke-NSDeleteAAAUserVPNSessionPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_vpnsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnsessionpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserVPNSessionPolicyBinding -UserName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserVPNSessionPolicyBinding -UserName 'aaauser_vpnsessionpolicy_binding_example' | Invoke-NSDeleteAAAUserVPNSessionPolicyBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_vpnsessionpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_vpnsessionpolicy_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserVPNSessionPolicyBinding

# region Invoke-NSDeleteAAAUserVPNTrafficPolicyBinding
function Invoke-NSDeleteAAAUserVPNTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_vpntrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpntrafficpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserVPNTrafficPolicyBinding -UserName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserVPNTrafficPolicyBinding -UserName 'aaauser_vpntrafficpolicy_binding_example' | Invoke-NSDeleteAAAUserVPNTrafficPolicyBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_vpntrafficpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_vpntrafficpolicy_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserVPNTrafficPolicyBinding

# region Invoke-NSDeleteAAAUserVPNURLBinding
function Invoke-NSDeleteAAAUserVPNURLBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_vpnurl_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurl that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER URLName
        The intranet url.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserVPNURLBinding -UserName 'example' -URLName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserVPNURLBinding -UserName 'aaauser_vpnurl_binding_example' | Invoke-NSDeleteAAAUserVPNURLBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $URLName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('URLName')) {
            $argumentParts += 'urlname:' + $URLName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_vpnurl_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_vpnurl_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserVPNURLBinding

# region Invoke-NSDeleteAAAUserVPNURLPolicyBinding
function Invoke-NSDeleteAAAUserVPNURLPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler aaauser_vpnurlpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the vpnurlpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
    .PARAMETER Policy
        The policy Name.
    .PARAMETER Type
        Bindpoint to which the policy is bound. Default value: REQUEST Possible values = REQUEST, UDP_REQUEST, DNS_REQUEST, ICMP_REQUEST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAAAUserVPNURLPolicyBinding -UserName 'example' -Policy 'policy_example' -Type REQUEST -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAAAUserVPNURLPolicyBinding -UserName 'aaauser_vpnurlpolicy_binding_example' | Invoke-NSDeleteAAAUserVPNURLPolicyBinding -Confirm:$false
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
        [string] $UserName,

        [Parameter()]
        [string] $Policy,

        [Parameter()]
        [ValidateSet('REQUEST', 'UDP_REQUEST', 'DNS_REQUEST', 'ICMP_REQUEST')]
        [string] $Type,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Policy')) {
            $argumentParts += 'policy:' + $Policy
        }
        if ($PSBoundParameters.ContainsKey('Type')) {
            $argumentParts += 'type:' + $Type
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$UserName", 'Delete aaauser_vpnurlpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type aaauser_vpnurlpolicy_binding -Resource $UserName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAAAUserVPNURLPolicyBinding

# region Invoke-NSGetAAACertParams
function Invoke-NSGetAAACertParams {
    <#
    .SYNOPSIS
        Gets NetScaler aaacertparams configuration.
    .DESCRIPTION
        Configuration for certificate parameter resource.
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
        Invoke-NSGetAAACertParams
    .EXAMPLE
        Invoke-NSGetAAACertParams -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaacertparams'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAACertParams

# region Invoke-NSGetAAAGlobalAAAPreauthenticationPolicyBinding
function Invoke-NSGetAAAGlobalAAAPreauthenticationPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaaglobal_aaapreauthenticationpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the aaapreauthenticationpolicy that can be bound to aaaglobal.
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
        Invoke-NSGetAAAGlobalAAAPreauthenticationPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGlobalAAAPreauthenticationPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaaglobal_aaapreauthenticationpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGlobalAAAPreauthenticationPolicyBinding

# region Invoke-NSGetAAAGlobalAuthenticationNegotiateActionBinding
function Invoke-NSGetAAAGlobalAuthenticationNegotiateActionBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaaglobal_authenticationnegotiateaction_binding configuration.
    .DESCRIPTION
        Binding object showing the authenticationnegotiateaction that can be bound to aaaglobal.
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
        Invoke-NSGetAAAGlobalAuthenticationNegotiateActionBinding
    .EXAMPLE
        Invoke-NSGetAAAGlobalAuthenticationNegotiateActionBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaaglobal_authenticationnegotiateaction_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGlobalAuthenticationNegotiateActionBinding

# region Invoke-NSGetAAAGlobalBinding
function Invoke-NSGetAAAGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaaglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to aaaglobal.
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
        Invoke-NSGetAAAGlobalBinding
    .EXAMPLE
        Invoke-NSGetAAAGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaaglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGlobalBinding

# region Invoke-NSGetAAAGroup
function Invoke-NSGetAAAGroup {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup configuration.
    .DESCRIPTION
        Configuration for AAA group resource.
    .PARAMETER GroupName
        Name for the group. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the group is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa group" or 'my aaa group'). Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Loggedin
        Display only the group members who are currently logged in. If there are large number of sessions, this command may provide partial details.
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
        Invoke-NSGetAAAGroup
    .EXAMPLE
        Invoke-NSGetAAAGroup -GroupName 'aaagroup_example'
    .EXAMPLE
        Invoke-NSGetAAAGroup -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [switch] $Loggedin,

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
        if ($PSBoundParameters.ContainsKey('Loggedin')) {
            $argumentValue = $Loggedin
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'loggedin:' + $argumentValue
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
            Type = 'aaagroup'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroup

# region Invoke-NSGetAAAGroupAAAUserBinding
function Invoke-NSGetAAAGroupAAAUserBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_aaauser_binding configuration.
    .DESCRIPTION
        Binding object showing the aaauser that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupAAAUserBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupAAAUserBinding -GroupName 'aaagroup_aaauser_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupAAAUserBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_aaauser_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupAAAUserBinding

# region Invoke-NSGetAAAGroupAuditNSLogPolicyBinding
function Invoke-NSGetAAAGroupAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_auditnslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupAuditNSLogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupAuditNSLogPolicyBinding -GroupName 'aaagroup_auditnslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupAuditNSLogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_auditnslogpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupAuditNSLogPolicyBinding

# region Invoke-NSGetAAAGroupAuditSyslogPolicyBinding
function Invoke-NSGetAAAGroupAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler AAA group audit syslog policy bindings.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupAuditSyslogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupAuditSyslogPolicyBinding -GroupName 'aaagroup_auditsyslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupAuditSyslogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_auditsyslogpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupAuditSyslogPolicyBinding

# region Invoke-NSGetAAAGroupAuthorizationPolicyBinding
function Invoke-NSGetAAAGroupAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_authorizationpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupAuthorizationPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupAuthorizationPolicyBinding -GroupName 'aaagroup_authorizationpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupAuthorizationPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_authorizationpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupAuthorizationPolicyBinding

# region Invoke-NSGetAAAGroupBinding
function Invoke-NSGetAAAGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to aaagroup.
    .PARAMETER GroupName
        Name of the group. Minimum length = 1
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
        Invoke-NSGetAAAGroupBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupBinding -GroupName 'aaagroup_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupBinding

# region Invoke-NSGetAAAGroupIntranetIp6Binding
function Invoke-NSGetAAAGroupIntranetIp6Binding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_intranetip6_binding configuration.
    .DESCRIPTION
        Binding object showing the intranetip6 that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupIntranetIp6Binding
    .EXAMPLE
        Invoke-NSGetAAAGroupIntranetIp6Binding -GroupName 'aaagroup_intranetip6_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupIntranetIp6Binding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_intranetip6_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupIntranetIp6Binding

# region Invoke-NSGetAAAGroupIntranetIPBinding
function Invoke-NSGetAAAGroupIntranetIPBinding {
    <#
    .SYNOPSIS
        Gets NetScaler AAA group intranet IP bindings.
    .DESCRIPTION
        Binding object showing the intranetip that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupIntranetIPBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupIntranetIPBinding -GroupName 'aaagroup_intranetip_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupIntranetIPBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_intranetip_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupIntranetIPBinding

# region Invoke-NSGetAAAGroupTMSessionPolicyBinding
function Invoke-NSGetAAAGroupTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_tmsessionpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupTMSessionPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupTMSessionPolicyBinding -GroupName 'aaagroup_tmsessionpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupTMSessionPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_tmsessionpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupTMSessionPolicyBinding

# region Invoke-NSGetAAAGroupVPNIntranetApplicationBinding
function Invoke-NSGetAAAGroupVPNIntranetApplicationBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_vpnintranetapplication_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnintranetapplication that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupVPNIntranetApplicationBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNIntranetApplicationBinding -GroupName 'aaagroup_vpnintranetapplication_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNIntranetApplicationBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_vpnintranetapplication_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupVPNIntranetApplicationBinding

# region Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding
function Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_vpnsecureprivateaccessprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnsecureprivateaccessprofile that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding -GroupName 'aaagroup_vpnsecureprivateaccessprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_vpnsecureprivateaccessprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupVPNSecurePrivateAccessProfileBinding

# region Invoke-NSGetAAAGroupVPNSessionPolicyBinding
function Invoke-NSGetAAAGroupVPNSessionPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_vpnsessionpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnsessionpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupVPNSessionPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNSessionPolicyBinding -GroupName 'aaagroup_vpnsessionpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNSessionPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_vpnsessionpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupVPNSessionPolicyBinding

# region Invoke-NSGetAAAGroupVPNTrafficPolicyBinding
function Invoke-NSGetAAAGroupVPNTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_vpntrafficpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the vpntrafficpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupVPNTrafficPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNTrafficPolicyBinding -GroupName 'aaagroup_vpntrafficpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNTrafficPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_vpntrafficpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupVPNTrafficPolicyBinding

# region Invoke-NSGetAAAGroupVPNURLBinding
function Invoke-NSGetAAAGroupVPNURLBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_vpnurl_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnurl that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupVPNURLBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNURLBinding -GroupName 'aaagroup_vpnurl_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNURLBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_vpnurl_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupVPNURLBinding

# region Invoke-NSGetAAAGroupVPNURLPolicyBinding
function Invoke-NSGetAAAGroupVPNURLPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaagroup_vpnurlpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnurlpolicy that can be bound to aaagroup.
    .PARAMETER GroupName
        Name of the group that you are binding. Minimum length = 1
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
        Invoke-NSGetAAAGroupVPNURLPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNURLPolicyBinding -GroupName 'aaagroup_vpnurlpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAGroupVPNURLPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'aaagroup_vpnurlpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAGroupVPNURLPolicyBinding

# region Invoke-NSGetAAAKCDAccount
function Invoke-NSGetAAAKCDAccount {
    <#
    .SYNOPSIS
        Gets NetScaler aaakcdaccount configuration.
    .DESCRIPTION
        Configuration for Kerberos constrained delegation account resource.
    .PARAMETER KCDAccount
        The name of the KCD account. Minimum length = 1
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
        Invoke-NSGetAAAKCDAccount
    .EXAMPLE
        Invoke-NSGetAAAKCDAccount -KCDAccount 'aaakcdaccount_example'
    .EXAMPLE
        Invoke-NSGetAAAKCDAccount -Filter @{ servicetype = 'HTTP' }
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
        [string] $KCDAccount,

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
            Type = 'aaakcdaccount'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $KCDAccount
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAKCDAccount

# region Invoke-NSGetAAALDAPParams
function Invoke-NSGetAAALDAPParams {
    <#
    .SYNOPSIS
        Gets NetScaler aaaldapparams configuration.
    .DESCRIPTION
        Configuration for LDAP parameter resource.
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
        Invoke-NSGetAAALDAPParams
    .EXAMPLE
        Invoke-NSGetAAALDAPParams -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaaldapparams'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAALDAPParams

# region Invoke-NSGetAAAOtpparameter
function Invoke-NSGetAAAOtpparameter {
    <#
    .SYNOPSIS
        Gets NetScaler aaaotpparameter configuration.
    .DESCRIPTION
        Configuration for AAA otpparameter resource.
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
        Invoke-NSGetAAAOtpparameter
    .EXAMPLE
        Invoke-NSGetAAAOtpparameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaaotpparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAOtpparameter

# region Invoke-NSGetAAAParameter
function Invoke-NSGetAAAParameter {
    <#
    .SYNOPSIS
        Gets NetScaler aaaparameter configuration.
    .DESCRIPTION
        Configuration for AAA parameter resource.
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
        Invoke-NSGetAAAParameter
    .EXAMPLE
        Invoke-NSGetAAAParameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaaparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAParameter

# region Invoke-NSGetAAAPreauthenticationAction
function Invoke-NSGetAAAPreauthenticationAction {
    <#
    .SYNOPSIS
        Gets NetScaler aaapreauthenticationaction configuration.
    .DESCRIPTION
        Configuration for pre authentication action resource.
    .PARAMETER Name
        Name for the preauthentication action. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after preauthentication action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa action" or 'my aaa action'). Minimum length = 1
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
        Invoke-NSGetAAAPreauthenticationAction
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationAction -Name 'aaapreauthenticationaction_example'
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaapreauthenticationaction'
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
# endregion Invoke-NSGetAAAPreauthenticationAction

# region Invoke-NSGetAAAPreauthenticationParameter
function Invoke-NSGetAAAPreauthenticationParameter {
    <#
    .SYNOPSIS
        Gets NetScaler aaapreauthenticationparameter configuration.
    .DESCRIPTION
        Configuration for pre authentication parameter resource.
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
        Invoke-NSGetAAAPreauthenticationParameter
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationParameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaapreauthenticationparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAPreauthenticationParameter

# region Invoke-NSGetAAAPreauthenticationPolicy
function Invoke-NSGetAAAPreauthenticationPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler aaapreauthenticationpolicy configuration.
    .DESCRIPTION
        Configuration for pre authentication policy resource.
    .PARAMETER Name
        Name for the preauthentication policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the preauthentication policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
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
        Invoke-NSGetAAAPreauthenticationPolicy
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicy -Name 'aaapreauthenticationpolicy_example'
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaapreauthenticationpolicy'
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
# endregion Invoke-NSGetAAAPreauthenticationPolicy

# region Invoke-NSGetAAAPreauthenticationPolicyAAAGlobalBinding
function Invoke-NSGetAAAPreauthenticationPolicyAAAGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaapreauthenticationpolicy_aaaglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the aaaglobal that can be bound to aaapreauthenticationpolicy.
    .PARAMETER Name
        Name of the preauthentication policy whose properties you want to view. Minimum length = 1
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
        Invoke-NSGetAAAPreauthenticationPolicyAAAGlobalBinding
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicyAAAGlobalBinding -Name 'aaapreauthenticationpolicy_aaaglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicyAAAGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaapreauthenticationpolicy_aaaglobal_binding'
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
# endregion Invoke-NSGetAAAPreauthenticationPolicyAAAGlobalBinding

# region Invoke-NSGetAAAPreauthenticationPolicyBinding
function Invoke-NSGetAAAPreauthenticationPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaapreauthenticationpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to aaapreauthenticationpolicy.
    .PARAMETER Name
        Name of the preauthentication policy whose properties you want to view. Minimum length = 1
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
        Invoke-NSGetAAAPreauthenticationPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicyBinding -Name 'aaapreauthenticationpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaapreauthenticationpolicy_binding'
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
# endregion Invoke-NSGetAAAPreauthenticationPolicyBinding

# region Invoke-NSGetAAAPreauthenticationPolicyVPNVServerBinding
function Invoke-NSGetAAAPreauthenticationPolicyVPNVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaapreauthenticationpolicy_vpnvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to aaapreauthenticationpolicy.
    .PARAMETER Name
        Name of the preauthentication policy whose properties you want to view. Minimum length = 1
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
        Invoke-NSGetAAAPreauthenticationPolicyVPNVServerBinding
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicyVPNVServerBinding -Name 'aaapreauthenticationpolicy_vpnvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAPreauthenticationPolicyVPNVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaapreauthenticationpolicy_vpnvserver_binding'
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
# endregion Invoke-NSGetAAAPreauthenticationPolicyVPNVServerBinding

# region Invoke-NSGetAAARADIUSParams
function Invoke-NSGetAAARADIUSParams {
    <#
    .SYNOPSIS
        Gets NetScaler aaaradiusparams configuration.
    .DESCRIPTION
        Configuration for RADIUS parameter resource.
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
        Invoke-NSGetAAARADIUSParams
    .EXAMPLE
        Invoke-NSGetAAARADIUSParams -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaaradiusparams'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAARADIUSParams

# region Invoke-NSGetAAASession
function Invoke-NSGetAAASession {
    <#
    .SYNOPSIS
        Gets NetScaler aaasession configuration.
    .DESCRIPTION
        Configuration for active connection resource.
    .PARAMETER UserName
        Name of the AAA user. Minimum length = 1
    .PARAMETER GroupName
        Name of the AAA group. Minimum length = 1
    .PARAMETER Iip
        IP address or the first address in the intranet IP range. Minimum length = 1
    .PARAMETER NetMask
        Subnet mask for the intranet IP range. Minimum length = 1
    .PARAMETER SessionKey
        Show aaa session associated with given session key. Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetAAASession
    .EXAMPLE
        Invoke-NSGetAAASession -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

        [Parameter(ParameterSetName = 'All')]
        [string] $GroupName,

        [Parameter(ParameterSetName = 'All')]
        [string] $Iip,

        [Parameter(ParameterSetName = 'All')]
        [string] $NetMask,

        [Parameter(ParameterSetName = 'All')]
        [string] $SessionKey,

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
        if ($PSBoundParameters.ContainsKey('UserName')) {
            $argumentValue = $UserName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'username:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('GroupName')) {
            $argumentValue = $GroupName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'groupname:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Iip')) {
            $argumentValue = $Iip
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'iip:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('NetMask')) {
            $argumentValue = $NetMask
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'netmask:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('SessionKey')) {
            $argumentValue = $SessionKey
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'sessionkey:' + $argumentValue
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
            Type = 'aaasession'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAASession

# region Invoke-NSGetAAASSOProfile
function Invoke-NSGetAAASSOProfile {
    <#
    .SYNOPSIS
        Gets NetScaler aaassoprofile configuration.
    .DESCRIPTION
        Configuration for aaa sso profile resource.
    .PARAMETER Name
        Name for the SSO Profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a SSO Profile is created. The following requirement applies only to the NetScaler CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
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
        Invoke-NSGetAAASSOProfile
    .EXAMPLE
        Invoke-NSGetAAASSOProfile -Name 'aaassoprofile_example'
    .EXAMPLE
        Invoke-NSGetAAASSOProfile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaassoprofile'
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
# endregion Invoke-NSGetAAASSOProfile

# region Invoke-NSGetAAATacacsparams
function Invoke-NSGetAAATacacsparams {
    <#
    .SYNOPSIS
        Gets NetScaler aaatacacsparams configuration.
    .DESCRIPTION
        Configuration for tacacs parameters resource.
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
        Invoke-NSGetAAATacacsparams
    .EXAMPLE
        Invoke-NSGetAAATacacsparams -Filter @{ servicetype = 'HTTP' }
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
            Type = 'aaatacacsparams'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAATacacsparams

# region Invoke-NSGetAAAUser
function Invoke-NSGetAAAUser {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser configuration.
    .DESCRIPTION
        Configuration for AAA user resource.
    .PARAMETER UserName
        Name for the user. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the user is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa user" or "my aaa user"). Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Loggedin
        Show whether the user is logged in or not.
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
        Invoke-NSGetAAAUser
    .EXAMPLE
        Invoke-NSGetAAAUser -UserName 'aaauser_example'
    .EXAMPLE
        Invoke-NSGetAAAUser -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [switch] $Loggedin,

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
        if ($PSBoundParameters.ContainsKey('Loggedin')) {
            $argumentValue = $Loggedin
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'loggedin:' + $argumentValue
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
            Type = 'aaauser'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUser

# region Invoke-NSGetAAAUserAAAGroupBinding
function Invoke-NSGetAAAUserAAAGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_aaagroup_binding configuration.
    .DESCRIPTION
        Binding object showing the aaagroup that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserAAAGroupBinding
    .EXAMPLE
        Invoke-NSGetAAAUserAAAGroupBinding -UserName 'aaauser_aaagroup_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserAAAGroupBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_aaagroup_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserAAAGroupBinding

# region Invoke-NSGetAAAUserAuditNSLogPolicyBinding
function Invoke-NSGetAAAUserAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_auditnslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserAuditNSLogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAUserAuditNSLogPolicyBinding -UserName 'aaauser_auditnslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserAuditNSLogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_auditnslogpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserAuditNSLogPolicyBinding

# region Invoke-NSGetAAAUserAuditSyslogPolicyBinding
function Invoke-NSGetAAAUserAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_auditsyslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserAuditSyslogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAUserAuditSyslogPolicyBinding -UserName 'aaauser_auditsyslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserAuditSyslogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_auditsyslogpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserAuditSyslogPolicyBinding

# region Invoke-NSGetAAAUserAuthorizationPolicyBinding
function Invoke-NSGetAAAUserAuthorizationPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_authorizationpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the authorizationpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserAuthorizationPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAUserAuthorizationPolicyBinding -UserName 'aaauser_authorizationpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserAuthorizationPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_authorizationpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserAuthorizationPolicyBinding

# region Invoke-NSGetAAAUserBinding
function Invoke-NSGetAAAUserBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to aaauser.
    .PARAMETER UserName
        Name of the user who has the account. Minimum length = 1
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
        Invoke-NSGetAAAUserBinding
    .EXAMPLE
        Invoke-NSGetAAAUserBinding -UserName 'aaauser_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserBinding

# region Invoke-NSGetAAAUserIntranetIp6Binding
function Invoke-NSGetAAAUserIntranetIp6Binding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_intranetip6_binding configuration.
    .DESCRIPTION
        Binding object showing the intranetip6 that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserIntranetIp6Binding
    .EXAMPLE
        Invoke-NSGetAAAUserIntranetIp6Binding -UserName 'aaauser_intranetip6_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserIntranetIp6Binding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_intranetip6_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserIntranetIp6Binding

# region Invoke-NSGetAAAUserIntranetIPBinding
function Invoke-NSGetAAAUserIntranetIPBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_intranetip_binding configuration.
    .DESCRIPTION
        Binding object showing the intranetip that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserIntranetIPBinding
    .EXAMPLE
        Invoke-NSGetAAAUserIntranetIPBinding -UserName 'aaauser_intranetip_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserIntranetIPBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_intranetip_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserIntranetIPBinding

# region Invoke-NSGetAAAUserTMSessionPolicyBinding
function Invoke-NSGetAAAUserTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_tmsessionpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserTMSessionPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAUserTMSessionPolicyBinding -UserName 'aaauser_tmsessionpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserTMSessionPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_tmsessionpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserTMSessionPolicyBinding

# region Invoke-NSGetAAAUserVPNIntranetApplicationBinding
function Invoke-NSGetAAAUserVPNIntranetApplicationBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_vpnintranetapplication_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnintranetapplication that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserVPNIntranetApplicationBinding
    .EXAMPLE
        Invoke-NSGetAAAUserVPNIntranetApplicationBinding -UserName 'aaauser_vpnintranetapplication_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserVPNIntranetApplicationBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_vpnintranetapplication_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserVPNIntranetApplicationBinding

# region Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding
function Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_vpnsecureprivateaccessprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnsecureprivateaccessprofile that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding
    .EXAMPLE
        Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding -UserName 'aaauser_vpnsecureprivateaccessprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_vpnsecureprivateaccessprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserVPNSecurePrivateAccessProfileBinding

# region Invoke-NSGetAAAUserVPNSessionPolicyBinding
function Invoke-NSGetAAAUserVPNSessionPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_vpnsessionpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnsessionpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserVPNSessionPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAUserVPNSessionPolicyBinding -UserName 'aaauser_vpnsessionpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserVPNSessionPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_vpnsessionpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserVPNSessionPolicyBinding

# region Invoke-NSGetAAAUserVPNTrafficPolicyBinding
function Invoke-NSGetAAAUserVPNTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_vpntrafficpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the vpntrafficpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserVPNTrafficPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAUserVPNTrafficPolicyBinding -UserName 'aaauser_vpntrafficpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserVPNTrafficPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_vpntrafficpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserVPNTrafficPolicyBinding

# region Invoke-NSGetAAAUserVPNURLBinding
function Invoke-NSGetAAAUserVPNURLBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_vpnurl_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnurl that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserVPNURLBinding
    .EXAMPLE
        Invoke-NSGetAAAUserVPNURLBinding -UserName 'aaauser_vpnurl_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserVPNURLBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_vpnurl_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserVPNURLBinding

# region Invoke-NSGetAAAUserVPNURLPolicyBinding
function Invoke-NSGetAAAUserVPNURLPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler aaauser_vpnurlpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnurlpolicy that can be bound to aaauser.
    .PARAMETER UserName
        User account to which to bind the policy. Minimum length = 1
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
        Invoke-NSGetAAAUserVPNURLPolicyBinding
    .EXAMPLE
        Invoke-NSGetAAAUserVPNURLPolicyBinding -UserName 'aaauser_vpnurlpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAAAUserVPNURLPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $UserName,

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
            Type = 'aaauser_vpnurlpolicy_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $UserName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAAAUserVPNURLPolicyBinding

# region Invoke-NSKillAAASession
function Invoke-NSKillAAASession {
    <#
    .SYNOPSIS
        Invokes the kill operation for a NetScaler aaasession resource.
    .DESCRIPTION
        Configuration for active connection resource.
    .PARAMETER All
        Terminate all active AAA-TM/VPN sessions.
    .PARAMETER GroupName
        Name of the AAA group. Minimum length = 1
    .PARAMETER Iip
        IP address or the first address in the intranet IP range. Minimum length = 1
    .PARAMETER NetMask
        Subnet mask for the intranet IP range. Minimum length = 1
    .PARAMETER SessionKey
        Show aaa session associated with given session key. Minimum length = 1 Maximum length = 127
    .PARAMETER UserName
        Name of the AAA user. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSKillAAASession 
    .EXAMPLE
        Invoke-NSKillAAASession  -WhatIf
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
        [bool] $All,

        [Parameter()]
        [string] $GroupName,

        [Parameter()]
        [string] $Iip,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [string] $SessionKey,

        [Parameter()]
        [string] $UserName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

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
        if ($PSBoundParameters.ContainsKey('All')) { $body['all'] = $All }
        if ($PSBoundParameters.ContainsKey('GroupName')) { $body['groupname'] = $GroupName }
        if ($PSBoundParameters.ContainsKey('Iip')) { $body['iip'] = $Iip }
        if ($PSBoundParameters.ContainsKey('NetMask')) { $body['netmask'] = $NetMask }
        if ($PSBoundParameters.ContainsKey('SessionKey')) { $body['sessionkey'] = $SessionKey }
        if ($PSBoundParameters.ContainsKey('UserName')) { $body['username'] = $UserName }

        if ($PSCmdlet.ShouldProcess('aaasession', 'Kill aaasession')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaasession -Action kill -Payload @{ aaasession = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSKillAAASession

# region Invoke-NSUnlockAAAUser
function Invoke-NSUnlockAAAUser {
    <#
    .SYNOPSIS
        Invokes the unlock operation for a NetScaler aaauser resource.
    .DESCRIPTION
        Configuration for AAA user resource.
    .PARAMETER UserName
        Name for the user. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the user is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa user" or "my aaa user"). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSUnlockAAAUser -UserName 'example'
    .EXAMPLE
        Invoke-NSUnlockAAAUser -UserName 'example' -WhatIf
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
        [string] $UserName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

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
        if ($PSBoundParameters.ContainsKey('UserName')) { $body['username'] = $UserName }

        if ($PSCmdlet.ShouldProcess('aaauser', 'Unlock aaauser')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaauser -Action unlock -Payload @{ aaauser = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSUnlockAAAUser

# region Invoke-NSUnsetAAACertParams
function Invoke-NSUnsetAAACertParams {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaacertparams resource properties.
    .DESCRIPTION
        Configuration for certificate parameter resource.
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER GroupNameField
        Client certificate field that specifies the group, in the format <field>:<subfield>.
    .PARAMETER UserNameField
        Client certificate field that contains the username, in the format <field>:<subfield>. .
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
        Invoke-NSUnsetAAACertParams -DefaultAuthenticationGroup  -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAACertParams -DefaultAuthenticationGroup  -WhatIf
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
        [switch] $DefaultAuthenticationGroup,

        [Parameter()]
        [switch] $GroupNameField,

        [Parameter()]
        [switch] $UserNameField,

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
        if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $body['defaultauthenticationgroup'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupNameField')) { $body['groupnamefield'] = $true }
        if ($PSBoundParameters.ContainsKey('UserNameField')) { $body['usernamefield'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('aaacertparams', 'Clear aaacertparams properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaacertparams -Action unset -Payload @{ aaacertparams = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAACertParams

# region Invoke-NSUnsetAAAKCDAccount
function Invoke-NSUnsetAAAKCDAccount {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaakcdaccount resource properties.
    .DESCRIPTION
        Configuration for Kerberos constrained delegation account resource.
    .PARAMETER KCDAccount
        The name of the KCD account. Minimum length = 1
    .PARAMETER CaCert
        CA Cert for UserCert or when doing PKINIT backchannel.
    .PARAMETER DelegatedUser
        Username that can perform kerberos constrained delegation.
    .PARAMETER Enterpriserealm
        Enterprise Realm of the user. This should be given only in certain KDC deployments where KDC expects Enterprise username instead of Principal Name.
    .PARAMETER KCDPassword
        Password for Delegated User.
    .PARAMETER KeyTab
        The path to the keytab file. If specified other parameters in this command need not be given.
    .PARAMETER Saltexpression
        Salt expression used by Kerberos impersonation. When configured, this expression will be used for key derivation with AES-128 or AES-256 encryption types. For RC4 encryption, the salt is not used. If the salt expression is not set, the default behavior is to derive the salt value from the Kerberos principal.
    .PARAMETER ServiceSpn
        Service SPN. When specified, this will be used to fetch kerberos tickets. If not specified, Citrix ADC will construct SPN using service fqdn.
    .PARAMETER UserCert
        SSL Cert (including private key) for Delegated User.
    .PARAMETER UserRealm
        Realm of the user.
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
        Invoke-NSUnsetAAAKCDAccount -KCDAccount 'example' -CaCert  -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAAKCDAccount -KCDAccount 'example' -CaCert  -WhatIf
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
        [string] $KCDAccount,

        [Parameter()]
        [switch] $CaCert,

        [Parameter()]
        [switch] $DelegatedUser,

        [Parameter()]
        [switch] $Enterpriserealm,

        [Parameter()]
        [switch] $KCDPassword,

        [Parameter()]
        [switch] $KeyTab,

        [Parameter()]
        [switch] $Saltexpression,

        [Parameter()]
        [switch] $ServiceSpn,

        [Parameter()]
        [switch] $UserCert,

        [Parameter()]
        [switch] $UserRealm,

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

        $body = @{ kcdaccount = $KCDAccount }
        if ($PSBoundParameters.ContainsKey('CaCert')) { $body['cacert'] = $true }
        if ($PSBoundParameters.ContainsKey('DelegatedUser')) { $body['delegateduser'] = $true }
        if ($PSBoundParameters.ContainsKey('Enterpriserealm')) { $body['enterpriserealm'] = $true }
        if ($PSBoundParameters.ContainsKey('KCDPassword')) { $body['kcdpassword'] = $true }
        if ($PSBoundParameters.ContainsKey('KeyTab')) { $body['keytab'] = $true }
        if ($PSBoundParameters.ContainsKey('Saltexpression')) { $body['saltexpression'] = $true }
        if ($PSBoundParameters.ContainsKey('ServiceSpn')) { $body['servicespn'] = $true }
        if ($PSBoundParameters.ContainsKey('UserCert')) { $body['usercert'] = $true }
        if ($PSBoundParameters.ContainsKey('UserRealm')) { $body['userrealm'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$KCDAccount", 'Clear aaakcdaccount properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaakcdaccount -Action unset -Payload @{ aaakcdaccount = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAAAKCDAccount -KCDAccount $KCDAccount -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAAKCDAccount

# region Invoke-NSUnsetAAALDAPParams
function Invoke-NSUnsetAAALDAPParams {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaaldapparams resource properties.
    .DESCRIPTION
        Configuration for LDAP parameter resource.
    .PARAMETER AuthTimeout
        Maximum number of seconds that the Citrix ADC waits for a response from the LDAP server. Default value: 3 Minimum value = 1
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER GroupAttrName
        Attribute name used for group extraction from the LDAP server.
    .PARAMETER GroupNameIdentifier
        LDAP-group attribute that uniquely identifies the group. No two groups on one LDAP server can have the same group name identifier.
    .PARAMETER GroupSearchattribute
        LDAP-group attribute that designates the parent group of the specified group. Use this attribute to search for a group's parent group.
    .PARAMETER GroupSearchfilter
        Search-expression that can be specified for sending group-search requests to the LDAP server.
    .PARAMETER GroupSearchsubattribute
        LDAP-group subattribute that designates the parent group of the specified group. Use this attribute to search for a group's parent group.
    .PARAMETER LDAPBase
        Base (the server and location) from which LDAP search commands should start. If the LDAP server is running locally, the default value of base is dc=netscaler, dc=com.
    .PARAMETER LDAPBinddn
        Complete distinguished name (DN) string used for binding to the LDAP server.
    .PARAMETER LDAPBinddnpassword
        Password for binding to the LDAP server. Minimum length = 1
    .PARAMETER LDAPLoginName
        Name attribute that the Citrix ADC uses to query the external LDAP server or an Active Directory.
    .PARAMETER MaxNestinglevel
        Number of levels up to which the system can query nested LDAP groups. Default value: 2 Minimum value = 2
    .PARAMETER NestedGroupExtrAction
        Queries the external LDAP server to determine whether the specified group belongs to another group. Default value: OFF Possible values = ON, OFF
    .PARAMETER Passwdchange
        Accept password change requests. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Searchfilter
        String to be combined with the default LDAP user search string to form the value to use when executing an LDAP search. For example, the following values: vpnallowed=true, ldaploginame=""samaccount"" when combined with the user-supplied username ""bob"", yield the following LDAP search string: ""(&(vpnallowed=true)(samaccount=bob)"". Minimum length = 1
    .PARAMETER SecType
        Type of security used for communications between the Citrix ADC and the LDAP server. For the PLAINTEXT setting, no encryption is required. Default value: TLS Possible values = PLAINTEXT, TLS, SSL
    .PARAMETER ServerIp
        IP address of your LDAP server.
    .PARAMETER ServerPort
        Port number on which the LDAP server listens for connections. Default value: 389 Minimum value = 1
    .PARAMETER SSONameAttribute
        Attribute used by the Citrix ADC to query an external LDAP server or Active Directory for an alternative username. This alternative username is then used for single sign-on (SSO).
    .PARAMETER SubattributeName
        Subattribute name used for group extraction from the LDAP server.
    .PARAMETER SvrType
        The type of LDAP server. Default value: AAA_LDAP_SERVER_TYPE_DEFAULT Possible values = AD, NDS
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
        Invoke-NSUnsetAAALDAPParams -AuthTimeout  -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAALDAPParams -AuthTimeout  -WhatIf
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
        [switch] $AuthTimeout,

        [Parameter()]
        [switch] $DefaultAuthenticationGroup,

        [Parameter()]
        [switch] $GroupAttrName,

        [Parameter()]
        [switch] $GroupNameIdentifier,

        [Parameter()]
        [switch] $GroupSearchattribute,

        [Parameter()]
        [switch] $GroupSearchfilter,

        [Parameter()]
        [switch] $GroupSearchsubattribute,

        [Parameter()]
        [switch] $LDAPBase,

        [Parameter()]
        [switch] $LDAPBinddn,

        [Parameter()]
        [switch] $LDAPBinddnpassword,

        [Parameter()]
        [switch] $LDAPLoginName,

        [Parameter()]
        [switch] $MaxNestinglevel,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $NestedGroupExtrAction,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Passwdchange,

        [Parameter()]
        [switch] $Searchfilter,

        [Parameter()]
        [ValidateSet('PLAINTEXT', 'TLS', 'SSL')]
        [switch] $SecType,

        [Parameter()]
        [switch] $ServerIp,

        [Parameter()]
        [switch] $ServerPort,

        [Parameter()]
        [switch] $SSONameAttribute,

        [Parameter()]
        [switch] $SubattributeName,

        [Parameter()]
        [ValidateSet('AD', 'NDS')]
        [switch] $SvrType,

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
        if ($PSBoundParameters.ContainsKey('AuthTimeout')) { $body['authtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $body['defaultauthenticationgroup'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupAttrName')) { $body['groupattrname'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupNameIdentifier')) { $body['groupnameidentifier'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupSearchattribute')) { $body['groupsearchattribute'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupSearchfilter')) { $body['groupsearchfilter'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupSearchsubattribute')) { $body['groupsearchsubattribute'] = $true }
        if ($PSBoundParameters.ContainsKey('LDAPBase')) { $body['ldapbase'] = $true }
        if ($PSBoundParameters.ContainsKey('LDAPBinddn')) { $body['ldapbinddn'] = $true }
        if ($PSBoundParameters.ContainsKey('LDAPBinddnpassword')) { $body['ldapbinddnpassword'] = $true }
        if ($PSBoundParameters.ContainsKey('LDAPLoginName')) { $body['ldaploginname'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxNestinglevel')) { $body['maxnestinglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('NestedGroupExtrAction')) { $body['nestedgroupextraction'] = $true }
        if ($PSBoundParameters.ContainsKey('Passwdchange')) { $body['passwdchange'] = $true }
        if ($PSBoundParameters.ContainsKey('Searchfilter')) { $body['searchfilter'] = $true }
        if ($PSBoundParameters.ContainsKey('SecType')) { $body['sectype'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerIp')) { $body['serverip'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerPort')) { $body['serverport'] = $true }
        if ($PSBoundParameters.ContainsKey('SSONameAttribute')) { $body['ssonameattribute'] = $true }
        if ($PSBoundParameters.ContainsKey('SubattributeName')) { $body['subattributename'] = $true }
        if ($PSBoundParameters.ContainsKey('SvrType')) { $body['svrtype'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('aaaldapparams', 'Clear aaaldapparams properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaaldapparams -Action unset -Payload @{ aaaldapparams = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAALDAPParams

# region Invoke-NSUnsetAAAOtpparameter
function Invoke-NSUnsetAAAOtpparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaaotpparameter resource properties.
    .DESCRIPTION
        Configuration for AAA otpparameter resource.
    .PARAMETER Encryption
        To encrypt otp secret in AD or not. Default value is OFF. Default value: OFF Possible values = ON, OFF
    .PARAMETER MaxOtpdevices
        Maximum number of otp devices user can register. Default value is 4. Max value is 255. Default value: 4 Minimum value = 0 Maximum value = 255
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
        Invoke-NSUnsetAAAOtpparameter -Encryption ON -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAAOtpparameter -Encryption ON -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [switch] $Encryption,

        [Parameter()]
        [switch] $MaxOtpdevices,

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
        if ($PSBoundParameters.ContainsKey('Encryption')) { $body['encryption'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxOtpdevices')) { $body['maxotpdevices'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('aaaotpparameter', 'Clear aaaotpparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaaotpparameter -Action unset -Payload @{ aaaotpparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAAOtpparameter

# region Invoke-NSUnsetAAAParameter
function Invoke-NSUnsetAAAParameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaaparameter resource properties.
    .DESCRIPTION
        Configuration for AAA parameter resource.
    .PARAMETER AAADloglevel
        AAAD log level, which specifies the types of AAAD events to log in nsvpn.log. Available values function as follows: * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. Default value: INFORMATIONAL Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
    .PARAMETER AAADnatip
        Source IP address to use for traffic that is sent to the authentication server.
    .PARAMETER AAASessionloglevel
        Audit log level, which specifies the types of events to log for cli executed commands. Available values function as follows: * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. Default value: DEFAULT_LOGLEVEL_AAA Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
    .PARAMETER APITokencache
        Option to enable/disable API cache feature. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Classicendpoints
        Parameter to enable/disable classic endpoints. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DefaultauthType
        The default authentication server type. Default value: LOCAL Possible values = LOCAL, LDAP, RADIUS, TACACS, CERT
    .PARAMETER DefaultcspHeader
        Parameter to enable/disable default CSP header. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Dynaddr
        Set by the DHCP client when the IP address was fetched dynamically. Default value: OFF Possible values = ON, OFF
    .PARAMETER Enableenhancedauthfeedback
        Enhanced auth feedback provides more information to the end user about the reason for an authentication failure. The default value is set to NO. Default value: NO Possible values = YES, NO
    .PARAMETER Enablesessionstickiness
        Enables/Disables stickiness to authentication servers. Default value: NO Possible values = YES, NO
    .PARAMETER EnablestaticPageCaching
        The default state of VPN Static Page caching. Static Page caching is enabled by default. Default value: YES Possible values = YES, NO
    .PARAMETER Enhancedepa
        Parameter to enable/disable EPA v2 functionality. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER FtMode
        First time user mode determines which configuration options are shown by default when logging in to the GUI. This setting is controlled by the GUI. Default value: ON Possible values = ON, HA, OFF
    .PARAMETER HTTPOnlyCookie
        Parameter to set/reset HttpOnly Flag for NSC_AAAC/NSC_TMAS cookies in nfactor. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LoginEncryption
        Parameter to encrypt login information for nFactor flow. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER MaxAAAUserS
        Maximum number of concurrent users allowed to log on to VPN simultaneously. Minimum value = 1
    .PARAMETER MaxKbquestions
        This will set maximum number of Questions to be asked for KB Validation. Default value is 2, Max Value is 6. Minimum value = 2 Maximum value = 6
    .PARAMETER MaxLoginAttempts
        Maximum Number of login Attempts. Minimum value = 1
    .PARAMETER MaxSAMLDeflatesize
        This will set the maximum deflate size in case of SAML Redirect binding.
    .PARAMETER PersistentLoginAttempts
        Persistent storage of unsuccessful user login attempts. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Pwdexpirynotificationdays
        This will set the threshold time in days for password expiry notification. Default value is 0, which means no notification is sent.
    .PARAMETER Samesite
        SameSite attribute value for Cookies generated in AAATM context. This attribute value will be appended only for the cookies which are specified in the builtin patset ns_cookies_samesite. Possible values = None, LAX, STRICT
    .PARAMETER Securityinsights
        On enabling this option, the Citrix ADC will send the security insight records to the configured collectors when request comes to Authentication endpoint. * If cs vserver is frontend with Authentication vserver as target for cs action, then record is sent using Authentication vserver name. * If vpn/lb/cs vserver are configured with Authentication ON, then then record is sent using vpn/lb/cs vserver name accordingly. * If authentication vserver is frontend, then record is sent using Authentication vserver name. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER TokenintroSpecTionInterval
        Frequency at which a token must be verified at the Authorization Server (AS) despite being found in cache.
    .PARAMETER Wafprotection
        Entities for which WAF Protection need to be applied. Available settings function as follows: * DEFAULT - AUTH and VPN Protections are enabled. This is the default value for wafProtection * AUTH - Endpoints used for Authentication applicable for both AAATM, IDP, GATEWAY use cases. * VPN - Endpoints used for Gateway use cases. * PORTAL - Endpoints related to web portal. * DISABLED - No Endpoint WAF protection. Currently supported only in default partition. Default value: DEFAULT Possible values = DISABLED, AUTH, VPN, PORTAL, DEFAULT
    .PARAMETER WebViewendpoints
        Parameter to enable/disable webview endpoints. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetAAAParameter -AAADloglevel EMERGENCY -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAAParameter -AAADloglevel EMERGENCY -WhatIf
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
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [switch] $AAADloglevel,

        [Parameter()]
        [switch] $AAADnatip,

        [Parameter()]
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [switch] $AAASessionloglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $APITokencache,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Classicendpoints,

        [Parameter()]
        [ValidateSet('LOCAL', 'LDAP', 'RADIUS', 'TACACS', 'CERT')]
        [switch] $DefaultauthType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DefaultcspHeader,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Dynaddr,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Enableenhancedauthfeedback,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Enablesessionstickiness,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $EnablestaticPageCaching,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Enhancedepa,

        [Parameter()]
        [ValidateSet('ON', 'HA', 'OFF')]
        [switch] $FtMode,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPOnlyCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $LoginEncryption,

        [Parameter()]
        [switch] $MaxAAAUserS,

        [Parameter()]
        [switch] $MaxKbquestions,

        [Parameter()]
        [switch] $MaxLoginAttempts,

        [Parameter()]
        [switch] $MaxSAMLDeflatesize,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $PersistentLoginAttempts,

        [Parameter()]
        [switch] $Pwdexpirynotificationdays,

        [Parameter()]
        [ValidateSet('None', 'LAX', 'STRICT')]
        [switch] $Samesite,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Securityinsights,

        [Parameter()]
        [switch] $TokenintroSpecTionInterval,

        [Parameter()]
        [ValidateSet('DISABLED', 'AUTH', 'VPN', 'PORTAL', 'DEFAULT')]
        [switch] $Wafprotection,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $WebViewendpoints,

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
        if ($PSBoundParameters.ContainsKey('AAADloglevel')) { $body['aaadloglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('AAADnatip')) { $body['aaadnatip'] = $true }
        if ($PSBoundParameters.ContainsKey('AAASessionloglevel')) { $body['aaasessionloglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('APITokencache')) { $body['apitokencache'] = $true }
        if ($PSBoundParameters.ContainsKey('Classicendpoints')) { $body['classicendpoints'] = $true }
        if ($PSBoundParameters.ContainsKey('DefaultauthType')) { $body['defaultauthtype'] = $true }
        if ($PSBoundParameters.ContainsKey('DefaultcspHeader')) { $body['defaultcspheader'] = $true }
        if ($PSBoundParameters.ContainsKey('Dynaddr')) { $body['dynaddr'] = $true }
        if ($PSBoundParameters.ContainsKey('Enableenhancedauthfeedback')) { $body['enableenhancedauthfeedback'] = $true }
        if ($PSBoundParameters.ContainsKey('Enablesessionstickiness')) { $body['enablesessionstickiness'] = $true }
        if ($PSBoundParameters.ContainsKey('EnablestaticPageCaching')) { $body['enablestaticpagecaching'] = $true }
        if ($PSBoundParameters.ContainsKey('Enhancedepa')) { $body['enhancedepa'] = $true }
        if ($PSBoundParameters.ContainsKey('FtMode')) { $body['ftmode'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPOnlyCookie')) { $body['httponlycookie'] = $true }
        if ($PSBoundParameters.ContainsKey('LoginEncryption')) { $body['loginencryption'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxAAAUserS')) { $body['maxaaausers'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxKbquestions')) { $body['maxkbquestions'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxLoginAttempts')) { $body['maxloginattempts'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxSAMLDeflatesize')) { $body['maxsamldeflatesize'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistentLoginAttempts')) { $body['persistentloginattempts'] = $true }
        if ($PSBoundParameters.ContainsKey('Pwdexpirynotificationdays')) { $body['pwdexpirynotificationdays'] = $true }
        if ($PSBoundParameters.ContainsKey('Samesite')) { $body['samesite'] = $true }
        if ($PSBoundParameters.ContainsKey('Securityinsights')) { $body['securityinsights'] = $true }
        if ($PSBoundParameters.ContainsKey('TokenintroSpecTionInterval')) { $body['tokenintrospectioninterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Wafprotection')) { $body['wafprotection'] = $true }
        if ($PSBoundParameters.ContainsKey('WebViewendpoints')) { $body['webviewendpoints'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('aaaparameter', 'Clear aaaparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaaparameter -Action unset -Payload @{ aaaparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAAParameter

# region Invoke-NSUnsetAAAPreauthenticationAction
function Invoke-NSUnsetAAAPreauthenticationAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaapreauthenticationaction resource properties.
    .DESCRIPTION
        Configuration for pre authentication action resource.
    .PARAMETER Name
        Name for the preauthentication action. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after preauthentication action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa action" or 'my aaa action'). Minimum length = 1
    .PARAMETER DefaultepaGroup
        This is the default group that is chosen when the EPA check succeeds. Maximum length = 64
    .PARAMETER DeleteFileS
        String specifying the path(s) and name(s) of the files to be deleted by the endpoint analysis (EPA) tool.
    .PARAMETER KillProcess
        String specifying the name of a process to be terminated by the endpoint analysis (EPA) tool.
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
        Invoke-NSUnsetAAAPreauthenticationAction -Name 'example' -DefaultepaGroup  -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAAPreauthenticationAction -Name 'example' -DefaultepaGroup  -WhatIf
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
        [switch] $DefaultepaGroup,

        [Parameter()]
        [switch] $DeleteFileS,

        [Parameter()]
        [switch] $KillProcess,

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
        if ($PSBoundParameters.ContainsKey('DefaultepaGroup')) { $body['defaultepagroup'] = $true }
        if ($PSBoundParameters.ContainsKey('DeleteFileS')) { $body['deletefiles'] = $true }
        if ($PSBoundParameters.ContainsKey('KillProcess')) { $body['killprocess'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear aaapreauthenticationaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaapreauthenticationaction -Action unset -Payload @{ aaapreauthenticationaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAAAPreauthenticationAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAAPreauthenticationAction

# region Invoke-NSUnsetAAAPreauthenticationParameter
function Invoke-NSUnsetAAAPreauthenticationParameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaapreauthenticationparameter resource properties.
    .DESCRIPTION
        Configuration for pre authentication parameter resource.
    .PARAMETER DeleteFileS
        String specifying the path(s) to and name(s) of the files to be deleted by the EPA tool, as a string of between 1 and 1023 characters.
    .PARAMETER KillProcess
        String specifying the name of a process to be terminated by the EPA tool.
    .PARAMETER PreauthenticationAction
        Deny or allow login on the basis of end point analysis results. Possible values = ALLOW, DENY
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, to be evaluated by the EPA tool.
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
        Invoke-NSUnsetAAAPreauthenticationParameter -DeleteFileS  -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAAPreauthenticationParameter -DeleteFileS  -WhatIf
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
        [switch] $DeleteFileS,

        [Parameter()]
        [switch] $KillProcess,

        [Parameter()]
        [ValidateSet('ALLOW', 'DENY')]
        [switch] $PreauthenticationAction,

        [Parameter()]
        [switch] $Rule,

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
        if ($PSBoundParameters.ContainsKey('DeleteFileS')) { $body['deletefiles'] = $true }
        if ($PSBoundParameters.ContainsKey('KillProcess')) { $body['killprocess'] = $true }
        if ($PSBoundParameters.ContainsKey('PreauthenticationAction')) { $body['preauthenticationaction'] = $true }
        if ($PSBoundParameters.ContainsKey('Rule')) { $body['rule'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('aaapreauthenticationparameter', 'Clear aaapreauthenticationparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaapreauthenticationparameter -Action unset -Payload @{ aaapreauthenticationparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAAPreauthenticationParameter

# region Invoke-NSUnsetAAARADIUSParams
function Invoke-NSUnsetAAARADIUSParams {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaaradiusparams resource properties.
    .DESCRIPTION
        Configuration for RADIUS parameter resource.
    .PARAMETER AccountIng
        Configure the RADIUS server state to accept or refuse accounting messages. Possible values = ON, OFF
    .PARAMETER Authentication
        Configure the RADIUS server state to accept or refuse authentication messages. Default value: ON Possible values = ON, OFF
    .PARAMETER Authservretry
        Number of retry by the Citrix ADC before getting response from the RADIUS server. Default value: 3 Minimum value = 1 Maximum value = 10
    .PARAMETER AuthTimeout
        Maximum number of seconds that the Citrix ADC waits for a response from the RADIUS server. Default value: 3 Minimum value = 1
    .PARAMETER Callingstationid
        Send Calling-Station-ID of the client to the RADIUS server. IP Address of the client is sent as its Calling-Station-ID. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER IpattributeType
        IP attribute type in the RADIUS response. Minimum value = 1
    .PARAMETER Ipvendorid
        Vendor ID attribute in the RADIUS response. If the attribute is not vendor-encoded, it is set to 0.
    .PARAMETER MessageAuthenticator
        Control whether the Message-Authenticator attribute is included in a RADIUS Access-Request packet. Default value: ON Possible values = ON, OFF
    .PARAMETER Passencoding
        Enable password encoding in RADIUS packets that the Citrix ADC sends to the RADIUS server. Default value: mschapv2 Possible values = pap, chap, mschapv1, mschapv2
    .PARAMETER PwdattributeType
        Attribute type of the Vendor ID in the RADIUS response. Minimum value = 1
    .PARAMETER Pwdvendorid
        Vendor ID of the password in the RADIUS response. Used to extract the user password. Minimum value = 1
    .PARAMETER RadattributeType
        Attribute type for RADIUS group extraction. Minimum value = 1
    .PARAMETER RadGroupSeparator
        Group separator string that delimits group names within a RADIUS attribute for RADIUS group extraction.
    .PARAMETER RadGroupSprefix
        Prefix string that precedes group names within a RADIUS attribute for RADIUS group extraction.
    .PARAMETER Radnasid
        Send the Network Access Server ID (NASID) for your Citrix ADC to the RADIUS server as the nasid part of the Radius protocol.
    .PARAMETER RadnaSIP
        Send the Citrix ADC IP (NSIP) address to the RADIUS server as the Network Access Server IP (NASIP) part of the Radius protocol. Possible values = ENABLED, DISABLED
    .PARAMETER Radvendorid
        Vendor ID for RADIUS group extraction. Minimum value = 1
    .PARAMETER ServerIp
        IP address of your RADIUS server. Minimum length = 1
    .PARAMETER ServerPort
        Port number on which the RADIUS server listens for connections. Default value: 1812 Minimum value = 1
    .PARAMETER TunnelendpointClientIp
        Send Tunnel Endpoint Client IP address to the RADIUS server. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetAAARADIUSParams -AccountIng ON -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAARADIUSParams -AccountIng ON -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [switch] $AccountIng,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Authentication,

        [Parameter()]
        [switch] $Authservretry,

        [Parameter()]
        [switch] $AuthTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Callingstationid,

        [Parameter()]
        [switch] $DefaultAuthenticationGroup,

        [Parameter()]
        [switch] $IpattributeType,

        [Parameter()]
        [switch] $Ipvendorid,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $MessageAuthenticator,

        [Parameter()]
        [ValidateSet('pap', 'chap', 'mschapv1', 'mschapv2')]
        [switch] $Passencoding,

        [Parameter()]
        [switch] $PwdattributeType,

        [Parameter()]
        [switch] $Pwdvendorid,

        [Parameter()]
        [switch] $RadattributeType,

        [Parameter()]
        [switch] $RadGroupSeparator,

        [Parameter()]
        [switch] $RadGroupSprefix,

        [Parameter()]
        [switch] $Radnasid,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $RadnaSIP,

        [Parameter()]
        [switch] $Radvendorid,

        [Parameter()]
        [switch] $ServerIp,

        [Parameter()]
        [switch] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $TunnelendpointClientIp,

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
        if ($PSBoundParameters.ContainsKey('AccountIng')) { $body['accounting'] = $true }
        if ($PSBoundParameters.ContainsKey('Authentication')) { $body['authentication'] = $true }
        if ($PSBoundParameters.ContainsKey('Authservretry')) { $body['authservretry'] = $true }
        if ($PSBoundParameters.ContainsKey('AuthTimeout')) { $body['authtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Callingstationid')) { $body['callingstationid'] = $true }
        if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $body['defaultauthenticationgroup'] = $true }
        if ($PSBoundParameters.ContainsKey('IpattributeType')) { $body['ipattributetype'] = $true }
        if ($PSBoundParameters.ContainsKey('Ipvendorid')) { $body['ipvendorid'] = $true }
        if ($PSBoundParameters.ContainsKey('MessageAuthenticator')) { $body['messageauthenticator'] = $true }
        if ($PSBoundParameters.ContainsKey('Passencoding')) { $body['passencoding'] = $true }
        if ($PSBoundParameters.ContainsKey('PwdattributeType')) { $body['pwdattributetype'] = $true }
        if ($PSBoundParameters.ContainsKey('Pwdvendorid')) { $body['pwdvendorid'] = $true }
        if ($PSBoundParameters.ContainsKey('RadattributeType')) { $body['radattributetype'] = $true }
        if ($PSBoundParameters.ContainsKey('RadGroupSeparator')) { $body['radgroupseparator'] = $true }
        if ($PSBoundParameters.ContainsKey('RadGroupSprefix')) { $body['radgroupsprefix'] = $true }
        if ($PSBoundParameters.ContainsKey('Radnasid')) { $body['radnasid'] = $true }
        if ($PSBoundParameters.ContainsKey('RadnaSIP')) { $body['radnasip'] = $true }
        if ($PSBoundParameters.ContainsKey('Radvendorid')) { $body['radvendorid'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerIp')) { $body['serverip'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerPort')) { $body['serverport'] = $true }
        if ($PSBoundParameters.ContainsKey('TunnelendpointClientIp')) { $body['tunnelendpointclientip'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('aaaradiusparams', 'Clear aaaradiusparams properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaaradiusparams -Action unset -Payload @{ aaaradiusparams = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAARADIUSParams

# region Invoke-NSUnsetAAATacacsparams
function Invoke-NSUnsetAAATacacsparams {
    <#
    .SYNOPSIS
        Clears one or more NetScaler aaatacacsparams resource properties.
    .DESCRIPTION
        Configuration for tacacs parameters resource.
    .PARAMETER AccountIng
        Send accounting messages to the TACACS+ server. Possible values = ON, OFF
    .PARAMETER AuditFailedcmds
        The option for sending accounting messages to the TACACS+ server. Possible values = ON, OFF
    .PARAMETER Authorization
        Use streaming authorization on the TACACS+ server. Possible values = ON, OFF
    .PARAMETER AuthTimeout
        Maximum number of seconds that the Citrix ADC waits for a response from the TACACS+ server. Default value: 3 Minimum value = 1
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER GroupAttrName
        TACACS+ group attribute name.Used for group extraction on the TACACS+ server.
    .PARAMETER ServerIp
        IP address of your TACACS+ server. Minimum length = 1
    .PARAMETER ServerPort
        Port number on which the TACACS+ server listens for connections. Default value: 49 Minimum value = 1
    .PARAMETER Tacacssecret
        Key shared between the TACACS+ server and clients. Required for allowing the Citrix ADC to communicate with the TACACS+ server. Minimum length = 1
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
        Invoke-NSUnsetAAATacacsparams -AccountIng ON -PassThru
    .EXAMPLE
        Invoke-NSUnsetAAATacacsparams -AccountIng ON -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [switch] $AccountIng,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $AuditFailedcmds,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Authorization,

        [Parameter()]
        [switch] $AuthTimeout,

        [Parameter()]
        [switch] $DefaultAuthenticationGroup,

        [Parameter()]
        [switch] $GroupAttrName,

        [Parameter()]
        [switch] $ServerIp,

        [Parameter()]
        [switch] $ServerPort,

        [Parameter()]
        [switch] $Tacacssecret,

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
        if ($PSBoundParameters.ContainsKey('AccountIng')) { $body['accounting'] = $true }
        if ($PSBoundParameters.ContainsKey('AuditFailedcmds')) { $body['auditfailedcmds'] = $true }
        if ($PSBoundParameters.ContainsKey('Authorization')) { $body['authorization'] = $true }
        if ($PSBoundParameters.ContainsKey('AuthTimeout')) { $body['authtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $body['defaultauthenticationgroup'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupAttrName')) { $body['groupattrname'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerIp')) { $body['serverip'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerPort')) { $body['serverport'] = $true }
        if ($PSBoundParameters.ContainsKey('Tacacssecret')) { $body['tacacssecret'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('aaatacacsparams', 'Clear aaatacacsparams properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type aaatacacsparams -Action unset -Payload @{ aaatacacsparams = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAAATacacsparams

# region Invoke-NSUpdateAAACertParams
function Invoke-NSUpdateAAACertParams {
    <#
    .SYNOPSIS
        Updates a NetScaler aaacertparams resource.
    .DESCRIPTION
        Configuration for certificate parameter resource.
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER GroupNameField
        Client certificate field that specifies the group, in the format <field>:<subfield>.
    .PARAMETER UserNameField
        Client certificate field that contains the username, in the format <field>:<subfield>. .
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
        Invoke-NSUpdateAAACertParams  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAACertParams  -WhatIf
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
        [string] $DefaultAuthenticationGroup,

        [Parameter()]
        [string] $GroupNameField,

        [Parameter()]
        [string] $UserNameField,

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
    if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $properties['defaultauthenticationgroup'] = $DefaultAuthenticationGroup }
    if ($PSBoundParameters.ContainsKey('GroupNameField')) { $properties['groupnamefield'] = $GroupNameField }
    if ($PSBoundParameters.ContainsKey('UserNameField')) { $properties['usernamefield'] = $UserNameField }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaacertparams', 'Update aaacertparams')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaacertparams -Payload @{ aaacertparams = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAAACertParams

# region Invoke-NSUpdateAAAKCDAccount
function Invoke-NSUpdateAAAKCDAccount {
    <#
    .SYNOPSIS
        Updates a NetScaler aaakcdaccount resource.
    .DESCRIPTION
        Configuration for Kerberos constrained delegation account resource.
    .PARAMETER CaCert
        CA Cert for UserCert or when doing PKINIT backchannel.
    .PARAMETER DelegatedUser
        Username that can perform kerberos constrained delegation.
    .PARAMETER Enterpriserealm
        Enterprise Realm of the user. This should be given only in certain KDC deployments where KDC expects Enterprise username instead of Principal Name.
    .PARAMETER KCDAccount
        The name of the KCD account. Minimum length = 1
    .PARAMETER KCDPassword
        Password for Delegated User.
    .PARAMETER KeyTab
        The path to the keytab file. If specified other parameters in this command need not be given.
    .PARAMETER Realmstr
        Kerberos Realm.
    .PARAMETER Saltexpression
        Salt expression used by Kerberos impersonation. When configured, this expression will be used for key derivation with AES-128 or AES-256 encryption types. For RC4 encryption, the salt is not used. If the salt expression is not set, the default behavior is to derive the salt value from the Kerberos principal.
    .PARAMETER ServiceSpn
        Service SPN. When specified, this will be used to fetch kerberos tickets. If not specified, Citrix ADC will construct SPN using service fqdn.
    .PARAMETER UserCert
        SSL Cert (including private key) for Delegated User.
    .PARAMETER UserRealm
        Realm of the user.
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
        Invoke-NSUpdateAAAKCDAccount -KCDAccount 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAAKCDAccount -KCDAccount 'example' -WhatIf
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
        [string] $CaCert,

        [Parameter()]
        [string] $DelegatedUser,

        [Parameter()]
        [string] $Enterpriserealm,

        [Parameter(Mandatory, Position = 0)]
        [string] $KCDAccount,

        [Parameter()]
        [string] $KCDPassword,

        [Parameter()]
        [string] $KeyTab,

        [Parameter()]
        [string] $Realmstr,

        [Parameter()]
        [string] $Saltexpression,

        [Parameter()]
        [string] $ServiceSpn,

        [Parameter()]
        [string] $UserCert,

        [Parameter()]
        [string] $UserRealm,

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
    if ($PSBoundParameters.ContainsKey('CaCert')) { $properties['cacert'] = $CaCert }
    if ($PSBoundParameters.ContainsKey('DelegatedUser')) { $properties['delegateduser'] = $DelegatedUser }
    if ($PSBoundParameters.ContainsKey('Enterpriserealm')) { $properties['enterpriserealm'] = $Enterpriserealm }
    if ($PSBoundParameters.ContainsKey('KCDAccount')) { $properties['kcdaccount'] = $KCDAccount }
    if ($PSBoundParameters.ContainsKey('KCDPassword')) { $properties['kcdpassword'] = $KCDPassword }
    if ($PSBoundParameters.ContainsKey('KeyTab')) { $properties['keytab'] = $KeyTab }
    if ($PSBoundParameters.ContainsKey('Realmstr')) { $properties['realmstr'] = $Realmstr }
    if ($PSBoundParameters.ContainsKey('Saltexpression')) { $properties['saltexpression'] = $Saltexpression }
    if ($PSBoundParameters.ContainsKey('ServiceSpn')) { $properties['servicespn'] = $ServiceSpn }
    if ($PSBoundParameters.ContainsKey('UserCert')) { $properties['usercert'] = $UserCert }
    if ($PSBoundParameters.ContainsKey('UserRealm')) { $properties['userrealm'] = $UserRealm }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$KCDAccount", 'Update aaakcdaccount')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaakcdaccount -Payload @{ aaakcdaccount = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAKCDAccount -KCDAccount $KCDAccount -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAAAKCDAccount

# region Invoke-NSUpdateAAALDAPParams
function Invoke-NSUpdateAAALDAPParams {
    <#
    .SYNOPSIS
        Updates a NetScaler aaaldapparams resource.
    .DESCRIPTION
        Configuration for LDAP parameter resource.
    .PARAMETER AuthTimeout
        Maximum number of seconds that the Citrix ADC waits for a response from the LDAP server. Default value: 3 Minimum value = 1
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER GroupAttrName
        Attribute name used for group extraction from the LDAP server.
    .PARAMETER GroupNameIdentifier
        LDAP-group attribute that uniquely identifies the group. No two groups on one LDAP server can have the same group name identifier.
    .PARAMETER GroupSearchattribute
        LDAP-group attribute that designates the parent group of the specified group. Use this attribute to search for a group's parent group.
    .PARAMETER GroupSearchfilter
        Search-expression that can be specified for sending group-search requests to the LDAP server.
    .PARAMETER GroupSearchsubattribute
        LDAP-group subattribute that designates the parent group of the specified group. Use this attribute to search for a group's parent group.
    .PARAMETER LDAPBase
        Base (the server and location) from which LDAP search commands should start. If the LDAP server is running locally, the default value of base is dc=netscaler, dc=com.
    .PARAMETER LDAPBinddn
        Complete distinguished name (DN) string used for binding to the LDAP server.
    .PARAMETER LDAPBinddnpassword
        Password for binding to the LDAP server. Minimum length = 1
    .PARAMETER LDAPLoginName
        Name attribute that the Citrix ADC uses to query the external LDAP server or an Active Directory.
    .PARAMETER MaxNestinglevel
        Number of levels up to which the system can query nested LDAP groups. Default value: 2 Minimum value = 2
    .PARAMETER NestedGroupExtrAction
        Queries the external LDAP server to determine whether the specified group belongs to another group. Default value: OFF Possible values = ON, OFF
    .PARAMETER Passwdchange
        Accept password change requests. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Searchfilter
        String to be combined with the default LDAP user search string to form the value to use when executing an LDAP search. For example, the following values: vpnallowed=true, ldaploginame=""samaccount"" when combined with the user-supplied username ""bob"", yield the following LDAP search string: ""(&(vpnallowed=true)(samaccount=bob)"". Minimum length = 1
    .PARAMETER SecType
        Type of security used for communications between the Citrix ADC and the LDAP server. For the PLAINTEXT setting, no encryption is required. Default value: TLS Possible values = PLAINTEXT, TLS, SSL
    .PARAMETER ServerIp
        IP address of your LDAP server.
    .PARAMETER ServerPort
        Port number on which the LDAP server listens for connections. Default value: 389 Minimum value = 1
    .PARAMETER SSONameAttribute
        Attribute used by the Citrix ADC to query an external LDAP server or Active Directory for an alternative username. This alternative username is then used for single sign-on (SSO).
    .PARAMETER SubattributeName
        Subattribute name used for group extraction from the LDAP server.
    .PARAMETER SvrType
        The type of LDAP server. Default value: AAA_LDAP_SERVER_TYPE_DEFAULT Possible values = AD, NDS
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
        Invoke-NSUpdateAAALDAPParams  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAALDAPParams  -WhatIf
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
        [int] $AuthTimeout,

        [Parameter()]
        [string] $DefaultAuthenticationGroup,

        [Parameter()]
        [string] $GroupAttrName,

        [Parameter()]
        [string] $GroupNameIdentifier,

        [Parameter()]
        [string] $GroupSearchattribute,

        [Parameter()]
        [string] $GroupSearchfilter,

        [Parameter()]
        [string] $GroupSearchsubattribute,

        [Parameter()]
        [string] $LDAPBase,

        [Parameter()]
        [string] $LDAPBinddn,

        [Parameter()]
        [string] $LDAPBinddnpassword,

        [Parameter()]
        [string] $LDAPLoginName,

        [Parameter()]
        [int] $MaxNestinglevel,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $NestedGroupExtrAction,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Passwdchange,

        [Parameter()]
        [string] $Searchfilter,

        [Parameter()]
        [ValidateSet('PLAINTEXT', 'TLS', 'SSL')]
        [string] $SecType,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [string] $SSONameAttribute,

        [Parameter()]
        [string] $SubattributeName,

        [Parameter()]
        [ValidateSet('AD', 'NDS')]
        [string] $SvrType,

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
    if ($PSBoundParameters.ContainsKey('AuthTimeout')) { $properties['authtimeout'] = $AuthTimeout }
    if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $properties['defaultauthenticationgroup'] = $DefaultAuthenticationGroup }
    if ($PSBoundParameters.ContainsKey('GroupAttrName')) { $properties['groupattrname'] = $GroupAttrName }
    if ($PSBoundParameters.ContainsKey('GroupNameIdentifier')) { $properties['groupnameidentifier'] = $GroupNameIdentifier }
    if ($PSBoundParameters.ContainsKey('GroupSearchattribute')) { $properties['groupsearchattribute'] = $GroupSearchattribute }
    if ($PSBoundParameters.ContainsKey('GroupSearchfilter')) { $properties['groupsearchfilter'] = $GroupSearchfilter }
    if ($PSBoundParameters.ContainsKey('GroupSearchsubattribute')) { $properties['groupsearchsubattribute'] = $GroupSearchsubattribute }
    if ($PSBoundParameters.ContainsKey('LDAPBase')) { $properties['ldapbase'] = $LDAPBase }
    if ($PSBoundParameters.ContainsKey('LDAPBinddn')) { $properties['ldapbinddn'] = $LDAPBinddn }
    if ($PSBoundParameters.ContainsKey('LDAPBinddnpassword')) { $properties['ldapbinddnpassword'] = $LDAPBinddnpassword }
    if ($PSBoundParameters.ContainsKey('LDAPLoginName')) { $properties['ldaploginname'] = $LDAPLoginName }
    if ($PSBoundParameters.ContainsKey('MaxNestinglevel')) { $properties['maxnestinglevel'] = $MaxNestinglevel }
    if ($PSBoundParameters.ContainsKey('NestedGroupExtrAction')) { $properties['nestedgroupextraction'] = $NestedGroupExtrAction }
    if ($PSBoundParameters.ContainsKey('Passwdchange')) { $properties['passwdchange'] = $Passwdchange }
    if ($PSBoundParameters.ContainsKey('Searchfilter')) { $properties['searchfilter'] = $Searchfilter }
    if ($PSBoundParameters.ContainsKey('SecType')) { $properties['sectype'] = $SecType }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('SSONameAttribute')) { $properties['ssonameattribute'] = $SSONameAttribute }
    if ($PSBoundParameters.ContainsKey('SubattributeName')) { $properties['subattributename'] = $SubattributeName }
    if ($PSBoundParameters.ContainsKey('SvrType')) { $properties['svrtype'] = $SvrType }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaaldapparams', 'Update aaaldapparams')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaaldapparams -Payload @{ aaaldapparams = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAAALDAPParams

# region Invoke-NSUpdateAAAOtpparameter
function Invoke-NSUpdateAAAOtpparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler aaaotpparameter resource.
    .DESCRIPTION
        Configuration for AAA otpparameter resource.
    .PARAMETER Encryption
        To encrypt otp secret in AD or not. Default value is OFF. Default value: OFF Possible values = ON, OFF
    .PARAMETER MaxOtpdevices
        Maximum number of otp devices user can register. Default value is 4. Max value is 255. Default value: 4 Minimum value = 0 Maximum value = 255
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
        Invoke-NSUpdateAAAOtpparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAAOtpparameter  -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [string] $Encryption,

        [Parameter()]
        [int] $MaxOtpdevices,

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
    if ($PSBoundParameters.ContainsKey('Encryption')) { $properties['encryption'] = $Encryption }
    if ($PSBoundParameters.ContainsKey('MaxOtpdevices')) { $properties['maxotpdevices'] = $MaxOtpdevices }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaaotpparameter', 'Update aaaotpparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaaotpparameter -Payload @{ aaaotpparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAAAOtpparameter

# region Invoke-NSUpdateAAAParameter
function Invoke-NSUpdateAAAParameter {
    <#
    .SYNOPSIS
        Updates a NetScaler aaaparameter resource.
    .DESCRIPTION
        Configuration for AAA parameter resource.
    .PARAMETER AAADloglevel
        AAAD log level, which specifies the types of AAAD events to log in nsvpn.log. Available values function as follows: * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. Default value: INFORMATIONAL Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
    .PARAMETER AAADnatip
        Source IP address to use for traffic that is sent to the authentication server.
    .PARAMETER AAASessionloglevel
        Audit log level, which specifies the types of events to log for cli executed commands. Available values function as follows: * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. Default value: DEFAULT_LOGLEVEL_AAA Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
    .PARAMETER APITokencache
        Option to enable/disable API cache feature. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Classicendpoints
        Parameter to enable/disable classic endpoints. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER DefaultauthType
        The default authentication server type. Default value: LOCAL Possible values = LOCAL, LDAP, RADIUS, TACACS, CERT
    .PARAMETER DefaultcspHeader
        Parameter to enable/disable default CSP header. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Dynaddr
        Set by the DHCP client when the IP address was fetched dynamically. Default value: OFF Possible values = ON, OFF
    .PARAMETER Enableenhancedauthfeedback
        Enhanced auth feedback provides more information to the end user about the reason for an authentication failure. The default value is set to NO. Default value: NO Possible values = YES, NO
    .PARAMETER Enablesessionstickiness
        Enables/Disables stickiness to authentication servers. Default value: NO Possible values = YES, NO
    .PARAMETER EnablestaticPageCaching
        The default state of VPN Static Page caching. Static Page caching is enabled by default. Default value: YES Possible values = YES, NO
    .PARAMETER Enhancedepa
        Parameter to enable/disable EPA v2 functionality. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER FailedLoginTimeout
        Number of minutes an account will be locked if user exceeds maximum permissible attempts. Minimum value = 1 Maximum value = 525600
    .PARAMETER FtMode
        First time user mode determines which configuration options are shown by default when logging in to the GUI. This setting is controlled by the GUI. Default value: ON Possible values = ON, HA, OFF
    .PARAMETER HTTPOnlyCookie
        Parameter to set/reset HttpOnly Flag for NSC_AAAC/NSC_TMAS cookies in nfactor. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LoginEncryption
        Parameter to encrypt login information for nFactor flow. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER MaxAAAUserS
        Maximum number of concurrent users allowed to log on to VPN simultaneously. Minimum value = 1
    .PARAMETER MaxKbquestions
        This will set maximum number of Questions to be asked for KB Validation. Default value is 2, Max Value is 6. Minimum value = 2 Maximum value = 6
    .PARAMETER MaxLoginAttempts
        Maximum Number of login Attempts. Minimum value = 1
    .PARAMETER MaxSAMLDeflatesize
        This will set the maximum deflate size in case of SAML Redirect binding.
    .PARAMETER PersistentLoginAttempts
        Persistent storage of unsuccessful user login attempts. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Pwdexpirynotificationdays
        This will set the threshold time in days for password expiry notification. Default value is 0, which means no notification is sent.
    .PARAMETER Samesite
        SameSite attribute value for Cookies generated in AAATM context. This attribute value will be appended only for the cookies which are specified in the builtin patset ns_cookies_samesite. Possible values = None, LAX, STRICT
    .PARAMETER Securityinsights
        On enabling this option, the Citrix ADC will send the security insight records to the configured collectors when request comes to Authentication endpoint. * If cs vserver is frontend with Authentication vserver as target for cs action, then record is sent using Authentication vserver name. * If vpn/lb/cs vserver are configured with Authentication ON, then then record is sent using vpn/lb/cs vserver name accordingly. * If authentication vserver is frontend, then record is sent using Authentication vserver name. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER TokenintroSpecTionInterval
        Frequency at which a token must be verified at the Authorization Server (AS) despite being found in cache.
    .PARAMETER Wafprotection
        Entities for which WAF Protection need to be applied. Available settings function as follows: * DEFAULT - AUTH and VPN Protections are enabled. This is the default value for wafProtection * AUTH - Endpoints used for Authentication applicable for both AAATM, IDP, GATEWAY use cases. * VPN - Endpoints used for Gateway use cases. * PORTAL - Endpoints related to web portal. * DISABLED - No Endpoint WAF protection. Currently supported only in default partition. Default value: DEFAULT Possible values = DISABLED, AUTH, VPN, PORTAL, DEFAULT
    .PARAMETER WebViewendpoints
        Parameter to enable/disable webview endpoints. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateAAAParameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAAParameter  -WhatIf
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
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [string] $AAADloglevel,

        [Parameter()]
        [string] $AAADnatip,

        [Parameter()]
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [string] $AAASessionloglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $APITokencache,

        [Parameter()]
        [string] $Classicendpoints,

        [Parameter()]
        [ValidateSet('LOCAL', 'LDAP', 'RADIUS', 'TACACS', 'CERT')]
        [string] $DefaultauthType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DefaultcspHeader,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Dynaddr,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Enableenhancedauthfeedback,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Enablesessionstickiness,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $EnablestaticPageCaching,

        [Parameter()]
        [string] $Enhancedepa,

        [Parameter()]
        [int] $FailedLoginTimeout,

        [Parameter()]
        [ValidateSet('ON', 'HA', 'OFF')]
        [string] $FtMode,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPOnlyCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LoginEncryption,

        [Parameter()]
        [int] $MaxAAAUserS,

        [Parameter()]
        [int] $MaxKbquestions,

        [Parameter()]
        [int] $MaxLoginAttempts,

        [Parameter()]
        [int] $MaxSAMLDeflatesize,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PersistentLoginAttempts,

        [Parameter()]
        [int] $Pwdexpirynotificationdays,

        [Parameter()]
        [ValidateSet('None', 'LAX', 'STRICT')]
        [string] $Samesite,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Securityinsights,

        [Parameter()]
        [int] $TokenintroSpecTionInterval,

        [Parameter()]
        [ValidateSet('DISABLED', 'AUTH', 'VPN', 'PORTAL', 'DEFAULT')]
        [string[]] $Wafprotection,

        [Parameter()]
        [string] $WebViewendpoints,

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

    if ($PSBoundParameters.ContainsKey('Classicendpoints')) {
        Assert-NSParameterValue -ParameterName 'Classicendpoints' -Value $Classicendpoints -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Enhancedepa')) {
        Assert-NSParameterValue -ParameterName 'Enhancedepa' -Value $Enhancedepa -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('WebViewendpoints')) {
        Assert-NSParameterValue -ParameterName 'WebViewendpoints' -Value $WebViewendpoints -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AAADloglevel')) { $properties['aaadloglevel'] = $AAADloglevel }
    if ($PSBoundParameters.ContainsKey('AAADnatip')) { $properties['aaadnatip'] = $AAADnatip }
    if ($PSBoundParameters.ContainsKey('AAASessionloglevel')) { $properties['aaasessionloglevel'] = $AAASessionloglevel }
    if ($PSBoundParameters.ContainsKey('APITokencache')) { $properties['apitokencache'] = $APITokencache }
    if ($PSBoundParameters.ContainsKey('Classicendpoints')) { $properties['classicendpoints'] = $Classicendpoints }
    if ($PSBoundParameters.ContainsKey('DefaultauthType')) { $properties['defaultauthtype'] = $DefaultauthType }
    if ($PSBoundParameters.ContainsKey('DefaultcspHeader')) { $properties['defaultcspheader'] = $DefaultcspHeader }
    if ($PSBoundParameters.ContainsKey('Dynaddr')) { $properties['dynaddr'] = $Dynaddr }
    if ($PSBoundParameters.ContainsKey('Enableenhancedauthfeedback')) { $properties['enableenhancedauthfeedback'] = $Enableenhancedauthfeedback }
    if ($PSBoundParameters.ContainsKey('Enablesessionstickiness')) { $properties['enablesessionstickiness'] = $Enablesessionstickiness }
    if ($PSBoundParameters.ContainsKey('EnablestaticPageCaching')) { $properties['enablestaticpagecaching'] = $EnablestaticPageCaching }
    if ($PSBoundParameters.ContainsKey('Enhancedepa')) { $properties['enhancedepa'] = $Enhancedepa }
    if ($PSBoundParameters.ContainsKey('FailedLoginTimeout')) { $properties['failedlogintimeout'] = $FailedLoginTimeout }
    if ($PSBoundParameters.ContainsKey('FtMode')) { $properties['ftmode'] = $FtMode }
    if ($PSBoundParameters.ContainsKey('HTTPOnlyCookie')) { $properties['httponlycookie'] = $HTTPOnlyCookie }
    if ($PSBoundParameters.ContainsKey('LoginEncryption')) { $properties['loginencryption'] = $LoginEncryption }
    if ($PSBoundParameters.ContainsKey('MaxAAAUserS')) { $properties['maxaaausers'] = $MaxAAAUserS }
    if ($PSBoundParameters.ContainsKey('MaxKbquestions')) { $properties['maxkbquestions'] = $MaxKbquestions }
    if ($PSBoundParameters.ContainsKey('MaxLoginAttempts')) { $properties['maxloginattempts'] = $MaxLoginAttempts }
    if ($PSBoundParameters.ContainsKey('MaxSAMLDeflatesize')) { $properties['maxsamldeflatesize'] = $MaxSAMLDeflatesize }
    if ($PSBoundParameters.ContainsKey('PersistentLoginAttempts')) { $properties['persistentloginattempts'] = $PersistentLoginAttempts }
    if ($PSBoundParameters.ContainsKey('Pwdexpirynotificationdays')) { $properties['pwdexpirynotificationdays'] = $Pwdexpirynotificationdays }
    if ($PSBoundParameters.ContainsKey('Samesite')) { $properties['samesite'] = $Samesite }
    if ($PSBoundParameters.ContainsKey('Securityinsights')) { $properties['securityinsights'] = $Securityinsights }
    if ($PSBoundParameters.ContainsKey('TokenintroSpecTionInterval')) { $properties['tokenintrospectioninterval'] = $TokenintroSpecTionInterval }
    if ($PSBoundParameters.ContainsKey('Wafprotection')) { $properties['wafprotection'] = $Wafprotection }
    if ($PSBoundParameters.ContainsKey('WebViewendpoints')) { $properties['webviewendpoints'] = $WebViewendpoints }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaaparameter', 'Update aaaparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaaparameter -Payload @{ aaaparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAAAParameter

# region Invoke-NSUpdateAAAPreauthenticationAction
function Invoke-NSUpdateAAAPreauthenticationAction {
    <#
    .SYNOPSIS
        Updates a NetScaler aaapreauthenticationaction resource.
    .DESCRIPTION
        Configuration for pre authentication action resource.
    .PARAMETER DefaultepaGroup
        This is the default group that is chosen when the EPA check succeeds. Maximum length = 64
    .PARAMETER DeleteFileS
        String specifying the path(s) and name(s) of the files to be deleted by the endpoint analysis (EPA) tool.
    .PARAMETER KillProcess
        String specifying the name of a process to be terminated by the endpoint analysis (EPA) tool.
    .PARAMETER Name
        Name for the preauthentication action. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after preauthentication action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa action" or 'my aaa action'). Minimum length = 1
    .PARAMETER PreauthenticationAction
        Allow or deny logon after endpoint analysis (EPA) results. Possible values = ALLOW, DENY
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
        Invoke-NSUpdateAAAPreauthenticationAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAAPreauthenticationAction -Name 'example' -WhatIf
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
        [string] $DefaultepaGroup,

        [Parameter()]
        [string] $DeleteFileS,

        [Parameter()]
        [string] $KillProcess,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('ALLOW', 'DENY')]
        [string] $PreauthenticationAction,

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
    if ($PSBoundParameters.ContainsKey('DefaultepaGroup')) { $properties['defaultepagroup'] = $DefaultepaGroup }
    if ($PSBoundParameters.ContainsKey('DeleteFileS')) { $properties['deletefiles'] = $DeleteFileS }
    if ($PSBoundParameters.ContainsKey('KillProcess')) { $properties['killprocess'] = $KillProcess }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PreauthenticationAction')) { $properties['preauthenticationaction'] = $PreauthenticationAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update aaapreauthenticationaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaapreauthenticationaction -Payload @{ aaapreauthenticationaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAPreauthenticationAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAAAPreauthenticationAction

# region Invoke-NSUpdateAAAPreauthenticationParameter
function Invoke-NSUpdateAAAPreauthenticationParameter {
    <#
    .SYNOPSIS
        Updates a NetScaler aaapreauthenticationparameter resource.
    .DESCRIPTION
        Configuration for pre authentication parameter resource.
    .PARAMETER DeleteFileS
        String specifying the path(s) to and name(s) of the files to be deleted by the EPA tool, as a string of between 1 and 1023 characters.
    .PARAMETER KillProcess
        String specifying the name of a process to be terminated by the EPA tool.
    .PARAMETER PreauthenticationAction
        Deny or allow login on the basis of end point analysis results. Possible values = ALLOW, DENY
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, to be evaluated by the EPA tool.
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
        Invoke-NSUpdateAAAPreauthenticationParameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAAPreauthenticationParameter  -WhatIf
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
        [string] $DeleteFileS,

        [Parameter()]
        [string] $KillProcess,

        [Parameter()]
        [ValidateSet('ALLOW', 'DENY')]
        [string] $PreauthenticationAction,

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
    if ($PSBoundParameters.ContainsKey('DeleteFileS')) { $properties['deletefiles'] = $DeleteFileS }
    if ($PSBoundParameters.ContainsKey('KillProcess')) { $properties['killprocess'] = $KillProcess }
    if ($PSBoundParameters.ContainsKey('PreauthenticationAction')) { $properties['preauthenticationaction'] = $PreauthenticationAction }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaapreauthenticationparameter', 'Update aaapreauthenticationparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaapreauthenticationparameter -Payload @{ aaapreauthenticationparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAAAPreauthenticationParameter

# region Invoke-NSUpdateAAAPreauthenticationPolicy
function Invoke-NSUpdateAAAPreauthenticationPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler aaapreauthenticationpolicy resource.
    .DESCRIPTION
        Configuration for pre authentication policy resource.
    .PARAMETER Name
        Name for the preauthentication policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the preauthentication policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER ReqAction
        Name of the action that the policy is to invoke when a connection matches the policy. Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, defining connections that match the policy.
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
        Invoke-NSUpdateAAAPreauthenticationPolicy -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAAPreauthenticationPolicy -Name 'example' -WhatIf
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
        [string] $ReqAction,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ReqAction')) { $properties['reqaction'] = $ReqAction }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update aaapreauthenticationpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaapreauthenticationpolicy -Payload @{ aaapreauthenticationpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAPreauthenticationPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAAAPreauthenticationPolicy

# region Invoke-NSUpdateAAARADIUSParams
function Invoke-NSUpdateAAARADIUSParams {
    <#
    .SYNOPSIS
        Updates a NetScaler aaaradiusparams resource.
    .DESCRIPTION
        Configuration for RADIUS parameter resource.
    .PARAMETER AccountIng
        Configure the RADIUS server state to accept or refuse accounting messages. Possible values = ON, OFF
    .PARAMETER Authentication
        Configure the RADIUS server state to accept or refuse authentication messages. Default value: ON Possible values = ON, OFF
    .PARAMETER Authservretry
        Number of retry by the Citrix ADC before getting response from the RADIUS server. Default value: 3 Minimum value = 1 Maximum value = 10
    .PARAMETER AuthTimeout
        Maximum number of seconds that the Citrix ADC waits for a response from the RADIUS server. Default value: 3 Minimum value = 1
    .PARAMETER Callingstationid
        Send Calling-Station-ID of the client to the RADIUS server. IP Address of the client is sent as its Calling-Station-ID. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER IpattributeType
        IP attribute type in the RADIUS response. Minimum value = 1
    .PARAMETER Ipvendorid
        Vendor ID attribute in the RADIUS response. If the attribute is not vendor-encoded, it is set to 0.
    .PARAMETER MessageAuthenticator
        Control whether the Message-Authenticator attribute is included in a RADIUS Access-Request packet. Default value: ON Possible values = ON, OFF
    .PARAMETER Passencoding
        Enable password encoding in RADIUS packets that the Citrix ADC sends to the RADIUS server. Default value: mschapv2 Possible values = pap, chap, mschapv1, mschapv2
    .PARAMETER PwdattributeType
        Attribute type of the Vendor ID in the RADIUS response. Minimum value = 1
    .PARAMETER Pwdvendorid
        Vendor ID of the password in the RADIUS response. Used to extract the user password. Minimum value = 1
    .PARAMETER RadattributeType
        Attribute type for RADIUS group extraction. Minimum value = 1
    .PARAMETER RadGroupSeparator
        Group separator string that delimits group names within a RADIUS attribute for RADIUS group extraction.
    .PARAMETER RadGroupSprefix
        Prefix string that precedes group names within a RADIUS attribute for RADIUS group extraction.
    .PARAMETER RadKey
        The key shared between the RADIUS server and clients. Required for allowing the Citrix ADC to communicate with the RADIUS server. Minimum length = 1
    .PARAMETER Radnasid
        Send the Network Access Server ID (NASID) for your Citrix ADC to the RADIUS server as the nasid part of the Radius protocol.
    .PARAMETER RadnaSIP
        Send the Citrix ADC IP (NSIP) address to the RADIUS server as the Network Access Server IP (NASIP) part of the Radius protocol. Possible values = ENABLED, DISABLED
    .PARAMETER Radvendorid
        Vendor ID for RADIUS group extraction. Minimum value = 1
    .PARAMETER ServerIp
        IP address of your RADIUS server. Minimum length = 1
    .PARAMETER ServerPort
        Port number on which the RADIUS server listens for connections. Default value: 1812 Minimum value = 1
    .PARAMETER TunnelendpointClientIp
        Send Tunnel Endpoint Client IP address to the RADIUS server. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateAAARADIUSParams -RadKey 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAARADIUSParams -RadKey 'example' -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [string] $AccountIng,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Authentication,

        [Parameter()]
        [int] $Authservretry,

        [Parameter()]
        [int] $AuthTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Callingstationid,

        [Parameter()]
        [string] $DefaultAuthenticationGroup,

        [Parameter()]
        [int] $IpattributeType,

        [Parameter()]
        [int] $Ipvendorid,

        [Parameter()]
        [string] $MessageAuthenticator,

        [Parameter()]
        [ValidateSet('pap', 'chap', 'mschapv1', 'mschapv2')]
        [string] $Passencoding,

        [Parameter()]
        [int] $PwdattributeType,

        [Parameter()]
        [int] $Pwdvendorid,

        [Parameter()]
        [int] $RadattributeType,

        [Parameter()]
        [string] $RadGroupSeparator,

        [Parameter()]
        [string] $RadGroupSprefix,

        [Parameter(Mandatory)]
        [string] $RadKey,

        [Parameter()]
        [string] $Radnasid,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $RadnaSIP,

        [Parameter()]
        [int] $Radvendorid,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $TunnelendpointClientIp,

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

    if ($PSBoundParameters.ContainsKey('MessageAuthenticator')) {
        Assert-NSParameterValue -ParameterName 'MessageAuthenticator' -Value $MessageAuthenticator -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ON', 'OFF') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AccountIng')) { $properties['accounting'] = $AccountIng }
    if ($PSBoundParameters.ContainsKey('Authentication')) { $properties['authentication'] = $Authentication }
    if ($PSBoundParameters.ContainsKey('Authservretry')) { $properties['authservretry'] = $Authservretry }
    if ($PSBoundParameters.ContainsKey('AuthTimeout')) { $properties['authtimeout'] = $AuthTimeout }
    if ($PSBoundParameters.ContainsKey('Callingstationid')) { $properties['callingstationid'] = $Callingstationid }
    if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $properties['defaultauthenticationgroup'] = $DefaultAuthenticationGroup }
    if ($PSBoundParameters.ContainsKey('IpattributeType')) { $properties['ipattributetype'] = $IpattributeType }
    if ($PSBoundParameters.ContainsKey('Ipvendorid')) { $properties['ipvendorid'] = $Ipvendorid }
    if ($PSBoundParameters.ContainsKey('MessageAuthenticator')) { $properties['messageauthenticator'] = $MessageAuthenticator }
    if ($PSBoundParameters.ContainsKey('Passencoding')) { $properties['passencoding'] = $Passencoding }
    if ($PSBoundParameters.ContainsKey('PwdattributeType')) { $properties['pwdattributetype'] = $PwdattributeType }
    if ($PSBoundParameters.ContainsKey('Pwdvendorid')) { $properties['pwdvendorid'] = $Pwdvendorid }
    if ($PSBoundParameters.ContainsKey('RadattributeType')) { $properties['radattributetype'] = $RadattributeType }
    if ($PSBoundParameters.ContainsKey('RadGroupSeparator')) { $properties['radgroupseparator'] = $RadGroupSeparator }
    if ($PSBoundParameters.ContainsKey('RadGroupSprefix')) { $properties['radgroupsprefix'] = $RadGroupSprefix }
    if ($PSBoundParameters.ContainsKey('RadKey')) { $properties['radkey'] = $RadKey }
    if ($PSBoundParameters.ContainsKey('Radnasid')) { $properties['radnasid'] = $Radnasid }
    if ($PSBoundParameters.ContainsKey('RadnaSIP')) { $properties['radnasip'] = $RadnaSIP }
    if ($PSBoundParameters.ContainsKey('Radvendorid')) { $properties['radvendorid'] = $Radvendorid }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('TunnelendpointClientIp')) { $properties['tunnelendpointclientip'] = $TunnelendpointClientIp }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaaradiusparams', 'Update aaaradiusparams')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaaradiusparams -Payload @{ aaaradiusparams = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAAARADIUSParams

# region Invoke-NSUpdateAAASSOProfile
function Invoke-NSUpdateAAASSOProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler aaassoprofile resource.
    .DESCRIPTION
        Configuration for aaa sso profile resource.
    .PARAMETER Name
        Name for the SSO Profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a SSO Profile is created. The following requirement applies only to the NetScaler CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Password
        Password with which the user logs on. Required for Single sign on to external server. Minimum length = 1
    .PARAMETER UserName
        Name for the user. Must begin with a letter, number, or the underscore (_) character, and must contain only alphanumeric, hyphen (-), period (.), hash (#), space ( ), at (@), equal (=), colon (:), and underscore characters. CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my group" or 'my group'). Minimum length = 1
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
        Invoke-NSUpdateAAASSOProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAASSOProfile -Name 'example' -WhatIf
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
        [string] $Password,

        [Parameter()]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Password')) { $properties['password'] = $Password }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update aaassoprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaassoprofile -Payload @{ aaassoprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAASSOProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAAASSOProfile

# region Invoke-NSUpdateAAATacacsparams
function Invoke-NSUpdateAAATacacsparams {
    <#
    .SYNOPSIS
        Updates a NetScaler aaatacacsparams resource.
    .DESCRIPTION
        Configuration for tacacs parameters resource.
    .PARAMETER AccountIng
        Send accounting messages to the TACACS+ server. Possible values = ON, OFF
    .PARAMETER AuditFailedcmds
        The option for sending accounting messages to the TACACS+ server. Possible values = ON, OFF
    .PARAMETER Authorization
        Use streaming authorization on the TACACS+ server. Possible values = ON, OFF
    .PARAMETER AuthTimeout
        Maximum number of seconds that the Citrix ADC waits for a response from the TACACS+ server. Default value: 3 Minimum value = 1
    .PARAMETER DefaultAuthenticationGroup
        This is the default group that is chosen when the authentication succeeds in addition to extracted groups. Maximum length = 64
    .PARAMETER GroupAttrName
        TACACS+ group attribute name.Used for group extraction on the TACACS+ server.
    .PARAMETER ServerIp
        IP address of your TACACS+ server. Minimum length = 1
    .PARAMETER ServerPort
        Port number on which the TACACS+ server listens for connections. Default value: 49 Minimum value = 1
    .PARAMETER Tacacssecret
        Key shared between the TACACS+ server and clients. Required for allowing the Citrix ADC to communicate with the TACACS+ server. Minimum length = 1
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
        Invoke-NSUpdateAAATacacsparams  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAATacacsparams  -WhatIf
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
        [ValidateSet('ON', 'OFF')]
        [string] $AccountIng,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $AuditFailedcmds,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Authorization,

        [Parameter()]
        [int] $AuthTimeout,

        [Parameter()]
        [string] $DefaultAuthenticationGroup,

        [Parameter()]
        [string] $GroupAttrName,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [string] $Tacacssecret,

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
    if ($PSBoundParameters.ContainsKey('AccountIng')) { $properties['accounting'] = $AccountIng }
    if ($PSBoundParameters.ContainsKey('AuditFailedcmds')) { $properties['auditfailedcmds'] = $AuditFailedcmds }
    if ($PSBoundParameters.ContainsKey('Authorization')) { $properties['authorization'] = $Authorization }
    if ($PSBoundParameters.ContainsKey('AuthTimeout')) { $properties['authtimeout'] = $AuthTimeout }
    if ($PSBoundParameters.ContainsKey('DefaultAuthenticationGroup')) { $properties['defaultauthenticationgroup'] = $DefaultAuthenticationGroup }
    if ($PSBoundParameters.ContainsKey('GroupAttrName')) { $properties['groupattrname'] = $GroupAttrName }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('Tacacssecret')) { $properties['tacacssecret'] = $Tacacssecret }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('aaatacacsparams', 'Update aaatacacsparams')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaatacacsparams -Payload @{ aaatacacsparams = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAAATacacsparams

# region Invoke-NSUpdateAAAUser
function Invoke-NSUpdateAAAUser {
    <#
    .SYNOPSIS
        Updates a NetScaler aaauser resource.
    .DESCRIPTION
        Configuration for AAA user resource.
    .PARAMETER Password
        Password with which the user logs on. Required for any user account that does not exist on an external authentication server. If you are not using an external authentication server, all user accounts must have a password. If you are using an external authentication server, you must provide a password for local user accounts that do not exist on the authentication server. Minimum length = 1
    .PARAMETER UserName
        Name for the user. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the user is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my aaa user" or "my aaa user"). Minimum length = 1
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
        Invoke-NSUpdateAAAUser -UserName 'example' -Password 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAAAUser -UserName 'example' -Password 'example' -WhatIf
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
        [string] $Password,

        [Parameter(Mandatory, Position = 0)]
        [string] $UserName,

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
    if ($PSBoundParameters.ContainsKey('Password')) { $properties['password'] = $Password }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$UserName", 'Update aaauser')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type aaauser -Payload @{ aaauser = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAAAUser -UserName $UserName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAAAUser

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAey2zovwz/7r9H
# +hGACBaxykZBQ3xxhgMc+VPRNMYNiqCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCDyGrDZaLdzKs1VaR+xvG8NjxZh1J8g+j3g8FKqr4Nd
# UTANBgkqhkiG9w0BAQEFAASCAYCcTF22qTccrEOnW0iYX0pnbQ6Fp9Ryirw825OR
# QxP3hw6p3n8MaNZb+pUDI96NzHd1FMuLRgTna8In3hBtd4MoIid8RYTuE+w0Pc5o
# K5xzhRnVKTkXWG5tjUrcek64gp4VZJYRMYeRtAE4mkgSkky/Y3fKyjIBdriLrBhv
# LbxhbUZda7t0ukIau7JwAymhizkZ/r+8EwQbojDAzvp3uiD5Y49zHnkwKkqPqklX
# P6X9fidtdysEE3YQkJb2gM5SkaPZUcphCGnPq7C5aUOt/+TtpvUv89iHWrHrM2TB
# DQt8dodtiy/oiGdLkG2A3RmD6VLYrj0yhmqKK0gJq5GWF/kG87PpvB/0ZwBNog7i
# SDFzo7i7wgNC7n1bGVL935YX7/d9VXWvASyJ0Ic+4zWBUkhurBNM4Muq9GjHXy3c
# W9wKVNeg1+eEb9oUWL8+o+3FfFJg2zANsLBfXknelyW80U7mGovcNBgVOIeo0SuY
# ZfOdV1WQ1P7fppXqEdMFgDSWZ6KhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTUzNTZaMD8GCSqGSIb3
# DQEJBDEyBDBot4XRLF/V5yLWrXACOfM7rYpq7o/DdTXqOX34uZD/l3jQAVUjtpGa
# afrMg6nfXE4wDQYJKoZIhvcNAQEBBQAEggIAI9ZIZ1em2lSEQRKFu5kbLmR7Xsyz
# vZxA+7Dl+7kf8bAvGJBPYWJfis7wTBQ+pbOGlsIkB7Ll1kgP9EbKLwwzTWlEmIZV
# a3M0l77OIcjgNOUw7EyEphXQupze0UDmunI0HzuW2Pr3Q5hNTDeZj0z/jCPCoqTv
# DkAAqQmtNz2RUPYFup3TpaL3sjLUg50L1bMhgIifrA5KSimr2abXyrN/83rc2fOY
# sjXk32r9+ll54Iz3lkkPrp17HcFptmaMluCR5vJ21XYwJpfANtxNrzgrmBSgTcIC
# rcwG+1jS1cr9ZLknDgX08maLXKjEG0Oymcq7kh1oKSIhLHIOEZzgCC6qcEzM6s8C
# FGcEd7StC99K1L6otVmZxkZm9u5t4rKAJw+EUOBbgbjJ+UCVLjZer8LzG7OzIvfs
# n4JJJaOwhFeR4u0yRNW4/3AC/EwjVfAjefPyzPsslUN+AeaJgtD7+LfvVkitfAKU
# eejDANU6fmRGXvY75KE1KY585oTpvK8sXq6svdQK1SISaP192BgzouFuc+P3pyWt
# qqbtnRfb+iJjzu30rTZLcfLaK0gyjv4U7tSNlBqGuWeJgsuIrvCZfrw88uFlBwDN
# O8FSYRK7TR/2P7vvfNvSKyVaGBP1v00HB3FAke17ce4Dnn1zquB90qWoMpLqbXL8
# Ca7Qlw2bO+NtY94=
# SIG # End signature block
