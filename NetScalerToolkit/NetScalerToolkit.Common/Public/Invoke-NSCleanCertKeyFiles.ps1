function ConvertTo-NSCleanCertKeyFilesArray {
    param([object] $InputObject)

    # NITRO may return null, one object, or an array depending on result count.
    if ($null -eq $InputObject) { return @() }
    if ($InputObject -is [System.Array]) { return @($InputObject) }
    return @($InputObject)
}

function Get-NSCleanCertKeyFilesName {
    param([string] $Path)

    if ([string]::IsNullOrWhiteSpace($Path)) { return $null }
    $normalized = $Path.Replace('\', '/').TrimEnd('/')
    if ([string]::IsNullOrWhiteSpace($normalized)) { return $null }
    return ($normalized -split '/')[-1]
}

function Test-NSCleanCertKeyFilesExcludedFile {
    param(
        [Parameter(Mandatory)]
        [string] $FileName,

        [Parameter(Mandatory)]
        [string[]] $ExcludeFile,

        [Parameter(Mandatory)]
        [string[]] $ExcludeFilePattern
    )

    if ($ExcludeFile -contains $FileName) { return $true }
    foreach ($pattern in $ExcludeFilePattern) {
        if ($FileName -like $pattern) { return $true }
    }

    return $false
}

function Add-NSCleanCertKeyReference {
    param(
        [Parameter(Mandatory)]
        [System.Collections.IDictionary] $ReferenceMap,

        [string] $CertKey,

        [string] $Reason
    )

    if ([string]::IsNullOrWhiteSpace($CertKey)) { return }
    # Reference reasons are accumulated per certkey and later make removal impossible.
    if (-not $ReferenceMap.Contains($CertKey)) {
        $ReferenceMap[$CertKey] = [System.Collections.Generic.List[string]]::new()
    }

    if ($ReferenceMap[$CertKey] -notcontains $Reason) {
        $ReferenceMap[$CertKey].Add($Reason) | Out-Null
    }
}

function Add-NSCleanCertKeyReferenceForAll {
    param(
        [Parameter(Mandatory)]
        [System.Collections.IDictionary] $ReferenceMap,

        [Parameter(Mandatory)]
        [object[]] $CertKey,

        [Parameter(Mandatory)]
        [string] $Reason
    )

    foreach ($item in $CertKey) {
        Add-NSCleanCertKeyReference -ReferenceMap $ReferenceMap -CertKey $item.certkey -Reason $Reason
    }
}

function Invoke-NSCleanCertKeyFilesOperation {
    param(
        [Parameter(Mandatory)]
        [string] $Operation,

        [Parameter(Mandatory)]
        [scriptblock] $ScriptBlock
    )

    Write-Verbose ('Cleanup operation started: {0}' -f $Operation)
    try {
        $result = & $ScriptBlock
        Write-Verbose ('Cleanup operation completed: {0}' -f $Operation)
        return $result
    } catch {
        Write-Verbose ('Cleanup operation failed: {0}. {1}' -f $Operation, $_.Exception.Message)
        $exception = [System.InvalidOperationException]::new(
            ('NetScaler certificate cleanup failed while running "{0}": {1}' -f $Operation, $_.Exception.Message),
            $_.Exception
        )
        $errorRecord = [System.Management.Automation.ErrorRecord]::new(
            $exception,
            'NSCleanCertKeyFilesOperationFailed',
            [System.Management.Automation.ErrorCategory]::NotSpecified,
            $Operation
        )
        throw $errorRecord
    }
}

function New-NSCleanCertKeyFilesSummary {
    param(
        [Parameter(Mandatory)]
        [object] $InitialPlan,

        [Parameter(Mandatory)]
        [object] $FinalPlan,

        [object[]] $RemovedCertKey,

        [object[]] $RemovedFile,

        [Parameter(Mandatory)]
        [bool] $Changed,

        [Parameter(Mandatory)]
        [bool] $SavedConfig
    )

    [pscustomobject] @{
        PSTypeName = 'NetScalerToolkit.CertKeyCleanup.Summary'
        InitialCertKeys = @($InitialPlan.CertKeys).Count
        FinalCertKeys = @($FinalPlan.CertKeys).Count
        RemovedCertKeys = @($RemovedCertKey).Count
        RemainingRemovableCertKeys = @($FinalPlan.CertKeys | Where-Object { $_.Removable }).Count
        InitialFiles = @($InitialPlan.Files).Count
        FinalFiles = @($FinalPlan.Files).Count
        RemovedFiles = @($RemovedFile).Count
        RemainingRemovableFiles = @($FinalPlan.Files | Where-Object { $_.Removable }).Count
        Changed = $Changed
        SavedConfig = $SavedConfig
    }
}

function Add-NSCleanCertKeyFilesResultMetadata {
    param(
        [Parameter(Mandatory)]
        [object] $Plan,

        [object[]] $RemovedCertKey,

        [object[]] $RemovedFile
    )

    $Plan | Add-Member -NotePropertyName RemovedCertKeys -NotePropertyValue @($RemovedCertKey) -Force
    $Plan | Add-Member -NotePropertyName RemovedFiles -NotePropertyValue @($RemovedFile) -Force
    $Plan
}

function Write-NSCleanCertKeyFilesSummary {
    param(
        [Parameter(Mandatory)]
        [object] $Summary
    )

    Write-Host 'NetScaler certificate cleanup summary'
    Write-Host ('  CertKeys: {0} initial, {1} final, {2} removed, {3} remaining removable' -f $Summary.InitialCertKeys, $Summary.FinalCertKeys, $Summary.RemovedCertKeys, $Summary.RemainingRemovableCertKeys)
    Write-Host ('  Files:    {0} initial, {1} final, {2} removed, {3} remaining removable' -f $Summary.InitialFiles, $Summary.FinalFiles, $Summary.RemovedFiles, $Summary.RemainingRemovableFiles)
    Write-Host ('  Changed: {0}' -f $Summary.Changed)
    Write-Host ('  Saved config: {0}' -f $Summary.SavedConfig)
}

function Test-NSCleanCertKeyFilesObjectHasValue {
    param([object] $InputObject)

    foreach ($item in (ConvertTo-NSCleanCertKeyFilesArray $InputObject)) {
        if ($null -eq $item) { continue }
        foreach ($property in $item.PSObject.Properties) {
            # Binding APIs can echo only the requested certkey name; that alone is not a real reference.
            if ($property.Name -in @('certkey', 'certkeyname')) { continue }
            if ($null -eq $property.Value) { continue }
            if ($property.Value -is [string] -and [string]::IsNullOrWhiteSpace($property.Value)) { continue }
            if ($property.Value -is [System.Array] -and $property.Value.Count -eq 0) { continue }
            return $true
        }
    }

    return $false
}

function Invoke-NSCleanCertKeyFilesOptionalCertKeyReferenceOperation {
    param(
        [Parameter(Mandatory)]
        [System.Collections.IDictionary] $ReferenceMap,

        [Parameter(Mandatory)]
        [string] $CertKey,

        [Parameter(Mandatory)]
        [string] $Operation,

        [Parameter(Mandatory)]
        [scriptblock] $ScriptBlock
    )

    try {
        return Invoke-NSCleanCertKeyFilesOperation -Operation $Operation -ScriptBlock $ScriptBlock
    } catch {
        # If an optional reference check fails, keep this certkey instead of risking a bad delete.
        $reason = 'reference check failed: {0}' -f $Operation
        Add-NSCleanCertKeyReference -ReferenceMap $ReferenceMap -CertKey $CertKey -Reason $reason
        Write-Warning ('Skipping cleanup for SSL certkey "{0}" because reference check "{1}" failed. {2}' -f $CertKey, $Operation, $_.Exception.Message)
        Write-Verbose ('Certkey "{0}" marked non-removable because optional reference check failed.' -f $CertKey)
        return $null
    }
}

function Get-NSCleanCertKeyFilesRunningConfigLine {
    param([object] $InputObject)

    foreach ($item in (ConvertTo-NSCleanCertKeyFilesArray $InputObject)) {
        if ($null -eq $item) { continue }
        if ($item -is [string]) {
            $item -split '\r?\n'
            continue
        }

        foreach ($property in $item.PSObject.Properties) {
            if ($null -eq $property.Value) { continue }
            if ($property.Value -is [string]) {
                $property.Value -split '\r?\n'
            } elseif ($property.Value -is [System.Array]) {
                Get-NSCleanCertKeyFilesRunningConfigLine -InputObject $property.Value
            }
        }
    }
}

function Test-NSCleanCertKeyFilesRunningConfigReference {
    param(
        [string[]] $Line,
        [Parameter(Mandatory)]
        [string] $Value,
        [string] $CertKeyDeclarationName
    )

    if ([string]::IsNullOrWhiteSpace($Value)) { return $false }
    $escapedValue = [regex]::Escape($Value)
    $escapedCertKey = if ($CertKeyDeclarationName) { [regex]::Escape($CertKeyDeclarationName) } else { $null }

    foreach ($configLine in $Line) {
        # Running config is a broad fallback for references not exposed by generated binding functions.
        if ($configLine -notmatch $escapedValue) { continue }
        if ($escapedCertKey -and $configLine -match "^\s*(add|set)\s+ssl\s+certKey\s+(`"?$escapedCertKey`"?'?)\b") {
            continue
        }
        return $true
    }

    return $false
}

function Get-NSCleanCertKeyFilesNodeSession {
    param([Parameter(Mandatory)][psobject] $Session)

    # HA sessions expose node-specific sessions so file removal can run on both nodes.
    $sessions = [System.Collections.Generic.List[object]]::new()
    if ($Session.PrimarySession -and $Session.PrimarySession.Session) {
        $sessions.Add($Session.PrimarySession) | Out-Null
    }

    if ($Session.SecondarySession -and $Session.SecondarySession.Session) {
        $sessions.Add($Session.SecondarySession) | Out-Null
    }

    if ($sessions.Count -eq 0) {
        $sessions.Add([pscustomobject] @{
            State = if ($Session.IsPrimary) { 'Primary' } elseif ($Session.IsSecondary) { 'Secondary' } else { 'Connected' }
            Session = $Session
        }) | Out-Null
    }

    return $sessions
}

function Get-NSCleanCertKeyFilesSystemFile {
    param(
        [Parameter(Mandatory)]
        [psobject] $Session,

        [Parameter(Mandatory)]
        [string] $FileLocation,

        [System.Collections.Generic.HashSet[string]] $VisitedLocation = ([System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase))
    )

    $normalizedLocation = '/' + $FileLocation.Trim('/') + '/'
    if (-not $VisitedLocation.Add($normalizedLocation)) { return @() }

    Write-Verbose ('Scanning certificate files in {0}.' -f $normalizedLocation)
    $systemFiles = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation ('Get system files from {0}' -f $normalizedLocation) -ScriptBlock {
            Invoke-NSGetSystemFile -Session $Session -FileLocation $normalizedLocation -ReturnNullOnNotFound
        }
    } catch {
        Write-Warning ('Skipping certificate file cleanup for location "{0}" because the file listing failed. {1}' -f $normalizedLocation, $_.Exception.Message)
        return @()
    }

    foreach ($file in (ConvertTo-NSCleanCertKeyFilesArray $systemFiles)) {
        if ($null -eq $file) { continue }
        $fileLocationValue = if ($file.filelocation) { $file.filelocation } else { $normalizedLocation }
        $fileName = $file.filename
        if ([string]::IsNullOrWhiteSpace($fileName)) { continue }

        if ($file.filemode -eq 'DIRECTORY' -or $file.filemode -eq 'DIR') {
            if ($fileName -notin @('.', '..')) {
                Write-Verbose ('Descending into certificate file directory {0}/{1}.' -f $fileLocationValue.TrimEnd('/'), $fileName)
                Get-NSCleanCertKeyFilesSystemFile -Session $Session -FileLocation (('{0}/{1}' -f $fileLocationValue.TrimEnd('/'), $fileName).TrimEnd('/') + '/') -VisitedLocation $VisitedLocation
            }
            continue
        }

        [pscustomobject] @{
            FileName = $fileName
            FileLocation = $fileLocationValue
            FileMode = $file.filemode
        }
    }
}

function Get-NSCleanCertKeyFilesPlan {
    param(
        [Parameter(Mandatory)]
        [psobject] $Session,

        [Parameter(Mandatory)]
        [string] $FileLocation,

        [Parameter(Mandatory)]
        [string[]] $ExcludeCertKey,

        [Parameter(Mandatory)]
        [string[]] $ExcludeFile,

        [Parameter(Mandatory)]
        [string[]] $ExcludeFilePattern
    )

    Write-Verbose ('Building NetScaler certificate cleanup plan for {0}.' -f $FileLocation)
    $certKeys = @(Invoke-NSCleanCertKeyFilesOperation -Operation 'Get SSL certkeys' -ScriptBlock {
        Invoke-NSGetSSLCertKey -Session $Session -ReturnNullOnNotFound
    } | Where-Object { $_.certkey })
    Write-Verbose ('Found {0} SSL certkey object(s).' -f $certKeys.Count)

    $referenceMap = [System.Collections.Specialized.OrderedDictionary]::new([System.StringComparer]::OrdinalIgnoreCase)
    $fileReferenceFailures = [System.Collections.Generic.List[string]]::new()
    $runningConfig = Invoke-NSCleanCertKeyFilesOperation -Operation 'Get running configuration' -ScriptBlock {
        Invoke-NSGetNsrunningconfig -Session $Session -ReturnNullOnNotFound
    }
    $runningConfigLines = @(Get-NSCleanCertKeyFilesRunningConfigLine $runningConfig)
    Write-Verbose ('Loaded {0} running configuration line(s) for conservative reference checks.' -f $runningConfigLines.Count)

    foreach ($certKey in $certKeys) {
        $name = $certKey.certkey
        Write-Verbose ('Checking references for SSL certkey "{0}".' -f $name)
        if ($certKey.linkcertkeyname) {
            Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $name -Reason ('linked to {0}' -f $certKey.linkcertkeyname)
            Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $certKey.linkcertkeyname -Reason ('linked from {0}' -f $name)
        }

        foreach ($bindingCommand in @(
            'Invoke-NSGetSSLCertKeyBinding',
            'Invoke-NSGetSSLCertKeyCrldistributionBinding',
            'Invoke-NSGetSSLCertKeyServiceBinding',
            'Invoke-NSGetSSLCertKeySSLOCSPResponderBinding',
            'Invoke-NSGetSSLCertKeySSLProfileBinding',
            'Invoke-NSGetSSLCertKeySSLVServerBinding'
        )) {
            $binding = Invoke-NSCleanCertKeyFilesOptionalCertKeyReferenceOperation -ReferenceMap $referenceMap -CertKey $name -Operation ('{0} for certkey {1}' -f $bindingCommand, $name) -ScriptBlock {
                & $bindingCommand -Session $Session -CertKey $name -ReturnNullOnNotFound
            }
            if (Test-NSCleanCertKeyFilesObjectHasValue -InputObject $binding) {
                Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $name -Reason $bindingCommand
            }
        }

        if (Test-NSCleanCertKeyFilesRunningConfigReference -Line $runningConfigLines -Value $name -CertKeyDeclarationName $name) {
            Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $name -Reason 'running config'
        }
    }

    $certLinks = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation 'Get SSL certificate links' -ScriptBlock {
            Invoke-NSGetSSLCertLink -Session $Session -ReturnNullOnNotFound
        }
    } catch {
        $reason = 'reference check failed: Get SSL certificate links'
        Add-NSCleanCertKeyReferenceForAll -ReferenceMap $referenceMap -CertKey $certKeys -Reason $reason
        Write-Warning ('Skipping certkey cleanup for this run because reference check "Get SSL certificate links" failed. {0}' -f $_.Exception.Message)
        $null
    }
    foreach ($link in (ConvertTo-NSCleanCertKeyFilesArray $certLinks)) {
        if ($link.certkeyname -and $link.linkcertkeyname) {
            Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $link.certkeyname -Reason ('linked to {0}' -f $link.linkcertkeyname)
            Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $link.linkcertkeyname -Reason ('linked from {0}' -f $link.certkeyname)
        }
    }

    $vpnBindings = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation 'Get VPN global SSL certkey bindings' -ScriptBlock {
            Invoke-NSGetVPNGlobalSSLCertKeyBinding -Session $Session -ReturnNullOnNotFound
        }
    } catch {
        $reason = 'reference check failed: Get VPN global SSL certkey bindings'
        Add-NSCleanCertKeyReferenceForAll -ReferenceMap $referenceMap -CertKey $certKeys -Reason $reason
        Write-Warning ('Skipping certkey cleanup for this run because reference check "Get VPN global SSL certkey bindings" failed. {0}' -f $_.Exception.Message)
        $null
    }
    foreach ($vpnBinding in (ConvertTo-NSCleanCertKeyFilesArray $vpnBindings)) {
        Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $vpnBinding.certkeyname -Reason 'VPN global binding'
    }

    $samlActions = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation 'Get authentication SAML actions' -ScriptBlock {
            Invoke-NSGetAuthenticationSAMLAction -Session $Session -ReturnNullOnNotFound
        }
    } catch {
        $reason = 'reference check failed: Get authentication SAML actions'
        Add-NSCleanCertKeyReferenceForAll -ReferenceMap $referenceMap -CertKey $certKeys -Reason $reason
        Write-Warning ('Skipping certkey cleanup for this run because reference check "Get authentication SAML actions" failed. {0}' -f $_.Exception.Message)
        $null
    }
    foreach ($samlAction in (ConvertTo-NSCleanCertKeyFilesArray $samlActions)) {
        Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $samlAction.samlidpcertname -Reason 'SAML IdP certificate'
        Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $samlAction.samlsigningcertname -Reason 'SAML signing certificate'
    }

    $referencedFiles = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($certKey in $certKeys) {
        foreach ($path in @($certKey.cert, $certKey.key)) {
            $name = Get-NSCleanCertKeyFilesName -Path $path
            if ($name) { $referencedFiles.Add($name) | Out-Null }
        }
    }

    $dhFiles = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $sslProfiles = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation 'Get SSL profiles' -ScriptBlock {
            Invoke-NSGetSSLProfile -Session $Session -ReturnNullOnNotFound
        }
    } catch {
        $reason = 'reference check failed: Get SSL profiles'
        $fileReferenceFailures.Add($reason) | Out-Null
        Write-Warning ('Skipping certificate file cleanup for this run because reference check "Get SSL profiles" failed. {0}' -f $_.Exception.Message)
        $null
    }
    foreach ($sslProfile in (ConvertTo-NSCleanCertKeyFilesArray $sslProfiles)) {
        $name = Get-NSCleanCertKeyFilesName -Path $sslProfile.dhfile
        if ($name) { $dhFiles.Add($name) | Out-Null }
    }
    $sslVServers = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation 'Get SSL vServers' -ScriptBlock {
            Invoke-NSGetSSLVServer -Session $Session -ReturnNullOnNotFound
        }
    } catch {
        $reason = 'reference check failed: Get SSL vServers'
        $fileReferenceFailures.Add($reason) | Out-Null
        Write-Warning ('Skipping certificate file cleanup for this run because reference check "Get SSL vServers" failed. {0}' -f $_.Exception.Message)
        $null
    }
    foreach ($sslVServer in (ConvertTo-NSCleanCertKeyFilesArray $sslVServers)) {
        $name = Get-NSCleanCertKeyFilesName -Path $sslVServer.dhfile
        if ($name) { $dhFiles.Add($name) | Out-Null }
    }
    Write-Verbose ('Found {0} SSL DH file reference(s).' -f $dhFiles.Count)

    $certKeyPlan = foreach ($certKey in $certKeys) {
        $name = $certKey.certkey
        $excluded = $ExcludeCertKey -contains $name
        $referenceReasons = if ($referenceMap.Contains($name)) { @($referenceMap[$name]) } else { @() }
        [pscustomobject] @{
            PSTypeName = 'NetScalerToolkit.CertKeyCleanup.CertKey'
            CertKey = $name
            Status = $certKey.status
            DaysToExpiration = $certKey.daystoexpiration
            CertFile = $certKey.cert
            KeyFile = $certKey.key
            Reference = $referenceReasons
            Excluded = $excluded
            Removable = (-not $excluded -and $referenceReasons.Count -eq 0)
        }
    }

    $filePlan = foreach ($file in (Get-NSCleanCertKeyFilesSystemFile -Session $Session -FileLocation $FileLocation)) {
        $fileName = $file.FileName
        $referenceReasons = [System.Collections.Generic.List[string]]::new()
        if (Test-NSCleanCertKeyFilesExcludedFile -FileName $fileName -ExcludeFile $ExcludeFile -ExcludeFilePattern $ExcludeFilePattern) { $referenceReasons.Add('excluded file') | Out-Null }
        if ($referencedFiles.Contains($fileName)) { $referenceReasons.Add('installed sslcertkey') | Out-Null }
        if ($dhFiles.Contains($fileName)) { $referenceReasons.Add('SSL DH file') | Out-Null }
        foreach ($failure in $fileReferenceFailures) { $referenceReasons.Add($failure) | Out-Null }
        if (Test-NSCleanCertKeyFilesRunningConfigReference -Line $runningConfigLines -Value $fileName) {
            $referenceReasons.Add('running config') | Out-Null
        }

        [pscustomobject] @{
            PSTypeName = 'NetScalerToolkit.CertKeyCleanup.File'
            FileName = $fileName
            FileLocation = $file.FileLocation
            Reference = @($referenceReasons)
            Removable = ($referenceReasons.Count -eq 0)
        }
    }

    $removableCertKeyNames = @($certKeyPlan | Where-Object Removable | ForEach-Object { $_.CertKey })
    $removableFileNames = @($filePlan | Where-Object Removable | ForEach-Object { '{0}/{1}' -f $_.FileLocation.TrimEnd('/'), $_.FileName })
    Write-Verbose ('Cleanup plan contains {0} removable certkey(s) and {1} removable file(s).' -f $removableCertKeyNames.Count, $removableFileNames.Count)
    if ($removableCertKeyNames.Count -gt 0) { Write-Debug ('Removable certkeys: {0}' -f ($removableCertKeyNames -join ', ')) }
    if ($removableFileNames.Count -gt 0) { Write-Debug ('Removable files: {0}' -f ($removableFileNames -join ', ')) }
    [pscustomobject] @{
        CertKeys = @($certKeyPlan)
        Files = @($filePlan)
    }
}

function Invoke-NSCleanCertKeyFiles {
    <#
    .SYNOPSIS
        Removes unused NetScaler SSL certkey objects and orphaned certificate files.
    .DESCRIPTION
        Scans SSL certkey objects, generated binding resources, selected global references, linked certificates, SAML actions,
        SSL DH file references, and the running configuration before removing anything. A certkey or file is only removed
        when no detected configuration reference remains.
    .PARAMETER ManagementUrl
        NetScaler management URL used to create a new HA-aware session.
    .PARAMETER Credential
        Credential used when connecting to the NetScaler.
    .PARAMETER Session
        Existing NetScaler session. If it contains PrimarySession and SecondarySession records, files are removed from both nodes.
    .PARAMETER SkipCertificateCheck
        Skips TLS certificate validation when creating a new NetScaler session with ManagementUrl and Credential.
    .PARAMETER UseNitroHeader
        Uses the NITRO authentication header when creating a new NetScaler session with ManagementUrl and Credential.
    .PARAMETER Backup
        Saves nsconfig and creates a full system backup before cleanup.
    .PARAMETER NoSaveConfig
        Skips saving nsconfig after cleanup.
    .PARAMETER Attempts
        Number of certkey removal scan attempts before file cleanup.
    .PARAMETER ExpirationDays
        Warns about remaining certificates expiring in this many days.
    .PARAMETER FileLocation
        NetScaler file location to scan for certificate files.
    .PARAMETER ExcludeCertKey
        SSL certkey names that must never be removed.
    .PARAMETER ExcludeFile
        Certificate file names that must never be removed.
    .PARAMETER ExcludeFilePattern
        Wildcard file-name patterns that must never be removed. Default patterns protect NetScaler SSL support files and certificate hash links.
    .PARAMETER PassThru
        Returns the final cleanup plan with removed certkey and file details.
    .PARAMETER Summary
        Writes a compact cleanup summary to the host and returns the final cleanup plan.
    .EXAMPLE
        Invoke-NSCleanCertKeyFiles -ManagementUrl 'https://ns-01.domain.local' -Credential (Get-Credential) -Backup -WhatIf
    .EXAMPLE
        $session = Connect-NSNode -ManagementUrl 'https://ns-01.domain.local' -Credential (Get-Credential) -HA -PassThru
        Invoke-NSCleanCertKeyFiles -Session $session -PassThru
    .LINK
        https://netscalertoolkit.j81.nl/module/reference/common/cert-key-files/clean/
    .LINK
        https://netscalertoolkit.j81.nl/
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'Session')]
    param(
        [Parameter(Mandatory, ParameterSetName = 'Connect')]
        [uri] $ManagementUrl,

        [Parameter(Mandatory, ParameterSetName = 'Connect')]
        [pscredential] $Credential,

        [Parameter(Mandatory, ParameterSetName = 'Session')]
        [psobject] $Session,

        [Parameter(ParameterSetName = 'Connect')]
        [switch] $SkipCertificateCheck,

        [Parameter(ParameterSetName = 'Connect')]
        [switch] $UseNitroHeader,

        [Parameter()]
        [switch] $Backup,

        [Parameter()]
        [switch] $NoSaveConfig,

        [Parameter()]
        [ValidateRange(1, 4)]
        [int] $Attempts = 2,

        [Parameter()]
        [int] $ExpirationDays = 30,

        [Parameter()]
        [string] $FileLocation = '/nsconfig/ssl/',

        [Parameter()]
        [string[]] $ExcludeCertKey = @('ns-server-certificate'),

        [Parameter()]
        [string[]] $ExcludeFile = @('adc-root-certs.crt', 'trusted_root_certs.pem'),

        [Parameter()]
        [string[]] $ExcludeFilePattern = @('ns-root.*', 'ns-server.*', 'ns-sftrust-root.*', 'ns-sftrust.*', '*.0', '*.1', '*.2', '*.3', '*.4', '*.5', '*.6', '*.7', '*.8', '*.9', '*.a', '*.b', '*.c', '*.d', '*.e', '*.f'),

        [Parameter()]
        [switch] $PassThru,

        [Parameter()]
        [switch] $Summary
    )

    if ($PSCmdlet.ParameterSetName -eq 'Connect') {
        Write-Verbose ('Connecting to NetScaler {0} with HA session discovery.' -f $ManagementUrl.AbsoluteUri)
        $connectParameters = @{
            ManagementUrl = $ManagementUrl
            Credential = $Credential
            HA = $true
            PassThru = $true
            SkipCertificateCheck = $SkipCertificateCheck
        }
        if ($UseNitroHeader) { $connectParameters.UseNitroHeader = $true }
        $Session = Connect-NSNode @connectParameters
    }

    $primarySession = if ($Session.PrimarySession -and $Session.PrimarySession.Session) { $Session.PrimarySession.Session } else { $Session }
    $nodeSessions = @(Get-NSCleanCertKeyFilesNodeSession -Session $Session)
    $changed = $false
    $savedConfig = $false
    $initialPlan = $null
    $removedCertKeys = [System.Collections.Generic.List[object]]::new()
    $removedFiles = [System.Collections.Generic.List[object]]::new()
    Write-Verbose ('Using {0} node session(s) for file cleanup: {1}.' -f $nodeSessions.Count, (($nodeSessions | ForEach-Object { $_.State }) -join ', '))

    if ($Backup) {
        $backupName = 'CleanCerts_{0}' -f (Get-Date -Format 'yyyyMMdd_HHmm')
        if ($PSCmdlet.ShouldProcess('NetScaler configuration', ('Create full system backup {0}' -f $backupName))) {
            Invoke-NSCleanCertKeyFilesOperation -Operation 'Save nsconfig before backup' -ScriptBlock {
                Invoke-NSSaveNSConfig -Session $primarySession -All $true -Confirm:$false
            } | Out-Null
            Invoke-NSCleanCertKeyFilesOperation -Operation ('Create system backup {0}' -f $backupName) -ScriptBlock {
                Invoke-NSCreateSystemBackup -Session $primarySession -FileName $backupName -Level full -Comment 'Backup created by Invoke-NSCleanCertKeyFiles' -Confirm:$false
            } | Out-Null
        }
    }

    for ($attempt = 1; $attempt -le $Attempts; $attempt++) {
        Write-Verbose ('Starting certkey cleanup attempt {0}/{1}.' -f $attempt, $Attempts)
        $plan = Get-NSCleanCertKeyFilesPlan -Session $primarySession -FileLocation $FileLocation -ExcludeCertKey $ExcludeCertKey -ExcludeFile $ExcludeFile -ExcludeFilePattern $ExcludeFilePattern
        if ($null -eq $initialPlan) { $initialPlan = $plan }
        $removableCertKeys = @($plan.CertKeys | Where-Object { $_.Removable })
        Write-Verbose ('Attempt {0}/{1} found {2} removable certkey object(s).' -f $attempt, $Attempts, $removableCertKeys.Count)
        if ($removableCertKeys.Count -eq 0) { break }

        foreach ($certKey in $removableCertKeys) {
            if ($PSCmdlet.ShouldProcess($certKey.CertKey, ('Delete unused SSL certkey, attempt {0}/{1}' -f $attempt, $Attempts))) {
                Invoke-NSCleanCertKeyFilesOperation -Operation ('Delete SSL certkey {0}' -f $certKey.CertKey) -ScriptBlock {
                    Invoke-NSDeleteSSLCertKey -Session $primarySession -CertKey $certKey.CertKey -Confirm:$false
                } | Out-Null
                $removedCertKeys.Add($certKey) | Out-Null
                Write-Debug ('Removed SSL certkey: {0}' -f $certKey.CertKey)
                $changed = $true
            }
        }
    }

    Write-Verbose 'Refreshing cleanup plan before deleting certificate files.'
    $plan = Get-NSCleanCertKeyFilesPlan -Session $primarySession -FileLocation $FileLocation -ExcludeCertKey $ExcludeCertKey -ExcludeFile $ExcludeFile -ExcludeFilePattern $ExcludeFilePattern
    foreach ($file in @($plan.Files | Where-Object { $_.Removable })) {
        foreach ($nodeSession in $nodeSessions) {
            $targetSession = $nodeSession.Session
            $target = '{0}/{1} [{2}]' -f $file.FileLocation.TrimEnd('/'), $file.FileName, $nodeSession.State
            try {
                $existingFile = Invoke-NSCleanCertKeyFilesOperation -Operation ('Check system file {0}' -f $target) -ScriptBlock {
                    Invoke-NSGetSystemFile -Session $targetSession -FileName $file.FileName -FileLocation $file.FileLocation -ReturnNullOnNotFound
                }
            } catch {
                Write-Warning ('Skipping file cleanup for {0} because the existence check failed. {1}' -f $target, $_.Exception.Message)
                continue
            }

            if ($null -eq $existingFile) {
                Write-Verbose ('Skipping missing file {0}/{1} on {2}.' -f $file.FileLocation.TrimEnd('/'), $file.FileName, $nodeSession.State)
                continue
            }

            if ($PSCmdlet.ShouldProcess($target, 'Delete unused certificate file')) {
                try {
                    Invoke-NSCleanCertKeyFilesOperation -Operation ('Delete system file {0}' -f $target) -ScriptBlock {
                        Invoke-NSDeleteSystemFile -Session $targetSession -FileName $file.FileName -FileLocation $file.FileLocation -Confirm:$false
                    } | Out-Null
                    $removedFiles.Add([pscustomobject] @{
                        PSTypeName = 'NetScalerToolkit.CertKeyCleanup.RemovedFile'
                        FileName = $file.FileName
                        FileLocation = $file.FileLocation
                        NodeState = $nodeSession.State
                        Target = $target
                    }) | Out-Null
                    Write-Debug ('Removed certificate file: {0}' -f $target)
                    $changed = $true
                } catch {
                    Write-Warning ('Deleting file {0} failed. Cleanup will continue with the next file. {1}' -f $target, $_.Exception.Message)
                }
            }
        }
    }

    Write-Verbose 'Building final cleanup plan.'
    $finalPlan = Get-NSCleanCertKeyFilesPlan -Session $primarySession -FileLocation $FileLocation -ExcludeCertKey $ExcludeCertKey -ExcludeFile $ExcludeFile -ExcludeFilePattern $ExcludeFilePattern
    foreach ($expiredCertKey in @($finalPlan.CertKeys | Where-Object { $_.Status -eq 'Expired' })) {
        Write-Warning ('Certificate {0} is expired and remains configured.' -f $expiredCertKey.CertKey)
    }

    foreach ($expiringCertKey in @($finalPlan.CertKeys | Where-Object { $null -ne $_.DaysToExpiration -and $_.DaysToExpiration -ge 0 -and $_.DaysToExpiration -le $ExpirationDays })) {
        Write-Warning ('Certificate {0} expires in {1} day(s).' -f $expiringCertKey.CertKey, $expiringCertKey.DaysToExpiration)
    }

    if ($changed -and -not $NoSaveConfig) {
        if ($PSCmdlet.ShouldProcess('NetScaler configuration', 'Save nsconfig')) {
            Invoke-NSCleanCertKeyFilesOperation -Operation 'Save nsconfig after cleanup' -ScriptBlock {
                Invoke-NSSaveNSConfig -Session $primarySession -All $true -Confirm:$false
            } | Out-Null
            $savedConfig = $true
        }
    }

    $summaryObject = New-NSCleanCertKeyFilesSummary -InitialPlan $initialPlan -FinalPlan $finalPlan -RemovedCertKey @($removedCertKeys) -RemovedFile @($removedFiles) -Changed $changed -SavedConfig $savedConfig
    $result = Add-NSCleanCertKeyFilesResultMetadata -Plan $finalPlan -RemovedCertKey @($removedCertKeys) -RemovedFile @($removedFiles)

    if ($Summary) {
        Write-NSCleanCertKeyFilesSummary -Summary $summaryObject
    }

    if ($PassThru -or $Summary) {
        return $result
    }
}

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCIFBVonkawXpl5
# FZKZb+kE/B+lX438H7vlvNuWo5tcFqCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
# lUgTecgRwIeZMA0GCSqGSIb3DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVu
# dGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAy
# MDAeFw0yMDA0MTYxODM2MTZaFw00NTA0MTYxODQ0NDBaMHcxCzAJBgNVBAYTAlVT
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jv
# c29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRo
# b3JpdHkgMjAyMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALORKgeD
# Bmf9np3gx8C3pOZCBH8Ppttf+9Va10Wg+3cL8IDzpm1aTXlT2KCGhFdFIMeiVPvH
# or+Kx24186IVxC9O40qFlkkN/76Z2BT2vCcH7kKbK/ULkgbk/WkTZaiRcvKYhOuD
# PQ7k13ESSCHLDe32R0m3m/nJxxe2hE//uKya13NnSYXjhr03QNAlhtTetcJtYmrV
# qXi8LW9J+eVsFBT9FMfTZRY33stuvF4pjf1imxUs1gXmuYkyM6Nix9fWUmcIxC70
# ViueC4fM7Ke0pqrrBc0ZV6U6CwQnHJFnni1iLS8evtrAIMsEGcoz+4m+mOJyoHI1
# vnnhnINv5G0Xb5DzPQCGdTiO0OBJmrvb0/gwytVXiGhNctO/bX9x2P29Da6SZEi3
# W295JrXNm5UhhNHvDzI9e1eM80UHTHzgXhgONXaLbZ7LNnSrBfjgc10yVpRnlyUK
# xjU9lJfnwUSLgP3B+PR0GeUw9gb7IVc+BhyLaxWGJ0l7gpPKWeh1R+g/OPTHU3mg
# trTiXFHvvV84wRPmeAyVWi7FQFkozA8kwOy6CXcjmTimthzax7ogttc32H83rwjj
# O3HbbnMbfZlysOSGM1l0tRYAe1BtxoYT2v3EOYI9JACaYNq6lMAFUSw0rFCZE4e7
# swWAsk0wAly4JoNdtGNz764jlU9gKL431VulAgMBAAGjVDBSMA4GA1UdDwEB/wQE
# AwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTIftJqhSobyhmYBAcnz1AQ
# T2ioojAQBgkrBgEEAYI3FQEEAwIBADANBgkqhkiG9w0BAQwFAAOCAgEAr2rd5hnn
# LZRDGU7L6VCVZKUDkQKL4jaAOxWiUsIWGbZqWl10QzD0m/9gdAmxIR6QFm3FJI9c
# Zohj9E/MffISTEAQiwGf2qnIrvKVG8+dBetJPnSgaFvlVixlHIJ+U9pW2UYXeZJF
# xBA2CFIpF8svpvJ+1Gkkih6PsHMNzBxKq7Kq7aeRYwFkIqgyuH4yKLNncy2RtNwx
# AQv3Rwqm8ddK7VZgxCwIo3tAsLx0J1KH1r6I3TeKiW5niB31yV2g/rarOoDXGpc8
# FzYiQR6sTdWD5jw4vU8w6VSp07YEwzJ2YbuwGMUrGLPAgNW3lbBeUU0i/OxYqujY
# lLSlLu2S3ucYfCFX3VVj979tzR/SpncocMfiWzpbCNJbTsgAlrPhgzavhgplXHT2
# 6ux6anSg8Evu75SjrFDyh+3XOjCDyft9V77l4/hByuVkrrOj7FjshZrM77nq81YY
# uVxzmq/FdxeDWds3GhhyVKVB0rYjdaNDmuV3fJZ5t0GNv+zcgKCf0Xd1WF81E+Al
# GmcLfc4l+gcK5GEh2NQc5QfGNpn0ltDGFf5Ozdeui53bFv0ExpK91IjmqaOqu/dk
# ODtfzAzQNb50GQOmxapMomE2gj4d8yu8l13bS3g7LfU772Aj6PXsCyM2la+YZr9T
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAQqYjg2
# C/C7UthEAAAABCpiMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQwHhcNMjYwODAxMTk0NTU5WhcNMjYwODA0
# MTk0NTU5WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAzJVfDiyD7X5wjaVAbNcWusQ1
# m3nZDHQpCr9Tac4NJB+RO2I778PjqBIVN5CyAGRYbP/nK+yy2tOAjaC/Fo5hatz0
# 5EFprl6CuV28E2OulBZ6fZm1NByGMHdctNVVoQDnZp0H32GVlavYJKwiLzESO01m
# 5DV2mQxEyxWGQlPyNUZousEvBi0LyvtQ/MnekqzqSqRnoT1HNul8Em4CoEMqUsLe
# nyYSQJ/YBj5ZiLbPdvEdSSZfHBnKFyJSzU1LoXYpgH1BLsS24pIlF3kHUxN8LcKd
# yBkqISEUElx7O4+fi71na+s04CjDI2ffkGt4Uhhcd2kzMsUEATi5YLLW/0m3SX1k
# AaSX4k2SmIGrCIiD7Tg5dxsnoz37mshvEhsGCd91PLsxVlCQrTcz1Pg2lLki9RXv
# ekrOS9B8jAdXbN5cU42szS4Z6olfShAHFBo1TizkYMgjxAOqZPWKCsgAZrT4R9SH
# auKCkCkTqGV3XoIKQ22FozT/NMfxKcmo4kh0MCaNAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# SNqcq9sa54tVhaeGFcwQwietz+UwHwYDVR0jBBgwFoAUayVB3vtrfP0YgAotf492
# XapzPbgwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwNC5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDQuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBADop
# 8VvsB0PCl6Oomj6RIkJs5sJADvWluNDY8wf4eidt0AX2JpTTLzXVWcZTE+78wYhe
# 2sBmufBXIw6PRhOcTSOfReICWaUTSKLTWX0Z1x9YN1HugpMpvMatentzINPYpP+q
# ao91Rsn9lT91MES6CnrhhB/sBZEK4KHf2yNQ3MJ+kRAf1qre1j9S9DWuBiprg+2C
# sOex2VKs2+rHbuT6CFdw67T9k+bleKiktjFInfVlJ0dfMTa6D/mv5ED/az9xccjQ
# cses9dSiGIXg2stIc49dvfZZK16/zFfn4JXZOHcenYvg1HXNaywh8htkOz2ylbQB
# XB8JtDmY5sLCT8oYxILmhgmZ8FWrRaW7yOnGUSAxRYaiGj7tiDcIhwI86tuxEKFu
# vkGoFTOh5fch0g/pNqAxDnUlDyrlkaZ3w6c2cC6lEeOEnX9wMNbpgdE0kX/vNB6Y
# p2IqGZ9e01rKS0T1yHYy2jvY761YirKkewV/xWqjj9OQktKA9ri+LRcizKD1PqkH
# uVyjsUs5LDdZbkjJTCkr07LEda/cGG9SFxd4nFuUWW+IcU7QwCMLpCUaoUmpVNJF
# 93lLntphbR4lQjJqcO68JXvJ8zE2yCjQ/07fk+BqJDe9/ha1pJpqizxeqkCsdJcg
# Fc3dv1gLb4r3GwBWsVpvKE+gTpVk/1z1SK7OjMKRMIIGwDCCBKigAwIBAgITMwAE
# KmI4Ngvwu1LYRAAAAAQqYjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDA0MB4XDTI2MDgwMTE5NDU1OVoXDTI2
# MDgwNDE5NDU1OVowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAMyVXw4sg+1+cI2lQGzX
# FrrENZt52Qx0KQq/U2nODSQfkTtiO+/D46gSFTeQsgBkWGz/5yvsstrTgI2gvxaO
# YWrc9ORBaa5egrldvBNjrpQWen2ZtTQchjB3XLTVVaEA52adB99hlZWr2CSsIi8x
# EjtNZuQ1dpkMRMsVhkJT8jVGaLrBLwYtC8r7UPzJ3pKs6kqkZ6E9RzbpfBJuAqBD
# KlLC3p8mEkCf2AY+WYi2z3bxHUkmXxwZyhciUs1NS6F2KYB9QS7EtuKSJRd5B1MT
# fC3CncgZKiEhFBJcezuPn4u9Z2vrNOAowyNn35BreFIYXHdpMzLFBAE4uWCy1v9J
# t0l9ZAGkl+JNkpiBqwiIg+04OXcbJ6M9+5rIbxIbBgnfdTy7MVZQkK03M9T4NpS5
# IvUV73pKzkvQfIwHV2zeXFONrM0uGeqJX0oQBxQaNU4s5GDII8QDqmT1igrIAGa0
# +EfUh2rigpApE6hld16CCkNthaM0/zTH8SnJqOJIdDAmjQIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFEjanKvbGueLVYWnhhXMEMInrc/lMB8GA1UdIwQYMBaAFGslQd77a3z9GIAK
# LX+Pdl2qcz24MGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDQuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDA0LmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQA6KfFb7AdDwpejqJo+kSJCbObCQA71pbjQ2PMH+HonbdAF9iaU0y811VnGUxPu
# /MGIXtrAZrnwVyMOj0YTnE0jn0XiAlmlE0ii01l9GdcfWDdR7oKTKbzGrXp7cyDT
# 2KT/qmqPdUbJ/ZU/dTBEugp64YQf7AWRCuCh39sjUNzCfpEQH9aq3tY/UvQ1rgYq
# a4PtgrDnsdlSrNvqx27k+ghXcOu0/ZPm5XiopLYxSJ31ZSdHXzE2ug/5r+RA/2s/
# cXHI0HLHrPXUohiF4NrLSHOPXb32WStev8xX5+CV2Th3Hp2L4NR1zWssIfIbZDs9
# spW0AVwfCbQ5mObCwk/KGMSC5oYJmfBVq0Wlu8jpxlEgMUWGoho+7Yg3CIcCPOrb
# sRChbr5BqBUzoeX3IdIP6TagMQ51JQ8q5ZGmd8OnNnAupRHjhJ1/cDDW6YHRNJF/
# 7zQemKdiKhmfXtNayktE9ch2Mto72O+tWIqypHsFf8Vqo4/TkJLSgPa4vi0XIsyg
# 9T6pB7lco7FLOSw3WW5IyUwpK9OyxHWv3BhvUhcXeJxblFlviHFO0MAjC6QlGqFJ
# qVTSRfd5S57aYW0eJUIyanDuvCV7yfMxNsgo0P9O35PgaiQ3vf4WtaSaaos8XqpA
# rHSXIBXN3b9YC2+K9xsAVrFabyhPoE6VZP9c9UiuzozCkTCCBygwggUQoAMCAQIC
# EzMAAAAWMZKNkgJle5oAAAAAABYwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMjlaFw0zMTAzMjYxODExMjlaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDKVfrI2+gJMM/0bQ5OVKNdvOASzLbUUMvXuf+Vl7YGuofPaZHVo3gMHF5i
# nT+GMSpIcfIZ9qtXU1UG68ry8vNbQtOL4Nm30ifXpqI1+ByiAWLO1YT0WnzG7XPO
# uoTeeWsNZv5FmjxCsReBZvyzyzCyXZbu1EQfJxWTH4ebUwtAiW9rqMf9eDj/wYhi
# EfNteJV3ZFeibD2ztCHr9JhFdd97XbnCHgQoTIqc02X5xlRKtUGBa++OtHBBjiJ/
# uwBnzTkqu4FjpZjQeJtrmda+ur1CT2jflWIB/ypn7u7V9tvW9wJbJYt/H2EtJ0GO
# NWxJZ7TEu8jWPindOO3lzPP7UtzS/mVDV94HucWaltmsra6zSG8BoEJ87IM8QSb7
# vfm/O41FhYkUv89WIj5ES2O4kxyiMSfe95CMivCuYrRP2hKvx7egPMrWgDDBkxML
# grKZO9hRNUMm8vk3w5b9SogHOyJVhxyFm8aFXfIxgqDF4S0g4bhbhnzljmSlCLlu
# mMZcXFGDjpF2tNoAu3VGFGYtHtTSNVKvZpgB3b4ynaoDkbPf+Wg4523jt4VneasB
# gZhC1srZI2NCnCBBfgjLq04pqEKAWEohyW2K29KSkkHvt5VaE1ac3Yt+oyiOzMS5
# 7tXwQDJLGvLg/OXFO0VNvczDndfIfXYExB/ab2PuMSwd5VIBOwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRr
# JUHe+2t8/RiACi1/j3ZdqnM9uDBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQAG1VBeVHTVRBljlcZD3IiMxwPyMjQyLNaEnVu5mODm2hRB
# JfH8GsBLATmrHAc8F47jmk5CnpUPiIguCbw6Z/KVj4Dsoiq228NSLMLewFfGMri7
# uwNGLISC5ccp8vUdADDEIsS2dE+QI9OwkDpv3XuUD7d+hAgcLVcMOl1AsfEZtsZe
# nhGvSYUrm/FuLq0BqEGL9GXM5c+Ho9q8o+Vn/S+GWQN2y+gkRO15s0kI05nUpq/d
# OD4ri9rgVs6tipEd0YZqGgD+CZNiaZWrDTOQbNPncd2F9qOsUa20miYruoT5PwJA
# aI+QQiTE2ZJeMJOkOpzhTUgqVMZwZidEUZKCqudaeQA08WwnkQMfKyHzaU8j48UL
# cU4hUwvMsv7fSurOe9GAdRQCPvF8WcSK5oDHe8VVJM4tv6KKCm91HqLx9JamBgRI
# 6R2SfY3nu26EGznu0rCg/769z8xWm4PVcC2ZaL6VlKVqFp1NsN8YqMyf5t+bbGVb
# 09noFKcJG/UwyGlxRmQBlfeBUQx5/ytlzZzsEnhrJF9fTAfje8j3OdX5lEnePTFQ
# LRlvzZFBqUXnIeQKv3fHQjC9m2fo/Z01DII/qp3d8LhGVUW0BCG04fRwHJNH8iqq
# CG/qofMv+kym2AxBDnHzNgRjL60JOFiBgiurvLhYQNhB95KWojFA6shQnggkMTCC
# B54wggWGoAMCAQICEzMAAAAHh6M0o3uljhwAAAAAAAcwDQYJKoZIhvcNAQEMBQAw
# dzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjFI
# MEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBSb290IENl
# cnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIxMDQwMTIwMDUyMFoXDTM2MDQw
# MTIwMTUyMFowYzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjE0MDIGA1UEAxMrTWljcm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2ln
# bmluZyBQQ0EgMjAyMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALLw
# wK8ZiCji3VR6TElsaQhVCbRS/3pK+MHrJSj3Zxd3KU3rlfL3qrZilYKJNqztA9OQ
# acr1AwoNcHbKBLbsQAhBnIB34zxf52bDpIO3NJlfIaTE/xrweLoQ71lzCHkD7A4A
# s1Bs076Iu+mA6cQzsYYH/Cbl1icwQ6C65rU4V9NQhNUwgrx9rGQ//h890Q8JdjLL
# w0nV+ayQ2Fbkd242o9kH82RZsH3HEyqjAB5a8+Ae2nPIPc8sZU6ZE7iRrRZywRmr
# KDp5+TcmJX9MRff241UaOBs4NmHOyke8oU1TYrkxh+YeHgfWo5tTgkoSMoayqoDp
# HOLJs+qG8Tvh8SnifW2Jj3+ii11TS8/FGngEaNAWrbyfNrC69oKpRQXY9bGH6jn9
# NEJv9weFxhTwyvx9OJLXmRGbAUXN1U9nf4lXezky6Uh/cgjkVd6CGUAf0K+Jw+GE
# /5VpIVbcNr9rNE50Sbmy/4RTCEGvOq3GhjITbCa4crCzTTHgYYjHs1NbOc6brH+e
# KpWLtr+bGecy9CrwQyx7S/BfYJ+ozst7+yZtG2wR461uckFu0t+gCwLdN0A6cFtS
# RtR8bvxVFyWwTtgMMFRuBa3vmUOTnfKLsLefRaQcVTgRnzeLzdpt32cdYKp+dhr2
# ogc+qM6K4CBI5/j4VFyC4QFeUP2YAidLtvpXRRo3AgMBAAGjggI1MIICMTAOBgNV
# HQ8BAf8EBAMCAYYwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFNlBKbAPD2Ns
# 72nX9c0pnqRIajDmMFQGA1UdIARNMEswSQYEVR0gADBBMD8GCCsGAQUFBwIBFjNo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5o
# dG0wGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBTIftJqhSobyhmYBAcnz1AQT2ioojCBhAYDVR0fBH0wezB5oHeg
# dYZzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0
# JTIwSWRlbnRpdHklMjBWZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUl
# MjBBdXRob3JpdHklMjAyMDIwLmNybDCBwwYIKwYBBQUHAQEEgbYwgbMwgYEGCCsG
# AQUFBzAChnVodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01p
# Y3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0aW9uJTIwUm9vdCUyMENlcnRp
# ZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcnQwLQYIKwYBBQUHMAGGIWh0dHA6
# Ly9vbmVvY3NwLm1pY3Jvc29mdC5jb20vb2NzcDANBgkqhkiG9w0BAQwFAAOCAgEA
# fyUqnv7Uq+rdZgrbVyNMul5skONbhls5fccPlmIbzi+OwVdPQ4H55v7VOInnmezQ
# EeW4LqK0wja+fBznANbXLB0KrdMCbHQpbLvG6UA/Xv2pfpVIE1CRFfNF4XKO8XYE
# a3oW8oVH+KZHgIQRIwAbyFKQ9iyj4aOWeAzwk+f9E5StNp5T8FG7/VEURIVWArbA
# zPt9ThVN3w1fAZkF7+YU9kbq1bCR2YD+MtunSQ1Rft6XG7b4e0ejRA7mB2IoX5hN
# h3UEauY0byxNRG+fT2MCEhQl9g2i2fs6VOG19CNep7SquKaBjhWmirYyANb0RJSL
# WjinMLXNOAga10n8i9jqeprzSMU5ODmrMCJE12xS/NWShg/tuLjAsKP6SzYZ+1Ry
# 358ZTFcx0FS/mx2vSoU8s8HRvy+rnXqyUJ9HBqS0DErVLjQwK8VtsBdekBmdTbQV
# oCgPCqr+PDPB3xajYnzevs7eidBsM71PINK2BoE2UfMwxCCX3mccFgx6UsQeRSdV
# VVNSyALQe6PT12418xon2iDGE81OGCreLzDcMAZnrUAx4XQLUz6ZTl65yPUiOh3k
# 7Yww94lDf+8oG2oZmDh5O1Qe38E+M3vhKwmzIeoB1dVLlz4i3IpaDcR+iuGjH2Td
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcyMIIXLgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABCpi
# ODYL8LtS2EQAAAAEKmIwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQg1BdL
# OrFrEKjtGQBqrEP1PCPppSfok92HPu9BLhzcrxcwDQYJKoZIhvcNAQEBBQAEggGA
# tlm4swRfLZ5rl4Thi1Q4WK6pJX+lrPPd568LDp8JmaFKy93Cv5VHxJaMUWdnV7TG
# XguSyk4PX4LWxBuq21J/1R3c+BzYMgxIVc3KvKYbZb3x3lTa1Y7M49X8c5i6Vnp1
# 5B3zWH2JwITqfp87yeGyD7y64bVmUTh4/BrrjUO0iU9X4+nq9zAR+rwnRb0FpV8j
# g4X4ITf4ZRp5W/jqOKA1Neo6pAa/OBH06CERakqt8aU1FjoWswyrEsCwejhECpD4
# ifFBxRgSN7r2HZMuuXC+2xOjlCVlx6BJS7PCmKohmfKGtbdGPwOiBK/Pt5f5fgKK
# bO35wYg/B7JLpr2cJ55MpovHnVUi19WPK4uwMarsCHaYkgUkJeDwOULzCbhfQ7DR
# 7IKispbUfEs2sfiLoT63aezy0BLbBEUoSIF1mM/Ctrq/zlavFwY2241nlqCyxfVb
# 7Q+Qrvpjdtsi1bmFqbR/l0RvkakQS5RIVE24WM420o0PMWA7GoP+fbV2eBv+4lv2
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIKycc8Q8hgoCKJ/bplUP
# 6ILjft6fBQo6oNnMo3lJrNogAgZqNTBfnzAYEzIwMjYwODAzMTI1MDM2LjY4MVow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYD
# VQQDEyxNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0
# eaCCDykwggeCMIIFaqADAgECAhMzAAAABeXPD/9mLsmHAAAAAAAFMA0GCSqGSIb3
# DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24g
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAyMDAeFw0yMDExMTkyMDMyMzFa
# Fw0zNTExMTkyMDQyMzFaMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRp
# bWVzdGFtcGluZyBDQSAyMDIwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEAnnznUmP94MWfBX1jtQYioxwe1+eXM9ETBb1lRkd3kcFdcG9/sqtDlwxKoVIc
# aqDb+omFio5DHC4RBcbyQHjXCwMk/l3TOYtgoBjxnG/eViS4sOx8y4gSq8Zg49RE
# Af5huXhIkQRKe3Qxs8Sgp02KHAznEa/Ssah8nWo5hJM1xznkRsFPu6rfDHeZeG1W
# a1wISvlkpOQooTULFm809Z0ZYlQ8Lp7i5F9YciFlyAKwn6yjN/kR4fkquUWfGmMo
# pNq/B8U/pdoZkZZQbxNlqJOiBGgCWpx69uKqKhTPVi3gVErnc/qi+dR8A2MiAz0k
# N0nh7SqINGbmw5OIRC0EsZ31WF3Uxp3GgZwetEKxLms73KG/Z+MkeuaVDQQheang
# OEMGJ4pQZH55ngI0Tdy1bi69INBV5Kn2HVJo9XxRYR/JPGAaM6xGl57Ei95HUw9N
# V/uC3yFjrhc087qLJQawSC3xzY/EXzsT4I7sDbxOmM2rl4uKK6eEpurRduOQ2hTk
# mG1hSuWYBunFGNv21Kt4N20AKmbeuSnGnsBCd2cjRKG79+TX+sTehawOoxfeOO/j
# R7wo3liwkGdzPJYHgnJ54UxbckF914AqHOiEV7xTnD1a69w/UTxwjEugpIPMIIE6
# 7SFZ2PMo27xjlLAHWW3l1CEAFjLNHd3EQ79PUr8FUXetXr0CAwEAAaOCAhswggIX
# MA4GA1UdDwEB/wQEAwIBhjAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQUa2ko
# OjUvSGNAz3vYr0npPtk92yEwVAYDVR0gBE0wSzBJBgRVHSAAMEEwPwYIKwYBBQUH
# AgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0
# b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMA
# dQBiAEMAQTAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFMh+0mqFKhvKGZgE
# ByfPUBBPaKiiMIGEBgNVHR8EfTB7MHmgd6B1hnNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZlcmlmaWNh
# dGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIwMjAuY3Js
# MIGUBggrBgEFBQcBAQSBhzCBhDCBgQYIKwYBBQUHMAKGdWh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwSWRlbnRpdHklMjBW
# ZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUlMjBBdXRob3JpdHklMjAy
# MDIwLmNydDANBgkqhkiG9w0BAQwFAAOCAgEAX4h2x35ttVoVdedMeGj6TuHYRJkl
# FaW4sTQ5r+k77iB79cSLNe+GzRjv4pVjJviceW6AF6ycWoEYR0LYhaa0ozJLU5Yi
# +LCmcrdovkl53DNt4EXs87KDogYb9eGEndSpZ5ZM74LNvVzY0/nPISHz0Xva71Qj
# D4h+8z2XMOZzY7YQ0Psw+etyNZ1CesufU211rLslLKsO8F2aBs2cIo1k+aHOhrw9
# xw6JCWONNboZ497mwYW5EfN0W3zL5s3ad4Xtm7yFM7Ujrhc0aqy3xL7D5FR2J7x9
# cLWMq7eb0oYioXhqV2tgFqbKHeDick+P8tHYIFovIP7YG4ZkJWag1H91KlELGWi3
# SLv10o4KGag42pswjybTi4toQcC/irAodDW8HNtX+cbz0sMptFJK+KObAnDFHEsu
# kxD+7jFfEV9Hh/+CSxKRsmnuiovCWIOb+H7DRon9TlxydiFhvu88o0w35JkNbJxT
# k4MhF/KgaXn0GxdH8elEa2Imq45gaa8D+mTm8LWVydt4ytxYP/bqjN49D9NZ81co
# E6aQWm88TwIf4R4YZbOpMKN0CyejaPNN41LGXHeCUMYmBx3PkP8ADHD1J2Cr/6tj
# uOOCztfp+o9Nc+ZoIAkpUcA/X2gSMkgHAPUvIdtoSAHEUKiBhI6JQivRepyvWcl+
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAWvYNZ4yF7d0IAAAAAABaMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwM1oXDTI3MDEwNzE4NTkwM1ow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAO/0O0eWjgUb9rnHcQLRdfWPN4H+91a3Ynla
# P46E1m4uD+JKx6csWMStX79fxLJUAqHJqQWE19UlNMhS9jEB32dAJ4yuWsHyUuM+
# dphjDz4E5jl4gYGZEmaOrKvNt+KqlFayyg/oTg3BlLRu4aBq8668A5qlHcfsuh6D
# dSqFID1ixJFZzHrZFG1iGBG7U1Bn2ONLDo7jbwX5rMcPduTAUw/c7M3WhSxQBuZp
# Qiz8RQGKIqCKfIxgQkKdzpCpU0SWQOE/DgTXbz3c15KMRCdkGlL2zb+lnuSV4sse
# Qm3qflZiZckLyn2xJI8ZXDkq+Ig+b/rsPPIfI8di228WvK1j67JXpyeVCaSUO9Er
# zlLnTrnjQkeXVQIp73xuVBVrmvoTf/v4a7MnrmuKSyIXc5vJUHEGB345+O8omFt1
# w8b+Xg9D9PKIRqDPEv7HRk0C+Yvxu8FvHJvSocSIZK+v/FmKFOipYnpP76yAmJNn
# yheucShOgk8QiU53USn/+AyMb7xW905gZnyNqb29HeVdQ175pDHJGEz8Cx5wiHeV
# liGz5hABucFDylR9z3LSTmB6+3ZuIxeG9BZS46P6ANPkuVuD5m8wgc7GLLzg73Cs
# DF09ukt8Uf8dTcMBX3ro+7/k9M6Xt8WPG7IL9v/4DvyMY03tkb9Y9Ri6HWavXRPY
# RCUePspPAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQUjmOyQ6twMcP1ZbRytJxI4fnX
# mcIwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQCAlM8r+t3hIb2h1lDTAx+iYkQlxFuU7QONeyIFIBZ29xvG
# l8pehKxErDzIniOpIX/eluUAwQKoaI0zwuKAdR0mrSHXCniMoLNko5W+5r7sXNam
# KX7QMV3BfGOX3gi9qVfxyUe7AHXbqQ8KBQHNYCnNFtQQHgARrlYhtyAKol5ctM0C
# Ac/y3oY7bTMsVJvnA5u7DVWPeXoST2KEMDeLBvJYq0IJZ6yMpDOWLZ4UP82bksyS
# hIB/XdawirIGLdseudryRxVMk313mAcjGRb59+Ittt6otVvYQWqH+PGrTUzEcez8
# aQuO3umoNZjKuFoX5VsPP/gSZse+orhG3zfZk9IDyE3DfUFrhvkv6H0tijK1D0uI
# GhwMBWSm9ktQ6oeU+aurZFx3MI+LODnHsbRFZAy11uMvwKq+ZNC1Se4tIM1u9piW
# AhnTPoh6mULKikHOVhHaO953tkzDCtjsse5GUKOx9yg9nqHKWMgnODp62/uPPzC/
# yDEISrXCcU7UB7tATr3zWNEdtM4d009iXWI6dV/SdcIIX44rpoLyCLw+nXjxp+fY
# /dygLO7UdSQaVaUFVj3K2nVyuujPspt5Lunc5FvuYPqmi/z8kASmmwbiF+W0P0UT
# WFaC84MWfU2h6MDg5s0oxmdNFK76jXr3wZfdSoV7FCKfq5GdeGoy5UwDQwMC0DGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABa9g1njIXt3QgAAAAAAFowDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgsjc9DsFiUPI1wDh0QmGUlyiavH0KvjfpwoWZgXTb4Dgwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCBjvs38TkZQ7iGxRP7H
# HHeWregoVp5960ewGO9kUZr6FDANBgkqhkiG9w0BAQsFAASCAgDCbVTzLPWK8lDn
# 17CmhMf5Xv+DaQvcxEBQVHPX7OQagxFW+QmQz1p7rBtNTx9NkdVz+0KO4llAw+qS
# QysMV+I8j6PZoKElX3IA/lxo4aHVSVRe5jac9WeU/vWDBQ0aiVzShBoA9uMoBqsJ
# 0AwLWqewqnBAS5QMyheaPjTLBL7Xtt6bqBjWOKxitF1EsnYq/kSv1nvnx7x9zxSE
# pL5NAB6zZ3fweu+yn6p+duUdFCOIo7aYkC7UApvnLNZPt7LwM8jAvZPAIs04ghgd
# V78bsXIKWfPvuxceR5x0xcXnLH/GdbVGwo9A9EeZgNZWR/y8kUT5S9bRnKw96+7q
# 8mqncpmWwQib9d6sshYCWuWGTSvsaAnQK84CWlYzTztvmlS98C0mQCZrCgX3tyNg
# XXBD59LeY9GS6QVoRwlzKC9JFACQLzwFTrP9+rlWjAzOmFwZgFVRaisr4EFd+OeP
# BDooWSyu2T32yBZ5tucVgiIU4GXYpMLQ9EXN8irzn96f11JqrGRwg/ygn3TwIFXq
# 8mVsEFxSZ6F52t/0Jxri0YCsOs126ucUPJKdbg9SVuwEP5f2xM78bjLnM64eI1pZ
# WXTYLGoIUv5MShjcw33DgZRDm22xzr3HtODhHNiBT207lYq95OcSCWq4KKqteqjB
# jCRJCvGnbo4W0sul0I/Hr+DOA6tRxA==
# SIG # End signature block
