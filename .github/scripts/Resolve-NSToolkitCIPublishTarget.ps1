[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string] $GitHubRepository,

    [Parameter(Mandatory)]
    [string] $GitHubRef,

    [Parameter()]
    [string] $DevRepository,

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
$dryRun = ConvertTo-Bool -Value $DryRunRequested
$repository = 'None'
$reason = 'Publish was not requested.'

if ($publish) {
    if (-not [string]::IsNullOrWhiteSpace($DevRepository) -and $GitHubRepository -ieq $DevRepository) {
        $repository = 'PSTestGallery'
        $reason = "Repository '$GitHubRepository' matches dev repository '$DevRepository'."
    } elseif ($GitHubRef -eq 'refs/heads/main') {
        $repository = 'PSGallery'
        $reason = "Ref '$GitHubRef' is allowed to publish to PSGallery."
    } else {
        $reason = "Repository '$GitHubRepository' and ref '$GitHubRef' are not eligible for publishing."
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
