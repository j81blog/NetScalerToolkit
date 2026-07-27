# Generated NetScalerToolkit Configuration bundle for category 'bot'.

# region Invoke-NSAddBotGlobalBotPolicyBinding
function Invoke-NSAddBotGlobalBotPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botglobal_botpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to botglobal.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        If the current policy evaluates to TRUE, terminate evaluation of policies bound to the current policy label, and then forward the request to the specified virtual server.
    .PARAMETER LabelName
        Name of the policy label to invoke. If the current policy evaluates to TRUE, the invoke parameter is set, and Label Type is policylabel.
    .PARAMETER LabelType
        Type of invocation, Available settings function as follows: * vserver - Forward the request to the specified virtual server. * policylabel - Invoke the specified policy label. Possible values = vserver, policylabel
    .PARAMETER PolicyName
        Name of the bot policy.
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Type
        Specifies the bind point whose policies you want to display. Available settings function as follows: * REQ_OVERRIDE - Request override. Binds the policy to the priority request queue. * REQ_DEFAULT - Binds the policy to the default request queue. Possible values = REQ_OVERRIDE, REQ_DEFAULT
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotGlobalBotPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddBotGlobalBotPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT')]
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

    if ($PSCmdlet.ShouldProcess('botglobal_botpolicy_binding', 'Create botglobal_botpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botglobal_botpolicy_binding -Payload @{ botglobal_botpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddBotGlobalBotPolicyBinding

# region Invoke-NSAddBotPolicy
function Invoke-NSAddBotPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler botpolicy resource.
    .DESCRIPTION
        Configuration for Bot policy resource.
    .PARAMETER Comment
        Any type of information about this bot policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the bot policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the bot policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my bot policy" or 'my bot policy').
    .PARAMETER ProfileName
        Name of the bot profile to apply if the request matches this bot policy.
    .PARAMETER Rule
        Expression that the policy uses to determine whether to apply bot profile on the specified request.
    .PARAMETER UndefAction
        Action to perform if the result of policy evaluation is undefined (UNDEF). An UNDEF event indicates an internal error condition.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotPolicy -Name 'example' -ProfileName 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotPolicy -Name 'example' -ProfileName 'example' -Rule 'example' -WhatIf
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

        [Parameter()]
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $ProfileName,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ProfileName')) { $properties['profilename'] = $ProfileName }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botpolicy -Payload @{ botpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotPolicy

# region Invoke-NSAddBotPolicyLabel
function Invoke-NSAddBotPolicyLabel {
    <#
    .SYNOPSIS
        Creates a NetScaler botpolicylabel resource.
    .DESCRIPTION
        Configuration for Bot policy label resource.
    .PARAMETER Comment
        Any comments to preserve information about this bot policy label.
    .PARAMETER LabelName
        Name for the bot policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotPolicyLabel -LabelName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotPolicyLabel -LabelName 'example' -WhatIf
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
        [psobject] $Session = (Get-NSSession),

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

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create botpolicylabel')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botpolicylabel -Payload @{ botpolicylabel = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotPolicyLabel -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotPolicyLabel

# region Invoke-NSAddBotPolicyLabelBotPolicyBinding
function Invoke-NSAddBotPolicyLabelBotPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botpolicylabel_botpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to botpolicylabel.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER Invoke
        If the current policy evaluates to TRUE, terminate evaluation of policies bound to the current policy label and evaluate the specified policy label.
    .PARAMETER InvokeLabelName
        * If labelType is policylabel, name of the policy label to invoke. * If labelType is vserver, name of the virtual server.
    .PARAMETER LabelName
        Name of the bot policy label to which to bind the policy.
    .PARAMETER LabelType
        Type of policy label to invoke. Available settings function as follows: * vserver - Invoke an unnamed policy label associated with a virtual server. * policylabel - Invoke a user-defined policy label. Possible values = vserver, policylabel
    .PARAMETER PolicyName
        Name of the bot policy.
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
        Invoke-NSAddBotPolicyLabelBotPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddBotPolicyLabelBotPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -WhatIf
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

    if ($PSCmdlet.ShouldProcess("$LabelName", 'Create botpolicylabel_botpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botpolicylabel_botpolicy_binding -Payload @{ botpolicylabel_botpolicy_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotPolicyLabelBotPolicyBinding -LabelName $LabelName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotPolicyLabelBotPolicyBinding

# region Invoke-NSAddBotProfile
function Invoke-NSAddBotProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile resource.
    .DESCRIPTION
        Configuration for Bot profile resource.
    .PARAMETER AddCookieFlags
        Add the specified flags to bot session cookies. Available settings function as follows: * None - Do not add flags to cookies. * HTTP Only - Add the HTTP Only flag to cookies, which prevents scripts from accessing cookies. * Secure - Add Secure flag to cookies. * All - Add both HTTPOnly and Secure flags to cookies. Default value: httpOnly Possible values = none, httpOnly, secure, all
    .PARAMETER BotEnableBlackList
        Enable black-list bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableIpReputation
        Enable IP-reputation bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableRateLimit
        Enable rate-limit bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableTps
        Enable TPS. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableWhiteList
        Enable white-list bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER ClientIpexpression
        Expression to get the client IP.
    .PARAMETER Comment
        Any comments about the purpose of profile, or other useful information about the profile. Minimum length = 1
    .PARAMETER Devicefingerprint
        Enable device-fingerprint bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER DevicefingerprintAction
        Action to be taken for device-fingerprint based bot detection. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET, MITIGATION
    .PARAMETER Devicefingerprintmobile
        Enabling bot device fingerprint protection for mobile clients. Default value: NONE Possible values = NONE, Android, iOS
    .PARAMETER DfpRequestLimit
        Number of requests to allow without bot session cookie if device fingerprint is enabled. Minimum value = 1
    .PARAMETER ErrorURL
        URL that Bot protection uses as the Error URL. Minimum length = 1
    .PARAMETER Headlessbrowserdetection
        Enable Headless Browser detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER Kmdetection
        Enable keyboard-mouse based bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER Kmeventspostbodylimit
        Size of the KM data send by the browser, needs to be processed on ADC. Minimum value = 1 Maximum value = 204800
    .PARAMETER KmjavascriptName
        Name of the JavaScript file that the Bot Management feature will insert in the response for keyboard-mouse based detection. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my javascript file name" or 'my javascript file name').
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER SessionCookieName
        Name of the SessionCookie that the Bot Management feature uses for tracking. Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name'). Minimum length = 1
    .PARAMETER SessionTimeout
        Timeout, in seconds, after which a user session is terminated. Minimum value = 1 Maximum value = 65535
    .PARAMETER Signature
        Name of object containing bot static signature details. Minimum length = 1
    .PARAMETER SignatureMultiPleUserAgentHeaderAction
        Actions to be taken if multiple User-Agent headers are seen in a request (Applicable if Signature check is enabled). Log action should be combined with other actions. Default value: CHECKLAST Possible values = CHECKLAST, LOG, DROP, REDIRECT, RESET
    .PARAMETER SignatureNoUserAgentHeaderAction
        Actions to be taken if no User-Agent header in the request (Applicable if Signature check is enabled). Default value: DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER SpoofedreqAction
        Actions to be taken on a spoofed request (A request spoofing good bot user agent string). Default value: BOT_ACTION_LOG_DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER Trap
        Enable trap bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER TrapAction
        Action to be taken for bot trap based bot detection. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER TrapURL
        URL that Bot protection uses as the Trap URL. Minimum length = 1 Maximum length = 127
    .PARAMETER Verboseloglevel
        Bot verbose Logging. Based on the log level, ADC will log additional information whenever client is detected as a bot. Default value: NONE Possible values = NONE, HTTP_FULL_HEADER
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfile -Name 'example' -WhatIf
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
        [string] $AddCookieFlags,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableBlackList,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableIpReputation,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableRateLimit,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableTps,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableWhiteList,

        [Parameter()]
        [string] $ClientIpexpression,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Devicefingerprint,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET', 'MITIGATION')]
        [string[]] $DevicefingerprintAction,

        [Parameter()]
        [ValidateSet('NONE', 'Android', 'iOS')]
        [string[]] $Devicefingerprintmobile,

        [Parameter()]
        [int] $DfpRequestLimit,

        [Parameter()]
        [string] $ErrorURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Headlessbrowserdetection,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Kmdetection,

        [Parameter()]
        [int] $Kmeventspostbodylimit,

        [Parameter()]
        [string] $KmjavascriptName,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $SessionCookieName,

        [Parameter()]
        [int] $SessionTimeout,

        [Parameter()]
        [string] $Signature,

        [Parameter()]
        [ValidateSet('CHECKLAST', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $SignatureMultiPleUserAgentHeaderAction,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $SignatureNoUserAgentHeaderAction,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $SpoofedreqAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Trap,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $TrapAction,

        [Parameter()]
        [string] $TrapURL,

        [Parameter()]
        [ValidateSet('NONE', 'HTTP_FULL_HEADER')]
        [string] $Verboseloglevel,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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

    if ($PSBoundParameters.ContainsKey('AddCookieFlags')) {
        Assert-NSParameterValue -ParameterName 'AddCookieFlags' -Value $AddCookieFlags -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('none', 'httpOnly', 'secure', 'all') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AddCookieFlags')) { $properties['addcookieflags'] = $AddCookieFlags }
    if ($PSBoundParameters.ContainsKey('BotEnableBlackList')) { $properties['bot_enable_black_list'] = $BotEnableBlackList }
    if ($PSBoundParameters.ContainsKey('BotEnableIpReputation')) { $properties['bot_enable_ip_reputation'] = $BotEnableIpReputation }
    if ($PSBoundParameters.ContainsKey('BotEnableRateLimit')) { $properties['bot_enable_rate_limit'] = $BotEnableRateLimit }
    if ($PSBoundParameters.ContainsKey('BotEnableTps')) { $properties['bot_enable_tps'] = $BotEnableTps }
    if ($PSBoundParameters.ContainsKey('BotEnableWhiteList')) { $properties['bot_enable_white_list'] = $BotEnableWhiteList }
    if ($PSBoundParameters.ContainsKey('ClientIpexpression')) { $properties['clientipexpression'] = $ClientIpexpression }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Devicefingerprint')) { $properties['devicefingerprint'] = $Devicefingerprint }
    if ($PSBoundParameters.ContainsKey('DevicefingerprintAction')) { $properties['devicefingerprintaction'] = $DevicefingerprintAction }
    if ($PSBoundParameters.ContainsKey('Devicefingerprintmobile')) { $properties['devicefingerprintmobile'] = $Devicefingerprintmobile }
    if ($PSBoundParameters.ContainsKey('DfpRequestLimit')) { $properties['dfprequestlimit'] = $DfpRequestLimit }
    if ($PSBoundParameters.ContainsKey('ErrorURL')) { $properties['errorurl'] = $ErrorURL }
    if ($PSBoundParameters.ContainsKey('Headlessbrowserdetection')) { $properties['headlessbrowserdetection'] = $Headlessbrowserdetection }
    if ($PSBoundParameters.ContainsKey('Kmdetection')) { $properties['kmdetection'] = $Kmdetection }
    if ($PSBoundParameters.ContainsKey('Kmeventspostbodylimit')) { $properties['kmeventspostbodylimit'] = $Kmeventspostbodylimit }
    if ($PSBoundParameters.ContainsKey('KmjavascriptName')) { $properties['kmjavascriptname'] = $KmjavascriptName }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('SessionCookieName')) { $properties['sessioncookiename'] = $SessionCookieName }
    if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $properties['sessiontimeout'] = $SessionTimeout }
    if ($PSBoundParameters.ContainsKey('Signature')) { $properties['signature'] = $Signature }
    if ($PSBoundParameters.ContainsKey('SignatureMultiPleUserAgentHeaderAction')) { $properties['signaturemultipleuseragentheaderaction'] = $SignatureMultiPleUserAgentHeaderAction }
    if ($PSBoundParameters.ContainsKey('SignatureNoUserAgentHeaderAction')) { $properties['signaturenouseragentheaderaction'] = $SignatureNoUserAgentHeaderAction }
    if ($PSBoundParameters.ContainsKey('SpoofedreqAction')) { $properties['spoofedreqaction'] = $SpoofedreqAction }
    if ($PSBoundParameters.ContainsKey('Trap')) { $properties['trap'] = $Trap }
    if ($PSBoundParameters.ContainsKey('TrapAction')) { $properties['trapaction'] = $TrapAction }
    if ($PSBoundParameters.ContainsKey('TrapURL')) { $properties['trapurl'] = $TrapURL }
    if ($PSBoundParameters.ContainsKey('Verboseloglevel')) { $properties['verboseloglevel'] = $Verboseloglevel }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile -Payload @{ botprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfile

# region Invoke-NSAddBotProfileBlacklistBinding
function Invoke-NSAddBotProfileBlacklistBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_blacklist_binding resource.
    .DESCRIPTION
        Binding object showing the blacklist that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotBlacklist
        Blacklist binding. Maximum 32 bindings can be configured per profile for Blacklist detection.
    .PARAMETER BotBlacklistAction
        One or more actions to be taken if bot is detected based on this Blacklist binding. Only LOG action can be combined with DROP or RESET action. Default value: NONE Possible values = NONE, LOG, DROP, RESET, REDIRECT
    .PARAMETER BotBlacklistEnabled
        Enabled or disbaled black-list binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotBlacklistType
        Type of the black-list entry. Possible values = IPv4, SUBNET, IPv6, IPv6_SUBNET, EXPRESSION
    .PARAMETER BotBlacklistValue
        Value of the bot black-list entry.
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileBlacklistBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileBlacklistBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [bool] $BotBlacklist,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'RESET', 'REDIRECT')]
        [string[]] $BotBlacklistAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotBlacklistEnabled,

        [Parameter()]
        [ValidateSet('IPv4', 'SUBNET', 'IPv6', 'IPv6_SUBNET', 'EXPRESSION')]
        [string] $BotBlacklistType,

        [Parameter()]
        [string] $BotBlacklistValue,

        [Parameter()]
        [string] $LogMessage,

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotBlacklist')) { $properties['bot_blacklist'] = $BotBlacklist }
    if ($PSBoundParameters.ContainsKey('BotBlacklistAction')) { $properties['bot_blacklist_action'] = $BotBlacklistAction }
    if ($PSBoundParameters.ContainsKey('BotBlacklistEnabled')) { $properties['bot_blacklist_enabled'] = $BotBlacklistEnabled }
    if ($PSBoundParameters.ContainsKey('BotBlacklistType')) { $properties['bot_blacklist_type'] = $BotBlacklistType }
    if ($PSBoundParameters.ContainsKey('BotBlacklistValue')) { $properties['bot_blacklist_value'] = $BotBlacklistValue }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_blacklist_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_blacklist_binding -Payload @{ botprofile_blacklist_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileBlacklistBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileBlacklistBinding

# region Invoke-NSAddBotProfileCaptchaBinding
function Invoke-NSAddBotProfileCaptchaBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_captcha_binding resource.
    .DESCRIPTION
        Binding object showing the captcha that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotCaptchaAction
        One or more actions to be taken when client fails captcha challenge. Only, log action can be configured with DROP, REDIRECT or RESET action. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER BotCaptchaEnabled
        Enable or disable the captcha binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotCaptchaURL
        URL for which the Captcha action, if configured under IP reputation, TPS or device fingerprint, need to be applied. Minimum length = 1
    .PARAMETER CaptchaResource
        Captcha action binding. For each URL, only one binding is allowed. To update the values of an existing URL binding, user has to first unbind that binding, and then needs to bind the URL again with new values. Maximum 30 bindings can be configured per profile.
    .PARAMETER Graceperiod
        Time (in seconds) duration for which no new captcha challenge is sent after current captcha challenge has been answered successfully. Default value: 900 Minimum value = 60 Maximum value = 900
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Muteperiod
        Time (in seconds) duration for which client which failed captcha need to wait until allowed to try again. The requests from this client are silently dropped during the mute period. Default value: 300 Minimum value = 60 Maximum value = 900
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER RequestSizelimit
        Length of body request (in Bytes) up to (equal or less than) which captcha challenge will be provided to client. Above this length threshold the request will be dropped. This is to avoid DOS and DDOS attacks. Default value: 8000 Minimum value = 10 Maximum value = 30000
    .PARAMETER Retryattempts
        Number of times client can retry solving the captcha. Default value: 3 Minimum value = 1 Maximum value = 10
    .PARAMETER Waittime
        Wait time in seconds for which ADC needs to wait for the Captcha response. This is to avoid DOS attacks. Default value: 15 Minimum value = 10 Maximum value = 60
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileCaptchaBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileCaptchaBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $BotCaptchaAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotCaptchaEnabled,

        [Parameter()]
        [string] $BotCaptchaURL,

        [Parameter()]
        [bool] $CaptchaResource,

        [Parameter()]
        [int] $Graceperiod,

        [Parameter()]
        [string] $LogMessage,

        [Parameter()]
        [int] $Muteperiod,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $RequestSizelimit,

        [Parameter()]
        [int] $Retryattempts,

        [Parameter()]
        [int] $Waittime,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotCaptchaAction')) { $properties['bot_captcha_action'] = $BotCaptchaAction }
    if ($PSBoundParameters.ContainsKey('BotCaptchaEnabled')) { $properties['bot_captcha_enabled'] = $BotCaptchaEnabled }
    if ($PSBoundParameters.ContainsKey('BotCaptchaURL')) { $properties['bot_captcha_url'] = $BotCaptchaURL }
    if ($PSBoundParameters.ContainsKey('CaptchaResource')) { $properties['captcharesource'] = $CaptchaResource }
    if ($PSBoundParameters.ContainsKey('Graceperiod')) { $properties['graceperiod'] = $Graceperiod }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Muteperiod')) { $properties['muteperiod'] = $Muteperiod }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('RequestSizelimit')) { $properties['requestsizelimit'] = $RequestSizelimit }
    if ($PSBoundParameters.ContainsKey('Retryattempts')) { $properties['retryattempts'] = $Retryattempts }
    if ($PSBoundParameters.ContainsKey('Waittime')) { $properties['waittime'] = $Waittime }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_captcha_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_captcha_binding -Payload @{ botprofile_captcha_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileCaptchaBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileCaptchaBinding

# region Invoke-NSAddBotProfileIpreputationBinding
function Invoke-NSAddBotProfileIpreputationBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_ipreputation_binding resource.
    .DESCRIPTION
        Binding object showing the ipreputation that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotIprepAction
        One or more actions to be taken if bot is detected based on this IP Reputation binding. Only LOG action can be combinded with DROP, RESET, REDIRECT or MITIGATION action. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET, MITIGATION
    .PARAMETER BotIprepEnabled
        Enabled or disabled IP-repuation binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotIpreputation
        IP reputation binding. For each category, only one binding is allowed. To update the values of an existing binding, user has to first unbind that binding, and then needs to bind again with the new values.
    .PARAMETER Category
        IP Repuation category. Following IP Reuputation categories are allowed: *IP_BASED - This category checks whether client IP is malicious or not. *BOTNET - This category includes Botnet C&C channels, and infected zombie machines controlled by Bot master. *SPAM_SOURCES - This category includes tunneling spam messages through a proxy, anomalous SMTP activities, and forum spam activities. *SCANNERS - This category includes all reconnaissance such as probes, host scan, domain scan, and password brute force attack. *DOS - This category includes DOS, DDOS, anomalous sync flood, and anomalous traffic detection. *REPUTATION - This category denies access from IP addresses currently known to be infected with malware. This category also includes IPs with average low Webroot Reputation Index score. Enabling this category will prevent access from sources identified to contact malware distribution points. *PHISHING - This category includes IP addresses hosting phishing sites and other kinds of fraud activities such as ad click fraud or gaming fraud. *PROXY - This category includes IP addresses providing proxy services. *NETWORK - IPs providing proxy and anonymization services including The Onion Router aka TOR or darknet. *MOBILE_THREATS - This category checks client IP with the list of IPs harmful for mobile devices. *WINDOWS_EXPLOITS - This category includes active IP address offering or distributig malware, shell code, rootkits, worms or viruses. *WEB_ATTACKS - This category includes cross site scripting, iFrame injection, SQL injection, cross domain injection or domain password brute force attack. *TOR_PROXY - This category includes IP address acting as exit nodes for the Tor Network. *CLOUD - This category checks client IP with list of public cloud IPs. *CLOUD_AWS - This category checks client IP with list of public cloud IPs from Amazon Web Services. *CLOUD_GCP - This category checks client IP with list of public cloud IPs from Google Cloud Platform. *CLOUD_AZURE - This category checks client IP with list of public cloud IPs from Azure. *CLOUD_ORACLE - This category checks client IP with list of public cloud IPs from Oracle. *CLOUD_IBM - This category checks client IP with list of public cloud IPs from IBM. *CLOUD_SALESFORCE - This category checks client IP with list of public cloud IPs from Salesforce. Possible values = IP, BOTNETS, SPAM_SOURCES, SCANNERS, DOS, REPUTATION, PHISHING, PROXY, NETWORK, MOBILE_THREATS, WINDOWS_EXPLOITS, WEB_ATTACKS, TOR_PROXY, CLOUD, CLOUD_AWS, CLOUD_GCP, CLOUD_AZURE, CLOUD_ORACLE, CLOUD_IBM, CLOUD_SALESFORCE
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileIpreputationBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileIpreputationBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET', 'MITIGATION')]
        [string[]] $BotIprepAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotIprepEnabled,

        [Parameter()]
        [bool] $BotIpreputation,

        [Parameter()]
        [ValidateSet('IP', 'BOTNETS', 'SPAM_SOURCES', 'SCANNERS', 'DOS', 'REPUTATION', 'PHISHING', 'PROXY', 'NETWORK', 'MOBILE_THREATS', 'WINDOWS_EXPLOITS', 'WEB_ATTACKS', 'TOR_PROXY', 'CLOUD', 'CLOUD_AWS', 'CLOUD_GCP', 'CLOUD_AZURE', 'CLOUD_ORACLE', 'CLOUD_IBM', 'CLOUD_SALESFORCE')]
        [string] $Category,

        [Parameter()]
        [string] $LogMessage,

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotIprepAction')) { $properties['bot_iprep_action'] = $BotIprepAction }
    if ($PSBoundParameters.ContainsKey('BotIprepEnabled')) { $properties['bot_iprep_enabled'] = $BotIprepEnabled }
    if ($PSBoundParameters.ContainsKey('BotIpreputation')) { $properties['bot_ipreputation'] = $BotIpreputation }
    if ($PSBoundParameters.ContainsKey('Category')) { $properties['category'] = $Category }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_ipreputation_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_ipreputation_binding -Payload @{ botprofile_ipreputation_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileIpreputationBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileIpreputationBinding

# region Invoke-NSAddBotProfileKmdetectionexprBinding
function Invoke-NSAddBotProfileKmdetectionexprBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_kmdetectionexpr_binding resource.
    .DESCRIPTION
        Binding object showing the kmdetectionexpr that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotKmDetectionEnabled
        Enable or disable the keyboard-mouse based binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotKmExpressionName
        Name of the keyboard-mouse expression object. Minimum length = 1
    .PARAMETER BotKmExpressionValue
        JavaScript file for keyboard-mouse detection, would be inserted if the result of the expression is true. Minimum length = 1
    .PARAMETER Kmdetectionexpr
        Keyboard-mouse based detection binding. For each name, only one binding is allowed. To update the values of an existing binding, user has to first unbind that binding, then needs to bind again with new vlaues. Maximum 30 bindings can be configured per profile.
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileKmdetectionexprBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileKmdetectionexprBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotKmDetectionEnabled,

        [Parameter()]
        [string] $BotKmExpressionName,

        [Parameter()]
        [string] $BotKmExpressionValue,

        [Parameter()]
        [bool] $Kmdetectionexpr,

        [Parameter()]
        [string] $LogMessage,

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotKmDetectionEnabled')) { $properties['bot_km_detection_enabled'] = $BotKmDetectionEnabled }
    if ($PSBoundParameters.ContainsKey('BotKmExpressionName')) { $properties['bot_km_expression_name'] = $BotKmExpressionName }
    if ($PSBoundParameters.ContainsKey('BotKmExpressionValue')) { $properties['bot_km_expression_value'] = $BotKmExpressionValue }
    if ($PSBoundParameters.ContainsKey('Kmdetectionexpr')) { $properties['kmdetectionexpr'] = $Kmdetectionexpr }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_kmdetectionexpr_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_kmdetectionexpr_binding -Payload @{ botprofile_kmdetectionexpr_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileKmdetectionexprBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileKmdetectionexprBinding

# region Invoke-NSAddBotProfileLogexpressionBinding
function Invoke-NSAddBotProfileLogexpressionBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_logexpression_binding resource.
    .DESCRIPTION
        Binding object showing the logexpression that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotLogExpressionEnabled
        Enable or disable the log expression binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotLogExpressionName
        Name of the log expression object. Minimum length = 1
    .PARAMETER BotLogExpressionValue
        Expression whose result to be logged when violation happened on the bot profile. Minimum length = 1
    .PARAMETER Logexpression
        Log expression binding.
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileLogexpressionBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileLogexpressionBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotLogExpressionEnabled,

        [Parameter()]
        [string] $BotLogExpressionName,

        [Parameter()]
        [string] $BotLogExpressionValue,

        [Parameter()]
        [bool] $Logexpression,

        [Parameter()]
        [string] $LogMessage,

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotLogExpressionEnabled')) { $properties['bot_log_expression_enabled'] = $BotLogExpressionEnabled }
    if ($PSBoundParameters.ContainsKey('BotLogExpressionName')) { $properties['bot_log_expression_name'] = $BotLogExpressionName }
    if ($PSBoundParameters.ContainsKey('BotLogExpressionValue')) { $properties['bot_log_expression_value'] = $BotLogExpressionValue }
    if ($PSBoundParameters.ContainsKey('Logexpression')) { $properties['logexpression'] = $Logexpression }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_logexpression_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_logexpression_binding -Payload @{ botprofile_logexpression_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileLogexpressionBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileLogexpressionBinding

# region Invoke-NSAddBotProfileRatelimitBinding
function Invoke-NSAddBotProfileRatelimitBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_ratelimit_binding resource.
    .DESCRIPTION
        Binding object showing the ratelimit that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotRateLimitAction
        One or more actions to be taken when the current rate becomes more than the configured rate. Only LOG action can be combined with DROP, REDIRECT, RESPOND_STATUS_TOO_MANY_REQUESTS or RESET action. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET, RESPOND_STATUS_TOO_MANY_REQUESTS
    .PARAMETER BotRateLimitEnabled
        Enable or disable rate-limit binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotRateLimitType
        Rate-limiting type Following rate-limiting types are allowed: *SOURCE_IP - Rate-limiting based on the client IP. *SESSION - Rate-limiting based on the configured cookie name. *URL - Rate-limiting based on the configured URL. *GEOLOCATION - Rate-limiting based on the configured country name. *JA3_FINGERPRINT - Rate-limiting based on client SSL JA3 fingerprint. Possible values = SESSION, SOURCE_IP, URL, GEOLOCATION, JA3_FINGERPRINT
    .PARAMETER BotRateLimitURL
        URL for the resource based rate-limiting.
    .PARAMETER BotRatelimit
        Rate-limit binding. Maximum 30 bindings can be configured per profile for rate-limit detection. For SOURCE_IP type, only one binding can be configured, and for URL type, only one binding is allowed per URL, and for SESSION type, only one binding is allowed for a cookie name. To update the values of an existing binding, user has to first unbind that binding, and then needs to bind again with new values.
    .PARAMETER Condition
        Expression to be used in a rate-limiting condition. This expression result must be a boolean value.
    .PARAMETER CookieName
        Cookie name which is used to identify the session for session rate-limiting.
    .PARAMETER Countrycode
        Country name which is used for geolocation rate-limiting. Possible values = AF, AX, AL, DZ, AS, AD, AO, AI, AQ, AG, AR, AM, AW, AU, AT, AZ, BS, BH, BD, BB, BY, BE, BZ, BJ, BM, BT, BO, BQ, BA, BW, BR, IO, BN, BG, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CX, CC, CO, KM, CG, CD, CK, CR, CI, HR, CU, CW, CY, CZ, DK, DJ, DM, DO, EC, EG, SV, GQ, ER, EE, ET, FK, FO, FJ, FI, FR, GF, PF, TF, GA, GM, GE, DE, GH, GI, GR, GL, GD, GP, GU, GT, GG, GN, GW, GY, HT, HM, VA, HN, HK, HU, IS, IN, ID, IR, IQ, IE, IM, IL, IT, JM, JP, JE, JO, KZ, KE, KI, XK, KW, KG, LA, LV, LB, LS, LR, LY, LI, LT, LU, MO, MK, MG, MW, MY, MV, ML, MT, MH, MQ, MR, MU, YT, MX, FM, MD, MC, MN, ME, MS, MA, MZ, MM, NA, NR, NP, NL, NC, NZ, NI, NE, NG, NU, NF, KP, MP, NO, OM, PK, PW, PS, PA, PG, PY, PE, PH, PN, PL, PT, PR, QA, RE, RO, RU, RW, BL, SH, KN, LC, MF, PM, VC, WS, SM, ST, SA, SN, RS, SC, SL, SG, SX, SK, SI, SB, SO, SZA, GS, KR, SS, ES, LK, SD, SR, SJ, SZ, SE, CH, SY, TW, TJ, TZ, TH, TL, TG, TK, TO, TT, TN, TR, TM, TC, TV, UG, UA, AE, GB, US, UM, UY, UZ, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW
    .PARAMETER LimitType
        Rate-Limiting traffic Type. Default value: BURSTY Possible values = BURSTY, SMOOTH
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Rate
        Maximum number of requests that are allowed in this session in the given period time. Default value: 1 Minimum value = 1
    .PARAMETER Timeslice
        Time interval during which requests are tracked to check if they cross the given rate. Default value: 1000 Minimum value = 10
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileRatelimitBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileRatelimitBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [string[]] $BotRateLimitAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotRateLimitEnabled,

        [Parameter()]
        [ValidateSet('SESSION', 'SOURCE_IP', 'URL', 'GEOLOCATION', 'JA3_FINGERPRINT')]
        [string] $BotRateLimitType,

        [Parameter()]
        [string] $BotRateLimitURL,

        [Parameter()]
        [bool] $BotRatelimit,

        [Parameter()]
        [string] $Condition,

        [Parameter()]
        [string] $CookieName,

        [Parameter()]
        [ValidateSet('AF', 'AX', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'KH', 'CM', 'CA', 'CV', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CG', 'CD', 'CK', 'CR', 'CI', 'HR', 'CU', 'CW', 'CY', 'CZ', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'VA', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IL', 'IT', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'XK', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MK', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'KP', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RE', 'RO', 'RU', 'RW', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'SZA', 'GS', 'KR', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SZ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TR', 'TM', 'TC', 'TV', 'UG', 'UA', 'AE', 'GB', 'US', 'UM', 'UY', 'UZ', 'VU', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW')]
        [string] $Countrycode,

        [Parameter()]
        [ValidateSet('BURSTY', 'SMOOTH')]
        [string] $LimitType,

        [Parameter()]
        [string] $LogMessage,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $Rate,

        [Parameter()]
        [int] $Timeslice,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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

    if ($PSBoundParameters.ContainsKey('BotRateLimitAction')) {
        Assert-NSParameterValue -ParameterName 'BotRateLimitAction' -Value $BotRateLimitAction -AllowedValuesByVersion @{ '13.1' = @('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET'); '14.1' = @('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET', 'RESPOND_STATUS_TOO_MANY_REQUESTS') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotRateLimitAction')) { $properties['bot_rate_limit_action'] = $BotRateLimitAction }
    if ($PSBoundParameters.ContainsKey('BotRateLimitEnabled')) { $properties['bot_rate_limit_enabled'] = $BotRateLimitEnabled }
    if ($PSBoundParameters.ContainsKey('BotRateLimitType')) { $properties['bot_rate_limit_type'] = $BotRateLimitType }
    if ($PSBoundParameters.ContainsKey('BotRateLimitURL')) { $properties['bot_rate_limit_url'] = $BotRateLimitURL }
    if ($PSBoundParameters.ContainsKey('BotRatelimit')) { $properties['bot_ratelimit'] = $BotRatelimit }
    if ($PSBoundParameters.ContainsKey('Condition')) { $properties['condition'] = $Condition }
    if ($PSBoundParameters.ContainsKey('CookieName')) { $properties['cookiename'] = $CookieName }
    if ($PSBoundParameters.ContainsKey('Countrycode')) { $properties['countrycode'] = $Countrycode }
    if ($PSBoundParameters.ContainsKey('LimitType')) { $properties['limittype'] = $LimitType }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rate')) { $properties['rate'] = $Rate }
    if ($PSBoundParameters.ContainsKey('Timeslice')) { $properties['timeslice'] = $Timeslice }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_ratelimit_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_ratelimit_binding -Payload @{ botprofile_ratelimit_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileRatelimitBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileRatelimitBinding

# region Invoke-NSAddBotProfileTpsBinding
function Invoke-NSAddBotProfileTpsBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_tps_binding resource.
    .DESCRIPTION
        Binding object showing the tps that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotTps
        TPS binding. For each type only binding can be configured. To update the values of an existing binding, user has to first unbind that binding, and then needs to bind again with new values.
    .PARAMETER BotTpsAction
        One to more actions to be taken if bot is detected based on this TPS binding. Only LOG action can be combined with DROP, RESET, REDIRECT, or MITIGIATION action. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET, MITIGATION
    .PARAMETER BotTpsEnabled
        Enabled or disabled TPS binding. Default value: ON Possible values = ON, OFF
    .PARAMETER BotTpsType
        Type of TPS binding. Possible values = SOURCE_IP, GEOLOCATION, REQUEST_URL, Host
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Percentage
        Maximum percentage increase in the requests from (or to) a IP, Geolocation, URL or Host in 30 minutes interval. Minimum value = 10
    .PARAMETER Threshold
        Maximum number of requests that are allowed from (or to) a IP, Geolocation, URL or Host in 1 second time interval. Minimum value = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileTpsBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileTpsBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [bool] $BotTps,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET', 'MITIGATION')]
        [string[]] $BotTpsAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotTpsEnabled,

        [Parameter()]
        [ValidateSet('SOURCE_IP', 'GEOLOCATION', 'REQUEST_URL', 'Host')]
        [string] $BotTpsType,

        [Parameter()]
        [string] $LogMessage,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $Percentage,

        [Parameter()]
        [int] $Threshold,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotTps')) { $properties['bot_tps'] = $BotTps }
    if ($PSBoundParameters.ContainsKey('BotTpsAction')) { $properties['bot_tps_action'] = $BotTpsAction }
    if ($PSBoundParameters.ContainsKey('BotTpsEnabled')) { $properties['bot_tps_enabled'] = $BotTpsEnabled }
    if ($PSBoundParameters.ContainsKey('BotTpsType')) { $properties['bot_tps_type'] = $BotTpsType }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Percentage')) { $properties['percentage'] = $Percentage }
    if ($PSBoundParameters.ContainsKey('Threshold')) { $properties['threshold'] = $Threshold }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_tps_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_tps_binding -Payload @{ botprofile_tps_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileTpsBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileTpsBinding

# region Invoke-NSAddBotProfileTrapInsertIonURLBinding
function Invoke-NSAddBotProfileTrapInsertIonURLBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_trapinsertionurl_binding resource.
    .DESCRIPTION
        Binding object showing the trapinsertionurl that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotTrapURL
        Request URL regex pattern for which Trap URL is inserted. Minimum length = 1
    .PARAMETER BotTrapURLInsertIonEnabled
        Enable or disable the request URL pattern. Default value: OFF Possible values = ON, OFF
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER TrapInsertIonURL
        Bind the trap URL for the configured request URLs. Maximum 30 bindings can be configured per profile.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileTrapInsertIonURLBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileTrapInsertIonURLBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [string] $BotTrapURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotTrapURLInsertIonEnabled,

        [Parameter()]
        [string] $LogMessage,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [bool] $TrapInsertIonURL,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotTrapURL')) { $properties['bot_trap_url'] = $BotTrapURL }
    if ($PSBoundParameters.ContainsKey('BotTrapURLInsertIonEnabled')) { $properties['bot_trap_url_insertion_enabled'] = $BotTrapURLInsertIonEnabled }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('TrapInsertIonURL')) { $properties['trapinsertionurl'] = $TrapInsertIonURL }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_trapinsertionurl_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_trapinsertionurl_binding -Payload @{ botprofile_trapinsertionurl_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileTrapInsertIonURLBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileTrapInsertIonURLBinding

# region Invoke-NSAddBotProfileWhitelistBinding
function Invoke-NSAddBotProfileWhitelistBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler botprofile_whitelist_binding resource.
    .DESCRIPTION
        Binding object showing the whitelist that can be bound to botprofile.
    .PARAMETER BotBindComment
        Any comments about this binding. Minimum length = 1
    .PARAMETER BotWhitelist
        Whitelist binding. Maximum 32 bindings can be configured per profile for Whitelist detection.
    .PARAMETER BotWhitelistEnabled
        Enabled or disabled white-list binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotWhitelistType
        Type of the white-list entry. Possible values = IPv4, SUBNET, IPv6, IPv6_SUBNET, EXPRESSION
    .PARAMETER BotWhitelistValue
        Value of bot white-list entry.
    .PARAMETER Log
        Enable logging for Whitelist binding. Default value: OFF Possible values = ON, OFF
    .PARAMETER LogMessage
        Message to be logged for this binding. Minimum length = 1
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddBotProfileWhitelistBinding -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddBotProfileWhitelistBinding -Name 'example' -WhatIf
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
        [string] $BotBindComment,

        [Parameter()]
        [bool] $BotWhitelist,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotWhitelistEnabled,

        [Parameter()]
        [ValidateSet('IPv4', 'SUBNET', 'IPv6', 'IPv6_SUBNET', 'EXPRESSION')]
        [string] $BotWhitelistType,

        [Parameter()]
        [string] $BotWhitelistValue,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Log,

        [Parameter()]
        [string] $LogMessage,

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
    if ($PSBoundParameters.ContainsKey('BotBindComment')) { $properties['bot_bind_comment'] = $BotBindComment }
    if ($PSBoundParameters.ContainsKey('BotWhitelist')) { $properties['bot_whitelist'] = $BotWhitelist }
    if ($PSBoundParameters.ContainsKey('BotWhitelistEnabled')) { $properties['bot_whitelist_enabled'] = $BotWhitelistEnabled }
    if ($PSBoundParameters.ContainsKey('BotWhitelistType')) { $properties['bot_whitelist_type'] = $BotWhitelistType }
    if ($PSBoundParameters.ContainsKey('BotWhitelistValue')) { $properties['bot_whitelist_value'] = $BotWhitelistValue }
    if ($PSBoundParameters.ContainsKey('Log')) { $properties['log'] = $Log }
    if ($PSBoundParameters.ContainsKey('LogMessage')) { $properties['logmessage'] = $LogMessage }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create botprofile_whitelist_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile_whitelist_binding -Payload @{ botprofile_whitelist_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfileWhitelistBinding -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddBotProfileWhitelistBinding

# region Invoke-NSDeleteBotGlobalBotPolicyBinding
function Invoke-NSDeleteBotGlobalBotPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botglobal_botpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to botglobal.
    .PARAMETER PolicyName
        Name of the bot policy.
    .PARAMETER Type
        Specifies the bind point whose policies you want to display. Available settings function as follows: * REQ_OVERRIDE - Request override. Binds the policy to the priority request queue. * REQ_DEFAULT - Binds the policy to the default request queue. Possible values = REQ_OVERRIDE, REQ_DEFAULT
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
        Invoke-NSDeleteBotGlobalBotPolicyBinding -PolicyName 'example' -Priority 1 -Type REQ_OVERRIDE -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotGlobalBotPolicyBinding  | Invoke-NSDeleteBotGlobalBotPolicyBinding -Confirm:$false
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT')]
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

        if ($PSCmdlet.ShouldProcess('botglobal_botpolicy_binding', 'Delete botglobal_botpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botglobal_botpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotGlobalBotPolicyBinding

# region Invoke-NSDeleteBotPolicy
function Invoke-NSDeleteBotPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler botpolicy resource.
    .DESCRIPTION
        Configuration for Bot policy resource.
    .PARAMETER Name
        Name for the bot policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the bot policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my bot policy" or 'my bot policy').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotPolicy -Name 'botpolicy_example' | Invoke-NSDeleteBotPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotPolicy

# region Invoke-NSDeleteBotPolicyLabel
function Invoke-NSDeleteBotPolicyLabel {
    <#
    .SYNOPSIS
        Removes a NetScaler botpolicylabel resource.
    .DESCRIPTION
        Configuration for Bot policy label resource.
    .PARAMETER LabelName
        Name for the bot policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotPolicyLabel -LabelName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotPolicyLabel -LabelName 'botpolicylabel_example' | Invoke-NSDeleteBotPolicyLabel -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete botpolicylabel')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botpolicylabel -Resource $LabelName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotPolicyLabel

# region Invoke-NSDeleteBotPolicyLabelBotPolicyBinding
function Invoke-NSDeleteBotPolicyLabelBotPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botpolicylabel_botpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to botpolicylabel.
    .PARAMETER LabelName
        Name of the bot policy label to which to bind the policy.
    .PARAMETER PolicyName
        Name of the bot policy.
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
        Invoke-NSDeleteBotPolicyLabelBotPolicyBinding -LabelName 'example' -PolicyName 'example' -Priority 1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotPolicyLabelBotPolicyBinding -LabelName 'botpolicylabel_botpolicy_binding_example' | Invoke-NSDeleteBotPolicyLabelBotPolicyBinding -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Delete botpolicylabel_botpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botpolicylabel_botpolicy_binding -Resource $LabelName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotPolicyLabelBotPolicyBinding

# region Invoke-NSDeleteBotProfile
function Invoke-NSDeleteBotProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile resource.
    .DESCRIPTION
        Configuration for Bot profile resource.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfile -Name 'botprofile_example' | Invoke-NSDeleteBotProfile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfile

# region Invoke-NSDeleteBotProfileBlacklistBinding
function Invoke-NSDeleteBotProfileBlacklistBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_blacklist_binding resource.
    .DESCRIPTION
        Binding object showing the blacklist that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER BotBlacklist
        Blacklist binding. Maximum 32 bindings can be configured per profile for Blacklist detection.
    .PARAMETER BotBlacklistValue
        Value of the bot black-list entry.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileBlacklistBinding -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileBlacklistBinding -Name 'botprofile_blacklist_binding_example' | Invoke-NSDeleteBotProfileBlacklistBinding -Confirm:$false
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
        [bool] $BotBlacklist,

        [Parameter()]
        [string] $BotBlacklistValue,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('BotBlacklist')) {
            $argumentParts += 'bot_blacklist:' + $BotBlacklist
        }
        if ($PSBoundParameters.ContainsKey('BotBlacklistValue')) {
            $argumentParts += 'bot_blacklist_value:' + $BotBlacklistValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_blacklist_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_blacklist_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileBlacklistBinding

# region Invoke-NSDeleteBotProfileCaptchaBinding
function Invoke-NSDeleteBotProfileCaptchaBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_captcha_binding resource.
    .DESCRIPTION
        Binding object showing the captcha that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER CaptchaResource
        Captcha action binding. For each URL, only one binding is allowed. To update the values of an existing URL binding, user has to first unbind that binding, and then needs to bind the URL again with new values. Maximum 30 bindings can be configured per profile.
    .PARAMETER BotCaptchaURL
        URL for which the Captcha action, if configured under IP reputation, TPS or device fingerprint, need to be applied. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileCaptchaBinding -Name 'example' -CaptchaResource $true -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileCaptchaBinding -Name 'botprofile_captcha_binding_example' | Invoke-NSDeleteBotProfileCaptchaBinding -Confirm:$false
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
        [bool] $CaptchaResource,

        [Parameter()]
        [string] $BotCaptchaURL,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('CaptchaResource')) {
            $argumentParts += 'captcharesource:' + $CaptchaResource
        }
        if ($PSBoundParameters.ContainsKey('BotCaptchaURL')) {
            $argumentParts += 'bot_captcha_url:' + $BotCaptchaURL
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_captcha_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_captcha_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileCaptchaBinding

# region Invoke-NSDeleteBotProfileIpreputationBinding
function Invoke-NSDeleteBotProfileIpreputationBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_ipreputation_binding resource.
    .DESCRIPTION
        Binding object showing the ipreputation that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER BotIpreputation
        IP reputation binding. For each category, only one binding is allowed. To update the values of an existing binding, user has to first unbind that binding, and then needs to bind again with the new values.
    .PARAMETER Category
        IP Repuation category. Following IP Reuputation categories are allowed: *IP_BASED - This category checks whether client IP is malicious or not. *BOTNET - This category includes Botnet C&C channels, and infected zombie machines controlled by Bot master. *SPAM_SOURCES - This category includes tunneling spam messages through a proxy, anomalous SMTP activities, and forum spam activities. *SCANNERS - This category includes all reconnaissance such as probes, host scan, domain scan, and password brute force attack. *DOS - This category includes DOS, DDOS, anomalous sync flood, and anomalous traffic detection. *REPUTATION - This category denies access from IP addresses currently known to be infected with malware. This category also includes IPs with average low Webroot Reputation Index score. Enabling this category will prevent access from sources identified to contact malware distribution points. *PHISHING - This category includes IP addresses hosting phishing sites and other kinds of fraud activities such as ad click fraud or gaming fraud. *PROXY - This category includes IP addresses providing proxy services. *NETWORK - IPs providing proxy and anonymization services including The Onion Router aka TOR or darknet. *MOBILE_THREATS - This category checks client IP with the list of IPs harmful for mobile devices. *WINDOWS_EXPLOITS - This category includes active IP address offering or distributig malware, shell code, rootkits, worms or viruses. *WEB_ATTACKS - This category includes cross site scripting, iFrame injection, SQL injection, cross domain injection or domain password brute force attack. *TOR_PROXY - This category includes IP address acting as exit nodes for the Tor Network. *CLOUD - This category checks client IP with list of public cloud IPs. *CLOUD_AWS - This category checks client IP with list of public cloud IPs from Amazon Web Services. *CLOUD_GCP - This category checks client IP with list of public cloud IPs from Google Cloud Platform. *CLOUD_AZURE - This category checks client IP with list of public cloud IPs from Azure. *CLOUD_ORACLE - This category checks client IP with list of public cloud IPs from Oracle. *CLOUD_IBM - This category checks client IP with list of public cloud IPs from IBM. *CLOUD_SALESFORCE - This category checks client IP with list of public cloud IPs from Salesforce. Possible values = IP, BOTNETS, SPAM_SOURCES, SCANNERS, DOS, REPUTATION, PHISHING, PROXY, NETWORK, MOBILE_THREATS, WINDOWS_EXPLOITS, WEB_ATTACKS, TOR_PROXY, CLOUD, CLOUD_AWS, CLOUD_GCP, CLOUD_AZURE, CLOUD_ORACLE, CLOUD_IBM, CLOUD_SALESFORCE
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileIpreputationBinding -Name 'example' -Category IP -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileIpreputationBinding -Name 'botprofile_ipreputation_binding_example' | Invoke-NSDeleteBotProfileIpreputationBinding -Confirm:$false
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
        [bool] $BotIpreputation,

        [Parameter()]
        [ValidateSet('IP', 'BOTNETS', 'SPAM_SOURCES', 'SCANNERS', 'DOS', 'REPUTATION', 'PHISHING', 'PROXY', 'NETWORK', 'MOBILE_THREATS', 'WINDOWS_EXPLOITS', 'WEB_ATTACKS', 'TOR_PROXY', 'CLOUD', 'CLOUD_AWS', 'CLOUD_GCP', 'CLOUD_AZURE', 'CLOUD_ORACLE', 'CLOUD_IBM', 'CLOUD_SALESFORCE')]
        [string] $Category,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('BotIpreputation')) {
            $argumentParts += 'bot_ipreputation:' + $BotIpreputation
        }
        if ($PSBoundParameters.ContainsKey('Category')) {
            $argumentParts += 'category:' + $Category
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_ipreputation_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_ipreputation_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileIpreputationBinding

# region Invoke-NSDeleteBotProfileKmdetectionexprBinding
function Invoke-NSDeleteBotProfileKmdetectionexprBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_kmdetectionexpr_binding resource.
    .DESCRIPTION
        Binding object showing the kmdetectionexpr that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Kmdetectionexpr
        Keyboard-mouse based detection binding. For each name, only one binding is allowed. To update the values of an existing binding, user has to first unbind that binding, then needs to bind again with new vlaues. Maximum 30 bindings can be configured per profile.
    .PARAMETER BotKmExpressionName
        Name of the keyboard-mouse expression object. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileKmdetectionexprBinding -Name 'example' -Kmdetectionexpr $true -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileKmdetectionexprBinding -Name 'botprofile_kmdetectionexpr_binding_example' | Invoke-NSDeleteBotProfileKmdetectionexprBinding -Confirm:$false
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
        [bool] $Kmdetectionexpr,

        [Parameter()]
        [string] $BotKmExpressionName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Kmdetectionexpr')) {
            $argumentParts += 'kmdetectionexpr:' + $Kmdetectionexpr
        }
        if ($PSBoundParameters.ContainsKey('BotKmExpressionName')) {
            $argumentParts += 'bot_km_expression_name:' + $BotKmExpressionName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_kmdetectionexpr_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_kmdetectionexpr_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileKmdetectionexprBinding

# region Invoke-NSDeleteBotProfileLogexpressionBinding
function Invoke-NSDeleteBotProfileLogexpressionBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_logexpression_binding resource.
    .DESCRIPTION
        Binding object showing the logexpression that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER Logexpression
        Log expression binding.
    .PARAMETER BotLogExpressionName
        Name of the log expression object. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileLogexpressionBinding -Name 'example' -Logexpression $true -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileLogexpressionBinding -Name 'botprofile_logexpression_binding_example' | Invoke-NSDeleteBotProfileLogexpressionBinding -Confirm:$false
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
        [bool] $Logexpression,

        [Parameter()]
        [string] $BotLogExpressionName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('Logexpression')) {
            $argumentParts += 'logexpression:' + $Logexpression
        }
        if ($PSBoundParameters.ContainsKey('BotLogExpressionName')) {
            $argumentParts += 'bot_log_expression_name:' + $BotLogExpressionName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_logexpression_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_logexpression_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileLogexpressionBinding

# region Invoke-NSDeleteBotProfileRatelimitBinding
function Invoke-NSDeleteBotProfileRatelimitBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_ratelimit_binding resource.
    .DESCRIPTION
        Binding object showing the ratelimit that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER BotRatelimit
        Rate-limit binding. Maximum 30 bindings can be configured per profile for rate-limit detection. For SOURCE_IP type, only one binding can be configured, and for URL type, only one binding is allowed per URL, and for SESSION type, only one binding is allowed for a cookie name. To update the values of an existing binding, user has to first unbind that binding, and then needs to bind again with new values.
    .PARAMETER BotRateLimitType
        Rate-limiting type Following rate-limiting types are allowed: *SOURCE_IP - Rate-limiting based on the client IP. *SESSION - Rate-limiting based on the configured cookie name. *URL - Rate-limiting based on the configured URL. *GEOLOCATION - Rate-limiting based on the configured country name. *JA3_FINGERPRINT - Rate-limiting based on client SSL JA3 fingerprint. Possible values = SESSION, SOURCE_IP, URL, GEOLOCATION, JA3_FINGERPRINT
    .PARAMETER BotRateLimitURL
        URL for the resource based rate-limiting.
    .PARAMETER CookieName
        Cookie name which is used to identify the session for session rate-limiting.
    .PARAMETER Countrycode
        Country name which is used for geolocation rate-limiting. Possible values = AF, AX, AL, DZ, AS, AD, AO, AI, AQ, AG, AR, AM, AW, AU, AT, AZ, BS, BH, BD, BB, BY, BE, BZ, BJ, BM, BT, BO, BQ, BA, BW, BR, IO, BN, BG, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CX, CC, CO, KM, CG, CD, CK, CR, CI, HR, CU, CW, CY, CZ, DK, DJ, DM, DO, EC, EG, SV, GQ, ER, EE, ET, FK, FO, FJ, FI, FR, GF, PF, TF, GA, GM, GE, DE, GH, GI, GR, GL, GD, GP, GU, GT, GG, GN, GW, GY, HT, HM, VA, HN, HK, HU, IS, IN, ID, IR, IQ, IE, IM, IL, IT, JM, JP, JE, JO, KZ, KE, KI, XK, KW, KG, LA, LV, LB, LS, LR, LY, LI, LT, LU, MO, MK, MG, MW, MY, MV, ML, MT, MH, MQ, MR, MU, YT, MX, FM, MD, MC, MN, ME, MS, MA, MZ, MM, NA, NR, NP, NL, NC, NZ, NI, NE, NG, NU, NF, KP, MP, NO, OM, PK, PW, PS, PA, PG, PY, PE, PH, PN, PL, PT, PR, QA, RE, RO, RU, RW, BL, SH, KN, LC, MF, PM, VC, WS, SM, ST, SA, SN, RS, SC, SL, SG, SX, SK, SI, SB, SO, SZA, GS, KR, SS, ES, LK, SD, SR, SJ, SZ, SE, CH, SY, TW, TJ, TZ, TH, TL, TG, TK, TO, TT, TN, TR, TM, TC, TV, UG, UA, AE, GB, US, UM, UY, UZ, VU, VE, VN, VG, VI, WF, EH, YE, ZM, ZW
    .PARAMETER Condition
        Expression to be used in a rate-limiting condition. This expression result must be a boolean value.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileRatelimitBinding -Name 'example' -CookieName 'example' -Countrycode AF -Condition 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileRatelimitBinding -Name 'botprofile_ratelimit_binding_example' | Invoke-NSDeleteBotProfileRatelimitBinding -Confirm:$false
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
        [bool] $BotRatelimit,

        [Parameter()]
        [ValidateSet('SESSION', 'SOURCE_IP', 'URL', 'GEOLOCATION', 'JA3_FINGERPRINT')]
        [string] $BotRateLimitType,

        [Parameter()]
        [string] $BotRateLimitURL,

        [Parameter()]
        [string] $CookieName,

        [Parameter()]
        [ValidateSet('AF', 'AX', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'KH', 'CM', 'CA', 'CV', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CG', 'CD', 'CK', 'CR', 'CI', 'HR', 'CU', 'CW', 'CY', 'CZ', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'VA', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IL', 'IT', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'XK', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MK', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'KP', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RE', 'RO', 'RU', 'RW', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'SZA', 'GS', 'KR', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SZ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TR', 'TM', 'TC', 'TV', 'UG', 'UA', 'AE', 'GB', 'US', 'UM', 'UY', 'UZ', 'VU', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW')]
        [string] $Countrycode,

        [Parameter()]
        [string] $Condition,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('BotRatelimit')) {
            $argumentParts += 'bot_ratelimit:' + $BotRatelimit
        }
        if ($PSBoundParameters.ContainsKey('BotRateLimitType')) {
            $argumentParts += 'bot_rate_limit_type:' + $BotRateLimitType
        }
        if ($PSBoundParameters.ContainsKey('BotRateLimitURL')) {
            $argumentParts += 'bot_rate_limit_url:' + $BotRateLimitURL
        }
        if ($PSBoundParameters.ContainsKey('CookieName')) {
            $argumentParts += 'cookiename:' + $CookieName
        }
        if ($PSBoundParameters.ContainsKey('Countrycode')) {
            $argumentParts += 'countrycode:' + $Countrycode
        }
        if ($PSBoundParameters.ContainsKey('Condition')) {
            $argumentParts += 'condition:' + $Condition
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_ratelimit_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_ratelimit_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileRatelimitBinding

# region Invoke-NSDeleteBotProfileTpsBinding
function Invoke-NSDeleteBotProfileTpsBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_tps_binding resource.
    .DESCRIPTION
        Binding object showing the tps that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER BotTps
        TPS binding. For each type only binding can be configured. To update the values of an existing binding, user has to first unbind that binding, and then needs to bind again with new values.
    .PARAMETER BotTpsType
        Type of TPS binding. Possible values = SOURCE_IP, GEOLOCATION, REQUEST_URL, Host
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileTpsBinding -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileTpsBinding -Name 'botprofile_tps_binding_example' | Invoke-NSDeleteBotProfileTpsBinding -Confirm:$false
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
        [bool] $BotTps,

        [Parameter()]
        [ValidateSet('SOURCE_IP', 'GEOLOCATION', 'REQUEST_URL', 'Host')]
        [string] $BotTpsType,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('BotTps')) {
            $argumentParts += 'bot_tps:' + $BotTps
        }
        if ($PSBoundParameters.ContainsKey('BotTpsType')) {
            $argumentParts += 'bot_tps_type:' + $BotTpsType
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_tps_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_tps_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileTpsBinding

# region Invoke-NSDeleteBotProfileTrapInsertIonURLBinding
function Invoke-NSDeleteBotProfileTrapInsertIonURLBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_trapinsertionurl_binding resource.
    .DESCRIPTION
        Binding object showing the trapinsertionurl that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER TrapInsertIonURL
        Bind the trap URL for the configured request URLs. Maximum 30 bindings can be configured per profile.
    .PARAMETER BotTrapURL
        Request URL regex pattern for which Trap URL is inserted. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileTrapInsertIonURLBinding -Name 'example' -TrapInsertIonURL $true -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileTrapInsertIonURLBinding -Name 'botprofile_trapinsertionurl_binding_example' | Invoke-NSDeleteBotProfileTrapInsertIonURLBinding -Confirm:$false
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
        [bool] $TrapInsertIonURL,

        [Parameter()]
        [string] $BotTrapURL,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('TrapInsertIonURL')) {
            $argumentParts += 'trapinsertionurl:' + $TrapInsertIonURL
        }
        if ($PSBoundParameters.ContainsKey('BotTrapURL')) {
            $argumentParts += 'bot_trap_url:' + $BotTrapURL
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_trapinsertionurl_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_trapinsertionurl_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileTrapInsertIonURLBinding

# region Invoke-NSDeleteBotProfileWhitelistBinding
function Invoke-NSDeleteBotProfileWhitelistBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler botprofile_whitelist_binding resource.
    .DESCRIPTION
        Binding object showing the whitelist that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER BotWhitelist
        Whitelist binding. Maximum 32 bindings can be configured per profile for Whitelist detection.
    .PARAMETER BotWhitelistValue
        Value of bot white-list entry.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotProfileWhitelistBinding -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotProfileWhitelistBinding -Name 'botprofile_whitelist_binding_example' | Invoke-NSDeleteBotProfileWhitelistBinding -Confirm:$false
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
        [bool] $BotWhitelist,

        [Parameter()]
        [string] $BotWhitelistValue,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
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
        if ($PSBoundParameters.ContainsKey('BotWhitelist')) {
            $argumentParts += 'bot_whitelist:' + $BotWhitelist
        }
        if ($PSBoundParameters.ContainsKey('BotWhitelistValue')) {
            $argumentParts += 'bot_whitelist_value:' + $BotWhitelistValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botprofile_whitelist_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botprofile_whitelist_binding -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotProfileWhitelistBinding

# region Invoke-NSDeleteBotSignature
function Invoke-NSDeleteBotSignature {
    <#
    .SYNOPSIS
        Removes a NetScaler botsignature resource.
    .DESCRIPTION
        Configuration for bot signatures resource.
    .PARAMETER Name
        Name to assign to the bot signature file object on the Citrix ADC. Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteBotSignature -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetBotSignature -Name 'botsignature_example' | Invoke-NSDeleteBotSignature -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete botsignature')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type botsignature -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteBotSignature

# region Invoke-NSGetBotGlobalBinding
function Invoke-NSGetBotGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to botglobal.
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
        Invoke-NSGetBotGlobalBinding
    .EXAMPLE
        Invoke-NSGetBotGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetBotGlobalBinding

# region Invoke-NSGetBotGlobalBotPolicyBinding
function Invoke-NSGetBotGlobalBotPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botglobal_botpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to botglobal.
    .PARAMETER Type
        Specifies the bind point whose policies you want to display. Available settings function as follows: * REQ_OVERRIDE - Request override. Binds the policy to the priority request queue. * REQ_DEFAULT - Binds the policy to the default request queue. Possible values = REQ_OVERRIDE, REQ_DEFAULT
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
        Invoke-NSGetBotGlobalBotPolicyBinding
    .EXAMPLE
        Invoke-NSGetBotGlobalBotPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('REQ_OVERRIDE', 'REQ_DEFAULT')]
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
            Type = 'botglobal_botpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetBotGlobalBotPolicyBinding

# region Invoke-NSGetBotPolicy
function Invoke-NSGetBotPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicy configuration.
    .DESCRIPTION
        Configuration for Bot policy resource.
    .PARAMETER Name
        Name for the bot policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the bot policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my bot policy" or 'my bot policy').
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
        Invoke-NSGetBotPolicy
    .EXAMPLE
        Invoke-NSGetBotPolicy -Name 'botpolicy_example'
    .EXAMPLE
        Invoke-NSGetBotPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicy'
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
# endregion Invoke-NSGetBotPolicy

# region Invoke-NSGetBotPolicyBinding
function Invoke-NSGetBotPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to botpolicy.
    .PARAMETER Name
        Name of the bot policy for which to display settings.
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
        Invoke-NSGetBotPolicyBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyBinding -Name 'botpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicy_binding'
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
# endregion Invoke-NSGetBotPolicyBinding

# region Invoke-NSGetBotPolicyBotGlobalBinding
function Invoke-NSGetBotPolicyBotGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicy_botglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the botglobal that can be bound to botpolicy.
    .PARAMETER Name
        Name of the bot policy for which to display settings.
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
        Invoke-NSGetBotPolicyBotGlobalBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyBotGlobalBinding -Name 'botpolicy_botglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyBotGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicy_botglobal_binding'
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
# endregion Invoke-NSGetBotPolicyBotGlobalBinding

# region Invoke-NSGetBotPolicyBotPolicyLabelBinding
function Invoke-NSGetBotPolicyBotPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicy_botpolicylabel_binding configuration.
    .DESCRIPTION
        Binding object showing the botpolicylabel that can be bound to botpolicy.
    .PARAMETER Name
        Name of the bot policy for which to display settings.
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
        Invoke-NSGetBotPolicyBotPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyBotPolicyLabelBinding -Name 'botpolicy_botpolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyBotPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicy_botpolicylabel_binding'
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
# endregion Invoke-NSGetBotPolicyBotPolicyLabelBinding

# region Invoke-NSGetBotPolicyCSVServerBinding
function Invoke-NSGetBotPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to botpolicy.
    .PARAMETER Name
        Name of the bot policy for which to display settings.
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
        Invoke-NSGetBotPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyCSVServerBinding -Name 'botpolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicy_csvserver_binding'
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
# endregion Invoke-NSGetBotPolicyCSVServerBinding

# region Invoke-NSGetBotPolicyLabel
function Invoke-NSGetBotPolicyLabel {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicylabel configuration.
    .DESCRIPTION
        Configuration for Bot policy label resource.
    .PARAMETER LabelName
        Name for the bot policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
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
        Invoke-NSGetBotPolicyLabel
    .EXAMPLE
        Invoke-NSGetBotPolicyLabel -LabelName 'botpolicylabel_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyLabel -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicylabel'
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
# endregion Invoke-NSGetBotPolicyLabel

# region Invoke-NSGetBotPolicyLabelBinding
function Invoke-NSGetBotPolicyLabelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicylabel_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to botpolicylabel.
    .PARAMETER LabelName
        Name of the bot policy label.
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
        Invoke-NSGetBotPolicyLabelBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyLabelBinding -LabelName 'botpolicylabel_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyLabelBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicylabel_binding'
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
# endregion Invoke-NSGetBotPolicyLabelBinding

# region Invoke-NSGetBotPolicyLabelBotPolicyBinding
function Invoke-NSGetBotPolicyLabelBotPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicylabel_botpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the botpolicy that can be bound to botpolicylabel.
    .PARAMETER LabelName
        Name of the bot policy label to which to bind the policy.
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
        Invoke-NSGetBotPolicyLabelBotPolicyBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyLabelBotPolicyBinding -LabelName 'botpolicylabel_botpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyLabelBotPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicylabel_botpolicy_binding'
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
# endregion Invoke-NSGetBotPolicyLabelBotPolicyBinding

# region Invoke-NSGetBotPolicyLabelPolicyBindingBinding
function Invoke-NSGetBotPolicyLabelPolicyBindingBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicylabel_policybinding_binding configuration.
    .DESCRIPTION
        Binding object showing the policybinding that can be bound to botpolicylabel.
    .PARAMETER LabelName
        Name of the bot policy label to which to bind the policy.
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
        Invoke-NSGetBotPolicyLabelPolicyBindingBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyLabelPolicyBindingBinding -LabelName 'botpolicylabel_policybinding_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyLabelPolicyBindingBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicylabel_policybinding_binding'
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
# endregion Invoke-NSGetBotPolicyLabelPolicyBindingBinding

# region Invoke-NSGetBotPolicyLBVServerBinding
function Invoke-NSGetBotPolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botpolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to botpolicy.
    .PARAMETER Name
        Name of the bot policy for which to display settings.
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
        Invoke-NSGetBotPolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetBotPolicyLBVServerBinding -Name 'botpolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetBotPolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botpolicy_lbvserver_binding'
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
# endregion Invoke-NSGetBotPolicyLBVServerBinding

# region Invoke-NSGetBotProfile
function Invoke-NSGetBotProfile {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile configuration.
    .DESCRIPTION
        Configuration for Bot profile resource.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfile
    .EXAMPLE
        Invoke-NSGetBotProfile -Name 'botprofile_example'
    .EXAMPLE
        Invoke-NSGetBotProfile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile'
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
# endregion Invoke-NSGetBotProfile

# region Invoke-NSGetBotProfileBinding
function Invoke-NSGetBotProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to botprofile.
    .PARAMETER Name
        Name of the bot management profile. Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileBinding
    .EXAMPLE
        Invoke-NSGetBotProfileBinding -Name 'botprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_binding'
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
# endregion Invoke-NSGetBotProfileBinding

# region Invoke-NSGetBotProfileBlacklistBinding
function Invoke-NSGetBotProfileBlacklistBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_blacklist_binding configuration.
    .DESCRIPTION
        Binding object showing the blacklist that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileBlacklistBinding
    .EXAMPLE
        Invoke-NSGetBotProfileBlacklistBinding -Name 'botprofile_blacklist_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileBlacklistBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_blacklist_binding'
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
# endregion Invoke-NSGetBotProfileBlacklistBinding

# region Invoke-NSGetBotProfileCaptchaBinding
function Invoke-NSGetBotProfileCaptchaBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_captcha_binding configuration.
    .DESCRIPTION
        Binding object showing the captcha that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileCaptchaBinding
    .EXAMPLE
        Invoke-NSGetBotProfileCaptchaBinding -Name 'botprofile_captcha_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileCaptchaBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_captcha_binding'
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
# endregion Invoke-NSGetBotProfileCaptchaBinding

# region Invoke-NSGetBotProfileIpreputationBinding
function Invoke-NSGetBotProfileIpreputationBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_ipreputation_binding configuration.
    .DESCRIPTION
        Binding object showing the ipreputation that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileIpreputationBinding
    .EXAMPLE
        Invoke-NSGetBotProfileIpreputationBinding -Name 'botprofile_ipreputation_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileIpreputationBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_ipreputation_binding'
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
# endregion Invoke-NSGetBotProfileIpreputationBinding

# region Invoke-NSGetBotProfileKmdetectionexprBinding
function Invoke-NSGetBotProfileKmdetectionexprBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_kmdetectionexpr_binding configuration.
    .DESCRIPTION
        Binding object showing the kmdetectionexpr that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileKmdetectionexprBinding
    .EXAMPLE
        Invoke-NSGetBotProfileKmdetectionexprBinding -Name 'botprofile_kmdetectionexpr_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileKmdetectionexprBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_kmdetectionexpr_binding'
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
# endregion Invoke-NSGetBotProfileKmdetectionexprBinding

# region Invoke-NSGetBotProfileLogexpressionBinding
function Invoke-NSGetBotProfileLogexpressionBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_logexpression_binding configuration.
    .DESCRIPTION
        Binding object showing the logexpression that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileLogexpressionBinding
    .EXAMPLE
        Invoke-NSGetBotProfileLogexpressionBinding -Name 'botprofile_logexpression_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileLogexpressionBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_logexpression_binding'
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
# endregion Invoke-NSGetBotProfileLogexpressionBinding

# region Invoke-NSGetBotProfileRatelimitBinding
function Invoke-NSGetBotProfileRatelimitBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_ratelimit_binding configuration.
    .DESCRIPTION
        Binding object showing the ratelimit that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileRatelimitBinding
    .EXAMPLE
        Invoke-NSGetBotProfileRatelimitBinding -Name 'botprofile_ratelimit_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileRatelimitBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_ratelimit_binding'
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
# endregion Invoke-NSGetBotProfileRatelimitBinding

# region Invoke-NSGetBotProfileTpsBinding
function Invoke-NSGetBotProfileTpsBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_tps_binding configuration.
    .DESCRIPTION
        Binding object showing the tps that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileTpsBinding
    .EXAMPLE
        Invoke-NSGetBotProfileTpsBinding -Name 'botprofile_tps_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileTpsBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_tps_binding'
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
# endregion Invoke-NSGetBotProfileTpsBinding

# region Invoke-NSGetBotProfileTrapInsertIonURLBinding
function Invoke-NSGetBotProfileTrapInsertIonURLBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_trapinsertionurl_binding configuration.
    .DESCRIPTION
        Binding object showing the trapinsertionurl that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileTrapInsertIonURLBinding
    .EXAMPLE
        Invoke-NSGetBotProfileTrapInsertIonURLBinding -Name 'botprofile_trapinsertionurl_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileTrapInsertIonURLBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_trapinsertionurl_binding'
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
# endregion Invoke-NSGetBotProfileTrapInsertIonURLBinding

# region Invoke-NSGetBotProfileWhitelistBinding
function Invoke-NSGetBotProfileWhitelistBinding {
    <#
    .SYNOPSIS
        Gets NetScaler botprofile_whitelist_binding configuration.
    .DESCRIPTION
        Binding object showing the whitelist that can be bound to botprofile.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotProfileWhitelistBinding
    .EXAMPLE
        Invoke-NSGetBotProfileWhitelistBinding -Name 'botprofile_whitelist_binding_example'
    .EXAMPLE
        Invoke-NSGetBotProfileWhitelistBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botprofile_whitelist_binding'
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
# endregion Invoke-NSGetBotProfileWhitelistBinding

# region Invoke-NSGetBotSettings
function Invoke-NSGetBotSettings {
    <#
    .SYNOPSIS
        Gets NetScaler botsettings configuration.
    .DESCRIPTION
        Configuration for Bot engine settings resource.
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
        Invoke-NSGetBotSettings
    .EXAMPLE
        Invoke-NSGetBotSettings -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botsettings'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetBotSettings

# region Invoke-NSGetBotSignature
function Invoke-NSGetBotSignature {
    <#
    .SYNOPSIS
        Gets NetScaler botsignature configuration.
    .DESCRIPTION
        Configuration for bot signatures resource.
    .PARAMETER Name
        Name to assign to the bot signature file object on the Citrix ADC. Minimum length = 1 Maximum length = 31
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
        Invoke-NSGetBotSignature
    .EXAMPLE
        Invoke-NSGetBotSignature -Name 'botsignature_example'
    .EXAMPLE
        Invoke-NSGetBotSignature -Filter @{ servicetype = 'HTTP' }
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
            Type = 'botsignature'
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
# endregion Invoke-NSGetBotSignature

# region Invoke-NSImportBotSignature
function Invoke-NSImportBotSignature {
    <#
    .SYNOPSIS
        Imports NetScaler botsignature data.
    .DESCRIPTION
        Configuration for bot signatures resource.
    .PARAMETER Comment
        Any comments to preserve information about the signature file object. Maximum length = 128
    .PARAMETER Name
        Name to assign to the bot signature file object on the Citrix ADC. Minimum length = 1 Maximum length = 31
    .PARAMETER Overwrite
        Overwrites the existing file.
    .PARAMETER Src
        Local path to and name of, or URL (protocol, host, path, and file name) for, the file in which to store the imported signature file. NOTE: The import fails if the object to be imported is on an HTTPS server that requires client certificate authentication for access. Minimum length = 1 Maximum length = 2047
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSImportBotSignature -Name 'example'
    .EXAMPLE
        Invoke-NSImportBotSignature -Name 'example' -WhatIf
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
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $Comment }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }
        if ($PSBoundParameters.ContainsKey('Overwrite')) { $body['overwrite'] = $Overwrite }
        if ($PSBoundParameters.ContainsKey('Src')) { $body['src'] = $Src }

        if ($PSCmdlet.ShouldProcess('botsignature', 'Import botsignature')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botsignature -Action Import -Payload @{ botsignature = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSImportBotSignature

# region Invoke-NSRenameBotPolicy
function Invoke-NSRenameBotPolicy {
    <#
    .SYNOPSIS
        Renames a NetScaler botpolicy resource.
    .DESCRIPTION
        Configuration for Bot policy resource.
    .PARAMETER Name
        Name for the bot policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the bot policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my bot policy" or 'my bot policy').
    .PARAMETER NewName
        New name for the bot policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my bot policy" or 'my bot policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameBotPolicy -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameBotPolicy -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename botpolicy')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botpolicy -Action rename -Payload @{ botpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetBotPolicy -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameBotPolicy

# region Invoke-NSRenameBotPolicyLabel
function Invoke-NSRenameBotPolicyLabel {
    <#
    .SYNOPSIS
        Renames a NetScaler botpolicylabel resource.
    .DESCRIPTION
        Configuration for Bot policy label resource.
    .PARAMETER LabelName
        Name for the bot policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the responder policy label is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder policy label" or my responder policy label').
    .PARAMETER NewName
        New name for the bot policy label. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameBotPolicyLabel -LabelName 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameBotPolicyLabel -LabelName 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$LabelName", 'Rename botpolicylabel')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botpolicylabel -Action rename -Payload @{ botpolicylabel = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetBotPolicyLabel -LabelName $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameBotPolicyLabel

# region Invoke-NSUnsetBotPolicy
function Invoke-NSUnsetBotPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler botpolicy resource properties.
    .DESCRIPTION
        Configuration for Bot policy resource.
    .PARAMETER Name
        Name for the bot policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the bot policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my bot policy" or 'my bot policy').
    .PARAMETER Comment
        Any type of information about this bot policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER UndefAction
        Action to perform if the result of policy evaluation is undefined (UNDEF). An UNDEF event indicates an internal error condition.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetBotPolicy -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUnsetBotPolicy -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('LogAction')) { $body['logaction'] = $true }
        if ($PSBoundParameters.ContainsKey('UndefAction')) { $body['undefaction'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear botpolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botpolicy -Action unset -Payload @{ botpolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetBotPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetBotPolicy

# region Invoke-NSUnsetBotProfile
function Invoke-NSUnsetBotProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler botprofile resource properties.
    .DESCRIPTION
        Configuration for Bot profile resource.
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER AddCookieFlags
        Add the specified flags to bot session cookies. Available settings function as follows: * None - Do not add flags to cookies. * HTTP Only - Add the HTTP Only flag to cookies, which prevents scripts from accessing cookies. * Secure - Add Secure flag to cookies. * All - Add both HTTPOnly and Secure flags to cookies. Default value: httpOnly Possible values = none, httpOnly, secure, all
    .PARAMETER BotEnableBlackList
        Enable black-list bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableIpReputation
        Enable IP-reputation bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableRateLimit
        Enable rate-limit bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableTps
        Enable TPS. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableWhiteList
        Enable white-list bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER ClientIpexpression
        Expression to get the client IP.
    .PARAMETER Comment
        Any comments about the purpose of profile, or other useful information about the profile. Minimum length = 1
    .PARAMETER Devicefingerprint
        Enable device-fingerprint bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER DevicefingerprintAction
        Action to be taken for device-fingerprint based bot detection. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET, MITIGATION
    .PARAMETER Devicefingerprintmobile
        Enabling bot device fingerprint protection for mobile clients. Default value: NONE Possible values = NONE, Android, iOS
    .PARAMETER DfpRequestLimit
        Number of requests to allow without bot session cookie if device fingerprint is enabled. Minimum value = 1
    .PARAMETER ErrorURL
        URL that Bot protection uses as the Error URL. Minimum length = 1
    .PARAMETER Headlessbrowserdetection
        Enable Headless Browser detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER Kmdetection
        Enable keyboard-mouse based bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER Kmeventspostbodylimit
        Size of the KM data send by the browser, needs to be processed on ADC. Minimum value = 1 Maximum value = 204800
    .PARAMETER KmjavascriptName
        Name of the JavaScript file that the Bot Management feature will insert in the response for keyboard-mouse based detection. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my javascript file name" or 'my javascript file name').
    .PARAMETER SessionCookieName
        Name of the SessionCookie that the Bot Management feature uses for tracking. Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name'). Minimum length = 1
    .PARAMETER SessionTimeout
        Timeout, in seconds, after which a user session is terminated. Minimum value = 1 Maximum value = 65535
    .PARAMETER Signature
        Name of object containing bot static signature details. Minimum length = 1
    .PARAMETER SignatureMultiPleUserAgentHeaderAction
        Actions to be taken if multiple User-Agent headers are seen in a request (Applicable if Signature check is enabled). Log action should be combined with other actions. Default value: CHECKLAST Possible values = CHECKLAST, LOG, DROP, REDIRECT, RESET
    .PARAMETER SignatureNoUserAgentHeaderAction
        Actions to be taken if no User-Agent header in the request (Applicable if Signature check is enabled). Default value: DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER SpoofedreqAction
        Actions to be taken on a spoofed request (A request spoofing good bot user agent string). Default value: BOT_ACTION_LOG_DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER Trap
        Enable trap bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER TrapAction
        Action to be taken for bot trap based bot detection. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER TrapURL
        URL that Bot protection uses as the Trap URL. Minimum length = 1 Maximum length = 127
    .PARAMETER Verboseloglevel
        Bot verbose Logging. Based on the log level, ADC will log additional information whenever client is detected as a bot. Default value: NONE Possible values = NONE, HTTP_FULL_HEADER
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetBotProfile -Name 'example' -AddCookieFlags none -PassThru
    .EXAMPLE
        Invoke-NSUnsetBotProfile -Name 'example' -AddCookieFlags none -WhatIf
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
        [ValidateSet('none', 'httpOnly', 'secure', 'all')]
        [switch] $AddCookieFlags,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $BotEnableBlackList,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $BotEnableIpReputation,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $BotEnableRateLimit,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $BotEnableTps,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $BotEnableWhiteList,

        [Parameter()]
        [switch] $ClientIpexpression,

        [Parameter()]
        [switch] $Comment,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Devicefingerprint,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET', 'MITIGATION')]
        [switch] $DevicefingerprintAction,

        [Parameter()]
        [ValidateSet('NONE', 'Android', 'iOS')]
        [switch] $Devicefingerprintmobile,

        [Parameter()]
        [switch] $DfpRequestLimit,

        [Parameter()]
        [switch] $ErrorURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Headlessbrowserdetection,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Kmdetection,

        [Parameter()]
        [switch] $Kmeventspostbodylimit,

        [Parameter()]
        [switch] $KmjavascriptName,

        [Parameter()]
        [switch] $SessionCookieName,

        [Parameter()]
        [switch] $SessionTimeout,

        [Parameter()]
        [switch] $Signature,

        [Parameter()]
        [ValidateSet('CHECKLAST', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [switch] $SignatureMultiPleUserAgentHeaderAction,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [switch] $SignatureNoUserAgentHeaderAction,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [switch] $SpoofedreqAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $Trap,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [switch] $TrapAction,

        [Parameter()]
        [switch] $TrapURL,

        [Parameter()]
        [ValidateSet('NONE', 'HTTP_FULL_HEADER')]
        [switch] $Verboseloglevel,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('AddCookieFlags')) { $body['addcookieflags'] = $true }
        if ($PSBoundParameters.ContainsKey('BotEnableBlackList')) { $body['bot_enable_black_list'] = $true }
        if ($PSBoundParameters.ContainsKey('BotEnableIpReputation')) { $body['bot_enable_ip_reputation'] = $true }
        if ($PSBoundParameters.ContainsKey('BotEnableRateLimit')) { $body['bot_enable_rate_limit'] = $true }
        if ($PSBoundParameters.ContainsKey('BotEnableTps')) { $body['bot_enable_tps'] = $true }
        if ($PSBoundParameters.ContainsKey('BotEnableWhiteList')) { $body['bot_enable_white_list'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientIpexpression')) { $body['clientipexpression'] = $true }
        if ($PSBoundParameters.ContainsKey('Comment')) { $body['comment'] = $true }
        if ($PSBoundParameters.ContainsKey('Devicefingerprint')) { $body['devicefingerprint'] = $true }
        if ($PSBoundParameters.ContainsKey('DevicefingerprintAction')) { $body['devicefingerprintaction'] = $true }
        if ($PSBoundParameters.ContainsKey('Devicefingerprintmobile')) { $body['devicefingerprintmobile'] = $true }
        if ($PSBoundParameters.ContainsKey('DfpRequestLimit')) { $body['dfprequestlimit'] = $true }
        if ($PSBoundParameters.ContainsKey('ErrorURL')) { $body['errorurl'] = $true }
        if ($PSBoundParameters.ContainsKey('Headlessbrowserdetection')) { $body['headlessbrowserdetection'] = $true }
        if ($PSBoundParameters.ContainsKey('Kmdetection')) { $body['kmdetection'] = $true }
        if ($PSBoundParameters.ContainsKey('Kmeventspostbodylimit')) { $body['kmeventspostbodylimit'] = $true }
        if ($PSBoundParameters.ContainsKey('KmjavascriptName')) { $body['kmjavascriptname'] = $true }
        if ($PSBoundParameters.ContainsKey('SessionCookieName')) { $body['sessioncookiename'] = $true }
        if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $body['sessiontimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Signature')) { $body['signature'] = $true }
        if ($PSBoundParameters.ContainsKey('SignatureMultiPleUserAgentHeaderAction')) { $body['signaturemultipleuseragentheaderaction'] = $true }
        if ($PSBoundParameters.ContainsKey('SignatureNoUserAgentHeaderAction')) { $body['signaturenouseragentheaderaction'] = $true }
        if ($PSBoundParameters.ContainsKey('SpoofedreqAction')) { $body['spoofedreqaction'] = $true }
        if ($PSBoundParameters.ContainsKey('Trap')) { $body['trap'] = $true }
        if ($PSBoundParameters.ContainsKey('TrapAction')) { $body['trapaction'] = $true }
        if ($PSBoundParameters.ContainsKey('TrapURL')) { $body['trapurl'] = $true }
        if ($PSBoundParameters.ContainsKey('Verboseloglevel')) { $body['verboseloglevel'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear botprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botprofile -Action unset -Payload @{ botprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetBotProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetBotProfile

# region Invoke-NSUnsetBotSettings
function Invoke-NSUnsetBotSettings {
    <#
    .SYNOPSIS
        Clears one or more NetScaler botsettings resource properties.
    .DESCRIPTION
        Configuration for Bot engine settings resource.
    .PARAMETER DefaultnonintrusiveProfile
        Profile to use when the feature is not enabled but feature is licensed. NonIntrusive checks will be disabled and IPRep cronjob(24 Hours) will be removed if this is set to BOT_BYPASS. Default value: BOT_STATS Minimum length = 1 Possible values = BOT_BYPASS, BOT_STATS, BOT_LOG
    .PARAMETER DefaultProfile
        Profile to use when a connection does not match any policy. Default setting is " ", which sends unmatched connections back to the Citrix ADC without attempting to filter them further. Minimum length = 1
    .PARAMETER DfpRequestLimit
        Number of requests to allow without bot session cookie if device fingerprint is enabled. Minimum value = 1
    .PARAMETER JavascriptName
        Name of the JavaScript that the Bot Management feature uses in response. Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name'). Minimum length = 1
    .PARAMETER ProxyPassword
        Password with which user logs on. Minimum length = 1
    .PARAMETER ProxyPort
        Proxy Server Port to get updated signatures from AWS. Default value: 8080 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProxyServer
        Proxy Server IP to get updated signatures from AWS.
    .PARAMETER ProxyUserName
        Proxy Username. Minimum length = 1
    .PARAMETER SessionCookieName
        Name of the SessionCookie that the Bot Management feature uses for tracking. Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name'). Minimum length = 1
    .PARAMETER SessionTimeout
        Timeout, in seconds, after which a user session is terminated. Minimum value = 1 Maximum value = 65535
    .PARAMETER SignatureAutoupdate
        Flag used to enable/disable bot auto update signatures. Default value: OFF Possible values = ON, OFF
    .PARAMETER SignatureURL
        URL to download the bot signature mapping file from server. Default value: https://nsbotsignatures.s3.amazonaws.com/BotSignatureMapping.json
    .PARAMETER TrapURLAutogenerate
        Enable/disable trap URL auto generation. When enabled, trap URL is updated within the configured interval. Default value: OFF Possible values = ON, OFF
    .PARAMETER TrapURLInterval
        Time in seconds after which trap URL is updated. Default value: 3600 Minimum value = 300 Maximum value = 86400
    .PARAMETER TrapURLLength
        Length of the auto-generated trap URL. Default value: 32 Minimum value = 10 Maximum value = 255
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetBotSettings -DefaultnonintrusiveProfile BOT_BYPASS -PassThru
    .EXAMPLE
        Invoke-NSUnsetBotSettings -DefaultnonintrusiveProfile BOT_BYPASS -WhatIf
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
        [ValidateSet('BOT_BYPASS', 'BOT_STATS', 'BOT_LOG')]
        [switch] $DefaultnonintrusiveProfile,

        [Parameter()]
        [switch] $DefaultProfile,

        [Parameter()]
        [switch] $DfpRequestLimit,

        [Parameter()]
        [switch] $JavascriptName,

        [Parameter()]
        [switch] $ProxyPassword,

        [Parameter()]
        [switch] $ProxyPort,

        [Parameter()]
        [switch] $ProxyServer,

        [Parameter()]
        [switch] $ProxyUserName,

        [Parameter()]
        [switch] $SessionCookieName,

        [Parameter()]
        [switch] $SessionTimeout,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $SignatureAutoupdate,

        [Parameter()]
        [switch] $SignatureURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [switch] $TrapURLAutogenerate,

        [Parameter()]
        [switch] $TrapURLInterval,

        [Parameter()]
        [switch] $TrapURLLength,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('DefaultnonintrusiveProfile')) { $body['defaultnonintrusiveprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('DefaultProfile')) { $body['defaultprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('DfpRequestLimit')) { $body['dfprequestlimit'] = $true }
        if ($PSBoundParameters.ContainsKey('JavascriptName')) { $body['javascriptname'] = $true }
        if ($PSBoundParameters.ContainsKey('ProxyPassword')) { $body['proxypassword'] = $true }
        if ($PSBoundParameters.ContainsKey('ProxyPort')) { $body['proxyport'] = $true }
        if ($PSBoundParameters.ContainsKey('ProxyServer')) { $body['proxyserver'] = $true }
        if ($PSBoundParameters.ContainsKey('ProxyUserName')) { $body['proxyusername'] = $true }
        if ($PSBoundParameters.ContainsKey('SessionCookieName')) { $body['sessioncookiename'] = $true }
        if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $body['sessiontimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('SignatureAutoupdate')) { $body['signatureautoupdate'] = $true }
        if ($PSBoundParameters.ContainsKey('SignatureURL')) { $body['signatureurl'] = $true }
        if ($PSBoundParameters.ContainsKey('TrapURLAutogenerate')) { $body['trapurlautogenerate'] = $true }
        if ($PSBoundParameters.ContainsKey('TrapURLInterval')) { $body['trapurlinterval'] = $true }
        if ($PSBoundParameters.ContainsKey('TrapURLLength')) { $body['trapurllength'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('botsettings', 'Clear botsettings properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botsettings -Action unset -Payload @{ botsettings = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetBotSettings

# region Invoke-NSUpdateBotPolicy
function Invoke-NSUpdateBotPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler botpolicy resource.
    .DESCRIPTION
        Configuration for Bot policy resource.
    .PARAMETER Comment
        Any type of information about this bot policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the bot policy. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Can be changed after the bot policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my bot policy" or 'my bot policy').
    .PARAMETER ProfileName
        Name of the bot profile to apply if the request matches this bot policy.
    .PARAMETER Rule
        Expression that the policy uses to determine whether to apply bot profile on the specified request.
    .PARAMETER UndefAction
        Action to perform if the result of policy evaluation is undefined (UNDEF). An UNDEF event indicates an internal error condition.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateBotPolicy -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateBotPolicy -Name 'example' -Comment 'Updated by automation' -WhatIf
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

        [Parameter()]
        [string] $LogAction,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $ProfileName,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ProfileName')) { $properties['profilename'] = $ProfileName }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }
    if ($PSBoundParameters.ContainsKey('UndefAction')) { $properties['undefaction'] = $UndefAction }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update botpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type botpolicy -Payload @{ botpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateBotPolicy

# region Invoke-NSUpdateBotProfile
function Invoke-NSUpdateBotProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler botprofile resource.
    .DESCRIPTION
        Configuration for Bot profile resource.
    .PARAMETER AddCookieFlags
        Add the specified flags to bot session cookies. Available settings function as follows: * None - Do not add flags to cookies. * HTTP Only - Add the HTTP Only flag to cookies, which prevents scripts from accessing cookies. * Secure - Add Secure flag to cookies. * All - Add both HTTPOnly and Secure flags to cookies. Default value: httpOnly Possible values = none, httpOnly, secure, all
    .PARAMETER BotEnableBlackList
        Enable black-list bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableIpReputation
        Enable IP-reputation bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableRateLimit
        Enable rate-limit bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableTps
        Enable TPS. Default value: OFF Possible values = ON, OFF
    .PARAMETER BotEnableWhiteList
        Enable white-list bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER ClientIpexpression
        Expression to get the client IP.
    .PARAMETER Comment
        Any comments about the purpose of profile, or other useful information about the profile. Minimum length = 1
    .PARAMETER Devicefingerprint
        Enable device-fingerprint bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER DevicefingerprintAction
        Action to be taken for device-fingerprint based bot detection. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET, MITIGATION
    .PARAMETER Devicefingerprintmobile
        Enabling bot device fingerprint protection for mobile clients. Default value: NONE Possible values = NONE, Android, iOS
    .PARAMETER DfpRequestLimit
        Number of requests to allow without bot session cookie if device fingerprint is enabled. Minimum value = 1
    .PARAMETER ErrorURL
        URL that Bot protection uses as the Error URL. Minimum length = 1
    .PARAMETER Headlessbrowserdetection
        Enable Headless Browser detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER Kmdetection
        Enable keyboard-mouse based bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER Kmeventspostbodylimit
        Size of the KM data send by the browser, needs to be processed on ADC. Minimum value = 1 Maximum value = 204800
    .PARAMETER KmjavascriptName
        Name of the JavaScript file that the Bot Management feature will insert in the response for keyboard-mouse based detection. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my javascript file name" or 'my javascript file name').
    .PARAMETER Name
        Name for the profile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. Cannot be changed after the profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile'). Minimum length = 1 Maximum length = 31
    .PARAMETER SessionCookieName
        Name of the SessionCookie that the Bot Management feature uses for tracking. Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name'). Minimum length = 1
    .PARAMETER SessionTimeout
        Timeout, in seconds, after which a user session is terminated. Minimum value = 1 Maximum value = 65535
    .PARAMETER Signature
        Name of object containing bot static signature details. Minimum length = 1
    .PARAMETER SignatureMultiPleUserAgentHeaderAction
        Actions to be taken if multiple User-Agent headers are seen in a request (Applicable if Signature check is enabled). Log action should be combined with other actions. Default value: CHECKLAST Possible values = CHECKLAST, LOG, DROP, REDIRECT, RESET
    .PARAMETER SignatureNoUserAgentHeaderAction
        Actions to be taken if no User-Agent header in the request (Applicable if Signature check is enabled). Default value: DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER SpoofedreqAction
        Actions to be taken on a spoofed request (A request spoofing good bot user agent string). Default value: BOT_ACTION_LOG_DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER Trap
        Enable trap bot detection. Default value: OFF Possible values = ON, OFF
    .PARAMETER TrapAction
        Action to be taken for bot trap based bot detection. Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET
    .PARAMETER TrapURL
        URL that Bot protection uses as the Trap URL. Minimum length = 1 Maximum length = 127
    .PARAMETER Verboseloglevel
        Bot verbose Logging. Based on the log level, ADC will log additional information whenever client is detected as a bot. Default value: NONE Possible values = NONE, HTTP_FULL_HEADER
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateBotProfile -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateBotProfile -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [string] $AddCookieFlags,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableBlackList,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableIpReputation,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableRateLimit,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableTps,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $BotEnableWhiteList,

        [Parameter()]
        [string] $ClientIpexpression,

        [Parameter()]
        [string] $Comment,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Devicefingerprint,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET', 'MITIGATION')]
        [string[]] $DevicefingerprintAction,

        [Parameter()]
        [ValidateSet('NONE', 'Android', 'iOS')]
        [string[]] $Devicefingerprintmobile,

        [Parameter()]
        [int] $DfpRequestLimit,

        [Parameter()]
        [string] $ErrorURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Headlessbrowserdetection,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Kmdetection,

        [Parameter()]
        [int] $Kmeventspostbodylimit,

        [Parameter()]
        [string] $KmjavascriptName,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $SessionCookieName,

        [Parameter()]
        [int] $SessionTimeout,

        [Parameter()]
        [string] $Signature,

        [Parameter()]
        [ValidateSet('CHECKLAST', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $SignatureMultiPleUserAgentHeaderAction,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $SignatureNoUserAgentHeaderAction,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $SpoofedreqAction,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $Trap,

        [Parameter()]
        [ValidateSet('NONE', 'LOG', 'DROP', 'REDIRECT', 'RESET')]
        [string[]] $TrapAction,

        [Parameter()]
        [string] $TrapURL,

        [Parameter()]
        [ValidateSet('NONE', 'HTTP_FULL_HEADER')]
        [string] $Verboseloglevel,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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

    if ($PSBoundParameters.ContainsKey('AddCookieFlags')) {
        Assert-NSParameterValue -ParameterName 'AddCookieFlags' -Value $AddCookieFlags -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('none', 'httpOnly', 'secure', 'all') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AddCookieFlags')) { $properties['addcookieflags'] = $AddCookieFlags }
    if ($PSBoundParameters.ContainsKey('BotEnableBlackList')) { $properties['bot_enable_black_list'] = $BotEnableBlackList }
    if ($PSBoundParameters.ContainsKey('BotEnableIpReputation')) { $properties['bot_enable_ip_reputation'] = $BotEnableIpReputation }
    if ($PSBoundParameters.ContainsKey('BotEnableRateLimit')) { $properties['bot_enable_rate_limit'] = $BotEnableRateLimit }
    if ($PSBoundParameters.ContainsKey('BotEnableTps')) { $properties['bot_enable_tps'] = $BotEnableTps }
    if ($PSBoundParameters.ContainsKey('BotEnableWhiteList')) { $properties['bot_enable_white_list'] = $BotEnableWhiteList }
    if ($PSBoundParameters.ContainsKey('ClientIpexpression')) { $properties['clientipexpression'] = $ClientIpexpression }
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('Devicefingerprint')) { $properties['devicefingerprint'] = $Devicefingerprint }
    if ($PSBoundParameters.ContainsKey('DevicefingerprintAction')) { $properties['devicefingerprintaction'] = $DevicefingerprintAction }
    if ($PSBoundParameters.ContainsKey('Devicefingerprintmobile')) { $properties['devicefingerprintmobile'] = $Devicefingerprintmobile }
    if ($PSBoundParameters.ContainsKey('DfpRequestLimit')) { $properties['dfprequestlimit'] = $DfpRequestLimit }
    if ($PSBoundParameters.ContainsKey('ErrorURL')) { $properties['errorurl'] = $ErrorURL }
    if ($PSBoundParameters.ContainsKey('Headlessbrowserdetection')) { $properties['headlessbrowserdetection'] = $Headlessbrowserdetection }
    if ($PSBoundParameters.ContainsKey('Kmdetection')) { $properties['kmdetection'] = $Kmdetection }
    if ($PSBoundParameters.ContainsKey('Kmeventspostbodylimit')) { $properties['kmeventspostbodylimit'] = $Kmeventspostbodylimit }
    if ($PSBoundParameters.ContainsKey('KmjavascriptName')) { $properties['kmjavascriptname'] = $KmjavascriptName }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('SessionCookieName')) { $properties['sessioncookiename'] = $SessionCookieName }
    if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $properties['sessiontimeout'] = $SessionTimeout }
    if ($PSBoundParameters.ContainsKey('Signature')) { $properties['signature'] = $Signature }
    if ($PSBoundParameters.ContainsKey('SignatureMultiPleUserAgentHeaderAction')) { $properties['signaturemultipleuseragentheaderaction'] = $SignatureMultiPleUserAgentHeaderAction }
    if ($PSBoundParameters.ContainsKey('SignatureNoUserAgentHeaderAction')) { $properties['signaturenouseragentheaderaction'] = $SignatureNoUserAgentHeaderAction }
    if ($PSBoundParameters.ContainsKey('SpoofedreqAction')) { $properties['spoofedreqaction'] = $SpoofedreqAction }
    if ($PSBoundParameters.ContainsKey('Trap')) { $properties['trap'] = $Trap }
    if ($PSBoundParameters.ContainsKey('TrapAction')) { $properties['trapaction'] = $TrapAction }
    if ($PSBoundParameters.ContainsKey('TrapURL')) { $properties['trapurl'] = $TrapURL }
    if ($PSBoundParameters.ContainsKey('Verboseloglevel')) { $properties['verboseloglevel'] = $Verboseloglevel }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update botprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type botprofile -Payload @{ botprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetBotProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateBotProfile

# region Invoke-NSUpdateBotSettings
function Invoke-NSUpdateBotSettings {
    <#
    .SYNOPSIS
        Updates a NetScaler botsettings resource.
    .DESCRIPTION
        Configuration for Bot engine settings resource.
    .PARAMETER DefaultnonintrusiveProfile
        Profile to use when the feature is not enabled but feature is licensed. NonIntrusive checks will be disabled and IPRep cronjob(24 Hours) will be removed if this is set to BOT_BYPASS. Default value: BOT_STATS Minimum length = 1 Possible values = BOT_BYPASS, BOT_STATS, BOT_LOG
    .PARAMETER DefaultProfile
        Profile to use when a connection does not match any policy. Default setting is " ", which sends unmatched connections back to the Citrix ADC without attempting to filter them further. Minimum length = 1
    .PARAMETER DfpRequestLimit
        Number of requests to allow without bot session cookie if device fingerprint is enabled. Minimum value = 1
    .PARAMETER JavascriptName
        Name of the JavaScript that the Bot Management feature uses in response. Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name'). Minimum length = 1
    .PARAMETER ProxyPassword
        Password with which user logs on. Minimum length = 1
    .PARAMETER ProxyPort
        Proxy Server Port to get updated signatures from AWS. Default value: 8080 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProxyServer
        Proxy Server IP to get updated signatures from AWS.
    .PARAMETER ProxyUserName
        Proxy Username. Minimum length = 1
    .PARAMETER SessionCookieName
        Name of the SessionCookie that the Bot Management feature uses for tracking. Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name'). Minimum length = 1
    .PARAMETER SessionTimeout
        Timeout, in seconds, after which a user session is terminated. Minimum value = 1 Maximum value = 65535
    .PARAMETER SignatureAutoupdate
        Flag used to enable/disable bot auto update signatures. Default value: OFF Possible values = ON, OFF
    .PARAMETER SignatureURL
        URL to download the bot signature mapping file from server. Default value: https://nsbotsignatures.s3.amazonaws.com/BotSignatureMapping.json
    .PARAMETER TrapURLAutogenerate
        Enable/disable trap URL auto generation. When enabled, trap URL is updated within the configured interval. Default value: OFF Possible values = ON, OFF
    .PARAMETER TrapURLInterval
        Time in seconds after which trap URL is updated. Default value: 3600 Minimum value = 300 Maximum value = 86400
    .PARAMETER TrapURLLength
        Length of the auto-generated trap URL. Default value: 32 Minimum value = 10 Maximum value = 255
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateBotSettings  -PassThru
    .EXAMPLE
        Invoke-NSUpdateBotSettings  -WhatIf
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
        [ValidateSet('BOT_BYPASS', 'BOT_STATS', 'BOT_LOG')]
        [string] $DefaultnonintrusiveProfile,

        [Parameter()]
        [string] $DefaultProfile,

        [Parameter()]
        [int] $DfpRequestLimit,

        [Parameter()]
        [string] $JavascriptName,

        [Parameter()]
        [string] $ProxyPassword,

        [Parameter()]
        [int] $ProxyPort,

        [Parameter()]
        [string] $ProxyServer,

        [Parameter()]
        [string] $ProxyUserName,

        [Parameter()]
        [string] $SessionCookieName,

        [Parameter()]
        [int] $SessionTimeout,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $SignatureAutoupdate,

        [Parameter()]
        [string] $SignatureURL,

        [Parameter()]
        [ValidateSet('ON', 'OFF')]
        [string] $TrapURLAutogenerate,

        [Parameter()]
        [int] $TrapURLInterval,

        [Parameter()]
        [int] $TrapURLLength,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
    if ($PSBoundParameters.ContainsKey('DefaultnonintrusiveProfile')) { $properties['defaultnonintrusiveprofile'] = $DefaultnonintrusiveProfile }
    if ($PSBoundParameters.ContainsKey('DefaultProfile')) { $properties['defaultprofile'] = $DefaultProfile }
    if ($PSBoundParameters.ContainsKey('DfpRequestLimit')) { $properties['dfprequestlimit'] = $DfpRequestLimit }
    if ($PSBoundParameters.ContainsKey('JavascriptName')) { $properties['javascriptname'] = $JavascriptName }
    if ($PSBoundParameters.ContainsKey('ProxyPassword')) { $properties['proxypassword'] = $ProxyPassword }
    if ($PSBoundParameters.ContainsKey('ProxyPort')) { $properties['proxyport'] = $ProxyPort }
    if ($PSBoundParameters.ContainsKey('ProxyServer')) { $properties['proxyserver'] = $ProxyServer }
    if ($PSBoundParameters.ContainsKey('ProxyUserName')) { $properties['proxyusername'] = $ProxyUserName }
    if ($PSBoundParameters.ContainsKey('SessionCookieName')) { $properties['sessioncookiename'] = $SessionCookieName }
    if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $properties['sessiontimeout'] = $SessionTimeout }
    if ($PSBoundParameters.ContainsKey('SignatureAutoupdate')) { $properties['signatureautoupdate'] = $SignatureAutoupdate }
    if ($PSBoundParameters.ContainsKey('SignatureURL')) { $properties['signatureurl'] = $SignatureURL }
    if ($PSBoundParameters.ContainsKey('TrapURLAutogenerate')) { $properties['trapurlautogenerate'] = $TrapURLAutogenerate }
    if ($PSBoundParameters.ContainsKey('TrapURLInterval')) { $properties['trapurlinterval'] = $TrapURLInterval }
    if ($PSBoundParameters.ContainsKey('TrapURLLength')) { $properties['trapurllength'] = $TrapURLLength }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('botsettings', 'Update botsettings')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type botsettings -Payload @{ botsettings = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateBotSettings

# region Invoke-NSUpdateBotSignature
function Invoke-NSUpdateBotSignature {
    <#
    .SYNOPSIS
        Invokes the change operation for a NetScaler botsignature resource.
    .DESCRIPTION
        Configuration for bot signatures resource.
    .PARAMETER Name
        Name to assign to the bot signature file object on the Citrix ADC. Minimum length = 1 Maximum length = 31
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSUpdateBotSignature -Name 'example'
    .EXAMPLE
        Invoke-NSUpdateBotSignature -Name 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess('botsignature', 'Change botsignature')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type botsignature -Action update -Payload @{ botsignature = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSUpdateBotSignature

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD+YrSn7RosIZvM
# L/7Ie5Rf/VS407+3eMJJxY7ofG0wzaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAOxfsGE
# dAui3IWtAAAAA7F+MA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYwNzI1MTkyNjEwWhcNMjYwNzI4
# MTkyNjEwWjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAoVDcAOz6TalWG9vfNlA6qVCD
# mLVli6Uc0fGG8EYUEtFVVtMWj2XauPbRgJ5oJxZpyvJb7jIWhZOjLHB8u/nDaJ77
# HsqfjiBgteEkOqZaMd2Lc7bn/cJU51jf0/folLa7iEfwlIukDrNBgpwTVJuPLbTQ
# 4hZDA+xFCZN8RikowtnrlQjN9gNn5Oh6jgPou7cz5AkfdWpj5Rp4NGV0cctYt6da
# uE/Wa5B1Q/NB8Zz2C2o3bmJ/fYeBwnuMVrhaeff6lBykWH6fixbw/FHECpGxgxBe
# jU0yFvhoO+SpDlIaejRq4IIxyeUHJNrTE8Mk8nU+T7x4i27MNHwsVvPn5vdozRhB
# JNR9eg1j/RzwhqZ3SoRuV2ne26xhG9UJw/2bv9rDdaBf2GP6nyKf+FmdFyCb1Y2D
# yygS3t/5FptjNcceOUIQZSpcjXJ/HJnnfdbCURshMzHhQ4mUzFuJLZtNiBFQ3uop
# E80PvLmNSA9sEyjXd4nyUm2SKfqpwyq7H+TMQs4DAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# rDk4FlKL6gGHF9FRtMEug2P8gT0wHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAMA0
# 8eOioaqDx9G96lr+ahHtFnpfHg0df91iir8LIKh7IguajVeIgFiOWOjYLWpFpRe+
# fMzvj5duooOeZChlHXFJVouSI0n3ooqmSakikUoVL8NJ4QHmppscUO7KaPzcVyyS
# Anq1LL7sfC3Z4sk2a0iFriXc90EcJ+StLU96tUUeJps15d0m5HRe+VQ0WmjepIrH
# H8kPYNDMtpxyMu5LvJdKDS02RdK4ZM0yvoMx70LdRuRAuNCUze3JovLjv4jprp/A
# BgEfMvE5Au7PMQEgAL50FM8jREQRtHWl9xaQFJwEgo62XQ1SVC3MKTc2SGb3Qke+
# re5a1KCRa6QOEof6F0fX6IDP1Mc9iRzdUdnZZ9Lu6OBsG/3j8LC6GVXePMcbogM9
# /oVizBQXwrAMCZEhwoGCQmxM18pRW1/Dq68I0dWCiIptqZE/fz2XrrvJktn/evdN
# EvlUk7cbsw0Aeeoy+8ju5N5jY98R4v44oUAkAhT7HvrU0k5dISUhNVHJbmjSEPWk
# 2K/sEYAEZAMfuK4KqTN3pSFNQttSdZs/3pqOtK+UW/tOWYO8hGskOwoo9MhxvYIK
# 9UaUyDcO0Fz7QBzO3DIZJMEY5jllHy1YH5ZZ8/Kmy7l0v2xuTMsVi1JN1laH8/R6
# TCSMIjo+8TJhm2VpA+PzG/wjcBbgSPYMLBiVSKH+MIIGwDCCBKigAwIBAgITMwAD
# sX7BhHQLotyFrQAAAAOxfjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MDcyNTE5MjYxMFoXDTI2
# MDcyODE5MjYxMFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAKFQ3ADs+k2pVhvb3zZQ
# OqlQg5i1ZYulHNHxhvBGFBLRVVbTFo9l2rj20YCeaCcWacryW+4yFoWToyxwfLv5
# w2ie+x7Kn44gYLXhJDqmWjHdi3O25/3CVOdY39P36JS2u4hH8JSLpA6zQYKcE1Sb
# jy200OIWQwPsRQmTfEYpKMLZ65UIzfYDZ+Toeo4D6Lu3M+QJH3VqY+UaeDRldHHL
# WLenWrhP1muQdUPzQfGc9gtqN25if32HgcJ7jFa4Wnn3+pQcpFh+n4sW8PxRxAqR
# sYMQXo1NMhb4aDvkqQ5SGno0auCCMcnlByTa0xPDJPJ1Pk+8eItuzDR8LFbz5+b3
# aM0YQSTUfXoNY/0c8Iamd0qEbldp3tusYRvVCcP9m7/aw3WgX9hj+p8in/hZnRcg
# m9WNg8soEt7f+RabYzXHHjlCEGUqXI1yfxyZ533WwlEbITMx4UOJlMxbiS2bTYgR
# UN7qKRPND7y5jUgPbBMo13eJ8lJtkin6qcMqux/kzELOAwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFKw5OBZSi+oBhxfRUbTBLoNj/IE9MB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQDANPHjoqGqg8fRvepa/moR7RZ6Xx4NHX/dYoq/CyCoeyILmo1XiIBYjljo2C1q
# RaUXvnzM74+XbqKDnmQoZR1xSVaLkiNJ96KKpkmpIpFKFS/DSeEB5qabHFDuymj8
# 3FcskgJ6tSy+7Hwt2eLJNmtIha4l3PdBHCfkrS1PerVFHiabNeXdJuR0XvlUNFpo
# 3qSKxx/JD2DQzLaccjLuS7yXSg0tNkXSuGTNMr6DMe9C3UbkQLjQlM3tyaLy47+I
# 6a6fwAYBHzLxOQLuzzEBIAC+dBTPI0REEbR1pfcWkBScBIKOtl0NUlQtzCk3Nkhm
# 90JHvq3uWtSgkWukDhKH+hdH1+iAz9THPYkc3VHZ2WfS7ujgbBv94/CwuhlV3jzH
# G6IDPf6FYswUF8KwDAmRIcKBgkJsTNfKUVtfw6uvCNHVgoiKbamRP389l667yZLZ
# /3r3TRL5VJO3G7MNAHnqMvvI7uTeY2PfEeL+OKFAJAIU+x761NJOXSElITVRyW5o
# 0hD1pNiv7BGABGQDH7iuCqkzd6UhTULbUnWbP96ajrSvlFv7TlmDvIRrJDsKKPTI
# cb2CCvVGlMg3DtBc+0AcztwyGSTBGOY5ZR8tWB+WWfPypsu5dL9sbkzLFYtSTdZW
# h/P0ekwkjCI6PvEyYZtlaQPj8xv8I3AW4Ej2DCwYlUih/jCCBygwggUQoAMCAQIC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAA7F+
# wYR0C6Lcha0AAAADsX4wDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQg0mlG
# IOXb2RbdBmIEJiKF1PN4xBlalaRJ4ZggoUQ5E7wwDQYJKoZIhvcNAQEBBQAEggGA
# kmo0ICyJdV5drp3zSrRb6nRPZoDiqybP9LezO+6R/pGta60Z3nlVeOI5IwU8GTEA
# g7KaXUBMSscATSHc02Xl5HJPeL70KnRsfq1xWmMH/JbxxbIEb7gpzJcGHnCg223i
# ZXeYb6ii0x8cW3c9jnflr5CV0ebMzI3/3HNmQnleMn4HK42c1iDqc8rcrsGVrFTT
# sZySahnliBoNJYPG39ZW0TqXSurqF9f18NHXeWY7UvNppqY/aAQkBMi2Q+Iojnr8
# DHcKxANFppiOzwt8wu8udSyM2cy6IlSswjxvul7fD+MG5STPWzRuU184ozX1tzuc
# 1Pad0vpqax7MaOs72Y+PdFux2gC/6Z75zz+Wgf4gLD06sIcvuidUwOtcUCzuVKRv
# iJMV1pWUdxVP0ddj3tVTn0Ylkl+z1SvPA8GAqMgLLOK80z5DEpGU2YBIywmvhUKg
# d02lYLNgWTee/m1mkn7OvHzIirmWtCEGbQ6H4JltclRSWQ+dQfA4j86+kVyWLU2s
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIFT6EsbxpVHXe8gPGuiK
# jLHbClZ+oy06TkPYDwsvjPLSAgZqY0xd+QYYEzIwMjYwNzI3MTMxMDUzLjk5NVow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjdCMUEtMDVFMC1EOTQ3MTUwMwYD
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
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAWXzacemNXvXAAAAAAABZMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwMVoXDTI3MDEwNzE4NTkwMVow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjdCMUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAKYu5/40eEX+hT+5jFa146bid3dA4LnXYntv
# kP3CGw4LGARFhnvLMSJ/VtsubzDaeFnm7yb2KSM70WmHQprdCVqpvUH7l0uB4jNw
# 7urLoAR9kKHLE0VlMlDStDSxUBI3qwsdrjvdmvV0k+9/njuDEiSlzJTf7Dowd1K3
# bO4beRyaFhR+Y8tymECOqlOAffYrG2wZdVM51+QSBSe+PEykr8C6OnnqSipuF8fZ
# vCb6/huk0Zm6ZwsaixSHIAT2IEGvS7c63Im8jV3a8R0K6i2yiw0NNlnTSpwy/Zfv
# 7iwsLBwhfbjBTn+XOl6mPzDXQQ3V+SRP9xXbGKOsBTxzGid7aKAHw3o4Ahl9UGWL
# H9kNP3VUokE6JYkjlfpuUGZ6gQyqDewfxD4VoYIlopt4HZ0xQvqajuJx+cr8LR/I
# Z56gLLmwyMzde5+vtjBoilry/gSZwVGwgkvkIgpKPBQHGsSB0y3szr7Y7wEb6v0y
# Zal1XUvWnnz3inTaSWsCFrLPVwVmXy3ncY5/d25VpOkht+m697GWNbvsNOhAOHRa
# ftE9j/hhkoM6RsyJfBLnhqMcA/wcavf5oj5NeyRQdGZeLKcls9csKS3sBUzPidxx
# 2iiNH9CPaDq/bLJEOXasYohXMnRinu+fUk81s8VO7DQSF6ffn5oqSHoV8lf1Ax6u
# +kdShb8BAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQUj5bnC18D0vlnSRhCOiODGGuX
# NnYwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQBEMhzC/ZcjpG/zURE7z2Yp5vrUxUjsE5Xa3t/2RGvESwvb
# msk3bLHhSFAajgo2XQ8xoGDP3sUhKCLPeICSbkVv6V8sSp8fJ8Jos6yrawf2YVis
# 8tcV+OO7U9S6JGPQzpmPncfzQc4ne1fqZ4+HiKabIDEoFdddQT2Egkk9fzxCY/EZ
# 52avJ27dSfrI/IDmyn9V10O3iQpg2F+C9vNTrk7nVgoDoHa9+Q3pYr0IHGnSmt5i
# rgGT436zo5WnXP8FxMhswH1aiyiSZiVzhor10C9C52cP3C8/PEoMKUXstLjoPO0T
# MkeW/1Fr186KXD45QRgBo0xImgtWTdzWFnlD+p7+iDBIuSrNcRXDRYuq/aYZaDhW
# SI0SYdPIWVh5XvXuWA31a8oQ0SO+oPa3Nk80k0864wiiyJ1KsbSnaaefg9vspegh
# rpY8ljCwxfCUtx5HQRNgAJOI8IKACK4d014Mk0hlRO0lQVRHegqIg29K6Xqkc360
# W2ZJGUcstlKokkVj6KAHjGyrLRPzepYfiZUJq4gXyxbpvKb1XJ2FN2682aUoNXo9
# RyRK1ch0f66k6+yj88kzvuC7+vJWtNDs/UpIM6Hhm0kU64JUJ7MMEQcAc7kpft7G
# m7YeRK+oKgqUgYXCfmzbX8nJXJZnPa8ADWVsIqsuNAxCI0CZXkULofqo5Be6zzGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABZfNpx6Y1e9cAAAAAAAFkwDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgqb8wbBy+TYLtODCW5NOifUVH2jCfItJzdrrJYUsNV1cwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCDCIbzA/sTJ9lK41E2E
# e3HD+l/k7kSAMB0qHDpqQwel0DANBgkqhkiG9w0BAQsFAASCAgCiPNwDUosIXSE4
# +ahg2KmeQm93MWr7UAsK4ewSsIDrHqDAq0KIJI+K0GsvEEtCPeU+Y0BNkDvj/CQP
# c40eqAt2dqA11t8xm5iRLLlFyqeZAYZXE6TU2ahZStFirDFjp41Vvq6vKyIFZ6n9
# yPuQwHv1gsgtDE588uTO9/7/Z6mAho0guWKksLvb48HIipSutknu7kC1tCrDggkf
# AMIH6+KNRR+Tx8men0Sa3dmehRKQNwFneUDjnsKj0Fww1FGfTF8vZWnlup3gvuYh
# Qndv/l93ffdZr74Vd4fpUsnUgHYpSUhdHvWQJQgUlkcFQ6TjCAm+3r2Yj4C6ViHW
# ACcmqWwgDlQ5DWIzi5mdZ9I2dC6cwaLFV3J+IrZtPv46xZ0Wauc7WMAwNhBkUgsa
# rWFxnVjyINJOClOVdVPZdUp31I6B66gnXDFN+WbjbjHRKKg5gLJ2gIEC6VgpgsrZ
# G5hXeYFn8hOcmbRvidV1Vb8kkDfasB5Seoeobojrrz0vk4uPIRd0u7W4WZJpfvaX
# RNPDNI9oqa0m7Q0xKHu5gONXkefX7LY7w4sOKRQ4uoCeEHk5EFFmwXFIbjuPiI5X
# P9Bdl8jcZ/8x3HdSqH5EE5yCvyVF/TYVH4kXOSYNssYsQOq4B2+3fdbwD1d8CQ+S
# H42LF5TpWSnr9FHnhMfSCsgM2keTQg==
# SIG # End signature block
