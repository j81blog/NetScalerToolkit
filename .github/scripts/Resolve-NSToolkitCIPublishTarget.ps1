[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string] $GitHubRepository,

    [Parameter(Mandatory)]
    [string] $GitHubRef,

    [Parameter()]
    [string] $GitHubEventName,

    [Parameter()]
    [string] $PublishRequested,

    [Parameter()]
    [string] $DryRunRequested,

    [Parameter()]
    [string] $OutputPath = $env:GITHUB_OUTPUT
)

$ErrorActionPreference = 'Stop'

function ConvertTo-Bool {
    param([string] $Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return $false
    }

    return [System.Convert]::ToBoolean($Value)
}

$publish = ConvertTo-Bool -Value $PublishRequested
if ($GitHubEventName -eq 'push') {
    $publish = $true
}

$dryRun = ConvertTo-Bool -Value $DryRunRequested
$repository = 'None'
$reason = 'Publish was not requested.'

if ($publish) {
    if ($GitHubRef -eq 'refs/heads/main') {
        $repository = 'PSGallery'
        $reason = "Ref '$GitHubRef' is allowed to publish to PSGallery."
    } elseif ($GitHubRef -eq 'refs/heads/dev') {
        $repository = 'PSTestGallery'
        $reason = "Ref '$GitHubRef' is allowed to publish to Posh Test Gallery."
    } else {
        $reason = "Ref '$GitHubRef' is not eligible for publishing."
    }
}

Write-Host "Publish requested: $publish"
Write-Host "Publish dry run: $dryRun"
Write-Host "Publish target: $repository"
Write-Host "Publish reason: $reason"

if ($OutputPath) {
    @(
        "publish=$($publish.ToString().ToLowerInvariant())"
        "dry_run=$($dryRun.ToString().ToLowerInvariant())"
        "repository=$repository"
        "reason=$reason"
    ) | Add-Content -LiteralPath $OutputPath
}
