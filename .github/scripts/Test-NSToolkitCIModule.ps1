[CmdletBinding()]
param(
    [Parameter()]
    [string] $ModuleName = 'NetScalerToolkit',

    [Parameter()]
    [string] $ModuleRoot = 'NetScalerToolkit',

    [Parameter()]
    [string] $TestsPath = 'Tests'
)

$ErrorActionPreference = 'Stop'

function Test-PowerShellSyntax {
    param([Parameter(Mandatory)][string] $Path)

    $errors = @()
    Get-ChildItem -Path $Path -Include '*.ps1', '*.psm1', '*.psd1' -Recurse | ForEach-Object {
        $parseErrors = $null
        [System.Management.Automation.Language.Parser]::ParseFile($_.FullName, [ref] $null, [ref] $parseErrors) | Out-Null
        foreach ($parseError in @($parseErrors)) {
            $errors += [PSCustomObject] @{
                Path = $_.FullName
                Line = $parseError.Extent.StartLineNumber
                Message = $parseError.Message
            }
        }
    }

    if ($errors) {
        $errors | Format-Table -AutoSize
        throw "PowerShell parser found $($errors.Count) error(s)."
    }
}

function Test-GeneratedFunctionMetadata {
    param([Parameter(Mandatory)][string] $Path)

    $generatedFiles = @(
        Get-ChildItem -Path (Join-Path $Path 'NetScalerToolkit.Configuration\Public') -Filter '*.ps1' -Recurse
        Get-ChildItem -Path (Join-Path $Path 'NetScalerToolkit.Statistics\Public') -Filter '*.ps1' -Recurse
    )

    if ($generatedFiles.Count -lt 1) {
        throw 'No generated config/stat function bundles were found.'
    }

    $missingGeneratedNote = @(
        foreach ($file in $generatedFiles) {
            if ((Get-Content -LiteralPath $file.FullName -Raw) -notmatch 'Generated:\s+\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}') {
                $file.FullName
            }
        }
    )

    if ($missingGeneratedNote.Count -gt 0) {
        $missingGeneratedNote | ForEach-Object { Write-Host "Missing Generated note: $_" }
        throw "$($missingGeneratedNote.Count) generated bundle(s) are missing a Generated note."
    }

    Write-Host "Validated generated bundle count: $($generatedFiles.Count)"
}

function Test-ModuleImport {
    param(
        [Parameter(Mandatory)][string] $ManifestPath,
        [Parameter(Mandatory)][string] $Name
    )

    Import-Module $ManifestPath -Force
    $commands = @(Get-Command -Module $Name)

    if ($commands.Count -lt 1) { throw "$Name exported no commands." }
    if (-not ($commands | Where-Object Name -eq 'Connect-NSNode')) { throw 'Connect-NSNode was not exported.' }
    if (-not ($commands | Where-Object Name -eq 'Invoke-NSGetLBVServer')) { throw 'Generated config command was not exported.' }
    if (-not ($commands | Where-Object Name -eq 'Invoke-NSGetLBVServerStats')) { throw 'Generated stats command was not exported.' }
    if ($commands | Where-Object Name -eq 'Invoke-NSRestMethod') { throw 'Private function Invoke-NSRestMethod was exported.' }

    Write-Host "Exported command count: $($commands.Count)"
}

$manifestPath = (Resolve-Path (Join-Path $ModuleRoot "$ModuleName.psd1")).Path

Get-ChildItem -Path $ModuleRoot -Filter '*.psd1' -Recurse | ForEach-Object {
    Write-Host "Testing manifest: $($_.FullName)"
    Test-ModuleManifest -Path $_.FullName | Out-Null
}

Test-PowerShellSyntax -Path $ModuleRoot
Test-GeneratedFunctionMetadata -Path $ModuleRoot

powershell.exe -NoProfile -NoLogo -ExecutionPolicy Bypass -Command @"
`$ErrorActionPreference = 'Stop'
Import-Module '$manifestPath' -Force
`$commands = @(Get-Command -Module $ModuleName)
if (`$commands.Count -lt 1) { throw '$ModuleName exported no commands.' }
if (-not (`$commands | Where-Object Name -eq 'Connect-NSNode')) { throw 'Connect-NSNode was not exported.' }
if (-not (`$commands | Where-Object Name -eq 'Invoke-NSGetLBVServer')) { throw 'Generated config command was not exported.' }
if (-not (`$commands | Where-Object Name -eq 'Invoke-NSGetLBVServerStats')) { throw 'Generated stats command was not exported.' }
if (`$commands | Where-Object Name -eq 'Invoke-NSRestMethod') { throw 'Private function Invoke-NSRestMethod was exported.' }
"Windows PowerShell exported command count: `$(`$commands.Count)"
"@

Test-ModuleImport -ManifestPath $manifestPath -Name $ModuleName

if (Test-Path -LiteralPath $TestsPath) {
    $env:NSTOOLKIT_TEST_RUN_NETSCALER = 'false'
    $env:NSTOOLKIT_TEST_RUN_VPN_BINDING = 'false'

    Import-Module Pester -MinimumVersion 5.0.0 -ErrorAction Stop
    $configuration = [PesterConfiguration]::Default
    $configuration.Run.Path = @($TestsPath)
    $configuration.Run.Exit = $true
    $configuration.Output.Verbosity = 'Detailed'
    Invoke-Pester -Configuration $configuration
}

Import-Module PSScriptAnalyzer -ErrorAction Stop
$excludedRules = @(
    # Generated NetScaler API wrappers must preserve documented username/password fields.
    'PSAvoidUsingUsernameAndPasswordParams',
    # ACME compatibility helpers accept legacy/insecure input shapes and normalize internally.
    'PSAvoidUsingConvertToSecureStringWithPlainText'
)
$results = @(Invoke-ScriptAnalyzer -Path $ModuleRoot -Recurse -Severity Error -ExcludeRule $excludedRules)
if ($results.Count -gt 0) {
    $results | Format-Table -AutoSize
    throw "PSScriptAnalyzer found $($results.Count) error(s)."
}
