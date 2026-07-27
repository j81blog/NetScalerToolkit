function New-NSACMECertificateUser {
    <#
    .SYNOPSIS
        Creates or updates a NetScaler user for certificate automation.

    .DESCRIPTION
        Creates the limited command policies used by Request-NSACMECertificate and,
        optionally, creates or updates a NetScaler system user and binds those
        policies to the user. This is the module replacement for the legacy
        GenLeCertForNS -CreateUserPermissions and -CreateApiUser bootstrap path.

        The function is idempotent. Existing command policies are updated with the
        current command specification, existing users are updated when ApiPassword is
        provided, and missing policy bindings are added.

    .PARAMETER Session
        Existing NetScaler session returned by Connect-NSNode.

    .PARAMETER ManagementURL
        NetScaler management URL. Used when Session is not supplied.

    .PARAMETER Credential
        Credential used to connect when Session is not supplied.

    .PARAMETER SkipCertificateCheck
        Skips TLS certificate validation when connecting to the NetScaler.

    .PARAMETER PolicyName
        Base name for the three command policies. The effective base is truncated to
        24 characters when needed so the suffixed policy names stay within NetScaler
        limits. Alias: NSCPName.

    .PARAMETER ApiUsername
        Optional NetScaler system user to create or update.

    .PARAMETER ApiPassword
        Password for ApiUsername. Accepts plain text, SecureString, PSCredential, or
        legacy GenLeCertForNS secret objects.

    .PARAMETER CsVipName
        Content switching vServers that the generated command policy should permit.
        Required unless UseLbVip is used.

    .PARAMETER UseLbVip
        Indicates that HTTP validation uses an existing load balancing vServer instead
        of content switching vServers.

    .PARAMETER LbName
        Load balancing vServer name used by HTTP validation.

    .PARAMETER SvcName
        Service name used by HTTP validation.

    .PARAMETER RspName
        Responder policy name prefix.

    .PARAMETER RsaName
        Responder action name prefix.

    .PARAMETER CspName
        Content switching policy name.

    .PARAMETER CsaName
        Content switching action name.

    .PARAMETER EnableVipBefore
        Adds enable permission for configured CS vServers.

    .PARAMETER DisableVipAfter
        Adds disable permission for configured CS vServers.

    .PARAMETER UseNetScalerDNS
        Adds DNS TXT record permissions for NetScaler-hosted DNS validation.

    .PARAMETER UpdateGlobalVPNCertBinding
        Adds VPN global binding permissions.

    .PARAMETER Partitions
        Optional NetScaler partitions to bind to the created user. Partition command
        policy permissions are included when non-default partitions are specified.

    .PARAMETER PruneExistingPolicyBindings
        Removes command policy bindings from ApiUsername that do not match the three
        generated policies or have the wrong priority.

    .PARAMETER SaveADCConfig
        Saves the NetScaler configuration after changes.

    .PARAMETER PassThru
        Returns a result object.

    .EXAMPLE
        PS C:\> New-NSACMECertificateUser -ManagementURL https://adc.example.com -Credential (Get-Credential) -PolicyName script-GenLeCertForNS -CsVipName cs_example_http -ApiUsername GenLEUser -ApiPassword 'P@ssw0rd!' -SaveADCConfig

        Creates or updates the certificate automation policies, creates/updates
        GenLEUser, binds the policies, and saves the ADC configuration.

    .NOTES
        Function  : New-NSACMECertificateUser
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.0526.0001

    .LINK
        https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate-user/new/

    .LINK
        https://netscalertoolkit.j81.nl/
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium', DefaultParameterSetName = 'Connect')]
    param(
        [Parameter(ParameterSetName = 'Session', Mandatory)]
        [object]$Session,

        [Parameter(ParameterSetName = 'Connect', Mandatory)]
        [Alias('URL', 'NSManagementURL')]
        [string]$ManagementURL,

        [Parameter(ParameterSetName = 'Connect', Mandatory)]
        [Alias('NSCredential', 'ADCCredential')]
        [System.Management.Automation.PSCredential]$Credential,

        [Alias('NSCPName')]
        [string]$PolicyName = 'script-GenLeCertForNS',

        [string]$ApiUsername,

        [object]$ApiPassword,

        [Alias('NSCsVipName')]
        [string[]]$CsVipName,

        [switch]$UseLbVip,

        [Alias('NSLbName')]
        [string]$LbName = 'lb_letsencrypt_cert',

        [Alias('NSSvcName')]
        [string]$SvcName = 'svc_letsencrypt_cert_dummy',

        [Alias('NSRspName')]
        [string]$RspName = 'rsp_letsencrypt',

        [Alias('NSRsaName')]
        [string]$RsaName = 'rsa_letsencrypt',

        [Alias('NSCspName')]
        [string]$CspName = 'csp_letsencrypt',

        [string]$CsaName = 'csa_letsencrypt',

        [switch]$EnableVipBefore,

        [switch]$DisableVipAfter,

        [switch]$UseNetScalerDNS,

        [switch]$UpdateGlobalVPNCertBinding,

        [string[]]$Partitions = @('default'),

        [switch]$PruneExistingPolicyBindings,

        [Alias('SaveNSConfig')]
        [switch]$SaveADCConfig,

        [Parameter(ParameterSetName = 'Connect')]
        [switch]$SkipCertificateCheck,

        [switch]$PassThru
    )

    process {
        if (-not $UseLbVip -and (-not $CsVipName -or @($CsVipName).Count -lt 1)) {
            throw 'CsVipName is required when creating request-certificate user permissions unless UseLbVip is specified.'
        }

        if (-not $Session) {
            $normalizedUrl = ([string]$ManagementURL).TrimEnd('/') + '/'
            $Session = Connect-NSNode -ManagementURL $normalizedUrl -Credential $Credential -SkipCertificateCheck:$SkipCertificateCheck -HA -PassThru -ErrorAction Stop
            if ($Session.IsHA -and -not $Session.IsPrimary) {
                throw "Connected NetScaler HA session is '$($Session.ConnectedNodeState)', expected Primary."
            }
        }

        $effectivePolicyBase = if ($PolicyName.Length -ge 24) { $PolicyName.Substring(0, 24) } else { $PolicyName }
        $csVipExtraActions = ''
        if ($EnableVipBefore) { $csVipExtraActions += '|enable' }
        if ($DisableVipAfter) { $csVipExtraActions += '|disable' }

        $csVipString = ''
        if (-not $UseLbVip) {
            foreach ($vipName in @($CsVipName | Where-Object { $_ })) {
                $escapedVip = [regex]::Escape($vipName)
                $escapedCsp = [regex]::Escape($CspName)
                $escapedCsa = [regex]::Escape($CsaName)
                $csVipString += "|(^(set|show|bind|unbind$csVipExtraActions)\s+cs\s+vserver(\s+$escapedVip.*))|(^\S+\s+cs\s+(policy\s+$escapedCsp|action\s+$escapedCsa).*)"
            }
        }

        $cmdSpec = [ordered]@{
            Basics = "(^show\s+ns\s+license)|(^show\s+ns\s+license\s+.*)|(^(create|show)\s+system\s+backup)|(^(create|show)\s+system\s+backup\s+.*)|(^convert\s+ssl\s+pkcs12)|(^show\s+ns\s+feature)|(^show\s+ns\s+feature\s+.*)|(^show\s+responder\s+action)|(^show\s+responder\s+policy)|(^(show|add|rm)\s+system\s+file.*-fileLocation.*nsconfig.*ssl.*)|(^show\s+ssl\s+certKey)|(^(add|link|unlink|update)\s+ssl\s+certKey\s+.*)|(^show\s+HA\s+node)|(^show\s+HA\s+node\s+.*)|(^(save|show)\s+ns\s+config)|(^(save|show)\s+ns\s+config\s+.*)|(^show\s+ns\s+trafficDomain)|(^show\s+ns\s+trafficDomain\s+.*)|(^show\s+ssl\s+certChain)|(^show\s+ssl\s+certChain\s+.*)|(^add\s+ssl\s+certificateChain)|(^add\s+ssl\s+certificateChain\s+.*)|(^show\s+ssl\s+certificateChain)|(^show\s+ssl\s+certificateChain\s+.*)|(^show\s+ssl\s+certLink)|(^show\s+ssl\s+certLink\s+.*)"
            LEBkEd = "(^show\s+ns\s+version)|(^\S+\s+Service\s+$([regex]::Escape($SvcName)).*)|(^\S+\s+lb\s+vserver\s+$([regex]::Escape($LbName)).*)|(^\S+\s+responder\s+action\s+$([regex]::Escape($RsaName)).*)|(^\S+\s+responder\s+policy\s+$([regex]::Escape($RspName)).*)"
            LEFtEd = "(^show\s+ns\s+version)$csVipString"
        }
        $cmdSpecPriority = @{
            Basics = 10
            LEBkEd = 20
            LEFtEd = 30
        }
        if ($UseNetScalerDNS) {
            $cmdSpec['LEFtEd'] += "|(^\S+\s+dns\s+txtRec)|(^\S+\s+dns\s+txtRec\s+.*)"
        }
        if ($UpdateGlobalVPNCertBinding) {
            $cmdSpec['LEBkEd'] += "|(^\S+\s+vpn\s+global)|(^\S+\s+vpn\s+global\s+.*)"
        }
        if (@($Partitions | Where-Object { $_ -and $_ -ne 'default' }).Count -gt 0) {
            $cmdSpec['Basics'] += "|(^(show|switch)\s+ns\s+partition)|(^(show|switch)\s+ns\s+partition\s+.*)"
        }

        $policyResults = @()
        foreach ($item in $cmdSpec.GetEnumerator()) {
            $itemPolicyName = "$effectivePolicyBase-$($item.Name)"
            $existing = Invoke-NSGetSystemCmdPolicy -Session $Session -PolicyName $itemPolicyName -ReturnNullOnNotFound -ErrorAction Stop

            if ($existing) {
                if ($PSCmdlet.ShouldProcess($itemPolicyName, 'Update NetScaler system command policy')) {
                    Invoke-NSUpdateSystemCmdPolicy -Session $Session -PolicyName $itemPolicyName -Action 'ALLOW' -CmdSpec $item.Value | Out-Null
                }
                $policyResults += [pscustomobject]@{ PolicyName = $itemPolicyName; Priority = $cmdSpecPriority[$item.Name]; Action = 'Updated' }
            } else {
                if ($PSCmdlet.ShouldProcess($itemPolicyName, 'Create NetScaler system command policy')) {
                    Invoke-NSAddSystemCmdPolicy -Session $Session -PolicyName $itemPolicyName -Action 'ALLOW' -CmdSpec $item.Value | Out-Null
                }
                $policyResults += [pscustomobject]@{ PolicyName = $itemPolicyName; Priority = $cmdSpecPriority[$item.Name]; Action = 'Created' }
            }
        }

        $userResult = $null
        $bindingResults = @()
        if ($ApiUsername) {
            if (-not $ApiPassword) { throw 'ApiPassword is required when ApiUsername is specified.' }
            $apiPasswordText = ConvertFrom-NSACMECertificateLegacySecret -Object $ApiPassword -AsClearText
            $existingUser = Invoke-NSGetSystemUser -Session $Session -Username $ApiUsername -ReturnNullOnNotFound -ErrorAction Stop

            if ($existingUser) {
                if ($PSCmdlet.ShouldProcess($ApiUsername, 'Update NetScaler system user')) {
                    try {
                        Invoke-NSUpdateSystemUser -Session $Session -Username $ApiUsername -Password $apiPasswordText -Externalauth 'DISABLED' -Allowedmanagementinterface @('API') | Out-Null
                    } catch {
                        Invoke-NSUpdateSystemUser -Session $Session -Username $ApiUsername -Password $apiPasswordText -Externalauth 'DISABLED' | Out-Null
                    }
                }
                $userResult = [pscustomobject]@{ Username = $ApiUsername; Action = 'Updated' }
            } else {
                if ($PSCmdlet.ShouldProcess($ApiUsername, 'Create NetScaler system user')) {
                    Invoke-NSAddSystemUser -Session $Session -Username $ApiUsername -Password $apiPasswordText -Externalauth 'DISABLED' | Out-Null
                    try {
                        Invoke-NSUpdateSystemUser -Session $Session -Username $ApiUsername -Externalauth 'DISABLED' -Allowedmanagementinterface @('API') | Out-Null
                    } catch {
                        Write-Verbose "Could not restrict allowed management interface to API: $($_.Exception.Message)"
                    }
                }
                $userResult = [pscustomobject]@{ Username = $ApiUsername; Action = 'Created' }
            }

            $existingBindings = @()
            $bindingResponse = Invoke-NSGetSystemUserSystemCmdPolicyBinding -Session $Session -Username $ApiUsername -ReturnNullOnNotFound -ErrorAction Stop
            $existingBindings = @($bindingResponse)

            $expectedNames = @($policyResults.PolicyName)
            if ($PruneExistingPolicyBindings) {
                $bindingsToRemove = @($existingBindings | Where-Object {
                        $bindingPolicyName = $_.policyname
                        $expectedPolicy = $policyResults | Where-Object { $_.PolicyName -eq $bindingPolicyName } | Select-Object -First 1
                        ($_.policyname -notin $expectedNames) -or
                        ($_.policyname -in $expectedNames -and $expectedPolicy -and [int]$_.priority -ne [int]$expectedPolicy.Priority)
                    })
                foreach ($binding in $bindingsToRemove) {
                    if ($PSCmdlet.ShouldProcess("$ApiUsername/$($binding.policyname)", 'Remove NetScaler system user command policy binding')) {
                        Invoke-NSDeleteSystemUserSystemCmdPolicyBinding -Session $Session -Username $ApiUsername -Policyname $binding.policyname | Out-Null
                    }
                    $bindingResults += [pscustomobject]@{ Username = $ApiUsername; PolicyName = $binding.policyname; Priority = $binding.priority; Action = 'Removed' }
                }
                if ($bindingsToRemove.Count -gt 0) {
                    $bindingResponse = Invoke-NSGetSystemUserSystemCmdPolicyBinding -Session $Session -Username $ApiUsername -ReturnNullOnNotFound -ErrorAction Stop
                    $existingBindings = @($bindingResponse)
                }
            }

            foreach ($policy in $policyResults) {
                $present = @($existingBindings | Where-Object { $_.policyname -ieq $policy.PolicyName -and [int]$_.priority -eq [int]$policy.Priority }).Count -gt 0
                if ($present) {
                    $bindingResults += [pscustomobject]@{ Username = $ApiUsername; PolicyName = $policy.PolicyName; Priority = $policy.Priority; Action = 'Present' }
                } else {
                    if ($PSCmdlet.ShouldProcess("$ApiUsername/$($policy.PolicyName)", 'Create NetScaler system user command policy binding')) {
                        Invoke-NSAddSystemUserSystemCmdPolicyBinding -Session $Session -Username $ApiUsername -Policyname $policy.PolicyName -Priority ([double]$policy.Priority) | Out-Null
                    }
                    $bindingResults += [pscustomobject]@{ Username = $ApiUsername; PolicyName = $policy.PolicyName; Priority = $policy.Priority; Action = 'Bound' }
                }
            }

            foreach ($partition in @($Partitions | Where-Object { $_ -and $_ -ne 'default' })) {
                try {
                    $partitionBindings = Invoke-NSGetSystemUserNSPartitionBinding -Session $Session -Username $ApiUsername -ErrorAction Stop
                    $partitionPresent = @($partitionBindings | Where-Object { $_.partitionname -eq $partition }).Count -gt 0
                    if (-not $partitionPresent -and $PSCmdlet.ShouldProcess("$ApiUsername/$partition", 'Create NetScaler system user partition binding')) {
                        Invoke-NSAddSystemUserNSPartitionBinding -Session $Session -Username $ApiUsername -Partitionname $partition | Out-Null
                    }
                } catch {
                    Write-Warning "Could not bind partition '$partition' to '$ApiUsername': $($_.Exception.Message)"
                }
            }
        }

        if ($SaveADCConfig) {
            if ($PSCmdlet.ShouldProcess('nsconfig', 'Save NetScaler configuration')) {
                Invoke-NSSaveNSConfig -Session $Session | Out-Null
            }
        }

        $result = [pscustomobject]@{
            PolicyBase       = $effectivePolicyBase
            Policies         = $policyResults
            User             = $userResult
            PolicyBindings   = $bindingResults
            SaveADCConfig    = [bool]$SaveADCConfig
            PrunedBindings   = [bool]$PruneExistingPolicyBindings
        }

        if ($PassThru) { return $result }
        return $result
    }
}

# SIG # Begin signature block
# MII6AQYJKoZIhvcNAQcCoII58jCCOe4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBq+9X0PD59Hu6u
# ++T3MB3g5jqAZJiMKuxmOvR9FfZ9EKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAOxfsGE
# dAui3IWtAAAAA7F+MA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYwNzI1MTkyNjEwWhcNMjYwNzI4
# MTkyNjEwWjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAoVDcAOz6TalWG9vfNlA6qVCD
# mLVli6Uc0fGG8EYUEtFVVtMWj2XauPbRgJ5oJxZpyvJb7jIWhZOjLHB8u/nDaJ77
# HsqfjiBgteEkOqZaMd2Lc7bn/cJU51jf0/folLa7iEfwlIukDrNBgpwTVJuPLbTQ
# 4hZDA+xFCZN8RikowtnrlQjN9gNn5Oh6jgPou7cz5AkfdWpj5Rp4NGV0cctYt6da
# uE/Wa5B1Q/NB8Zz2C2o3bmJ/fYeBwnuMVrhaeff6lBykWH6fixbw/FHECpGxgxBe
# jU0yFvhoO+SpDlIaejRq4IIxyeUHJNrTE8Mk8nU+T7x4i27MNHwsVvPn5vdozRhB
# JNR9eg1j/RzwhqZ3SoRuV2ne26xhG9UJw/2bv9rDdaBf2GP6nyKf+FmdFyCb1Y2D
# yygS3t/5FptjNcceOUIQZSpcjXJ/HJnnfdbCURshMzHhQ4mUzFuJLZtNiBFQ3uop
# E80PvLmNSA9sEyjXd4nyUm2SKfqpwyq7H+TMQs4DAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# rDk4FlKL6gGHF9FRtMEug2P8gT0wHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAMA0
# 8eOioaqDx9G96lr+ahHtFnpfHg0df91iir8LIKh7IguajVeIgFiOWOjYLWpFpRe+
# fMzvj5duooOeZChlHXFJVouSI0n3ooqmSakikUoVL8NJ4QHmppscUO7KaPzcVyyS
# Anq1LL7sfC3Z4sk2a0iFriXc90EcJ+StLU96tUUeJps15d0m5HRe+VQ0WmjepIrH
# H8kPYNDMtpxyMu5LvJdKDS02RdK4ZM0yvoMx70LdRuRAuNCUze3JovLjv4jprp/A
# BgEfMvE5Au7PMQEgAL50FM8jREQRtHWl9xaQFJwEgo62XQ1SVC3MKTc2SGb3Qke+
# re5a1KCRa6QOEof6F0fX6IDP1Mc9iRzdUdnZZ9Lu6OBsG/3j8LC6GVXePMcbogM9
# /oVizBQXwrAMCZEhwoGCQmxM18pRW1/Dq68I0dWCiIptqZE/fz2XrrvJktn/evdN
# EvlUk7cbsw0Aeeoy+8ju5N5jY98R4v44oUAkAhT7HvrU0k5dISUhNVHJbmjSEPWk
# 2K/sEYAEZAMfuK4KqTN3pSFNQttSdZs/3pqOtK+UW/tOWYO8hGskOwoo9MhxvYIK
# 9UaUyDcO0Fz7QBzO3DIZJMEY5jllHy1YH5ZZ8/Kmy7l0v2xuTMsVi1JN1laH8/R6
# TCSMIjo+8TJhm2VpA+PzG/wjcBbgSPYMLBiVSKH+MIIGwDCCBKigAwIBAgITMwAD
# sX7BhHQLotyFrQAAAAOxfjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MDcyNTE5MjYxMFoXDTI2
# MDcyODE5MjYxMFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAKFQ3ADs+k2pVhvb3zZQ
# OqlQg5i1ZYulHNHxhvBGFBLRVVbTFo9l2rj20YCeaCcWacryW+4yFoWToyxwfLv5
# w2ie+x7Kn44gYLXhJDqmWjHdi3O25/3CVOdY39P36JS2u4hH8JSLpA6zQYKcE1Sb
# jy200OIWQwPsRQmTfEYpKMLZ65UIzfYDZ+Toeo4D6Lu3M+QJH3VqY+UaeDRldHHL
# WLenWrhP1muQdUPzQfGc9gtqN25if32HgcJ7jFa4Wnn3+pQcpFh+n4sW8PxRxAqR
# sYMQXo1NMhb4aDvkqQ5SGno0auCCMcnlByTa0xPDJPJ1Pk+8eItuzDR8LFbz5+b3
# aM0YQSTUfXoNY/0c8Iamd0qEbldp3tusYRvVCcP9m7/aw3WgX9hj+p8in/hZnRcg
# m9WNg8soEt7f+RabYzXHHjlCEGUqXI1yfxyZ533WwlEbITMx4UOJlMxbiS2bTYgR
# UN7qKRPND7y5jUgPbBMo13eJ8lJtkin6qcMqux/kzELOAwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFKw5OBZSi+oBhxfRUbTBLoNj/IE9MB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQDANPHjoqGqg8fRvepa/moR7RZ6Xx4NHX/dYoq/CyCoeyILmo1XiIBYjljo2C1q
# RaUXvnzM74+XbqKDnmQoZR1xSVaLkiNJ96KKpkmpIpFKFS/DSeEB5qabHFDuymj8
# 3FcskgJ6tSy+7Hwt2eLJNmtIha4l3PdBHCfkrS1PerVFHiabNeXdJuR0XvlUNFpo
# 3qSKxx/JD2DQzLaccjLuS7yXSg0tNkXSuGTNMr6DMe9C3UbkQLjQlM3tyaLy47+I
# 6a6fwAYBHzLxOQLuzzEBIAC+dBTPI0REEbR1pfcWkBScBIKOtl0NUlQtzCk3Nkhm
# 90JHvq3uWtSgkWukDhKH+hdH1+iAz9THPYkc3VHZ2WfS7ujgbBv94/CwuhlV3jzH
# G6IDPf6FYswUF8KwDAmRIcKBgkJsTNfKUVtfw6uvCNHVgoiKbamRP389l667yZLZ
# /3r3TRL5VJO3G7MNAHnqMvvI7uTeY2PfEeL+OKFAJAIU+x761NJOXSElITVRyW5o
# 0hD1pNiv7BGABGQDH7iuCqkzd6UhTULbUnWbP96ajrSvlFv7TlmDvIRrJDsKKPTI
# cb2CCvVGlMg3DtBc+0AcztwyGSTBGOY5ZR8tWB+WWfPypsu5dL9sbkzLFYtSTdZW
# h/P0ekwkjCI6PvEyYZtlaQPj8xv8I3AW4Ej2DCwYlUih/jCCBygwggUQoAMCAQIC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAA7F+
# wYR0C6Lcha0AAAADsX4wDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgC7sX
# G6j4EZ0HkeTZKpF7hC0jv9og80ZjwiDlrRylRx0wDQYJKoZIhvcNAQEBBQAEggGA
# Y82k3xlEz27xOGnHTmeL4Ur0B0sizBrYr9/kzOcDIS1mayZF4fRtpEhx6ZyQ5aTt
# a/xxCF8VwUFl6UGqKlHjuZGNrkZd+nWgaukgfxeEUaqfjVa8EWoU8KeiTusb84bO
# dvX9vnCbBtT5CvkIW6SXL5IwrIwP8UAUSpZYPF14SELWRBRXM4rdoJZFox3Ba542
# /enHDmYhj6Fv1VxHAbyQjyIkFOTuH1GhTiaFGz0de7HIgm7hjGZJOqReBa+BJNEJ
# A3glsPEXLDSU3eBbWKmN1d3H5P2jWUs0PmhtsjzBxBZnlg7Y5OmNQOZftAh0k/fz
# X0NObMDmowhj6TVufsV9RjetcLRgZtsHRCKnFwcqzZlt+unX6aL92BTMYqMV8IRd
# aAizDerlntQbyPTkuPk+V/6heb+V5CGaiJIXREdmqdkbKlaNz9f1+6WVsphogzhc
# v2yiluwgQIm8pRT/MHBNISbPOdZdX2bFl9hnx45p7rksNNnMASxtY0yesQgq1GuZ
# oYIUsTCCFK0GCisGAQQBgjcDAwExghSdMIIUmQYJKoZIhvcNAQcCoIIUijCCFIYC
# AQMxDzANBglghkgBZQMEAgEFADCCAWkGCyqGSIb3DQEJEAEEoIIBWASCAVQwggFQ
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIGzp51xJwZ3pmeyB1Gla
# 76FLTyEhvKP/C3VZUh0dzyuDAgZqY0xd90MYEjIwMjYwNzI3MTMxMDA1Ljg2WjAE
# gAIB9KCB6aSB5jCB4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVk
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046N0IxQS0wNUUwLUQ5NDcxNTAzBgNV
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
# hthsGHumaABdWzCCB58wggWHoAMCAQICEzMAAABZfNpx6Y1e9cAAAAAAAFkwDQYJ
# KoZIhvcNAQEMBQAwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjAwHhcNMjYwMTA4MTg1OTAxWhcNMjcwMTA3MTg1OTAxWjCB
# 4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMk
# TWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5u
# U2hpZWxkIFRTUyBFU046N0IxQS0wNUUwLUQ5NDcxNTAzBgNVBAMTLE1pY3Jvc29m
# dCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5MIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEApi7n/jR4Rf6FP7mMVrXjpuJ3d0Dguddie2+Q
# /cIbDgsYBEWGe8sxIn9W2y5vMNp4WebvJvYpIzvRaYdCmt0JWqm9QfuXS4HiM3Du
# 6sugBH2QocsTRWUyUNK0NLFQEjerCx2uO92a9XST73+eO4MSJKXMlN/sOjB3Urds
# 7ht5HJoWFH5jy3KYQI6qU4B99isbbBl1UznX5BIFJ748TKSvwLo6eepKKm4Xx9m8
# Jvr+G6TRmbpnCxqLFIcgBPYgQa9LtzrcibyNXdrxHQrqLbKLDQ02WdNKnDL9l+/u
# LCwsHCF9uMFOf5c6XqY/MNdBDdX5JE/3FdsYo6wFPHMaJ3tooAfDejgCGX1QZYsf
# 2Q0/dVSiQToliSOV+m5QZnqBDKoN7B/EPhWhgiWim3gdnTFC+pqO4nH5yvwtH8hn
# nqAsubDIzN17n6+2MGiKWvL+BJnBUbCCS+QiCko8FAcaxIHTLezOvtjvARvq/TJl
# qXVdS9aefPeKdNpJawIWss9XBWZfLedxjn93blWk6SG36br3sZY1u+w06EA4dFp+
# 0T2P+GGSgzpGzIl8EueGoxwD/Bxq9/miPk17JFB0Zl4spyWz1ywpLewFTM+J3HHa
# KI0f0I9oOr9sskQ5dqxiiFcydGKe759STzWzxU7sNBIXp9+fmipIehXyV/UDHq76
# R1KFvwECAwEAAaOCAcswggHHMB0GA1UdDgQWBBSPlucLXwPS+WdJGEI6I4MYa5c2
# djAfBgNVHSMEGDAWgBRraSg6NS9IY0DPe9ivSek+2T3bITBsBgNVHR8EZTBjMGGg
# X6BdhltodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3Nv
# ZnQlMjBQdWJsaWMlMjBSU0ElMjBUaW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3Js
# MHkGCCsGAQUFBwEBBG0wazBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBQdWJsaWMlMjBSU0ElMjBU
# aW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0l
# AQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMGYGA1UdIARfMF0wUQYM
# KwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTAIBgZngQwBBAIwDQYJKoZI
# hvcNAQEMBQADggIBAEQyHML9lyOkb/NRETvPZinm+tTFSOwTldre3/ZEa8RLC9ua
# yTdsseFIUBqOCjZdDzGgYM/exSEoIs94gJJuRW/pXyxKnx8nwmizrKtrB/ZhWKzy
# 1xX447tT1LokY9DOmY+dx/NBzid7V+pnj4eIppsgMSgV111BPYSCST1/PEJj8Rnn
# Zq8nbt1J+sj8gObKf1XXQ7eJCmDYX4L281OuTudWCgOgdr35DelivQgcadKa3mKu
# AZPjfrOjladc/wXEyGzAfVqLKJJmJXOGivXQL0LnZw/cLz88SgwpRey0uOg87RMy
# R5b/UWvXzopcPjlBGAGjTEiaC1ZN3NYWeUP6nv6IMEi5Ks1xFcNFi6r9phloOFZI
# jRJh08hZWHle9e5YDfVryhDRI76g9rc2TzSTTzrjCKLInUqxtKdpp5+D2+yl6CGu
# ljyWMLDF8JS3HkdBE2AAk4jwgoAIrh3TXgyTSGVE7SVBVEd6CoiDb0rpeqRzfrRb
# ZkkZRyy2UqiSRWPooAeMbKstE/N6lh+JlQmriBfLFum8pvVcnYU3brzZpSg1ej1H
# JErVyHR/rqTr7KPzyTO+4Lv68la00Oz9SkgzoeGbSRTrglQnswwRBwBzuSl+3sab
# th5Er6gqCpSBhcJ+bNtfyclclmc9rwANZWwiqy40DEIjQJleRQuh+qjkF7rPMYID
# 1DCCA9ACAQEweDBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3Rh
# bXBpbmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTANBglghkgBZQMEAgEF
# AKCCAS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEi
# BCCq4cCbdw2iW0wAZ4cWNIsRNRPWFSZLDJDPHhA35g6rwDCB3QYLKoZIhvcNAQkQ
# Ai8xgc0wgcowgccwgaAEIMtFurHbhumxxcQn4eOP3GtxRXDtHw7LIx9IHZgYrf68
# MHwwZaRjMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVzdGFtcGlu
# ZyBDQSAyMDIwAhMzAAAAWXzacemNXvXAAAAAAABZMCIEIMIhvMD+xMn2UrjUTYR7
# ccP6X+TuRIAwHSocOmpDB6XQMA0GCSqGSIb3DQEBCwUABIICAGbiENET5ryT+Gy6
# 3nJG8EUF8/d5gk3eQe0/tx8RUq74sJFoOc2LwN1iT5lXftBXQ/TvKbvflZCJBH93
# qRJVeTpD+9g8zqAT0vnJ4s+BDRNWO50YT77YlduTElU2x52o58twduhsieCAscUr
# iWNFWAb7oYFDtH+NUkQr1v+oNe/EE+/a2nymfW9edYkpXX0lphUz1bGYWKWZG1eu
# r9PIxOtPyzcjgGrGDrvJ8kjU8OgZp+8Yy/Oc3npx12fauo4QRp/xS9u5BJj2EewO
# jqMSZxFx0GemY1h0t8ejTbdfESJBKb5uizq8URm0rR9gGLE51OJUpnkp5woNF/EW
# 7hAkxzaSkLWt18CpqWfzOdCpteN59xeXzNOLmWpQ0OJjeiZ60IeVOV7QOgYIYto/
# crlpKpFkwAfRs33GgL0mjiaX25Q5pZh3h94xPn1p/VywEu+6UdoDcPAmHrTHD8Bo
# e9ONqYQTvhaRwog7TpG1lT/zwndEHDZn7o8X3iGAJZMN77nRkNNx93ROdSg81uXO
# aje11Mkb6blLeYodIbhmH8TZkMolfihQnr4FDJWopfWCcDf9mG/BroqDNnatKm13
# LSeme+AidE8G2EkYhL4NzrztHbFY5xSHC8SV4hJmcrDCVubGA57s9LsmTFP72iLT
# lXi4msyW6Z/s8l4BeyoPpnd7pOjS
# SIG # End signature block
