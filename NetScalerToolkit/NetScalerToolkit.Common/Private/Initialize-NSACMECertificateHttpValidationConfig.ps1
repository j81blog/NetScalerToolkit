function Initialize-NSACMECertificateHttpValidationConfig {
<#
    .SYNOPSIS
        Initializes NetScaler objects for ACME HTTP-01 validation.

    .DESCRIPTION
        Ensures the required NetScaler features, services, load balancing objects,
        content switching policy, and bindings exist for HTTP-01 challenge handling.

    .PARAMETER Session
        Existing NetScaler session returned by Connect-NSNode.

    .PARAMETER Settings
        Normalized request settings object with NetScaler object names.

    .PARAMETER Request
        Certificate request object with validation and VIP settings.

    .NOTES
        Function  : Initialize-NSACMECertificateHttpValidationConfig
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.0525.2137
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][object]$Session,
        [Parameter(Mandatory)][object]$Settings,
        [Parameter(Mandatory)][object]$Request
    )

    Write-NSACMECertificateLog Info 'NetScaler' 'Configuring HTTP validation prerequisites.'
    $features = if ($Request.UseLbVip) { @('RESPONDER', 'SSL') } else { @('LB', 'RESPONDER', 'CS', 'SSL') }
    $featuresToEnable = @($features)

    try {
        $featureState = Invoke-NSGetNsFeature -Session $Session -ErrorAction Stop
        if ($featureState) {
            $enabledFeatures = @()
            foreach ($feature in $features) {
                $property = @($featureState.PSObject.Properties | Where-Object { $_.Name -ieq $feature } | Select-Object -First 1)
                if ($property.Count -eq 0) { continue }

                $value = $property[0].Value
                $isEnabled = $false
                if ($value -is [bool]) {
                    $isEnabled = [bool]$value
                } elseif ($value -is [int]) {
                    $isEnabled = ([int]$value -ne 0)
                } elseif ($null -ne $value) {
                    $text = ([string]$value).Trim().ToLowerInvariant()
                    $isEnabled = $text -in @('on', 'enabled', 'true', '1')
                }

                if ($isEnabled) {
                    $enabledFeatures += $feature
                }
            }

            $featuresToEnable = @($features | Where-Object { $enabledFeatures -notcontains $_ })
            if ($featuresToEnable.Count -eq 0) {
                Write-NSACMECertificateLog Debug 'NetScaler' "All required NetScaler features are already enabled: $($features -join ',')."
            } elseif ($featuresToEnable.Count -lt $features.Count) {
                Write-NSACMECertificateLog Debug 'NetScaler' "Only missing NetScaler features will be enabled: $($featuresToEnable -join ',')."
            }
        }
    } catch {
        Write-NSACMECertificateLog Debug 'NetScaler' "Could not pre-check NetScaler feature state before enable: $($_.Exception.Message)"
    }

    if ($featuresToEnable.Count -gt 0) {
        try {
            Invoke-NSEnableNsFeature -Session $Session -Feature $featuresToEnable | Out-Null
        } catch {
            Write-NSACMECertificateLog Warning 'NetScaler' 'Could not enable one or more required NetScaler features. Continuing because the features may already be enabled or not required for this appliance/license profile.' -Data ([ordered]@{
                Features = ($featuresToEnable -join ',')
                Error    = $_.Exception.Message
            })
        }
    }

    if (-not $Request.UseLbVip) {
        foreach ($csVip in @($Request.CsVipName)) {
            Invoke-NSGetCSVServer -Session $Session -Name $csVip | Out-Null
        }
    }

    if (-not (Invoke-NSGetService -Session $Session -Name $Settings.SvcName -ReturnNullOnNotFound -ErrorAction Stop)) {
        $params = @{
            Session       = $Session
            Name          = $Settings.SvcName
            Ip            = $Settings.SvcDestination
            Servicetype   = 'HTTP'
            Port          = 80
            Healthmonitor = 'NO'
        }
        if ([int]$Settings.TrafficDomain -gt 0) { $params.Td = [int]$Settings.TrafficDomain }
        Invoke-NSAddService @params | Out-Null
    }

    if (-not $Request.UseLbVip) {
        if (-not (Invoke-NSGetLBVServer -Session $Session -Name $Settings.LbName -ReturnNullOnNotFound -ErrorAction Stop)) {
            $params = @{
                Session     = $Session
                Name        = $Settings.LbName
                Servicetype = 'HTTP'
                Ipv46       = '0.0.0.0'
            }
            if ([int]$Settings.TrafficDomain -gt 0) { $params.Td = [int]$Settings.TrafficDomain }
            Invoke-NSAddLBVServer @params | Out-Null
        }
    } else {
        Invoke-NSGetLBVServer -Session $Session -Name $Settings.LbName | Out-Null
    }

    $bindings = Invoke-NSGetLBVServerServiceBinding -Session $Session -Name $Settings.LbName -ReturnNullOnNotFound -ErrorAction Stop
    if (-not ($bindings | Where-Object { $_.servicename -eq $Settings.SvcName })) {
        Invoke-NSAddLBVServerServiceBinding -Session $Session -Name $Settings.LbName -Servicename $Settings.SvcName | Out-Null
    }

    if (-not $Request.UseLbVip) {
        try {
            Invoke-NSAddCSAction -Session $Session -Name $Settings.CsaName -Targetlbvserver $Settings.LbName -Comment 'ACME HTTP validation temporary action' | Out-Null
        } catch {
            if ($_.Exception.Message -notmatch 'already exists|already in use|Resource already exists|\[273\]|\[528\]') { throw }
            Invoke-NSUpdateCSAction -Session $Session -Name $Settings.CsaName -Targetlbvserver $Settings.LbName -Comment 'ACME HTTP validation temporary action' | Out-Null
        }

        try {
            Invoke-NSAddCSPolicy -Session $Session -Policyname $Settings.CspName -Rule 'HTTP.REQ.URL.CONTAINS("well-known/acme-challenge/")' -Action $Settings.CsaName | Out-Null
        } catch {
            if ($_.Exception.Message -notmatch 'already exists|already in use|Resource already exists|\[273\]|\[528\]') { throw }
            Invoke-NSUpdateCSPolicy -Session $Session -Policyname $Settings.CspName -Rule 'HTTP.REQ.URL.CONTAINS("well-known/acme-challenge/")' -Action $Settings.CsaName | Out-Null
        }

        foreach ($csVip in @($Request.CsVipName)) {
            try {
                Invoke-NSAddCSVServerCSPolicyBinding -Session $Session -Name $csVip -Policyname $Settings.CspName -Priority ([double]$Settings.CsVipBinding) -Gotopriorityexpression 'END' | Out-Null
            } catch {
                if ($_.Exception.Message -notmatch 'already bound|already exists|Resource already exists|\[273\]|\[246\]') { throw }
                Write-NSACMECertificateLog Debug 'NetScaler' "CS policy '$($Settings.CspName)' is already bound to '$csVip'."
            }
        }
    }
}

# SIG # Begin signature block
# MIInigYJKoZIhvcNAQcCoIInezCCJ3cCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAE3N4O+nBUUgHI
# 63hNItmcuG6J73C8gJqQXL2z8TYkDqCCIR0wggZFMIIELaADAgECAhAIMk+dt9qR
# b2Pk8qM8Xl1RMA0GCSqGSIb3DQEBCwUAMFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQK
# ExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0NlcnR1bSBDb2Rl
# IFNpZ25pbmcgMjAyMSBDQTAeFw0yNDA0MDQxNDA0MjRaFw0yNzA0MDQxNDA0MjNa
# MGsxCzAJBgNVBAYTAk5MMRIwEAYDVQQHDAlTY2hpam5kZWwxIzAhBgNVBAoMGkpv
# aG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MSMwIQYDVQQDDBpKb2huIEJpbGxla2Vu
# cyBDb25zdWx0YW5jeTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAMsl
# ntDbSQwHZXwFhmibivbnd0Qfn6sqe/6fos3pKzKxEsR907RkDMet2x6RRg3eJkiI
# r3TFPwqBooyXXgK3zxxpyhGOcuIqyM9J28DVf4kUyZHsjGO/8HFjrr3K1hABNUsz
# P0o7H3o6J31eqV1UmCXYhQlNoW9FOmRC1amlquBmh7w4EKYEytqdmdOBavAD5Xq4
# vLPxNP6kyA+B2YTtk/xM27TghtbwFGKnu9Vwnm7dFcpLxans4ONt2OxDQOMA5Nwg
# cUv/YTpjhq9qoz6ivG55NRJGNvUXsM3w2o7dR6Xh4MuEGrTSrOWGg2A5EcLH1XqQ
# tkF5cZnAPM8W/9HUp8ggornWnFVQ9/6Mga+ermy5wy5XrmQpN+x3u6tit7xlHk1H
# c+4XY4a4ie3BPXG2PhJhmZAn4ebNSBwNHh8z7WTT9X9OFERepGSytZVeEP7hgypt
# SLcuhpwWeR4QdBb7dV++4p3PsAUQVHFpwkSbrRTv4EiJ0Lcz9P1HPGFoHiFAQQID
# AQABo4IBeDCCAXQwDAYDVR0TAQH/BAIwADA9BgNVHR8ENjA0MDKgMKAuhixodHRw
# Oi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNybDBzBggrBgEF
# BQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0
# dW0uY29tMDUGCCsGAQUFBzAChilodHRwOi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwv
# Y2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAWgBTddF1MANt7n6B0yrFu9zzAMsBwzTAd
# BgNVHQ4EFgQUO6KtBpOBgmrlANVAnyiQC6W6lJwwSwYDVR0gBEQwQjAIBgZngQwB
# BAEwNgYLKoRoAYb2dwIFAQQwJzAlBggrBgEFBQcCARYZaHR0cHM6Ly93d3cuY2Vy
# dHVtLnBsL0NQUzATBgNVHSUEDDAKBggrBgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4Aw
# DQYJKoZIhvcNAQELBQADggIBAEQsN8wgPMdWVkwHPPTN+jKpdns5AKVFjcn00psf
# 2NGVVgWWNQBIQc9lEuTBWb54IK6Ga3hxQRZfnPNo5HGl73YLmFgdFQrFzZ1lnaMd
# Icyh8LTWv6+XNWfoyCM9wCp4zMIDPOs8LKSMQqA/wRgqiACWnOS4a6fyd5GUIAm4
# CuaptpFYr90l4Dn/wAdXOdY32UhgzmSuxpUbhD8gVJUaBNVmQaRqeU8y49MxiVrU
# KJXde1BCrtR9awXbqembc7Nqvmi60tYKlD27hlpKtj6eGPjkht0hHEsgzU0Fxw7Z
# JghYG2wXfpF2ziN893ak9Mi/1dmCNmorGOnybKYfT6ff6YTCDDNkod4egcMZdOSv
# +/Qv+HAeIgEvrxE9QsGlzTwbRtbm6gwYYcVBs/SsVUdBn/TSB35MMxRhHE5iC3aU
# TkDbceo/XP3uFhVL4g2JZHpFfCSu2TQrrzRn2sn07jfMvzeHArCOJgBW1gPqR3Wr
# J4hUxL06Rbg1gs9tU5HGGz9KNQMfQFQ70Wz7UIhezGcFcRfkIfSkMmQYYpsc7rfz
# j+z0ThfDVzzJr2dMOFsMlfj1T6l22GBq9XQx0A4lcc5Fl9pRxbOuHHWFqIBD/BCE
# hwniOCySzqENd2N+oz8znKooSISStnkNaYXt6xblJF2dx9Dn89FK7d1IquNxOwt0
# tI5dMIIGgjCCBGqgAwIBAgIQNsKwvXwbOuejs902y8l1aDANBgkqhkiG9w0BAQwF
# ADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
# C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAs
# BgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcN
# MjEwMzIyMDAwMDAwWhcNMzgwMTE4MjM1OTU5WjBXMQswCQYDVQQGEwJHQjEYMBYG
# A1UEChMPU2VjdGlnbyBMaW1pdGVkMS4wLAYDVQQDEyVTZWN0aWdvIFB1YmxpYyBU
# aW1lIFN0YW1waW5nIFJvb3QgUjQ2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAiJ3YuUVnnR3d6LkmgZpUVMB8SQWbzFoVD9mUEES0QUCBdxSZqdTkdizI
# CFNeINCSJS+lV1ipnW5ihkQyC0cRLWXUJzodqpnMRs46npiJPHrfLBOifjfhpdXJ
# 2aHHsPHggGsCi7uE0awqKggE/LkYw3sqaBia67h/3awoqNvGqiFRJ+OTWYmUCO2G
# AXsePHi+/JUNAax3kpqstbl3vcTdOGhtKShvZIvjwulRH87rbukNyHGWX5tNK/WA
# BKf+Gnoi4cmisS7oSimgHUI0Wn/4elNd40BFdSZ1EwpuddZ+Wr7+Dfo0lcHflm/F
# DDrOJ3rWqauUP8hsokDoI7D/yUVI9DAE/WK3Jl3C4LKwIpn1mNzMyptRwsXKrop0
# 6m7NUNHdlTDEMovXAIDGAvYynPt5lutv8lZeI5w3MOlCybAZDpK3Dy1MKo+6aEtE
# 9vtiTMzz/o2dYfdP0KWZwZIXbYsTIlg1YIetCpi5s14qiXOpRsKqFKqav9R1R5vj
# 3NgevsAsvxsAnI8Oa5s2oy25qhsoBIGo/zi6GpxFj+mOdh35Xn91y72J4RGOJEoq
# zEIbW3q0b2iPuWLA911cRxgY5SJYubvjay3nSMbBPPFsyl6mY4/WYucmyS9lo3l7
# jk27MAe145GWxK4O3m3gEFEIkv7kRmefDR7Oe2T1HxAnICQvr9sCAwEAAaOCARYw
# ggESMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBT2
# d2rdP/0BE/8WoWyCAi/QCj0UJTAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUw
# AwEB/zATBgNVHSUEDDAKBggrBgEFBQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYD
# VR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVz
# dFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMDUGCCsGAQUFBwEBBCkwJzAl
# BggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0B
# AQwFAAOCAgEADr5lQe1oRLjlocXUEYfktzsljOt+2sgXke3Y8UPEooU5y39rAARa
# AdAxUeiX1ktLJ3+lgxtoLQhn5cFb3GF2SSZRX8ptQ6IvuD3wz/LNHKpQ5nX8hjsD
# LRhsyeIiJsms9yAWnvdYOdEMq1W61KE9JlBkB20XBee6JaXx4UBErc+YuoSb1SxV
# f7nkNtUjPfcxuFtrQdRMRi/fInV/AobE8Gw/8yBMQKKaHt5eia8ybT8Y/Ffa6HAJ
# yz9gvEOcF1VWXG8OMeM7Vy7Bs6mSIkYeYtddU1ux1dQLbEGur18ut97wgGwDiGin
# CwKPyFO7ApcmVJOtlw9FVJxw/mL1TbyBns4zOgkaXFnnfzg4qbSvnrwyj1NiurMp
# 4pmAWjR+Pb/SIduPnmFzbSN/G8reZCL4fvGlvPFk4Uab/JVCSmj59+/mB2Gn6G/U
# YOy8k60mKcmaAZsEVkhOFuoj4we8CYyaR9vd9PGZKSinaZIkvVjbH/3nlLb0a7SB
# IkiRzfPfS9T+JesylbHa1LtRV9U/7m0q7Ma2CQ/t392ioOssXW7oKLdOmMBl14su
# VFBmbzrt5V5cQPnwtd3UOTpS9oCG+ZZheiIvPgkDmA8FzPsnfXW5qHELB43ET7HH
# FHeRPRYrMBKjkb8/IN7Po0d0hQoF4TeMM+zYAJzoKQnVKOLg8pZVPT8wgganMIIE
# j6ADAgECAhEAkKwIciD9xafEa1zHDfc9BjANBgkqhkiG9w0BAQwFADBXMQswCQYD
# VQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMS4wLAYDVQQDEyVTZWN0
# aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIFJvb3QgUjQ2MB4XDTI2MDMyNTAwMDAw
# MFoXDTQxMDMyNDIzNTk1OVowVTELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3Rp
# Z28gTGltaXRlZDEsMCoGA1UEAxMjU2VjdGlnbyBQdWJsaWMgVGltZSBTdGFtcGlu
# ZyBDQSBSNDEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCu5EqiAa2C
# HGL5Zi1bmgPM8NUXwYZJ+BtQqHps43GLTC+sjVLypsBh+8uv+TLkgtVGD//vSmA0
# qrzELf9YRCh2MTAA/aGaQZKGg0BRCmziR3pbCnvgWjtGXBDUyn3j3K2lZAO8KxgF
# tlxwOYEAkL+CCqK4v9zzTl8ZwzDpPMiDIFa5THk8an1ieF5I09cXNrPQw+1ER1li
# ThaG0z6FrOpqwxZWmPRZQBw2E32878UB1bL0Zp91vuWZgsMpNNiPCoBj0/1F+LE8
# +NRokfqacFI0F2tftrRB2W7HQClLR9zjxFbWb5be2rceIfNyHUUfKGIvMI2NzoxS
# lxXnFqUG887D8W1Cj8DFok688JKxWvHR/9aQykSbd+9Vutj36ij2sgq/125wTpUZ
# /AgC0ph50bRs7gFrUyaXE9wSsOqMvCCC+sEm7vd/BemSG0TSHNXSmyCba+FCzeke
# WX03TRIcF3Laqd0Rw24OH7jpei4zaGhcI7nfdhBA4c8RScxNY6jeHLHHmSMMTk9W
# qn7H4dLhUBP5YEwbgbN4uv1i9ltTnHli8t1xHV0StX9BFgrnmunTX19kUXY1H5OR
# JbRZyZDdvm1oZyteDj0SnMozr+YSmdIleDUTXdfoY7b2taz8s2+QbOxLxcahEIYG
# Wzqu6h955tKwcANHcZ4gTmAhT3btuOiQsQIDAQABo4IBbjCCAWowHwYDVR0jBBgw
# FoAU9ndq3T/9ARP/FqFsggIv0Ao9FCUwHQYDVR0OBBYEFDp0pQxnxkJQwv21/Me7
# KTSC9Hq5MA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMCMGA1UdIAQcMBowCAYGZ4EMAQQCMA4GDCsGAQQBsjEB
# AgEDCDBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3JsLnNlY3RpZ28uY29tL1Nl
# Y3RpZ29QdWJsaWNUaW1lU3RhbXBpbmdSb290UjQ2LmNybDB8BggrBgEFBQcBAQRw
# MG4wRwYIKwYBBQUHMAKGO2h0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1
# YmxpY1RpbWVTdGFtcGluZ1Jvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8v
# b2NzcC5zZWN0aWdvLmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAMt5SR2bxngNm+N8o
# c6Gq76Gx1c235fkX7jw8Ho9MAkJGADerHE7dhsBXttqmzgr/7ZZahZSykGRPhPY1
# crj028kB8KzO0dKC2qQBAwtfgqMLKkkX/6bYq2uT33eD6ByAp2/XKD0LcmZh0kKe
# cvSBr6ln9ajX6u1dnx2fA7xEKy1M3qBhfQSUWLtjs2nFt0ELVLptzTlX9ID0cL+i
# OPfdboZ3CelT+JXKVKR2Sge0d4YiFAtPZkfSo8z1Z1x7y/Z9mwMIlBAnyuWXs4Ys
# NuxdrYIt/QxE31PDOJ9DesS4Bc7H9OTORlEV/AvfiF/VepKZpira1MzLYuCw+uoL
# Zn/pkpvd+CvNTS+mEHjBJNa6WK1j8qXFu+jIq+sG9QILHiyB6p/xpHrkJu8zkw39
# 3+VqF9eKlTY2VjRxdycZLrVemZ4Yp3wi33b+W58CllH3HqjmowlZ7SOrgmx8YwYO
# kgrHsXOQHyBp6O4FRb8In0+FzjT7ElGie9V7CfhL3IlVFZ4zjuKsZtH1iU3fGu4z
# /JnOGT6sCb0BbTqe/uhvpFCQBdH5xPGIA/LrbQUXjU2tWJgHhTIqnN/HvHyOHi5t
# M4zP3nhgh2rJ6Kqq2xsHBeNYs/R18xQ8DeIg+c90Eoaeh0YlN1KU8AyYol3K9M+q
# Y5ez8syd/7ZlrRnoVewgH3P1pcswgga5MIIEoaADAgECAhEAmaOACiZVO2Wr3G6E
# prPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAgBgNVBAoTGVVu
# aXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1bSBDZXJ0aWZp
# Y2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0ZWQgTmV0d29y
# ayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIxOFowVjELMAkGA1UE
# BhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIGA1UE
# AxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjANBgkqhkiG9w0BAQEF
# AAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5cTbq96y34vuTmflN4
# mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7VS5+djSoMcbvIKck
# 6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1PH9ud0IF+njvMk2xq
# bNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOouu9Tj1yHIohzuC8KN
# qfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv8aGUsRdaCtVD2bSl
# bfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtMLK+Wo837Q4QOZgYq
# VWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9lDV2nT8mFSkcSkAE
# xzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/JHuurfTI5XDYO962
# WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkKbWpQ5boufUnq1UiY
# PIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADaCi2JSplKShBSND36
# E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAWd18Jx5n858JSqPEC
# AwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFN10XUwA23uf
# oHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4HKbROg79MA4G
# A1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAwBgNVHR8EKTAnMCWg
# I6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwGCCsGAQUFBwEB
# BGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2VydHVtLmNvbTAy
# BggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBsL2N0bmNhMi5j
# ZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0dHA6Ly93d3cu
# Y2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhYD+WPUCiaU58Q7EP8
# 9DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUStJl490L94C9LGF3v
# jzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChDUyuQy6rGDxLUUAsO
# 0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiRsWrhWM2f8pXdd3x2
# mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7bWRLDm0CdY9rNLqyA
# 3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mATwZWwSD+B7eMcZNhp
# n8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3/bFAEloMU+vUBfSo
# uCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESYkOh1/w1tVxTpV2Na
# 3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR+x+zPF/2DaGgK2W1
# eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C+xN4YaNjt2ywzOr+
# tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qwt4HOUBCrW602NCmv
# O1nm+/80nLy5r0AZvCQxaQ4wggbiMIIEyqADAgECAhEA507yVbBQT/rbpt/3/Iuj
# FTANBgkqhkiG9w0BAQwFADBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGln
# byBMaW1pdGVkMSwwKgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5n
# IENBIFI0MTAeFw0yNjAzMjUwMDAwMDBaFw0zNzA2MjQyMzU5NTlaMHIxCzAJBgNV
# BAYTAkdCMRcwFQYDVQQIEw5HcmVhdGVyIExvbmRvbjEYMBYGA1UEChMPU2VjdGln
# byBMaW1pdGVkMTAwLgYDVQQDEydTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5n
# IFNpZ25lciBSMzcwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCy/8Nt
# S9xQ2UUtBRF32bj7VK3n4m50Uqjk/zTciSziYV40H1LKah0/oEklYG42E4VCP3Dv
# sBUB6DmpCkDZ0jCnZBPIEevaH15ZJOQwFWP2ZXr5YjlJpb68Nlbs+ElNvKx32/1Y
# Hde3qqUSLybjulxPLz6T85+HOIqK7M1Bep8LspyhEP/q6nw5kGxTSrGvufmeH+JF
# 8CnVBcVMFA40FlIYh0cDJVFhhfTfdWgLy/vWuLMQoKkf3s/FvByf16r0rtbyHm/i
# emwxSioJL9zyZDDKUNAbHXl0dhXo2VxUV2NcPXWXuoKsjL+6cfk6Vm2DHnxAlFdF
# saBDIF1JOkSnC6PeLlBznZn2buF3vIIYJcq6N/zeFRCk4/HXDz7zgRsRRMdUB+rh
# yk5FoZaBjw0nLq3GZ3fClLUx5es5pUAxzNODMBn7JkFYip2BAGBPER5eV0ROhk6t
# GTG+fUiMiV+vgjg1YnP5FvnYWyEtWeQD/B2hp3vz0RvtdkM0p3igyadzrfpOBq5p
# pVk/YsuhTQkP99ivneHAGfi5e7lmxJ+meoBPrRLuzMmb81rzzbESjJHMsn5RVtc6
# Ucs7rcMqQC13PUIO7BbGBETV2ufCmV6lPTp3P7XJOvmnUCRTPbVvMTpxP/z+SOHg
# 4/OCBhiqs4FA9+4oQvlkk9w32NGASli9GWrm5wIDAQABo4IBjjCCAYowHwYDVR0j
# BBgwFoAUOnSlDGfGQlDC/bX8x7spNIL0erkwHQYDVR0OBBYEFGEQ6XoSr1HEhdTy
# z6R0D1DNIK/4MA4GA1UdDwEB/wQEAwIGwDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB
# /wQMMAoGCCsGAQUFBwMIMEoGA1UdIARDMEEwCAYGZ4EMAQQCMDUGDCsGAQQBsjEB
# AgEDCDAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzBKBgNV
# HR8EQzBBMD+gPaA7hjlodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
# aWNUaW1lU3RhbXBpbmdDQVI0MS5jcmwwegYIKwYBBQUHAQEEbjBsMEUGCCsGAQUF
# BzAChjlodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNUaW1lU3Rh
# bXBpbmdDQVI0MS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28u
# Y29tMA0GCSqGSIb3DQEBDAUAA4ICAQAD6j2N0azN+hl6k6bKB5/U6VuSOs93ZBb3
# Pczy9VtBIKu4947Z5GwL0aFngIxl+GSuLFrJgPruBCRvKJEJsm7kv+LQ1COVCEG9
# tZ+IRtr4ocUoa53lgdFaENlS0N4wgkZkbQEPv+x+1lSjYh+T4JeL9mUznT7Erc6S
# p5dWLka5sMP/m3GZi6oJPdPcsCKWagH7m2H2xDGIyHJC5PdH9phvi/KmhkktiSVT
# NNqVeV5bWdX2zhRE6UTfz0IcMoCL996lFIydXxOCE4MNDHDM0as4lnTiT/KHMccO
# 6l8c9TnUVgmpci9ar1IABZ2U1XUkYjGGSn9MC3EHDP9V39VuBVvZ33/BEV/EWSRr
# f07T7jFplKX+gQr/UOqPGMlE7ZJ72UaUkNJy7bVl3bcLKzdpjIHzLkf/4MVa1V7w
# 8wqCv5W4gOnRGTlud5UMARbRM8BPxR/CXYXoMmIOD8pmTk2axgRL4LG8XtuchISd
# CHRmtacAmLGq5XSYSVTHTXADlO48iDKh3HM2r98LSF6f0sG12d8V9Jn7C3wDUieO
# xuKj4MdWrW+hiJU2kF87v6eH00HgCFFc2V0+CvfOCMn7juzS41jLaINcBlKWQ/fK
# b/uDLfWOW73z1I2lFY7Xj8tQ1XYtK5eREjWItM8jpl1cbQOc88btR+0XS2TmboE/
# 141+va2PWzGCBcMwggW/AgEBMGowVjELMAkGA1UEBhMCUEwxITAfBgNVBAoTGEFz
# c2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIGA1UEAxMbQ2VydHVtIENvZGUgU2ln
# bmluZyAyMDIxIENBAhAIMk+dt9qRb2Pk8qM8Xl1RMA0GCWCGSAFlAwQCAQUAoIGE
# MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQB
# gjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkE
# MSIEICSrBr3uScfZbcruw2KZfYwNtePJ3gqwlxOGXfcmwc5FMA0GCSqGSIb3DQEB
# AQUABIIBgHFPM3szTnO7e9pYiaaunVhEfUP1IOB/uTZle1T7hio9ZsztamhOklsP
# 1PNRBRJ9601CxbgWzcOHNaOhbtkw2Q609bBSIcrnD4HHWpGtgKMQ7ZDn0XxNnWEI
# GqqTsgX1doU+9ONa+BNKaOBoCkQ2ZW5iolYe0xPii0sHMAssLVKienZMPlfDvY+u
# 7tcE3WrQ8hes3EhjY1X1tLg4VxnJ3ETjRSSI/3SHqRkEsFpkrNL9FCHZf0efDsDH
# KG6i9l3ZdXFELc8/gLwKYcgjHaJGAgk/QUTuKfJV/RDihbI7pCtxY6c2mD0DFe5S
# a8xaYcaLngdOa8r7JfVZEcZQa5iFY2I+F9KQrFMsmb/wTIkvnwmziOAZbhfjM9dD
# SVDfsHJUJuS9+DSnuSPDa3oYPwurjBAAFj+x+xosfU+mtx6X++5IAS1ycrNGonVE
# 9OvtFO2rhwHZ9k5H2r/sNkgsJBExnaXocTyJCy6bk92AJMdVW7XOUzgSn0YTGASL
# NDa0ofgpVqGCAyMwggMfBgkqhkiG9w0BCQYxggMQMIIDDAIBATBqMFUxCzAJBgNV
# BAYTAkdCMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxLDAqBgNVBAMTI1NlY3Rp
# Z28gUHVibGljIFRpbWUgU3RhbXBpbmcgQ0EgUjQxAhEA507yVbBQT/rbpt/3/Iuj
# FTANBglghkgBZQMEAgIFAKB5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
# KoZIhvcNAQkFMQ8XDTI2MDcyMDEyMjQ1NFowPwYJKoZIhvcNAQkEMTIEMKG9yPMu
# eMowziydVjszlhLdHbFkkE0Wcamzrw24QZ/WI7btJA7AuJsuCI/tf4rn9jANBgkq
# hkiG9w0BAQEFAASCAgCeMazh3t6bpcWZhSOAdBvv+JUKDjgWVxAXRWG74r6YfVO2
# 9rWAirDD3eYIiAwzRgtkV5LIik0R00fhKVHI74eftOoigEkbL2hZJRDxVGum3eOl
# bDDu0cccjidKv0pq7yuDyhfYbVGkfjz0Gwap1Vm4YjVwTU+4a5fePer+jI1WECrb
# TsP+ZOkxo9YZFSuUNkYry0/pxS2ZP5Zd66xX/pBGE710nMm5hF8kKQtm7B1dSjdy
# Wjdk5KhA9QbHMpPwhgg8gQQ/PWSsNQ+MWWcqM07MKAa0z2wyaHiw+KUVHOH0bNsc
# 9hI6ofSznqnv5n19kRettCn5PL/76bK/OToiRDeKF0SrFd6WYaWF8aL60rPt/MbH
# bcotuA3y1zobifLo30Sg0lHob+JaWXPR/rKarZOwIoHkP+HUHjqy9mHiewO+0pTL
# HxooMDcRugUeWAlvgydZDN/C5BTSjHlnPVPnwcXneNa0IUvIhPm2pjsl522S01L9
# KKprOKwffZVVrdK5x6I9LhpXG6kvxYI8VqLXSF1x888p1zFWmbvM9kl3DIDjqQ/1
# H5BOeJhnQ9sg9O0G+s9n8xm8g8AJzPShTrnFS0KOUwbyeZbxu5+cj6EErO/3Vgjt
# u1H2AX9CZFQtvv8Rerq9EYVgackNoV/Fz1bsGGYMU9X4EbR/EkNnvaBKMxdecw==
# SIG # End signature block
