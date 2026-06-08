<#
.SYNOPSIS
    Compatibility wrapper for the legacy GenLeCertForNS.ps1 entry point.

.DESCRIPTION
    This script lets existing scheduled tasks and batch files keep calling
    GenLeCertForNS.ps1 while the implementation lives in the NetScalerToolkit
    module. All arguments are forwarded to Request-NSACMECertificate.

    When the script is run from the repository root, it imports the local module
    manifest first. If that is not present, it falls back to an installed
    NetScalerToolkit module. If NetScalerToolkit is not installed, the wrapper
    installs the latest gallery version for the current user and imports it.

    For legacy GenLeCertForNS compatibility, the wrapper adds
    -SkipCertificateCheck by default for NetScaler-connected operations unless
    the caller already specified -SkipCertificateCheck. Call
    Request-NSACMECertificate directly when strict management certificate
    validation is required.

    The wrapper does not update the module on every certificate run. Use the
    Request-NSACMECertificate -AutoUpdate parameter, or set
    NETSCALERTOOLKIT_WRAPPER_UPDATE to 1, true, or yes, when you explicitly want
    to install the latest PowerShell Gallery version before forwarding to
    Request-NSACMECertificate.

    Pass -SkipPoshACMEInstall to forward that opt-out switch to
    Request-NSACMECertificate and disable automatic Posh-ACME installation.

.EXAMPLE
    .\GenLeCertForNS.ps1 -CN example.com -CertDir C:\Certificates -NSManagementURL https://adc.example.com -NSUsername nsroot -NSPassword nsroot

.EXAMPLE
    .\GenLeCertForNS.ps1 -ConfigFile .\GenLeCertForNS.json -AutoRun

.EXAMPLE
    .\GenLeCertForNS.ps1 -AutoUpdate -ConfigFile .\GenLeCertForNS.json -AutoRun
#>

$ErrorActionPreference = 'Stop'

$updateNetScalerToolkit = [string]$env:NETSCALERTOOLKIT_WRAPPER_UPDATE -match '^(1|true|yes)$'
$skipCertificateCheckSpecified = $false
$skipCertificateCheckEligible = $true
$cleanAllExpiredRequested = $false
foreach ($argument in @($args)) {
    if ($argument -isnot [string]) { continue }
    if ($argument -ieq '-AutoUpdate') {
        $updateNetScalerToolkit = $true
        continue
    }
    if ($argument -match '^-AutoUpdate:(.+)$') {
        $updateNetScalerToolkit = [System.Management.Automation.LanguagePrimitives]::ConvertTo($Matches[1], [bool])
    }
    if ($argument -ieq '-SkipCertificateCheck' -or $argument -match '^-SkipCertificateCheck:.+$') {
        $skipCertificateCheckSpecified = $true
    }
    if ($argument -iin @('-Help', '-h', '-CleanAllExpiredCertsOnDisk')) {
        $skipCertificateCheckEligible = $false
    }
    if ($argument -ieq '-CleanAllExpiredCertsOnDisk') {
        $cleanAllExpiredRequested = $true
    }
}

function Install-LatestNetScalerToolkit {
    $installModuleCommand = Get-Command -Name Install-Module -ErrorAction SilentlyContinue
    if (-not $installModuleCommand) {
        throw 'Install-Module is not available. Install PowerShellGet or install NetScalerToolkit manually.'
    }

    $availableVersion = $null
    $findModuleCommand = Get-Command -Name Find-Module -ErrorAction SilentlyContinue
    if ($findModuleCommand.Version -lt [Version]'2.2') {
        Install-Module PowerShellGet -Force -AllowClobber
		Import-Module PowerShellGet -Force
        $available = Find-Module -Name NetScalerToolkit -Repository PSGallery -AllowPrerelease -ErrorAction Stop
        if ($available) { $availableVersion = [string]$available.Version }
    } elseif ($findModuleCommand) {
        $available = Find-Module -Name NetScalerToolkit -Repository PSGallery -AllowPrerelease -ErrorAction Stop
        if ($available) { $availableVersion = [string]$available.Version }
    } else {
        Install-Module PowerShellGet -Force -AllowClobber
		Import-Module PowerShellGet -Force
        $available = Find-Module -Name NetScalerToolkit -Repository PSGallery -AllowPrerelease -ErrorAction Stop
        if ($available) { $availableVersion = [string]$available.Version }
    }

    Install-Module -Name NetScalerToolkit -Scope CurrentUser -Force -AllowClobber -AllowPrerelease -ErrorAction Stop
    [PSCustomObject]@{
        ModuleName       = 'NetScalerToolkit'
        AvailableVersion = $availableVersion
        Message          = if ($availableVersion) { "Installed NetScalerToolkit $availableVersion from PSGallery before module import." } else { 'Installed latest NetScalerToolkit from PSGallery before module import.' }
    }
}

$localManifestCandidates = @(
    (Join-Path -Path $PSScriptRoot -ChildPath 'NetScalerToolkit\NetScalerToolkit.psd1'),
    (Join-Path -Path $PSScriptRoot -ChildPath 'NetScalerToolkit.psd1')
)
$localManifest = $localManifestCandidates | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if ($localManifest) {
    Import-Module $localManifest -Force
} else {
    if ($updateNetScalerToolkit) {
        $wrapperUpdateResult = Install-LatestNetScalerToolkit
        $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE = '1'
        $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE = $wrapperUpdateResult.Message
    }

    try {
        Import-Module NetScalerToolkit -ErrorAction Stop
    } catch {
        $wrapperUpdateResult = Install-LatestNetScalerToolkit
        $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE = $wrapperUpdateResult.Message
        Import-Module NetScalerToolkit -Force -ErrorAction Stop
    }

    if ($updateNetScalerToolkit -and [string]$env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE -ne '1') {
        $updateCommand = Get-Command Update-NetScalerToolkit -ErrorAction Stop
        $null = & $updateCommand -Confirm:$false
        Remove-Module NetScalerToolkit -Force -ErrorAction SilentlyContinue
        Import-Module NetScalerToolkit -Force -ErrorAction Stop
        $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE = '1'
        $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE = 'Updated NetScalerToolkit from PSGallery before module import.'
    }
}

$commandName = 'Request-NSACMECertificate'
$null = Get-Command $commandName -ErrorAction Stop
try {
    if ($cleanAllExpiredRequested) {
        Write-Warning "GenLeCertForNS compatibility mode: forwarding -CleanAllExpiredCertsOnDisk to Request-NSACMECertificate."
    }
    if ($skipCertificateCheckEligible -and -not $skipCertificateCheckSpecified) {
        & $commandName -SkipCertificateCheck @args
    } else {
        & $commandName @args
    }
} finally {
    if ([string]$env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE -eq '1') {
        Remove-Item Env:\NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE -ErrorAction SilentlyContinue
    }
    Remove-Item Env:\NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE -ErrorAction SilentlyContinue
}
