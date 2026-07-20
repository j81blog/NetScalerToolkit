function Copy-NSACMECertificateArtifactsToCertDir {
<#
    .SYNOPSIS
        Copies generated Posh-ACME certificate artifacts to the configured CertDir.

    .DESCRIPTION
        Preserves legacy script behavior by copying generated certificate files from
        Posh-ACME storage into the request CertDir. The target folder uses the
        legacy GenLeCertForNS format `LECRT-yyyyMMdd-HHmmss-<common-name>`.

    .PARAMETER Certificate
        Posh-ACME certificate object.

    .PARAMETER CertDir
        Target certificate directory configured for the request.

    .PARAMETER CommonName
        Request common name used as a fallback leaf folder.

    .NOTES
        Function  : Copy-NSACMECertificateArtifactsToCertDir
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.0608.1619
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [object]$Certificate,

        [Parameter(Mandatory)]
        [string]$CertDir,

        [Parameter(Mandatory)]
        [string]$CommonName
    )

    $sourcePath = @(
        $Certificate.PfxFullChain,
        $Certificate.PfxFile,
        $Certificate.FullChainFile,
        $Certificate.ChainFile,
        $Certificate.CertFile
    ) | Where-Object { $_ } | Select-Object -First 1

    if (-not $sourcePath -or -not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
        return $Certificate
    }

    $sourceDomainDir = Split-Path -Parent $sourcePath
    if (-not (Test-Path -LiteralPath $sourceDomainDir -PathType Container)) {
        return $Certificate
    }

    $leafFolderName = ($CommonName -replace '^\*\.', '') -replace '[^a-zA-Z0-9_.=@:-]', '_'
    $timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $targetRoot = Join-Path $CertDir ("LECRT-{0}-{1}" -f $timestamp, $leafFolderName)

    if (-not (Test-Path -LiteralPath $targetRoot -PathType Container)) {
        New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
    }

    foreach ($fileName in 'cert.cer', 'cert.key', 'cert.pfx', 'chain.cer', 'chain0.cer', 'chain1.cer', 'fullchain.cer', 'fullchain.pfx', 'order.json', 'request.csr') {
        $sourceFile = Join-Path $sourceDomainDir $fileName
        if (Test-Path -LiteralPath $sourceFile -PathType Leaf) {
            Copy-Item -LiteralPath $sourceFile -Destination (Join-Path $targetRoot $fileName) -Force
        }
    }

    foreach ($propertyName in 'PfxFullChain', 'PfxFile', 'FullChainFile', 'ChainFile', 'CertFile', 'KeyFile', 'CSRFile', 'OrderFile') {
        if (-not ($Certificate.PSObject.Properties.Name -contains $propertyName)) { continue }
        $propertyValue = [string]$Certificate.$propertyName
        if ([string]::IsNullOrWhiteSpace($propertyValue)) { continue }
        if (-not (Test-Path -LiteralPath $propertyValue -PathType Leaf)) { continue }

        $targetPath = Join-Path $targetRoot (Split-Path -Leaf $propertyValue)
        if (Test-Path -LiteralPath $targetPath -PathType Leaf) {
            Set-NSACMECertificateNoteProperty -InputObject $Certificate -Name $propertyName -Value $targetPath
        }
    }

    Write-NSACMECertificateLog Info 'ACME' "Copied ACME certificate artifacts for $CommonName to '$targetRoot'."
    return $Certificate
}
