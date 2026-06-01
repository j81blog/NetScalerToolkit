[CmdletBinding()]
param(
    [Parameter()]
    [string] $ModuleName = 'NetScalerToolkit',

    [Parameter()]
    [string] $ModuleRoot = 'NetScalerToolkit',

    [Parameter()]
    [string] $PackageRoot = 'artifacts'
)

$ErrorActionPreference = 'Stop'

$packagePath = Join-Path $PackageRoot $ModuleName

if (Test-Path -LiteralPath $PackageRoot) {
    Remove-Item -LiteralPath $PackageRoot -Recurse -Force
}

New-Item -Path $PackageRoot -ItemType Directory -Force | Out-Null
Copy-Item -Path $ModuleRoot -Destination $PackageRoot -Recurse -Force

Copy-Item -LiteralPath README.md -Destination $packagePath -Force
Copy-Item -LiteralPath LICENSE -Destination $packagePath -Force

if (Test-Path -LiteralPath GenLeCertForNS.ps1) {
    Copy-Item -LiteralPath GenLeCertForNS.ps1 -Destination $packagePath -Force
}

$excludePatterns = @(
    '.git',
    '.github',
    'AI',
    'Tests',
    '*.log',
    'TempApi.txt',
    '*.bak',
    '*.tmp'
)

foreach ($pattern in $excludePatterns) {
    Get-ChildItem -Path $packagePath -Recurse -Force -ErrorAction SilentlyContinue -Filter $pattern |
        Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
}

$manifestPath = Join-Path $packagePath "$ModuleName.psd1"
Test-ModuleManifest -Path $manifestPath | Out-Null

Import-Module (Resolve-Path $manifestPath).Path -Force
$commands = @(Get-Command -Module $ModuleName)
if ($commands.Count -lt 1) {
    throw 'Clean package import exported no commands.'
}

Get-ChildItem -Path $packagePath -Recurse -File |
    Select-Object FullName, Length |
    Sort-Object FullName |
    Out-File -FilePath (Join-Path $PackageRoot 'package-file-list.txt') -Encoding utf8

Write-Host "Clean package exported command count: $($commands.Count)"
