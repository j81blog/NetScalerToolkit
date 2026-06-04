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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD+YrSn7RosIZvM
# L/7Ie5Rf/VS407+3eMJJxY7ofG0wzaCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCDSaUYg5dvZFt0GYgQmIoXU83jEGVqVpEnhmCChRDkT
# vDANBgkqhkiG9w0BAQEFAASCAYC7hGgewR60+MAdQ1Glujx8vGr7vPFaneSRQCBM
# bKIGnM1lS+a0yDSs+vFmeNxxtdgGniCNSYVUrKfzo7hVicGtSiEI5uF/mYj7ocgJ
# 1NItAPQiPHAo1mQP8P75KSGB9s1UMmjSjSD6FpqD+Y4LfVZddzFVPnvf6HKyD/8R
# e1TO2eu951EEFxiLHF3lsYQ6+wDQMYAST2cTg2zR6Go1+iooVtBFdeJEeS+Lp5JN
# Q4Z3GvU0nW68XVwmHSucM7BI5C9JEZYfKbc8tM1/iCBm1fMzLdM1ee9uFNLJ4O9O
# 4vhAe4xGZfAi6MgQD/hkjvB7GIhOl779KWbmELFBdNDXJ07h6JHzBebqArvvtRw/
# tsssq3ApqxlXHKJ5SO6iTePaB4YY2gK1NBKPVK1X+G/YI369vfmVR2CjGvh6W7WV
# 3z4+RvA/+3Yl/IE517HhX62tlD6ESVJewaPCo728khw+8hyPIHhkDq3YpgKPxLYF
# uw2FEp+cgM9u/Vy+1unZ6F4rmRWhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU0MzhaMD8GCSqGSIb3
# DQEJBDEyBDAUYdd/APg5PDxnI2vhER2sHW4gRF0X393p2CEfKvUseYCNtA6YPLif
# 3PycXme+lMcwDQYJKoZIhvcNAQEBBQAEggIAdbNg+8bBa+RJhlRB2A82QIN8vWcT
# 2sgEgvG3hzO3Ft8SiT33XfD3tIsay+cCKwAx1tk0/ua+TZ0+2i5EMhV2u5bA3SCG
# GeEQP5z/fvgxLiU3A53p1bRTBNuDvO9NNa6V8z3RC4InxAKs+ENzyGulXZqOPg9g
# eWiK/b1xX97UBc7qVhQ4M/DbKpc/lt4R39y01sdQhpAhYH41LIC6aGHKZ7Qy2B4E
# kP2R173Q/SsGsYNaY1cT6jnARtlw5XHLAF9pvuP9Zb2MOeyKBYkM2MHMWkI+A3Je
# S9DMSyy6MtELqhfp9FXWTpC/GLn1o4Z9PglMX5f81MYtKLYEonxwSH2lcgsfkvwe
# aVUxkKYVDtoSM3YsDGLXI/079iZ5I1N/JPGGJu+fKHg3lFkd7YTwDSpD3GurCpnJ
# 8WCezX5LHPp+CVS1HQioieIJyyswzMnzfFZ+aCXc4AkCRWtCpse7B9xfgMlxuV1H
# 2vradqW30a70aHLS2Iz9zezEEDJd6kENWtFdNxsBtTyo2BX/EZ5hgSZPkf14qPjz
# KDfp4lRg7B6AYPNU7evcggMH08jD6fP03Yv33OUi+wnvFylE0hYKL9V7/COJxPVk
# QTdpPCNVfMrYUSHkHwlhRNB1t6Sd9sDTcSSqXTnL5uLleoy970JGuHI6eYvB/6zK
# Ad0UDC9RwV+JVJ0=
# SIG # End signature block
