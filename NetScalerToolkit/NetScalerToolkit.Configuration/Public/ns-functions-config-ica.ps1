# Generated NetScalerToolkit Configuration bundle for category 'ica'.

# region Invoke-NSAddICAAccessProfile
function Invoke-NSAddICAAccessProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler icaaccessprofile resource.
    .DESCRIPTION
        Configuration for ica accessprofile resource.
    .PARAMETER ClientAudioRedirectIon
        Allow Default access/Disable applications hosted on the server to play sounds through a sound device installed on the client computer, also allows or prevents users to record audio input. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientCLIPboardRedirectIon
        Allow Default access/Disable the clipboard on the client device to be mapped to the clipboard on the server. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientComPortRedirectIon
        Allow Default access/Disable COM port redirection to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientDriveRedirectIon
        Allow Default access/Disables drive redirection to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientPrinterRedirectIon
        Allow Default access/Disable client printers to be mapped to a server when a user logs on to a session. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientTwaindeviceRedirectIon
        Allow default access or disable TWAIN devices, such as digital cameras or scanners, on the client device from published image processing applications. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientUsbdriveRedirectIon
        Allow Default access/Disable the redirection of USB devices to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ConnEctClientLptPortS
        Allow Default access/Disable automatic connection of LPT ports from the client when the user logs on. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Draganddrop
        Allow default access or disable drag and drop between client and remote applications and desktops. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Fido2RedirectIon
        Allow default access or disable FIDO2 redirection. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER LocalRemoteDataSharing
        Allow Default access/Disable file/data sharing via the Receiver for HTML5. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER MultiStream
        Allow Default access/Disable the multistream feature for the specified users. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Name
        Name for the ICA accessprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA accessprofile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica accessprofile" or 'my ica accessprofile'). Each of the features can be configured as DEFAULT/DISABLED. Here, DISABLED means that the policy settings on the backend XenApp/XenDesktop server are overridden and the Citrix ADC makes the decision to deny access. Whereas DEFAULT means that the Citrix ADC allows the request to reach the XenApp/XenDesktop that takes the decision to allow/deny access based on the policy configured on it. For example, if ClientAudioRedirection is enabled on the backend XenApp/XenDesktop server, and the configured profile has ClientAudioRedirection as DISABLED, the Citrix ADC makes the decision to deny the request irrespective of the configuration on the backend. If the configured profile has ClientAudioRedirection as DEFAULT, then the Citrix ADC forwards the requests to the backend XenApp/XenDesktop server.It then makes the decision to allow/deny access based on the policy configured on it. Minimum length = 1
    .PARAMETER SmartcardRedirectIon
        Allow default access or disable smart card redirection. Smart card virtual channel is always allowed in CVAD. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER WiaRedirectIon
        Allow default access or disable WIA scanner redirection. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddICAAccessProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddICAAccessProfile -Name 'example' -WhatIf
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
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientAudioRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientCLIPboardRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientComPortRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientDriveRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientPrinterRedirectIon,

        [Parameter()]
        [string] $ClientTwaindeviceRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientUsbdriveRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ConnEctClientLptPortS,

        [Parameter()]
        [string] $Draganddrop,

        [Parameter()]
        [string] $Fido2RedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $LocalRemoteDataSharing,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $MultiStream,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $SmartcardRedirectIon,

        [Parameter()]
        [string] $WiaRedirectIon,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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

    if ($PSBoundParameters.ContainsKey('ClientTwaindeviceRedirectIon')) {
        Assert-NSParameterValue -ParameterName 'ClientTwaindeviceRedirectIon' -Value $ClientTwaindeviceRedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Draganddrop')) {
        Assert-NSParameterValue -ParameterName 'Draganddrop' -Value $Draganddrop -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Fido2RedirectIon')) {
        Assert-NSParameterValue -ParameterName 'Fido2RedirectIon' -Value $Fido2RedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('SmartcardRedirectIon')) {
        Assert-NSParameterValue -ParameterName 'SmartcardRedirectIon' -Value $SmartcardRedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('WiaRedirectIon')) {
        Assert-NSParameterValue -ParameterName 'WiaRedirectIon' -Value $WiaRedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('ClientAudioRedirectIon')) { $properties['clientaudioredirection'] = $ClientAudioRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientCLIPboardRedirectIon')) { $properties['clientclipboardredirection'] = $ClientCLIPboardRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientComPortRedirectIon')) { $properties['clientcomportredirection'] = $ClientComPortRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientDriveRedirectIon')) { $properties['clientdriveredirection'] = $ClientDriveRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientPrinterRedirectIon')) { $properties['clientprinterredirection'] = $ClientPrinterRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientTwaindeviceRedirectIon')) { $properties['clienttwaindeviceredirection'] = $ClientTwaindeviceRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientUsbdriveRedirectIon')) { $properties['clientusbdriveredirection'] = $ClientUsbdriveRedirectIon }
    if ($PSBoundParameters.ContainsKey('ConnEctClientLptPortS')) { $properties['connectclientlptports'] = $ConnEctClientLptPortS }
    if ($PSBoundParameters.ContainsKey('Draganddrop')) { $properties['draganddrop'] = $Draganddrop }
    if ($PSBoundParameters.ContainsKey('Fido2RedirectIon')) { $properties['fido2redirection'] = $Fido2RedirectIon }
    if ($PSBoundParameters.ContainsKey('LocalRemoteDataSharing')) { $properties['localremotedatasharing'] = $LocalRemoteDataSharing }
    if ($PSBoundParameters.ContainsKey('MultiStream')) { $properties['multistream'] = $MultiStream }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('SmartcardRedirectIon')) { $properties['smartcardredirection'] = $SmartcardRedirectIon }
    if ($PSBoundParameters.ContainsKey('WiaRedirectIon')) { $properties['wiaredirection'] = $WiaRedirectIon }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create icaaccessprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icaaccessprofile -Payload @{ icaaccessprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICAAccessProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddICAAccessProfile

# region Invoke-NSAddICAAction
function Invoke-NSAddICAAction {
    <#
    .SYNOPSIS
        Creates a NetScaler icaaction resource.
    .DESCRIPTION
        Configuration for ica action resource.
    .PARAMETER AccessProfileName
        Name of the ica accessprofile to be associated with this action.
    .PARAMETER LatencyProfileName
        Name of the ica latencyprofile to be associated with this action.
    .PARAMETER Name
        Name for the ICA action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica action" or 'my ica action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddICAAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddICAAction -Name 'example' -WhatIf
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
        [string] $AccessProfileName,

        [Parameter()]
        [string] $LatencyProfileName,

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
    if ($PSBoundParameters.ContainsKey('AccessProfileName')) { $properties['accessprofilename'] = $AccessProfileName }
    if ($PSBoundParameters.ContainsKey('LatencyProfileName')) { $properties['latencyprofilename'] = $LatencyProfileName }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create icaaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icaaction -Payload @{ icaaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICAAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddICAAction

# region Invoke-NSAddIcaglobalICAPolicyBinding
function Invoke-NSAddIcaglobalICAPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler icaglobal_icapolicy_binding resource.
    .DESCRIPTION
        Binding object showing the icapolicy that can be bound to icaglobal.
    .PARAMETER GotoPriorityExpression
        Expression specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.
    .PARAMETER PolicyName
        Name of the ICA policy.
    .PARAMETER Priority
        Specifies the priority of the policy.
    .PARAMETER Type
        Global bind point for which to show detailed information about the policies bound to the bind point. Possible values = ICA_REQ_OVERRIDE, ICA_REQ_DEFAULT
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddIcaglobalICAPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddIcaglobalICAPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

        [Parameter()]
        [ValidateSet('ICA_REQ_OVERRIDE', 'ICA_REQ_DEFAULT')]
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
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('icaglobal_icapolicy_binding', 'Create icaglobal_icapolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icaglobal_icapolicy_binding -Payload @{ icaglobal_icapolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddIcaglobalICAPolicyBinding

# region Invoke-NSAddICALatencyProfile
function Invoke-NSAddICALatencyProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler icalatencyprofile resource.
    .DESCRIPTION
        Configuration for Profile for Latency monitoring resource.
    .PARAMETER L7latencyMaxNotifycount
        L7 Latency Max notify Count. This is the upper limit on the number of notifications sent to the Insight Center within an interval where the Latency is above the threshold. Default value: 5 Minimum value = 1 Maximum value = 65535
    .PARAMETER L7latencyMonItoring
        Enable/Disable L7 Latency monitoring for L7 latency notifications. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER L7latencynotifyInterval
        L7 Latency Notify Interval. This is the interval at which the Citrix ADC sends out notifications to the Insight Center after the wait time has passed. Default value: 20 Minimum value = 1 Maximum value = 65535
    .PARAMETER L7latencyThresholdFactor
        L7 Latency threshold factor. This is the factor by which the active latency should be greater than the minimum observed value to determine that the latency is high and may need to be reported. Default value: 4 Minimum value = 2 Maximum value = 65535
    .PARAMETER L7latencywaittime
        L7 Latency Wait time. This is the time for which the Citrix ADC waits after the threshold is exceeded before it sends out a Notification to the Insight Center. Default value: 20 Minimum value = 1 Maximum value = 65535
    .PARAMETER Name
        Name for the ICA latencyprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA latency profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica l7latencyprofile" or 'my ica l7latencyprofile'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddICALatencyProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddICALatencyProfile -Name 'example' -WhatIf
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
        [int] $L7latencyMaxNotifycount,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $L7latencyMonItoring,

        [Parameter()]
        [int] $L7latencynotifyInterval,

        [Parameter()]
        [int] $L7latencyThresholdFactor,

        [Parameter()]
        [int] $L7latencywaittime,

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
    if ($PSBoundParameters.ContainsKey('L7latencyMaxNotifycount')) { $properties['l7latencymaxnotifycount'] = $L7latencyMaxNotifycount }
    if ($PSBoundParameters.ContainsKey('L7latencyMonItoring')) { $properties['l7latencymonitoring'] = $L7latencyMonItoring }
    if ($PSBoundParameters.ContainsKey('L7latencynotifyInterval')) { $properties['l7latencynotifyinterval'] = $L7latencynotifyInterval }
    if ($PSBoundParameters.ContainsKey('L7latencyThresholdFactor')) { $properties['l7latencythresholdfactor'] = $L7latencyThresholdFactor }
    if ($PSBoundParameters.ContainsKey('L7latencywaittime')) { $properties['l7latencywaittime'] = $L7latencywaittime }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create icalatencyprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icalatencyprofile -Payload @{ icalatencyprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICALatencyProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddICALatencyProfile

# region Invoke-NSAddICAPolicy
function Invoke-NSAddICAPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler icapolicy resource.
    .DESCRIPTION
        Configuration for ICA policy resource.
    .PARAMETER Action
        Name of the ica action to be associated with this policy.
    .PARAMETER Comment
        Any type of information about this ICA policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica policy" or 'my ica policy').
    .PARAMETER Rule
        Expression or other value against which the traffic is evaluated. Must be a Boolean expression. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddICAPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddICAPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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

        [Parameter()]
        [string] $LogAction,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create icapolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icapolicy -Payload @{ icapolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICAPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddICAPolicy

# region Invoke-NSDeleteICAAccessProfile
function Invoke-NSDeleteICAAccessProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler icaaccessprofile resource.
    .DESCRIPTION
        Configuration for ica accessprofile resource.
    .PARAMETER Name
        Name for the ICA accessprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA accessprofile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica accessprofile" or 'my ica accessprofile'). Each of the features can be configured as DEFAULT/DISABLED. Here, DISABLED means that the policy settings on the backend XenApp/XenDesktop server are overridden and the Citrix ADC makes the decision to deny access. Whereas DEFAULT means that the Citrix ADC allows the request to reach the XenApp/XenDesktop that takes the decision to allow/deny access based on the policy configured on it. For example, if ClientAudioRedirection is enabled on the backend XenApp/XenDesktop server, and the configured profile has ClientAudioRedirection as DISABLED, the Citrix ADC makes the decision to deny the request irrespective of the configuration on the backend. If the configured profile has ClientAudioRedirection as DEFAULT, then the Citrix ADC forwards the requests to the backend XenApp/XenDesktop server.It then makes the decision to allow/deny access based on the policy configured on it. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteICAAccessProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetICAAccessProfile -Name 'icaaccessprofile_example' | Invoke-NSDeleteICAAccessProfile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete icaaccessprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type icaaccessprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteICAAccessProfile

# region Invoke-NSDeleteICAAction
function Invoke-NSDeleteICAAction {
    <#
    .SYNOPSIS
        Removes a NetScaler icaaction resource.
    .DESCRIPTION
        Configuration for ica action resource.
    .PARAMETER Name
        Name for the ICA action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica action" or 'my ica action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteICAAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetICAAction -Name 'icaaction_example' | Invoke-NSDeleteICAAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete icaaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type icaaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteICAAction

# region Invoke-NSDeleteIcaglobalICAPolicyBinding
function Invoke-NSDeleteIcaglobalICAPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler icaglobal_icapolicy_binding resource.
    .DESCRIPTION
        Binding object showing the icapolicy that can be bound to icaglobal.
    .PARAMETER PolicyName
        Name of the ICA policy.
    .PARAMETER Type
        Global bind point for which to show detailed information about the policies bound to the bind point. Possible values = ICA_REQ_OVERRIDE, ICA_REQ_DEFAULT
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
        Invoke-NSDeleteIcaglobalICAPolicyBinding -PolicyName 'example' -Priority 1 -Type ICA_REQ_OVERRIDE -Confirm:$false
    .EXAMPLE
        Invoke-NSGetIcaglobalICAPolicyBinding  | Invoke-NSDeleteIcaglobalICAPolicyBinding -Confirm:$false
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
        [ValidateSet('ICA_REQ_OVERRIDE', 'ICA_REQ_DEFAULT')]
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

        if ($PSCmdlet.ShouldProcess('icaglobal_icapolicy_binding', 'Delete icaglobal_icapolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type icaglobal_icapolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteIcaglobalICAPolicyBinding

# region Invoke-NSDeleteICALatencyProfile
function Invoke-NSDeleteICALatencyProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler icalatencyprofile resource.
    .DESCRIPTION
        Configuration for Profile for Latency monitoring resource.
    .PARAMETER Name
        Name for the ICA latencyprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA latency profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica l7latencyprofile" or 'my ica l7latencyprofile'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteICALatencyProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetICALatencyProfile -Name 'icalatencyprofile_example' | Invoke-NSDeleteICALatencyProfile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete icalatencyprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type icalatencyprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteICALatencyProfile

# region Invoke-NSDeleteICAPolicy
function Invoke-NSDeleteICAPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler icapolicy resource.
    .DESCRIPTION
        Configuration for ICA policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica policy" or 'my ica policy').
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteICAPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetICAPolicy -Name 'icapolicy_example' | Invoke-NSDeleteICAPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete icapolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type icapolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteICAPolicy

# region Invoke-NSGetICAAccessProfile
function Invoke-NSGetICAAccessProfile {
    <#
    .SYNOPSIS
        Gets NetScaler icaaccessprofile configuration.
    .DESCRIPTION
        Configuration for ica accessprofile resource.
    .PARAMETER Name
        Name for the ICA accessprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA accessprofile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica accessprofile" or 'my ica accessprofile'). Each of the features can be configured as DEFAULT/DISABLED. Here, DISABLED means that the policy settings on the backend XenApp/XenDesktop server are overridden and the Citrix ADC makes the decision to deny access. Whereas DEFAULT means that the Citrix ADC allows the request to reach the XenApp/XenDesktop that takes the decision to allow/deny access based on the policy configured on it. For example, if ClientAudioRedirection is enabled on the backend XenApp/XenDesktop server, and the configured profile has ClientAudioRedirection as DISABLED, the Citrix ADC makes the decision to deny the request irrespective of the configuration on the backend. If the configured profile has ClientAudioRedirection as DEFAULT, then the Citrix ADC forwards the requests to the backend XenApp/XenDesktop server.It then makes the decision to allow/deny access based on the policy configured on it. Minimum length = 1
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
        Invoke-NSGetICAAccessProfile
    .EXAMPLE
        Invoke-NSGetICAAccessProfile -Name 'icaaccessprofile_example'
    .EXAMPLE
        Invoke-NSGetICAAccessProfile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icaaccessprofile'
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
# endregion Invoke-NSGetICAAccessProfile

# region Invoke-NSGetICAAction
function Invoke-NSGetICAAction {
    <#
    .SYNOPSIS
        Gets NetScaler icaaction configuration.
    .DESCRIPTION
        Configuration for ica action resource.
    .PARAMETER Name
        Name for the ICA action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica action" or 'my ica action'). Minimum length = 1
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
        Invoke-NSGetICAAction
    .EXAMPLE
        Invoke-NSGetICAAction -Name 'icaaction_example'
    .EXAMPLE
        Invoke-NSGetICAAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icaaction'
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
# endregion Invoke-NSGetICAAction

# region Invoke-NSGetIcaglobalBinding
function Invoke-NSGetIcaglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler icaglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to icaglobal.
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
        Invoke-NSGetIcaglobalBinding
    .EXAMPLE
        Invoke-NSGetIcaglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icaglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetIcaglobalBinding

# region Invoke-NSGetIcaglobalICAPolicyBinding
function Invoke-NSGetIcaglobalICAPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler icaglobal_icapolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the icapolicy that can be bound to icaglobal.
    .PARAMETER Type
        Global bind point for which to show detailed information about the policies bound to the bind point. Possible values = ICA_REQ_OVERRIDE, ICA_REQ_DEFAULT
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
        Invoke-NSGetIcaglobalICAPolicyBinding
    .EXAMPLE
        Invoke-NSGetIcaglobalICAPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('ICA_REQ_OVERRIDE', 'ICA_REQ_DEFAULT')]
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
            Type = 'icaglobal_icapolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetIcaglobalICAPolicyBinding

# region Invoke-NSGetICALatencyProfile
function Invoke-NSGetICALatencyProfile {
    <#
    .SYNOPSIS
        Gets NetScaler icalatencyprofile configuration.
    .DESCRIPTION
        Configuration for Profile for Latency monitoring resource.
    .PARAMETER Name
        Name for the ICA latencyprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA latency profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica l7latencyprofile" or 'my ica l7latencyprofile'). Minimum length = 1
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
        Invoke-NSGetICALatencyProfile
    .EXAMPLE
        Invoke-NSGetICALatencyProfile -Name 'icalatencyprofile_example'
    .EXAMPLE
        Invoke-NSGetICALatencyProfile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icalatencyprofile'
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
# endregion Invoke-NSGetICALatencyProfile

# region Invoke-NSGetIcaparameter
function Invoke-NSGetIcaparameter {
    <#
    .SYNOPSIS
        Gets NetScaler icaparameter configuration.
    .DESCRIPTION
        Configuration for Config Parameters for NS ICA resource.
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
        Invoke-NSGetIcaparameter
    .EXAMPLE
        Invoke-NSGetIcaparameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icaparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetIcaparameter

# region Invoke-NSGetICAPolicy
function Invoke-NSGetICAPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler icapolicy configuration.
    .DESCRIPTION
        Configuration for ICA policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica policy" or 'my ica policy').
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
        Invoke-NSGetICAPolicy
    .EXAMPLE
        Invoke-NSGetICAPolicy -Name 'icapolicy_example'
    .EXAMPLE
        Invoke-NSGetICAPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icapolicy'
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
# endregion Invoke-NSGetICAPolicy

# region Invoke-NSGetICAPolicyBinding
function Invoke-NSGetICAPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler icapolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to icapolicy.
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
        Invoke-NSGetICAPolicyBinding
    .EXAMPLE
        Invoke-NSGetICAPolicyBinding -Name 'icapolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetICAPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icapolicy_binding'
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
# endregion Invoke-NSGetICAPolicyBinding

# region Invoke-NSGetICAPolicyCRVServerBinding
function Invoke-NSGetICAPolicyCRVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler icapolicy_crvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the crvserver that can be bound to icapolicy.
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
        Invoke-NSGetICAPolicyCRVServerBinding
    .EXAMPLE
        Invoke-NSGetICAPolicyCRVServerBinding -Name 'icapolicy_crvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetICAPolicyCRVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icapolicy_crvserver_binding'
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
# endregion Invoke-NSGetICAPolicyCRVServerBinding

# region Invoke-NSGetICAPolicyIcaglobalBinding
function Invoke-NSGetICAPolicyIcaglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler icapolicy_icaglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the icaglobal that can be bound to icapolicy.
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
        Invoke-NSGetICAPolicyIcaglobalBinding
    .EXAMPLE
        Invoke-NSGetICAPolicyIcaglobalBinding -Name 'icapolicy_icaglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetICAPolicyIcaglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icapolicy_icaglobal_binding'
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
# endregion Invoke-NSGetICAPolicyIcaglobalBinding

# region Invoke-NSGetICAPolicyVPNVServerBinding
function Invoke-NSGetICAPolicyVPNVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler icapolicy_vpnvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to icapolicy.
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
        Invoke-NSGetICAPolicyVPNVServerBinding
    .EXAMPLE
        Invoke-NSGetICAPolicyVPNVServerBinding -Name 'icapolicy_vpnvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetICAPolicyVPNVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'icapolicy_vpnvserver_binding'
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
# endregion Invoke-NSGetICAPolicyVPNVServerBinding

# region Invoke-NSRenameICAAction
function Invoke-NSRenameICAAction {
    <#
    .SYNOPSIS
        Renames a NetScaler icaaction resource.
    .DESCRIPTION
        Configuration for ica action resource.
    .PARAMETER Name
        Name for the ICA action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica action" or 'my ica action'). Minimum length = 1
    .PARAMETER NewName
        New name for the ICA action. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#),period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks ( for example, "my ica action" or 'my ica action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameICAAction -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameICAAction -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename icaaction')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icaaction -Action rename -Payload @{ icaaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetICAAction -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameICAAction

# region Invoke-NSRenameICAPolicy
function Invoke-NSRenameICAPolicy {
    <#
    .SYNOPSIS
        Renames a NetScaler icapolicy resource.
    .DESCRIPTION
        Configuration for ICA policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica policy" or 'my ica policy').
    .PARAMETER NewName
        New name for the policy. Must begin with an ASCII alphabetic or underscore (_)character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), s pace, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica policy" or 'my ica policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSRenameICAPolicy -Name 'example' -NewName 'example' -PassThru
    .EXAMPLE
        Invoke-NSRenameICAPolicy -Name 'example' -NewName 'example' -WhatIf
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Rename icapolicy')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icapolicy -Action rename -Payload @{ icapolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetICAPolicy -Name $NewName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSRenameICAPolicy

# region Invoke-NSUnsetICAAccessProfile
function Invoke-NSUnsetICAAccessProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler icaaccessprofile resource properties.
    .DESCRIPTION
        Configuration for ica accessprofile resource.
    .PARAMETER Name
        Name for the ICA accessprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA accessprofile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica accessprofile" or 'my ica accessprofile'). Each of the features can be configured as DEFAULT/DISABLED. Here, DISABLED means that the policy settings on the backend XenApp/XenDesktop server are overridden and the Citrix ADC makes the decision to deny access. Whereas DEFAULT means that the Citrix ADC allows the request to reach the XenApp/XenDesktop that takes the decision to allow/deny access based on the policy configured on it. For example, if ClientAudioRedirection is enabled on the backend XenApp/XenDesktop server, and the configured profile has ClientAudioRedirection as DISABLED, the Citrix ADC makes the decision to deny the request irrespective of the configuration on the backend. If the configured profile has ClientAudioRedirection as DEFAULT, then the Citrix ADC forwards the requests to the backend XenApp/XenDesktop server.It then makes the decision to allow/deny access based on the policy configured on it. Minimum length = 1
    .PARAMETER ClientAudioRedirectIon
        Allow Default access/Disable applications hosted on the server to play sounds through a sound device installed on the client computer, also allows or prevents users to record audio input. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientCLIPboardRedirectIon
        Allow Default access/Disable the clipboard on the client device to be mapped to the clipboard on the server. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientComPortRedirectIon
        Allow Default access/Disable COM port redirection to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientDriveRedirectIon
        Allow Default access/Disables drive redirection to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientPrinterRedirectIon
        Allow Default access/Disable client printers to be mapped to a server when a user logs on to a session. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientTwaindeviceRedirectIon
        Allow default access or disable TWAIN devices, such as digital cameras or scanners, on the client device from published image processing applications. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientUsbdriveRedirectIon
        Allow Default access/Disable the redirection of USB devices to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ConnEctClientLptPortS
        Allow Default access/Disable automatic connection of LPT ports from the client when the user logs on. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Draganddrop
        Allow default access or disable drag and drop between client and remote applications and desktops. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Fido2RedirectIon
        Allow default access or disable FIDO2 redirection. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER LocalRemoteDataSharing
        Allow Default access/Disable file/data sharing via the Receiver for HTML5. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER MultiStream
        Allow Default access/Disable the multistream feature for the specified users. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER SmartcardRedirectIon
        Allow default access or disable smart card redirection. Smart card virtual channel is always allowed in CVAD. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER WiaRedirectIon
        Allow default access or disable WIA scanner redirection. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetICAAccessProfile -Name 'example' -ClientAudioRedirectIon DEFAULT -PassThru
    .EXAMPLE
        Invoke-NSUnsetICAAccessProfile -Name 'example' -ClientAudioRedirectIon DEFAULT -WhatIf
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
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ClientAudioRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ClientCLIPboardRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ClientComPortRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ClientDriveRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ClientPrinterRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ClientTwaindeviceRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ClientUsbdriveRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $ConnEctClientLptPortS,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $Draganddrop,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $Fido2RedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $LocalRemoteDataSharing,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $MultiStream,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $SmartcardRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [switch] $WiaRedirectIon,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('ClientAudioRedirectIon')) { $body['clientaudioredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientCLIPboardRedirectIon')) { $body['clientclipboardredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientComPortRedirectIon')) { $body['clientcomportredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientDriveRedirectIon')) { $body['clientdriveredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientPrinterRedirectIon')) { $body['clientprinterredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientTwaindeviceRedirectIon')) { $body['clienttwaindeviceredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('ClientUsbdriveRedirectIon')) { $body['clientusbdriveredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('ConnEctClientLptPortS')) { $body['connectclientlptports'] = $true }
        if ($PSBoundParameters.ContainsKey('Draganddrop')) { $body['draganddrop'] = $true }
        if ($PSBoundParameters.ContainsKey('Fido2RedirectIon')) { $body['fido2redirection'] = $true }
        if ($PSBoundParameters.ContainsKey('LocalRemoteDataSharing')) { $body['localremotedatasharing'] = $true }
        if ($PSBoundParameters.ContainsKey('MultiStream')) { $body['multistream'] = $true }
        if ($PSBoundParameters.ContainsKey('SmartcardRedirectIon')) { $body['smartcardredirection'] = $true }
        if ($PSBoundParameters.ContainsKey('WiaRedirectIon')) { $body['wiaredirection'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear icaaccessprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icaaccessprofile -Action unset -Payload @{ icaaccessprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetICAAccessProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetICAAccessProfile

# region Invoke-NSUnsetICAAction
function Invoke-NSUnsetICAAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler icaaction resource properties.
    .DESCRIPTION
        Configuration for ica action resource.
    .PARAMETER Name
        Name for the ICA action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica action" or 'my ica action'). Minimum length = 1
    .PARAMETER AccessProfileName
        Name of the ica accessprofile to be associated with this action.
    .PARAMETER LatencyProfileName
        Name of the ica latencyprofile to be associated with this action.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetICAAction -Name 'example' -AccessProfileName  -PassThru
    .EXAMPLE
        Invoke-NSUnsetICAAction -Name 'example' -AccessProfileName  -WhatIf
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
        [switch] $AccessProfileName,

        [Parameter()]
        [switch] $LatencyProfileName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('AccessProfileName')) { $body['accessprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('LatencyProfileName')) { $body['latencyprofilename'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear icaaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icaaction -Action unset -Payload @{ icaaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetICAAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetICAAction

# region Invoke-NSUnsetICALatencyProfile
function Invoke-NSUnsetICALatencyProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler icalatencyprofile resource properties.
    .DESCRIPTION
        Configuration for Profile for Latency monitoring resource.
    .PARAMETER Name
        Name for the ICA latencyprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA latency profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica l7latencyprofile" or 'my ica l7latencyprofile'). Minimum length = 1
    .PARAMETER L7latencyMaxNotifycount
        L7 Latency Max notify Count. This is the upper limit on the number of notifications sent to the Insight Center within an interval where the Latency is above the threshold. Default value: 5 Minimum value = 1 Maximum value = 65535
    .PARAMETER L7latencyMonItoring
        Enable/Disable L7 Latency monitoring for L7 latency notifications. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER L7latencynotifyInterval
        L7 Latency Notify Interval. This is the interval at which the Citrix ADC sends out notifications to the Insight Center after the wait time has passed. Default value: 20 Minimum value = 1 Maximum value = 65535
    .PARAMETER L7latencyThresholdFactor
        L7 Latency threshold factor. This is the factor by which the active latency should be greater than the minimum observed value to determine that the latency is high and may need to be reported. Default value: 4 Minimum value = 2 Maximum value = 65535
    .PARAMETER L7latencywaittime
        L7 Latency Wait time. This is the time for which the Citrix ADC waits after the threshold is exceeded before it sends out a Notification to the Insight Center. Default value: 20 Minimum value = 1 Maximum value = 65535
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetICALatencyProfile -Name 'example' -L7latencyMaxNotifycount  -PassThru
    .EXAMPLE
        Invoke-NSUnsetICALatencyProfile -Name 'example' -L7latencyMaxNotifycount  -WhatIf
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
        [switch] $L7latencyMaxNotifycount,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $L7latencyMonItoring,

        [Parameter()]
        [switch] $L7latencynotifyInterval,

        [Parameter()]
        [switch] $L7latencyThresholdFactor,

        [Parameter()]
        [switch] $L7latencywaittime,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('L7latencyMaxNotifycount')) { $body['l7latencymaxnotifycount'] = $true }
        if ($PSBoundParameters.ContainsKey('L7latencyMonItoring')) { $body['l7latencymonitoring'] = $true }
        if ($PSBoundParameters.ContainsKey('L7latencynotifyInterval')) { $body['l7latencynotifyinterval'] = $true }
        if ($PSBoundParameters.ContainsKey('L7latencyThresholdFactor')) { $body['l7latencythresholdfactor'] = $true }
        if ($PSBoundParameters.ContainsKey('L7latencywaittime')) { $body['l7latencywaittime'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear icalatencyprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icalatencyprofile -Action unset -Payload @{ icalatencyprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetICALatencyProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetICALatencyProfile

# region Invoke-NSUnsetIcaparameter
function Invoke-NSUnsetIcaparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler icaparameter resource properties.
    .DESCRIPTION
        Configuration for Config Parameters for NS ICA resource.
    .PARAMETER DfPersistence
        Enable/Disable DF Persistence. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Edtlosstolerant
        Enable/Disable EDT Loss Tolerant feature. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Edtpmtuddf
        Enable/Disable DF enforcement for EDT PMTUD Control Blocks. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER EdtpmtuddfTimeout
        DF enforcement timeout for EDTPMTUDDF. Default value: 100 Minimum value = 10 Maximum value = 65535
    .PARAMETER Edtpmtudrediscovery
        Enable/Disable EDT PMTUD Rediscovery. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER EnablesronhaFailover
        Enable/Disable Session Reliability on HA failover. The default value is No. Default value: NO Possible values = YES, NO
    .PARAMETER Hdxinsightnonnsap
        Enable/Disable HDXInsight for Non NSAP ICA Sessions. The default value is Yes. Default value: YES Possible values = YES, NO
    .PARAMETER Insightonlytodirector
        Enable/Disable HDX Insight data to Director even if HDX Insight policy is not configured on Gateway and Network Telemtry policy is enabled on VDA. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER L7latencyfrequency
        Specify the time interval/period for which L7 Client Latency value is to be calculated. By default, L7 Client Latency is calculated for every packet. The default value is 0. Default value: 0 Minimum value = 0 Maximum value = 60
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetIcaparameter -DfPersistence ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetIcaparameter -DfPersistence ENABLED -WhatIf
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
        [switch] $DfPersistence,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Edtlosstolerant,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Edtpmtuddf,

        [Parameter()]
        [switch] $EdtpmtuddfTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Edtpmtudrediscovery,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $EnablesronhaFailover,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Hdxinsightnonnsap,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Insightonlytodirector,

        [Parameter()]
        [switch] $L7latencyfrequency,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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
        if ($PSBoundParameters.ContainsKey('DfPersistence')) { $body['dfpersistence'] = $true }
        if ($PSBoundParameters.ContainsKey('Edtlosstolerant')) { $body['edtlosstolerant'] = $true }
        if ($PSBoundParameters.ContainsKey('Edtpmtuddf')) { $body['edtpmtuddf'] = $true }
        if ($PSBoundParameters.ContainsKey('EdtpmtuddfTimeout')) { $body['edtpmtuddftimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Edtpmtudrediscovery')) { $body['edtpmtudrediscovery'] = $true }
        if ($PSBoundParameters.ContainsKey('EnablesronhaFailover')) { $body['enablesronhafailover'] = $true }
        if ($PSBoundParameters.ContainsKey('Hdxinsightnonnsap')) { $body['hdxinsightnonnsap'] = $true }
        if ($PSBoundParameters.ContainsKey('Insightonlytodirector')) { $body['insightonlytodirector'] = $true }
        if ($PSBoundParameters.ContainsKey('L7latencyfrequency')) { $body['l7latencyfrequency'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('icaparameter', 'Clear icaparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icaparameter -Action unset -Payload @{ icaparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetIcaparameter

# region Invoke-NSUnsetICAPolicy
function Invoke-NSUnsetICAPolicy {
    <#
    .SYNOPSIS
        Clears one or more NetScaler icapolicy resource properties.
    .DESCRIPTION
        Configuration for ICA policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica policy" or 'my ica policy').
    .PARAMETER Comment
        Any type of information about this ICA policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetICAPolicy -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUnsetICAPolicy -Name 'example' -Comment 'Updated by automation' -WhatIf
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
        [psobject] $Session = (Get-NSSession),

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

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear icapolicy properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type icapolicy -Action unset -Payload @{ icapolicy = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetICAPolicy -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetICAPolicy

# region Invoke-NSUpdateICAAccessProfile
function Invoke-NSUpdateICAAccessProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler icaaccessprofile resource.
    .DESCRIPTION
        Configuration for ica accessprofile resource.
    .PARAMETER ClientAudioRedirectIon
        Allow Default access/Disable applications hosted on the server to play sounds through a sound device installed on the client computer, also allows or prevents users to record audio input. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientCLIPboardRedirectIon
        Allow Default access/Disable the clipboard on the client device to be mapped to the clipboard on the server. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientComPortRedirectIon
        Allow Default access/Disable COM port redirection to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientDriveRedirectIon
        Allow Default access/Disables drive redirection to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientPrinterRedirectIon
        Allow Default access/Disable client printers to be mapped to a server when a user logs on to a session. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientTwaindeviceRedirectIon
        Allow default access or disable TWAIN devices, such as digital cameras or scanners, on the client device from published image processing applications. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ClientUsbdriveRedirectIon
        Allow Default access/Disable the redirection of USB devices to and from the client. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER ConnEctClientLptPortS
        Allow Default access/Disable automatic connection of LPT ports from the client when the user logs on. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Draganddrop
        Allow default access or disable drag and drop between client and remote applications and desktops. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Fido2RedirectIon
        Allow default access or disable FIDO2 redirection. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER LocalRemoteDataSharing
        Allow Default access/Disable file/data sharing via the Receiver for HTML5. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER MultiStream
        Allow Default access/Disable the multistream feature for the specified users. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Name
        Name for the ICA accessprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA accessprofile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica accessprofile" or 'my ica accessprofile'). Each of the features can be configured as DEFAULT/DISABLED. Here, DISABLED means that the policy settings on the backend XenApp/XenDesktop server are overridden and the Citrix ADC makes the decision to deny access. Whereas DEFAULT means that the Citrix ADC allows the request to reach the XenApp/XenDesktop that takes the decision to allow/deny access based on the policy configured on it. For example, if ClientAudioRedirection is enabled on the backend XenApp/XenDesktop server, and the configured profile has ClientAudioRedirection as DISABLED, the Citrix ADC makes the decision to deny the request irrespective of the configuration on the backend. If the configured profile has ClientAudioRedirection as DEFAULT, then the Citrix ADC forwards the requests to the backend XenApp/XenDesktop server.It then makes the decision to allow/deny access based on the policy configured on it. Minimum length = 1
    .PARAMETER SmartcardRedirectIon
        Allow default access or disable smart card redirection. Smart card virtual channel is always allowed in CVAD. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER WiaRedirectIon
        Allow default access or disable WIA scanner redirection. Default value: DISABLED Possible values = DEFAULT, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateICAAccessProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateICAAccessProfile -Name 'example' -WhatIf
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
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientAudioRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientCLIPboardRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientComPortRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientDriveRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientPrinterRedirectIon,

        [Parameter()]
        [string] $ClientTwaindeviceRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ClientUsbdriveRedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $ConnEctClientLptPortS,

        [Parameter()]
        [string] $Draganddrop,

        [Parameter()]
        [string] $Fido2RedirectIon,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $LocalRemoteDataSharing,

        [Parameter()]
        [ValidateSet('DEFAULT', 'DISABLED')]
        [string] $MultiStream,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $SmartcardRedirectIon,

        [Parameter()]
        [string] $WiaRedirectIon,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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

    if ($PSBoundParameters.ContainsKey('ClientTwaindeviceRedirectIon')) {
        Assert-NSParameterValue -ParameterName 'ClientTwaindeviceRedirectIon' -Value $ClientTwaindeviceRedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Draganddrop')) {
        Assert-NSParameterValue -ParameterName 'Draganddrop' -Value $Draganddrop -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Fido2RedirectIon')) {
        Assert-NSParameterValue -ParameterName 'Fido2RedirectIon' -Value $Fido2RedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('SmartcardRedirectIon')) {
        Assert-NSParameterValue -ParameterName 'SmartcardRedirectIon' -Value $SmartcardRedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('WiaRedirectIon')) {
        Assert-NSParameterValue -ParameterName 'WiaRedirectIon' -Value $WiaRedirectIon -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('DEFAULT', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('ClientAudioRedirectIon')) { $properties['clientaudioredirection'] = $ClientAudioRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientCLIPboardRedirectIon')) { $properties['clientclipboardredirection'] = $ClientCLIPboardRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientComPortRedirectIon')) { $properties['clientcomportredirection'] = $ClientComPortRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientDriveRedirectIon')) { $properties['clientdriveredirection'] = $ClientDriveRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientPrinterRedirectIon')) { $properties['clientprinterredirection'] = $ClientPrinterRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientTwaindeviceRedirectIon')) { $properties['clienttwaindeviceredirection'] = $ClientTwaindeviceRedirectIon }
    if ($PSBoundParameters.ContainsKey('ClientUsbdriveRedirectIon')) { $properties['clientusbdriveredirection'] = $ClientUsbdriveRedirectIon }
    if ($PSBoundParameters.ContainsKey('ConnEctClientLptPortS')) { $properties['connectclientlptports'] = $ConnEctClientLptPortS }
    if ($PSBoundParameters.ContainsKey('Draganddrop')) { $properties['draganddrop'] = $Draganddrop }
    if ($PSBoundParameters.ContainsKey('Fido2RedirectIon')) { $properties['fido2redirection'] = $Fido2RedirectIon }
    if ($PSBoundParameters.ContainsKey('LocalRemoteDataSharing')) { $properties['localremotedatasharing'] = $LocalRemoteDataSharing }
    if ($PSBoundParameters.ContainsKey('MultiStream')) { $properties['multistream'] = $MultiStream }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('SmartcardRedirectIon')) { $properties['smartcardredirection'] = $SmartcardRedirectIon }
    if ($PSBoundParameters.ContainsKey('WiaRedirectIon')) { $properties['wiaredirection'] = $WiaRedirectIon }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update icaaccessprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type icaaccessprofile -Payload @{ icaaccessprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICAAccessProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateICAAccessProfile

# region Invoke-NSUpdateICAAction
function Invoke-NSUpdateICAAction {
    <#
    .SYNOPSIS
        Updates a NetScaler icaaction resource.
    .DESCRIPTION
        Configuration for ica action resource.
    .PARAMETER AccessProfileName
        Name of the ica accessprofile to be associated with this action.
    .PARAMETER LatencyProfileName
        Name of the ica latencyprofile to be associated with this action.
    .PARAMETER Name
        Name for the ICA action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica action" or 'my ica action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateICAAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateICAAction -Name 'example' -WhatIf
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
        [string] $AccessProfileName,

        [Parameter()]
        [string] $LatencyProfileName,

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
    if ($PSBoundParameters.ContainsKey('AccessProfileName')) { $properties['accessprofilename'] = $AccessProfileName }
    if ($PSBoundParameters.ContainsKey('LatencyProfileName')) { $properties['latencyprofilename'] = $LatencyProfileName }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update icaaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type icaaction -Payload @{ icaaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICAAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateICAAction

# region Invoke-NSUpdateICALatencyProfile
function Invoke-NSUpdateICALatencyProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler icalatencyprofile resource.
    .DESCRIPTION
        Configuration for Profile for Latency monitoring resource.
    .PARAMETER L7latencyMaxNotifycount
        L7 Latency Max notify Count. This is the upper limit on the number of notifications sent to the Insight Center within an interval where the Latency is above the threshold. Default value: 5 Minimum value = 1 Maximum value = 65535
    .PARAMETER L7latencyMonItoring
        Enable/Disable L7 Latency monitoring for L7 latency notifications. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER L7latencynotifyInterval
        L7 Latency Notify Interval. This is the interval at which the Citrix ADC sends out notifications to the Insight Center after the wait time has passed. Default value: 20 Minimum value = 1 Maximum value = 65535
    .PARAMETER L7latencyThresholdFactor
        L7 Latency threshold factor. This is the factor by which the active latency should be greater than the minimum observed value to determine that the latency is high and may need to be reported. Default value: 4 Minimum value = 2 Maximum value = 65535
    .PARAMETER L7latencywaittime
        L7 Latency Wait time. This is the time for which the Citrix ADC waits after the threshold is exceeded before it sends out a Notification to the Insight Center. Default value: 20 Minimum value = 1 Maximum value = 65535
    .PARAMETER Name
        Name for the ICA latencyprofile. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the ICA latency profile is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica l7latencyprofile" or 'my ica l7latencyprofile'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateICALatencyProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateICALatencyProfile -Name 'example' -WhatIf
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
        [int] $L7latencyMaxNotifycount,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $L7latencyMonItoring,

        [Parameter()]
        [int] $L7latencynotifyInterval,

        [Parameter()]
        [int] $L7latencyThresholdFactor,

        [Parameter()]
        [int] $L7latencywaittime,

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
    if ($PSBoundParameters.ContainsKey('L7latencyMaxNotifycount')) { $properties['l7latencymaxnotifycount'] = $L7latencyMaxNotifycount }
    if ($PSBoundParameters.ContainsKey('L7latencyMonItoring')) { $properties['l7latencymonitoring'] = $L7latencyMonItoring }
    if ($PSBoundParameters.ContainsKey('L7latencynotifyInterval')) { $properties['l7latencynotifyinterval'] = $L7latencynotifyInterval }
    if ($PSBoundParameters.ContainsKey('L7latencyThresholdFactor')) { $properties['l7latencythresholdfactor'] = $L7latencyThresholdFactor }
    if ($PSBoundParameters.ContainsKey('L7latencywaittime')) { $properties['l7latencywaittime'] = $L7latencywaittime }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update icalatencyprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type icalatencyprofile -Payload @{ icalatencyprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICALatencyProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateICALatencyProfile

# region Invoke-NSUpdateIcaparameter
function Invoke-NSUpdateIcaparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler icaparameter resource.
    .DESCRIPTION
        Configuration for Config Parameters for NS ICA resource.
    .PARAMETER DfPersistence
        Enable/Disable DF Persistence. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Edtlosstolerant
        Enable/Disable EDT Loss Tolerant feature. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Edtpmtuddf
        Enable/Disable DF enforcement for EDT PMTUD Control Blocks. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER EdtpmtuddfTimeout
        DF enforcement timeout for EDTPMTUDDF. Default value: 100 Minimum value = 10 Maximum value = 65535
    .PARAMETER Edtpmtudrediscovery
        Enable/Disable EDT PMTUD Rediscovery. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER EnablesronhaFailover
        Enable/Disable Session Reliability on HA failover. The default value is No. Default value: NO Possible values = YES, NO
    .PARAMETER Hdxinsightnonnsap
        Enable/Disable HDXInsight for Non NSAP ICA Sessions. The default value is Yes. Default value: YES Possible values = YES, NO
    .PARAMETER Insightonlytodirector
        Enable/Disable HDX Insight data to Director even if HDX Insight policy is not configured on Gateway and Network Telemtry policy is enabled on VDA. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER L7latencyfrequency
        Specify the time interval/period for which L7 Client Latency value is to be calculated. By default, L7 Client Latency is calculated for every packet. The default value is 0. Default value: 0 Minimum value = 0 Maximum value = 60
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateIcaparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateIcaparameter  -WhatIf
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
        [string] $DfPersistence,

        [Parameter()]
        [string] $Edtlosstolerant,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Edtpmtuddf,

        [Parameter()]
        [int] $EdtpmtuddfTimeout,

        [Parameter()]
        [string] $Edtpmtudrediscovery,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $EnablesronhaFailover,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Hdxinsightnonnsap,

        [Parameter()]
        [string] $Insightonlytodirector,

        [Parameter()]
        [int] $L7latencyfrequency,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

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

    if ($PSBoundParameters.ContainsKey('DfPersistence')) {
        Assert-NSParameterValue -ParameterName 'DfPersistence' -Value $DfPersistence -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Edtlosstolerant')) {
        Assert-NSParameterValue -ParameterName 'Edtlosstolerant' -Value $Edtlosstolerant -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Edtpmtudrediscovery')) {
        Assert-NSParameterValue -ParameterName 'Edtpmtudrediscovery' -Value $Edtpmtudrediscovery -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Insightonlytodirector')) {
        Assert-NSParameterValue -ParameterName 'Insightonlytodirector' -Value $Insightonlytodirector -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('DfPersistence')) { $properties['dfpersistence'] = $DfPersistence }
    if ($PSBoundParameters.ContainsKey('Edtlosstolerant')) { $properties['edtlosstolerant'] = $Edtlosstolerant }
    if ($PSBoundParameters.ContainsKey('Edtpmtuddf')) { $properties['edtpmtuddf'] = $Edtpmtuddf }
    if ($PSBoundParameters.ContainsKey('EdtpmtuddfTimeout')) { $properties['edtpmtuddftimeout'] = $EdtpmtuddfTimeout }
    if ($PSBoundParameters.ContainsKey('Edtpmtudrediscovery')) { $properties['edtpmtudrediscovery'] = $Edtpmtudrediscovery }
    if ($PSBoundParameters.ContainsKey('EnablesronhaFailover')) { $properties['enablesronhafailover'] = $EnablesronhaFailover }
    if ($PSBoundParameters.ContainsKey('Hdxinsightnonnsap')) { $properties['hdxinsightnonnsap'] = $Hdxinsightnonnsap }
    if ($PSBoundParameters.ContainsKey('Insightonlytodirector')) { $properties['insightonlytodirector'] = $Insightonlytodirector }
    if ($PSBoundParameters.ContainsKey('L7latencyfrequency')) { $properties['l7latencyfrequency'] = $L7latencyfrequency }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('icaparameter', 'Update icaparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type icaparameter -Payload @{ icaparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateIcaparameter

# region Invoke-NSUpdateICAPolicy
function Invoke-NSUpdateICAPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler icapolicy resource.
    .DESCRIPTION
        Configuration for ICA policy resource.
    .PARAMETER Action
        Name of the ica action to be associated with this policy.
    .PARAMETER Comment
        Any type of information about this ICA policy.
    .PARAMETER LogAction
        Name of the messagelog action to use for requests that match this policy.
    .PARAMETER Name
        Name for the policy. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica policy" or 'my ica policy').
    .PARAMETER Rule
        Expression or other value against which the traffic is evaluated. Must be a Boolean expression. The following requirements apply only to the Citrix ADC CLI: * If the expression includes one or more spaces, enclose the entire expression in double quotation marks. * If the expression itself includes double quotation marks, escape the quotations by using the \ character. * Alternatively, you can use single quotation marks to enclose the rule, in which case you do not have to escape the double quotation marks.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateICAPolicy -Name 'example' -Comment 'Updated by automation' -PassThru
    .EXAMPLE
        Invoke-NSUpdateICAPolicy -Name 'example' -Comment 'Updated by automation' -WhatIf
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

        [Parameter()]
        [string] $LogAction,

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
    if ($PSBoundParameters.ContainsKey('Comment')) { $properties['comment'] = $Comment }
    if ($PSBoundParameters.ContainsKey('LogAction')) { $properties['logaction'] = $LogAction }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update icapolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type icapolicy -Payload @{ icapolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetICAPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateICAPolicy

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAfz8raAEXG9DjT
# 4dqetGEAEBjIhWovhtr33m1iTbMZVqCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQg15L3
# u/HlmqTYjLQ5foPKAUIsUph524LLWOVm2Cf0pkcwDQYJKoZIhvcNAQEBBQAEggGA
# V0gJRVELmP8fgK3f6yWyfDMOnqZiOn8n9EjLEqMNMUeFzNSc/2e3MMst+QDoFAlP
# /Y4vfaAjdFdxsr7Smp2LIKWa3RvLLTYrnUoDHMfNM59sM3/zNYd5DpVgzyqyUhGa
# SUZEKDAokMGtaJYhxpAxbPSb/C6WGxJ6sLTPxVk/N4IfYgMnCMiQSRHShvP7gxRB
# bv1dhs12uOi5tMVyKu83Fe/lONGGukhuekGskTiWciMqzyigGzZZ2ssNObo6CEOj
# MChCmPkVMSpqNGYhyIR6zTQ59vvLLlNd+0PjKMAJkwcpxhckn7TuyKrs8F4CRPVB
# 4fx+Ru37LJrpI6kEpzDwZ8pWAeJgwJkdhPKx0HglHR+U8OuX4tv9qIEKXGOsNz0P
# vZJUl906EcKU3484LXkyRqx4xDKoNjFQcyszimXIVLqyEVqW4TUpyM2AH57pE9iW
# 70WUu/LzE+zYSrhN/3D/I/ERX60/0o6hpovR3C2Pr2eREJy214WduqLB8st3s0yk
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIDtN0/aAD0w3OstJkDe5
# QDRFAHpgGrQWYPWMn8Y1nmDEAgZq7daDFvwYEzIwMjYxMTEwMTAyMjQxLjY5Mlow
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
# IgQgZv0CYSksCC97FU4eyaJBFoRzC0ODg7+orcG4/Jy8bPIwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCACjos3WNNAlDnGB+u1
# j+TFVuADzLWfRYWTNcqQqegKeTANBgkqhkiG9w0BAQsFAASCAgB8Fan5ODHh3TaZ
# rbhkSvfL422oI2hlsumWfFzZ4CQh7XwzXN+87mh1GEkTYk6XhBjWD890T5R+G3Il
# byQpgDrvSYUP929fSDCdaVIjjBJ09ONS3A1KSYgTt5NZnyqPgz0f9g4dtMlt32FU
# 7+4Atc6zFMHwCOk1dc2PpCO8jrfBIk+V8QNOCJk1dUGu6/HzHyfzxjWP1a0YuWvF
# uuFTLMLbg0+7kvpYt7WoeqRxDWty3wDXIU/ulNCVmhcZE7YwfUrqlhOx78Ov7zbJ
# MiSTL4JgTlAW4Ok0eWCdgXD+sPv4nTdRxe+GYmgpysmFrCjKyD/jtR1MHX+rJLld
# uViq4p0CZr50wvi7jMO9Jbwi6oGLWHHkxo9emtnnrBgTXpMMK9ZpD2LrR0P2bvK9
# OA0F8u09ZcutUQFvUJwBHfcvICNgvAM5Mz+T0GynwIiYLrFDIyP5ItfHQf/PpkCe
# MhgT34/TosIYaMv7QDb/v/HzIXkIVFmhIUOtbxz+3cBbYgJyBN8+zmvwaYhN87yQ
# BOj7vh/Ab7Ir2Psd3+pj0TA1fPaR/j+leU31BQfXEl/VaBTPFQ62gCQk7dMdngPT
# TM/Xd7t0KPXVumDOvVjJF8SLNE+b7BapLVUUw51wvWEFJLmmuzqtfZxKQQeOv+JI
# kRq0zQoErIqhF4PpDjjweti+vPOrow==
# SIG # End signature block
