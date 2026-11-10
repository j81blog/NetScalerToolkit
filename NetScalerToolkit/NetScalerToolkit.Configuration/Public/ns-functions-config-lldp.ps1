# Generated NetScalerToolkit Configuration bundle for category 'lldp'.

# region Invoke-NSGetLLDPNeighbors
function Invoke-NSGetLLDPNeighbors {
    <#
    .SYNOPSIS
        Gets NetScaler lldpneighbors configuration.
    .DESCRIPTION
        Configuration for lldp neighbors resource.
    .PARAMETER Ifnum
        Interface Name.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
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
        Invoke-NSGetLLDPNeighbors
    .EXAMPLE
        Invoke-NSGetLLDPNeighbors -Ifnum 'lldpneighbors_example'
    .EXAMPLE
        Invoke-NSGetLLDPNeighbors -Filter @{ servicetype = 'HTTP' }
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
        [string] $Ifnum,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

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
            Type = 'lldpneighbors'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Ifnum
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLLDPNeighbors

# region Invoke-NSGetLldpparam
function Invoke-NSGetLldpparam {
    <#
    .SYNOPSIS
        Gets NetScaler lldpparam configuration.
    .DESCRIPTION
        Configuration for lldp params resource.
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
        Invoke-NSGetLldpparam
    .EXAMPLE
        Invoke-NSGetLldpparam -Filter @{ servicetype = 'HTTP' }
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
            Type = 'lldpparam'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLldpparam

# region Invoke-NSUnsetLldpparam
function Invoke-NSUnsetLldpparam {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lldpparam resource properties.
    .DESCRIPTION
        Configuration for lldp params resource.
    .PARAMETER Holdtimetxmult
        A multiplier for calculating the duration for which the receiving device stores the LLDP information in its database before discarding or removing it. The duration is calculated as the holdtimeTxMult (Holdtime Multiplier) parameter value multiplied by the timer (Timer) parameter value. Default value: 4 Minimum value = 1 Maximum value = 20
    .PARAMETER Mode
        Global mode of Link Layer Discovery Protocol (LLDP) on the Citrix ADC. The resultant LLDP mode of an interface depends on the LLDP mode configured at the global and the interface levels. Possible values = NONE, TRANSMITTER, RECEIVER, TRANSCEIVER
    .PARAMETER Timer
        Interval, in seconds, between LLDP packet data units (LLDPDUs). that the Citrix ADC sends to a directly connected device. Default value: 30 Minimum value = 1 Maximum value = 3000
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
        Invoke-NSUnsetLldpparam -Holdtimetxmult  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLldpparam -Holdtimetxmult  -WhatIf
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
        [switch] $Holdtimetxmult,

        [Parameter()]
        [ValidateSet('NONE', 'TRANSMITTER', 'RECEIVER', 'TRANSCEIVER')]
        [switch] $Mode,

        [Parameter()]
        [switch] $Timer,

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
        if ($PSBoundParameters.ContainsKey('Holdtimetxmult')) { $body['holdtimetxmult'] = $true }
        if ($PSBoundParameters.ContainsKey('Mode')) { $body['mode'] = $true }
        if ($PSBoundParameters.ContainsKey('Timer')) { $body['timer'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('lldpparam', 'Clear lldpparam properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lldpparam -Action unset -Payload @{ lldpparam = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLldpparam

# region Invoke-NSUpdateLldpparam
function Invoke-NSUpdateLldpparam {
    <#
    .SYNOPSIS
        Updates a NetScaler lldpparam resource.
    .DESCRIPTION
        Configuration for lldp params resource.
    .PARAMETER Holdtimetxmult
        A multiplier for calculating the duration for which the receiving device stores the LLDP information in its database before discarding or removing it. The duration is calculated as the holdtimeTxMult (Holdtime Multiplier) parameter value multiplied by the timer (Timer) parameter value. Default value: 4 Minimum value = 1 Maximum value = 20
    .PARAMETER Mode
        Global mode of Link Layer Discovery Protocol (LLDP) on the Citrix ADC. The resultant LLDP mode of an interface depends on the LLDP mode configured at the global and the interface levels. Possible values = NONE, TRANSMITTER, RECEIVER, TRANSCEIVER
    .PARAMETER Timer
        Interval, in seconds, between LLDP packet data units (LLDPDUs). that the Citrix ADC sends to a directly connected device. Default value: 30 Minimum value = 1 Maximum value = 3000
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
        Invoke-NSUpdateLldpparam  -PassThru
    .EXAMPLE
        Invoke-NSUpdateLldpparam  -WhatIf
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
        [int] $Holdtimetxmult,

        [Parameter()]
        [ValidateSet('NONE', 'TRANSMITTER', 'RECEIVER', 'TRANSCEIVER')]
        [string] $Mode,

        [Parameter()]
        [int] $Timer,

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
    if ($PSBoundParameters.ContainsKey('Holdtimetxmult')) { $properties['holdtimetxmult'] = $Holdtimetxmult }
    if ($PSBoundParameters.ContainsKey('Mode')) { $properties['mode'] = $Mode }
    if ($PSBoundParameters.ContainsKey('Timer')) { $properties['timer'] = $Timer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('lldpparam', 'Update lldpparam')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lldpparam -Payload @{ lldpparam = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateLldpparam

# SIG # Begin signature block
# MII6AQYJKoZIhvcNAQcCoII58jCCOe4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCq09qjSVpbvGET
# dQjdsyMmovpTAYLzu70DH2lV8ONiYKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcxMIIXLQIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAC6sK
# 3qy4Pjp7JEIAAAALqwowDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQglIXj
# yyH7+GFnUg0ZO62UN7gaSv52+GLmjAOd1HuHWuswDQYJKoZIhvcNAQEBBQAEggGA
# oNCLMCQX1b1EA/d+rkO45tBscJjOI0M36rZIiDTthKNdM/bnYAm8A4gXn7GPPs4W
# Fz5+LinHxMYtpyrfoyXmmHkfbqWf3pcsf2JMB901hGPG/A4CE4T07l54ugX0J+Cu
# 4hlAbIIP+XCcvVuK71newrasY9X7rFxe6dfiM4dW763nhMV1sPBsJTv/LG/E8Ua5
# J8hAkbb8oWJQ24tnqnj4HqNRvqsTsjcQKwGK1GEsU+OwZkCGZ0CtP1fzWys1CiLh
# GS+rlL59cM37yr6Aqk5PZ+UmMnUtb+rxfTtxoDr76wBQqyC5Nl9Ts8Y6/JzCqhZD
# DIIR3r0r64Ol/+M34LaNk0zPmnSdg3/3gNJZbgtqUfGirWJz90ctDPib1V/RgtFh
# PxSIJu1CbLDs/+FEMoIhhrrywmtGtZ92JoDqL1Epc8zPOsZ8I18ozzA7C/Iu+2e+
# kestCyStaWPAM7OfYPlrFpRTwf+4dGrrHoZ42eFKJrXfrVVjYMIQeGSUjH6W58Jr
# oYIUsTCCFK0GCisGAQQBgjcDAwExghSdMIIUmQYJKoZIhvcNAQcCoIIUijCCFIYC
# AQMxDzANBglghkgBZQMEAgEFADCCAWkGCyqGSIb3DQEJEAEEoIIBWASCAVQwggFQ
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIDsp9M2nr1BcbdeiPywv
# wI3JTD+3qjRl0jnxf8s55Iw+AgZqwGEGFF4YEjIwMjYxMTEwMTAyMjUxLjk3WjAE
# gAIB9KCB6aSB5jCB4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVk
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NDkxQS0wNUUwLUQ5NDcxNTAzBgNV
# BAMTLE1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5
# oIIPKTCCB4IwggVqoAMCAQICEzMAAAAF5c8P/2YuyYcAAAAAAAUwDQYJKoZIhvcN
# AQEMBQAwdzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjFIMEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBS
# b290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIwMTExOTIwMzIzMVoX
# DTM1MTExOTIwNDIzMVowYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGlt
# ZXN0YW1waW5nIENBIDIwMjAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQCefOdSY/3gxZ8FfWO1BiKjHB7X55cz0RMFvWVGR3eRwV1wb3+yq0OXDEqhUhxq
# oNv6iYWKjkMcLhEFxvJAeNcLAyT+XdM5i2CgGPGcb95WJLiw7HzLiBKrxmDj1EQB
# /mG5eEiRBEp7dDGzxKCnTYocDOcRr9KxqHydajmEkzXHOeRGwU+7qt8Md5l4bVZr
# XAhK+WSk5CihNQsWbzT1nRliVDwunuLkX1hyIWXIArCfrKM3+RHh+Sq5RZ8aYyik
# 2r8HxT+l2hmRllBvE2Wok6IEaAJanHr24qoqFM9WLeBUSudz+qL51HwDYyIDPSQ3
# SeHtKog0ZubDk4hELQSxnfVYXdTGncaBnB60QrEuazvcob9n4yR65pUNBCF5qeA4
# QwYnilBkfnmeAjRN3LVuLr0g0FXkqfYdUmj1fFFhH8k8YBozrEaXnsSL3kdTD01X
# +4LfIWOuFzTzuoslBrBILfHNj8RfOxPgjuwNvE6YzauXi4orp4Sm6tF245DaFOSY
# bWFK5ZgG6cUY2/bUq3g3bQAqZt65KcaewEJ3ZyNEobv35Nf6xN6FrA6jF9447+NH
# vCjeWLCQZ3M8lgeCcnnhTFtyQX3XgCoc6IRXvFOcPVrr3D9RPHCMS6Ckg8wggTrt
# IVnY8yjbvGOUsAdZbeXUIQAWMs0d3cRDv09SvwVRd61evQIDAQABo4ICGzCCAhcw
# DgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRraSg6
# NS9IY0DPe9ivSek+2T3bITBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEFBQcC
# ARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRv
# cnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1
# AGIAQwBBMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUyH7SaoUqG8oZmAQH
# J89QEE9oqKIwgYQGA1UdHwR9MHsweaB3oHWGc2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0
# aW9uJTIwUm9vdCUyMENlcnRpZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcmww
# gZQGCCsGAQUFBwEBBIGHMIGEMIGBBggrBgEFBQcwAoZ1aHR0cDovL3d3dy5taWNy
# b3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZl
# cmlmaWNhdGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIw
# MjAuY3J0MA0GCSqGSIb3DQEBDAUAA4ICAQBfiHbHfm21WhV150x4aPpO4dhEmSUV
# pbixNDmv6TvuIHv1xIs174bNGO/ilWMm+Jx5boAXrJxagRhHQtiFprSjMktTliL4
# sKZyt2i+SXncM23gRezzsoOiBhv14YSd1Klnlkzvgs29XNjT+c8hIfPRe9rvVCMP
# iH7zPZcw5nNjthDQ+zD563I1nUJ6y59TbXWsuyUsqw7wXZoGzZwijWT5oc6GvD3H
# DokJY401uhnj3ubBhbkR83RbfMvmzdp3he2bvIUztSOuFzRqrLfEvsPkVHYnvH1w
# tYyrt5vShiKheGpXa2AWpsod4OJyT4/y0dggWi8g/tgbhmQlZqDUf3UqUQsZaLdI
# u/XSjgoZqDjamzCPJtOLi2hBwL+KsCh0Nbwc21f5xvPSwym0Ukr4o5sCcMUcSy6T
# EP7uMV8RX0eH/4JLEpGyae6Ki8JYg5v4fsNGif1OXHJ2IWG+7zyjTDfkmQ1snFOT
# gyEX8qBpefQbF0fx6URrYiarjmBprwP6ZObwtZXJ23jK3Fg/9uqM3j0P01nzVygT
# ppBabzxPAh/hHhhls6kwo3QLJ6No803jUsZcd4JQxiYHHc+Q/wAMcPUnYKv/q2O4
# 44LO1+n6j01z5mggCSlRwD9faBIySAcA9S8h22hIAcRQqIGEjolCK9F6nK9ZyX4l
# hthsGHumaABdWzCCB58wggWHoAMCAQICEzMAAABa9g1njIXt3QgAAAAAAFowDQYJ
# KoZIhvcNAQEMBQAwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjAwHhcNMjYwMTA4MTg1OTAzWhcNMjcwMTA3MTg1OTAzWjCB
# 4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMk
# TWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5u
# U2hpZWxkIFRTUyBFU046NDkxQS0wNUUwLUQ5NDcxNTAzBgNVBAMTLE1pY3Jvc29m
# dCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5MIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEA7/Q7R5aOBRv2ucdxAtF19Y83gf73VrdieVo/
# joTWbi4P4krHpyxYxK1fv1/EslQCocmpBYTX1SU0yFL2MQHfZ0AnjK5awfJS4z52
# mGMPPgTmOXiBgZkSZo6sq8234qqUVrLKD+hODcGUtG7hoGrzrrwDmqUdx+y6HoN1
# KoUgPWLEkVnMetkUbWIYEbtTUGfY40sOjuNvBfmsxw925MBTD9zszdaFLFAG5mlC
# LPxFAYoioIp8jGBCQp3OkKlTRJZA4T8OBNdvPdzXkoxEJ2QaUvbNv6We5JXiyx5C
# bep+VmJlyQvKfbEkjxlcOSr4iD5v+uw88h8jx2Lbbxa8rWPrslenJ5UJpJQ70SvO
# UudOueNCR5dVAinvfG5UFWua+hN/+/hrsyeua4pLIhdzm8lQcQYHfjn47yiYW3XD
# xv5eD0P08ohGoM8S/sdGTQL5i/G7wW8cm9KhxIhkr6/8WYoU6Kliek/vrICYk2fK
# F65xKE6CTxCJTndRKf/4DIxvvFb3TmBmfI2pvb0d5V1DXvmkMckYTPwLHnCId5WW
# IbPmEAG5wUPKVH3PctJOYHr7dm4jF4b0FlLjo/oA0+S5W4PmbzCBzsYsvODvcKwM
# XT26S3xR/x1NwwFfeuj7v+T0zpe3xY8bsgv2//gO/IxjTe2Rv1j1GLodZq9dE9hE
# JR4+yk8CAwEAAaOCAcswggHHMB0GA1UdDgQWBBSOY7JDq3Axw/VltHK0nEjh+deZ
# wjAfBgNVHSMEGDAWgBRraSg6NS9IY0DPe9ivSek+2T3bITBsBgNVHR8EZTBjMGGg
# X6BdhltodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3Nv
# ZnQlMjBQdWJsaWMlMjBSU0ElMjBUaW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3Js
# MHkGCCsGAQUFBwEBBG0wazBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBQdWJsaWMlMjBSU0ElMjBU
# aW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0l
# AQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMGYGA1UdIARfMF0wUQYM
# KwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTAIBgZngQwBBAIwDQYJKoZI
# hvcNAQEMBQADggIBAICUzyv63eEhvaHWUNMDH6JiRCXEW5TtA417IgUgFnb3G8aX
# yl6ErESsPMieI6khf96W5QDBAqhojTPC4oB1HSatIdcKeIygs2Sjlb7mvuxc1qYp
# ftAxXcF8Y5feCL2pV/HJR7sAddupDwoFAc1gKc0W1BAeABGuViG3IAqiXly0zQIB
# z/LehjttMyxUm+cDm7sNVY95ehJPYoQwN4sG8lirQglnrIykM5YtnhQ/zZuSzJKE
# gH9d1rCKsgYt2x652vJHFUyTfXeYByMZFvn34i223qi1W9hBaof48atNTMRx7Pxp
# C47e6ag1mMq4WhflWw8/+BJmx76iuEbfN9mT0gPITcN9QWuG+S/ofS2KMrUPS4ga
# HAwFZKb2S1Dqh5T5q6tkXHcwj4s4OcextEVkDLXW4y/Aqr5k0LVJ7i0gzW72mJYC
# GdM+iHqZQsqKQc5WEdo73ne2TMMK2Oyx7kZQo7H3KD2eocpYyCc4Onrb+48/ML/I
# MQhKtcJxTtQHu0BOvfNY0R20zh3TT2JdYjp1X9J1wghfjiumgvIIvD6dePGn59j9
# 3KAs7tR1JBpVpQVWPcradXK66M+ym3ku6dzkW+5g+qaL/PyQBKabBuIX5bQ/RRNY
# VoLzgxZ9TaHowODmzSjGZ00UrvqNevfBl91KhXsUIp+rkZ14ajLlTANDAwLQMYID
# 1DCCA9ACAQEweDBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3Rh
# bXBpbmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjANBglghkgBZQMEAgEF
# AKCCAS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEi
# BCDcnAdDe+PXuKxOPoz3lplbWQIzEGDR/Yfp/IiL95NtRTCB3QYLKoZIhvcNAQkQ
# Ai8xgc0wgcowgccwgaAEIGK5ZECL6n3o9GwG3dPBbeM2jOA9BL5ByjUJWb81pTRD
# MHwwZaRjMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVzdGFtcGlu
# ZyBDQSAyMDIwAhMzAAAAWvYNZ4yF7d0IAAAAAABaMCIEIBOQMTTPX6gVVHr8h7cC
# B15rpXqLKO4vlfwi4QWHy2ScMA0GCSqGSIb3DQEBCwUABIICAL6lVnM//5iH5OWd
# byFBgzsdph1uVNSdzF+RHIwWgqnNAz4URDXtY8NGhiyUzrq29dMbStU8mKcl/db+
# biBK/Hfi/vln+D96+zY1r3BJ2Q2vtroUlP6vKpLG1LNMFzuIM5MjXJhQyuV7gh4s
# XqkoWksIb9QxOCpNgfDtqGb0EbopTE3f8IPtDbW8rbV5XOARLMbtFnEi5Tu17j2S
# y+A7lXw22qQGQONRgtlvOcbQy4cvhAdWkRMxTxTYoENhfrhtY/qS4DWrFOiw2StR
# ImgyorxhezdMoNiQHESuZ1K2Ip6Qu6h2cx+vDVStC68UAhhXPTTW+Xj5kwmroQZp
# uYEkQL/gM5woPYUCaRkPr3UdjzUroGsGGMhr1QxY5e0kuM1ygfpN17ofeKBFKB8E
# tIkAjq43mNto+CXKexpZonWo3oZc7zY/TvMYoubHKNwQ4UUCJ4xSL+xZ1Fff7iwY
# eqtIGy7PnegYlYsmSLwesS0fd36awCuT5NKJdBisD0s0MlK7wcMz9prytm1uUMgX
# GQpg7QMWYKh46Y7HWDB3PnF2fznCFkoJVS5jaL6MMYlMlUrBBLA4480yb3Yt1B6z
# iDESfhgES+sGibd+CHdmuJn6gpWONioCmVfiAP8Qw2ZF/DLgtVf9mWLE1CcKPNi9
# SAahMCGi1A8xVkZlw30wq3X/KNlh
# SIG # End signature block
