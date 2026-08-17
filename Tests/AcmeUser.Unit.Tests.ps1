$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\NetScalerToolkit\NetScalerToolkit.psd1'
Import-Module $modulePath -Force

Describe 'ACME certificate user' {
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
                }
            }
        }

        BeforeEach {
            $script:ExistingUser = $null
            $script:ExistingBindings = @()
            $script:AddedUsers = [System.Collections.Generic.List[string]]::new()

            Mock Invoke-NSGetSystemCmdPolicy { $null }
            Mock Invoke-NSAddSystemCmdPolicy { }
            Mock Invoke-NSUpdateSystemCmdPolicy { }
            Mock Invoke-NSGetSystemUser { $script:ExistingUser }
            Mock Invoke-NSAddSystemUser { $script:AddedUsers.Add($Username) | Out-Null }
            Mock Invoke-NSUpdateSystemUser { }
            Mock Invoke-NSGetSystemUserSystemCmdPolicyBinding { @($script:ExistingBindings) }
            Mock Invoke-NSAddSystemUserSystemCmdPolicyBinding { }
            Mock Invoke-NSSaveNSConfig { }
        }

        It 'reports the effective policy names after the base is truncated' {
            # 25 characters, one over the limit, so the suffixed names stay within it.
            $result = New-NSACMECertificateUser -Session (New-TestNSSession) -PolicyName 'script-GenLeCertForNS-tst' -CsVipName 'cs_test_http' -PassThru -Confirm:$false

            $result.PolicyBase | Should -Be 'script-GenLeCertForNS-ts'
            @($result.Policies).Count | Should -Be 3
            @($result.Policies.PolicyName) | Should -Be @(
                'script-GenLeCertForNS-ts-Basics',
                'script-GenLeCertForNS-ts-LEBkEd',
                'script-GenLeCertForNS-ts-LEFtEd'
            )
            @($result.Policies.Priority) | Should -Be @(10, 20, 30)
        }

        It 'keeps the policy base intact when it is short enough' {
            $result = New-NSACMECertificateUser -Session (New-TestNSSession) -PolicyName 'script-le' -CsVipName 'cs_test_http' -PassThru -Confirm:$false

            $result.PolicyBase | Should -Be 'script-le'
            @($result.Policies.PolicyName) | Should -Contain 'script-le-Basics'
        }

        It 'reports the created user and its bindings' {
            $result = New-NSACMECertificateUser -Session (New-TestNSSession) -PolicyName 'script-le' -CsVipName 'cs_test_http' -ApiUsername 'GenLEUser' -ApiPassword 'unit-test' -PassThru -Confirm:$false

            $result.User.Username | Should -Be 'GenLEUser'
            $result.User.Action | Should -Be 'Created'
            $script:AddedUsers | Should -Contain 'GenLEUser'
            @($result.PolicyBindings | Where-Object { $_.Action -eq 'Bound' }).Count | Should -Be 3
        }

        It 'marks an existing binding as present instead of binding it again' {
            $script:ExistingUser = [pscustomobject] @{ username = 'GenLEUser' }
            $script:ExistingBindings = @([pscustomobject] @{ policyname = 'script-le-Basics'; priority = 10 })

            $result = New-NSACMECertificateUser -Session (New-TestNSSession) -PolicyName 'script-le' -CsVipName 'cs_test_http' -ApiUsername 'GenLEUser' -ApiPassword 'unit-test' -PassThru -Confirm:$false

            $result.User.Action | Should -Be 'Updated'
            @($result.PolicyBindings | Where-Object { $_.PolicyName -eq 'script-le-Basics' }).Action | Should -Be 'Present'
            Should -Invoke Invoke-NSAddSystemUserSystemCmdPolicyBinding -Times 2
        }

        It 'stays silent on the pipeline unless PassThru is specified' {
            $output = New-NSACMECertificateUser -Session (New-TestNSSession) -PolicyName 'script-le' -CsVipName 'cs_test_http' -Confirm:$false

            $output | Should -BeNullOrEmpty
        }

        It 'requires a CS vServer unless UseLbVip is specified' {
            { New-NSACMECertificateUser -Session (New-TestNSSession) -PolicyName 'script-le' -Confirm:$false } |
                Should -Throw -ExpectedMessage '*CsVipName is required*'
        }
    }
}
