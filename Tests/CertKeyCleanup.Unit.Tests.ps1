$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\NetScalerToolkit\NetScalerToolkit.psd1'
Import-Module $modulePath -Force

Describe 'CertKey cleanup' {
    InModuleScope NetScalerToolkit {
        BeforeAll {
            function New-TestNSSession {
                [pscustomobject] @{
                    ManagementUrl = 'https://ns.example.test'
                    Version = '14.1'
                    MetadataVersion = '14.1'
                    IsHA = $false
                    IsPrimary = $true
                    IsSecondary = $false
                    PrimarySession = $null
                    SecondarySession = $null
                }
            }
        }

        BeforeEach {
            $script:DeletedCertKeys = [System.Collections.Generic.List[string]]::new()
            $script:DeletedFiles = [System.Collections.Generic.List[string]]::new()
            $script:CertKeys = @()
            $script:SystemFiles = @()
            $script:RunningConfig = ''
            $script:SSLProfiles = @()
            $script:SSLVServers = @()

            Mock Invoke-NSGetSSLCertKey { @($script:CertKeys | Where-Object { $script:DeletedCertKeys -notcontains $_.certkey }) }
            Mock Invoke-NSGetNsrunningconfig { [pscustomobject] @{ response = $script:RunningConfig } }
            Mock Invoke-NSGetSSLCertKeyBinding { $null }
            Mock Invoke-NSGetSSLCertKeyCrldistributionBinding { $null }
            Mock Invoke-NSGetSSLCertKeyServiceBinding { $null }
            Mock Invoke-NSGetSSLCertKeySSLOCSPResponderBinding { $null }
            Mock Invoke-NSGetSSLCertKeySSLProfileBinding { $null }
            Mock Invoke-NSGetSSLCertKeySSLVServerBinding { $null }
            Mock Invoke-NSGetSSLCertLink { $null }
            Mock Invoke-NSGetVPNGlobalSSLCertKeyBinding { $null }
            Mock Invoke-NSGetAuthenticationSAMLAction { $null }
            Mock Invoke-NSGetSSLProfile { @($script:SSLProfiles) }
            Mock Invoke-NSGetSSLVServer { @($script:SSLVServers) }
            Mock Invoke-NSGetSystemFile {
                $deletedFilePath = if ($PSBoundParameters.ContainsKey('FileName')) { '{0}/{1}' -f $FileLocation.TrimEnd('/'), $FileName } else { $null }
                if ($PSBoundParameters.ContainsKey('FileName')) {
                    if ($script:DeletedFiles -contains $deletedFilePath) { return $null }
                    return @($script:SystemFiles | Where-Object { $_.filename -eq $FileName -and $_.filelocation -eq $FileLocation })[0]
                }

                return @($script:SystemFiles | Where-Object {
                    $_.filelocation -eq $FileLocation -and $script:DeletedFiles -notcontains ('{0}/{1}' -f $_.filelocation.TrimEnd('/'), $_.filename)
                })
            }
            Mock Invoke-NSDeleteSSLCertKey { $script:DeletedCertKeys.Add($CertKey) | Out-Null }
            Mock Invoke-NSDeleteSystemFile { $script:DeletedFiles.Add(('{0}/{1}' -f $FileLocation.TrimEnd('/'), $FileName)) | Out-Null }
            Mock Invoke-NSSaveNSConfig { }
            Mock Invoke-NSCreateSystemBackup { }
        }

        It 'does not remove a certkey with a CRL distribution binding' {
            $script:CertKeys = @([pscustomobject] @{ certkey = 'crl_cert'; cert = 'crl.crt'; key = 'crl.key'; status = 'Valid'; daystoexpiration = 90 })
            $script:SystemFiles = @(
                [pscustomobject] @{ filename = 'crl.crt'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' },
                [pscustomobject] @{ filename = 'crl.key'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' }
            )
            Mock Invoke-NSGetSSLCertKeyCrldistributionBinding {
                [pscustomobject] @{ certkey = $CertKey; crldistribution = 'crl_distribution_1' }
            }

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru

            $plan.CertKeys[0].Removable | Should -BeFalse
            $plan.CertKeys[0].Reference | Should -Contain 'Invoke-NSGetSSLCertKeyCrldistributionBinding'
            Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
            Should -Invoke Invoke-NSDeleteSystemFile -Times 0
        }

        It 'removes an unreferenced certkey and then removes orphaned cert and key files' {
            $script:CertKeys = @([pscustomobject] @{ certkey = 'old_cert'; cert = 'old.crt'; key = 'old.key'; status = 'Valid'; daystoexpiration = 90 })
            $script:SystemFiles = @(
                [pscustomobject] @{ filename = 'old.crt'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' },
                [pscustomobject] @{ filename = 'old.key'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' }
            )

            Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false

            $script:DeletedCertKeys | Should -Be @('old_cert')
            $script:DeletedFiles | Should -Contain '/nsconfig/ssl/old.crt'
            $script:DeletedFiles | Should -Contain '/nsconfig/ssl/old.key'
        }

        It 'returns removed certkey and file details with PassThru' {
            $script:CertKeys = @([pscustomobject] @{ certkey = 'old_cert'; cert = 'old.crt'; key = 'old.key'; status = 'Valid'; daystoexpiration = 90 })
            $script:SystemFiles = @(
                [pscustomobject] @{ filename = 'old.crt'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' },
                [pscustomobject] @{ filename = 'old.key'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' }
            )

            $result = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru

            $result.RemovedCertKeys.CertKey | Should -Be @('old_cert')
            $result.RemovedFiles.FileName | Should -Contain 'old.crt'
            $result.RemovedFiles.FileName | Should -Contain 'old.key'
            $result.PSObject.Properties.Name | Should -Not -Contain 'Summary'
        }

        It 'writes a host summary and returns the cleanup result with Summary' {
            $script:SystemFiles = @([pscustomobject] @{ filename = 'orphan.pem'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' })
            Mock Write-Host { }

            $result = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -Summary

            $result.PSObject.Properties.Name | Should -Contain 'CertKeys'
            $result.PSObject.Properties.Name | Should -Contain 'Files'
            $result.PSObject.Properties.Name | Should -Contain 'RemovedFiles'
            $result.PSObject.Properties.Name | Should -Not -Contain 'Summary'
            $result.RemovedFiles.FileName | Should -Be 'orphan.pem'
            Should -Invoke Write-Host -Times 5
        }

        It 'does not remove a SAML referenced certkey' {
            $script:CertKeys = @([pscustomobject] @{ certkey = 'saml_cert'; cert = 'saml.crt'; key = 'saml.key'; status = 'Valid'; daystoexpiration = 90 })
            Mock Invoke-NSGetAuthenticationSAMLAction {
                [pscustomobject] @{ name = 'saml_action'; samlidpcertname = 'saml_cert'; samlsigningcertname = $null }
            }

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru

            $plan.CertKeys[0].Removable | Should -BeFalse
            $plan.CertKeys[0].Reference | Should -Contain 'SAML IdP certificate'
            Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
        }

        It 'uses the running config as a conservative certkey reference guard' {
            $script:CertKeys = @([pscustomobject] @{ certkey = 'gateway_cert'; cert = 'gateway.crt'; key = 'gateway.key'; status = 'Valid'; daystoexpiration = 90 })
            $script:RunningConfig = @'
add ssl certKey gateway_cert -cert gateway.crt -key gateway.key
bind vpn vserver vpn_gateway -certkeyName gateway_cert
'@

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru

            $plan.CertKeys[0].Removable | Should -BeFalse
            $plan.CertKeys[0].Reference | Should -Contain 'running config'
            Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
        }

        It 'does not remove files used as SSL DH files' {
            $script:SystemFiles = @([pscustomobject] @{ filename = 'dh.pem'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' })
            $script:SSLProfiles = @([pscustomobject] @{ name = 'profile1'; dhfile = '/nsconfig/ssl/dh.pem' })

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru

            $plan.Files[0].Removable | Should -BeFalse
            $plan.Files[0].Reference | Should -Contain 'SSL DH file'
            Should -Invoke Invoke-NSDeleteSystemFile -Times 0
        }

        It 'does not remove default NetScaler SSL support files' {
            $script:SystemFiles = @(
                [pscustomobject] @{ filename = 'ns-root.req'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' },
                [pscustomobject] @{ filename = 'ns-sftrust-root.key'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' },
                [pscustomobject] @{ filename = 'trusted_root_certs.pem'; filelocation = '/nsconfig/ssl/certbundle/'; filemode = 'FILE' }
            )

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru

            @($plan.Files | Where-Object Removable).Count | Should -Be 0
            $plan.Files.Reference | Should -Contain 'excluded file'
            Should -Invoke Invoke-NSDeleteSystemFile -Times 0
        }

        It 'adds cleanup operation context when a NITRO call fails' {
            Mock Invoke-NSGetSSLCertKey { throw 'connection dropped' }

            { Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false } |
                Should -Throw -ErrorId 'NSCleanCertKeyFilesOperationFailed' -ExpectedMessage '*Get SSL certkeys*connection dropped*'
        }

        It 'keeps a certkey when an individual binding reference check fails' {
            $script:CertKeys = @([pscustomobject] @{ certkey = 'maybe_used'; cert = 'maybe.crt'; key = 'maybe.key'; status = 'Valid'; daystoexpiration = 90 })
            Mock Invoke-NSGetSSLCertKeySSLOCSPResponderBinding { throw 'connection dropped' }

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru -WarningAction SilentlyContinue

            $plan.CertKeys[0].Removable | Should -BeFalse
            $plan.CertKeys[0].Reference | Should -Contain 'reference check failed: Invoke-NSGetSSLCertKeySSLOCSPResponderBinding for certkey maybe_used'
            Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
        }

        It 'keeps all certkeys when a global certkey reference check fails' {
            $script:CertKeys = @([pscustomobject] @{ certkey = 'maybe_linked'; cert = 'maybe-linked.crt'; key = 'maybe-linked.key'; status = 'Valid'; daystoexpiration = 90 })
            Mock Invoke-NSGetSSLCertLink { throw 'connection dropped' }

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru -WarningAction SilentlyContinue

            $plan.CertKeys[0].Removable | Should -BeFalse
            $plan.CertKeys[0].Reference | Should -Contain 'reference check failed: Get SSL certificate links'
            Should -Invoke Invoke-NSDeleteSSLCertKey -Times 0
        }

        It 'keeps files when a global file reference check fails' {
            $script:SystemFiles = @([pscustomobject] @{ filename = 'orphan.pem'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' })
            Mock Invoke-NSGetSSLProfile { throw 'connection dropped' }

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru -WarningAction SilentlyContinue

            $plan.Files[0].Removable | Should -BeFalse
            $plan.Files[0].Reference | Should -Contain 'reference check failed: Get SSL profiles'
            Should -Invoke Invoke-NSDeleteSystemFile -Times 0
        }

        It 'continues when deleting one removable file fails' {
            $script:SystemFiles = @(
                [pscustomobject] @{ filename = 'orphan-one.pem'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' },
                [pscustomobject] @{ filename = 'orphan-two.pem'; filelocation = '/nsconfig/ssl/'; filemode = 'FILE' }
            )
            Mock Invoke-NSDeleteSystemFile {
                if ($FileName -eq 'orphan-one.pem') { throw 'connection dropped' }
                $script:DeletedFiles.Add(('{0}/{1}' -f $FileLocation.TrimEnd('/'), $FileName)) | Out-Null
            }

            { Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -WarningAction SilentlyContinue } | Should -Not -Throw

            $script:DeletedFiles | Should -Contain '/nsconfig/ssl/orphan-two.pem'
        }

        It 'skips file cleanup when listing certificate files fails' {
            Mock Invoke-NSGetSystemFile {
                if (-not $PSBoundParameters.ContainsKey('FileName')) { throw 'connection dropped' }
                $null
            }

            $plan = Invoke-NSCleanCertKeyFiles -Session (New-TestNSSession) -NoSaveConfig -Confirm:$false -PassThru -WarningAction SilentlyContinue

            @($plan.Files).Count | Should -Be 0
            Should -Invoke Invoke-NSDeleteSystemFile -Times 0
        }
    }
}
