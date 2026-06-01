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
    [string] $RepositorySourceLocation,

    [Parameter()]
    [string] $ApiKey,

    [Parameter()]
    [switch] $DryRun
)

$ErrorActionPreference = 'Stop'

if ($Repository -eq 'PSTestGallery') {
    if ([string]::IsNullOrWhiteSpace($RepositorySourceLocation)) {
        $RepositorySourceLocation = 'https://www.poshtestgallery.com/api/v2/'
    }

    if (-not (Get-PSRepository -Name PSTestGallery -ErrorAction SilentlyContinue)) {
        Register-PSRepository -Name PSTestGallery -SourceLocation $RepositorySourceLocation -PublishLocation $RepositorySourceLocation -InstallationPolicy Trusted
    }
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
