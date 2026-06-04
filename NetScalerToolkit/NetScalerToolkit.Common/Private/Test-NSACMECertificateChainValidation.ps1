function Test-NSACMECertificateChainValidation {
<#
    .SYNOPSIS
        Logs and optionally validates the selected ACME certificate chain.

    .DESCRIPTION
        Reads the certificate artifacts returned by Posh-ACME, logs the selected
        leaf and chain certificates, and can validate the chain with Windows/.NET
        chain building and online revocation checking before deployment.

    .PARAMETER Certificate
        Posh-ACME certificate object.

    .PARAMETER PfxSecret
        Secure string containing the PFX password. Used only when PEM leaf
        artifacts are unavailable.

    .PARAMETER Mode
        None logs the selected chain only. Warn logs validation problems and
        continues. Fail stops deployment when validation reports a problem.

    .NOTES
        Function  : Test-NSACMECertificateChainValidation
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.0603.0001
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [object]$Certificate,

        [Parameter()]
        [securestring]$PfxSecret,

        [ValidateSet('None', 'Warn', 'Fail')]
        [string]$Mode = 'Warn',

        [switch]$IsProduction
    )

    function Read-NSACMECertificatePemCertificate {
        param([string]$Path)

        if ([string]::IsNullOrWhiteSpace($Path) -or -not (Test-Path -LiteralPath $Path -PathType Leaf)) { return @() }

        $content = Get-Content -LiteralPath $Path -Raw
        $matches = [regex]::Matches($content, '-----BEGIN CERTIFICATE-----(?<Body>.*?)-----END CERTIFICATE-----', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        $certificates = @()
        foreach ($match in $matches) {
            $body = ($match.Groups['Body'].Value -replace '\s', '')
            if ([string]::IsNullOrWhiteSpace($body)) { continue }
            $certificates += [System.Security.Cryptography.X509Certificates.X509Certificate2]::new([Convert]::FromBase64String($body))
        }

        return $certificates
    }

    function Test-NSACMECertificateIsCertificateAuthority {
        param([System.Security.Cryptography.X509Certificates.X509Certificate2]$InputCertificate)

        foreach ($extension in $InputCertificate.Extensions) {
            if ($extension -is [System.Security.Cryptography.X509Certificates.X509BasicConstraintsExtension]) {
                return [bool]$extension.CertificateAuthority
            }
        }

        return $false
    }

    function Get-NSACMECertificateLeafCertificate {
        $leaf = @()
        if ($Certificate.CertFile) {
            $leaf = @(Read-NSACMECertificatePemCertificate -Path $Certificate.CertFile)
        }

        if ($leaf.Count -eq 0 -and $Certificate.FullChainFile) {
            $fullChain = @(Read-NSACMECertificatePemCertificate -Path $Certificate.FullChainFile)
            if ($Certificate.Thumbprint) {
                $leaf = @($fullChain | Where-Object { $_.Thumbprint -eq $Certificate.Thumbprint })
            }
            if ($leaf.Count -eq 0) {
                $leaf = @($fullChain | Where-Object { -not (Test-NSACMECertificateIsCertificateAuthority -InputCertificate $_) } | Select-Object -First 1)
            }
        }

        if ($leaf.Count -eq 0) {
            $pfxPath = if ($Certificate.PfxFullChain) { $Certificate.PfxFullChain } else { $Certificate.PfxFile }
            if ($pfxPath -and (Test-Path -LiteralPath $pfxPath -PathType Leaf) -and $PfxSecret) {
                $plainPfx = ConvertFrom-NSACMECertificateLegacySecret -Object $PfxSecret -AsClearText
                $collection = [System.Security.Cryptography.X509Certificates.X509Certificate2Collection]::new()
                $collection.Import($pfxPath, $plainPfx, [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::EphemeralKeySet)
                $leaf = @($collection | Where-Object { $_.HasPrivateKey -and -not (Test-NSACMECertificateIsCertificateAuthority -InputCertificate $_) } | Select-Object -First 1)
            }
        }

        return @($leaf | Select-Object -First 1)
    }

    function Write-NSACMECertificateChainEntryLog {
        param(
            [string]$Role,
            [System.Security.Cryptography.X509Certificates.X509Certificate2]$InputCertificate,
            [int]$Index = 0
        )

        $label = "Selected $Role$(if ($Index -gt 0) { " #$Index" } else { '' })"
        Write-NSACMECertificateLog Info 'Chain' "$label certificate." -Data @{
            Role       = $Role
            Index      = $Index
            Subject    = $InputCertificate.Subject
            Issuer     = $InputCertificate.Issuer
            Serial     = $InputCertificate.SerialNumber
            Thumbprint = $InputCertificate.Thumbprint
            NotBefore  = $InputCertificate.NotBefore.ToString('o')
            NotAfter   = $InputCertificate.NotAfter.ToString('o')
        }
        Write-NSACMECertificateLog Info 'Chain' "$Role$(if ($Index -gt 0) { " #$Index" } else { '' }) subject: $($InputCertificate.Subject)"
        Write-NSACMECertificateLog Info 'Chain' "$Role$(if ($Index -gt 0) { " #$Index" } else { '' }) issuer: $($InputCertificate.Issuer)"
        Write-NSACMECertificateLog Info 'Chain' "$Role$(if ($Index -gt 0) { " #$Index" } else { '' }) thumbprint: $($InputCertificate.Thumbprint)"
    }

    $artifactData = @{
        CertFile     = $Certificate.CertFile
        ChainFile    = $Certificate.ChainFile
        FullChainFile = $Certificate.FullChainFile
        PfxFullChain = $Certificate.PfxFullChain
        PfxFile      = $Certificate.PfxFile
    }
    Write-NSACMECertificateLog Info 'Chain' 'Selected certificate artifact paths.' -Data $artifactData

    $leafCertificate = @(Get-NSACMECertificateLeafCertificate) | Select-Object -First 1
    $chainCertificates = @(Get-NSACMECertificateChainCertificate -Certificate $Certificate)

    if ($leafCertificate) {
        Write-NSACMECertificateChainEntryLog -Role 'Leaf' -InputCertificate $leafCertificate
    } else {
        Write-NSACMECertificateLog Warning 'Chain' 'Could not read the leaf certificate from Posh-ACME artifacts; chain validation skipped.'
    }

    $chainIndex = 0
    foreach ($chainCertificate in $chainCertificates) {
        $chainIndex++
        Write-NSACMECertificateChainEntryLog -Role 'Chain' -Index $chainIndex -InputCertificate $chainCertificate
    }

    if ($Mode -eq 'None') {
        return [pscustomobject]@{
            Mode        = $Mode
            Validated   = $false
            IsValid     = $null
            Status      = @()
            Leaf        = $leafCertificate
            Chain       = $chainCertificates
        }
    }

    if (-not $leafCertificate) {
        if ($Mode -eq 'Fail') { throw 'Certificate chain validation failed because the leaf certificate could not be read from Posh-ACME artifacts.' }
        return [pscustomobject]@{
            Mode        = $Mode
            Validated   = $false
            IsValid     = $false
            Status      = @('Leaf certificate unavailable')
            Leaf        = $null
            Chain       = $chainCertificates
        }
    }

    $x509Chain = [System.Security.Cryptography.X509Certificates.X509Chain]::new()
    $x509Chain.ChainPolicy.RevocationMode = [System.Security.Cryptography.X509Certificates.X509RevocationMode]::Online
    $x509Chain.ChainPolicy.RevocationFlag = [System.Security.Cryptography.X509Certificates.X509RevocationFlag]::ExcludeRoot
    $x509Chain.ChainPolicy.VerificationFlags = [System.Security.Cryptography.X509Certificates.X509VerificationFlags]::NoFlag

    foreach ($chainCertificate in $chainCertificates) {
        [void]$x509Chain.ChainPolicy.ExtraStore.Add($chainCertificate)
    }

    $isValid = $false
    $statusDetails = @()
    $statusMessages = @()
    try {
        $isValid = [bool]$x509Chain.Build($leafCertificate)
        $statusDetails = @($x509Chain.ChainStatus | ForEach-Object {
                $status = [string]$_.Status
                $detail = ($_.StatusInformation -replace '\s+', ' ').Trim()
                if ([string]::IsNullOrWhiteSpace($status) -and [string]::IsNullOrWhiteSpace($detail)) { return }
                [pscustomobject]@{
                    Status = $status
                    Detail = $detail
                }
            })
        $statusMessages = @($statusDetails | ForEach-Object { "{0}: {1}" -f $_.Status, $_.Detail })
    } catch {
        $statusDetails = @([pscustomobject]@{
                Status = 'Exception'
                Detail = $_.Exception.Message
            })
        $statusMessages = @('Exception: {0}' -f $_.Exception.Message)
    }

    if ($isValid) {
        Write-NSACMECertificateLog Info 'Chain' 'Certificate chain validation completed successfully.'
    } else {
        $message = if ($statusMessages.Count -gt 0) {
            "Certificate chain validation reported: $($statusMessages -join '; ')"
        } else {
            'Certificate chain validation failed without detailed chain status.'
        }

        if ($Mode -eq 'Fail') {
            throw $message
        }

        Write-NSACMECertificateLog Warning 'Chain' "Certificate chain validation reported $($statusMessages.Count) issue(s)." -Data ([ordered]@{
                Mode = $Mode
                Count = $statusMessages.Count
                Status = (($statusDetails | Select-Object -ExpandProperty Status) -join ', ')
                Detail = ($statusMessages -join '; ')
            }) -ConsoleDataKeys @('Status')
        if (-not $IsProduction -and $statusDetails.Status -contains 'UntrustedRoot') {
            Write-NSACMECertificateLog Info 'Chain' 'Staging root is untrusted. UntrustedRoot is expected.'
        }
        foreach ($statusDetail in $statusDetails) {
            Write-NSACMECertificateLog Warning 'Chain' "Chain status: $($statusDetail.Status)" -Data ([ordered]@{
                    Status = $statusDetail.Status
                    Detail = $statusDetail.Detail
                }) -ConsoleDataKeys @('Detail')
        }
    }

    [pscustomobject]@{
        Mode        = $Mode
        Validated   = $true
        IsValid     = $isValid
        Status      = $statusMessages
        Leaf        = $leafCertificate
        Chain       = $chainCertificates
    }
}

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDyFmldGtJJ2Rpp
# 4VCnhRwJ2noorEZODmzWVU8CfhFB/qCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCBNaox/X45Bg7G4S12KdwJE54/VZhPhXubFhjvv8s/S
# 0zANBgkqhkiG9w0BAQEFAASCAYBXqgUhbuhGwmNowL7lHHGm8vIdkTnZnkBKBFEc
# RfcSvIv3nHlt8sHNeaFeFVUlTCkJjF9a8dz3SwqRNGmb7vtsrk/bDTxr2p3V4iYd
# 2n1Ltx+w+5vhPbGIfvNYbiOJAw5mMrMoyQQ6Pw19sFgIwZnOAw2KIFMrRXTb7HOh
# xAgGVzsmdsRElmCmOVrSagk6I5ezp37I90D+RILv9jjJ5YXQp5ZMQkQxAR45JlVe
# TXXiLNSxBkg1XlS1tQuBPUt6NUTeGaylzdswCwtjLNLv2OWEphjCwgbcEwgE0eTB
# ZIoZ9SPIkhFsyvdRY2+x38DMor7S2e3FZ2Wzqa6Hn6Th+oj7Al9410UziebWkyCi
# 5k6qJEcYKEAY8UvW8TEhG/EiCzr7zoUTnCxdR2W10itA/UGL7tto+pItrbo13g9A
# ktPnlEN3IENIB00WOlCB5QpqBIZDN9jaikRh8JXSWBGUc/I1HbT7uym4O3mCqIij
# rua9AONQfe3PkEogF+f9tbO4Rp6hggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDQxMDE0MTdaMD8GCSqGSIb3
# DQEJBDEyBDCbt3apbyathdExV2tEVyn3VX4Lv918/y4pGn9y43Wf+oa1OD1Jua29
# ogYKlwKcPBowDQYJKoZIhvcNAQEBBQAEggIAXPY3f7u1vEJ7ErtjBnF6ulpCmj5s
# 6LySAEHkJl+xCDgH/Vs7mJ3C5tYdn+44Q+jMP8yYs3wDGb3ArC+jmUYDJTHGtrxH
# EmLZfUoUgUUORqw0/H+T6zHcDmZ2NUhuvMETMGVWB8uFShXC2dAdb5Wt8Y9FnK5V
# 6cPcvTS8hP09wbxiczi78v2MTgvzqW7jh2lFGQiVa8TYS9jirzPhX8XOi4IsyaUT
# rrjhKHD38NnxXHCtUENZkRWg64Va6WMXz40y0KNQgKwUX5vXFKjNpZCkYR1j1eST
# 0GXv/Q1/ejRd9MGB+/K7FzkBjT0dw1LxhfB/Wso2RmViYOvAAJclQMssxKTW6NSK
# Q/Mtl7tTOUrSDOJNCrsa+7GaGF6/kwZNZV1DR5PUuMZLV2/Ep7M3SCICCOQQOOQc
# BB9imswtxms1EGgJtKat3ezqKz2mlcaRpF2Ie1Ot4KpS3G1DlvnIJp87cfcb8am0
# o9ugDer1FrxFaKSH1QjMoBWHgiF0zrO2w/R2iijOFdNh4kNJhpU1dR0AY144F6YL
# TlnvH1zwgIxE09/H33U/eHdBSuz7wFHRfs1iJ74ZABsk2cW/pTtb4tuLMQrtzttV
# zrIS2ypyk0kRJloBM4ODhNvAH99UBNQUzWo9u4hZztSuCNTyCBgtieg2GZGCLpOx
# msijQf84/CLlgdI=
# SIG # End signature block
