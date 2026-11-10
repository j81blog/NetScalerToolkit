function Write-NSACMECertificateLog {
<#
    .SYNOPSIS
        Writes a request-certificate log entry.

    .DESCRIPTION
        Writes a timestamped support log entry to the configured script log file. While status
        output is active, a Warning entry is also attached as a note to the open status item, or
        written to the warning stream when no item is open.

    .PARAMETER Level
        Severity level for the log entry.

    .PARAMETER Component
        Component name used in the log entry.

    .PARAMETER Message
        Message text to write.

    .PARAMETER Data
        Extra fields written with the entry, sanitized like the message.

    .PARAMETER ConsoleDataKeys
        Data keys shown in the status note of a Warning entry. All keys when not given.

    .PARAMETER NoConsoleData
        Leaves the data out of the status note of a Warning entry.

    .NOTES
        Function  : Write-NSACMECertificateLog
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.1103.2300
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
            # Status output owns the console; this stays a file logger.
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
                if ($script:NSStatus.ItemOpen) {
                    Write-NSStatusNote -Text $noteText
                    $script:NSStatusItemHadWarning = $true
                } else {
                    Write-Warning $noteText
                }
            }
        }
    }
}

# SIG # Begin signature block
# MII6AQYJKoZIhvcNAQcCoII58jCCOe4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCANyVf2fNVe/ZXy
# yU55FeaTIHBYWJ+pG5Jr0GEwewLs/qCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAApgcKRL
# VXge2nhCAAAACmBwMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYxMTAyMDE0MDE2WhcNMjYxMTA1
# MDE0MDE2WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAnVjyyGHEaSM5kPEj0PmXnrii
# z+RQo0mfEhi4d1aRSj7ahqi75poWHhgv8MD8XzGLMM2PSjLvaxwgIlq86d9Xn3FD
# 6AxxgBaTXGyHf6qwKsDVzfGehkOvsFT/mORiqhTkO6JgBHDRf8hijYA5cG6UnNsX
# qS2bERxHFnEynYM8PL4ic3uTXBtTyq7Wf3ZipaZJKDrPpc3UlX6IV3O3geUCGw6z
# 8Zi1tmeTlwy8TLiTMiI58PTpfKiQVO5ubk7qtMjEzqnQ3yvI7ye0B6SonuxU2ymi
# 7sb3jI1ZoCBsPS2nWZaYKKi+xj8UFQmB0Gw1riLHcBFSUlV2ncRCiAkxX8eL6QZ5
# wexCg0FRt0GLziR424t4R//k+jllgA7+JlXVYr8csulwG7rBeDe6b/1zKZ8ni5vW
# k5bwOETJ5Ct1kJ2+VccOFOlV+Y9qlgXxU1FtJVsnNrfOjpHrT82vRx5SqutLgCic
# UuIu2p0VsPImH4JDp19p+KsdyyqYoQ1siHzSJ4yzAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# glf3Q5bglH9qb4svXMaZtVFl/ZswHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAL+z
# xJ+kw96Z5Llix/Cnd4qd5kZubh0Btp1nvi+j2BJ8XK5ciMxbEEfEiO+gRpxuPBSI
# ngvW95eTBWqH1PN18jfWJBjtR7jIJXqP9DnT6xmYBTTZyL7RYG9DvUGCOzQdrFzZ
# h+31eYJAKzgye6Wjt5KGZB2/njvG0eeF/lIrW8tYBlB9J6kahfl0/2EFYifcbg52
# a/fKUpGWOP0zD3GvjjZd0Y9H6/vGjeEJdXydNB4DbbG+iphkGFu5upMzzkwD9xLT
# Dn5iqySH0myL9orfZ3Oqfoy8/VeA0EL9jPIVFaoxevdexSs315nltThXfRz3A78s
# 7wfo51yALvIhEBirJP2GWh9oP4j9Y9ed+Wwzvo+ZRiLYv3YyLZWDMCFD684W3Cl+
# ATGhu3hpwN4O9MNuE/xHqxNA54zxuf56UIDSCHRbjv0DYuLj4Okwt7er2V/62miH
# p/TPAK2N9+D6CbgCHRxDMVPfheRTh6lnQujdjq09EtYl5kYSjS6sMLfHlXJM4IJn
# 1l5L+yyZ8hcYJ10QLmJc/Se6LboxV4sS1Euw9Ns7YvcHQNBmICLVyOc1N3Hfke2i
# U+p22jyimMPCvWTDs3A4Jzc/HuC1VmLiTBE/YNKQdQKnXKuCAbRps1en4ZuFvHSr
# vudGdIKuSdm0jM3wWXvwf0y/S18N/9jKSNPeFY4cMIIGwDCCBKigAwIBAgITMwAK
# YHCkS1V4Htp4QgAAAApgcDANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MTEwMjAxNDAxNloXDTI2
# MTEwNTAxNDAxNlowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAJ1Y8shhxGkjOZDxI9D5
# l564os/kUKNJnxIYuHdWkUo+2oaou+aaFh4YL/DA/F8xizDNj0oy72scICJavOnf
# V59xQ+gMcYAWk1xsh3+qsCrA1c3xnoZDr7BU/5jkYqoU5DuiYARw0X/IYo2AOXBu
# lJzbF6ktmxEcRxZxMp2DPDy+InN7k1wbU8qu1n92YqWmSSg6z6XN1JV+iFdzt4Hl
# AhsOs/GYtbZnk5cMvEy4kzIiOfD06XyokFTubm5O6rTIxM6p0N8ryO8ntAekqJ7s
# VNspou7G94yNWaAgbD0tp1mWmCiovsY/FBUJgdBsNa4ix3ARUlJVdp3EQogJMV/H
# i+kGecHsQoNBUbdBi84keNuLeEf/5Po5ZYAO/iZV1WK/HLLpcBu6wXg3um/9cymf
# J4ub1pOW8DhEyeQrdZCdvlXHDhTpVfmPapYF8VNRbSVbJza3zo6R60/Nr0ceUqrr
# S4AonFLiLtqdFbDyJh+CQ6dfafirHcsqmKENbIh80ieMswIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFIJX90OW4JR/am+LL1zGmbVRZf2bMB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQC/s8SfpMPemeS5Ysfwp3eKneZGbm4dAbadZ74vo9gSfFyuXIjMWxBHxIjvoEac
# bjwUiJ4L1veXkwVqh9TzdfI31iQY7Ue4yCV6j/Q50+sZmAU02ci+0WBvQ71Bgjs0
# Haxc2Yft9XmCQCs4Mnulo7eShmQdv547xtHnhf5SK1vLWAZQfSepGoX5dP9hBWIn
# 3G4Odmv3ylKRljj9Mw9xr442XdGPR+v7xo3hCXV8nTQeA22xvoqYZBhbubqTM85M
# A/cS0w5+Yqskh9Jsi/aK32dzqn6MvP1XgNBC/YzyFRWqMXr3XsUrN9eZ5bU4V30c
# 9wO/LO8H6OdcgC7yIRAYqyT9hlofaD+I/WPXnflsM76PmUYi2L92Mi2VgzAhQ+vO
# FtwpfgExobt4acDeDvTDbhP8R6sTQOeM8bn+elCA0gh0W479A2Li4+DpMLe3q9lf
# +tpoh6f0zwCtjffg+gm4Ah0cQzFT34XkU4epZ0Lo3Y6tPRLWJeZGEo0urDC3x5Vy
# TOCCZ9ZeS/ssmfIXGCddEC5iXP0nui26MVeLEtRLsPTbO2L3B0DQZiAi1cjnNTdx
# 35HtolPqdto8opjDwr1kw7NwOCc3Px7gtVZi4kwRP2DSkHUCp1yrggG0abNXp+Gb
# hbx0q77nRnSCrknZtIzN8Fl78H9Mv0tfDf/YykjT3hWOHDCCBygwggUQoAMCAQIC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMACmBw
# pEtVeB7aeEIAAAAKYHAwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgCSCm
# wAYLvbBRPnHvlTmgFbcHubQNCLXdG2QBu9xoUQ4wDQYJKoZIhvcNAQEBBQAEggGA
# E323uk/0+jUMg4e+h8cwEvCgqdZ2YPOn5xRL5PH7EuvlvdQE65RLUFKqu039f+SW
# gHOcmlzigzYWay1BkSrbvzLlvJPu8GEP3q1Gfs+FYx3a0HjkNlmRf62jI5Nq42Ie
# S/lxFYsf7Sox4Pc32KJXmK2aAFDPgTRd0NR262OFT5znFwY6xCafk47tIrYIWz/R
# lYd6s4AHu67Oy7y6kSBUNsxZBdp08j0QKXfOdKZlf+A+fHCT2f0veGNey6uAv1U7
# gotLL0ek513JFMsiQWNcO4xyWaowt3bQT9MmpJZCT+eq+EaGLtQDQrVvGsGhHRn0
# ezMF+8eVJ3Iv6DsgQd+ShmBx2Nqz6gp0aLnrkfVA7EpEUJTYA3dEpAieVyGKmrYj
# areYXXbu98O4GJtm/J/48q4y8/4CiQwzkcZ6rdG+imZO6dSyKd/+TMN1gJSGITn9
# lKubKaiEfAvLu2H5TLjpB5Bj6h8bESM0N1trtpzyctkjAdlufR6QmuBny7Bf1RXr
# oYIUsTCCFK0GCisGAQQBgjcDAwExghSdMIIUmQYJKoZIhvcNAQcCoIIUijCCFIYC
# AQMxDzANBglghkgBZQMEAgEFADCCAWkGCyqGSIb3DQEJEAEEoIIBWASCAVQwggFQ
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEICrec+8d/Cxlv6oCtrSm
# VHkkCnTjaywZKxquhNRZ8wYYAgZqwGDrJa8YEjIwMjYxMTAzMjEwMzA1LjA3WjAE
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
# BCAg9rdpUKIDgO8G6DYk3rPvLT2SPwVSPNDbv4DvwY5A0TCB3QYLKoZIhvcNAQkQ
# Ai8xgc0wgcowgccwgaAEIGK5ZECL6n3o9GwG3dPBbeM2jOA9BL5ByjUJWb81pTRD
# MHwwZaRjMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVzdGFtcGlu
# ZyBDQSAyMDIwAhMzAAAAWvYNZ4yF7d0IAAAAAABaMCIEIOUGQM/1Ger1ymP8aH1C
# QSzsDBG5ngn4Fgz32Pdi6/HYMA0GCSqGSIb3DQEBCwUABIICAH2jey1CuTPpIQUp
# Rq+PCE5lUBPgRHyLi76ybYXTjTIWAiF65CtnT01PbfWu73pIksy/EPBO5/MeuG8f
# Qg/X9RFJidERFuozhNSsDYCO5LcSrPjzU9gwsqTmCurAu333gG17Pn1OOoUL4Ozh
# y/kHPu/cMvqkX8R2hYQ8bfTmkg+Hom1e3mm7VQdAfmrOLZlnoFrYKpQYW0+y85at
# EGZOxEVbJfvdAjx8ERwx9XsrfO2qHfLoDjNfJsRA2AcNHg+5MK2V3q8XCnijwiqW
# W6IWPZlFyFnzOlnb4f+l+pu3IA6O/mgtwFjkkqdqxNchNFEjOQ3HFRHRY9Cn9nJU
# iqrvBp+pTktHot4NRdhns0Fsnnum4DDmaUr9hN5Dh77a4bbhxfHEp/k5F7J8kFr6
# xGnp+s/3R3/RtHtTGJFZ/uPAee5I6URbbaGuHf1z3LqmQgqoouTupCkn7hFtq31F
# 1TgMcRmPozsNErFgOn9YtPIffmU4ERweU9IFThOrTepsY33UtQXnzoT2F0tEC2cf
# fSZAlMv+jcCqxyHKe5eSukK7wl/uA713RqIdeanx72SGfH4uQ6Cnkw2kBS1gPCQs
# 3DKvzLq+d3gqnSJvuaJmyuW8cHrKKsPC/EPtxkvuQAU3XXnrclttPEQRXOnd6JP5
# Ac6yWbA0A0h7u7tcaopP+nsYhsfX
# SIG # End signature block
