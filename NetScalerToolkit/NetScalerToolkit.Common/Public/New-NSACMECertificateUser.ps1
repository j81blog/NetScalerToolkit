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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBx95aYcpN5pLNQ
# huS8aPKhSksWZP65VQ/x/dwwb45DpaCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCBAyAkHAKBIuIvDHcpD249Yss+wjB+tsauzSP7mGRM3
# MjANBgkqhkiG9w0BAQEFAASCAYCSChmUP280kWoObrJ24gW6rkw6VA6FV8Ir9DGA
# Ilnjvhu9mSFPft0gdwZ4did8RCTVxLy6bu5+JUT/iHyUqcvXYEh8EufygfTCWsQV
# OpPLaGZYFYBIBG2oukqwPm6Avyc91Nhgsb+N0vJgSvayRfZRTJX/G2wf2dI8eQGZ
# 6fqvTMnrzL4Dvavxf0QY/vpmZdAXjYAbUsjB9+nVvmioVvnpWzO6lROV4uWofmAR
# 36Sw7dHTzpa0muqpdnKYEKvOyKhHZNMUrfMpU8Ys65jkEYEoAKowV796LGIwkjVa
# 2TP2NqBx4W87UU5YNuVEsVDTJJfT9ektvDlBwni4jAMDOVvuHMaHPpqyOBb64tUY
# DrR1VGh97lkg0xEuUD+Y3Qqp6pM1RXP8TIPz8cavtBhRZsGkupzxbzfG1RhetlmQ
# lyI2Q6Sb4KiV6HbiPOJ/8k1vBZb11EiwgbnNQ6seB4f0mzC43ZEZtTk5+uWDlVrp
# 5HAFEyDcoQ20Ab2rUDTSXxZyk4KhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTUzMzVaMD8GCSqGSIb3
# DQEJBDEyBDA2jXRfgKEv/Xgti/M5oXmvGD6UeA88MJiuVZPYuK9C2ppKOsg/KAuF
# 4MaKCqzQL9wwDQYJKoZIhvcNAQEBBQAEggIAEx48oYCgqjaOnATF3V+CuC9AD6U5
# WI1xiBnXYTJXMcrkqOaFzjaiMbXDynwtxkAIt0CE9GHL4Ufird0y6wv+fLHsKzVL
# nCl2X4fNH8ATCiZuqkkOR0hW0U9jgH9DIDq+GLQGGnK6yZ+JtBqos5lkmKo0+zgK
# itTGyszXloY5Cm2TnT6ZF3V/Rdw6zqOeE32PpwanPimyLmJk61uBJRYuvMF/dzMO
# 8L3lmQRqTCq71JKqlXJpmUNiF/xRoOD5WTATvTbddowrAxuUUdy4eV+x8mB+LBqm
# YhzE5F6EotzLCZSm0FPyGRdj6RdjnbTdArm4W7w5YUiZlLVaym0NHGv/KI6JDxNa
# BDyQumq5Ek99Ct9wT/vQj3gguKLvH86HU4Jk+tqtCHzUNS7FJwPCjLqiqfP/Uq8N
# n267wUewD0cmQHN7+TURg5SmXT+3bpmmmUM48LPzHsa5xhbxPshDNPbZY2h5AY77
# RlsCLiHxdk/hlPXwE06bsQek38Wprx3ZHp81ty44XmXn2c/kCG4i4LAUqMYObIPk
# /tohPxtyIygrpV2tFfauKcWKsj9crKdA+aE8C5/jQnkzO+IPNSoxJRVIJWMDQlW7
# DqUmuwHca3hoNuTN48k43fZ1l9IDFsRxcUJw+qRo+x5hlGcRhtjPWnKF1H6brNVJ
# FCgR7dJIvhjjLl8=
# SIG # End signature block
