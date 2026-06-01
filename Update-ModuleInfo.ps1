[CmdletBinding()]
param (
    [string]$ModuleName = 'NetScalerToolkit'
)

function Get-DateTimeVersionString {
    param (
        [datetime]$DateTime = [DateTime]::Now
    )
    $Hour = [Int]$DateTime.ToString("HH")
    if ($DateTime.Minute -eq 0) {
        $Minutes = 0
    } elseif ($DateTime.Minute -gt 0 -and $DateTime.Minute -le 15) {
        $Minutes = 15
    } elseif ($DateTime.Minute -le 30) {
        $Minutes = 30
    } elseif ($DateTime.Minute -le 45) {
        $Minutes = 45
    } else {
        $Minutes = 0
        if ($Hour -lt 23) {
            $Hour++
        } else {
            $DateTime = $DateTime.AddHours(1)
            $Hour = 0
        }
    }
    return '{0}{1:d2}{2:d2}' -f $DateTime.ToString("yyyy.Mdd."), $Hour, $Minutes
}

$NewVersion = Get-DateTimeVersionString

$manifestFiles = Get-ChildItem -Path "$PSScriptRoot\*" -Filter *.psd1 -Recurse

ForEach ($manifestFile in $manifestFiles) {
    $manifestPath = $manifestFile.FullName
    Write-Host "Updating module manifest at $manifestPath to version $NewVersion..." -ForegroundColor Cyan
    Update-ModuleManifest -Path $manifestPath -ModuleVersion $NewVersion -ErrorAction Stop
}

if (Get-Module J81FunctionLibrary) {
    Write-Host "Signing all module files with a valid code signing certificate..." -ForegroundColor Cyan
    Get-ChildItem -Path "$PSScriptRoot\$ModuleName\*" -Recurse -Include *.ps1, *.psd1, *.psm1 | Set-Signature -ValidatePS
    Write-Host "Module manifest and scripts have been updated and signed. You can now commit the changes to GitHub." -ForegroundColor Green
}
Write-Host "`r`nUpdated $ModuleName module manifest to version $NewVersion.`r`n" -ForegroundColor Green
