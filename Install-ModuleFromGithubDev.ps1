$ModuleName = 'NetScalerToolkit'
$RemoteBranch = 'dev'
$GitHubOwner = 'j81blog'

if ($PSVersionTable.PSEdition -eq 'Desktop') {
    $installPath = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'WindowsPowerShell\Modules'
} elseif ($IsWindows) {
    $installPath = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'PowerShell\Modules'
} else {
    $installPath = Join-Path $env:HOME '.local/share/powershell/Modules'
}

if (-not (Test-Path -LiteralPath $installPath)) {
    Write-Host "Creating module path: $installPath" -ForegroundColor Cyan
    New-Item -ItemType Directory -Force -Path $installPath | Out-Null
}

$scriptPath = if ($PSScriptRoot) {
    $PSScriptRoot
} elseif ($MyInvocation.MyCommand.Path) {
    Split-Path -Parent -Path $MyInvocation.MyCommand.Path
} else {
    $null
}

Write-Verbose "ScriptPath: $scriptPath"

if ([string]::IsNullOrWhiteSpace($scriptPath)) {
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    $url = "https://github.com/$GitHubOwner/$ModuleName/archive/refs/heads/$RemoteBranch.zip"
    $archivePath = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath "$ModuleName-$RemoteBranch.zip"
    $extractRoot = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath "$ModuleName-$RemoteBranch"

    Write-Host "Downloading $ModuleName from $url" -ForegroundColor Cyan
    try {
        if (Test-Path -LiteralPath $archivePath) { Remove-Item -LiteralPath $archivePath -Force }
        if (Test-Path -LiteralPath $extractRoot) { Remove-Item -LiteralPath $extractRoot -Recurse -Force }

        Invoke-WebRequest -Uri $url -OutFile $archivePath -UseBasicParsing -ErrorAction Stop
        Expand-Archive -LiteralPath $archivePath -DestinationPath $extractRoot -Force

        $sourceModulePath = Join-Path -Path $extractRoot -ChildPath "$ModuleName-$RemoteBranch\$ModuleName"
        if (-not (Test-Path -LiteralPath $sourceModulePath -PathType Container)) {
            throw "Module folder not found in downloaded archive: $sourceModulePath"
        }

        $targetModulePath = Join-Path -Path $installPath -ChildPath $ModuleName
        if (Test-Path -LiteralPath $targetModulePath) {
            Write-Host "Removing existing module path: $targetModulePath" -ForegroundColor Cyan
            Remove-Item -LiteralPath $targetModulePath -Recurse -Force
        }

        Write-Host "Installing $ModuleName to $targetModulePath" -ForegroundColor Cyan
        Copy-Item -LiteralPath $sourceModulePath -Destination $installPath -Recurse -Force
    } finally {
        Remove-Item -LiteralPath $archivePath -Force -ErrorAction SilentlyContinue
        Remove-Item -LiteralPath $extractRoot -Recurse -Force -ErrorAction SilentlyContinue
    }
} else {
    $sourceModulePath = Join-Path -Path $scriptPath -ChildPath $ModuleName
    if (-not (Test-Path -LiteralPath $sourceModulePath -PathType Container)) {
        throw "Module folder not found next to installer script: $sourceModulePath"
    }

    $targetModulePath = Join-Path -Path $installPath -ChildPath $ModuleName
    if (Test-Path -LiteralPath $targetModulePath) {
        Write-Host "Removing existing module path: $targetModulePath" -ForegroundColor Cyan
        Remove-Item -LiteralPath $targetModulePath -Recurse -Force
    }

    Write-Host "Installing local $ModuleName from $sourceModulePath" -ForegroundColor Cyan
    Copy-Item -LiteralPath $sourceModulePath -Destination $installPath -Recurse -Force
}

Import-Module -Name $ModuleName -Force

Write-Host "$ModuleName has been installed and loaded." -ForegroundColor Green
Get-Command -Module $ModuleName | Sort-Object Name | ForEach-Object {
    Write-Host " => $($_.Name)" -ForegroundColor Cyan
}
