[CmdletBinding()]
param(
    [switch]$Strict
)

$ErrorActionPreference = 'Stop'
$docsRoot = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')
$mkdocs = Join-Path $docsRoot 'mkdocs.yml'
$python = Join-Path $docsRoot '.venv\Scripts\python.exe'
if (-not (Test-Path -LiteralPath $python)) {
    $python = 'python'
}

$arguments = @('-m', 'mkdocs', 'build', '-f', $mkdocs)
if ($Strict) { $arguments += '--strict' }

$env:NO_MKDOCS_2_WARNING = 'true'
& $python @arguments
if ($LASTEXITCODE -ne 0) {
    throw "MkDocs build failed with exit code $LASTEXITCODE."
}
