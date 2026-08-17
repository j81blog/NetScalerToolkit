function Invoke-NSRestMethod {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [hashtable] $Request,

        [Parameter()]
        [switch] $SkipCertificateCheck
    )

    function ConvertTo-NSRestResponse {
        param(
            [Parameter()]
            [object] $WebResponse,

            [Parameter()]
            [string] $RawContent,

            [Parameter()]
            [hashtable] $Request,

            [Parameter(Mandatory)]
            [datetime] $StartedAt,

            [Parameter(Mandatory)]
            [datetime] $EndedAt
        )

        # NITRO returns JSON for normal responses, but transport errors can return plain text.
        $body = $null
        if ($RawContent) {
            try {
                $body = $RawContent | ConvertFrom-Json
            } catch {
                $body = $RawContent
            }
        }

        $statusCode = $null
        $statusDescription = $null
        $headers = @{}

        if ($WebResponse) {
            if ($WebResponse.PSObject.Properties.Name -contains 'StatusCode') {
                $statusCode = [int] $WebResponse.StatusCode
            }

            if ($WebResponse.PSObject.Properties.Name -contains 'StatusDescription') {
                $statusDescription = $WebResponse.StatusDescription
            }

            if ($WebResponse.PSObject.Properties.Name -contains 'Headers') {
                foreach ($key in $WebResponse.Headers.Keys) {
                    $headers[$key] = $WebResponse.Headers[$key]
                }
            }
        }

        $result = [PSCustomObject] @{
            Response = $body
            StatusCode = $statusCode
            StatusDescription = $statusDescription
            Headers = $headers
            Uri = $Request.Uri
            Method = $Request.Method
            RequestHeaders = $Request.Headers
            RequestBody = $Request.Body
            RawContent = $RawContent
            NitroErrorCode = $null
            NitroSeverity = $null
            NitroMessage = $null
            StartedAt = $StartedAt
            EndedAt = $EndedAt
            DurationMs = [math]::Round(($EndedAt - $StartedAt).TotalMilliseconds, 0)
        }

        $result.PSObject.TypeNames.Insert(0, 'NetScalerToolkit.NitroResponse')

        # Promote NITRO payload fields so callers can read resource arrays directly.
        if ($body -and $body -isnot [string]) {
            foreach ($property in $body.PSObject.Properties) {
                if ($result.PSObject.Properties.Name -notcontains $property.Name) {
                    $result | Add-Member -NotePropertyName $property.Name -NotePropertyValue $property.Value
                }
            }

            if ($body.PSObject.Properties.Name -contains 'errorcode') {
                $result.NitroErrorCode = $body.errorcode
            }

            if ($body.PSObject.Properties.Name -contains 'severity') {
                $result.NitroSeverity = $body.severity
            }

            if ($body.PSObject.Properties.Name -contains 'message') {
                $result.NitroMessage = $body.message
            }
        }

        return $result
    }

    function Get-NSRestErrorContent {
        param(
            [Parameter()]
            [object] $ErrorRecord
        )

        if ($ErrorRecord.ErrorDetails -and $ErrorRecord.ErrorDetails.Message) {
            return $ErrorRecord.ErrorDetails.Message
        }

        $response = $ErrorRecord.Exception.Response
        if (-not $response) {
            return $null
        }

        if ($response.PSObject.Properties.Name -contains 'Content') {
            return $response.Content
        }

        # Windows PowerShell can default to older TLS flags; make TLS 1.2 available without removing existing flags.
        try {
            $stream = $response.GetResponseStream()
            if (-not $stream) {
                return $null
            }

            $reader = [System.IO.StreamReader]::new($stream)
            try {
                return $reader.ReadToEnd()
            } finally {
                $reader.Dispose()
            }
        } catch {
            return $null
        }
    }

    $originalCertificateCallback = $null
    $certificateCallbackChanged = $false
    $startedAt = Get-Date
    $invokeRequest = $Request.Clone()
    $previousProgressPreference = $ProgressPreference

    try {
        $ProgressPreference = 'SilentlyContinue'
        try {
            $currentProtocolValue = [int] [System.Net.ServicePointManager]::SecurityProtocol
            $tls12ProtocolValue = [int] [System.Net.SecurityProtocolType]::Tls12
            if (($currentProtocolValue -band $tls12ProtocolValue) -ne $tls12ProtocolValue) {
                [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
            }
        } catch {
            Write-Verbose ('Unable to adjust .NET security protocol defaults: {0}' -f $_.Exception.Message)
        }

        if ($SkipCertificateCheck) {
            $invokeWebRequestCommand = Get-Command -Name Invoke-WebRequest -ErrorAction Stop
            if ($invokeWebRequestCommand.Parameters.ContainsKey('SkipCertificateCheck')) {
                $invokeRequest.SkipCertificateCheck = $true
            } else {
                $originalCertificateCallback = [System.Net.ServicePointManager]::ServerCertificateValidationCallback
                if (-not ([System.Management.Automation.PSTypeName] 'NetScalerToolkitCertificateValidation').Type) {
                    # PS 5.1 cannot safely use a scriptblock callback from the .NET TLS worker thread.
                    Add-Type -TypeDefinition @'
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

public static class NetScalerToolkitCertificateValidation
{
    public static bool TrustAll(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
    {
        return true;
    }
}
'@
                }
                $trustAllCallback = [System.Delegate]::CreateDelegate(
                    [System.Net.Security.RemoteCertificateValidationCallback],
                    [NetScalerToolkitCertificateValidation].GetMethod('TrustAll')
                )
                [System.Net.ServicePointManager]::ServerCertificateValidationCallback = $trustAllCallback
                $certificateCallbackChanged = $true
            }
        }

        $invokeWebRequestCommand = Get-Command -Name Invoke-WebRequest -ErrorAction Stop
        if ($invokeWebRequestCommand.Parameters.ContainsKey('UseBasicParsing')) {
            $invokeRequest.UseBasicParsing = $true
        }
        if ($invokeWebRequestCommand.Parameters.ContainsKey('DisableKeepAlive')) {
            $invokeRequest.DisableKeepAlive = $true
        }

        Write-Verbose ('NITRO HTTP request: {0} {1}' -f $invokeRequest.Method, $invokeRequest.Uri)
        $webResponse = Invoke-WebRequest @invokeRequest
        $endedAt = Get-Date
        Write-Verbose ('NITRO HTTP response: {0} {1} in {2} ms' -f $invokeRequest.Method, $invokeRequest.Uri, [math]::Round(($endedAt - $startedAt).TotalMilliseconds, 0))
        return ConvertTo-NSRestResponse -WebResponse $webResponse -RawContent $webResponse.Content -Request $Request -StartedAt $startedAt -EndedAt $endedAt
    } catch {
        $endedAt = Get-Date
        if ($_.Exception.Response) {
            $content = Get-NSRestErrorContent -ErrorRecord $_
            return ConvertTo-NSRestResponse -WebResponse $_.Exception.Response -RawContent $content -Request $Request -StartedAt $startedAt -EndedAt $endedAt
        }

        Write-Verbose ('NITRO HTTP request failed without response: {0} {1}. {2}' -f $invokeRequest.Method, $invokeRequest.Uri, $_.Exception.Message)

        # The TLS handshake failure surfaces differently per host, and the default message
        # never mentions the switch that resolves it.
        $message = 'NITRO HTTP request failed for {0} {1}: {2}' -f $invokeRequest.Method, $invokeRequest.Uri, $_.Exception.Message
        if (-not $SkipCertificateCheck) {
            $scan = $_.Exception
            while ($scan) {
                if ($scan -is [System.Security.Authentication.AuthenticationException] -or
                    ($scan -is [System.Net.WebException] -and $scan.Status -eq [System.Net.WebExceptionStatus]::TrustFailure) -or
                    $scan.Message -match 'SSL connection could not be established|trust relationship for the SSL/TLS secure channel|remote certificate is invalid') {
                    $message += ' The appliance TLS certificate was not accepted. NetScaler management certificates are self-signed by default, so add -SkipCertificateCheck to connect anyway, or install a trusted certificate on the appliance.'
                    break
                }
                $scan = $scan.InnerException
            }
        }

        $exception = [System.InvalidOperationException]::new($message, $_.Exception)
        $errorRecord = [System.Management.Automation.ErrorRecord]::new(
            $exception,
            'NetScalerNitroHttpRequestFailed',
            [System.Management.Automation.ErrorCategory]::ConnectionError,
            $invokeRequest.Uri
        )
        throw $errorRecord
    } finally {
        $ProgressPreference = $previousProgressPreference
        if ($certificateCallbackChanged) {
            [System.Net.ServicePointManager]::ServerCertificateValidationCallback = $originalCertificateCallback
        }
    }
}

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCp1LdFWz1Nrh69
# LMvbDz0C+/mNvq90Tj7vhx6t+BXm1KCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgm1Wg
# EeQ+2JbmH8A0UQ9vYvUFXDIFAeq9p1+OMJw7j9owDQYJKoZIhvcNAQEBBQAEggGA
# PHr6Mijs5f2uMPguzoLttwH5Pe4Sn7U6MaP+fM/ly1Gz/ZGptfNsix7VHeir+wzn
# kgGqxFSKvtcw1lU08GTHGvP6B7ChLznEr0yEE1lF3BQro9y68gcanPMs4c7yosXz
# mqQxctECCKZcO0y9biBZiyLVj+NW5CkyIZJyy1kFd8NsfRWzKbp6K3Qh1dPSzIj0
# R4O0OZGH9VKy7+iJzpJUUgeSXjTbO7tn/G94Xh/8BT3B4VVlWYYoMFL+kvh+wEl8
# k4SFx54esB8H5sokY6Cq4k3yQtRu1NFvP/jFzsMMlIEH0sUXJEhB4IJ+jcHhW/Vz
# hQsG79R+6TAvDirS4p9PBZjf+WMEFoiGKsKW4YbmSAIatEwKEj/4Ai2GJbKHzlkg
# wlf9+en4q4E1iQODpS6llfTaLTso/jLeOkDoRe4Ibn1NJbpYPksdGPxdfU13fL96
# s7TeUXRM5in9ZmWAzPd1mFjx1mka15wqy+Gjkg4Z2JG1Cq/X3DRbFCZpU8Hy+rWB
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIDobD7SErth0/BiXmYHy
# tAQa+84xWZrvuyBUjh4uWGRhAgZqdgndGEIYEzIwMjYwODE0MDk1MzI3LjU1NFow
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
# IgQgTEGzYt3pRbMpVJBtG0QEuQtzrwlYbtIvpTzdxLuYNgQwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCC7ENQ0O2gJxd9mnuRn
# r2wSkXSff+cbnyU0pX1fZJLu8jANBgkqhkiG9w0BAQsFAASCAgBvnizMoyOB6/eS
# y49yVG1aeOyR2xLkao7kw+KkzS2XZCbG0+pmZ4AkTQuB1knWBQ4B1Vt+ck2wi06p
# Kd92X5Fyuit8Smnc6h7XWm9uzHuxBissCgPgWvamyi1TgVVwjz4pO8ibOXqbL5XZ
# N1Idfxb20bgT+uLWJ6VyYF3si0aGeyB6KCE0BkQT/vtfssrPxIAMO2YPIBQPLNA3
# r3eZQvtMS3FBQy7mIM4zMen/LNa/YLplvIJh41ZJj7U/TcKPBh2Oyqt4GpUUaese
# idsSiI93TeTUjhvIRma+Y6mFfcoU3hjG6drfqqH+dEfR+nNowvUAvgU9F+8C36Ik
# vKCYJg5nw58k6pSJEVbaNbAeEjDuKw/V4JnGpx4Hg6aDhxRgQg11M2nuU40RW+xR
# 9rH6b4TZ+OOL2KLlLsbTvB5RjJKa5LHE3PSbFeosd6wjCE9os9Lvl7SC94Ft/8oL
# WXTvCv5mfSU1sSzcbT5OQHVRP6EnMhnArOpCfSZ4ZbweFSa8bzWm3uCfeJ8r2CCG
# /qC4VmEmIEZrYTvyPguRWI3AZkR6dn37kUZlgkZvify3IocBjJzcghwK/FUUgiB6
# tOW8Gc/eFnIdvEGi8EvHwIHtgxOl4bTyvNOKASfTHtTNrJ+H0cLCfUPPPlOLlafH
# 03XDEuA0hFHzLjnt0U0M4plhGSlpPQ==
# SIG # End signature block
