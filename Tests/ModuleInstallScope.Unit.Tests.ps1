$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\NetScalerToolkit\NetScalerToolkit.psd1'
Import-Module $modulePath -Force

Describe 'Module install scope' {
    InModuleScope NetScalerToolkit {
        BeforeAll {
            # Shadows, so the mocks do not depend on PowerShellGet being resolvable after earlier test files.
            function Install-Module { [CmdletBinding()] param($Name, $RequiredVersion, $Repository, $Scope, [switch]$Force, [switch]$AllowClobber, [switch]$AllowPrerelease, [switch]$AcceptLicense, [switch]$SkipPublisherCheck) }
            function Find-Module { [CmdletBinding()] param($Name, $Repository, [switch]$AllowPrerelease) }
        }

        Context 'Resolve-NSModuleInstallScope' {
            BeforeAll {
                $script:SavedModulePath = $env:PSModulePath
                $folderName = if ($PSVersionTable.PSEdition -eq 'Desktop') { 'WindowsPowerShell' } else { 'PowerShell' }
                $script:CurrentUserPath = Join-Path -Path ([Environment]::GetFolderPath('MyDocuments')) -ChildPath "$folderName\Modules"
                $principal = New-Object -TypeName Security.Principal.WindowsPrincipal -ArgumentList ([Security.Principal.WindowsIdentity]::GetCurrent())
                $script:IsElevated = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
            }

            AfterEach {
                $env:PSModulePath = $script:SavedModulePath
            }

            It 'keeps CurrentUser when the CurrentUser folder is on PSModulePath' {
                $env:PSModulePath = "$($script:CurrentUserPath)\;C:\Program Files\WindowsPowerShell\Modules"

                $result = Resolve-NSModuleInstallScope

                $result.OnModulePath | Should -BeTrue
                $result.Scope | Should -Be 'CurrentUser'
            }

            It 'uses AllUsers only when elevated and the CurrentUser folder is not on PSModulePath' {
                $env:PSModulePath = 'C:\Program Files\WindowsPowerShell\Modules;C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules'

                $result = Resolve-NSModuleInstallScope

                $result.OnModulePath | Should -BeFalse
                $result.CurrentUserPath | Should -Be $script:CurrentUserPath
                $result.Scope | Should -Be $(if ($script:IsElevated) { 'AllUsers' } else { 'CurrentUser' })
            }
        }

        Context 'Posh-ACME install' {
            BeforeEach {
                Mock Install-Module { }
                Mock Import-Module { }
                Mock Write-NSACMECertificateLog { }
                # Last: Pester resolves the other mocked commands through Get-Module.
                Mock Get-Module { } -ParameterFilter { $ListAvailable }
            }

            It 'installs for AllUsers and imports by name when the session is elevated' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'AllUsers'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $true } }

                Import-NSACMECertificatePoshACME

                Should -Invoke Install-Module -Times 1 -Exactly -ParameterFilter { $Scope -eq 'AllUsers' }
                Should -Invoke Import-Module -Times 1 -Exactly -ParameterFilter { $Name -eq 'Posh-ACME' }
                Should -Invoke Write-NSACMECertificateLog -Times 0 -ParameterFilter { $Level -eq 'Warning' }
            }

            It 'imports by path and warns with the fix when CurrentUser is not on PSModulePath' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $false } }

                Import-NSACMECertificatePoshACME

                Should -Invoke Install-Module -Times 1 -Exactly -ParameterFilter { $Scope -eq 'CurrentUser' }
                Should -Invoke Import-Module -Times 1 -Exactly -ParameterFilter { $Name -eq "C:\Profile\Modules\Posh-ACME\$($script:NSACMETestedPoshACMEVersion)\Posh-ACME.psd1" }
                Should -Invoke Write-NSACMECertificateLog -Times 1 -Exactly -ParameterFilter { $Level -eq 'Warning' -and $Message -like '*not on PSModulePath*-Scope AllUsers*' }
            }

            It 'keeps CurrentUser and imports by name when the folder is on PSModulePath' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $true; IsElevated = $false } }

                Import-NSACMECertificatePoshACME

                Should -Invoke Install-Module -Times 1 -Exactly -ParameterFilter { $Scope -eq 'CurrentUser' }
                Should -Invoke Import-Module -Times 1 -Exactly -ParameterFilter { $Name -eq 'Posh-ACME' }
            }

            It 'names the AllUsers command when installation is skipped and CurrentUser is not on PSModulePath' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $false } }

                { Import-NSACMECertificatePoshACME -SkipInstall } | Should -Throw '*-Scope AllUsers (from an elevated prompt)*'
                Should -Invoke Install-Module -Times 0
            }
        }

        Context 'Update-NetScalerToolkit' {
            BeforeEach {
                Mock Find-Module { [PSCustomObject]@{ Name = 'NetScalerToolkit'; Version = '9999.1.1' } }
                Mock Install-Module { }
                Mock Write-Warning { }
            }

            It 'installs for AllUsers when the resolved scope is AllUsers' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'AllUsers'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $true } }

                $result = Update-NetScalerToolkit -Confirm:$false

                $result.Scope | Should -Be 'AllUsers'
                Should -Invoke Install-Module -Times 1 -Exactly -ParameterFilter { $Scope -eq 'AllUsers' }
                Should -Invoke Write-Warning -Times 0
            }

            It 'warns with the fix when it can only install to a CurrentUser folder off PSModulePath' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $false } }

                $result = Update-NetScalerToolkit -Confirm:$false

                $result.Message | Should -BeLike '*not on PSModulePath*Update-NetScalerToolkit -Scope AllUsers*'
                Should -Invoke Install-Module -Times 1 -Exactly -ParameterFilter { $Scope -eq 'CurrentUser' }
                Should -Invoke Write-Warning -Times 1 -Exactly
            }

            It 'keeps an explicit Scope' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'AllUsers'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $true; IsElevated = $true } }

                $null = Update-NetScalerToolkit -Scope CurrentUser -Confirm:$false

                Should -Invoke Install-Module -Times 1 -Exactly -ParameterFilter { $Scope -eq 'CurrentUser' }
            }
        }

        Context 'older GenLeCertForNS.ps1 wrapper' {
            BeforeEach {
                $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE = '1'
                $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE = 'Installed NetScalerToolkit 2026.1110.1000 from PSGallery before module import.'
                Remove-Item Env:\NETSCALERTOOLKIT_WRAPPER_SCOPE_AWARE -ErrorAction SilentlyContinue
                Mock Update-NetScalerToolkit { [PSCustomObject]@{ Status = 'Current'; Updated = $false; CurrentVersion = '2026.1110.1000'; AvailableVersion = '2026.1110.1000'; Message = 'current' } }
                Mock Write-NSACMECertificateLog { }
                Mock Write-Information { }
            }

            AfterEach {
                Remove-Item Env:\NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE, Env:\NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE, Env:\NETSCALERTOOLKIT_WRAPPER_SCOPE_AWARE -ErrorAction SilentlyContinue
            }

            # Without credentials the run stops right after the AutoUpdate handling.
            It 'installs the update for AllUsers itself when the old wrapper used a folder off PSModulePath' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'AllUsers'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $true } }

                { Request-NSACMECertificate -CN 'example.com' -ManagementURL 'https://ns-01.domain.local' -CertDir ([System.IO.Path]::GetTempPath()) -AutoUpdate -NoConsoleOutput -DisableLogging } | Should -Throw '*No NetScaler credential*'

                Should -Invoke Update-NetScalerToolkit -Times 1 -Exactly
                Should -Invoke Write-NSACMECertificateLog -Times 1 -Exactly -ParameterFilter { $Level -eq 'Warning' -and $Message -like '*older version*installs the update for AllUsers*Replace GenLeCertForNS.ps1*' }
            }

            It 'names the fix when the old wrapper used a folder off PSModulePath and the session is not elevated' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $false } }

                { Request-NSACMECertificate -CN 'example.com' -ManagementURL 'https://ns-01.domain.local' -CertDir ([System.IO.Path]::GetTempPath()) -AutoUpdate -NoConsoleOutput -DisableLogging } | Should -Throw '*No NetScaler credential*'

                Should -Invoke Update-NetScalerToolkit -Times 0
                Should -Invoke Write-NSACMECertificateLog -Times 1 -Exactly -ParameterFilter { $Level -eq 'Warning' -and $Message -like '*never loaded*Update-NetScalerToolkit -Scope AllUsers*' }
            }

            It 'leaves the update to the wrapper when the folder is on PSModulePath' {
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $true; IsElevated = $true } }

                { Request-NSACMECertificate -CN 'example.com' -ManagementURL 'https://ns-01.domain.local' -CertDir ([System.IO.Path]::GetTempPath()) -AutoUpdate -NoConsoleOutput -DisableLogging } | Should -Throw '*No NetScaler credential*'

                Should -Invoke Update-NetScalerToolkit -Times 0
                Should -Invoke Write-NSACMECertificateLog -Times 0 -ParameterFilter { $Level -eq 'Warning' }
            }

            It 'trusts the current wrapper, which picks the scope itself' {
                $env:NETSCALERTOOLKIT_WRAPPER_SCOPE_AWARE = '1'
                Mock Resolve-NSModuleInstallScope { [PSCustomObject]@{ Scope = 'AllUsers'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false; IsElevated = $true } }

                { Request-NSACMECertificate -CN 'example.com' -ManagementURL 'https://ns-01.domain.local' -CertDir ([System.IO.Path]::GetTempPath()) -AutoUpdate -NoConsoleOutput -DisableLogging } | Should -Throw '*No NetScaler credential*'

                Should -Invoke Resolve-NSModuleInstallScope -Times 0
                Should -Invoke Update-NetScalerToolkit -Times 0
            }
        }
    }
}

Describe 'GenLeCertForNS wrapper install scope' {
    BeforeAll {
        # Running the wrapper from the repository takes the local manifest branch, so load its helpers only.
        $wrapperPath = Join-Path -Path $PSScriptRoot -ChildPath '..\GenLeCertForNS.ps1'
        $ast = [System.Management.Automation.Language.Parser]::ParseFile((Resolve-Path -LiteralPath $wrapperPath).Path, [ref]$null, [ref]$null)
        $functions = $ast.FindAll({ $args[0] -is [System.Management.Automation.Language.FunctionDefinitionAst] }, $false)
        foreach ($function in $functions) {
            . ([scriptblock]::Create($function.Extent.Text))
        }
        function Install-Module { [CmdletBinding()] param($Name, $Scope, [switch]$Force, [switch]$AllowClobber, [switch]$AllowPrerelease) }
        function Find-Module { [CmdletBinding()] param($Name, $Repository, [switch]$AllowPrerelease) }
    }

    BeforeEach {
        Remove-Item Env:\NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_WARNING -ErrorAction SilentlyContinue
        Mock Import-Module { }
        Mock Remove-Module { }
        Mock Write-Warning { }
        Mock Test-Path { $true }
    }

    AfterAll {
        Remove-Item Env:\NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_WARNING -ErrorAction SilentlyContinue
    }

    It 'installs for the resolved scope' {
        Mock Get-NetScalerToolkitInstallScope { [PSCustomObject]@{ Scope = 'AllUsers'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false } }
        Mock Find-Module { [PSCustomObject]@{ Name = 'NetScalerToolkit'; Version = '2026.1110.1000' } }
        Mock Install-Module { }

        $result = Install-LatestNetScalerToolkit

        Should -Invoke Install-Module -Times 1 -Exactly -ParameterFilter { $Name -eq 'NetScalerToolkit' -and $Scope -eq 'AllUsers' }
        $result.InstallScope.Scope | Should -Be 'AllUsers'
    }

    It 'does nothing when the expected version is loaded' {
        Mock Get-Module { [PSCustomObject]@{ Name = 'NetScalerToolkit'; Version = [version]'2026.1110.1000' } }

        Confirm-NetScalerToolkitVersion -ExpectedVersion '2026.1110.1000' -InstallScope ([PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false })

        Should -Invoke Import-Module -Times 0
        Should -Invoke Write-Warning -Times 0
    }

    It 'loads the new version by path and hands the warning to the module when CurrentUser is not on PSModulePath' {
        Mock Get-Module { [PSCustomObject]@{ Name = 'NetScalerToolkit'; Version = [version]'2026.727.1845' } }

        Confirm-NetScalerToolkitVersion -ExpectedVersion '2026.1110.1000' -InstallScope ([PSCustomObject]@{ Scope = 'CurrentUser'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false })

        Should -Invoke Import-Module -Times 1 -Exactly -ParameterFilter { $Name -eq 'C:\Profile\Modules\NetScalerToolkit\2026.1110.1000\NetScalerToolkit.psd1' }
        $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_WARNING | Should -BeLike '*not on PSModulePath*-Scope AllUsers*'
        Should -Invoke Write-Warning -Times 0
    }

    It 'warns with both versions when an older version stays loaded' {
        Mock Get-Module { [PSCustomObject]@{ Name = 'NetScalerToolkit'; Version = [version]'2026.727.1845' } }

        Confirm-NetScalerToolkitVersion -ExpectedVersion '2026.1110.1000' -InstallScope ([PSCustomObject]@{ Scope = 'AllUsers'; CurrentUserPath = 'C:\Profile\Modules'; OnModulePath = $false })

        Should -Invoke Import-Module -Times 0
        Should -Invoke Write-Warning -Times 1 -Exactly -ParameterFilter { $Message -like '*2026.1110.1000 was installed, but 2026.727.1845 is loaded*' }
    }
}
