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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBxsY+bEnAXwrrz
# 7yqBvV8PvCm164Ldfp9M3ojV2pq8HaCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCAjh2CAdudKJFeZ3jh1Ia2XJsu4S+6e64pMpYQXw5qk
# 3DANBgkqhkiG9w0BAQEFAASCAYDA8V+y7pngZOczOJff9OLNIIJoPoFoES56/9Po
# IDmEmZctTCExmYyeP0hQ83vRw/YykHy2UZlsR3glc5pUHUZvEOtZF20fSBHcCuKx
# I+Xcj2VAyyvVHa2Oocw+oaWzW+EgKuy+QbT7cx+Z6BalhTqa5tEuVbnHvDvcZr+4
# gKWdtztKuXRBvC6tZKwNJbehS0R7RIy1q5AcR9hffZWUWrzAkpIKehGGuqqXlCKU
# Ysnd2akS0Pxe7Qg5w4W5Ndo46ykitTPR4iz3Vj/+g/H8Zp2hPWkCjw1fhe/c9zjE
# lsxm3PQGJr9xZi9IYurSIrGc5+mvf9xDcoCepGearop2t2tzXKkjnju1YFdKTlle
# YlceiYW/lvA4G8q5F0YlrkL8bvadHSR/GggnsO8MK58JiKC1RT9cxKNHqcGQyFyn
# xvcmiSIOSliDEKa2ZdtkaT0iGHee9Yko/dFprVqFXFsM6gmrg4WjkjqkHxzQ0CXv
# Bsfy65lOqPRtSFyv/8eYM24vISahggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU2MTFaMD8GCSqGSIb3
# DQEJBDEyBDCKrIJwcPpG8d1863HxUkOlt1bGZX/Wu2zaGZXBiuOHk7DJRh6noctU
# v0tRr6QgYlEwDQYJKoZIhvcNAQEBBQAEggIAOUK7S0/8O1cL1EQDoZMSmL+bsht5
# Vc1Ajo+DZjOdnYB+koczsPxshNiZklpTNMXqyKBjUm2mGzojOvhtPC7eBWb4xPcc
# eN3iBT4dPM9sXsdxbNQtLf/eWNswPQ5U8+De3sR36uJNyJgPXcXBAkh5u+Ionp+4
# +I9vCqha4h9n2PtVeghTogmWSwLoZyFKPmhd4MuSihbIKL2diQ6db15guVHGrCAI
# VAVsbo+eLyyGPk8Cycx+8PFeJq/PWBgSE98FKWRr9Xt3tytUCIrkgZ8tpNz6Xq6T
# ntYCyVqwK9DA/38xiBQfBIMxSRhgnG0PJoPGCfROz89QLQ3Yy7Q9SzS2XmNwtAqY
# T5MsC1tyHApVqf6LiNLo5krJ6EeFxrx/wp84oG+3QdfQPFgztywU37APJIii5bxp
# duWeVI6YjknqRRYG4rzr3ptnEN3P+Mg7Y/cG9k42rqkkaGrRjFOgkmU+YC46h5xn
# iPBxwe8j4/k/9O2ZrwmNGP25lsPuBoLMRTT+54EIe1MI74Ld7TnM7nepkzf6ZzKl
# nZJKeCPzAR4YyK0a5m0NiYPFj/VxdQ1yYxWhrYNp/owsXim1qpDWtmqSmM0nAyO6
# CsoJrq8qFnYCYFRplBOKgJ8M4LF7qTp7n8L8Jb7e0ZYdEAtf1b0EfyUFr9fF6sBr
# 9y6sUcEqDmgkBoU=
# SIG # End signature block
