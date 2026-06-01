# Generated NetScalerToolkit Configuration bundle for category 'tm'.

# region Invoke-NSAddTMFormSSOAction
function Invoke-NSAddTMFormSSOAction {
    <#
    .SYNOPSIS
        Creates a NetScaler tmformssoaction resource.
    .DESCRIPTION
        Configuration for Form sso action resource.
    .PARAMETER ActionURL
        URL to which the completed form is submitted. Minimum length = 1
    .PARAMETER Name
        Name for the new form-based single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER NameValuepair
        Name-value pair attributes to send to the server in addition to sending the username and password. Value names are separated by an ampersand (&) (for example, name1=value1&name2=value2).
    .PARAMETER NvType
        Type of processing of the name-value pair. If you specify STATIC, the values configured by the administrator are used. For DYNAMIC, the response is parsed, and the form is extracted and then submitted. Default value: DYNAMIC Possible values = STATIC, DYNAMIC
    .PARAMETER PasswdField
        Name of the form field in which the user types in the password. Minimum length = 1
    .PARAMETER ResponseSize
        Number of bytes, in the response, to parse for extracting the forms. Default value: 8096
    .PARAMETER SSOSuccessRule
        Expression, that checks to see if single sign-on is successful.
    .PARAMETER SubmitMethod
        HTTP method used by the single sign-on form to send the logon credentials to the logon server. Applies only to STATIC name-value type. Default value: GET Possible values = GET, POST
    .PARAMETER UserField
        Name of the form field in which the user types in the user ID. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTMFormSSOAction -Name 'example' -ActionURL 'example' -PasswdField 'example' -SSOSuccessRule 'example' -UserField 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddTMFormSSOAction -Name 'example' -ActionURL 'example' -PasswdField 'example' -SSOSuccessRule 'example' -UserField 'example' -WhatIf
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
        [string] $ActionURL,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NameValuepair,

        [Parameter()]
        [ValidateSet('STATIC', 'DYNAMIC')]
        [string] $NvType,

        [Parameter(Mandatory)]
        [string] $PasswdField,

        [Parameter()]
        [int] $ResponseSize,

        [Parameter(Mandatory)]
        [string] $SSOSuccessRule,

        [Parameter()]
        [ValidateSet('GET', 'POST')]
        [string] $SubmitMethod,

        [Parameter(Mandatory)]
        [string] $UserField,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('ActionURL')) { $properties['actionurl'] = $ActionURL }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NameValuepair')) { $properties['namevaluepair'] = $NameValuepair }
    if ($PSBoundParameters.ContainsKey('NvType')) { $properties['nvtype'] = $NvType }
    if ($PSBoundParameters.ContainsKey('PasswdField')) { $properties['passwdfield'] = $PasswdField }
    if ($PSBoundParameters.ContainsKey('ResponseSize')) { $properties['responsesize'] = $ResponseSize }
    if ($PSBoundParameters.ContainsKey('SSOSuccessRule')) { $properties['ssosuccessrule'] = $SSOSuccessRule }
    if ($PSBoundParameters.ContainsKey('SubmitMethod')) { $properties['submitmethod'] = $SubmitMethod }
    if ($PSBoundParameters.ContainsKey('UserField')) { $properties['userfield'] = $UserField }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create tmformssoaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmformssoaction -Payload @{ tmformssoaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMFormSSOAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddTMFormSSOAction

# region Invoke-NSAddTmglobalAuditNSLogPolicyBinding
function Invoke-NSAddTmglobalAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler tmglobal_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to tmglobal.
    .PARAMETER GotoPriorityExpression
        Applicable only to advance tmsession policy. Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Priority
        The priority of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTmglobalAuditNSLogPolicyBinding  -PassThru
    .EXAMPLE
        Invoke-NSAddTmglobalAuditNSLogPolicyBinding  -WhatIf
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
        [string] $PolicyName,

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
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('tmglobal_auditnslogpolicy_binding', 'Create tmglobal_auditnslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmglobal_auditnslogpolicy_binding -Payload @{ tmglobal_auditnslogpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddTmglobalAuditNSLogPolicyBinding

# region Invoke-NSAddTmglobalAuditSyslogPolicyBinding
function Invoke-NSAddTmglobalAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler tmglobal_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to tmglobal.
    .PARAMETER GotoPriorityExpression
        Applicable only to advance tmsession policy. Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Priority
        The priority of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTmglobalAuditSyslogPolicyBinding  -PassThru
    .EXAMPLE
        Invoke-NSAddTmglobalAuditSyslogPolicyBinding  -WhatIf
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
        [string] $PolicyName,

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
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('tmglobal_auditsyslogpolicy_binding', 'Create tmglobal_auditsyslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmglobal_auditsyslogpolicy_binding -Payload @{ tmglobal_auditsyslogpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddTmglobalAuditSyslogPolicyBinding

# region Invoke-NSAddTmglobalTMSessionPolicyBinding
function Invoke-NSAddTmglobalTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler tmglobal_tmsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to tmglobal.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Priority
        The priority of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTmglobalTMSessionPolicyBinding  -PassThru
    .EXAMPLE
        Invoke-NSAddTmglobalTMSessionPolicyBinding  -WhatIf
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
        [string] $PolicyName,

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
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('tmglobal_tmsessionpolicy_binding', 'Create tmglobal_tmsessionpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmglobal_tmsessionpolicy_binding -Payload @{ tmglobal_tmsessionpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddTmglobalTMSessionPolicyBinding

# region Invoke-NSAddTmglobalTMTrafficPolicyBinding
function Invoke-NSAddTmglobalTMTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler tmglobal_tmtrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmtrafficpolicy that can be bound to tmglobal.
    .PARAMETER GotoPriorityExpression
        Applicable only to advance tmsession policy. Expression or other value specifying the next policy to be evaluated if the current policy evaluates to TRUE. Specify one of the following values: * NEXT - Evaluate the policy with the next higher priority number. * END - End policy evaluation. * An expression that evaluates to a number. If you specify an expression, the number to which it evaluates determines the next policy to evaluate, as follows: * If the expression evaluates to a higher numbered priority, the policy with that priority is evaluated next. * If the expression evaluates to the priority of the current policy, the policy with the next higher numbered priority is evaluated next. * If the expression evaluates to a priority number that is numerically higher than the highest numbered priority, policy evaluation ends. An UNDEF event is triggered if: * The expression is invalid. * The expression evaluates to a priority number that is numerically lower than the current policy's priority. * The expression evaluates to a priority number that is between the current policy's priority number (say, 30) and the highest priority number (say, 100), but does not match any configured priority number (for example, the expression evaluates to the number 85). This example assumes that the priority number increments by 10 for every successive policy, and therefore a priority number of 85 does not exist in the policy label.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Priority
        The priority of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTmglobalTMTrafficPolicyBinding  -PassThru
    .EXAMPLE
        Invoke-NSAddTmglobalTMTrafficPolicyBinding  -WhatIf
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
        [string] $PolicyName,

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
    if ($PSBoundParameters.ContainsKey('GotoPriorityExpression')) { $properties['gotopriorityexpression'] = $GotoPriorityExpression }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('tmglobal_tmtrafficpolicy_binding', 'Create tmglobal_tmtrafficpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmglobal_tmtrafficpolicy_binding -Payload @{ tmglobal_tmtrafficpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddTmglobalTMTrafficPolicyBinding

# region Invoke-NSAddTMSAMLSSOProfile
function Invoke-NSAddTMSAMLSSOProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler tmsamlssoprofile resource.
    .DESCRIPTION
        Configuration for SAML sso action resource.
    .PARAMETER AssertionconsumerServiceURL
        URL to which the assertion is to be sent. Minimum length = 1
    .PARAMETER Attribute1
        Name of attribute1 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute10
        Name of attribute10 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute10expr
        Expression that will be evaluated to obtain attribute10's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute10FormAt
        Format of Attribute10 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute10friendlyName
        User-Friendly Name of attribute10 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute11
        Name of attribute11 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute11expr
        Expression that will be evaluated to obtain attribute11's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute11FormAt
        Format of Attribute11 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute11friendlyName
        User-Friendly Name of attribute11 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute12
        Name of attribute12 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute12expr
        Expression that will be evaluated to obtain attribute12's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute12FormAt
        Format of Attribute12 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute12friendlyName
        User-Friendly Name of attribute12 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute13
        Name of attribute13 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute13expr
        Expression that will be evaluated to obtain attribute13's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute13FormAt
        Format of Attribute13 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute13friendlyName
        User-Friendly Name of attribute13 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute14
        Name of attribute14 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute14expr
        Expression that will be evaluated to obtain attribute14's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute14FormAt
        Format of Attribute14 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute14friendlyName
        User-Friendly Name of attribute14 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute15
        Name of attribute15 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute15expr
        Expression that will be evaluated to obtain attribute15's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute15FormAt
        Format of Attribute15 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute15friendlyName
        User-Friendly Name of attribute15 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute16
        Name of attribute16 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute16expr
        Expression that will be evaluated to obtain attribute16's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute16FormAt
        Format of Attribute16 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute16friendlyName
        User-Friendly Name of attribute16 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute1expr
        Expression that will be evaluated to obtain attribute1's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute1FormAt
        Format of Attribute1 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute1friendlyName
        User-Friendly Name of attribute1 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute2
        Name of attribute2 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute2expr
        Expression that will be evaluated to obtain attribute2's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute2FormAt
        Format of Attribute2 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute2friendlyName
        User-Friendly Name of attribute2 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute3
        Name of attribute3 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute3expr
        Expression that will be evaluated to obtain attribute3's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute3FormAt
        Format of Attribute3 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute3friendlyName
        User-Friendly Name of attribute3 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute4
        Name of attribute4 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute4expr
        Expression that will be evaluated to obtain attribute4's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute4FormAt
        Format of Attribute4 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute4friendlyName
        User-Friendly Name of attribute4 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute5
        Name of attribute5 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute5expr
        Expression that will be evaluated to obtain attribute5's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute5FormAt
        Format of Attribute5 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute5friendlyName
        User-Friendly Name of attribute5 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute6
        Name of attribute6 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute6expr
        Expression that will be evaluated to obtain attribute6's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute6FormAt
        Format of Attribute6 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute6friendlyName
        User-Friendly Name of attribute6 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute7
        Name of attribute7 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute7expr
        Expression that will be evaluated to obtain attribute7's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute7FormAt
        Format of Attribute7 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute7friendlyName
        User-Friendly Name of attribute7 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute8
        Name of attribute8 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute8expr
        Expression that will be evaluated to obtain attribute8's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute8FormAt
        Format of Attribute8 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute8friendlyName
        User-Friendly Name of attribute8 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute9
        Name of attribute9 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute9expr
        Expression that will be evaluated to obtain attribute9's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute9FormAt
        Format of Attribute9 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute9friendlyName
        User-Friendly Name of attribute9 that needs to be sent in SAML Assertion.
    .PARAMETER Audience
        Audience for which assertion sent by IdP is applicable. This is typically entity name or url that represents ServiceProvider.
    .PARAMETER DigestMethod
        Algorithm to be used to compute/verify digest for SAML transactions. Default value: SHA256 Possible values = SHA1, SHA256
    .PARAMETER Encryptassertion
        Option to encrypt assertion when Citrix ADC sends one. Default value: OFF Possible values = ON, OFF
    .PARAMETER Encryptionalgorithm
        Algorithm to be used to encrypt SAML assertion. Default value: AES256 Possible values = DES3, AES128, AES192, AES256
    .PARAMETER Name
        Name for the new saml single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER NameIdexpr
        Expression that will be evaluated to obtain NameIdentifier to be sent in assertion. Maximum length = 128
    .PARAMETER NameIdFormAt
        Format of Name Identifier sent in Assertion. Default value: transient Possible values = Unspecified, emailAddress, X509SubjectName, WindowsDomainQualifiedName, kerberos, entity, persistent, transient
    .PARAMETER Relaystaterule
        Expression to extract relaystate to be sent along with assertion. Evaluation of this expression should return TEXT content. This is typically a targ et url to which user is redirected after the recipient validates SAML token.
    .PARAMETER SAMLIssuerName
        The name to be used in requests sent from Citrix ADC to IdP to uniquely identify Citrix ADC. Minimum length = 1
    .PARAMETER SAMLSigningCertName
        Name of the SSL certificate that is used to Sign Assertion. Minimum length = 1
    .PARAMETER SAMLSpCertName
        Name of the SSL certificate of peer/receving party using which Assertion is encrypted. Minimum length = 1
    .PARAMETER Sendpassword
        Option to send password in assertion. Default value: OFF Possible values = ON, OFF
    .PARAMETER Signassertion
        Option to sign portions of assertion when Citrix ADC IDP sends one. Based on the user selection, either Assertion or Response or Both or none can be signed. Default value: ASSERTION Possible values = NONE, ASSERTION, RESPONSE, BOTH
    .PARAMETER SignatureAlg
        Algorithm to be used to sign/verify SAML transactions. Default value: RSA-SHA256 Possible values = RSA-SHA1, RSA-SHA256
    .PARAMETER Skewtime
        This option specifies the number of minutes on either side of current time that the assertion would be valid. For example, if skewTime is 10, then assertion would be valid from (current time - 10) min to (current time + 10) min, ie 20min in all. Default value: 5
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTMSAMLSSOProfile -Name 'example' -AssertionconsumerServiceURL 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddTMSAMLSSOProfile -Name 'example' -AssertionconsumerServiceURL 'example' -WhatIf
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
        [string] $AssertionconsumerServiceURL,

        [Parameter()]
        [string] $Attribute1,

        [Parameter()]
        [string] $Attribute10,

        [Parameter()]
        [string] $Attribute10expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute10FormAt,

        [Parameter()]
        [string] $Attribute10friendlyName,

        [Parameter()]
        [string] $Attribute11,

        [Parameter()]
        [string] $Attribute11expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute11FormAt,

        [Parameter()]
        [string] $Attribute11friendlyName,

        [Parameter()]
        [string] $Attribute12,

        [Parameter()]
        [string] $Attribute12expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute12FormAt,

        [Parameter()]
        [string] $Attribute12friendlyName,

        [Parameter()]
        [string] $Attribute13,

        [Parameter()]
        [string] $Attribute13expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute13FormAt,

        [Parameter()]
        [string] $Attribute13friendlyName,

        [Parameter()]
        [string] $Attribute14,

        [Parameter()]
        [string] $Attribute14expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute14FormAt,

        [Parameter()]
        [string] $Attribute14friendlyName,

        [Parameter()]
        [string] $Attribute15,

        [Parameter()]
        [string] $Attribute15expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute15FormAt,

        [Parameter()]
        [string] $Attribute15friendlyName,

        [Parameter()]
        [string] $Attribute16,

        [Parameter()]
        [string] $Attribute16expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute16FormAt,

        [Parameter()]
        [string] $Attribute16friendlyName,

        [Parameter()]
        [string] $Attribute1expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute1FormAt,

        [Parameter()]
        [string] $Attribute1friendlyName,

        [Parameter()]
        [string] $Attribute2,

        [Parameter()]
        [string] $Attribute2expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute2FormAt,

        [Parameter()]
        [string] $Attribute2friendlyName,

        [Parameter()]
        [string] $Attribute3,

        [Parameter()]
        [string] $Attribute3expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute3FormAt,

        [Parameter()]
        [string] $Attribute3friendlyName,

        [Parameter()]
        [string] $Attribute4,

        [Parameter()]
        [string] $Attribute4expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute4FormAt,

        [Parameter()]
        [string] $Attribute4friendlyName,

        [Parameter()]
        [string] $Attribute5,

        [Parameter()]
        [string] $Attribute5expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute5FormAt,

        [Parameter()]
        [string] $Attribute5friendlyName,

        [Parameter()]
        [string] $Attribute6,

        [Parameter()]
        [string] $Attribute6expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute6FormAt,

        [Parameter()]
        [string] $Attribute6friendlyName,

        [Parameter()]
        [string] $Attribute7,

        [Parameter()]
        [string] $Attribute7expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute7FormAt,

        [Parameter()]
        [string] $Attribute7friendlyName,

        [Parameter()]
        [string] $Attribute8,

        [Parameter()]
        [string] $Attribute8expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute8FormAt,

        [Parameter()]
        [string] $Attribute8friendlyName,

        [Parameter()]
        [string] $Attribute9,

        [Parameter()]
        [string] $Attribute9expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute9FormAt,

        [Parameter()]
        [string] $Attribute9friendlyName,

        [Parameter()]
        [string] $Audience,

        [Parameter()]
        [ValidateSet('SHA1', 'SHA256')]
        [string] $DigestMethod,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Encryptassertion,

        [Parameter()]
        [ValidateSet('DES3', 'AES128', 'AES192', 'AES256')]
        [string] $Encryptionalgorithm,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NameIdexpr,

        [Parameter()]
        [ValidateSet('Unspecified', 'emailAddress', 'X509SubjectName', 'WindowsDomainQualifiedName', 'kerberos', 'entity', 'persistent', 'transient')]
        [string] $NameIdFormAt,

        [Parameter()]
        [string] $Relaystaterule,

        [Parameter()]
        [string] $SAMLIssuerName,

        [Parameter()]
        [string] $SAMLSigningCertName,

        [Parameter()]
        [string] $SAMLSpCertName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Sendpassword,

        [Parameter()]
        [ValidateSet('NONE', 'ASSERTION', 'RESPONSE', 'BOTH')]
        [string] $Signassertion,

        [Parameter()]
        [ValidateSet('RSA-SHA1', 'RSA-SHA256')]
        [string] $SignatureAlg,

        [Parameter()]
        [int] $Skewtime,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('AssertionconsumerServiceURL')) { $properties['assertionconsumerserviceurl'] = $AssertionconsumerServiceURL }
    if ($PSBoundParameters.ContainsKey('Attribute1')) { $properties['attribute1'] = $Attribute1 }
    if ($PSBoundParameters.ContainsKey('Attribute10')) { $properties['attribute10'] = $Attribute10 }
    if ($PSBoundParameters.ContainsKey('Attribute10expr')) { $properties['attribute10expr'] = $Attribute10expr }
    if ($PSBoundParameters.ContainsKey('Attribute10FormAt')) { $properties['attribute10format'] = $Attribute10FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute10friendlyName')) { $properties['attribute10friendlyname'] = $Attribute10friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute11')) { $properties['attribute11'] = $Attribute11 }
    if ($PSBoundParameters.ContainsKey('Attribute11expr')) { $properties['attribute11expr'] = $Attribute11expr }
    if ($PSBoundParameters.ContainsKey('Attribute11FormAt')) { $properties['attribute11format'] = $Attribute11FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute11friendlyName')) { $properties['attribute11friendlyname'] = $Attribute11friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute12')) { $properties['attribute12'] = $Attribute12 }
    if ($PSBoundParameters.ContainsKey('Attribute12expr')) { $properties['attribute12expr'] = $Attribute12expr }
    if ($PSBoundParameters.ContainsKey('Attribute12FormAt')) { $properties['attribute12format'] = $Attribute12FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute12friendlyName')) { $properties['attribute12friendlyname'] = $Attribute12friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute13')) { $properties['attribute13'] = $Attribute13 }
    if ($PSBoundParameters.ContainsKey('Attribute13expr')) { $properties['attribute13expr'] = $Attribute13expr }
    if ($PSBoundParameters.ContainsKey('Attribute13FormAt')) { $properties['attribute13format'] = $Attribute13FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute13friendlyName')) { $properties['attribute13friendlyname'] = $Attribute13friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute14')) { $properties['attribute14'] = $Attribute14 }
    if ($PSBoundParameters.ContainsKey('Attribute14expr')) { $properties['attribute14expr'] = $Attribute14expr }
    if ($PSBoundParameters.ContainsKey('Attribute14FormAt')) { $properties['attribute14format'] = $Attribute14FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute14friendlyName')) { $properties['attribute14friendlyname'] = $Attribute14friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute15')) { $properties['attribute15'] = $Attribute15 }
    if ($PSBoundParameters.ContainsKey('Attribute15expr')) { $properties['attribute15expr'] = $Attribute15expr }
    if ($PSBoundParameters.ContainsKey('Attribute15FormAt')) { $properties['attribute15format'] = $Attribute15FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute15friendlyName')) { $properties['attribute15friendlyname'] = $Attribute15friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute16')) { $properties['attribute16'] = $Attribute16 }
    if ($PSBoundParameters.ContainsKey('Attribute16expr')) { $properties['attribute16expr'] = $Attribute16expr }
    if ($PSBoundParameters.ContainsKey('Attribute16FormAt')) { $properties['attribute16format'] = $Attribute16FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute16friendlyName')) { $properties['attribute16friendlyname'] = $Attribute16friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute1expr')) { $properties['attribute1expr'] = $Attribute1expr }
    if ($PSBoundParameters.ContainsKey('Attribute1FormAt')) { $properties['attribute1format'] = $Attribute1FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute1friendlyName')) { $properties['attribute1friendlyname'] = $Attribute1friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute2')) { $properties['attribute2'] = $Attribute2 }
    if ($PSBoundParameters.ContainsKey('Attribute2expr')) { $properties['attribute2expr'] = $Attribute2expr }
    if ($PSBoundParameters.ContainsKey('Attribute2FormAt')) { $properties['attribute2format'] = $Attribute2FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute2friendlyName')) { $properties['attribute2friendlyname'] = $Attribute2friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute3')) { $properties['attribute3'] = $Attribute3 }
    if ($PSBoundParameters.ContainsKey('Attribute3expr')) { $properties['attribute3expr'] = $Attribute3expr }
    if ($PSBoundParameters.ContainsKey('Attribute3FormAt')) { $properties['attribute3format'] = $Attribute3FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute3friendlyName')) { $properties['attribute3friendlyname'] = $Attribute3friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute4')) { $properties['attribute4'] = $Attribute4 }
    if ($PSBoundParameters.ContainsKey('Attribute4expr')) { $properties['attribute4expr'] = $Attribute4expr }
    if ($PSBoundParameters.ContainsKey('Attribute4FormAt')) { $properties['attribute4format'] = $Attribute4FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute4friendlyName')) { $properties['attribute4friendlyname'] = $Attribute4friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute5')) { $properties['attribute5'] = $Attribute5 }
    if ($PSBoundParameters.ContainsKey('Attribute5expr')) { $properties['attribute5expr'] = $Attribute5expr }
    if ($PSBoundParameters.ContainsKey('Attribute5FormAt')) { $properties['attribute5format'] = $Attribute5FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute5friendlyName')) { $properties['attribute5friendlyname'] = $Attribute5friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute6')) { $properties['attribute6'] = $Attribute6 }
    if ($PSBoundParameters.ContainsKey('Attribute6expr')) { $properties['attribute6expr'] = $Attribute6expr }
    if ($PSBoundParameters.ContainsKey('Attribute6FormAt')) { $properties['attribute6format'] = $Attribute6FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute6friendlyName')) { $properties['attribute6friendlyname'] = $Attribute6friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute7')) { $properties['attribute7'] = $Attribute7 }
    if ($PSBoundParameters.ContainsKey('Attribute7expr')) { $properties['attribute7expr'] = $Attribute7expr }
    if ($PSBoundParameters.ContainsKey('Attribute7FormAt')) { $properties['attribute7format'] = $Attribute7FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute7friendlyName')) { $properties['attribute7friendlyname'] = $Attribute7friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute8')) { $properties['attribute8'] = $Attribute8 }
    if ($PSBoundParameters.ContainsKey('Attribute8expr')) { $properties['attribute8expr'] = $Attribute8expr }
    if ($PSBoundParameters.ContainsKey('Attribute8FormAt')) { $properties['attribute8format'] = $Attribute8FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute8friendlyName')) { $properties['attribute8friendlyname'] = $Attribute8friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute9')) { $properties['attribute9'] = $Attribute9 }
    if ($PSBoundParameters.ContainsKey('Attribute9expr')) { $properties['attribute9expr'] = $Attribute9expr }
    if ($PSBoundParameters.ContainsKey('Attribute9FormAt')) { $properties['attribute9format'] = $Attribute9FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute9friendlyName')) { $properties['attribute9friendlyname'] = $Attribute9friendlyName }
    if ($PSBoundParameters.ContainsKey('Audience')) { $properties['audience'] = $Audience }
    if ($PSBoundParameters.ContainsKey('DigestMethod')) { $properties['digestmethod'] = $DigestMethod }
    if ($PSBoundParameters.ContainsKey('Encryptassertion')) { $properties['encryptassertion'] = $Encryptassertion }
    if ($PSBoundParameters.ContainsKey('Encryptionalgorithm')) { $properties['encryptionalgorithm'] = $Encryptionalgorithm }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NameIdexpr')) { $properties['nameidexpr'] = $NameIdexpr }
    if ($PSBoundParameters.ContainsKey('NameIdFormAt')) { $properties['nameidformat'] = $NameIdFormAt }
    if ($PSBoundParameters.ContainsKey('Relaystaterule')) { $properties['relaystaterule'] = $Relaystaterule }
    if ($PSBoundParameters.ContainsKey('SAMLIssuerName')) { $properties['samlissuername'] = $SAMLIssuerName }
    if ($PSBoundParameters.ContainsKey('SAMLSigningCertName')) { $properties['samlsigningcertname'] = $SAMLSigningCertName }
    if ($PSBoundParameters.ContainsKey('SAMLSpCertName')) { $properties['samlspcertname'] = $SAMLSpCertName }
    if ($PSBoundParameters.ContainsKey('Sendpassword')) { $properties['sendpassword'] = $Sendpassword }
    if ($PSBoundParameters.ContainsKey('Signassertion')) { $properties['signassertion'] = $Signassertion }
    if ($PSBoundParameters.ContainsKey('SignatureAlg')) { $properties['signaturealg'] = $SignatureAlg }
    if ($PSBoundParameters.ContainsKey('Skewtime')) { $properties['skewtime'] = $Skewtime }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create tmsamlssoprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmsamlssoprofile -Payload @{ tmsamlssoprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMSAMLSSOProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddTMSAMLSSOProfile

# region Invoke-NSAddTMSessionAction
function Invoke-NSAddTMSessionAction {
    <#
    .SYNOPSIS
        Creates a NetScaler tmsessionaction resource.
    .DESCRIPTION
        Configuration for TM session action resource.
    .PARAMETER DefaultauthorizationAction
        Allow or deny access to content for which there is no specific authorization policy. Possible values = ALLOW, DENY
    .PARAMETER HomePage
        Web address of the home page that a user is displayed when authentication vserver is bookmarked and used to login.
    .PARAMETER HTTPOnlyCookie
        Allow only an HTTP session cookie, in which case the cookie cannot be accessed by scripts. Default value: YES Possible values = YES, NO
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Minimum length = 1 Maximum length = 32
    .PARAMETER Name
        Name for the session action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a session action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER PersistentCookie
        Enable or disable persistent SSO cookies for the traffic management (TM) session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. This setting is overwritten if a traffic action sets persistent cookie to OFF. Note: If persistent cookie is enabled, make sure you set the persistent cookie validity. Possible values = ON, OFF
    .PARAMETER PersistentCookieValidity
        Integer specifying the number of minutes for which the persistent cookie remains valid. Can be set only if the persistent cookie setting is enabled. Minimum value = 1
    .PARAMETER SessTimeout
        Session timeout, in minutes. If there is no traffic during the timeout period, the user is disconnected and must reauthenticate to access intranet resources. Minimum value = 1
    .PARAMETER SSO
        Use single sign-on (SSO) to log users on to all web applications automatically after they authenticate, or pass users to the web application logon page to authenticate to each application individually. Note that this configuration does not honor the following authentication types for security reason. BASIC, DIGEST, and NTLM (without Negotiate NTLM2 Key or Negotiate Sign Flag). Use TM TrafficAction to configure SSO for these authentication types. Default value: OFF Possible values = ON, OFF
    .PARAMETER SSOCredential
        Use the primary or secondary authentication credentials for single sign-on (SSO). Possible values = PRIMARY, SECONDARY
    .PARAMETER SSODomain
        Domain to use for single sign-on (SSO). Minimum length = 1 Maximum length = 32
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTMSessionAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddTMSessionAction -Name 'example' -WhatIf
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
        [ValidateSet('ALLOW', 'DENY')]
        [string] $DefaultauthorizationAction,

        [Parameter()]
        [string] $HomePage,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HTTPOnlyCookie,

        [Parameter()]
        [string] $KCDAccount,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $PersistentCookie,

        [Parameter()]
        [int] $PersistentCookieValidity,

        [Parameter()]
        [int] $SessTimeout,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SSO,

        [Parameter()]
        [ValidateSet('PRIMARY', 'SECONDARY')]
        [string] $SSOCredential,

        [Parameter()]
        [string] $SSODomain,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('DefaultauthorizationAction')) { $properties['defaultauthorizationaction'] = $DefaultauthorizationAction }
    if ($PSBoundParameters.ContainsKey('HomePage')) { $properties['homepage'] = $HomePage }
    if ($PSBoundParameters.ContainsKey('HTTPOnlyCookie')) { $properties['httponlycookie'] = $HTTPOnlyCookie }
    if ($PSBoundParameters.ContainsKey('KCDAccount')) { $properties['kcdaccount'] = $KCDAccount }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $properties['persistentcookie'] = $PersistentCookie }
    if ($PSBoundParameters.ContainsKey('PersistentCookieValidity')) { $properties['persistentcookievalidity'] = $PersistentCookieValidity }
    if ($PSBoundParameters.ContainsKey('SessTimeout')) { $properties['sesstimeout'] = $SessTimeout }
    if ($PSBoundParameters.ContainsKey('SSO')) { $properties['sso'] = $SSO }
    if ($PSBoundParameters.ContainsKey('SSOCredential')) { $properties['ssocredential'] = $SSOCredential }
    if ($PSBoundParameters.ContainsKey('SSODomain')) { $properties['ssodomain'] = $SSODomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create tmsessionaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmsessionaction -Payload @{ tmsessionaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMSessionAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddTMSessionAction

# region Invoke-NSAddTMSessionPolicy
function Invoke-NSAddTMSessionPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler tmsessionpolicy resource.
    .DESCRIPTION
        Configuration for TM session policy resource.
    .PARAMETER Action
        Action to be applied to connections that match this policy. Minimum length = 1
    .PARAMETER Name
        Name for the session policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a session policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Expression, against which traffic is evaluated. Both classic and advance expressions are supported in default partition but only advance expressions in non-default partition. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTMSessionPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddTMSessionPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create tmsessionpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmsessionpolicy -Payload @{ tmsessionpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMSessionPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddTMSessionPolicy

# region Invoke-NSAddTMTrafficAction
function Invoke-NSAddTMTrafficAction {
    <#
    .SYNOPSIS
        Creates a NetScaler tmtrafficaction resource.
    .DESCRIPTION
        Configuration for TM traffic action resource.
    .PARAMETER AppTimeout
        Time interval, in minutes, of user inactivity after which the connection is closed. Minimum value = 1 Maximum value = 715827
    .PARAMETER ForcedTimeout
        Setting to start, stop or reset TM session force timer. Possible values = START, STOP, RESET
    .PARAMETER ForcedTimeoutVal
        Time interval, in minutes, for which force timer should be set.
    .PARAMETER FormSSOAction
        Name of the configured form-based single sign-on profile.
    .PARAMETER Initiatelogout
        Initiate logout for the traffic management (TM) session if the policy evaluates to true. The session is then terminated after two minutes. Possible values = ON, OFF
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Default value: "None" Minimum length = 1 Maximum length = 32
    .PARAMETER Name
        Name for the traffic action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a traffic action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Passwdexpression
        expression that will be evaluated to obtain password for SingleSignOn. Maximum length = 256
    .PARAMETER PersistentCookie
        Use persistent cookies for the traffic session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. Possible values = ON, OFF
    .PARAMETER SAMLSSOProfile
        Profile to be used for doing SAML SSO to remote relying party. Minimum length = 1
    .PARAMETER SSO
        Use single sign-on for the resource that the user is accessing now. Possible values = ON, OFF
    .PARAMETER UserExpression
        expression that will be evaluated to obtain username for SingleSignOn. Maximum length = 256
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTMTrafficAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddTMTrafficAction -Name 'example' -WhatIf
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
        [int] $AppTimeout,

        [Parameter()]
        [ValidateSet('START', 'STOP', 'RESET')]
        [string] $ForcedTimeout,

        [Parameter()]
        [int] $ForcedTimeoutVal,

        [Parameter()]
        [string] $FormSSOAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Initiatelogout,

        [Parameter()]
        [string] $KCDAccount,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Passwdexpression,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $PersistentCookie,

        [Parameter()]
        [string] $SAMLSSOProfile,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SSO,

        [Parameter()]
        [string] $UserExpression,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('AppTimeout')) { $properties['apptimeout'] = $AppTimeout }
    if ($PSBoundParameters.ContainsKey('ForcedTimeout')) { $properties['forcedtimeout'] = $ForcedTimeout }
    if ($PSBoundParameters.ContainsKey('ForcedTimeoutVal')) { $properties['forcedtimeoutval'] = $ForcedTimeoutVal }
    if ($PSBoundParameters.ContainsKey('FormSSOAction')) { $properties['formssoaction'] = $FormSSOAction }
    if ($PSBoundParameters.ContainsKey('Initiatelogout')) { $properties['initiatelogout'] = $Initiatelogout }
    if ($PSBoundParameters.ContainsKey('KCDAccount')) { $properties['kcdaccount'] = $KCDAccount }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Passwdexpression')) { $properties['passwdexpression'] = $Passwdexpression }
    if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $properties['persistentcookie'] = $PersistentCookie }
    if ($PSBoundParameters.ContainsKey('SAMLSSOProfile')) { $properties['samlssoprofile'] = $SAMLSSOProfile }
    if ($PSBoundParameters.ContainsKey('SSO')) { $properties['sso'] = $SSO }
    if ($PSBoundParameters.ContainsKey('UserExpression')) { $properties['userexpression'] = $UserExpression }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create tmtrafficaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmtrafficaction -Payload @{ tmtrafficaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMTrafficAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddTMTrafficAction

# region Invoke-NSAddTMTrafficPolicy
function Invoke-NSAddTMTrafficPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler tmtrafficpolicy resource.
    .DESCRIPTION
        Configuration for TM traffic policy resource.
    .PARAMETER Action
        Name of the action to apply to requests or connections that match this policy. Minimum length = 1
    .PARAMETER Name
        Name for the traffic policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named expression, or an expression, that the policy uses to determine whether to apply certain action on the current traffic.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddTMTrafficPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddTMTrafficPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create tmtrafficpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmtrafficpolicy -Payload @{ tmtrafficpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMTrafficPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddTMTrafficPolicy

# region Invoke-NSDeleteTMFormSSOAction
function Invoke-NSDeleteTMFormSSOAction {
    <#
    .SYNOPSIS
        Removes a NetScaler tmformssoaction resource.
    .DESCRIPTION
        Configuration for Form sso action resource.
    .PARAMETER Name
        Name for the new form-based single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTMFormSSOAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTMFormSSOAction -Name 'tmformssoaction_example' | Invoke-NSDeleteTMFormSSOAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete tmformssoaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmformssoaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTMFormSSOAction

# region Invoke-NSDeleteTmglobalAuditNSLogPolicyBinding
function Invoke-NSDeleteTmglobalAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler tmglobal_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to tmglobal.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTmglobalAuditNSLogPolicyBinding -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTmglobalAuditNSLogPolicyBinding  | Invoke-NSDeleteTmglobalAuditNSLogPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess('tmglobal_auditnslogpolicy_binding', 'Delete tmglobal_auditnslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmglobal_auditnslogpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTmglobalAuditNSLogPolicyBinding

# region Invoke-NSDeleteTmglobalAuditSyslogPolicyBinding
function Invoke-NSDeleteTmglobalAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler tmglobal_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to tmglobal.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTmglobalAuditSyslogPolicyBinding -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTmglobalAuditSyslogPolicyBinding  | Invoke-NSDeleteTmglobalAuditSyslogPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess('tmglobal_auditsyslogpolicy_binding', 'Delete tmglobal_auditsyslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmglobal_auditsyslogpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTmglobalAuditSyslogPolicyBinding

# region Invoke-NSDeleteTmglobalTMSessionPolicyBinding
function Invoke-NSDeleteTmglobalTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler tmglobal_tmsessionpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to tmglobal.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTmglobalTMSessionPolicyBinding -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTmglobalTMSessionPolicyBinding  | Invoke-NSDeleteTmglobalTMSessionPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess('tmglobal_tmsessionpolicy_binding', 'Delete tmglobal_tmsessionpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmglobal_tmsessionpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTmglobalTMSessionPolicyBinding

# region Invoke-NSDeleteTmglobalTMTrafficPolicyBinding
function Invoke-NSDeleteTmglobalTMTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler tmglobal_tmtrafficpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the tmtrafficpolicy that can be bound to tmglobal.
    .PARAMETER PolicyName
        The name of the policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTmglobalTMTrafficPolicyBinding -PolicyName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTmglobalTMTrafficPolicyBinding  | Invoke-NSDeleteTmglobalTMTrafficPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess('tmglobal_tmtrafficpolicy_binding', 'Delete tmglobal_tmtrafficpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmglobal_tmtrafficpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTmglobalTMTrafficPolicyBinding

# region Invoke-NSDeleteTMSAMLSSOProfile
function Invoke-NSDeleteTMSAMLSSOProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler tmsamlssoprofile resource.
    .DESCRIPTION
        Configuration for SAML sso action resource.
    .PARAMETER Name
        Name for the new saml single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTMSAMLSSOProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTMSAMLSSOProfile -Name 'tmsamlssoprofile_example' | Invoke-NSDeleteTMSAMLSSOProfile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete tmsamlssoprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmsamlssoprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTMSAMLSSOProfile

# region Invoke-NSDeleteTMSessionAction
function Invoke-NSDeleteTMSessionAction {
    <#
    .SYNOPSIS
        Removes a NetScaler tmsessionaction resource.
    .DESCRIPTION
        Configuration for TM session action resource.
    .PARAMETER Name
        Name for the session action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a session action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTMSessionAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTMSessionAction -Name 'tmsessionaction_example' | Invoke-NSDeleteTMSessionAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete tmsessionaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmsessionaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTMSessionAction

# region Invoke-NSDeleteTMSessionPolicy
function Invoke-NSDeleteTMSessionPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler tmsessionpolicy resource.
    .DESCRIPTION
        Configuration for TM session policy resource.
    .PARAMETER Name
        Name for the session policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a session policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTMSessionPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTMSessionPolicy -Name 'tmsessionpolicy_example' | Invoke-NSDeleteTMSessionPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete tmsessionpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmsessionpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTMSessionPolicy

# region Invoke-NSDeleteTMTrafficAction
function Invoke-NSDeleteTMTrafficAction {
    <#
    .SYNOPSIS
        Removes a NetScaler tmtrafficaction resource.
    .DESCRIPTION
        Configuration for TM traffic action resource.
    .PARAMETER Name
        Name for the traffic action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a traffic action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTMTrafficAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTMTrafficAction -Name 'tmtrafficaction_example' | Invoke-NSDeleteTMTrafficAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete tmtrafficaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmtrafficaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTMTrafficAction

# region Invoke-NSDeleteTMTrafficPolicy
function Invoke-NSDeleteTMTrafficPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler tmtrafficpolicy resource.
    .DESCRIPTION
        Configuration for TM traffic policy resource.
    .PARAMETER Name
        Name for the traffic policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteTMTrafficPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicy -Name 'tmtrafficpolicy_example' | Invoke-NSDeleteTMTrafficPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete tmtrafficpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type tmtrafficpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteTMTrafficPolicy

# region Invoke-NSGetTMFormSSOAction
function Invoke-NSGetTMFormSSOAction {
    <#
    .SYNOPSIS
        Gets NetScaler tmformssoaction configuration.
    .DESCRIPTION
        Configuration for Form sso action resource.
    .PARAMETER Name
        Name for the new form-based single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
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
        Invoke-NSGetTMFormSSOAction
    .EXAMPLE
        Invoke-NSGetTMFormSSOAction -Name 'tmformssoaction_example'
    .EXAMPLE
        Invoke-NSGetTMFormSSOAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmformssoaction'
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
# endregion Invoke-NSGetTMFormSSOAction

# region Invoke-NSGetTmglobalAuditNSLogPolicyBinding
function Invoke-NSGetTmglobalAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmglobal_auditnslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to tmglobal.
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
        Invoke-NSGetTmglobalAuditNSLogPolicyBinding
    .EXAMPLE
        Invoke-NSGetTmglobalAuditNSLogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmglobal_auditnslogpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetTmglobalAuditNSLogPolicyBinding

# region Invoke-NSGetTmglobalAuditSyslogPolicyBinding
function Invoke-NSGetTmglobalAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmglobal_auditsyslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to tmglobal.
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
        Invoke-NSGetTmglobalAuditSyslogPolicyBinding
    .EXAMPLE
        Invoke-NSGetTmglobalAuditSyslogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmglobal_auditsyslogpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetTmglobalAuditSyslogPolicyBinding

# region Invoke-NSGetTmglobalBinding
function Invoke-NSGetTmglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to tmglobal.
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
        Invoke-NSGetTmglobalBinding
    .EXAMPLE
        Invoke-NSGetTmglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetTmglobalBinding

# region Invoke-NSGetTmglobalTMSessionPolicyBinding
function Invoke-NSGetTmglobalTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmglobal_tmsessionpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the tmsessionpolicy that can be bound to tmglobal.
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
        Invoke-NSGetTmglobalTMSessionPolicyBinding
    .EXAMPLE
        Invoke-NSGetTmglobalTMSessionPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmglobal_tmsessionpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetTmglobalTMSessionPolicyBinding

# region Invoke-NSGetTmglobalTMTrafficPolicyBinding
function Invoke-NSGetTmglobalTMTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmglobal_tmtrafficpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the tmtrafficpolicy that can be bound to tmglobal.
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
        Invoke-NSGetTmglobalTMTrafficPolicyBinding
    .EXAMPLE
        Invoke-NSGetTmglobalTMTrafficPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmglobal_tmtrafficpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetTmglobalTMTrafficPolicyBinding

# region Invoke-NSGetTMSAMLSSOProfile
function Invoke-NSGetTMSAMLSSOProfile {
    <#
    .SYNOPSIS
        Gets NetScaler tmsamlssoprofile configuration.
    .DESCRIPTION
        Configuration for SAML sso action resource.
    .PARAMETER Name
        Name for the new saml single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
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
        Invoke-NSGetTMSAMLSSOProfile
    .EXAMPLE
        Invoke-NSGetTMSAMLSSOProfile -Name 'tmsamlssoprofile_example'
    .EXAMPLE
        Invoke-NSGetTMSAMLSSOProfile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsamlssoprofile'
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
# endregion Invoke-NSGetTMSAMLSSOProfile

# region Invoke-NSGetTMSessionAction
function Invoke-NSGetTMSessionAction {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionaction configuration.
    .DESCRIPTION
        Configuration for TM session action resource.
    .PARAMETER Name
        Name for the session action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a session action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
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
        Invoke-NSGetTMSessionAction
    .EXAMPLE
        Invoke-NSGetTMSessionAction -Name 'tmsessionaction_example'
    .EXAMPLE
        Invoke-NSGetTMSessionAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionaction'
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
# endregion Invoke-NSGetTMSessionAction

# region Invoke-NSGetTmsessionparameter
function Invoke-NSGetTmsessionparameter {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionparameter configuration.
    .DESCRIPTION
        Configuration for session parameter resource.
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
        Invoke-NSGetTmsessionparameter
    .EXAMPLE
        Invoke-NSGetTmsessionparameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetTmsessionparameter

# region Invoke-NSGetTMSessionPolicy
function Invoke-NSGetTMSessionPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionpolicy configuration.
    .DESCRIPTION
        Configuration for TM session policy resource.
    .PARAMETER Name
        Name for the session policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a session policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
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
        Invoke-NSGetTMSessionPolicy
    .EXAMPLE
        Invoke-NSGetTMSessionPolicy -Name 'tmsessionpolicy_example'
    .EXAMPLE
        Invoke-NSGetTMSessionPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionpolicy'
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
# endregion Invoke-NSGetTMSessionPolicy

# region Invoke-NSGetTMSessionPolicyAAAGroupBinding
function Invoke-NSGetTMSessionPolicyAAAGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionpolicy_aaagroup_binding configuration.
    .DESCRIPTION
        Binding object showing the aaagroup that can be bound to tmsessionpolicy.
    .PARAMETER Name
        Name of the session policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMSessionPolicyAAAGroupBinding
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyAAAGroupBinding -Name 'tmsessionpolicy_aaagroup_binding_example'
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyAAAGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionpolicy_aaagroup_binding'
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
# endregion Invoke-NSGetTMSessionPolicyAAAGroupBinding

# region Invoke-NSGetTMSessionPolicyAAAUserBinding
function Invoke-NSGetTMSessionPolicyAAAUserBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionpolicy_aaauser_binding configuration.
    .DESCRIPTION
        Binding object showing the aaauser that can be bound to tmsessionpolicy.
    .PARAMETER Name
        Name of the session policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMSessionPolicyAAAUserBinding
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyAAAUserBinding -Name 'tmsessionpolicy_aaauser_binding_example'
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyAAAUserBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionpolicy_aaauser_binding'
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
# endregion Invoke-NSGetTMSessionPolicyAAAUserBinding

# region Invoke-NSGetTMSessionPolicyAuthenticationVServerBinding
function Invoke-NSGetTMSessionPolicyAuthenticationVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionpolicy_authenticationvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the authenticationvserver that can be bound to tmsessionpolicy.
    .PARAMETER Name
        Name of the session policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMSessionPolicyAuthenticationVServerBinding
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyAuthenticationVServerBinding -Name 'tmsessionpolicy_authenticationvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyAuthenticationVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionpolicy_authenticationvserver_binding'
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
# endregion Invoke-NSGetTMSessionPolicyAuthenticationVServerBinding

# region Invoke-NSGetTMSessionPolicyBinding
function Invoke-NSGetTMSessionPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to tmsessionpolicy.
    .PARAMETER Name
        Name of the session policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMSessionPolicyBinding
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyBinding -Name 'tmsessionpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionpolicy_binding'
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
# endregion Invoke-NSGetTMSessionPolicyBinding

# region Invoke-NSGetTMSessionPolicyTmglobalBinding
function Invoke-NSGetTMSessionPolicyTmglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmsessionpolicy_tmglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the tmglobal that can be bound to tmsessionpolicy.
    .PARAMETER Name
        Name of the session policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMSessionPolicyTmglobalBinding
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyTmglobalBinding -Name 'tmsessionpolicy_tmglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetTMSessionPolicyTmglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmsessionpolicy_tmglobal_binding'
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
# endregion Invoke-NSGetTMSessionPolicyTmglobalBinding

# region Invoke-NSGetTMTrafficAction
function Invoke-NSGetTMTrafficAction {
    <#
    .SYNOPSIS
        Gets NetScaler tmtrafficaction configuration.
    .DESCRIPTION
        Configuration for TM traffic action resource.
    .PARAMETER Name
        Name for the traffic action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a traffic action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
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
        Invoke-NSGetTMTrafficAction
    .EXAMPLE
        Invoke-NSGetTMTrafficAction -Name 'tmtrafficaction_example'
    .EXAMPLE
        Invoke-NSGetTMTrafficAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmtrafficaction'
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
# endregion Invoke-NSGetTMTrafficAction

# region Invoke-NSGetTMTrafficPolicy
function Invoke-NSGetTMTrafficPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler tmtrafficpolicy configuration.
    .DESCRIPTION
        Configuration for TM traffic policy resource.
    .PARAMETER Name
        Name for the traffic policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
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
        Invoke-NSGetTMTrafficPolicy
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicy -Name 'tmtrafficpolicy_example'
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmtrafficpolicy'
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
# endregion Invoke-NSGetTMTrafficPolicy

# region Invoke-NSGetTMTrafficPolicyBinding
function Invoke-NSGetTMTrafficPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmtrafficpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to tmtrafficpolicy.
    .PARAMETER Name
        Name of the traffic policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMTrafficPolicyBinding
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyBinding -Name 'tmtrafficpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmtrafficpolicy_binding'
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
# endregion Invoke-NSGetTMTrafficPolicyBinding

# region Invoke-NSGetTMTrafficPolicyCSVServerBinding
function Invoke-NSGetTMTrafficPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmtrafficpolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to tmtrafficpolicy.
    .PARAMETER Name
        Name of the traffic policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMTrafficPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyCSVServerBinding -Name 'tmtrafficpolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmtrafficpolicy_csvserver_binding'
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
# endregion Invoke-NSGetTMTrafficPolicyCSVServerBinding

# region Invoke-NSGetTMTrafficPolicyLBVServerBinding
function Invoke-NSGetTMTrafficPolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmtrafficpolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to tmtrafficpolicy.
    .PARAMETER Name
        Name of the traffic policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMTrafficPolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyLBVServerBinding -Name 'tmtrafficpolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmtrafficpolicy_lbvserver_binding'
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
# endregion Invoke-NSGetTMTrafficPolicyLBVServerBinding

# region Invoke-NSGetTMTrafficPolicyTmglobalBinding
function Invoke-NSGetTMTrafficPolicyTmglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler tmtrafficpolicy_tmglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the tmglobal that can be bound to tmtrafficpolicy.
    .PARAMETER Name
        Name of the traffic policy for which to display detailed information. Minimum length = 1
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
        Invoke-NSGetTMTrafficPolicyTmglobalBinding
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyTmglobalBinding -Name 'tmtrafficpolicy_tmglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetTMTrafficPolicyTmglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'tmtrafficpolicy_tmglobal_binding'
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
# endregion Invoke-NSGetTMTrafficPolicyTmglobalBinding

# region Invoke-NSUnsetTMFormSSOAction
function Invoke-NSUnsetTMFormSSOAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler tmformssoaction resource properties.
    .DESCRIPTION
        Configuration for Form sso action resource.
    .PARAMETER Name
        Name for the new form-based single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER NameValuepair
        Name-value pair attributes to send to the server in addition to sending the username and password. Value names are separated by an ampersand (&) (for example, name1=value1&name2=value2).
    .PARAMETER NvType
        Type of processing of the name-value pair. If you specify STATIC, the values configured by the administrator are used. For DYNAMIC, the response is parsed, and the form is extracted and then submitted. Default value: DYNAMIC Possible values = STATIC, DYNAMIC
    .PARAMETER ResponseSize
        Number of bytes, in the response, to parse for extracting the forms. Default value: 8096
    .PARAMETER SubmitMethod
        HTTP method used by the single sign-on form to send the logon credentials to the logon server. Applies only to STATIC name-value type. Default value: GET Possible values = GET, POST
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetTMFormSSOAction -Name 'example' -NameValuepair  -PassThru
    .EXAMPLE
        Invoke-NSUnsetTMFormSSOAction -Name 'example' -NameValuepair  -WhatIf
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
        [switch] $NameValuepair,

        [Parameter()]
        [ValidateSet('STATIC', 'DYNAMIC')]
        [switch] $NvType,

        [Parameter()]
        [switch] $ResponseSize,

        [Parameter()]
        [ValidateSet('GET', 'POST')]
        [switch] $SubmitMethod,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('NameValuepair')) { $body['namevaluepair'] = $true }
        if ($PSBoundParameters.ContainsKey('NvType')) { $body['nvtype'] = $true }
        if ($PSBoundParameters.ContainsKey('ResponseSize')) { $body['responsesize'] = $true }
        if ($PSBoundParameters.ContainsKey('SubmitMethod')) { $body['submitmethod'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear tmformssoaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmformssoaction -Action unset -Payload @{ tmformssoaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetTMFormSSOAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetTMFormSSOAction

# region Invoke-NSUnsetTMSAMLSSOProfile
function Invoke-NSUnsetTMSAMLSSOProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler tmsamlssoprofile resource properties.
    .DESCRIPTION
        Configuration for SAML sso action resource.
    .PARAMETER Name
        Name for the new saml single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Attribute1
        Name of attribute1 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute10
        Name of attribute10 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute10FormAt
        Format of Attribute10 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute10friendlyName
        User-Friendly Name of attribute10 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute11
        Name of attribute11 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute11FormAt
        Format of Attribute11 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute11friendlyName
        User-Friendly Name of attribute11 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute12
        Name of attribute12 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute12FormAt
        Format of Attribute12 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute12friendlyName
        User-Friendly Name of attribute12 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute13
        Name of attribute13 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute13FormAt
        Format of Attribute13 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute13friendlyName
        User-Friendly Name of attribute13 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute14
        Name of attribute14 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute14FormAt
        Format of Attribute14 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute14friendlyName
        User-Friendly Name of attribute14 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute15
        Name of attribute15 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute15FormAt
        Format of Attribute15 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute15friendlyName
        User-Friendly Name of attribute15 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute16
        Name of attribute16 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute16FormAt
        Format of Attribute16 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute16friendlyName
        User-Friendly Name of attribute16 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute1FormAt
        Format of Attribute1 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute1friendlyName
        User-Friendly Name of attribute1 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute2
        Name of attribute2 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute2FormAt
        Format of Attribute2 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute2friendlyName
        User-Friendly Name of attribute2 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute3
        Name of attribute3 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute3FormAt
        Format of Attribute3 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute3friendlyName
        User-Friendly Name of attribute3 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute4
        Name of attribute4 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute4FormAt
        Format of Attribute4 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute4friendlyName
        User-Friendly Name of attribute4 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute5
        Name of attribute5 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute5FormAt
        Format of Attribute5 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute5friendlyName
        User-Friendly Name of attribute5 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute6
        Name of attribute6 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute6FormAt
        Format of Attribute6 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute6friendlyName
        User-Friendly Name of attribute6 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute7
        Name of attribute7 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute7FormAt
        Format of Attribute7 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute7friendlyName
        User-Friendly Name of attribute7 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute8
        Name of attribute8 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute8FormAt
        Format of Attribute8 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute8friendlyName
        User-Friendly Name of attribute8 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute9
        Name of attribute9 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute9FormAt
        Format of Attribute9 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute9friendlyName
        User-Friendly Name of attribute9 that needs to be sent in SAML Assertion.
    .PARAMETER Audience
        Audience for which assertion sent by IdP is applicable. This is typically entity name or url that represents ServiceProvider.
    .PARAMETER DigestMethod
        Algorithm to be used to compute/verify digest for SAML transactions. Default value: SHA256 Possible values = SHA1, SHA256
    .PARAMETER Encryptassertion
        Option to encrypt assertion when Citrix ADC sends one. Default value: OFF Possible values = ON, OFF
    .PARAMETER Encryptionalgorithm
        Algorithm to be used to encrypt SAML assertion. Default value: AES256 Possible values = DES3, AES128, AES192, AES256
    .PARAMETER NameIdexpr
        Expression that will be evaluated to obtain NameIdentifier to be sent in assertion. Maximum length = 128
    .PARAMETER NameIdFormAt
        Format of Name Identifier sent in Assertion. Default value: transient Possible values = Unspecified, emailAddress, X509SubjectName, WindowsDomainQualifiedName, kerberos, entity, persistent, transient
    .PARAMETER Relaystaterule
        Expression to extract relaystate to be sent along with assertion. Evaluation of this expression should return TEXT content. This is typically a targ et url to which user is redirected after the recipient validates SAML token.
    .PARAMETER SAMLIssuerName
        The name to be used in requests sent from Citrix ADC to IdP to uniquely identify Citrix ADC. Minimum length = 1
    .PARAMETER SAMLSigningCertName
        Name of the SSL certificate that is used to Sign Assertion. Minimum length = 1
    .PARAMETER SAMLSpCertName
        Name of the SSL certificate of peer/receving party using which Assertion is encrypted. Minimum length = 1
    .PARAMETER Sendpassword
        Option to send password in assertion. Default value: OFF Possible values = ON, OFF
    .PARAMETER Signassertion
        Option to sign portions of assertion when Citrix ADC IDP sends one. Based on the user selection, either Assertion or Response or Both or none can be signed. Default value: ASSERTION Possible values = NONE, ASSERTION, RESPONSE, BOTH
    .PARAMETER SignatureAlg
        Algorithm to be used to sign/verify SAML transactions. Default value: RSA-SHA256 Possible values = RSA-SHA1, RSA-SHA256
    .PARAMETER Skewtime
        This option specifies the number of minutes on either side of current time that the assertion would be valid. For example, if skewTime is 10, then assertion would be valid from (current time - 10) min to (current time + 10) min, ie 20min in all. Default value: 5
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetTMSAMLSSOProfile -Name 'example' -Attribute1  -PassThru
    .EXAMPLE
        Invoke-NSUnsetTMSAMLSSOProfile -Name 'example' -Attribute1  -WhatIf
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
        [switch] $Attribute1,

        [Parameter()]
        [switch] $Attribute10,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute10FormAt,

        [Parameter()]
        [switch] $Attribute10friendlyName,

        [Parameter()]
        [switch] $Attribute11,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute11FormAt,

        [Parameter()]
        [switch] $Attribute11friendlyName,

        [Parameter()]
        [switch] $Attribute12,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute12FormAt,

        [Parameter()]
        [switch] $Attribute12friendlyName,

        [Parameter()]
        [switch] $Attribute13,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute13FormAt,

        [Parameter()]
        [switch] $Attribute13friendlyName,

        [Parameter()]
        [switch] $Attribute14,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute14FormAt,

        [Parameter()]
        [switch] $Attribute14friendlyName,

        [Parameter()]
        [switch] $Attribute15,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute15FormAt,

        [Parameter()]
        [switch] $Attribute15friendlyName,

        [Parameter()]
        [switch] $Attribute16,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute16FormAt,

        [Parameter()]
        [switch] $Attribute16friendlyName,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute1FormAt,

        [Parameter()]
        [switch] $Attribute1friendlyName,

        [Parameter()]
        [switch] $Attribute2,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute2FormAt,

        [Parameter()]
        [switch] $Attribute2friendlyName,

        [Parameter()]
        [switch] $Attribute3,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute3FormAt,

        [Parameter()]
        [switch] $Attribute3friendlyName,

        [Parameter()]
        [switch] $Attribute4,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute4FormAt,

        [Parameter()]
        [switch] $Attribute4friendlyName,

        [Parameter()]
        [switch] $Attribute5,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute5FormAt,

        [Parameter()]
        [switch] $Attribute5friendlyName,

        [Parameter()]
        [switch] $Attribute6,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute6FormAt,

        [Parameter()]
        [switch] $Attribute6friendlyName,

        [Parameter()]
        [switch] $Attribute7,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute7FormAt,

        [Parameter()]
        [switch] $Attribute7friendlyName,

        [Parameter()]
        [switch] $Attribute8,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute8FormAt,

        [Parameter()]
        [switch] $Attribute8friendlyName,

        [Parameter()]
        [switch] $Attribute9,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [switch] $Attribute9FormAt,

        [Parameter()]
        [switch] $Attribute9friendlyName,

        [Parameter()]
        [switch] $Audience,

        [Parameter()]
        [ValidateSet('SHA1', 'SHA256')]
        [switch] $DigestMethod,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Encryptassertion,

        [Parameter()]
        [ValidateSet('DES3', 'AES128', 'AES192', 'AES256')]
        [switch] $Encryptionalgorithm,

        [Parameter()]
        [switch] $NameIdexpr,

        [Parameter()]
        [ValidateSet('Unspecified', 'emailAddress', 'X509SubjectName', 'WindowsDomainQualifiedName', 'kerberos', 'entity', 'persistent', 'transient')]
        [switch] $NameIdFormAt,

        [Parameter()]
        [switch] $Relaystaterule,

        [Parameter()]
        [switch] $SAMLIssuerName,

        [Parameter()]
        [switch] $SAMLSigningCertName,

        [Parameter()]
        [switch] $SAMLSpCertName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Sendpassword,

        [Parameter()]
        [ValidateSet('NONE', 'ASSERTION', 'RESPONSE', 'BOTH')]
        [switch] $Signassertion,

        [Parameter()]
        [ValidateSet('RSA-SHA1', 'RSA-SHA256')]
        [switch] $SignatureAlg,

        [Parameter()]
        [switch] $Skewtime,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('Attribute1')) { $body['attribute1'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute10')) { $body['attribute10'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute10FormAt')) { $body['attribute10format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute10friendlyName')) { $body['attribute10friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute11')) { $body['attribute11'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute11FormAt')) { $body['attribute11format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute11friendlyName')) { $body['attribute11friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute12')) { $body['attribute12'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute12FormAt')) { $body['attribute12format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute12friendlyName')) { $body['attribute12friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute13')) { $body['attribute13'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute13FormAt')) { $body['attribute13format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute13friendlyName')) { $body['attribute13friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute14')) { $body['attribute14'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute14FormAt')) { $body['attribute14format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute14friendlyName')) { $body['attribute14friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute15')) { $body['attribute15'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute15FormAt')) { $body['attribute15format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute15friendlyName')) { $body['attribute15friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute16')) { $body['attribute16'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute16FormAt')) { $body['attribute16format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute16friendlyName')) { $body['attribute16friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute1FormAt')) { $body['attribute1format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute1friendlyName')) { $body['attribute1friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute2')) { $body['attribute2'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute2FormAt')) { $body['attribute2format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute2friendlyName')) { $body['attribute2friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute3')) { $body['attribute3'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute3FormAt')) { $body['attribute3format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute3friendlyName')) { $body['attribute3friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute4')) { $body['attribute4'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute4FormAt')) { $body['attribute4format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute4friendlyName')) { $body['attribute4friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute5')) { $body['attribute5'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute5FormAt')) { $body['attribute5format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute5friendlyName')) { $body['attribute5friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute6')) { $body['attribute6'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute6FormAt')) { $body['attribute6format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute6friendlyName')) { $body['attribute6friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute7')) { $body['attribute7'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute7FormAt')) { $body['attribute7format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute7friendlyName')) { $body['attribute7friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute8')) { $body['attribute8'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute8FormAt')) { $body['attribute8format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute8friendlyName')) { $body['attribute8friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute9')) { $body['attribute9'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute9FormAt')) { $body['attribute9format'] = $true }
        if ($PSBoundParameters.ContainsKey('Attribute9friendlyName')) { $body['attribute9friendlyname'] = $true }
        if ($PSBoundParameters.ContainsKey('Audience')) { $body['audience'] = $true }
        if ($PSBoundParameters.ContainsKey('DigestMethod')) { $body['digestmethod'] = $true }
        if ($PSBoundParameters.ContainsKey('Encryptassertion')) { $body['encryptassertion'] = $true }
        if ($PSBoundParameters.ContainsKey('Encryptionalgorithm')) { $body['encryptionalgorithm'] = $true }
        if ($PSBoundParameters.ContainsKey('NameIdexpr')) { $body['nameidexpr'] = $true }
        if ($PSBoundParameters.ContainsKey('NameIdFormAt')) { $body['nameidformat'] = $true }
        if ($PSBoundParameters.ContainsKey('Relaystaterule')) { $body['relaystaterule'] = $true }
        if ($PSBoundParameters.ContainsKey('SAMLIssuerName')) { $body['samlissuername'] = $true }
        if ($PSBoundParameters.ContainsKey('SAMLSigningCertName')) { $body['samlsigningcertname'] = $true }
        if ($PSBoundParameters.ContainsKey('SAMLSpCertName')) { $body['samlspcertname'] = $true }
        if ($PSBoundParameters.ContainsKey('Sendpassword')) { $body['sendpassword'] = $true }
        if ($PSBoundParameters.ContainsKey('Signassertion')) { $body['signassertion'] = $true }
        if ($PSBoundParameters.ContainsKey('SignatureAlg')) { $body['signaturealg'] = $true }
        if ($PSBoundParameters.ContainsKey('Skewtime')) { $body['skewtime'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear tmsamlssoprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmsamlssoprofile -Action unset -Payload @{ tmsamlssoprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetTMSAMLSSOProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetTMSAMLSSOProfile

# region Invoke-NSUnsetTMSessionAction
function Invoke-NSUnsetTMSessionAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler tmsessionaction resource properties.
    .DESCRIPTION
        Configuration for TM session action resource.
    .PARAMETER Name
        Name for the session action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a session action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER DefaultauthorizationAction
        Allow or deny access to content for which there is no specific authorization policy. Possible values = ALLOW, DENY
    .PARAMETER HomePage
        Web address of the home page that a user is displayed when authentication vserver is bookmarked and used to login.
    .PARAMETER HTTPOnlyCookie
        Allow only an HTTP session cookie, in which case the cookie cannot be accessed by scripts. Default value: YES Possible values = YES, NO
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Minimum length = 1 Maximum length = 32
    .PARAMETER PersistentCookie
        Enable or disable persistent SSO cookies for the traffic management (TM) session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. This setting is overwritten if a traffic action sets persistent cookie to OFF. Note: If persistent cookie is enabled, make sure you set the persistent cookie validity. Possible values = ON, OFF
    .PARAMETER PersistentCookieValidity
        Integer specifying the number of minutes for which the persistent cookie remains valid. Can be set only if the persistent cookie setting is enabled. Minimum value = 1
    .PARAMETER SessTimeout
        Session timeout, in minutes. If there is no traffic during the timeout period, the user is disconnected and must reauthenticate to access intranet resources. Minimum value = 1
    .PARAMETER SSO
        Use single sign-on (SSO) to log users on to all web applications automatically after they authenticate, or pass users to the web application logon page to authenticate to each application individually. Note that this configuration does not honor the following authentication types for security reason. BASIC, DIGEST, and NTLM (without Negotiate NTLM2 Key or Negotiate Sign Flag). Use TM TrafficAction to configure SSO for these authentication types. Default value: OFF Possible values = ON, OFF
    .PARAMETER SSOCredential
        Use the primary or secondary authentication credentials for single sign-on (SSO). Possible values = PRIMARY, SECONDARY
    .PARAMETER SSODomain
        Domain to use for single sign-on (SSO). Minimum length = 1 Maximum length = 32
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetTMSessionAction -Name 'example' -DefaultauthorizationAction ALLOW -PassThru
    .EXAMPLE
        Invoke-NSUnsetTMSessionAction -Name 'example' -DefaultauthorizationAction ALLOW -WhatIf
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
        [ValidateSet('ALLOW', 'DENY')]
        [switch] $DefaultauthorizationAction,

        [Parameter()]
        [switch] $HomePage,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $HTTPOnlyCookie,

        [Parameter()]
        [switch] $KCDAccount,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $PersistentCookie,

        [Parameter()]
        [switch] $PersistentCookieValidity,

        [Parameter()]
        [switch] $SessTimeout,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $SSO,

        [Parameter()]
        [ValidateSet('PRIMARY', 'SECONDARY')]
        [switch] $SSOCredential,

        [Parameter()]
        [switch] $SSODomain,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('DefaultauthorizationAction')) { $body['defaultauthorizationaction'] = $true }
        if ($PSBoundParameters.ContainsKey('HomePage')) { $body['homepage'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPOnlyCookie')) { $body['httponlycookie'] = $true }
        if ($PSBoundParameters.ContainsKey('KCDAccount')) { $body['kcdaccount'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $body['persistentcookie'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistentCookieValidity')) { $body['persistentcookievalidity'] = $true }
        if ($PSBoundParameters.ContainsKey('SessTimeout')) { $body['sesstimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('SSO')) { $body['sso'] = $true }
        if ($PSBoundParameters.ContainsKey('SSOCredential')) { $body['ssocredential'] = $true }
        if ($PSBoundParameters.ContainsKey('SSODomain')) { $body['ssodomain'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear tmsessionaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmsessionaction -Action unset -Payload @{ tmsessionaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetTMSessionAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetTMSessionAction

# region Invoke-NSUnsetTmsessionparameter
function Invoke-NSUnsetTmsessionparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler tmsessionparameter resource properties.
    .DESCRIPTION
        Configuration for session parameter resource.
    .PARAMETER DefaultauthorizationAction
        Allow or deny access to content for which there is no specific authorization policy. Default value: DENY Possible values = ALLOW, DENY
    .PARAMETER HomePage
        Web address of the home page that a user is displayed when authentication vserver is bookmarked and used to login. Default value: "None"
    .PARAMETER HTTPOnlyCookie
        Allow only an HTTP session cookie, in which case the cookie cannot be accessed by scripts. Default value: YES Possible values = YES, NO
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Minimum length = 1 Maximum length = 32
    .PARAMETER PersistentCookie
        Use persistent SSO cookies for the traffic session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. Default value: OFF Possible values = ON, OFF
    .PARAMETER PersistentCookieValidity
        Integer specifying the number of minutes for which the persistent cookie remains valid. Can be set only if the persistence cookie setting is enabled. Minimum value = 1
    .PARAMETER SessTimeout
        Session timeout, in minutes. If there is no traffic during the timeout period, the user is disconnected and must reauthenticate to access the intranet resources. Default value: 30 Minimum value = 1
    .PARAMETER SSO
        Log users on to all web applications automatically after they authenticate, or pass users to the web application logon page to authenticate for each application. Note that this configuration does not honor the following authentication types for security reason. BASIC, DIGEST, and NTLM (without Negotiate NTLM2 Key or Negotiate Sign Flag). Use TM TrafficAction to configure SSO for these authentication types. Default value: OFF Possible values = ON, OFF
    .PARAMETER SSOCredential
        Use primary or secondary authentication credentials for single sign-on. Default value: PRIMARY Possible values = PRIMARY, SECONDARY
    .PARAMETER SSODomain
        Domain to use for single sign-on. Minimum length = 1 Maximum length = 32
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetTmsessionparameter -DefaultauthorizationAction ALLOW -PassThru
    .EXAMPLE
        Invoke-NSUnsetTmsessionparameter -DefaultauthorizationAction ALLOW -WhatIf
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
        [ValidateSet('ALLOW', 'DENY')]
        [switch] $DefaultauthorizationAction,

        [Parameter()]
        [switch] $HomePage,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $HTTPOnlyCookie,

        [Parameter()]
        [switch] $KCDAccount,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $PersistentCookie,

        [Parameter()]
        [switch] $PersistentCookieValidity,

        [Parameter()]
        [switch] $SessTimeout,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $SSO,

        [Parameter()]
        [ValidateSet('PRIMARY', 'SECONDARY')]
        [switch] $SSOCredential,

        [Parameter()]
        [switch] $SSODomain,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('DefaultauthorizationAction')) { $body['defaultauthorizationaction'] = $true }
        if ($PSBoundParameters.ContainsKey('HomePage')) { $body['homepage'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPOnlyCookie')) { $body['httponlycookie'] = $true }
        if ($PSBoundParameters.ContainsKey('KCDAccount')) { $body['kcdaccount'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $body['persistentcookie'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistentCookieValidity')) { $body['persistentcookievalidity'] = $true }
        if ($PSBoundParameters.ContainsKey('SessTimeout')) { $body['sesstimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('SSO')) { $body['sso'] = $true }
        if ($PSBoundParameters.ContainsKey('SSOCredential')) { $body['ssocredential'] = $true }
        if ($PSBoundParameters.ContainsKey('SSODomain')) { $body['ssodomain'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('tmsessionparameter', 'Clear tmsessionparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmsessionparameter -Action unset -Payload @{ tmsessionparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetTmsessionparameter

# region Invoke-NSUnsetTMSessionPolicy
function Invoke-NSUnsetTMSessionPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler tmsessionpolicy resource properties.
    .DESCRIPTION
        Configuration for TM session policy resource.
    .PARAMETER Name
        Name for the session policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a session policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Action
        Action to be applied to connections that match this policy. Minimum length = 1
    .PARAMETER Rule
        Expression, against which traffic is evaluated. Both classic and advance expressions are supported in default partition but only advance expressions in non-default partition. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetTMSessionPolicy -Name 'example' -Action  -PassThru
    .EXAMPLE
        Invoke-NSUnsetTMSessionPolicy -Name 'example' -Action  -WhatIf
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
        [switch] $Action,

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

        $body = @{ name = $Name }
        if ($PSBoundParameters.ContainsKey('Action')) { $body['action'] = $true }
        if ($PSBoundParameters.ContainsKey('Rule')) { $body['rule'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear tmsessionpolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmsessionpolicy -Action unset -Payload @{ tmsessionpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetTMSessionPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetTMSessionPolicy

# region Invoke-NSUnsetTMTrafficAction
function Invoke-NSUnsetTMTrafficAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler tmtrafficaction resource properties.
    .DESCRIPTION
        Configuration for TM traffic action resource.
    .PARAMETER Name
        Name for the traffic action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a traffic action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER ForcedTimeout
        Setting to start, stop or reset TM session force timer. Possible values = START, STOP, RESET
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Default value: "None" Minimum length = 1 Maximum length = 32
    .PARAMETER Passwdexpression
        expression that will be evaluated to obtain password for SingleSignOn. Maximum length = 256
    .PARAMETER PersistentCookie
        Use persistent cookies for the traffic session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. Possible values = ON, OFF
    .PARAMETER UserExpression
        expression that will be evaluated to obtain username for SingleSignOn. Maximum length = 256
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetTMTrafficAction -Name 'example' -ForcedTimeout START -PassThru
    .EXAMPLE
        Invoke-NSUnsetTMTrafficAction -Name 'example' -ForcedTimeout START -WhatIf
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
        [ValidateSet('START', 'STOP', 'RESET')]
        [switch] $ForcedTimeout,

        [Parameter()]
        [switch] $KCDAccount,

        [Parameter()]
        [switch] $Passwdexpression,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $PersistentCookie,

        [Parameter()]
        [switch] $UserExpression,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('ForcedTimeout')) { $body['forcedtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('KCDAccount')) { $body['kcdaccount'] = $true }
        if ($PSBoundParameters.ContainsKey('Passwdexpression')) { $body['passwdexpression'] = $true }
        if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $body['persistentcookie'] = $true }
        if ($PSBoundParameters.ContainsKey('UserExpression')) { $body['userexpression'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear tmtrafficaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmtrafficaction -Action unset -Payload @{ tmtrafficaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetTMTrafficAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetTMTrafficAction

# region Invoke-NSUnsetTMTrafficPolicy
function Invoke-NSUnsetTMTrafficPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler tmtrafficpolicy resource properties.
    .DESCRIPTION
        Configuration for TM traffic policy resource.
    .PARAMETER Name
        Name for the traffic policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Action
        Name of the action to apply to requests or connections that match this policy. Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named expression, or an expression, that the policy uses to determine whether to apply certain action on the current traffic.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetTMTrafficPolicy -Name 'example' -Action  -PassThru
    .EXAMPLE
        Invoke-NSUnsetTMTrafficPolicy -Name 'example' -Action  -WhatIf
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
        [switch] $Action,

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

        $body = @{ name = $Name }
        if ($PSBoundParameters.ContainsKey('Action')) { $body['action'] = $true }
        if ($PSBoundParameters.ContainsKey('Rule')) { $body['rule'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear tmtrafficpolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type tmtrafficpolicy -Action unset -Payload @{ tmtrafficpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetTMTrafficPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetTMTrafficPolicy

# region Invoke-NSUpdateTMFormSSOAction
function Invoke-NSUpdateTMFormSSOAction {
    <#
    .SYNOPSIS
        Updates a NetScaler tmformssoaction resource.
    .DESCRIPTION
        Configuration for Form sso action resource.
    .PARAMETER ActionURL
        URL to which the completed form is submitted. Minimum length = 1
    .PARAMETER Name
        Name for the new form-based single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER NameValuepair
        Name-value pair attributes to send to the server in addition to sending the username and password. Value names are separated by an ampersand (&) (for example, name1=value1&name2=value2).
    .PARAMETER NvType
        Type of processing of the name-value pair. If you specify STATIC, the values configured by the administrator are used. For DYNAMIC, the response is parsed, and the form is extracted and then submitted. Default value: DYNAMIC Possible values = STATIC, DYNAMIC
    .PARAMETER PasswdField
        Name of the form field in which the user types in the password. Minimum length = 1
    .PARAMETER ResponseSize
        Number of bytes, in the response, to parse for extracting the forms. Default value: 8096
    .PARAMETER SSOSuccessRule
        Expression, that checks to see if single sign-on is successful.
    .PARAMETER SubmitMethod
        HTTP method used by the single sign-on form to send the logon credentials to the logon server. Applies only to STATIC name-value type. Default value: GET Possible values = GET, POST
    .PARAMETER UserField
        Name of the form field in which the user types in the user ID. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateTMFormSSOAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateTMFormSSOAction -Name 'example' -WhatIf
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
        [string] $ActionURL,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NameValuepair,

        [Parameter()]
        [ValidateSet('STATIC', 'DYNAMIC')]
        [string] $NvType,

        [Parameter()]
        [string] $PasswdField,

        [Parameter()]
        [int] $ResponseSize,

        [Parameter()]
        [string] $SSOSuccessRule,

        [Parameter()]
        [ValidateSet('GET', 'POST')]
        [string] $SubmitMethod,

        [Parameter()]
        [string] $UserField,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('ActionURL')) { $properties['actionurl'] = $ActionURL }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NameValuepair')) { $properties['namevaluepair'] = $NameValuepair }
    if ($PSBoundParameters.ContainsKey('NvType')) { $properties['nvtype'] = $NvType }
    if ($PSBoundParameters.ContainsKey('PasswdField')) { $properties['passwdfield'] = $PasswdField }
    if ($PSBoundParameters.ContainsKey('ResponseSize')) { $properties['responsesize'] = $ResponseSize }
    if ($PSBoundParameters.ContainsKey('SSOSuccessRule')) { $properties['ssosuccessrule'] = $SSOSuccessRule }
    if ($PSBoundParameters.ContainsKey('SubmitMethod')) { $properties['submitmethod'] = $SubmitMethod }
    if ($PSBoundParameters.ContainsKey('UserField')) { $properties['userfield'] = $UserField }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update tmformssoaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type tmformssoaction -Payload @{ tmformssoaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMFormSSOAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateTMFormSSOAction

# region Invoke-NSUpdateTMSAMLSSOProfile
function Invoke-NSUpdateTMSAMLSSOProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler tmsamlssoprofile resource.
    .DESCRIPTION
        Configuration for SAML sso action resource.
    .PARAMETER AssertionconsumerServiceURL
        URL to which the assertion is to be sent. Minimum length = 1
    .PARAMETER Attribute1
        Name of attribute1 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute10
        Name of attribute10 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute10expr
        Expression that will be evaluated to obtain attribute10's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute10FormAt
        Format of Attribute10 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute10friendlyName
        User-Friendly Name of attribute10 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute11
        Name of attribute11 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute11expr
        Expression that will be evaluated to obtain attribute11's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute11FormAt
        Format of Attribute11 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute11friendlyName
        User-Friendly Name of attribute11 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute12
        Name of attribute12 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute12expr
        Expression that will be evaluated to obtain attribute12's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute12FormAt
        Format of Attribute12 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute12friendlyName
        User-Friendly Name of attribute12 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute13
        Name of attribute13 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute13expr
        Expression that will be evaluated to obtain attribute13's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute13FormAt
        Format of Attribute13 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute13friendlyName
        User-Friendly Name of attribute13 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute14
        Name of attribute14 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute14expr
        Expression that will be evaluated to obtain attribute14's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute14FormAt
        Format of Attribute14 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute14friendlyName
        User-Friendly Name of attribute14 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute15
        Name of attribute15 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute15expr
        Expression that will be evaluated to obtain attribute15's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute15FormAt
        Format of Attribute15 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute15friendlyName
        User-Friendly Name of attribute15 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute16
        Name of attribute16 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute16expr
        Expression that will be evaluated to obtain attribute16's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute16FormAt
        Format of Attribute16 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute16friendlyName
        User-Friendly Name of attribute16 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute1expr
        Expression that will be evaluated to obtain attribute1's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute1FormAt
        Format of Attribute1 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute1friendlyName
        User-Friendly Name of attribute1 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute2
        Name of attribute2 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute2expr
        Expression that will be evaluated to obtain attribute2's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute2FormAt
        Format of Attribute2 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute2friendlyName
        User-Friendly Name of attribute2 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute3
        Name of attribute3 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute3expr
        Expression that will be evaluated to obtain attribute3's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute3FormAt
        Format of Attribute3 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute3friendlyName
        User-Friendly Name of attribute3 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute4
        Name of attribute4 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute4expr
        Expression that will be evaluated to obtain attribute4's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute4FormAt
        Format of Attribute4 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute4friendlyName
        User-Friendly Name of attribute4 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute5
        Name of attribute5 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute5expr
        Expression that will be evaluated to obtain attribute5's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute5FormAt
        Format of Attribute5 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute5friendlyName
        User-Friendly Name of attribute5 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute6
        Name of attribute6 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute6expr
        Expression that will be evaluated to obtain attribute6's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute6FormAt
        Format of Attribute6 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute6friendlyName
        User-Friendly Name of attribute6 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute7
        Name of attribute7 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute7expr
        Expression that will be evaluated to obtain attribute7's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute7FormAt
        Format of Attribute7 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute7friendlyName
        User-Friendly Name of attribute7 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute8
        Name of attribute8 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute8expr
        Expression that will be evaluated to obtain attribute8's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute8FormAt
        Format of Attribute8 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute8friendlyName
        User-Friendly Name of attribute8 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute9
        Name of attribute9 that needs to be sent in SAML Assertion.
    .PARAMETER Attribute9expr
        Expression that will be evaluated to obtain attribute9's value to be sent in Assertion. Maximum length = 128
    .PARAMETER Attribute9FormAt
        Format of Attribute9 to be sent in Assertion. Possible values = URI, Basic
    .PARAMETER Attribute9friendlyName
        User-Friendly Name of attribute9 that needs to be sent in SAML Assertion.
    .PARAMETER Audience
        Audience for which assertion sent by IdP is applicable. This is typically entity name or url that represents ServiceProvider.
    .PARAMETER DigestMethod
        Algorithm to be used to compute/verify digest for SAML transactions. Default value: SHA256 Possible values = SHA1, SHA256
    .PARAMETER Encryptassertion
        Option to encrypt assertion when Citrix ADC sends one. Default value: OFF Possible values = ON, OFF
    .PARAMETER Encryptionalgorithm
        Algorithm to be used to encrypt SAML assertion. Default value: AES256 Possible values = DES3, AES128, AES192, AES256
    .PARAMETER Name
        Name for the new saml single sign-on profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after an SSO action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER NameIdexpr
        Expression that will be evaluated to obtain NameIdentifier to be sent in assertion. Maximum length = 128
    .PARAMETER NameIdFormAt
        Format of Name Identifier sent in Assertion. Default value: transient Possible values = Unspecified, emailAddress, X509SubjectName, WindowsDomainQualifiedName, kerberos, entity, persistent, transient
    .PARAMETER Relaystaterule
        Expression to extract relaystate to be sent along with assertion. Evaluation of this expression should return TEXT content. This is typically a targ et url to which user is redirected after the recipient validates SAML token.
    .PARAMETER SAMLIssuerName
        The name to be used in requests sent from Citrix ADC to IdP to uniquely identify Citrix ADC. Minimum length = 1
    .PARAMETER SAMLSigningCertName
        Name of the SSL certificate that is used to Sign Assertion. Minimum length = 1
    .PARAMETER SAMLSpCertName
        Name of the SSL certificate of peer/receving party using which Assertion is encrypted. Minimum length = 1
    .PARAMETER Sendpassword
        Option to send password in assertion. Default value: OFF Possible values = ON, OFF
    .PARAMETER Signassertion
        Option to sign portions of assertion when Citrix ADC IDP sends one. Based on the user selection, either Assertion or Response or Both or none can be signed. Default value: ASSERTION Possible values = NONE, ASSERTION, RESPONSE, BOTH
    .PARAMETER SignatureAlg
        Algorithm to be used to sign/verify SAML transactions. Default value: RSA-SHA256 Possible values = RSA-SHA1, RSA-SHA256
    .PARAMETER Skewtime
        This option specifies the number of minutes on either side of current time that the assertion would be valid. For example, if skewTime is 10, then assertion would be valid from (current time - 10) min to (current time + 10) min, ie 20min in all. Default value: 5
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateTMSAMLSSOProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateTMSAMLSSOProfile -Name 'example' -WhatIf
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
        [string] $AssertionconsumerServiceURL,

        [Parameter()]
        [string] $Attribute1,

        [Parameter()]
        [string] $Attribute10,

        [Parameter()]
        [string] $Attribute10expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute10FormAt,

        [Parameter()]
        [string] $Attribute10friendlyName,

        [Parameter()]
        [string] $Attribute11,

        [Parameter()]
        [string] $Attribute11expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute11FormAt,

        [Parameter()]
        [string] $Attribute11friendlyName,

        [Parameter()]
        [string] $Attribute12,

        [Parameter()]
        [string] $Attribute12expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute12FormAt,

        [Parameter()]
        [string] $Attribute12friendlyName,

        [Parameter()]
        [string] $Attribute13,

        [Parameter()]
        [string] $Attribute13expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute13FormAt,

        [Parameter()]
        [string] $Attribute13friendlyName,

        [Parameter()]
        [string] $Attribute14,

        [Parameter()]
        [string] $Attribute14expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute14FormAt,

        [Parameter()]
        [string] $Attribute14friendlyName,

        [Parameter()]
        [string] $Attribute15,

        [Parameter()]
        [string] $Attribute15expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute15FormAt,

        [Parameter()]
        [string] $Attribute15friendlyName,

        [Parameter()]
        [string] $Attribute16,

        [Parameter()]
        [string] $Attribute16expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute16FormAt,

        [Parameter()]
        [string] $Attribute16friendlyName,

        [Parameter()]
        [string] $Attribute1expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute1FormAt,

        [Parameter()]
        [string] $Attribute1friendlyName,

        [Parameter()]
        [string] $Attribute2,

        [Parameter()]
        [string] $Attribute2expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute2FormAt,

        [Parameter()]
        [string] $Attribute2friendlyName,

        [Parameter()]
        [string] $Attribute3,

        [Parameter()]
        [string] $Attribute3expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute3FormAt,

        [Parameter()]
        [string] $Attribute3friendlyName,

        [Parameter()]
        [string] $Attribute4,

        [Parameter()]
        [string] $Attribute4expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute4FormAt,

        [Parameter()]
        [string] $Attribute4friendlyName,

        [Parameter()]
        [string] $Attribute5,

        [Parameter()]
        [string] $Attribute5expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute5FormAt,

        [Parameter()]
        [string] $Attribute5friendlyName,

        [Parameter()]
        [string] $Attribute6,

        [Parameter()]
        [string] $Attribute6expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute6FormAt,

        [Parameter()]
        [string] $Attribute6friendlyName,

        [Parameter()]
        [string] $Attribute7,

        [Parameter()]
        [string] $Attribute7expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute7FormAt,

        [Parameter()]
        [string] $Attribute7friendlyName,

        [Parameter()]
        [string] $Attribute8,

        [Parameter()]
        [string] $Attribute8expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute8FormAt,

        [Parameter()]
        [string] $Attribute8friendlyName,

        [Parameter()]
        [string] $Attribute9,

        [Parameter()]
        [string] $Attribute9expr,

        [Parameter()]
        [ValidateSet('URI', 'Basic')]
        [string] $Attribute9FormAt,

        [Parameter()]
        [string] $Attribute9friendlyName,

        [Parameter()]
        [string] $Audience,

        [Parameter()]
        [ValidateSet('SHA1', 'SHA256')]
        [string] $DigestMethod,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Encryptassertion,

        [Parameter()]
        [ValidateSet('DES3', 'AES128', 'AES192', 'AES256')]
        [string] $Encryptionalgorithm,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NameIdexpr,

        [Parameter()]
        [ValidateSet('Unspecified', 'emailAddress', 'X509SubjectName', 'WindowsDomainQualifiedName', 'kerberos', 'entity', 'persistent', 'transient')]
        [string] $NameIdFormAt,

        [Parameter()]
        [string] $Relaystaterule,

        [Parameter()]
        [string] $SAMLIssuerName,

        [Parameter()]
        [string] $SAMLSigningCertName,

        [Parameter()]
        [string] $SAMLSpCertName,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Sendpassword,

        [Parameter()]
        [ValidateSet('NONE', 'ASSERTION', 'RESPONSE', 'BOTH')]
        [string] $Signassertion,

        [Parameter()]
        [ValidateSet('RSA-SHA1', 'RSA-SHA256')]
        [string] $SignatureAlg,

        [Parameter()]
        [int] $Skewtime,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('AssertionconsumerServiceURL')) { $properties['assertionconsumerserviceurl'] = $AssertionconsumerServiceURL }
    if ($PSBoundParameters.ContainsKey('Attribute1')) { $properties['attribute1'] = $Attribute1 }
    if ($PSBoundParameters.ContainsKey('Attribute10')) { $properties['attribute10'] = $Attribute10 }
    if ($PSBoundParameters.ContainsKey('Attribute10expr')) { $properties['attribute10expr'] = $Attribute10expr }
    if ($PSBoundParameters.ContainsKey('Attribute10FormAt')) { $properties['attribute10format'] = $Attribute10FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute10friendlyName')) { $properties['attribute10friendlyname'] = $Attribute10friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute11')) { $properties['attribute11'] = $Attribute11 }
    if ($PSBoundParameters.ContainsKey('Attribute11expr')) { $properties['attribute11expr'] = $Attribute11expr }
    if ($PSBoundParameters.ContainsKey('Attribute11FormAt')) { $properties['attribute11format'] = $Attribute11FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute11friendlyName')) { $properties['attribute11friendlyname'] = $Attribute11friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute12')) { $properties['attribute12'] = $Attribute12 }
    if ($PSBoundParameters.ContainsKey('Attribute12expr')) { $properties['attribute12expr'] = $Attribute12expr }
    if ($PSBoundParameters.ContainsKey('Attribute12FormAt')) { $properties['attribute12format'] = $Attribute12FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute12friendlyName')) { $properties['attribute12friendlyname'] = $Attribute12friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute13')) { $properties['attribute13'] = $Attribute13 }
    if ($PSBoundParameters.ContainsKey('Attribute13expr')) { $properties['attribute13expr'] = $Attribute13expr }
    if ($PSBoundParameters.ContainsKey('Attribute13FormAt')) { $properties['attribute13format'] = $Attribute13FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute13friendlyName')) { $properties['attribute13friendlyname'] = $Attribute13friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute14')) { $properties['attribute14'] = $Attribute14 }
    if ($PSBoundParameters.ContainsKey('Attribute14expr')) { $properties['attribute14expr'] = $Attribute14expr }
    if ($PSBoundParameters.ContainsKey('Attribute14FormAt')) { $properties['attribute14format'] = $Attribute14FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute14friendlyName')) { $properties['attribute14friendlyname'] = $Attribute14friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute15')) { $properties['attribute15'] = $Attribute15 }
    if ($PSBoundParameters.ContainsKey('Attribute15expr')) { $properties['attribute15expr'] = $Attribute15expr }
    if ($PSBoundParameters.ContainsKey('Attribute15FormAt')) { $properties['attribute15format'] = $Attribute15FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute15friendlyName')) { $properties['attribute15friendlyname'] = $Attribute15friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute16')) { $properties['attribute16'] = $Attribute16 }
    if ($PSBoundParameters.ContainsKey('Attribute16expr')) { $properties['attribute16expr'] = $Attribute16expr }
    if ($PSBoundParameters.ContainsKey('Attribute16FormAt')) { $properties['attribute16format'] = $Attribute16FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute16friendlyName')) { $properties['attribute16friendlyname'] = $Attribute16friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute1expr')) { $properties['attribute1expr'] = $Attribute1expr }
    if ($PSBoundParameters.ContainsKey('Attribute1FormAt')) { $properties['attribute1format'] = $Attribute1FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute1friendlyName')) { $properties['attribute1friendlyname'] = $Attribute1friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute2')) { $properties['attribute2'] = $Attribute2 }
    if ($PSBoundParameters.ContainsKey('Attribute2expr')) { $properties['attribute2expr'] = $Attribute2expr }
    if ($PSBoundParameters.ContainsKey('Attribute2FormAt')) { $properties['attribute2format'] = $Attribute2FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute2friendlyName')) { $properties['attribute2friendlyname'] = $Attribute2friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute3')) { $properties['attribute3'] = $Attribute3 }
    if ($PSBoundParameters.ContainsKey('Attribute3expr')) { $properties['attribute3expr'] = $Attribute3expr }
    if ($PSBoundParameters.ContainsKey('Attribute3FormAt')) { $properties['attribute3format'] = $Attribute3FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute3friendlyName')) { $properties['attribute3friendlyname'] = $Attribute3friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute4')) { $properties['attribute4'] = $Attribute4 }
    if ($PSBoundParameters.ContainsKey('Attribute4expr')) { $properties['attribute4expr'] = $Attribute4expr }
    if ($PSBoundParameters.ContainsKey('Attribute4FormAt')) { $properties['attribute4format'] = $Attribute4FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute4friendlyName')) { $properties['attribute4friendlyname'] = $Attribute4friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute5')) { $properties['attribute5'] = $Attribute5 }
    if ($PSBoundParameters.ContainsKey('Attribute5expr')) { $properties['attribute5expr'] = $Attribute5expr }
    if ($PSBoundParameters.ContainsKey('Attribute5FormAt')) { $properties['attribute5format'] = $Attribute5FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute5friendlyName')) { $properties['attribute5friendlyname'] = $Attribute5friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute6')) { $properties['attribute6'] = $Attribute6 }
    if ($PSBoundParameters.ContainsKey('Attribute6expr')) { $properties['attribute6expr'] = $Attribute6expr }
    if ($PSBoundParameters.ContainsKey('Attribute6FormAt')) { $properties['attribute6format'] = $Attribute6FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute6friendlyName')) { $properties['attribute6friendlyname'] = $Attribute6friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute7')) { $properties['attribute7'] = $Attribute7 }
    if ($PSBoundParameters.ContainsKey('Attribute7expr')) { $properties['attribute7expr'] = $Attribute7expr }
    if ($PSBoundParameters.ContainsKey('Attribute7FormAt')) { $properties['attribute7format'] = $Attribute7FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute7friendlyName')) { $properties['attribute7friendlyname'] = $Attribute7friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute8')) { $properties['attribute8'] = $Attribute8 }
    if ($PSBoundParameters.ContainsKey('Attribute8expr')) { $properties['attribute8expr'] = $Attribute8expr }
    if ($PSBoundParameters.ContainsKey('Attribute8FormAt')) { $properties['attribute8format'] = $Attribute8FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute8friendlyName')) { $properties['attribute8friendlyname'] = $Attribute8friendlyName }
    if ($PSBoundParameters.ContainsKey('Attribute9')) { $properties['attribute9'] = $Attribute9 }
    if ($PSBoundParameters.ContainsKey('Attribute9expr')) { $properties['attribute9expr'] = $Attribute9expr }
    if ($PSBoundParameters.ContainsKey('Attribute9FormAt')) { $properties['attribute9format'] = $Attribute9FormAt }
    if ($PSBoundParameters.ContainsKey('Attribute9friendlyName')) { $properties['attribute9friendlyname'] = $Attribute9friendlyName }
    if ($PSBoundParameters.ContainsKey('Audience')) { $properties['audience'] = $Audience }
    if ($PSBoundParameters.ContainsKey('DigestMethod')) { $properties['digestmethod'] = $DigestMethod }
    if ($PSBoundParameters.ContainsKey('Encryptassertion')) { $properties['encryptassertion'] = $Encryptassertion }
    if ($PSBoundParameters.ContainsKey('Encryptionalgorithm')) { $properties['encryptionalgorithm'] = $Encryptionalgorithm }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NameIdexpr')) { $properties['nameidexpr'] = $NameIdexpr }
    if ($PSBoundParameters.ContainsKey('NameIdFormAt')) { $properties['nameidformat'] = $NameIdFormAt }
    if ($PSBoundParameters.ContainsKey('Relaystaterule')) { $properties['relaystaterule'] = $Relaystaterule }
    if ($PSBoundParameters.ContainsKey('SAMLIssuerName')) { $properties['samlissuername'] = $SAMLIssuerName }
    if ($PSBoundParameters.ContainsKey('SAMLSigningCertName')) { $properties['samlsigningcertname'] = $SAMLSigningCertName }
    if ($PSBoundParameters.ContainsKey('SAMLSpCertName')) { $properties['samlspcertname'] = $SAMLSpCertName }
    if ($PSBoundParameters.ContainsKey('Sendpassword')) { $properties['sendpassword'] = $Sendpassword }
    if ($PSBoundParameters.ContainsKey('Signassertion')) { $properties['signassertion'] = $Signassertion }
    if ($PSBoundParameters.ContainsKey('SignatureAlg')) { $properties['signaturealg'] = $SignatureAlg }
    if ($PSBoundParameters.ContainsKey('Skewtime')) { $properties['skewtime'] = $Skewtime }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update tmsamlssoprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type tmsamlssoprofile -Payload @{ tmsamlssoprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMSAMLSSOProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateTMSAMLSSOProfile

# region Invoke-NSUpdateTMSessionAction
function Invoke-NSUpdateTMSessionAction {
    <#
    .SYNOPSIS
        Updates a NetScaler tmsessionaction resource.
    .DESCRIPTION
        Configuration for TM session action resource.
    .PARAMETER DefaultauthorizationAction
        Allow or deny access to content for which there is no specific authorization policy. Possible values = ALLOW, DENY
    .PARAMETER HomePage
        Web address of the home page that a user is displayed when authentication vserver is bookmarked and used to login.
    .PARAMETER HTTPOnlyCookie
        Allow only an HTTP session cookie, in which case the cookie cannot be accessed by scripts. Default value: YES Possible values = YES, NO
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Minimum length = 1 Maximum length = 32
    .PARAMETER Name
        Name for the session action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a session action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER PersistentCookie
        Enable or disable persistent SSO cookies for the traffic management (TM) session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. This setting is overwritten if a traffic action sets persistent cookie to OFF. Note: If persistent cookie is enabled, make sure you set the persistent cookie validity. Possible values = ON, OFF
    .PARAMETER PersistentCookieValidity
        Integer specifying the number of minutes for which the persistent cookie remains valid. Can be set only if the persistent cookie setting is enabled. Minimum value = 1
    .PARAMETER SessTimeout
        Session timeout, in minutes. If there is no traffic during the timeout period, the user is disconnected and must reauthenticate to access intranet resources. Minimum value = 1
    .PARAMETER SSO
        Use single sign-on (SSO) to log users on to all web applications automatically after they authenticate, or pass users to the web application logon page to authenticate to each application individually. Note that this configuration does not honor the following authentication types for security reason. BASIC, DIGEST, and NTLM (without Negotiate NTLM2 Key or Negotiate Sign Flag). Use TM TrafficAction to configure SSO for these authentication types. Default value: OFF Possible values = ON, OFF
    .PARAMETER SSOCredential
        Use the primary or secondary authentication credentials for single sign-on (SSO). Possible values = PRIMARY, SECONDARY
    .PARAMETER SSODomain
        Domain to use for single sign-on (SSO). Minimum length = 1 Maximum length = 32
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateTMSessionAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateTMSessionAction -Name 'example' -WhatIf
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
        [ValidateSet('ALLOW', 'DENY')]
        [string] $DefaultauthorizationAction,

        [Parameter()]
        [string] $HomePage,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HTTPOnlyCookie,

        [Parameter()]
        [string] $KCDAccount,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $PersistentCookie,

        [Parameter()]
        [int] $PersistentCookieValidity,

        [Parameter()]
        [int] $SessTimeout,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SSO,

        [Parameter()]
        [ValidateSet('PRIMARY', 'SECONDARY')]
        [string] $SSOCredential,

        [Parameter()]
        [string] $SSODomain,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('DefaultauthorizationAction')) { $properties['defaultauthorizationaction'] = $DefaultauthorizationAction }
    if ($PSBoundParameters.ContainsKey('HomePage')) { $properties['homepage'] = $HomePage }
    if ($PSBoundParameters.ContainsKey('HTTPOnlyCookie')) { $properties['httponlycookie'] = $HTTPOnlyCookie }
    if ($PSBoundParameters.ContainsKey('KCDAccount')) { $properties['kcdaccount'] = $KCDAccount }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $properties['persistentcookie'] = $PersistentCookie }
    if ($PSBoundParameters.ContainsKey('PersistentCookieValidity')) { $properties['persistentcookievalidity'] = $PersistentCookieValidity }
    if ($PSBoundParameters.ContainsKey('SessTimeout')) { $properties['sesstimeout'] = $SessTimeout }
    if ($PSBoundParameters.ContainsKey('SSO')) { $properties['sso'] = $SSO }
    if ($PSBoundParameters.ContainsKey('SSOCredential')) { $properties['ssocredential'] = $SSOCredential }
    if ($PSBoundParameters.ContainsKey('SSODomain')) { $properties['ssodomain'] = $SSODomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update tmsessionaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type tmsessionaction -Payload @{ tmsessionaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMSessionAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateTMSessionAction

# region Invoke-NSUpdateTmsessionparameter
function Invoke-NSUpdateTmsessionparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler tmsessionparameter resource.
    .DESCRIPTION
        Configuration for session parameter resource.
    .PARAMETER DefaultauthorizationAction
        Allow or deny access to content for which there is no specific authorization policy. Default value: DENY Possible values = ALLOW, DENY
    .PARAMETER HomePage
        Web address of the home page that a user is displayed when authentication vserver is bookmarked and used to login. Default value: "None"
    .PARAMETER HTTPOnlyCookie
        Allow only an HTTP session cookie, in which case the cookie cannot be accessed by scripts. Default value: YES Possible values = YES, NO
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Minimum length = 1 Maximum length = 32
    .PARAMETER PersistentCookie
        Use persistent SSO cookies for the traffic session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. Default value: OFF Possible values = ON, OFF
    .PARAMETER PersistentCookieValidity
        Integer specifying the number of minutes for which the persistent cookie remains valid. Can be set only if the persistence cookie setting is enabled. Minimum value = 1
    .PARAMETER SessTimeout
        Session timeout, in minutes. If there is no traffic during the timeout period, the user is disconnected and must reauthenticate to access the intranet resources. Default value: 30 Minimum value = 1
    .PARAMETER SSO
        Log users on to all web applications automatically after they authenticate, or pass users to the web application logon page to authenticate for each application. Note that this configuration does not honor the following authentication types for security reason. BASIC, DIGEST, and NTLM (without Negotiate NTLM2 Key or Negotiate Sign Flag). Use TM TrafficAction to configure SSO for these authentication types. Default value: OFF Possible values = ON, OFF
    .PARAMETER SSOCredential
        Use primary or secondary authentication credentials for single sign-on. Default value: PRIMARY Possible values = PRIMARY, SECONDARY
    .PARAMETER SSODomain
        Domain to use for single sign-on. Minimum length = 1 Maximum length = 32
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateTmsessionparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateTmsessionparameter  -WhatIf
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
        [ValidateSet('ALLOW', 'DENY')]
        [string] $DefaultauthorizationAction,

        [Parameter()]
        [string] $HomePage,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $HTTPOnlyCookie,

        [Parameter()]
        [string] $KCDAccount,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $PersistentCookie,

        [Parameter()]
        [int] $PersistentCookieValidity,

        [Parameter()]
        [int] $SessTimeout,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SSO,

        [Parameter()]
        [ValidateSet('PRIMARY', 'SECONDARY')]
        [string] $SSOCredential,

        [Parameter()]
        [string] $SSODomain,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('DefaultauthorizationAction')) { $properties['defaultauthorizationaction'] = $DefaultauthorizationAction }
    if ($PSBoundParameters.ContainsKey('HomePage')) { $properties['homepage'] = $HomePage }
    if ($PSBoundParameters.ContainsKey('HTTPOnlyCookie')) { $properties['httponlycookie'] = $HTTPOnlyCookie }
    if ($PSBoundParameters.ContainsKey('KCDAccount')) { $properties['kcdaccount'] = $KCDAccount }
    if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $properties['persistentcookie'] = $PersistentCookie }
    if ($PSBoundParameters.ContainsKey('PersistentCookieValidity')) { $properties['persistentcookievalidity'] = $PersistentCookieValidity }
    if ($PSBoundParameters.ContainsKey('SessTimeout')) { $properties['sesstimeout'] = $SessTimeout }
    if ($PSBoundParameters.ContainsKey('SSO')) { $properties['sso'] = $SSO }
    if ($PSBoundParameters.ContainsKey('SSOCredential')) { $properties['ssocredential'] = $SSOCredential }
    if ($PSBoundParameters.ContainsKey('SSODomain')) { $properties['ssodomain'] = $SSODomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('tmsessionparameter', 'Update tmsessionparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type tmsessionparameter -Payload @{ tmsessionparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateTmsessionparameter

# region Invoke-NSUpdateTMSessionPolicy
function Invoke-NSUpdateTMSessionPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler tmsessionpolicy resource.
    .DESCRIPTION
        Configuration for TM session policy resource.
    .PARAMETER Action
        Action to be applied to connections that match this policy. Minimum length = 1
    .PARAMETER Name
        Name for the session policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters. Cannot be changed after a session policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Expression, against which traffic is evaluated. Both classic and advance expressions are supported in default partition but only advance expressions in non-default partition. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateTMSessionPolicy -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateTMSessionPolicy -Name 'example' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update tmsessionpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type tmsessionpolicy -Payload @{ tmsessionpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMSessionPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateTMSessionPolicy

# region Invoke-NSUpdateTMTrafficAction
function Invoke-NSUpdateTMTrafficAction {
    <#
    .SYNOPSIS
        Updates a NetScaler tmtrafficaction resource.
    .DESCRIPTION
        Configuration for TM traffic action resource.
    .PARAMETER AppTimeout
        Time interval, in minutes, of user inactivity after which the connection is closed. Minimum value = 1 Maximum value = 715827
    .PARAMETER ForcedTimeout
        Setting to start, stop or reset TM session force timer. Possible values = START, STOP, RESET
    .PARAMETER ForcedTimeoutVal
        Time interval, in minutes, for which force timer should be set.
    .PARAMETER FormSSOAction
        Name of the configured form-based single sign-on profile.
    .PARAMETER Initiatelogout
        Initiate logout for the traffic management (TM) session if the policy evaluates to true. The session is then terminated after two minutes. Possible values = ON, OFF
    .PARAMETER KCDAccount
        Kerberos constrained delegation account name. Default value: "None" Minimum length = 1 Maximum length = 32
    .PARAMETER Name
        Name for the traffic action. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after a traffic action is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action'). Minimum length = 1
    .PARAMETER Passwdexpression
        expression that will be evaluated to obtain password for SingleSignOn. Maximum length = 256
    .PARAMETER PersistentCookie
        Use persistent cookies for the traffic session. A persistent cookie remains on the user device and is sent with each HTTP request. The cookie becomes stale if the session ends. Possible values = ON, OFF
    .PARAMETER SAMLSSOProfile
        Profile to be used for doing SAML SSO to remote relying party. Minimum length = 1
    .PARAMETER SSO
        Use single sign-on for the resource that the user is accessing now. Possible values = ON, OFF
    .PARAMETER UserExpression
        expression that will be evaluated to obtain username for SingleSignOn. Maximum length = 256
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateTMTrafficAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateTMTrafficAction -Name 'example' -WhatIf
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
        [int] $AppTimeout,

        [Parameter()]
        [ValidateSet('START', 'STOP', 'RESET')]
        [string] $ForcedTimeout,

        [Parameter()]
        [int] $ForcedTimeoutVal,

        [Parameter()]
        [string] $FormSSOAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Initiatelogout,

        [Parameter()]
        [string] $KCDAccount,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Passwdexpression,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $PersistentCookie,

        [Parameter()]
        [string] $SAMLSSOProfile,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SSO,

        [Parameter()]
        [string] $UserExpression,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('AppTimeout')) { $properties['apptimeout'] = $AppTimeout }
    if ($PSBoundParameters.ContainsKey('ForcedTimeout')) { $properties['forcedtimeout'] = $ForcedTimeout }
    if ($PSBoundParameters.ContainsKey('ForcedTimeoutVal')) { $properties['forcedtimeoutval'] = $ForcedTimeoutVal }
    if ($PSBoundParameters.ContainsKey('FormSSOAction')) { $properties['formssoaction'] = $FormSSOAction }
    if ($PSBoundParameters.ContainsKey('Initiatelogout')) { $properties['initiatelogout'] = $Initiatelogout }
    if ($PSBoundParameters.ContainsKey('KCDAccount')) { $properties['kcdaccount'] = $KCDAccount }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Passwdexpression')) { $properties['passwdexpression'] = $Passwdexpression }
    if ($PSBoundParameters.ContainsKey('PersistentCookie')) { $properties['persistentcookie'] = $PersistentCookie }
    if ($PSBoundParameters.ContainsKey('SAMLSSOProfile')) { $properties['samlssoprofile'] = $SAMLSSOProfile }
    if ($PSBoundParameters.ContainsKey('SSO')) { $properties['sso'] = $SSO }
    if ($PSBoundParameters.ContainsKey('UserExpression')) { $properties['userexpression'] = $UserExpression }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update tmtrafficaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type tmtrafficaction -Payload @{ tmtrafficaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMTrafficAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateTMTrafficAction

# region Invoke-NSUpdateTMTrafficPolicy
function Invoke-NSUpdateTMTrafficPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler tmtrafficpolicy resource.
    .DESCRIPTION
        Configuration for TM traffic policy resource.
    .PARAMETER Action
        Name of the action to apply to requests or connections that match this policy. Minimum length = 1
    .PARAMETER Name
        Name for the traffic policy. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the policy is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policy" or 'my policy'). Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named expression, or an expression, that the policy uses to determine whether to apply certain action on the current traffic.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateTMTrafficPolicy -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateTMTrafficPolicy -Name 'example' -WhatIf
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

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update tmtrafficpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type tmtrafficpolicy -Payload @{ tmtrafficpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetTMTrafficPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateTMTrafficPolicy

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDhAjNLMo/pupn6
# PQGJBqZ+TcHfRtFgqo99hVo/pLjn2aCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCA12nJ1d93z5wlndIHArva2HKyFAKKozHP9NDSzxnkn
# 2TANBgkqhkiG9w0BAQEFAASCAYB9x+jjtH4EDnqaOdcVJv/jzsE/hD3QSSfH9a4W
# LzhESfgJc6ubVIZwyhg5spJ6NkwcTgJDzSWX7/UyfWiqqSApabXPRIn0OflG/wd6
# rW7G4VClC/qEEK5D2kOvmvadZZp1a1mkirkJ5CEGyzrgDwVbmyDauMiTEzAI1qQc
# 6l+6FDuBMibtLbLM9hdqmYspc9wM//tcwQQOWV80tbjQUYoskhwokPkHFmAyyP31
# 6wpfOziR3cL+Mg9h/rN3eGEZE2G9nscmfIXOo2dRiKvAWyd8OhU/2Qm8ZVY22iX2
# WAI3kvFQtJEz+YDUnf8lIePU4k2i/7HVXM9kZmtjsMShACMxIxD8TiQ/D7Xt2GWO
# /EmWEGCEL1qTbrW4FNdpBthMAfQOdP89XfnrWcSdqiXWqPJJVeXEjDA+BKoGg5MF
# N+gTtmYIDG69RteGqp/JrhhvDFhfFVi+igyKZTcnTD6agiAH5zoJqmoicYFgsMYt
# eyBtymkHAtc7uMsxx5LZAkmC0eGhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU2NTNaMD8GCSqGSIb3
# DQEJBDEyBDDWzzS2H3E7cmUxUmUPGTcjvj9nz4RNG/ZKBPuoVnuIosEZ7kmuCX/x
# hq9sVNxF0lAwDQYJKoZIhvcNAQEBBQAEggIADin4VYDyt0tPupNm4SPeROY63lDH
# DdfNyRamxxCcnZetJYNs3jjNPZGmrtdRLtNxVn2EAUh+KbnQbfxQkVj6K9HBrH0R
# r5JL/xM3keqO7k/jxspiGYjJtfNg9hdq1kvlVjkTRbobK37YCl06Y3pvpDWOR+9a
# B5ghh1B0+EmnyoTxI/AoUO4yKKkMzuS4URDFxdfEb4CuVT9EFtlRXrVd/TojfkFh
# 7T8C9rvgxOp5j2QJ4dsEFIoa8MiMF9GnvqTHxwOqAhvcyKcZnQa2RHTaqIHqZ6ax
# jHz0tnmTPRPxv7aZaBTviD723vF1LP4HwYPJ4suqqvA6fD35QHSvPm1IhErLt1HC
# 2vjGT6cn64o/z+dP7pPL0jnmv88Z4hna0uuqp2/3orNPu2T9ZPj6dV6bjD8etID9
# esdLHh2wXUx+nwwQvDrlbOsdBjwipyoVD6gYXigqWEQmUGn/nWPoOBJX0fvtzZG0
# qDU8PPSOijjZEqkDeUUNo9oIhKBDljetYua0QCOb07a6UVyimrdrYbNxjG3UGXZC
# wVcjdimFx0cOkR9uxlS0MgHK0vTDFwGw19ezmqf2p5lrgtIfxJG2zqzKW/Dce7ZF
# AaCuNBxJV+CeIPZBA81BhgVhiZRHIbzyPQiJcTzHETZCsEvIwRAiHlIsxqo18zQP
# dhK6YOpIfNlPDpg=
# SIG # End signature block
