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
            return ([DateTimeOffset]::FromUnixTimeMilliseconds([int64]$Matches.Milliseconds)).LocalDateTime
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
            [string[]]$Reason,

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
            Reason         = (@($Reason) -join ' ')
            ReasonLines    = @($Reason)
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
            return New-NSACMECertificateRenewalDecision -ShouldRenew $false -Reason @('Certificate is still valid and outside the renewal window.', "Renewal can start after $($RenewAfter.ToString('yyyy-MM-dd HH:mm:ss')).", 'Use -ForceCertRenew (or -Force) to renew now.') -Summary 'Outside renewal window. Use -ForceCertRenew to renew now.' -CertExpires $CertExpires -RenewAfter $RenewAfter -Source $Source -Strategy $Strategy
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
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason @('Requested domains changed since the deployed certificate was issued.', "Was '$recordedDomains', now '$currentDomains'.") -Summary 'Requested domains changed.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'request definition' -Strategy 'Deployed certificate no longer matches the request.'
        }

        $recordedServer = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('LastIssuedAcmeServer'))
        if ($recordedServer -and $AcmeServer -and $recordedServer -ne $AcmeServer) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason @('The ACME server changed since the deployed certificate was issued.', "Was '$recordedServer', now '$AcmeServer'.") -Summary 'ACME server changed.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'request definition' -Strategy 'Deployed certificate no longer matches the request.'
        }

        $recordedKeyLength = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('LastIssuedKeyLength'))
        $currentKeyLength = [string](Get-NSACMECertificateObjectValue -InputObject $Request -Name @('KeyLength'))
        if ($recordedKeyLength -and $currentKeyLength -and $recordedKeyLength -ne $currentKeyLength) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason @('The requested key length changed since the deployed certificate was issued.', "Was '$recordedKeyLength', now '$currentKeyLength'.") -Summary 'Key length changed.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'request definition' -Strategy 'Deployed certificate no longer matches the request.'
        }
    }

    # A staging certificate can be inside its validity window and still be wrong for a production run.
    if ($IsProduction -and $deployedIssuer -match 'Fake LE|STAGING|Lets Encrypt.*Staging|Let''s Encrypt.*Staging') {
        return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason @('The deployed certificate was issued by a staging authority and this is a production run.', "Issuer: $deployedIssuer.") -Summary 'Staging certificate on a production run.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'NetScaler certificate' -Strategy 'Deployed certificate no longer matches the request.'
    }

    # Only acted on when a CN can be read from the subject, so a SAN-only certificate is left alone.
    $deployedSubject = [string](Get-NSACMECertificateObjectValue -InputObject $NetScalerCertificate -Name @('subject', 'Subject'))
    if ($deployedSubject -match 'CN=(?<CommonName>[^,/]+)') {
        $deployedCommonName = $Matches.CommonName.Trim()
        if ($Request.CN -and $deployedCommonName -ne [string]$Request.CN) {
            return New-NSACMECertificateRenewalDecision -ShouldRenew $true -Reason @('The deployed certificate is issued to a different name than the request.', "Certificate '$deployedCommonName', request '$($Request.CN)'.") -Summary 'Deployed certificate is for another name.' -CertExpires $deployedValidity.NotAfter -RenewAfter $null -Source 'NetScaler certificate' -Strategy 'Deployed certificate no longer matches the request.'
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
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAUD9z1290jb9Ls
# kiTUfBka8AqvbGyQKiTDkxL9jEubVaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAU7VEGo
# lx23RKiXAAAABTtUMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYwODIyMjAzOTQ3WhcNMjYwODI1
# MjAzOTQ3WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAhsdohjvxG6ieFsDfsRL5MY2W
# DacAjM9Gu4JlNDTDjN+M2/NPylPinGzAYtdahZv0H07D6xRGHh/a13IGRr1lJkjF
# dr57yFEnFIUhGvlWqrgWere4fXlesr+DRP5+qKZo+hUj/qz+1zZ3O2AXx7lDHTKY
# RIlqI0n0ROUJiS+gWnB9o4frvFjmM+NZ6v6MXv3Uftqb0XxM7I5vzgTO1jMLLyw6
# yuRIk5N+uzjniFdzDRSOLy0Ii5PITJVXRC+jDUBhAyp4I89KDh56ROUSjkroi0Eq
# yoGYU4X4ic1DmBJz1jIzC0xZiSr9ktJzL+D6WO9e1IhaD4gwGt5XU84oAkMR300i
# YN1rkf7vXD3IOmgX3JVkG7awDjn4ljPPHce/mge7vpZwmChLfyyMy+AAN/jYtoYP
# luVJEac7Evb2SzoRuqQWJcsA51EcImRxF6zuuSUgqbxUyixpWpFXGOYSzwZpMhPy
# vuNwNBAVA8YxQEfN3pUQzunbhzMmUEk9Jcj0AddvAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# vG6fUuRN3JHAKzu9tZUsxqMfZuEwHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAJX0
# 7v1xFsUfJqEuQpSMqFHYvSKiFe3D5/skVk1vya8w837tXtrEcnUTwAVgh+/we92R
# HRRewEkZyP66sv5iDuu6BrpgTio5KxyjTSpgYkZ3OsI0N2gSMxeDlHgUlFv1h6FX
# Nf/S/MkqwtIONAUC/WqYVxcc5T/+0ZDkfWcIUKKV32CvaMdXAIRJ9ckNqpKL9tog
# gCWINkvxaP6C1Kgi0nXUUGUyrkhTN0GARPqjOL3JjPem0M0oLurq/rlLUBCkRe55
# jB/9DnVQPOBO4XS1XbshwD8U3qKyVwFb7nL1HQahl5ewaCPE0Y5VroYfO2Mr9tCQ
# s0H1Ou3+HZMY6Ec4V9Z3gDzHsYEU6mOuqair6b7Rzr4/3lLYe6/5xf5uvnKJa8BD
# QPu4jUMTEtwb+j3/jM4b/xpckNmnzFzTOGvjumeSW3Pl58qL9tS4GeWbK+u3qD4c
# Kjk9ei9r3gtfonM5T9m+PqlTehNdBHGiUMx00ZvjH8C1GrHGxjRIZ6gCqRYRw9bY
# d2wN+GPKbLLgaPOevH0u+DvTwh9njmALiXrrxjBd6YGwNGSrkFndylNqLUQQqcSt
# FHBx6iJFl9DF/ozjQE0HS8RphbSEnbw+Szk94cdjbOQE7cs/T8Y/GgOQFRZTBFap
# QEDmijvqq2LdAXKwal9Sc3wEXw81HxJfnGycGLWGMIIGwDCCBKigAwIBAgITMwAF
# O1RBqJcdt0SolwAAAAU7VDANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MDgyMjIwMzk0N1oXDTI2
# MDgyNTIwMzk0N1owgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAIbHaIY78RuonhbA37ES
# +TGNlg2nAIzPRruCZTQ0w4zfjNvzT8pT4pxswGLXWoWb9B9Ow+sURh4f2tdyBka9
# ZSZIxXa+e8hRJxSFIRr5Vqq4Fnq3uH15XrK/g0T+fqimaPoVI/6s/tc2dztgF8e5
# Qx0ymESJaiNJ9ETlCYkvoFpwfaOH67xY5jPjWer+jF791H7am9F8TOyOb84EztYz
# Cy8sOsrkSJOTfrs454hXcw0Uji8tCIuTyEyVV0Qvow1AYQMqeCPPSg4eekTlEo5K
# 6ItBKsqBmFOF+InNQ5gSc9YyMwtMWYkq/ZLScy/g+ljvXtSIWg+IMBreV1POKAJD
# Ed9NImDda5H+71w9yDpoF9yVZBu2sA45+JYzzx3Hv5oHu76WcJgoS38sjMvgADf4
# 2LaGD5blSRGnOxL29ks6EbqkFiXLAOdRHCJkcRes7rklIKm8VMosaVqRVxjmEs8G
# aTIT8r7jcDQQFQPGMUBHzd6VEM7p24czJlBJPSXI9AHXbwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFLxun1LkTdyRwCs7vbWVLMajH2bhMB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQCV9O79cRbFHyahLkKUjKhR2L0iohXtw+f7JFZNb8mvMPN+7V7axHJ1E8AFYIfv
# 8HvdkR0UXsBJGcj+urL+Yg7ruga6YE4qOSsco00qYGJGdzrCNDdoEjMXg5R4FJRb
# 9YehVzX/0vzJKsLSDjQFAv1qmFcXHOU//tGQ5H1nCFCild9gr2jHVwCESfXJDaqS
# i/baIIAliDZL8Wj+gtSoItJ11FBlMq5IUzdBgET6ozi9yYz3ptDNKC7q6v65S1AQ
# pEXueYwf/Q51UDzgTuF0tV27IcA/FN6islcBW+5y9R0GoZeXsGgjxNGOVa6GHztj
# K/bQkLNB9Trt/h2TGOhHOFfWd4A8x7GBFOpjrqmoq+m+0c6+P95S2Huv+cX+br5y
# iWvAQ0D7uI1DExLcG/o9/4zOG/8aXJDZp8xc0zhr47pnkltz5efKi/bUuBnlmyvr
# t6g+HCo5PXova94LX6JzOU/Zvj6pU3oTXQRxolDMdNGb4x/AtRqxxsY0SGeoAqkW
# EcPW2HdsDfhjymyy4Gjznrx9Lvg708IfZ45gC4l668YwXemBsDRkq5BZ3cpTai1E
# EKnErRRwceoiRZfQxf6M40BNB0vEaYW0hJ28Pks5PeHHY2zkBO3LP0/GPxoDkBUW
# UwRWqUBA5oo76qti3QFysGpfUnN8BF8PNR8SX5xsnBi1hjCCBygwggUQoAMCAQIC
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
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcyMIIXLgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMABTtU
# QaiXHbdEqJcAAAAFO1QwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgToWy
# 5D5HObEHE+VX+h/wpNCYjgoyyn74m9W6x48MP2UwDQYJKoZIhvcNAQEBBQAEggGA
# J/1FBlO1CNINSEUz5KGiadHtYBFlT9fu6dXfS+VieQQvj85pEMWwdKsXKrVIQUeW
# dsNQdrQCsDF3HjcpwoMZjM1lT1cXu/KMIZKDLyVXxhpRebw/gAqHdoVQQ1fn2PHa
# hx+x+2TqjELP0qHGjw01q5kXS67ocO27TyWlFL8xJ4b5WKBJ3lDAKrjiaTQbMMWg
# Rzoaajm6a3u3oCIRZVgBeV5oBIrLCApXUw9xAefCbzEsWF9dQlVfFHU98n99ct1D
# ytCwdivE9Fjuh1k5c99uwS2b6MbZzlyP0IfgJiSGVtJrS36zB397sX3Xt/C73UKn
# r00lsUMYVCimH9DG2K9D2VW70Lpunx9odfi7ZBs/XYSoK17N9+LEkplwlUebhzvK
# +dUlERSyT2CtA2ULHnP7BMxJLCPZhDetWj/IlEU8GQ0gftx/pRNjXcTVonud9S+E
# 1fWEjVU+sAzFr8wZVxkUad3a9Xsyc0/5MbZ9GzNrtB9Pjq6uYUGysMqqryy5lr01
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIHjVXfCgirq7og7UkDv1
# vkxn+nlqHLn0mENYx6ZDNuUoAgZqg90gJQAYEzIwMjYwODI0MTc1NzEwLjAwOFow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYD
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
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAW0q1jUEybdx0AAAAAABbMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwNVoXDTI3MDEwNzE4NTkwNVow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAJBUzBbbnlDXee0B0KD5G4/475thFyfctCyu
# ESTWQXvlLi4Wx/td2qUdeq4ideeg6VWhiOHfu3wJV4TUGSRtqh9Ccr1BmiBKv9iu
# FpgHyIBu5Qx38ZsxwlFeXVS+ZqJJKnXRbDNQdcYSoC/6c0hQJ/PH50DBRDQkPXVw
# yFizLrRH9AlrJeUg7BKeT23zftS8/KOJLvEEbHOF6pSOY3ZVprZUWbWjWwRTmoHa
# Q/E8vrWtLNyEJ+b089VW1Ikra3t4GTB5Wby3CL1K2zYnAxBIvafsKMFyj9OuXHcT
# PKMDoFSMeamG9MKOMb6uoG1PjdnDgsLP6EOMRSzrLL7jED1mbB9RSd9fhty+HQr6
# vZgsBn6oUy+YTpNVLskwdtUM82WYAkPztlOt3AiL0qyV7/U3j/uq3vHMjPM0w034
# 0M57Nei0g4BCcMt0dbqoc91VgCb3/36sHQANontn1HOF2oLk8190QRS43isHVra8
# H8sf5+GlqIYsYiCKX04HZiOzZW826nVI6d++8lyTeWmpj90Ua9uPbJhVjwE3oh6t
# O510ySqmSMSLEN07p3Ibe3E6BAb2w93rWzb26+dpSthbKF4kApofqBsWPX4MEtHK
# SOftPmVTCQ47tghrVuHia9jY+Hsj01m4KW4WtkmVm3L6hMZECMa4sjMxAXz+bX/A
# JhWTe6TZAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQU7/LqUlWWYhXJdXwgYKx4b8Gv
# 0rYwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQAAH+zd+XKh4OxXYMWFmtgilXAQGctOjCUB1w/uBiC/OXcH
# 3Ia4/XbdUhKzFbaiTbIE6vYZKd1p4u7nKOLkawymAMVyuO7LSl6rLKttZIyLhWjT
# K0zXOz0u4xLq9+bRtBEKJvA6sD5nJwH1IO6z1YizyuIRoalMCnbrUixfWxQn4TAm
# N7t9uk+X2FUThEa3ewzRwhtG+xwaAbLMkxRmR24JnfXd1VxKo90+m7Wzuov96Uug
# x5wZdewiIIm1ZWTj4lCJHup679LcOa7tAxJMipVaSltQH9fm9TOKczlfxtWuBcLU
# 4duZfqwgsILsH7PMkcX1zwQzQD0yAtPhnYz9KNG125bX+iilOe1S8RHqv2bbBpMp
# ao4kcUvQI6dMgKRvFmm1eLbhSNOQplDMTGD1tNVdNGkI96jUu+troUjWMMi46TQf
# BAHxtDTpRhIu/87vAVQ8Z6RHhFxesz4Ed5JThaIQRAy6GcO/Jk+QzDzoZ0arRIkI
# sGJ7rZgOVAjx9ctfw8lH9RfjcwB3wdGBYNMNVJqQpUai2Taddf5pXzTZEHIqLEF5
# 3SrBjIeInoQrP7U5VlXiMQsxewLdINrAE2l2TR3KBikb+RQRygbTp8jj2yiC0NCU
# wG+K+ndglN5RMbXjFW6aKa59Xq+b8XzK/DK+AJtgOpHgJv8Qrk62A+twOVLOpjGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABbSrWNQTJt3HQAAAAAAFswDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQg9mc9beA3sCWd/2+ev+McO8M8f0wIVYJmpbWyRft701wwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCAvMQNVXZ0b0xxlGw8X/3IEybObuT6a5W1d61CW+cGD
# 7zB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzAiBCBlRHXwUZVxwivPk9dG
# iVcSmvge/0wT8CuN4lHY5JBEzzANBgkqhkiG9w0BAQsFAASCAgAu39ue3YxY58x4
# Xu0t0CTK4pB1Vzb+eDWqd/RL6Vg48UpmmPtD8zpl2I6qF6v78gqKNYj65AasSl9g
# SD7eH45b+EWQw9spIxSnBWwVykgx3FPzk+RrTQ+Tj7Fzj7wrAuMQYOTMNJW8dmsT
# fHrvYlo7yATOSA5lHifLIJsn/5UatnTMVx4wjHYyEz5VdQYOunzHq8+7JjnjSBLy
# 8KD6EtPZiaEHrdog5arEAnZSE8Cy4CovfsD2C7eFLIkVYnUbndImaiJZIy10easm
# ql9bMztGw3n3IfYTAmUJkmi6lnnJGFVoZE/es4Cu3DgLYnIK8NKgVRkPMFOwhDKw
# OLowDTp2Q8BLt0wc5S7v2AxLgpLFKC+uTL2tQA+BA8Jnqq7CWHeVwws3kIAJZW+I
# UvDRzde2kSF/pY/rlRk4CHK0ZsZPtoq8FT8bMzOWtmkfazbi2O1Pmra9FlQAsC2m
# MNaYtcCur2LKXrBsGUX3v/hNJHefl8KJVdo05vQmC49DaP6zPZ+YvObXCVwwaiRP
# P2X6yCUZU5B7iI6UGse8JYhRWGWhKXiHKWjOqJxAzNYXevaAqg6qtX8NFpDUFi4x
# mZ91glN3OYhzzpRHHBztPAuT0T9J4FImV0jzU0WwkEAxFoo0jDm7KLsTx2f3Qig2
# eybjPRkJsJOxpCABVMQ0szaYdYmGoA==
# SIG # End signature block
