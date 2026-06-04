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
