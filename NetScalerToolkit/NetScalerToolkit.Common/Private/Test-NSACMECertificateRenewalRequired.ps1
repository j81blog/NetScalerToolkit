function Test-NSACMECertificateRenewalRequired {
<#
    .SYNOPSIS
        Determines whether a certificate request should be renewed.

    .DESCRIPTION
        The deployed NetScaler certificate is the only source that describes what is
        actually serving traffic, so it decides whether a replacement is needed. ACME
        order metadata can still pull renewal forward, but only when that order describes
        the deployed certificate. Local Posh-ACME state and legacy GenLeCertForNS request
        metadata are used only when the appliance has nothing to say.

        A request is also renewed when forced, when the request definition no longer
        matches the certificate that was last issued, when a staging certificate is found
        on a production run, or when no reliable renewal source is available.

    .PARAMETER Request
        Certificate request object from command parameters or an AutoRun config file.
        LastIssuedSerial, LastIssuedDomains, LastIssuedAcmeServer and LastIssuedKeyLength
        describe the certificate this request last produced.

    .PARAMETER AcmeOrder
        Refreshed Posh-ACME order object. Used for the renewal window when its CertExpires
        matches the deployed certificate, and as a fallback when nothing is deployed.

    .PARAMETER AcmeCertificate
        Existing ACME certificate object or X509 certificate used for dynamic
        renewal calculation when no deployed certificate or ACME order is available.

    .PARAMETER NetScalerCertificate
        Existing NetScaler sslcertkey object. Primary renewal source.

    .PARAMETER Domains
        Domains the request currently asks for, compared against LastIssuedDomains.

    .PARAMETER AcmeServer
        ACME server this run uses, compared against LastIssuedAcmeServer.

    .PARAMETER IsProduction
        Indicates a production run, which rejects a deployed staging certificate.

    .PARAMETER Force
        Forces renewal regardless of CertExpires or RenewAfter values.

    .NOTES
        Function  : Test-NSACMECertificateRenewalRequired
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.0817.1600
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [object]$Request,

        [Parameter()]
        [object]$AcmeOrder,

        [Parameter()]
        [object]$AcmeCertificate,

        [Parameter()]
        [object]$NetScalerCertificate,

        [Parameter()]
        [AllowEmptyCollection()]
        [string[]]$Domains,

        [Parameter()]
        [AllowEmptyString()]
        [string]$AcmeServer,

        [Parameter()]
        [switch]$IsProduction,

        [Parameter()]
        [switch]$Force
    )

    function ConvertFrom-NSACMECertificateDateValue {
        [CmdletBinding()]
        param(
            [Parameter()]
            [object]$Value
        )

        if ($null -eq $Value -or [string]::IsNullOrWhiteSpace([string]$Value)) {
            return $null
        }

        if ($Value -is [datetime]) {
            return [datetime]$Value
        }

        $dateValue = ([string]$Value).Trim()
        if ($dateValue -match '^/Date\((?<Milliseconds>-?\d+)\)/$') {
            return ([datetimeoffset]::FromUnixTimeMilliseconds([int64]$Matches.Milliseconds)).LocalDateTime
        }

        # NITRO sslcertkey reports 'Jul 16 18:51:18 2020 GMT', with a space-padded single digit day.
        if ($dateValue -match '^(?<Date>[A-Za-z]{3}\s+\d{1,2}\s+\d{2}:\d{2}:\d{2}\s+\d{4})\s+GMT$') {
            $nitroDate = $Matches.Date -replace '\s+', ' '
            [datetime]$nitroParsed = [datetime]::MinValue
            if ([datetime]::TryParseExact(
                    $nitroDate,
                    'MMM d HH:mm:ss yyyy',
                    [System.Globalization.CultureInfo]::InvariantCulture,
                    [System.Globalization.DateTimeStyles]::AssumeUniversal -bor [System.Globalization.DateTimeStyles]::AdjustToUniversal,
                    [ref]$nitroParsed)) {
                return $nitroParsed.ToLocalTime()
            }
        }

        try {
            return [datetime]::Parse(
                $dateValue,
                [System.Globalization.CultureInfo]::InvariantCulture,
                [System.Globalization.DateTimeStyles]::AssumeUniversal -bor [System.Globalization.DateTimeStyles]::AdjustToUniversal
            ).ToLocalTime()
        } catch {
            return $null
        }
    }

    function Get-NSACMECertificateObjectValue {
        [CmdletBinding()]
        param(
            [Parameter()]
            [object]$InputObject,

            [Parameter(Mandatory)]
            [string[]]$Name
        )

        if ($null -eq $InputObject) { return $null }

        foreach ($propertyName in $Name) {
            if ($InputObject.PSObject.Properties.Name -contains $propertyName) {
                $value = $InputObject.$propertyName
                if ($null -ne $value -and -not [string]::IsNullOrWhiteSpace([string]$value)) {
                    return $value
                }
            }
        }

        return $null
    }

    function Get-NSACMECertificateValidityWindow {
        [CmdletBinding()]
        param(
            [Parameter()]
            [object]$InputObject
        )

        if ($null -eq $InputObject) { return $null }

        $notBefore = $null
        $notAfter = $null

        if ($InputObject -is [System.Security.Cryptography.X509Certificates.X509Certificate2]) {
            $notBefore = $InputObject.NotBefore
            $notAfter = $InputObject.NotAfter
        } else {
            $notBefore = ConvertFrom-NSACMECertificateDateValue -Value (Get-NSACMECertificateObjectValue -InputObject $InputObject -Name @('NotBefore', 'notbefore', 'CertNotBefore', 'certnotbefore', 'clientcertnotbefore', 'ValidFrom', 'validfrom'))
            $notAfter = ConvertFrom-NSACMECertificateDateValue -Value (Get-NSACMECertificateObjectValue -InputObject $InputObject -Name @('NotAfter', 'notafter', 'CertNotAfter', 'certnotafter', 'clientcertnotafter', 'ValidTo', 'validto', 'CertExpires', 'certexpires'))
        }

        if (-not $notAfter) {
            $daysToExpiration = Get-NSACMECertificateObjectValue -InputObject $InputObject -Name @('DaysToExpiration', 'daystoexpiration')
            if ($daysToExpiration -as [double]) {
                $notAfter = (Get-Date).AddDays([double]$daysToExpiration)
            }
        }

        if (-not $notAfter) { return $null }
        # NotBefore is optional. Without it the lifetime is unknown, so the caller can only
        # test expiry from this source and has to take the renewal window elsewhere.
        if ($notBefore -and $notAfter -le $notBefore) { return $null }

        [PSCustomObject]@{
            NotBefore = $notBefore
            NotAfter  = $notAfter
        }
    }

    function New-NSACMECertificateRenewalDecision {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory)]
            [bool]$ShouldRenew,

            [Parameter(Mandatory)]
            [string]$Reason,

            [Parameter(Mandatory)]
            [string]$Summary,

            [Parameter()]
            [Nullable[datetime]]$CertExpires,

            [Parameter()]
            [Nullable[datetime]]$RenewAfter,

            [Parameter(Mandatory)]
            [string]$Source,

            [Parameter(Mandatory)]
            [string]$Strategy
        )

        $now = Get-Date
        [PSCustomObject]@{
            ShouldRenew    = $ShouldRenew
            Reason         = $Reason
            Summary        = $Summary
            CertExpires    = $CertExpires
            RenewAfter     = $RenewAfter
            ExpireDays     = if ($CertExpires) { [int]($CertExpires - $now).TotalDays } else { $null }
            RenewAfterDays = if ($RenewAfter) { [int]($RenewAfter - $now).TotalDays } else { $null }
            Source         = $Source
            Strategy       = $Strategy
        }
    }

    function Test-NSACMECertificateRenewalWindow {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory)]
            [datetime]$RenewAfter,

            [Parameter()]
            [Nullable[datetime]]$CertExpires,

            [Parameter(Mandatory)]
            [string]$Source,

            [Parameter(Mandatory)]
            [string]$Strategy
        )

        $now = Get-Date
        if ($CertExpires -and $now -ge $CertExpires) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "Certificate expired on $($CertExpires.ToString('yyyy-MM-dd HH:mm:ss'))." -Summary 'Certificate expired.' -CertExpires $CertExpires -RenewAfter $RenewAfter -Source $Source -Strategy $Strategy
        }

        if ($now -lt $RenewAfter) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $false -Reason "Certificate is still valid and outside the renewal window. Renewal can start after $($RenewAfter.ToString('yyyy-MM-dd HH:mm:ss')). Use -ForceCertRenew (or -Force) to renew now." -Summary 'Outside renewal window. Use -ForceCertRenew to renew now.' -CertExpires $CertExpires -RenewAfter $RenewAfter -Source $Source -Strategy $Strategy
        }

        New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "Renewal window has started ($($RenewAfter.ToString('yyyy-MM-dd HH:mm:ss')))." -Summary 'Renewal window started.' -CertExpires $CertExpires -RenewAfter $RenewAfter -Source $Source -Strategy $Strategy
    }

    function Get-NSACMECertificateCalculatedRenewAfter {
        [CmdletBinding()]
        param(
            [Parameter(Mandatory)]
            [datetime]$NotBefore,

            [Parameter(Mandatory)]
            [datetime]$NotAfter
        )

        $lifetime = $NotAfter - $NotBefore
        $NotBefore.AddTicks([int64]($lifetime.Ticks * 2 / 3))
    }

    $now = Get-Date
    $certExpires = ConvertFrom-NSACMECertificateDateValue -Value $Request.CertExpires
    $renewAfter = ConvertFrom-NSACMECertificateDateValue -Value $Request.RenewAfter

    if ($Force) {
        return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason 'ForceCertRenew was specified.' -Summary 'Forced renewal.' -CertExpires $certExpires -RenewAfter $renewAfter -Source 'Force' -Strategy 'Forced renewal.'
    }

    $deployedSerial = Get-NSACMECertificateObjectValue -InputObject $NetScalerCertificate -Name @('serial', 'Serial')
    $deployedIssuer = [string](Get-NSACMECertificateObjectValue -InputObject $NetScalerCertificate -Name @('issuer', 'Issuer'))
    $deployedStatus = [string](Get-NSACMECertificateObjectValue -InputObject $NetScalerCertificate -Name @('status', 'Status'))
    $deployedValidity = Get-NSACMECertificateValidityWindow -InputObject $NetScalerCertificate

    # The recorded definition only describes the deployed certificate when the serial still matches.
    # Without that corroboration the record is treated as unknown, which keeps an upgrade from
    # renewing everything at once.
    $recordedSerial = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('LastIssuedSerial'))
    $definitionTrusted = $deployedSerial -and $recordedSerial -and ($recordedSerial -eq [string]$deployedSerial)

    if ($definitionTrusted) {
        $recordedDomains = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('LastIssuedDomains'))
        $currentDomains = (@($Domains | Where-Object { $_ } | ForEach-Object { ([string]$_).Trim().ToLowerInvariant() } | Sort-Object -Unique) -join ',')
        if ($recordedDomains -and $currentDomains -and $recordedDomains -ne $currentDomains) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "Requested domains changed since the deployed certificate was issued ('$recordedDomains' -> '$currentDomains')." -Summary 'Requested domains changed.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'request definition' -Strategy 'Deployed certificate no longer matches the request.'
        }

        $recordedServer = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('LastIssuedAcmeServer'))
        if ($recordedServer -and $AcmeServer -and $recordedServer -ne $AcmeServer) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "ACME server changed since the deployed certificate was issued ('$recordedServer' -> '$AcmeServer')." -Summary 'ACME server changed.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'request definition' -Strategy 'Deployed certificate no longer matches the request.'
        }

        $recordedKeyLength = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('LastIssuedKeyLength'))
        $currentKeyLength = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('KeyLength'))
        if ($recordedKeyLength -and $currentKeyLength -and $recordedKeyLength -ne $currentKeyLength) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "Key length changed since the deployed certificate was issued ('$recordedKeyLength' -> '$currentKeyLength')." -Summary 'Key length changed.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'request definition' -Strategy 'Deployed certificate no longer matches the request.'
        }
    }

    # A staging certificate can be inside its validity window and still be wrong for a production run.
    if ($IsProduction -and $deployedIssuer -match 'Fake LE|STAGING|Lets Encrypt.*Staging|Let''s Encrypt.*Staging') {
        return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "The deployed certificate was issued by a staging authority ('$deployedIssuer') and this is a production run." -Summary 'Staging certificate on a production run.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'NetScaler certificate' -Strategy 'Deployed certificate no longer matches the request.'
    }

    # Only acted on when a CN can be read from the subject, so a SAN-only certificate is left alone.
    $deployedSubject = [string](Get-NSACMECertificateObjectValue -InputObject $NetScalerCertificate -Name @('subject', 'Subject'))
    if ($deployedSubject -match 'CN=(?<CommonName>[^,/]+)') {
        $deployedCommonName = $Matches.CommonName.Trim()
        if ($Request.CN -and $deployedCommonName -ne [string]$Request.CN) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "The deployed certificate is issued to '$deployedCommonName' but the request is for '$($Request.CN)'." -Summary 'Deployed certificate is for another name.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'NetScaler certificate' -Strategy 'Deployed certificate no longer matches the request.'
        }
    }

    if ($NetScalerCertificate -and $deployedStatus -and $deployedStatus -notmatch '^valid$') {
        return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "The NetScaler reports certkey status '$deployedStatus'." -Summary 'Certkey not valid on the NetScaler.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'NetScaler certificate' -Strategy 'Deployed certificate is unusable.'
    }

    $orderCertExpires = ConvertFrom-NSACMECertificateDateValue -Value (Get-NSACMECertificateObjectValue -InputObject $AcmeOrder -Name @('CertExpires', 'certexpires'))
    $orderRenewAfter = ConvertFrom-NSACMECertificateDateValue -Value (Get-NSACMECertificateObjectValue -InputObject $AcmeOrder -Name @('RenewAfter', 'renewafter'))

    # The deployed certificate is the only source that describes what is actually serving traffic,
    # so it decides whether a replacement is needed. ACME order metadata can still pull renewal
    # forward, but only when it belongs to that same certificate.
    if ($deployedValidity) {
        if ($now -ge $deployedValidity.NotAfter) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "The deployed certificate expired on $($deployedValidity.NotAfter.ToString('yyyy-MM-dd HH:mm:ss'))." -Summary 'Certificate expired.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'NetScaler certificate' -Strategy 'Deployed certificate validity.'
        }

        $deployedRenewAfter = $null
        if ($deployedValidity.NotBefore) {
            $deployedRenewAfter = Get-NSACMECertificateCalculatedRenewAfter -NotBefore $deployedValidity.NotBefore -NotAfter $deployedValidity.NotAfter
        }

        $orderDescribesDeployed = $orderCertExpires -and ([math]::Abs(($orderCertExpires - $deployedValidity.NotAfter).TotalMinutes) -le 1)
        if ($orderDescribesDeployed -and $orderRenewAfter -and $now -ge $orderRenewAfter) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "The ACME renewal window for the deployed certificate has started ($($orderRenewAfter.ToString('yyyy-MM-dd HH:mm:ss')))." -Summary 'Renewal window started.' -CertExpires $deployedValidity.NotAfter -RenewAfter $orderRenewAfter -Source 'ACME order' -Strategy 'ACME/Posh-ACME renewal metadata for the deployed certificate.'
        }

        if ($deployedRenewAfter) {
            $effectiveRenewAfter = if ($orderDescribesDeployed -and $orderRenewAfter -and $orderRenewAfter -lt $deployedRenewAfter) { $orderRenewAfter } else { $deployedRenewAfter }
            return Test-NSACMECertificateRenewalWindow -RenewAfter $effectiveRenewAfter -CertExpires $deployedValidity.NotAfter -Source 'NetScaler certificate' -Strategy 'Dynamic two-thirds certificate lifetime fallback.'
        }

        if ($orderDescribesDeployed -and $orderRenewAfter) {
            return Test-NSACMECertificateRenewalWindow -RenewAfter $orderRenewAfter -CertExpires $deployedValidity.NotAfter -Source 'ACME order' -Strategy 'ACME/Posh-ACME renewal metadata for the deployed certificate.'
        }
    }

    if ($orderRenewAfter) {
        return Test-NSACMECertificateRenewalWindow -RenewAfter $orderRenewAfter -CertExpires $orderCertExpires -Source 'ACME order' -Strategy 'ACME/Posh-ACME renewal metadata.'
    }

    $acmeValidity = Get-NSACMECertificateValidityWindow -InputObject $AcmeCertificate
    if ($acmeValidity -and $acmeValidity.NotBefore) {
        $calculatedRenewAfter = Get-NSACMECertificateCalculatedRenewAfter -NotBefore $acmeValidity.NotBefore -NotAfter $acmeValidity.NotAfter
        return Test-NSACMECertificateRenewalWindow -RenewAfter $calculatedRenewAfter -CertExpires $acmeValidity.NotAfter -Source 'ACME certificate' -Strategy 'Dynamic two-thirds certificate lifetime fallback.'
    }

    if ($renewAfter) {
        return Test-NSACMECertificateRenewalWindow -RenewAfter $renewAfter -CertExpires $certExpires -Source 'request metadata' -Strategy 'Legacy RenewAfter request metadata.'
    }

    if ($certExpires -and $now -ge $certExpires) {
        return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason "Certificate expired on $($certExpires.ToString('yyyy-MM-dd HH:mm:ss'))." -Summary 'Certificate expired.' -CertExpires $certExpires -RenewAfter $null -Source 'request metadata' -Strategy 'Legacy certificate expiry metadata.'
    }

    New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason 'No ACME renewal window or certificate validity metadata was available.' -Summary 'No reliable renewal metadata.' -CertExpires $certExpires -RenewAfter $null -Source 'none' -Strategy 'Renew when no safe skip decision can be made.'
}

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCv5Z6UKoLxYZo5
# 6y757iRYbZ837JGfaMkbn23yVbM3oKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgqvYp
# y9QMqpJYpJ7KqRRKZ4wvJ/eO7+jRNj7vjXdyzYowDQYJKoZIhvcNAQEBBQAEggGA
# Gp/FSbBE8Dja4lrrk8LfQkNbHgZUwmC81aLXYz+FpsBNm6zOn3i3RyC0kPIZg9v2
# cdNNtXsjWtIWuGWbUs9TpmAOIrciMMvK5Pplo2POU87beA9UG59RrDAO8D4Is2ze
# QXpSa058/JrlPj74qyDhAgH6pNXw8eaBXADozJfaM9d3TI9CnEgGmskhO3f10j/p
# ec+CZBAsQSN43Fse5jfe54H3K32QI72zEGpPIaLBFGBuX+YjoFQiEgfzpcq1mUcJ
# ce1jxMcNffG4F0wJGhxVOop1KaMSWm2Z/5Xe7HNRJZLvASVOmX9mEA6om4hApS5Y
# t20i4c3cpPbfzeogSMtmkix4zZNOS9hjco0J63bWLpJTaER+7Qh2XEpRLwQgKpME
# jIRMTi0ayZgrDTrsK8stuUEeGVXC0i1DkgCBaMi8Vxdx6ahbHBCxDBtFYGf+eDqo
# 9M2F8Lb0BF/ZzXIP0uQLaJOsFNVfV3itWSV0PxYEjyds8FWMWbGE5kJJp4tExC5a
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIMgscR0WxEcUuBqeM0fB
# pMWGDzhfjtJmVLndCDeyzDe6AgZqNTCDLswYEzIwMjYwODE3MTMwNjU1LjA5MVow
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
# IgQgxiC6CNkloz4LUVsXKXMUyse0JRfT2c8zDx5jZaRYZb0wgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCAgqtjeG80BojCocMwl
# 1STFmFHvyPwfAlK5TQwYKigjgjANBgkqhkiG9w0BAQsFAASCAgDsURxObrxIPi/A
# ai8WGghHbduEYRNbajsd6mygnC1tEKbYe48HXt1f7jPrJVM8qO4pz9/+yGRPGYO5
# ulWjQFcBG8x0XK9JXdVm8Qlj5BB3BK2uIcqBezDbz+IW6+wt3kZ6WdzMPJg4bWgq
# pbyilHkbqrYU9UaDFn8vOuKxeRF6tc9wNT3/ENzCzZm2zfaJXo4WXzZYaj02nlKq
# /kCWCNVsqbsZ99uoFqZwdYylum75Vxg3C23Y78j2nDsvP2JCW/MmfoohLcHjPapT
# fYXeL34o2Do//BW1IVCZMJuSkym8uuJ+/9uVYSXWyos4iswC3iOmDKXNUGv0MaSa
# B2kkCYHrAb7Kq95Uiz53vCTEJEvAEexIfXI9JlEWMajBPQ3mOSwJPSsi0MbZJb5a
# G8orxYq+vYUXElTK4m54YB+PyULZO7EgezyeK1wrUfXl1id4CUwOvomCa2rIIla7
# MLQ6tgQ6sMIgWfrTVJS4lVRHBKg8QsGx7ZMUav1IBIK0GqGG8hhJTAY6afs3GbyC
# RQAof/a2r3xOcKziXlEE9VBd2mjmDFI9aVszKygwrXd8xhjTE5Xi0vfqiGyRxG5O
# LkPIb1CN6M7+9SgtDaVwFWRxQaekXc6Uv6FROv+nW0sRqHYyrYEk9ZEH9Cd/37T1
# 83OFvR9ipbySMMblGs8rV/aZ+WCcEw==
# SIG # End signature block
