[CmdletBinding()]
param(
    [Parameter()]
    [string] $ModuleName = 'NetScalerToolkit',

    [Parameter(Mandatory)]
    [string] $PackagePath,

    [Parameter(Mandatory)]
    [ValidateSet('PSGallery', 'PSTestGallery')]
    [string] $Repository,

    [Parameter()]
    [string] $ApiKey,

    [Parameter()]
    [switch] $DryRun
)

$ErrorActionPreference = 'Stop'

function Get-NSToolkitCIPackageVersion {
    param(
        [Parameter(Mandatory)]
        [string] $ModuleName,

        [Parameter(Mandatory)]
        [string] $PackagePath
    )

    $manifestPath = Join-Path -Path $PackagePath -ChildPath "$ModuleName.psd1"
    if (-not (Test-Path -LiteralPath $manifestPath)) {
        throw "Module manifest was not found in package path: $manifestPath"
    }

    $manifest = Import-PowerShellDataFile -LiteralPath $manifestPath
    $moduleVersion = [string]$manifest.ModuleVersion
    if ([string]::IsNullOrWhiteSpace($moduleVersion)) {
        throw "ModuleVersion was not found in manifest: $manifestPath"
    }

    $prerelease = $null
    if ($manifest.PrivateData -and $manifest.PrivateData.PSData -and $manifest.PrivateData.PSData.ContainsKey('Prerelease')) {
        $prerelease = [string]$manifest.PrivateData.PSData.Prerelease
    }

    if ([string]::IsNullOrWhiteSpace($prerelease)) {
        return $moduleVersion
    }

    return "$moduleVersion-$prerelease"
}

function Test-NSToolkitCIPackageVersionExists {
    param(
        [Parameter(Mandatory)]
        [string] $ModuleName,

        [Parameter(Mandatory)]
        [string] $Repository,

        [Parameter(Mandatory)]
        [string] $PackageVersion
    )

    $findParams = @{
        Name        = $ModuleName
        Repository  = $Repository
        AllVersions = $true
        ErrorAction = 'Stop'
    }

    if ($PackageVersion -match '-') {
        $findParams.AllowPrerelease = $true
    }

    try {
        $foundModules = @(Find-Module @findParams)
    } catch {
        if ($_.Exception.Message -match 'No match was found|No packages found|Unable to find') {
            return $false
        }

        throw
    }

    $versions = @($foundModules | ForEach-Object {
            $candidateVersions = @($_.Version.ToString())
            if ($_.AdditionalMetadata) {
                foreach ($propertyName in 'version', 'normalizedVersion', 'NormalizedVersion') {
                    if ($_.AdditionalMetadata -is [System.Collections.IDictionary] -and $_.AdditionalMetadata.Contains($propertyName)) {
                        $candidateVersions += [string]$_.AdditionalMetadata[$propertyName]
                    } elseif ($_.AdditionalMetadata.PSObject.Properties.Name -contains $propertyName) {
                        $candidateVersions += [string]$_.AdditionalMetadata.$propertyName
                    }
                }
            }

            $candidateVersions | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
        })

    return ($versions | Where-Object { $_ -eq $PackageVersion } | Select-Object -First 1) -ne $null
}

if ($Repository -eq 'PSTestGallery') {
    $repositorySourceLocation = 'https://www.poshtestgallery.com/api/v2'
    $repositoryPublishLocation = 'https://www.poshtestgallery.com/api/v2/package/'
    $scriptSourceLocation = 'https://www.poshtestgallery.com/api/v2/items/psscript'
    $scriptPublishLocation = 'https://www.poshtestgallery.com/api/v2/package/'

    Write-Host "Using Posh Test Gallery endpoint: $repositorySourceLocation"

    if (-not (Get-PSRepository -Name PSTestGallery -ErrorAction SilentlyContinue)) {
        Register-PSRepository `
            -Name PSTestGallery `
            -SourceLocation $repositorySourceLocation `
            -PublishLocation $repositoryPublishLocation `
            -ScriptSourceLocation $scriptSourceLocation `
            -ScriptPublishLocation $scriptPublishLocation `
            -InstallationPolicy Trusted
    }
}

$packageVersion = Get-NSToolkitCIPackageVersion -ModuleName $ModuleName -PackagePath $PackagePath
Write-Host "Package version: $ModuleName $packageVersion"

if (Test-NSToolkitCIPackageVersionExists -ModuleName $ModuleName -Repository $Repository -PackageVersion $packageVersion) {
    Write-Host "Package version already exists in repository '$Repository': $ModuleName $packageVersion. Publish skipped."
    return
}

$publishParams = @{
    Path       = $PackagePath
    Repository = $Repository
    Force      = $true
}

if ($DryRun) {
    $publishParams.NuGetApiKey = if ([string]::IsNullOrWhiteSpace($ApiKey)) { 'WHATIF' } else { $ApiKey }
    $publishParams.WhatIf = $true
    Write-Host "Dry run: Publish-Module -Path '$PackagePath' -Repository '$Repository' -WhatIf"
} elseif ([string]::IsNullOrWhiteSpace($ApiKey)) {
    throw "An API key is required to publish $ModuleName to $Repository."
} else {
    $publishParams.NuGetApiKey = $ApiKey
}

Publish-Module @publishParams
