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
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDhAjNLMo/pupn6
# PQGJBqZ+TcHfRtFgqo99hVo/pLjn2aCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgNdpy
# dXfd8+cJZ3SBwK72thyshQCiqMxz/TQ0s8Z5J9kwDQYJKoZIhvcNAQEBBQAEggGA
# w31Gl5bw0Kf3vD/zNQ18+CS7vhK5MgSE4Myh4Fs2pZ931XeNkVsnVE5NUh2hfELZ
# vp8ltX6jUTH4ZraBr5sySNCoFehh72jz+WTo+mxGQgPN7AwmUgXIp2cqMqqtgft7
# lQ/bYNXSucF8cbWg63a5aowgJvzQIxcHVjPVQnNo3RForwRmR4s7KwKUVQ9oPXQS
# KGBUlaXN7AQulEmBvGb0XkhZzh0NzC+xy6xuYngkV2RaHdVGfCGnl2mc+5pkFm1c
# gLtkudW61NxwcVMw2rNvLfXg0bTPWZjo5764dEy5RZkjifXY7AhMUDfisaI2FMu2
# 3vW0kgSBVCCrNo0Kx7zJIr7PPjEQTAUJ9m40Po8sb81GVibSUNryA+luNx7vwV4t
# ZwHR1Tdpi9oHJbcyDeV/8dqRztLsN7+ej+WhcF5fRFiHGmuTTFXj3Q06ZGtEcwNt
# MgH0A6oVXhUsqYwGSLVky6e0uSCqX89O20KXMXvia/8L8lHQXEeG8yGmippjvpxs
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIHQbJMKzZgJryc7CPbL/
# to9n3GyGBAbW3MqkK+V4mNBUAgZqNTBfoX0YEzIwMjYwODAzMTI1MjQzLjEwNFow
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
# IgQgwk7vyLPzakXFLwN5EnUfZ4n6gL31YIDKQR1i1xJhpxkwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCBjvs38TkZQ7iGxRP7H
# HHeWregoVp5960ewGO9kUZr6FDANBgkqhkiG9w0BAQsFAASCAgBMh/t0Nh9JclO9
# Q1xBjkLGi5dlzlXCf0NE4prbVuy0fsKUGeK5gjHzcudabnthM/L+v6K4g8JKYD/h
# oyPtmmg2qAvDcPhNsy84eBXbcqkxSol6p/dOHq4yF+E4ZRrGDUPewDEsNd6miG4z
# +uk/OO01C8eMpDzLvpY3mCb3keIeo3kzPwNlbI+qPFkivVO6eB7PB2jTCIIDeaNu
# 0MSTdgKUL/1m58uaDFiDQGmo0L24PoRn6OU2k0z4hdQwFfUeNRHsNs99aoBSRAcc
# upDog9MuY90NGw5Z5P0uV9RyKo3h3rgs0k6z4MCpS8hlixjcyIef9MhQf6KglSiL
# qrIMs+Dh7DtRgCFAt11VPUkKkMAC89bG87Bjke3WWnfKViavQ7LdC6ciCOHdXz62
# 4jbv4fpUlinv/aTEZ/9XFW7uzbtBzyHy49TalHmamc5VIHmJUdpqSqOCM8B+8NBc
# dkedH8Zkmpca0gnuPUQBfiUfvHOsh9eX9/Xf57LXr8m6UbnyWGAp4qtBAfGleha3
# NaeDk5keKgaXaiT87vcF4NsL/YEOHDL1Da1R7JMHLgK5+MlUd8CsWEEng+J6lxTA
# iethWFzhz8Vn2TWwvogJ0yMZJTyom258Px2touJrvAkLzrF9c+BtmtxevoGiIHdq
# H0KsQpenb8iCg79DLsblYhhoylVxYg==
# SIG # End signature block
