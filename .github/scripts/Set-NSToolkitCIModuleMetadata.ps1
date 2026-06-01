[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string] $ModuleRoot,

    [Parameter()]
    [string] $ModuleVersion,

    [Parameter()]
    [string] $Prerelease
)

$ErrorActionPreference = 'Stop'

$manifestPaths = @(Get-ChildItem -Path $ModuleRoot -Filter '*.psd1' -Recurse)

if (-not [string]::IsNullOrWhiteSpace($ModuleVersion)) {
    [version] $ModuleVersion | Out-Null
    foreach ($manifest in $manifestPaths) {
        Write-Host "Stamping module version $ModuleVersion in $($manifest.FullName)"
        Update-ModuleManifest -Path $manifest.FullName -ModuleVersion $ModuleVersion
    }
}

if ($PSBoundParameters.ContainsKey('Prerelease')) {
    $prereleaseValue = $Prerelease.Trim()

    foreach ($manifest in $manifestPaths) {
        $text = Get-Content -LiteralPath $manifest.FullName -Raw
        $text = [regex]::Replace($text, "(?m)^\s*Prerelease\s*=\s*'.*'\s*\r?\n", '')
        $text = [regex]::Replace($text, "(?m)^\s*#\s*Prerelease\s*=\s*'.*'\s*$", "        # Prerelease = ''")

        if ($prereleaseValue) {
            if ($text -match "(?m)^\s*#\s*Prerelease\s*=\s*''\s*$") {
                $text = [regex]::Replace($text, "(?m)^(\s*)#\s*Prerelease\s*=\s*''\s*$", "`${1}Prerelease = '$prereleaseValue'")
            } elseif ($text -match '(?m)^\s*PSData\s*=\s*@\{') {
                $text = [regex]::Replace($text, '(?m)^(\s*PSData\s*=\s*@\{\s*)$', "`${1}`r`n        Prerelease = '$prereleaseValue'")
            } else {
                throw "Could not locate PrivateData.PSData in $($manifest.FullName)."
            }
        }

        Set-Content -LiteralPath $manifest.FullName -Value $text -Encoding UTF8
    }
}
