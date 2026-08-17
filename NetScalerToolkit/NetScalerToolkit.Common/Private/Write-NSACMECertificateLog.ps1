function Write-NSACMECertificateLog {
<#
    .SYNOPSIS
        Writes a request-certificate log entry.

    .DESCRIPTION
        Writes a timestamped support log entry to the configured script log file and,
        unless disabled, mirrors the message to the PowerShell information, warning,
        or error stream.

    .PARAMETER Level
        Severity level for the log entry.

    .PARAMETER Component
        Component name used in the log entry.

    .PARAMETER Message
        Message text to write.

    .NOTES
        Function  : Write-NSACMECertificateLog
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.0525.2137
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Error', 'Warning', 'Info', 'Debug')]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Component,

        [Parameter(Mandatory)]
        [string]$Message,

        [System.Collections.IDictionary]$Data,

        [string[]]$ConsoleDataKeys,

        [switch]$NoConsoleData
    )

    $rank = @{ Error = 0; Warning = 1; Info = 2; Debug = 3; None = -1 }
    $logLevel = if ($script:NSACMECertificateLogLevel) { $script:NSACMECertificateLogLevel } else { 'Info' }
    $logType = if ($script:NSACMECertificateLogType) { $script:NSACMECertificateLogType } else { 'txt' }
    $safeMessage = ConvertTo-NSACMECertificateSafeText -InputObject $Message

    if ($rank[$logLevel] -ge $rank[$Level]) {
        $timestamp = Get-Date
        # Data values are sanitized separately so structured logs stay safe for support bundles.
        $safeData = [ordered]@{}
        if ($Data) {
            foreach ($key in $Data.Keys) {
                $safeData[$key] = ConvertTo-NSACMECertificateSafeText -InputObject $Data[$key]
            }
        }
        if ($script:NSACMECertificateLogFile) {
            if ($logType -eq 'jsonl') {
                $line = [PSCustomObject]@{
                    timestamp = $timestamp.ToString('o')
                    level = $Level
                    component = $Component
                    message = $safeMessage
                    data = $safeData
                } | ConvertTo-Json -Compress -Depth 8
            } else {
                $dataText = if ($safeData.Count -gt 0) {
                    ' | ' + (($safeData.Keys | ForEach-Object { '{0}={1}' -f $_, $safeData[$_] }) -join '; ')
                } else {
                    ''
                }
                $line = '{0}{1}{2}{1}{3}{1}{4}{5}' -f $timestamp.ToString('yyyy-MM-dd HH:mm:ss:ffff'), "`t", $Level.Substring(0, 1).ToUpperInvariant(), $Component, $safeMessage, $dataText
            }
            try {
                # -WhatIf:$false so a WhatIf run still produces the log describing what it would do.
                Add-Content -LiteralPath $script:NSACMECertificateLogFile -Value $line -Encoding UTF8 -ErrorAction Stop -WhatIf:$false
            } catch {
                # A locked or unwritable log file must not break the run or the console output.
                Write-Verbose "Log write failed: $($_.Exception.Message)"
            }
        }
        if ($script:NSConsoleStatusEnabled) {
            # ConsoleStatus owns the console; this stays a file logger.
            if ($Level -eq 'Warning') {
                # ACME problem fields are what diagnose a validation failure.
                $noteText = "$Component`: $safeMessage"
                if (-not $NoConsoleData -and $safeData.Count -gt 0) {
                    $displayKeys = if ($ConsoleDataKeys) { $ConsoleDataKeys } else { @($safeData.Keys) }
                    $pairs = @()
                    foreach ($key in $displayKeys) {
                        if (-not $safeData.Contains($key)) { continue }
                        if ($null -eq $safeData[$key] -or [string]::IsNullOrWhiteSpace([string]$safeData[$key])) { continue }
                        $pairs += '{0}={1}' -f $key, $safeData[$key]
                    }
                    if ($pairs.Count -gt 0) { $noteText += ' [{0}]' -f ($pairs -join '; ') }
                }

                # No open item means nothing to attach the note to.
                if ((ConsoleStatus\Get-ConsoleStatusState).ItemOpen) {
                    ConsoleStatus\Set-ConsoleStepNote -Text $noteText -Append
                    $script:NSStatusItemHadWarning = $true
                } else {
                    Write-Warning $noteText
                }
            }
        } elseif (-not $script:NSACMECertificateNoConsoleOutput) {
            $label = switch ($Level) {
                'Error' { 'ERROR' }
                'Warning' { 'WARN' }
                'Debug' { 'DEBUG' }
                default {
                    if ($Component -in @('Result', 'Deploy')) { 'OK' }
                    else { 'INFO' }
                }
            }
            $color = switch ($Level) {
                'Error' { 'Red' }
                'Warning' { 'Yellow' }
                'Debug' { 'DarkGray' }
                default {
                    if ($Component -in @('Result', 'Deploy')) { 'Green' }
                    elseif ($Component -in @('NetScaler', 'NetScalerDNS')) { 'Cyan' }
                    else { 'Gray' }
                }
            }
            $componentText = if ($Component.Length -gt 18) { $Component.Substring(0, 18) } else { $Component }
            $messageColor = if ($Level -eq 'Debug') { 'DarkGray' } elseif ($Level -eq 'Warning') { 'Yellow' } elseif ($Level -eq 'Error') { 'Red' } else { 'White' }

            Write-Host ('{0,-7}' -f $label) -ForegroundColor $color -NoNewline
            Write-Host ('{0,-20}' -f $componentText) -ForegroundColor DarkGray -NoNewline
            Write-Host $safeMessage -ForegroundColor $messageColor
            if (-not $NoConsoleData -and $safeData.Count -gt 0 -and ($Level -in @('Error', 'Warning', 'Debug'))) {
                $displayKeys = if ($ConsoleDataKeys) { $ConsoleDataKeys } else { @($safeData.Keys) }
                foreach ($key in $displayKeys) {
                    if (-not $safeData.Contains($key)) { continue }
                    if ($null -eq $safeData[$key] -or [string]::IsNullOrWhiteSpace([string]$safeData[$key])) { continue }
                    Write-Host ('       {0,-22} ' -f $key) -ForegroundColor DarkGray -NoNewline
                    Write-Host $safeData[$key] -ForegroundColor $messageColor
                }
            }
        }
    }
}

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDpSvecbaGVw9Og
# c9bw835OOk0umjUSuuTftwdviBPh1aCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAATfMuDq
# zV60pQpVAAAABN8yMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQwHhcNMjYwODE1MjAxNzA0WhcNMjYwODE4
# MjAxNzA0WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAiZBf/l2RqJyJ+1+4okn6GNfE
# iw/Kq7cMh8aXc5cazPlH2fN8jJzabqNNqBfrLZp3UWIGLvCYAHOpOEu1gavAdrJa
# osXyJophs9z4wR/AKKszZanZ+A5+oofL7D1NwIKsA7X2RMJSlPWBGn9fTPx/4TU+
# LtQaRzg9RoZjJanDSIHPx2PYAQGkw3XsXfiQRpjcvIfRAtSDC4VtD8OZ6/tsmaou
# TDY/ACLgyMTtUthzekFUjHfEnz5yGVWPOKd8Ch62TM2Dg0PEiJbtwtYOH6f22iN2
# telegUdXsvl7MGjbQU4rSQ176ON3/GgAkOe1ZDK7ykdNRVBuHPx8dIlnR6qGyXhb
# ChmI8Tuh2vy3ak3MppLhI+TIn2znPZg/2ysv+ZM2lVJOBmsYPkrJAm6YuJENNN5b
# LbpaEMk94XQvDwwWMV5FzaK+HhmCK7K1xcqB1+kInx433VYUIYGqCLSZiOQJyA0+
# EUK+PLgFfvwjU82iy9j1pfQh54flH1wvwYBAg86vAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# ZFuWNZpkA8KtQxPIXw67POaVNIcwHwYDVR0jBBgwFoAUayVB3vtrfP0YgAotf492
# XapzPbgwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwNC5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDQuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAKno
# dx/TzwuGuRRzvIQ5C0v0LlvWY8T1yEhoLehulqNLVrzfLVU0Lj3O9k3nmXeaj7qF
# Oq/J5aNxssX2bB5NSWLvrlOrkZ7cdVSJ/SyDCn6Wtvt24d21J7Oc3USzyLQlngZ1
# QwtahcowVJE+mE+0/Z4CU3ZLtIA+6C9doK4TovCJfadbBiBI9jxI2UsoD2p0b0Ec
# Nlpyc/rbThZxQc/lQNAQxRsb6I5eWa7DG+JsRxyHA+d8RwhrAJg8avHtDdJNuZ8r
# P7C6d+71Cf6EVG9rh2bsVBkELD/FtC+zdUsNjp1vVFHtHMJhl0UjerXrEmJ23bW2
# FhWI51GRm1aXTwt9rbXxveH/9fx7EaFipgS+hCYF/gFGyUhuJLzY34CdRNXTdTSg
# st2JqFNHLeHlNNV2g704nD+0RX4HaZjumk+60mbRFVyzGITDvjTWRBHJVfoelaxi
# 0xO9zU83xOyVzpi9ECBdqXxdda6blKbMIzaqQv4rx1EPWqhkI1fUNRnXR6vZ56Bc
# lNSnpzevptJmQU7K3RV9A6Ld3qSvTEmjvBOQnjygFrVokSBh+SO9Dc/6GRi3v7CU
# dRQrcFXt8EiMm9dP2ZnWAqe/djm5VtxI6IpDSl8H6Z3cwpdC1ThnZ+uZgxKZcsET
# XgXsf7DcU119x6GbgvQi2TaKVG4kPG3F6BJmerTEMIIGwDCCBKigAwIBAgITMwAE
# 3zLg6s1etKUKVQAAAATfMjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDA0MB4XDTI2MDgxNTIwMTcwNFoXDTI2
# MDgxODIwMTcwNFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAImQX/5dkaiciftfuKJJ
# +hjXxIsPyqu3DIfGl3OXGsz5R9nzfIyc2m6jTagX6y2ad1FiBi7wmABzqThLtYGr
# wHayWqLF8iaKYbPc+MEfwCirM2Wp2fgOfqKHy+w9TcCCrAO19kTCUpT1gRp/X0z8
# f+E1Pi7UGkc4PUaGYyWpw0iBz8dj2AEBpMN17F34kEaY3LyH0QLUgwuFbQ/Dmev7
# bJmqLkw2PwAi4MjE7VLYc3pBVIx3xJ8+chlVjzinfAoetkzNg4NDxIiW7cLWDh+n
# 9tojdrXpXoFHV7L5ezBo20FOK0kNe+jjd/xoAJDntWQyu8pHTUVQbhz8fHSJZ0eq
# hsl4WwoZiPE7odr8t2pNzKaS4SPkyJ9s5z2YP9srL/mTNpVSTgZrGD5KyQJumLiR
# DTTeWy26WhDJPeF0Lw8MFjFeRc2ivh4ZgiuytcXKgdfpCJ8eN91WFCGBqgi0mYjk
# CcgNPhFCvjy4BX78I1PNosvY9aX0IeeH5R9cL8GAQIPOrwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFGRbljWaZAPCrUMTyF8OuzzmlTSHMB8GA1UdIwQYMBaAFGslQd77a3z9GIAK
# LX+Pdl2qcz24MGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDQuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDA0LmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQCp6Hcf088LhrkUc7yEOQtL9C5b1mPE9chIaC3obpajS1a83y1VNC49zvZN55l3
# mo+6hTqvyeWjcbLF9mweTUli765Tq5Ge3HVUif0sgwp+lrb7duHdtSeznN1Es8i0
# JZ4GdUMLWoXKMFSRPphPtP2eAlN2S7SAPugvXaCuE6LwiX2nWwYgSPY8SNlLKA9q
# dG9BHDZacnP6204WcUHP5UDQEMUbG+iOXlmuwxvibEcchwPnfEcIawCYPGrx7Q3S
# TbmfKz+wunfu9Qn+hFRva4dm7FQZBCw/xbQvs3VLDY6db1RR7RzCYZdFI3q16xJi
# dt21thYViOdRkZtWl08Lfa218b3h//X8exGhYqYEvoQmBf4BRslIbiS82N+AnUTV
# 03U0oLLdiahTRy3h5TTVdoO9OJw/tEV+B2mY7ppPutJm0RVcsxiEw7401kQRyVX6
# HpWsYtMTvc1PN8Tslc6YvRAgXal8XXWum5SmzCM2qkL+K8dRD1qoZCNX1DUZ10er
# 2eegXJTUp6c3r6bSZkFOyt0VfQOi3d6kr0xJo7wTkJ48oBa1aJEgYfkjvQ3P+hkY
# t7+wlHUUK3BV7fBIjJvXT9mZ1gKnv3Y5uVbcSOiKQ0pfB+md3MKXQtU4Z2frmYMS
# mXLBE14F7H+w3FNdfcehm4L0Itk2ilRuJDxtxegSZnq0xDCCBygwggUQoAMCAQIC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABN8y
# 4OrNXrSlClUAAAAE3zIwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQg4smr
# hvFeZBvBgT9w5b2PYf6FZaU0pHAXkUnW1618BFkwDQYJKoZIhvcNAQEBBQAEggGA
# M3S7WclUJ0My1V7AlWFlYb/ezR/0i4pzFqJZgR6Q5N/zRsWvFdTWzYk53HllgnkA
# Hp2xVoGi14wd2XjCClw18rmq8sLbKP5YC9qBUknodxHecESgeFiJVv3NoIBjPMM6
# kEyxYkghw9oBUyxLdQ0K/7rr3Wxr+z9aBub7gfSMnP25QaVhYqqjYU2aM+vmB2PV
# La7g0WaskmfXT3SWdMRBJScCx2gmGe4X74X3+ByYwTKSfn3b6EISg7E7PAebQD3R
# uuWg0aI1J3TBE7nP8fMwrvdsu71fAvK/U11Y5+Wgkj87uWktYYmK8UnlN4S6BmlY
# rYSZfp34S/M/FH6W41AmfG1Kyr++c8SsmX1vkboNb+U5vtSnpUaXYiAXNcZxpDV/
# RaFW2k55xio+J+7pRnDhODJ96t81urBzZMJGc+jAUMwXP3gSM2QCJnRdoZTiB2pl
# W9ZjMUuKYI1QA9egrH+V0v6B7UDpA0xnBpQjk5SXV3RpS4DZJsXcpMBxQ5nKAj1x
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIMEYGWzqbuXrTRFI1ewC
# I3wwHx9i6J4L6REqU8nR5799AgZqdgnjSKoYEzIwMjYwODE3MTg0MTE5LjIxMVow
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
# IgQgOFwB+Vd+16lg15SidGlvqvbyEgZhmV+AxZF3ukx0cwEwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCCQX6GfSHmOiTap4MtQ
# neH6t7lefP/r7znW5xwCkWCvKzANBgkqhkiG9w0BAQsFAASCAgAZuOlNxslak9Q/
# X6WIMTSeMkSCRmT+E+V3t2/yQrBbdQweRJ0xU/U/lGbKE3+hc7S6W3e3BMdWilK2
# UsCkIMrgdi8ODiVU8NSGA2RvcIs4Q9D2kVUNkx3WXfEi6E/K0gdfFtzQmn7bQPBq
# bcUZ87GSKsX1rVsqhZwjzJt9I+FIyiLqaZRizTHOZUHHpGTtxD6p9dWj+TyPoAJ6
# bk8neunrXq/nt7DRvMo6tXMLBF5Jyi4hXnJyph5HJk4/29nygMenibBWMb4CwU8t
# 5D7x2ja16T4Spl+wfQLVVkFJa0c9itXNrlWGMejAcDq0lx2lXH2rgF1KhdiwF5yF
# Kelz3iYs5RcfsWjvpUttNGgDxhp1vqX1qY0BgEx809lXJO7bOLPzYEY5WNCZ/bxo
# Amv4Af+t3mHi8p91eUk3vOVOuPWsnbJIVVdzACLpI1lj5GaMVIk1/ua1VN3eQTKH
# 4mgqhoz1VS0az27W7RkXccgCGjJPx55GjM4KSYEdTJFpMCOtLJW4Dlad8AM7BLoW
# iH3UOrErjPIGiFlwcFiY2gStdv4G6dFURlPAcI/9IUXCVocFY0QZ5JSCQ4A4VrRR
# 6sJjmOCRdZxLOF/34WTnxvIqkoO4yHHSif8aebVw/LIuurG9z79gHC3eXkjMh1tG
# UdWe28X1EquoBfTgE+xglbuiAOoMKQ==
# SIG # End signature block
