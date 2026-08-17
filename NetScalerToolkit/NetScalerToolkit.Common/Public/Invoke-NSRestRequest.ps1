function Invoke-NSRestRequest {
    <#
    .SYNOPSIS
        Sends a NITRO REST request through the current NetScaler session.

    .DESCRIPTION
        Low level access to the NetScaler NITRO API for operations the generated
        configuration and statistics functions do not cover. The request target is given
        either as a resource (-Task, -Type and optionally -Resource) or as a full NITRO
        path (-NitroPath).

        Responses are unwrapped to the resource collection by default. Use -RawResponse
        to get the complete NITRO response including the errorcode and message fields.

        Not-found responses can be turned into an empty result or null instead of an
        error, and failed requests can be retried for transient HTTP status codes.

    .PARAMETER Session
        NetScaler session to use. Defaults to the active session from Get-NSSession.

    .PARAMETER Method
        HTTP method: GET, POST, PUT or DELETE. Derived from the operation when omitted.

    .PARAMETER Operation
        NITRO operation such as ADD, UPDATE, DELETE, ENABLE or GET. Determines the method
        and payload shape when those are not given explicitly.

    .PARAMETER NitroPath
        Full NITRO path to call, for example 'nitro/v1/config/lbvserver'. Use this
        instead of Task and Type for endpoints that do not follow the resource layout.

    .PARAMETER Task
        NITRO area to address: 'config' for configuration or 'stat' for statistics.

    .PARAMETER Type
        NITRO resource type, for example lbvserver, sslcertkey or service.

    .PARAMETER Resource
        Name of a specific resource instance. Omit to address the whole collection.

    .PARAMETER Action
        NITRO action appended to the request, for example 'enable' or 'update'.

    .PARAMETER Query
        Hashtable of NITRO query arguments such as filter, args or attrs.

    .PARAMETER Payload
        Hashtable sent as the request body for operations that need one.

    .PARAMETER RawResponse
        Returns the complete NITRO response instead of only the resource collection.

    .PARAMETER Headers
        Additional HTTP headers merged into the request.

    .PARAMETER IgnoreNotFound
        Treats not-found responses as success and returns an empty result.

    .PARAMETER NotFoundErrorCode
        NITRO error codes treated as not-found. Defaults to the common no-such-resource
        codes.

    .PARAMETER ReturnNullOnNotFound
        Returns null instead of an empty collection when the resource is not found.
        Requires IgnoreNotFound.

    .PARAMETER ThrowOnWarning
        Turns NITRO warnings into terminating errors.

    .PARAMETER NitroWarning
        Sets the NITRO warning header to 'yes' or 'no'.

    .PARAMETER NitroOnError
        NITRO behavior when part of a bulk request fails: EXIT, CONTINUE or ROLLBACK.

    .PARAMETER RetryCount
        Number of times a failed request is retried. Default is 0.

    .PARAMETER RetryDelaySeconds
        Seconds to wait between retries. Default is 1.

    .PARAMETER RetryStatusCode
        HTTP status codes that trigger a retry. Defaults to 429 and the 5xx codes that
        usually indicate a busy appliance.

    .PARAMETER RetryUnsafeMethods
        Also retries POST, PUT and DELETE. By default only GET is retried, because
        repeating a write may not be safe.

    .EXAMPLE
        Invoke-NSRestRequest -Task config -Type lbvserver

        Returns all load balancing vServers.

    .EXAMPLE
        Invoke-NSRestRequest -Task config -Type lbvserver -Resource lb_web -IgnoreNotFound

        Returns one vServer, or an empty result when it does not exist.

    .EXAMPLE
        Invoke-NSRestRequest -Task config -Type sslcertkey -Operation ADD -Payload @{ sslcertkey = @{ certkey = 'web-cert'; cert = 'web.cer'; key = 'web.key' } }

        Creates a certkey from files already present on the appliance.

    .EXAMPLE
        Invoke-NSRestRequest -NitroPath 'nitro/v1/config/nsversion' -RawResponse

        Calls an endpoint by path and returns the full NITRO response.

    .LINK
        https://netscalertoolkit.j81.nl/module/reference/common/nsrest-request/workflow/

    .LINK
        https://netscalertoolkit.j81.nl/
    #>
    [CmdletBinding(DefaultParameterSetName = 'ByResource')]
    param(
        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [ValidateSet('GET', 'POST', 'PUT', 'DELETE')]
        [string] $Method,

        [Parameter()]
        [ValidateSet(
            'ADD',
            'APPLY',
            'CHANGE',
            'CHECK',
            'CLEAR',
            'COMPLETE',
            'CONVERT',
            'COUNT',
            'COUNT_FILTERED',
            'CREATE',
            'DELETE',
            'DIFF',
            'DISABLE',
            'ENABLE',
            'EXPIRE',
            'EXPORT',
            'FLUSH',
            'FORCE',
            'GET',
            'GET (ALL)',
            'GET_CLUSTER',
            'GET_FILTERED',
            'IMPORT',
            'INIT',
            'INSTALL',
            'JOIN',
            'KILL',
            'LINK',
            'PING',
            'PING6',
            'REBOOT',
            'RELEASE',
            'RENAME',
            'RENUMBER',
            'RESET',
            'RESTART',
            'RESTORE',
            'SAVE',
            'SEND',
            'SHUTDOWN',
            'SIGN',
            'START',
            'STOP',
            'SWITCH',
            'SYNC',
            'TRACEROUTE',
            'TRACEROUTE6',
            'UNLINK',
            'UNLOCK',
            'UNSET',
            'UNSIGN',
            'UPDATE'
        )]
        [string] $Operation,

        [Parameter(Mandatory, ParameterSetName = 'ByPath')]
        [string] $NitroPath,

        [Parameter(Mandatory, ParameterSetName = 'ByResource')]
        [ValidateSet('config', 'stat')]
        [string] $Task,

        [Parameter(Mandatory, ParameterSetName = 'ByResource')]
        [string] $Type,

        [Parameter(ParameterSetName = 'ByResource')]
        [string] $Resource,

        [Parameter()]
        [string] $Action,

        [Parameter()]
        [hashtable] $Query,

        [Parameter()]
        [hashtable] $Payload,

        [Parameter()]
        [switch] $RawResponse,

        [Parameter()]
        [hashtable] $Headers,

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        # Keep in sync with ConvertFrom-NSNitroResponse. 2626 is the systemuser variant
        # of "does not exist", it does not use 258.
        [int[]] $NotFoundErrorCode = @(258, 344, 373, 538, 1540, 2626, 3441),

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [ValidateSet('yes', 'no')]
        [string] $NitroWarning,

        [Parameter()]
        [ValidateSet('EXIT', 'CONTINUE', 'ROLLBACK')]
        [string] $NitroOnError,

        [Parameter()]
        [ValidateRange(0, 10)]
        [int] $RetryCount = 0,

        [Parameter()]
        [ValidateRange(1, 300)]
        [int] $RetryDelaySeconds = 1,

        [Parameter()]
        [int[]] $RetryStatusCode = @(429, 500, 502, 503, 504),

        [Parameter()]
        [switch] $RetryUnsafeMethods
    )

    if (-not $Session) {
        throw 'No NetScaler session is available. Use Connect-NSNode first or pass -Session.'
    }

    if ($Method -and $Operation) {
        throw 'Specify either -Method for a raw HTTP request or -Operation for a documented NITRO operation, not both.'
    }

    if (-not $Method -and -not $Operation) {
        throw 'Specify either -Method or -Operation.'
    }

    $operationQuery = @{}
    if ($Operation) {
        $operationName = $Operation.ToUpperInvariant()
        $operationAction = $null

        switch ($operationName) {
            { $_ -in @('GET', 'GET (ALL)', 'GET_CLUSTER', 'GET_FILTERED') } {
                $Method = 'GET'
            }
            { $_ -in @('COUNT', 'COUNT_FILTERED') } {
                $Method = 'GET'
                $operationQuery.count = 'yes'
            }
            'ADD' {
                $Method = 'POST'
            }
            'UPDATE' {
                $Method = 'PUT'
            }
            'DELETE' {
                $Method = 'DELETE'
            }
            { $_ -in @('PING', 'PING6') } {
                $Method = 'POST'
            }
            default {
                $Method = 'POST'
                $operationAction = $operationName.ToLowerInvariant()
            }
        }

        if (-not $Action -and $operationAction) {
            $Action = $operationAction
        }
    }

    $isMetadataBootstrapRequest = (
        $PSCmdlet.ParameterSetName -eq 'ByPath' -or
        ($PSCmdlet.ParameterSetName -eq 'ByResource' -and $Task -eq 'config' -and $Type -in @('nsversion', 'login', 'logout'))
    )

    if (-not $isMetadataBootstrapRequest) {
        Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1') | Out-Null
    }

    $requestQuery = @{}
    if ($operationQuery) {
        foreach ($key in $operationQuery.Keys) {
            $requestQuery[$key] = $operationQuery[$key]
        }
    }

    if ($Query) {
        foreach ($key in $Query.Keys) {
            $requestQuery[$key] = $Query[$key]
        }
    }

    if ($Action) {
        $requestQuery.action = $Action
    }

    if ($PSCmdlet.ParameterSetName -eq 'ByResource') {
        $pathParts = @('nitro', $Session.NitroApiVersion, $Task, $Type)
        if ($Resource) {
            $pathParts += [uri]::EscapeDataString($Resource)
        }

        $NitroPath = $pathParts -join '/'
    }

    $uri = Join-NSNitroUri -ManagementUrl $Session.ManagementUrl -NitroPath $NitroPath -Query $requestQuery
    $requestHeaders = @{}
    foreach ($key in $Session.DefaultHeaders.Keys) {
        $requestHeaders[$key] = $Session.DefaultHeaders[$key]
    }

    if ($Session.AuthenticationMode -eq 'NitroHeader') {
        $requestHeaders.'X-NITRO-USER' = $Session.Credential.UserName
        $requestHeaders.'X-NITRO-PASS' = $Session.Credential.GetNetworkCredential().Password
    }

    if ($NitroWarning) {
        $requestHeaders.'X-NITRO-WARNING' = $NitroWarning
    }

    if ($NitroOnError) {
        $requestHeaders.'X-NITRO-ONERROR' = $NitroOnError
    }

    if ($Headers) {
        foreach ($key in $Headers.Keys) {
            $requestHeaders[$key] = $Headers[$key]
        }
    }

    $request = @{
        Uri = $uri
        Method = $Method
        Headers = $requestHeaders
        WebSession = $Session.WebSession
        ErrorAction = 'Stop'
    }

    if ($Payload) {
        $request.Body = ($Payload | ConvertTo-Json -Depth 20 -Compress)
    }

    try {
        $attempt = 0
        do {
            $response = Invoke-NSRestMethod -Request $request -SkipCertificateCheck:$Session.SkipCertificateCheck
            $shouldRetry = (
                $response.PSObject.TypeNames -contains 'NetScalerToolkit.NitroResponse' -and
                $response.StatusCode -in $RetryStatusCode -and
                $attempt -lt $RetryCount -and
                ($RetryUnsafeMethods -or $Method -in @('GET', 'HEAD', 'OPTIONS'))
            )

            if ($shouldRetry) {
                Start-Sleep -Seconds $RetryDelaySeconds
                $attempt++
            }
        } while ($shouldRetry)

        $Session.LastResponse = $response
        return ConvertFrom-NSNitroResponse -Response $response -Type $Type -Uri $uri -RawResponse:$RawResponse -IgnoreNotFound:$IgnoreNotFound -NotFoundErrorCode $NotFoundErrorCode -ReturnNullOnNotFound:$ReturnNullOnNotFound -ThrowOnWarning:$ThrowOnWarning -Task $Task -Resource $Resource -Action $Action
    } catch {
        throw
    }
}

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDNo1jciZayZTrf
# HHM6PydH+Qrf6/w1Ovzn53irxHUbAaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAS405bY
# qvWOnUNsAAAABLjTMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQwHhcNMjYwODEyMjAwNzA0WhcNMjYwODE1
# MjAwNzA0WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAi56FBfwzf5vShzPjNpAFDlIx
# rP+WNwkHmP1Ca70ZVfvy+KP7+SJg61G0oDAs401zvQ84SQ+vpU8/DLCA66MphoTa
# 0lynwbUy7I4gX/Ei+x1PnFa7O+XlkkAkU/S8AS8+MD7SZN258+t0r9dv+6aDiIZi
# se826v+dg7qk2zhWUC77gLaTxYxUUP0aJsCd6ma6Wk073Hlro33++lgZe9wFs/Wv
# jyvOi7hdbvNVoYrbmbumwqx4VXFhqeozGkZipsw7q3TE5zhsiKaNjsnMfoReiVe9
# XcgBV1zpyLB10atYXKnA58jzrJrBf1plp9JFlmRRdyPLddK+QAPDdod74OAuVyui
# zZAgxJEOiXpiwUiiR4wt5LIZWBrnHkBIX3n6avnMoPIUfWAHNoz3JB7tnYUeupQP
# 4KFoKDJjqAnD+gnpEkqT5pKu1sVDU5tOhTppB5OGtULEwUToj3c3Twprl6P48u2x
# BPvHdbRNfZSkEEjqOIUAZRzgTBW2vAdq5TJKQA8jAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# iG7CwBXCUdrbg+i9vMzoTbq78g4wHwYDVR0jBBgwFoAUayVB3vtrfP0YgAotf492
# XapzPbgwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwNC5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDQuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAKjO
# LANEbvVcXnVYrx4NjQmly/9j4fNQvIBC3OxcnOR2ioVCrTfraGPFcVBYr0yl5G/m
# Aj7anDfPVghMcTfMkqbd+WZ0Rt099iOuyZBELH5T4K2lOPT3fHr/jAPTZnF5x0eo
# eftM2dJldo4n1hauwudmLrC9sv6K95lolW+ZNC19L96/xJBvXHjFQKeLs8XiMOBz
# OCOzT2g0TiUut5I6XbwGDy9Jjr7vh8WRruFTLHFN5RD2+svsFQwUihUdOSNY7iBm
# 4FLVVoRGB6JnbueJJkmLDqfjx9h+FjUoVgRVNLXCmUJDe6PZJKpx4WyAlH2eLjtG
# S/xu/R9eXN/fk5YJl3eNhRMQ05j+7XFk8YpJKAkpX24Zitf8LPDZlIiEbl2RSAom
# 23ib878A+MhkT5zvIFAXQglL4ydbkRDow5BNJYk2QNODgVm5KadMH2kQnZHAVNx+
# d72G1Q5OEdGi1A2D+nhWB36P66FFKUlNvZ5zNdDxewSeWnNczGQoOrxykYckymdh
# w/Po58mkeGeyKxd4ofvkurfhVJocrRg3/ytLk+jXLTXUCy5hgXb9cb7eybhSC7Rt
# v83aXsk5ZpSCKnZ6KNRSJXo6u8UWLPrbqR4M4diIHBv6szF4XYynCiV+vqgYn1tf
# R8PWV/zHIz92zHXqyd0dZVF6numJlaJS7dl7/L0jMIIGwDCCBKigAwIBAgITMwAE
# uNOW2Kr1jp1DbAAAAAS40zANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDA0MB4XDTI2MDgxMjIwMDcwNFoXDTI2
# MDgxNTIwMDcwNFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAIuehQX8M3+b0ocz4zaQ
# BQ5SMaz/ljcJB5j9Qmu9GVX78vij+/kiYOtRtKAwLONNc70POEkPr6VPPwywgOuj
# KYaE2tJcp8G1MuyOIF/xIvsdT5xWuzvl5ZJAJFP0vAEvPjA+0mTdufPrdK/Xb/um
# g4iGYrHvNur/nYO6pNs4VlAu+4C2k8WMVFD9GibAnepmulpNO9x5a6N9/vpYGXvc
# BbP1r48rzou4XW7zVaGK25m7psKseFVxYanqMxpGYqbMO6t0xOc4bIimjY7JzH6E
# XolXvV3IAVdc6ciwddGrWFypwOfI86yawX9aZafSRZZkUXcjy3XSvkADw3aHe+Dg
# Llcros2QIMSRDol6YsFIokeMLeSyGVga5x5ASF95+mr5zKDyFH1gBzaM9yQe7Z2F
# HrqUD+ChaCgyY6gJw/oJ6RJKk+aSrtbFQ1ObToU6aQeThrVCxMFE6I93N08Ka5ej
# +PLtsQT7x3W0TX2UpBBI6jiFAGUc4EwVtrwHauUySkAPIwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFIhuwsAVwlHa24PovbzM6E26u/IOMB8GA1UdIwQYMBaAFGslQd77a3z9GIAK
# LX+Pdl2qcz24MGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDQuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDA0LmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQCoziwDRG71XF51WK8eDY0Jpcv/Y+HzULyAQtzsXJzkdoqFQq0362hjxXFQWK9M
# peRv5gI+2pw3z1YITHE3zJKm3flmdEbdPfYjrsmQRCx+U+CtpTj093x6/4wD02Zx
# ecdHqHn7TNnSZXaOJ9YWrsLnZi6wvbL+iveZaJVvmTQtfS/ev8SQb1x4xUCni7PF
# 4jDgczgjs09oNE4lLreSOl28Bg8vSY6+74fFka7hUyxxTeUQ9vrL7BUMFIoVHTkj
# WO4gZuBS1VaERgeiZ27niSZJiw6n48fYfhY1KFYEVTS1wplCQ3uj2SSqceFsgJR9
# ni47Rkv8bv0fXlzf35OWCZd3jYUTENOY/u1xZPGKSSgJKV9uGYrX/Czw2ZSIhG5d
# kUgKJtt4m/O/APjIZE+c7yBQF0IJS+MnW5EQ6MOQTSWJNkDTg4FZuSmnTB9pEJ2R
# wFTcfne9htUOThHRotQNg/p4Vgd+j+uhRSlJTb2eczXQ8XsEnlpzXMxkKDq8cpGH
# JMpnYcPz6OfJpHhnsisXeKH75Lq34VSaHK0YN/8rS5Po1y011AsuYYF2/XG+3sm4
# Ugu0bb/N2l7JOWaUgip2eijUUiV6OrvFFiz626keDOHYiBwb+rMxeF2Mpwolfr6o
# GJ9bX0fD1lf8xyM/dsx16sndHWVRep7piZWiUu3Ze/y9IzCCBygwggUQoAMCAQIC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABLjT
# ltiq9Y6dQ2wAAAAEuNMwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgSAun
# ChvmxuStOKpUG45yiWjrcw/xfgbsBjI4boDcVp0wDQYJKoZIhvcNAQEBBQAEggGA
# O88rXKH6HWRAszoAa/u7Q7IdcDl63Wji/dgddzsOiWkH4cf5G93/jflw87iOY6Y9
# EUSYd33qfa7PY0bPBglYmJDwTj5BzURqpefZp2o/J7PsK1hj1aBplyOT21QonpzC
# 9eNXsdkTLr1wjPExpJEqna+Xa2gIzkHU3K8ESDHW2/F8Ra/000s1CYNx5t3/xkYE
# 7Brh5hKxpvq3DSJ375iXgDM6OFEKGnE43gP7Qo41YKZbLhgjFYBMOSehYnd1hZMA
# qKUts6tow9aJMks4KuYr544cIHfcIHB0C2C8Nrq0pvtIaDZf+1SLSrS9VCHDLGX3
# TAq7P/q5xbeVizTtIfTzEUOD9mxVeOa0WY59IIc7kgDg+B6OE+CU8p6wGnLRo0jx
# PucKwE2+ocUppvYgop6cALK7d7wuN9/+z93ACX0kGXcXmPgypwa89bLivOmQJqs+
# zRYJlOg/ehW/nUCY0DnQP25p+R8Fon4ep8tb00klcWVYqaLRKJbFOiQ95DiG5uD9
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEICBCgVh7P7iSsQDctnQq
# abGF/vbdwR3/1SpskCxPUzx4AgZqNTB9y48YEzIwMjYwODE0MDk1MzI4LjkxMlow
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
# IgQgrHOcpnDAdN9ljeTGaqnVYwLGRzrRqD5sFcXRpxFu0XAwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCBIW8MfdcQ3PYTM1yKk
# zfqv9dgQF08lnEWtVsuIRR7LnzANBgkqhkiG9w0BAQsFAASCAgAU2tbPRVPSMbYf
# lHKetPKjsOYPP0nANXnuV8xgdy4oD2qhx9HAT468+i9D1UBoJ62nuPdFUZv0O92G
# phuF2JVo+4URuzLy9JBVJ97BdFCrVpiMiIoU0I+88gRAUq7RaIQ2ZXMVzZlT7KTo
# Y5nY5zd+CJOXN2YV341u/DCeRfSrrtTlK5VnPDiMwz+OUMwngpR7y3AV/0RgIcq/
# aIhdYhDiW8kHJCB4nzHQ588ikx6bzJ17h7KnTiAmu7MkzyznmSaOEgT4iI22IKaX
# i9n9m538Ib/5rSbvy/1WCnek8Hbcuj1YIKIKH/x3mgYxfAQgXpRy63ZLlHmlHe+a
# lbJR8ut+gAptvYGMm/kvyLQ7+V8ZCbPOj01jonOzrRSgID1YYYA14BbeRWkw7iO+
# C17t1FPkg2dyxIkVy0nDMxMFT+9ozAEUIGzafP2odepjaeLBM7ZvNM0yJrO6GOGz
# 6vXkRLBkDJCCB4dHVFY/7EJ6KNaDq2uCbcO5GdHfqUdqgCt4PVUoHiZkOJTiZyEH
# WZW66gYWQz/ETfhqXRWU9Jym9fuNMF/Wm2hB7aNzfnzZIfkpIVNao8hRv2baDt+E
# uumXcJ7KjabFDrMVTtMqn+luI0ZAajLugSPG2bsXSRZK8VoYNmUpPSeDOoTgyDFK
# bN8V7O7FavSG+br+46jftUgJu6soEw==
# SIG # End signature block
