# Generated NetScalerToolkit Configuration bundle for category 'quic'.

# region Invoke-NSAddQUICProfile
function Invoke-NSAddQUICProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler quicprofile resource.
    .DESCRIPTION
        Configuration for QUIC profile resource.
    .PARAMETER Ackdelayexponent
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, indicating an exponent that the remote QUIC endpoint should use, to decode the ACK Delay field in QUIC ACK frames sent by the Citrix ADC. Default value: 3 Minimum value = 0 Maximum value = 20
    .PARAMETER ActiveConnectionIdlimit
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum number of QUIC connection IDs from the remote QUIC endpoint, that the Citrix ADC is willing to store. Default value: 3 Minimum value = 2 Maximum value = 8
    .PARAMETER ActiveConnectionMigration
        Specify whether the Citrix ADC should allow the remote QUIC endpoint to perform active QUIC connection migration. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Congestionctrlalgorithm
        Specify the congestion control algorithm to be used for QUIC connections. The default congestion control algorithm is CUBIC. Default value: Default Possible values = Default, NewReno, CUBIC, BBR
    .PARAMETER InitialMaxData
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial value, in bytes, for the maximum amount of data that can be sent on a QUIC connection. Default value: 1048576 Minimum value = 8192 Maximum value = 67108864
    .PARAMETER InitialMaxStreamDataBidiLocal
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for bidirectional QUIC streams initiated by the Citrix ADC. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamDataBidiremote
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for bidirectional QUIC streams initiated by the remote QUIC endpoint. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamDataUni
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for unidirectional streams initiated by the remote QUIC endpoint. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamsbidi
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial maximum number of bidirectional streams the remote QUIC endpoint may initiate. Default value: 100 Minimum value = 1 Maximum value = 500
    .PARAMETER InitialMaxStreamsuni
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial maximum number of unidirectional streams the remote QUIC endpoint may initiate. Default value: 10 Minimum value = 1 Maximum value = 500
    .PARAMETER MaxAckdelay
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum amount of time, in milliseconds, by which the Citrix ADC will delay sending acknowledgments. Default value: 20 Minimum value = 10 Maximum value = 2000
    .PARAMETER MaxIdleTimeout
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum idle timeout, in seconds, for a QUIC connection. A QUIC connection will be silently discarded by the Citrix ADC if it remains idle for longer than the minimum of the idle timeout values advertised by the Citrix ADC and the remote QUIC endpoint, and three times the current Probe Timeout (PTO). Default value: 180 Minimum value = 1 Maximum value = 3600
    .PARAMETER MaxUDPDataGramsperburst
        An integer value, specifying the maximum number of UDP datagrams that can be transmitted by the Citrix ADC in a single transmission burst on a QUIC connection. Default value: 8 Minimum value = 1 Maximum value = 256
    .PARAMETER MaxUDPPayloadsize
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the size of the largest UDP datagram payload, in bytes, that the Citrix ADC is willing to receive on a QUIC connection. Default value: 1472 Minimum value = 1252 Maximum value = 9188
    .PARAMETER Name
        Name for the QUIC profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@),equals sign (=), and hyphen (-) characters. Cannot be changed after the profile is created. Minimum length = 1 Maximum length = 256
    .PARAMETER NewtokenvalidiTypeRiod
        An integer value, specifying the validity period, in seconds, of address validation tokens issued through QUIC NEW_TOKEN frames sent by the Citrix ADC. Default value: 300 Minimum value = 1 Maximum value = 3600
    .PARAMETER RetrytokenvalidiTypeRiod
        An integer value, specifying the validity period, in seconds, of address validation tokens issued through QUIC Retry packets sent by the Citrix ADC. Default value: 10 Minimum value = 1 Maximum value = 120
    .PARAMETER Statelessaddressvalidation
        Specify whether the Citrix ADC should perform stateless address validation for QUIC clients, by sending tokens in QUIC Retry packets during QUIC connection establishment, and by sending tokens in QUIC NEW_TOKEN frames after QUIC connection establishment. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSAddQUICProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddQUICProfile -Name 'example' -WhatIf
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
        [int] $Ackdelayexponent,

        [Parameter()]
        [int] $ActiveConnectionIdlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ActiveConnectionMigration,

        [Parameter()]
        [ValidateSet('Default', 'NewReno', 'CUBIC', 'BBR')]
        [string] $Congestionctrlalgorithm,

        [Parameter()]
        [int] $InitialMaxData,

        [Parameter()]
        [int] $InitialMaxStreamDataBidiLocal,

        [Parameter()]
        [int] $InitialMaxStreamDataBidiremote,

        [Parameter()]
        [int] $InitialMaxStreamDataUni,

        [Parameter()]
        [int] $InitialMaxStreamsbidi,

        [Parameter()]
        [int] $InitialMaxStreamsuni,

        [Parameter()]
        [int] $MaxAckdelay,

        [Parameter()]
        [int] $MaxIdleTimeout,

        [Parameter()]
        [int] $MaxUDPDataGramsperburst,

        [Parameter()]
        [int] $MaxUDPPayloadsize,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $NewtokenvalidiTypeRiod,

        [Parameter()]
        [int] $RetrytokenvalidiTypeRiod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Statelessaddressvalidation,

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
    if ($PSBoundParameters.ContainsKey('Ackdelayexponent')) { $properties['ackdelayexponent'] = $Ackdelayexponent }
    if ($PSBoundParameters.ContainsKey('ActiveConnectionIdlimit')) { $properties['activeconnectionidlimit'] = $ActiveConnectionIdlimit }
    if ($PSBoundParameters.ContainsKey('ActiveConnectionMigration')) { $properties['activeconnectionmigration'] = $ActiveConnectionMigration }
    if ($PSBoundParameters.ContainsKey('Congestionctrlalgorithm')) { $properties['congestionctrlalgorithm'] = $Congestionctrlalgorithm }
    if ($PSBoundParameters.ContainsKey('InitialMaxData')) { $properties['initialmaxdata'] = $InitialMaxData }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataBidiLocal')) { $properties['initialmaxstreamdatabidilocal'] = $InitialMaxStreamDataBidiLocal }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataBidiremote')) { $properties['initialmaxstreamdatabidiremote'] = $InitialMaxStreamDataBidiremote }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataUni')) { $properties['initialmaxstreamdatauni'] = $InitialMaxStreamDataUni }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamsbidi')) { $properties['initialmaxstreamsbidi'] = $InitialMaxStreamsbidi }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamsuni')) { $properties['initialmaxstreamsuni'] = $InitialMaxStreamsuni }
    if ($PSBoundParameters.ContainsKey('MaxAckdelay')) { $properties['maxackdelay'] = $MaxAckdelay }
    if ($PSBoundParameters.ContainsKey('MaxIdleTimeout')) { $properties['maxidletimeout'] = $MaxIdleTimeout }
    if ($PSBoundParameters.ContainsKey('MaxUDPDataGramsperburst')) { $properties['maxudpdatagramsperburst'] = $MaxUDPDataGramsperburst }
    if ($PSBoundParameters.ContainsKey('MaxUDPPayloadsize')) { $properties['maxudppayloadsize'] = $MaxUDPPayloadsize }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NewtokenvalidiTypeRiod')) { $properties['newtokenvalidityperiod'] = $NewtokenvalidiTypeRiod }
    if ($PSBoundParameters.ContainsKey('RetrytokenvalidiTypeRiod')) { $properties['retrytokenvalidityperiod'] = $RetrytokenvalidiTypeRiod }
    if ($PSBoundParameters.ContainsKey('Statelessaddressvalidation')) { $properties['statelessaddressvalidation'] = $Statelessaddressvalidation }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create quicprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type quicprofile -Payload @{ quicprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetQUICProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddQUICProfile

# region Invoke-NSDeleteQUICProfile
function Invoke-NSDeleteQUICProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler quicprofile resource.
    .DESCRIPTION
        Configuration for QUIC profile resource.
    .PARAMETER Name
        Name for the QUIC profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@),equals sign (=), and hyphen (-) characters. Cannot be changed after the profile is created. Minimum length = 1 Maximum length = 256
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteQUICProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetQUICProfile -Name 'quicprofile_example' | Invoke-NSDeleteQUICProfile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete quicprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type quicprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteQUICProfile

# region Invoke-NSGetQUICParam
function Invoke-NSGetQUICParam {
    <#
    .SYNOPSIS
        Gets NetScaler quicparam configuration.
    .DESCRIPTION
        Configuration for Citrix ADC QUIC parameters resource.
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
        Invoke-NSGetQUICParam
    .EXAMPLE
        Invoke-NSGetQUICParam -Filter @{ servicetype = 'HTTP' }
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
            Type = 'quicparam'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetQUICParam

# region Invoke-NSGetQUICProfile
function Invoke-NSGetQUICProfile {
    <#
    .SYNOPSIS
        Gets NetScaler quicprofile configuration.
    .DESCRIPTION
        Configuration for QUIC profile resource.
    .PARAMETER Name
        Name for the QUIC profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@),equals sign (=), and hyphen (-) characters. Cannot be changed after the profile is created. Minimum length = 1 Maximum length = 256
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
        Invoke-NSGetQUICProfile
    .EXAMPLE
        Invoke-NSGetQUICProfile -Name 'quicprofile_example'
    .EXAMPLE
        Invoke-NSGetQUICProfile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'quicprofile'
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
# endregion Invoke-NSGetQUICProfile

# region Invoke-NSUnsetQUICParam
function Invoke-NSUnsetQUICParam {
    <#
    .SYNOPSIS
        Clears one or more NetScaler quicparam resource properties.
    .DESCRIPTION
        Configuration for Citrix ADC QUIC parameters resource.
    .PARAMETER QUICSecretTimeout
        Rotation frequency, in seconds, for the secret used to generate address validation tokens that will be issued in QUIC Retry packets and QUIC NEW_TOKEN frames sent by the Citrix ADC. A value of 0 can be configured if secret rotation is not desired. Default value: 3600 Minimum value = 0 Maximum value = 31536000
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
        Invoke-NSUnsetQUICParam -QUICSecretTimeout  -PassThru
    .EXAMPLE
        Invoke-NSUnsetQUICParam -QUICSecretTimeout  -WhatIf
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
        [switch] $QUICSecretTimeout,

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
        if ($PSBoundParameters.ContainsKey('QUICSecretTimeout')) { $body['quicsecrettimeout'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('quicparam', 'Clear quicparam properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type quicparam -Action unset -Payload @{ quicparam = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetQUICParam

# region Invoke-NSUnsetQUICProfile
function Invoke-NSUnsetQUICProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler quicprofile resource properties.
    .DESCRIPTION
        Configuration for QUIC profile resource.
    .PARAMETER Name
        Name for the QUIC profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@),equals sign (=), and hyphen (-) characters. Cannot be changed after the profile is created. Minimum length = 1 Maximum length = 256
    .PARAMETER Ackdelayexponent
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, indicating an exponent that the remote QUIC endpoint should use, to decode the ACK Delay field in QUIC ACK frames sent by the Citrix ADC. Default value: 3 Minimum value = 0 Maximum value = 20
    .PARAMETER ActiveConnectionIdlimit
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum number of QUIC connection IDs from the remote QUIC endpoint, that the Citrix ADC is willing to store. Default value: 3 Minimum value = 2 Maximum value = 8
    .PARAMETER ActiveConnectionMigration
        Specify whether the Citrix ADC should allow the remote QUIC endpoint to perform active QUIC connection migration. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Congestionctrlalgorithm
        Specify the congestion control algorithm to be used for QUIC connections. The default congestion control algorithm is CUBIC. Default value: Default Possible values = Default, NewReno, CUBIC, BBR
    .PARAMETER InitialMaxData
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial value, in bytes, for the maximum amount of data that can be sent on a QUIC connection. Default value: 1048576 Minimum value = 8192 Maximum value = 67108864
    .PARAMETER InitialMaxStreamDataBidiLocal
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for bidirectional QUIC streams initiated by the Citrix ADC. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamDataBidiremote
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for bidirectional QUIC streams initiated by the remote QUIC endpoint. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamDataUni
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for unidirectional streams initiated by the remote QUIC endpoint. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamsbidi
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial maximum number of bidirectional streams the remote QUIC endpoint may initiate. Default value: 100 Minimum value = 1 Maximum value = 500
    .PARAMETER InitialMaxStreamsuni
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial maximum number of unidirectional streams the remote QUIC endpoint may initiate. Default value: 10 Minimum value = 1 Maximum value = 500
    .PARAMETER MaxAckdelay
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum amount of time, in milliseconds, by which the Citrix ADC will delay sending acknowledgments. Default value: 20 Minimum value = 10 Maximum value = 2000
    .PARAMETER MaxIdleTimeout
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum idle timeout, in seconds, for a QUIC connection. A QUIC connection will be silently discarded by the Citrix ADC if it remains idle for longer than the minimum of the idle timeout values advertised by the Citrix ADC and the remote QUIC endpoint, and three times the current Probe Timeout (PTO). Default value: 180 Minimum value = 1 Maximum value = 3600
    .PARAMETER MaxUDPDataGramsperburst
        An integer value, specifying the maximum number of UDP datagrams that can be transmitted by the Citrix ADC in a single transmission burst on a QUIC connection. Default value: 8 Minimum value = 1 Maximum value = 256
    .PARAMETER MaxUDPPayloadsize
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the size of the largest UDP datagram payload, in bytes, that the Citrix ADC is willing to receive on a QUIC connection. Default value: 1472 Minimum value = 1252 Maximum value = 9188
    .PARAMETER NewtokenvalidiTypeRiod
        An integer value, specifying the validity period, in seconds, of address validation tokens issued through QUIC NEW_TOKEN frames sent by the Citrix ADC. Default value: 300 Minimum value = 1 Maximum value = 3600
    .PARAMETER RetrytokenvalidiTypeRiod
        An integer value, specifying the validity period, in seconds, of address validation tokens issued through QUIC Retry packets sent by the Citrix ADC. Default value: 10 Minimum value = 1 Maximum value = 120
    .PARAMETER Statelessaddressvalidation
        Specify whether the Citrix ADC should perform stateless address validation for QUIC clients, by sending tokens in QUIC Retry packets during QUIC connection establishment, and by sending tokens in QUIC NEW_TOKEN frames after QUIC connection establishment. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetQUICProfile -Name 'example' -Ackdelayexponent  -PassThru
    .EXAMPLE
        Invoke-NSUnsetQUICProfile -Name 'example' -Ackdelayexponent  -WhatIf
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
        [switch] $Ackdelayexponent,

        [Parameter()]
        [switch] $ActiveConnectionIdlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ActiveConnectionMigration,

        [Parameter()]
        [ValidateSet('Default', 'NewReno', 'CUBIC', 'BBR')]
        [switch] $Congestionctrlalgorithm,

        [Parameter()]
        [switch] $InitialMaxData,

        [Parameter()]
        [switch] $InitialMaxStreamDataBidiLocal,

        [Parameter()]
        [switch] $InitialMaxStreamDataBidiremote,

        [Parameter()]
        [switch] $InitialMaxStreamDataUni,

        [Parameter()]
        [switch] $InitialMaxStreamsbidi,

        [Parameter()]
        [switch] $InitialMaxStreamsuni,

        [Parameter()]
        [switch] $MaxAckdelay,

        [Parameter()]
        [switch] $MaxIdleTimeout,

        [Parameter()]
        [switch] $MaxUDPDataGramsperburst,

        [Parameter()]
        [switch] $MaxUDPPayloadsize,

        [Parameter()]
        [switch] $NewtokenvalidiTypeRiod,

        [Parameter()]
        [switch] $RetrytokenvalidiTypeRiod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Statelessaddressvalidation,

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
        if ($PSBoundParameters.ContainsKey('Ackdelayexponent')) { $body['ackdelayexponent'] = $true }
        if ($PSBoundParameters.ContainsKey('ActiveConnectionIdlimit')) { $body['activeconnectionidlimit'] = $true }
        if ($PSBoundParameters.ContainsKey('ActiveConnectionMigration')) { $body['activeconnectionmigration'] = $true }
        if ($PSBoundParameters.ContainsKey('Congestionctrlalgorithm')) { $body['congestionctrlalgorithm'] = $true }
        if ($PSBoundParameters.ContainsKey('InitialMaxData')) { $body['initialmaxdata'] = $true }
        if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataBidiLocal')) { $body['initialmaxstreamdatabidilocal'] = $true }
        if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataBidiremote')) { $body['initialmaxstreamdatabidiremote'] = $true }
        if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataUni')) { $body['initialmaxstreamdatauni'] = $true }
        if ($PSBoundParameters.ContainsKey('InitialMaxStreamsbidi')) { $body['initialmaxstreamsbidi'] = $true }
        if ($PSBoundParameters.ContainsKey('InitialMaxStreamsuni')) { $body['initialmaxstreamsuni'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxAckdelay')) { $body['maxackdelay'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxIdleTimeout')) { $body['maxidletimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxUDPDataGramsperburst')) { $body['maxudpdatagramsperburst'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxUDPPayloadsize')) { $body['maxudppayloadsize'] = $true }
        if ($PSBoundParameters.ContainsKey('NewtokenvalidiTypeRiod')) { $body['newtokenvalidityperiod'] = $true }
        if ($PSBoundParameters.ContainsKey('RetrytokenvalidiTypeRiod')) { $body['retrytokenvalidityperiod'] = $true }
        if ($PSBoundParameters.ContainsKey('Statelessaddressvalidation')) { $body['statelessaddressvalidation'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear quicprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type quicprofile -Action unset -Payload @{ quicprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetQUICProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetQUICProfile

# region Invoke-NSUpdateQUICParam
function Invoke-NSUpdateQUICParam {
    <#
    .SYNOPSIS
        Updates a NetScaler quicparam resource.
    .DESCRIPTION
        Configuration for Citrix ADC QUIC parameters resource.
    .PARAMETER QUICSecretTimeout
        Rotation frequency, in seconds, for the secret used to generate address validation tokens that will be issued in QUIC Retry packets and QUIC NEW_TOKEN frames sent by the Citrix ADC. A value of 0 can be configured if secret rotation is not desired. Default value: 3600 Minimum value = 0 Maximum value = 31536000
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
        Invoke-NSUpdateQUICParam  -PassThru
    .EXAMPLE
        Invoke-NSUpdateQUICParam  -WhatIf
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
        [int] $QUICSecretTimeout,

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
    if ($PSBoundParameters.ContainsKey('QUICSecretTimeout')) { $properties['quicsecrettimeout'] = $QUICSecretTimeout }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('quicparam', 'Update quicparam')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type quicparam -Payload @{ quicparam = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateQUICParam

# region Invoke-NSUpdateQUICProfile
function Invoke-NSUpdateQUICProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler quicprofile resource.
    .DESCRIPTION
        Configuration for QUIC profile resource.
    .PARAMETER Ackdelayexponent
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, indicating an exponent that the remote QUIC endpoint should use, to decode the ACK Delay field in QUIC ACK frames sent by the Citrix ADC. Default value: 3 Minimum value = 0 Maximum value = 20
    .PARAMETER ActiveConnectionIdlimit
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum number of QUIC connection IDs from the remote QUIC endpoint, that the Citrix ADC is willing to store. Default value: 3 Minimum value = 2 Maximum value = 8
    .PARAMETER ActiveConnectionMigration
        Specify whether the Citrix ADC should allow the remote QUIC endpoint to perform active QUIC connection migration. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Congestionctrlalgorithm
        Specify the congestion control algorithm to be used for QUIC connections. The default congestion control algorithm is CUBIC. Default value: Default Possible values = Default, NewReno, CUBIC, BBR
    .PARAMETER InitialMaxData
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial value, in bytes, for the maximum amount of data that can be sent on a QUIC connection. Default value: 1048576 Minimum value = 8192 Maximum value = 67108864
    .PARAMETER InitialMaxStreamDataBidiLocal
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for bidirectional QUIC streams initiated by the Citrix ADC. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamDataBidiremote
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for bidirectional QUIC streams initiated by the remote QUIC endpoint. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamDataUni
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial flow control limit, in bytes, for unidirectional streams initiated by the remote QUIC endpoint. Default value: 262144 Minimum value = 8192 Maximum value = 8388608
    .PARAMETER InitialMaxStreamsbidi
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial maximum number of bidirectional streams the remote QUIC endpoint may initiate. Default value: 100 Minimum value = 1 Maximum value = 500
    .PARAMETER InitialMaxStreamsuni
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the initial maximum number of unidirectional streams the remote QUIC endpoint may initiate. Default value: 10 Minimum value = 1 Maximum value = 500
    .PARAMETER MaxAckdelay
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum amount of time, in milliseconds, by which the Citrix ADC will delay sending acknowledgments. Default value: 20 Minimum value = 10 Maximum value = 2000
    .PARAMETER MaxIdleTimeout
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the maximum idle timeout, in seconds, for a QUIC connection. A QUIC connection will be silently discarded by the Citrix ADC if it remains idle for longer than the minimum of the idle timeout values advertised by the Citrix ADC and the remote QUIC endpoint, and three times the current Probe Timeout (PTO). Default value: 180 Minimum value = 1 Maximum value = 3600
    .PARAMETER MaxUDPDataGramsperburst
        An integer value, specifying the maximum number of UDP datagrams that can be transmitted by the Citrix ADC in a single transmission burst on a QUIC connection. Default value: 8 Minimum value = 1 Maximum value = 256
    .PARAMETER MaxUDPPayloadsize
        An integer value advertised by the Citrix ADC to the remote QUIC endpoint, specifying the size of the largest UDP datagram payload, in bytes, that the Citrix ADC is willing to receive on a QUIC connection. Default value: 1472 Minimum value = 1252 Maximum value = 9188
    .PARAMETER Name
        Name for the QUIC profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@),equals sign (=), and hyphen (-) characters. Cannot be changed after the profile is created. Minimum length = 1 Maximum length = 256
    .PARAMETER NewtokenvalidiTypeRiod
        An integer value, specifying the validity period, in seconds, of address validation tokens issued through QUIC NEW_TOKEN frames sent by the Citrix ADC. Default value: 300 Minimum value = 1 Maximum value = 3600
    .PARAMETER RetrytokenvalidiTypeRiod
        An integer value, specifying the validity period, in seconds, of address validation tokens issued through QUIC Retry packets sent by the Citrix ADC. Default value: 10 Minimum value = 1 Maximum value = 120
    .PARAMETER Statelessaddressvalidation
        Specify whether the Citrix ADC should perform stateless address validation for QUIC clients, by sending tokens in QUIC Retry packets during QUIC connection establishment, and by sending tokens in QUIC NEW_TOKEN frames after QUIC connection establishment. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateQUICProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateQUICProfile -Name 'example' -WhatIf
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
        [int] $Ackdelayexponent,

        [Parameter()]
        [int] $ActiveConnectionIdlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ActiveConnectionMigration,

        [Parameter()]
        [ValidateSet('Default', 'NewReno', 'CUBIC', 'BBR')]
        [string] $Congestionctrlalgorithm,

        [Parameter()]
        [int] $InitialMaxData,

        [Parameter()]
        [int] $InitialMaxStreamDataBidiLocal,

        [Parameter()]
        [int] $InitialMaxStreamDataBidiremote,

        [Parameter()]
        [int] $InitialMaxStreamDataUni,

        [Parameter()]
        [int] $InitialMaxStreamsbidi,

        [Parameter()]
        [int] $InitialMaxStreamsuni,

        [Parameter()]
        [int] $MaxAckdelay,

        [Parameter()]
        [int] $MaxIdleTimeout,

        [Parameter()]
        [int] $MaxUDPDataGramsperburst,

        [Parameter()]
        [int] $MaxUDPPayloadsize,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [int] $NewtokenvalidiTypeRiod,

        [Parameter()]
        [int] $RetrytokenvalidiTypeRiod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Statelessaddressvalidation,

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
    if ($PSBoundParameters.ContainsKey('Ackdelayexponent')) { $properties['ackdelayexponent'] = $Ackdelayexponent }
    if ($PSBoundParameters.ContainsKey('ActiveConnectionIdlimit')) { $properties['activeconnectionidlimit'] = $ActiveConnectionIdlimit }
    if ($PSBoundParameters.ContainsKey('ActiveConnectionMigration')) { $properties['activeconnectionmigration'] = $ActiveConnectionMigration }
    if ($PSBoundParameters.ContainsKey('Congestionctrlalgorithm')) { $properties['congestionctrlalgorithm'] = $Congestionctrlalgorithm }
    if ($PSBoundParameters.ContainsKey('InitialMaxData')) { $properties['initialmaxdata'] = $InitialMaxData }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataBidiLocal')) { $properties['initialmaxstreamdatabidilocal'] = $InitialMaxStreamDataBidiLocal }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataBidiremote')) { $properties['initialmaxstreamdatabidiremote'] = $InitialMaxStreamDataBidiremote }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamDataUni')) { $properties['initialmaxstreamdatauni'] = $InitialMaxStreamDataUni }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamsbidi')) { $properties['initialmaxstreamsbidi'] = $InitialMaxStreamsbidi }
    if ($PSBoundParameters.ContainsKey('InitialMaxStreamsuni')) { $properties['initialmaxstreamsuni'] = $InitialMaxStreamsuni }
    if ($PSBoundParameters.ContainsKey('MaxAckdelay')) { $properties['maxackdelay'] = $MaxAckdelay }
    if ($PSBoundParameters.ContainsKey('MaxIdleTimeout')) { $properties['maxidletimeout'] = $MaxIdleTimeout }
    if ($PSBoundParameters.ContainsKey('MaxUDPDataGramsperburst')) { $properties['maxudpdatagramsperburst'] = $MaxUDPDataGramsperburst }
    if ($PSBoundParameters.ContainsKey('MaxUDPPayloadsize')) { $properties['maxudppayloadsize'] = $MaxUDPPayloadsize }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NewtokenvalidiTypeRiod')) { $properties['newtokenvalidityperiod'] = $NewtokenvalidiTypeRiod }
    if ($PSBoundParameters.ContainsKey('RetrytokenvalidiTypeRiod')) { $properties['retrytokenvalidityperiod'] = $RetrytokenvalidiTypeRiod }
    if ($PSBoundParameters.ContainsKey('Statelessaddressvalidation')) { $properties['statelessaddressvalidation'] = $Statelessaddressvalidation }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update quicprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type quicprofile -Payload @{ quicprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetQUICProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateQUICProfile

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBxsY+bEnAXwrrz
# 7yqBvV8PvCm164Ldfp9M3ojV2pq8HaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgI4dg
# gHbnSiRXmd44dSGtlybLuEvunuuKTKWEF8OapNwwDQYJKoZIhvcNAQEBBQAEggGA
# MShSqh87yq0pvO+VYMHN7xJrQbkMTkYkyfeDjF1/I9jTTU6B3La++wf2tMWwVwPX
# n0u/XGotPIs/CJqIqx9xyQtGUQoeNc2stmb3MGRMnu09+M0bvxZGDau041PdmWCz
# WF3oVWFnlBPeEjpQkGQNtmE85zt6sH5VgpGN0OwvbdOi002t6oS7/cPFE9MfnXh4
# jAakRw7erOionrx1lJqJOoOT2XEZkyNGFGB2BUdYAKc3zi/zbeSVyQNyXrhoPRLv
# tzDcRrhxqFA+ol0hAFg9Y+2brUJw6NQ7CnjoDcAYJILYEs+83GHzKnjt7cUbPaMh
# sVQ+Z3Pe9fSXvGP3znt3hZY39oEqFynobMmVQeX0yqXgVN0DYhmhwdl2kTe3mDMP
# /g+DivOueVEJreYBeEZ/iRiOX1COsCkJEDEJZGxe7mp0XIdBVydKhIZOrpA1Pn0C
# zat7NsfppqUqKrRx482A4zLk13X2LeqFBpQHGjKflTRM2BbXMIZTS+6S8I87T42y
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIJ5sosT1ooKy7rfy7K5h
# ZtDJlG6NC+hZUUTQSZIUwtTQAgZqNTBOQJwYEzIwMjYwNzI3MTMxMjEwLjcxMVow
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
# IgQgPZqpIn8qORmQ9bNoQNhToePmLJG+OOEnbLVEYXuhQTIwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCCQq79qqwkD4ea/FiBm
# C4pfvGQpmxVmt9dVg+iQDGdTljANBgkqhkiG9w0BAQsFAASCAgABcGr/uZgP597+
# 8BLlENFI/uaGwga80j7MWV0hkFas8iFTNHnz5qoEnRpQMRiIJijte46UVULMda7R
# idD8GI4hdqPIATHINYqUoyf4v8yvcdPrFJDE17V96caGJq75uG7/RZ6ZIQ5iOC0c
# eM6/zZSZtdbmO6FDTvEktG6OdLIhWkV6IccWoAmRwfclB5YKh4dMCDgpa0U8tQXN
# NEvFIYwQwd7TZe0Z04WFq5L8AdMp8TezlMZtjg0kQZPIRDfVTurBzZEsoXJXY8XN
# qLbmEfqUE0YHbfF6DpuqXX6NEHAwg/p0qWJE/pg+QQomCSuFx13HIogV8UZ30BrP
# cV3VboQJsy3D/L1Z+W1ZXikhqNEZ15AJyAhh4cMPsADbiLuC+oXk67DIirl/mWPU
# 9ZMhIvf1ceclHEfoU+2xt+e0x/17Tv/8R9rLz0UwTyWF1q07j8A0ubth1H8lmdnp
# A8EijdPfl3WfST9KeNmkjVxT8kTAgPryQgOkMqefu1TXxDPtSXOCFaLezCzKmhnt
# EleyFgnMtGwQwOt5LghYKcLipIdiMlO+G8E6UjXPe7j1wRLsZk7yreFviIV5Zd21
# vfsw8aqrqkMjuDa+E4MI98Sgx7dUgGPpzHzGKGYkekUOqIXjUchN/JpVLaZWoa/o
# /eFj9X3dongl1vO0qCXfVdo7eUGjvg==
# SIG # End signature block
