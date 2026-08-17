function Initialize-NSACMECertificateLog {
<#
    .SYNOPSIS
        Initializes the request-certificate support log.

    .DESCRIPTION
        Creates the log directory, rotates an existing log when it is larger than the
        requested size, and writes a diagnostic header containing runtime and module
        details.

    .PARAMETER Path
        Log file path.

    .PARAMETER MaxSizeMB
        Maximum log size before rotation.

    .NOTES
        Function  : Initialize-NSACMECertificateLog
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.0525.2218
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [ValidateSet('txt', 'jsonl')]
        [string]$LogType = 'txt',

        [int]$MaxSizeMB = 10
    )

    $logDir = Split-Path -Parent $Path
    if ($logDir) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
    if ((Test-Path -LiteralPath $Path) -and ((Get-Item -LiteralPath $Path).Length -gt ($MaxSizeMB * 1MB))) {
        $archive = '{0}.{1:yyyyMMddHHmmss}.old' -f $Path, (Get-Date)
        Move-Item -LiteralPath $Path -Destination $archive -Force
    }

    # Elevation and version metadata make support logs useful without exposing request secrets.
    $isAdmin = $false
    if ($IsWindows -or ('PSEdition' -notin $PSVersionTable.Keys) -or $PSVersionTable.PSEdition -eq 'Desktop') {
        try {
            $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
            $principal = [Security.Principal.WindowsPrincipal]::new($identity)
            $isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        } catch {}
    }

    $moduleVersion = try {
        $module = Get-Module NetScalerToolkit | Sort-Object Version -Descending | Select-Object -First 1
        if (-not $module) {
            $command = Get-Command Request-NSACMECertificate -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($command) { $module = $command.Module }
        }
        if (-not $module) {
            $module = Get-Module NetScalerToolkit -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
        }
        if ($module) { $module.Version }
    } catch { $null }
    # Prefer the loaded module. -ListAvailable reports the highest installed version, which is not
    # necessarily the one this run imported.
    $poshACMEVersion = try {
        $poshACMEModule = Get-Module Posh-ACME | Sort-Object Version -Descending | Select-Object -First 1
        if (-not $poshACMEModule) { $poshACMEModule = Get-Module Posh-ACME -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1 }
        if ($poshACMEModule) { $poshACMEModule.Version }
    } catch { $null }
    $consoleStatusVersion = try { (Get-Module ConsoleStatus | Sort-Object Version -Descending | Select-Object -First 1).Version } catch { $null }
    $os = try { [System.Runtime.InteropServices.RuntimeInformation]::OSDescription } catch { [Environment]::OSVersion.VersionString }
    $languageMode = $ExecutionContext.SessionState.LanguageMode
    $username= [Security.Principal.WindowsIdentity]::GetCurrent().Name

    if ($LogType -eq 'jsonl') {
        $header = [PSCustomObject]@{
            timestamp = (Get-Date).ToString('o')
            level = 'Info'
            component = 'Log'
            message = 'Request-NSACMECertificate started'
            data = [ordered]@{
                PowerShellVersion = [string]$PSVersionTable.PSVersion
                PowerShellEdition = [string]$PSVersionTable.PSEdition
                OS = [string]$os
                UserName = [string]$username
                ProcessElevated = [bool]$isAdmin
                LanguageMode = [string]$languageMode
                PSCulture = [string]$PSCulture
                NetScalerToolkitVersion = [string]$moduleVersion
                PoshACMEVersion = [string]$poshACMEVersion
                ConsoleStatusVersion = [string]$consoleStatusVersion
            }
        }
        Set-Content -LiteralPath $Path -Value ($header | ConvertTo-Json -Compress -Depth 6) -Encoding UTF8
    } else {
        $header = @(
            '================================================================================'
            "Request-NSACMECertificate started: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
            "PowerShell version            : $($PSVersionTable.PSVersion)"
            "PowerShell edition            : $($PSVersionTable.PSEdition)"
            "PowerShell culture            : $PSCulture"
            "OS                            : $os"
            "Process elevated              : $isAdmin"
            "Username                      : $username"
            "NetScalerToolkit version      : $moduleVersion"
            "Posh-ACME version             : $poshACMEVersion"
            "ConsoleStatus version         : $(if ($consoleStatusVersion) { $consoleStatusVersion } else { 'not loaded' })"
            "Language mode                 : $languageMode"
            '================================================================================'
        )
        Set-Content -LiteralPath $Path -Value $header -Encoding UTF8
    }
}

# SIG # Begin signature block
# MII5/gYJKoZIhvcNAQcCoII57zCCOesCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCB9ZhpOH7c2lvF5
# +8OqM6LvXISc8NFaikmR9rjuxc0exaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcuMIIXKgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABN8y
# 4OrNXrSlClUAAAAE3zIwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgFbIu
# 2pefYyhUHQp/ZAi5sVPzJoVsZ91llktrZQgYGskwDQYJKoZIhvcNAQEBBQAEggGA
# asb5myMZlOIJHq+uAdgdl+g0u2P6XBJG3yIr37kFir/arJTT6L65PHPeZTZx3Am3
# FOoy2I3yvkY14zk2m0n4zOW8MDDgGqnMm7lIFm2pX0YMDCLK/tu+APemxmGYj6mp
# YlSO+AwiV99h3rdbi4zQ+5g6pxF+raRd5zDK2FfS+DBiKvcoHMcjVyDd8aRfBgMD
# keNCmhHPwluax7clFAdB4Yo25OZA3u6TquROM60SXrHe4WcixP4tEFWBw6PPRgX0
# hUV6CzqRPceRTaElGWXTFq2GMeE2T4KQENFx3M8XMZMouveqiff4a4NEtHbU+pGz
# ZLR7MWSsvjy5nON9PHhmyNSiwxX/NfmkTRyII0CAJFQE2IHH/EbKHgdsO8wvQtFd
# gyRQEf6d9j/3/Xtf2d9Pk4wsGX4OIceBN0IDh8hbRH1Dc78E7eOHLRPIKQqmV5Yf
# OnBS6usGeGAkYAnfhyUJbDITy/dqtXAiYKXinUC5Zj9TvFDASu3rg7adIL12BwXy
# oYIUrjCCFKoGCisGAQQBgjcDAwExghSaMIIUlgYJKoZIhvcNAQcCoIIUhzCCFIMC
# AQMxDzANBglghkgBZQMEAgEFADCCAWYGCyqGSIb3DQEJEAEEoIIBVQSCAVEwggFN
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIOi1WMzCo1wydWQqxnzk
# ZVyUvK+6gjjrhRK0rfXTsJG+AgZqNTCDcm4YDzIwMjYwODE3MTQyMDE2WjAEgAIB
# 9KCB6aSB5jCB4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEt
# MCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScw
# JQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NDkxQS0wNUUwLUQ5NDcxNTAzBgNVBAMT
# LE1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5oIIP
# KTCCB4IwggVqoAMCAQICEzMAAAAF5c8P/2YuyYcAAAAAAAUwDQYJKoZIhvcNAQEM
# BQAwdzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjFIMEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBSb290
# IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIwMTExOTIwMzIzMVoXDTM1
# MTExOTIwNDIzMVowYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCe
# fOdSY/3gxZ8FfWO1BiKjHB7X55cz0RMFvWVGR3eRwV1wb3+yq0OXDEqhUhxqoNv6
# iYWKjkMcLhEFxvJAeNcLAyT+XdM5i2CgGPGcb95WJLiw7HzLiBKrxmDj1EQB/mG5
# eEiRBEp7dDGzxKCnTYocDOcRr9KxqHydajmEkzXHOeRGwU+7qt8Md5l4bVZrXAhK
# +WSk5CihNQsWbzT1nRliVDwunuLkX1hyIWXIArCfrKM3+RHh+Sq5RZ8aYyik2r8H
# xT+l2hmRllBvE2Wok6IEaAJanHr24qoqFM9WLeBUSudz+qL51HwDYyIDPSQ3SeHt
# Kog0ZubDk4hELQSxnfVYXdTGncaBnB60QrEuazvcob9n4yR65pUNBCF5qeA4QwYn
# ilBkfnmeAjRN3LVuLr0g0FXkqfYdUmj1fFFhH8k8YBozrEaXnsSL3kdTD01X+4Lf
# IWOuFzTzuoslBrBILfHNj8RfOxPgjuwNvE6YzauXi4orp4Sm6tF245DaFOSYbWFK
# 5ZgG6cUY2/bUq3g3bQAqZt65KcaewEJ3ZyNEobv35Nf6xN6FrA6jF9447+NHvCje
# WLCQZ3M8lgeCcnnhTFtyQX3XgCoc6IRXvFOcPVrr3D9RPHCMS6Ckg8wggTrtIVnY
# 8yjbvGOUsAdZbeXUIQAWMs0d3cRDv09SvwVRd61evQIDAQABo4ICGzCCAhcwDgYD
# VR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRraSg6NS9I
# Y0DPe9ivSek+2T3bITBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYz
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnku
# aHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIA
# QwBBMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUyH7SaoUqG8oZmAQHJ89Q
# EE9oqKIwgYQGA1UdHwR9MHsweaB3oHWGc2h0dHA6Ly93d3cubWljcm9zb2Z0LmNv
# bS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0aW9u
# JTIwUm9vdCUyMENlcnRpZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcmwwgZQG
# CCsGAQUFBwEBBIGHMIGEMIGBBggrBgEFBQcwAoZ1aHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZlcmlm
# aWNhdGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIwMjAu
# Y3J0MA0GCSqGSIb3DQEBDAUAA4ICAQBfiHbHfm21WhV150x4aPpO4dhEmSUVpbix
# NDmv6TvuIHv1xIs174bNGO/ilWMm+Jx5boAXrJxagRhHQtiFprSjMktTliL4sKZy
# t2i+SXncM23gRezzsoOiBhv14YSd1Klnlkzvgs29XNjT+c8hIfPRe9rvVCMPiH7z
# PZcw5nNjthDQ+zD563I1nUJ6y59TbXWsuyUsqw7wXZoGzZwijWT5oc6GvD3HDokJ
# Y401uhnj3ubBhbkR83RbfMvmzdp3he2bvIUztSOuFzRqrLfEvsPkVHYnvH1wtYyr
# t5vShiKheGpXa2AWpsod4OJyT4/y0dggWi8g/tgbhmQlZqDUf3UqUQsZaLdIu/XS
# jgoZqDjamzCPJtOLi2hBwL+KsCh0Nbwc21f5xvPSwym0Ukr4o5sCcMUcSy6TEP7u
# MV8RX0eH/4JLEpGyae6Ki8JYg5v4fsNGif1OXHJ2IWG+7zyjTDfkmQ1snFOTgyEX
# 8qBpefQbF0fx6URrYiarjmBprwP6ZObwtZXJ23jK3Fg/9uqM3j0P01nzVygTppBa
# bzxPAh/hHhhls6kwo3QLJ6No803jUsZcd4JQxiYHHc+Q/wAMcPUnYKv/q2O444LO
# 1+n6j01z5mggCSlRwD9faBIySAcA9S8h22hIAcRQqIGEjolCK9F6nK9ZyX4lhths
# GHumaABdWzCCB58wggWHoAMCAQICEzMAAABa9g1njIXt3QgAAAAAAFowDQYJKoZI
# hvcNAQEMBQAwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0YW1w
# aW5nIENBIDIwMjAwHhcNMjYwMTA4MTg1OTAzWhcNMjcwMTA3MTg1OTAzWjCB4zEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWlj
# cm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hp
# ZWxkIFRTUyBFU046NDkxQS0wNUUwLUQ5NDcxNTAzBgNVBAMTLE1pY3Jvc29mdCBQ
# dWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5MIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEA7/Q7R5aOBRv2ucdxAtF19Y83gf73VrdieVo/joTW
# bi4P4krHpyxYxK1fv1/EslQCocmpBYTX1SU0yFL2MQHfZ0AnjK5awfJS4z52mGMP
# PgTmOXiBgZkSZo6sq8234qqUVrLKD+hODcGUtG7hoGrzrrwDmqUdx+y6HoN1KoUg
# PWLEkVnMetkUbWIYEbtTUGfY40sOjuNvBfmsxw925MBTD9zszdaFLFAG5mlCLPxF
# AYoioIp8jGBCQp3OkKlTRJZA4T8OBNdvPdzXkoxEJ2QaUvbNv6We5JXiyx5Cbep+
# VmJlyQvKfbEkjxlcOSr4iD5v+uw88h8jx2Lbbxa8rWPrslenJ5UJpJQ70SvOUudO
# ueNCR5dVAinvfG5UFWua+hN/+/hrsyeua4pLIhdzm8lQcQYHfjn47yiYW3XDxv5e
# D0P08ohGoM8S/sdGTQL5i/G7wW8cm9KhxIhkr6/8WYoU6Kliek/vrICYk2fKF65x
# KE6CTxCJTndRKf/4DIxvvFb3TmBmfI2pvb0d5V1DXvmkMckYTPwLHnCId5WWIbPm
# EAG5wUPKVH3PctJOYHr7dm4jF4b0FlLjo/oA0+S5W4PmbzCBzsYsvODvcKwMXT26
# S3xR/x1NwwFfeuj7v+T0zpe3xY8bsgv2//gO/IxjTe2Rv1j1GLodZq9dE9hEJR4+
# yk8CAwEAAaOCAcswggHHMB0GA1UdDgQWBBSOY7JDq3Axw/VltHK0nEjh+deZwjAf
# BgNVHSMEGDAWgBRraSg6NS9IY0DPe9ivSek+2T3bITBsBgNVHR8EZTBjMGGgX6Bd
# hltodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBQdWJsaWMlMjBSU0ElMjBUaW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3JsMHkG
# CCsGAQUFBwEBBG0wazBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBQdWJsaWMlMjBSU0ElMjBUaW1l
# c3RhbXBpbmclMjBDQSUyMDIwMjAuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/
# BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMGYGA1UdIARfMF0wUQYMKwYB
# BAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNv
# bS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTAIBgZngQwBBAIwDQYJKoZIhvcN
# AQEMBQADggIBAICUzyv63eEhvaHWUNMDH6JiRCXEW5TtA417IgUgFnb3G8aXyl6E
# rESsPMieI6khf96W5QDBAqhojTPC4oB1HSatIdcKeIygs2Sjlb7mvuxc1qYpftAx
# XcF8Y5feCL2pV/HJR7sAddupDwoFAc1gKc0W1BAeABGuViG3IAqiXly0zQIBz/Le
# hjttMyxUm+cDm7sNVY95ehJPYoQwN4sG8lirQglnrIykM5YtnhQ/zZuSzJKEgH9d
# 1rCKsgYt2x652vJHFUyTfXeYByMZFvn34i223qi1W9hBaof48atNTMRx7PxpC47e
# 6ag1mMq4WhflWw8/+BJmx76iuEbfN9mT0gPITcN9QWuG+S/ofS2KMrUPS4gaHAwF
# ZKb2S1Dqh5T5q6tkXHcwj4s4OcextEVkDLXW4y/Aqr5k0LVJ7i0gzW72mJYCGdM+
# iHqZQsqKQc5WEdo73ne2TMMK2Oyx7kZQo7H3KD2eocpYyCc4Onrb+48/ML/IMQhK
# tcJxTtQHu0BOvfNY0R20zh3TT2JdYjp1X9J1wghfjiumgvIIvD6dePGn59j93KAs
# 7tR1JBpVpQVWPcradXK66M+ym3ku6dzkW+5g+qaL/PyQBKabBuIX5bQ/RRNYVoLz
# gxZ9TaHowODmzSjGZ00UrvqNevfBl91KhXsUIp+rkZ14ajLlTANDAwLQMYID1DCC
# A9ACAQEweDBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjANBglghkgBZQMEAgEFAKCC
# AS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCB1
# 83WD0ClOQiCDpMIjmTk4AKcLpKi49MUaYo94zmkItTCB3QYLKoZIhvcNAQkQAi8x
# gc0wgcowgccwgaAEIGK5ZECL6n3o9GwG3dPBbeM2jOA9BL5ByjUJWb81pTRDMHww
# ZaRjMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVzdGFtcGluZyBD
# QSAyMDIwAhMzAAAAWvYNZ4yF7d0IAAAAAABaMCIEICCq2N4bzQGiMKhwzCXVJMWY
# Ue/I/B8CUrlNDBgqKCOCMA0GCSqGSIb3DQEBCwUABIICAAZnKVO3L7dm37bkjRay
# k2RPexhUuUeK5Ev0cuxviZVgf9/9KeeHnBh9odJ3I3oA3ndKBq6zSW71I07kyZv/
# RwVl/0hDf4BNyPfAALTznkzUfv8zuCpeXdsm+o7ijSPy3jeNMz+kqp1yvH2ee2M+
# fgTpcyfW2RRNP4pbnyD5Ne2R60T8N7Ibl5IfShXq9xYnphjIrFPOo+KJLMulDzZp
# n6flVjbblS2F2EFwMDp+ccnTuWIBJEQkzuSxkIZMnmt43mXemMisY4goNN8RgA8D
# 7RXGk88TwV8n6gMs+3Rh5P4bzOw8FLL07Aif27OWJznM6K/PDTkK9VbjlrQoffF+
# MUN5XD77mmlU23TjjHevo2N47GxEUsTMpcwPtuktvz2TH+PIhgwj6LwnY0i8FF0x
# KbFFcWOy07og/cW38l9S3BkJ9mXhpcgUEJxVNRFRwOXSEjawDsuJVfxNMVGPNUk9
# to22LPp+wkXBFZdpmJn6AFepJ2oN6bakXhVMaRUoajGRqf2ZMlSlb50i+SA9/7hs
# ommyNyBEcQrQj0Br16cvGa+3aOxVW+3IJXb0W7bt98C5f6BfZnoqo1/o4gykzY0I
# yeuaJIey40i05ZaF8gcr+kHZL+jAZ6Mfdz8YmbI+28FzlB8apJPai45jCx3cgnmd
# BH8T66ywPs+oSKYWq07tRZ8I
# SIG # End signature block
