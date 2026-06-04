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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD4DHuWZQyTIBYz
# ARNUFEYeBP+1eNNjKrINJx2FRo/uE6CCIAowggYUMIID/KADAgECAhB6I67aU2mW
# D5HIPlz0x+M/MA0GCSqGSIb3DQEBDAUAMFcxCzAJBgNVBAYTAkdCMRgwFgYDVQQK
# Ew9TZWN0aWdvIExpbWl0ZWQxLjAsBgNVBAMTJVNlY3RpZ28gUHVibGljIFRpbWUg
# U3RhbXBpbmcgUm9vdCBSNDYwHhcNMjEwMzIyMDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSwwKgYD
# VQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNjCCAaIwDQYJ
# KoZIhvcNAQEBBQADggGPADCCAYoCggGBAM2Y2ENBq26CK+z2M34mNOSJjNPvIhKA
# VD7vJq+MDoGD46IiM+b83+3ecLvBhStSVjeYXIjfa3ajoW3cS3ElcJzkyZlBnwDE
# JuHlzpbN4kMH2qRBVrjrGJgSlzzUqcGQBaCxpectRGhhnOSwcjPMI3G0hedv2eNm
# GiUbD12OeORN0ADzdpsQ4dDi6M4YhoGE9cbY11XxM2AVZn0GiOUC9+XE0wI7CQKf
# OUfigLDn7i/WeyxZ43XLj5GVo7LDBExSLnh+va8WxTlA+uBvq1KO8RSHUQLgzb1g
# bL9Ihgzxmkdp2ZWNuLc+XyEmJNbD2OIIq/fWlwBp6KNL19zpHsODLIsgZ+WZ1AzC
# s1HEK6VWrxmnKyJJg2Lv23DlEdZlQSGdF+z+Gyn9/CRezKe7WNyxRf4e4bwUtrYE
# 2F5Q+05yDD68clwnweckKtxRaF0VzN/w76kOLIaFVhf5sMM/caEZLtOYqYadtn03
# 4ykSFaZuIBU9uCSrKRKTPJhWvXk4CllgrwIDAQABo4IBXDCCAVgwHwYDVR0jBBgw
# FoAU9ndq3T/9ARP/FqFsggIv0Ao9FCUwHQYDVR0OBBYEFF9Y7UwxeqJhQo1SgLqz
# YZcZojKbMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGg
# P6A9hjtodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNUaW1lU3Rh
# bXBpbmdSb290UjQ2LmNybDB8BggrBgEFBQcBAQRwMG4wRwYIKwYBBQUHMAKGO2h0
# dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY1RpbWVTdGFtcGluZ1Jv
# b3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAN
# BgkqhkiG9w0BAQwFAAOCAgEAEtd7IK0ONVgMnoEdJVj9TC1ndK/HYiYh9lVUacah
# RoZ2W2hfiEOyQExnHk1jkvpIJzAMxmEc6ZvIyHI5UkPCbXKspioYMdbOnBWQUn73
# 3qMooBfIghpR/klUqNxx6/fDXqY0hSU1OSkkSivt51UlmJElUICZYBodzD3M/SFj
# eCP59anwxs6hwj1mfvzG+b1coYGnqsSz2wSKr+nDO+Db8qNcTbJZRAiSazr7KyUJ
# Go1c+MScGfG5QHV+bps8BX5Oyv9Ct36Y4Il6ajTqV2ifikkVtB3RNBUgwu/mSiSU
# ice/Jp/q8BMk/gN8+0rNIE+QqU63JoVMCMPY2752LmESsRVVoypJVt8/N3qQ1c6F
# ibbcRabo3azZkcIdWGVSAdoLgAIxEKBeNh9AQO1gQrnh1TA8ldXuJzPSuALOz1Uj
# b0PCyNVkWk7hkhVHfcvBfI8NtgWQupiaAeNHe0pWSGH2opXZYKYG4Lbukg7HpNi/
# KqJhue2Keak6qH9A8CeEOB7Eob0Zf+fU+CCQaL0cJqlmnx9HCDxF+3BLbUufrV64
# EbTI40zqegPZdA+sXCmbcZy6okx/SjwsusWRItFA3DE8MORZeFb6BmzBtqKJ7l93
# 9bbKBy2jvxcJI98Va95Q5JnlKor3m0E7xpMeYRriWklUPsetMSf2NvUQa/E5vVye
# fQIwggZFMIIELaADAgECAhAIMk+dt9qRb2Pk8qM8Xl1RMA0GCSqGSIb3DQEBCwUA
# MFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMu
# QS4xJDAiBgNVBAMTG0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQTAeFw0yNDA0
# MDQxNDA0MjRaFw0yNzA0MDQxNDA0MjNaMGsxCzAJBgNVBAYTAk5MMRIwEAYDVQQH
# DAlTY2hpam5kZWwxIzAhBgNVBAoMGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5
# MSMwIQYDVQQDDBpKb2huIEJpbGxla2VucyBDb25zdWx0YW5jeTCCAaIwDQYJKoZI
# hvcNAQEBBQADggGPADCCAYoCggGBAMslntDbSQwHZXwFhmibivbnd0Qfn6sqe/6f
# os3pKzKxEsR907RkDMet2x6RRg3eJkiIr3TFPwqBooyXXgK3zxxpyhGOcuIqyM9J
# 28DVf4kUyZHsjGO/8HFjrr3K1hABNUszP0o7H3o6J31eqV1UmCXYhQlNoW9FOmRC
# 1amlquBmh7w4EKYEytqdmdOBavAD5Xq4vLPxNP6kyA+B2YTtk/xM27TghtbwFGKn
# u9Vwnm7dFcpLxans4ONt2OxDQOMA5NwgcUv/YTpjhq9qoz6ivG55NRJGNvUXsM3w
# 2o7dR6Xh4MuEGrTSrOWGg2A5EcLH1XqQtkF5cZnAPM8W/9HUp8ggornWnFVQ9/6M
# ga+ermy5wy5XrmQpN+x3u6tit7xlHk1Hc+4XY4a4ie3BPXG2PhJhmZAn4ebNSBwN
# Hh8z7WTT9X9OFERepGSytZVeEP7hgyptSLcuhpwWeR4QdBb7dV++4p3PsAUQVHFp
# wkSbrRTv4EiJ0Lcz9P1HPGFoHiFAQQIDAQABo4IBeDCCAXQwDAYDVR0TAQH/BAIw
# ADA9BgNVHR8ENjA0MDKgMKAuhixodHRwOi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0u
# cGwvY2NzY2EyMDIxLmNybDBzBggrBgEFBQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0
# dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0dW0uY29tMDUGCCsGAQUFBzAChilodHRw
# Oi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAW
# gBTddF1MANt7n6B0yrFu9zzAMsBwzTAdBgNVHQ4EFgQUO6KtBpOBgmrlANVAnyiQ
# C6W6lJwwSwYDVR0gBEQwQjAIBgZngQwBBAEwNgYLKoRoAYb2dwIFAQQwJzAlBggr
# BgEFBQcCARYZaHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzATBgNVHSUEDDAKBggr
# BgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAEQsN8wg
# PMdWVkwHPPTN+jKpdns5AKVFjcn00psf2NGVVgWWNQBIQc9lEuTBWb54IK6Ga3hx
# QRZfnPNo5HGl73YLmFgdFQrFzZ1lnaMdIcyh8LTWv6+XNWfoyCM9wCp4zMIDPOs8
# LKSMQqA/wRgqiACWnOS4a6fyd5GUIAm4CuaptpFYr90l4Dn/wAdXOdY32UhgzmSu
# xpUbhD8gVJUaBNVmQaRqeU8y49MxiVrUKJXde1BCrtR9awXbqembc7Nqvmi60tYK
# lD27hlpKtj6eGPjkht0hHEsgzU0Fxw7ZJghYG2wXfpF2ziN893ak9Mi/1dmCNmor
# GOnybKYfT6ff6YTCDDNkod4egcMZdOSv+/Qv+HAeIgEvrxE9QsGlzTwbRtbm6gwY
# YcVBs/SsVUdBn/TSB35MMxRhHE5iC3aUTkDbceo/XP3uFhVL4g2JZHpFfCSu2TQr
# rzRn2sn07jfMvzeHArCOJgBW1gPqR3WrJ4hUxL06Rbg1gs9tU5HGGz9KNQMfQFQ7
# 0Wz7UIhezGcFcRfkIfSkMmQYYpsc7rfzj+z0ThfDVzzJr2dMOFsMlfj1T6l22GBq
# 9XQx0A4lcc5Fl9pRxbOuHHWFqIBD/BCEhwniOCySzqENd2N+oz8znKooSISStnkN
# aYXt6xblJF2dx9Dn89FK7d1IquNxOwt0tI5dMIIGYjCCBMqgAwIBAgIRAKQpO24e
# 3denNAiHrXpOtyQwDQYJKoZIhvcNAQEMBQAwVTELMAkGA1UEBhMCR0IxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEsMCoGA1UEAxMjU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBDQSBSMzYwHhcNMjUwMzI3MDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjByMQswCQYDVQQGEwJHQjEXMBUGA1UECBMOV2VzdCBZb3Jrc2hpcmUxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEwMC4GA1UEAxMnU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBTaWduZXIgUjM2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEA04SV9G6kU3jyPRBLeBIHPNyUgVNnYayfsGOyYEXrn3+SkDYTLs1crcw/
# ol2swE1TzB2aR/5JIjKNf75QBha2Ddj+4NEPKDxHEd4dEn7RTWMcTIfm492TW22I
# 8LfH+A7Ehz0/safc6BbsNBzjHTt7FngNfhfJoYOrkugSaT8F0IzUh6VUwoHdYDpi
# ln9dh0n0m545d5A5tJD92iFAIbKHQWGbCQNYplqpAFasHBn77OqW37P9BhOASdmj
# p3IijYiFdcA0WQIe60vzvrk0HG+iVcwVZjz+t5OcXGTcxqOAzk1frDNZ1aw8nFhG
# EvG0ktJQknnJZE3D40GofV7O8WzgaAnZmoUn4PCpvH36vD4XaAF2CjiPsJWiY/j2
# xLsJuqx3JtuI4akH0MmGzlBUylhXvdNVXcjAuIEcEQKtOBR9lU4wXQpISrbOT8ux
# +96GzBq8TdbhoFcmYaOBZKlwPP7pOp5Mzx/UMhyBA93PQhiCdPfIVOCINsUY4U23
# p4KJ3F1HqP3H6Slw3lHACnLilGETXRg5X/Fp8G8qlG5Y+M49ZEGUp2bneRLZoyHT
# yynHvFISpefhBCV0KdRZHPcuSL5OAGWnBjAlRtHvsMBrI3AAA0Tu1oGvPa/4yeei
# Ayu+9y3SLC98gDVbySnXnkujjhIh+oaatsk/oyf5R2vcxHahajMCAwEAAaOCAY4w
# ggGKMB8GA1UdIwQYMBaAFF9Y7UwxeqJhQo1SgLqzYZcZojKbMB0GA1UdDgQWBBSI
# YYyhKjdkgShgoZsx0Iz9LALOTzAOBgNVHQ8BAf8EBAMCBsAwDAYDVR0TAQH/BAIw
# ADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBKBgNVHSAEQzBBMDUGDCsGAQQBsjEB
# AgEDCDAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzAIBgZn
# gQwBBAIwSgYDVR0fBEMwQTA/oD2gO4Y5aHR0cDovL2NybC5zZWN0aWdvLmNvbS9T
# ZWN0aWdvUHVibGljVGltZVN0YW1waW5nQ0FSMzYuY3JsMHoGCCsGAQUFBwEBBG4w
# bDBFBggrBgEFBQcwAoY5aHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUHVi
# bGljVGltZVN0YW1waW5nQ0FSMzYuY3J0MCMGCCsGAQUFBzABhhdodHRwOi8vb2Nz
# cC5zZWN0aWdvLmNvbTANBgkqhkiG9w0BAQwFAAOCAYEAAoE+pIZyUSH5ZakuPVKK
# 4eWbzEsTRJOEjbIu6r7vmzXXLpJx4FyGmcqnFZoa1dzx3JrUCrdG5b//LfAxOGy9
# Ph9JtrYChJaVHrusDh9NgYwiGDOhyyJ2zRy3+kdqhwtUlLCdNjFjakTSE+hkC9F5
# ty1uxOoQ2ZkfI5WM4WXA3ZHcNHB4V42zi7Jk3ktEnkSdViVxM6rduXW0jmmiu71Z
# pBFZDh7Kdens+PQXPgMqvzodgQJEkxaION5XRCoBxAwWwiMm2thPDuZTzWp/gUFz
# i7izCmEt4pE3Kf0MOt3ccgwn4Kl2FIcQaV55nkjv1gODcHcD9+ZVjYZoyKTVWb4V
# qMQy/j8Q3aaYd/jOQ66Fhk3NWbg2tYl5jhQCuIsE55Vg4N0DUbEWvXJxtxQQaVR5
# xzhEI+BjJKzh3TQ026JxHhr2fuJ0mV68AluFr9qshgwS5SpN5FFtaSEnAwqZv3IS
# +mlG50rK7W3qXbWwi4hmpylUfygtYLEdLQukNEX1jiOKMIIGgjCCBGqgAwIBAgIQ
# NsKwvXwbOuejs902y8l1aDANBgkqhkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYD
# VQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBS
# U0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMjEwMzIyMDAwMDAwWhcNMzgw
# MTE4MjM1OTU5WjBXMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1p
# dGVkMS4wLAYDVQQDEyVTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIFJvb3Qg
# UjQ2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAiJ3YuUVnnR3d6Lkm
# gZpUVMB8SQWbzFoVD9mUEES0QUCBdxSZqdTkdizICFNeINCSJS+lV1ipnW5ihkQy
# C0cRLWXUJzodqpnMRs46npiJPHrfLBOifjfhpdXJ2aHHsPHggGsCi7uE0awqKggE
# /LkYw3sqaBia67h/3awoqNvGqiFRJ+OTWYmUCO2GAXsePHi+/JUNAax3kpqstbl3
# vcTdOGhtKShvZIvjwulRH87rbukNyHGWX5tNK/WABKf+Gnoi4cmisS7oSimgHUI0
# Wn/4elNd40BFdSZ1EwpuddZ+Wr7+Dfo0lcHflm/FDDrOJ3rWqauUP8hsokDoI7D/
# yUVI9DAE/WK3Jl3C4LKwIpn1mNzMyptRwsXKrop06m7NUNHdlTDEMovXAIDGAvYy
# nPt5lutv8lZeI5w3MOlCybAZDpK3Dy1MKo+6aEtE9vtiTMzz/o2dYfdP0KWZwZIX
# bYsTIlg1YIetCpi5s14qiXOpRsKqFKqav9R1R5vj3NgevsAsvxsAnI8Oa5s2oy25
# qhsoBIGo/zi6GpxFj+mOdh35Xn91y72J4RGOJEoqzEIbW3q0b2iPuWLA911cRxgY
# 5SJYubvjay3nSMbBPPFsyl6mY4/WYucmyS9lo3l7jk27MAe145GWxK4O3m3gEFEI
# kv7kRmefDR7Oe2T1HxAnICQvr9sCAwEAAaOCARYwggESMB8GA1UdIwQYMBaAFFN5
# v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBT2d2rdP/0BE/8WoWyCAi/QCj0U
# JTAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zATBgNVHSUEDDAKBggr
# BgEFBQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0
# cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25B
# dXRob3JpdHkuY3JsMDUGCCsGAQUFBwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDov
# L29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEADr5lQe1oRLjl
# ocXUEYfktzsljOt+2sgXke3Y8UPEooU5y39rAARaAdAxUeiX1ktLJ3+lgxtoLQhn
# 5cFb3GF2SSZRX8ptQ6IvuD3wz/LNHKpQ5nX8hjsDLRhsyeIiJsms9yAWnvdYOdEM
# q1W61KE9JlBkB20XBee6JaXx4UBErc+YuoSb1SxVf7nkNtUjPfcxuFtrQdRMRi/f
# InV/AobE8Gw/8yBMQKKaHt5eia8ybT8Y/Ffa6HAJyz9gvEOcF1VWXG8OMeM7Vy7B
# s6mSIkYeYtddU1ux1dQLbEGur18ut97wgGwDiGinCwKPyFO7ApcmVJOtlw9FVJxw
# /mL1TbyBns4zOgkaXFnnfzg4qbSvnrwyj1NiurMp4pmAWjR+Pb/SIduPnmFzbSN/
# G8reZCL4fvGlvPFk4Uab/JVCSmj59+/mB2Gn6G/UYOy8k60mKcmaAZsEVkhOFuoj
# 4we8CYyaR9vd9PGZKSinaZIkvVjbH/3nlLb0a7SBIkiRzfPfS9T+JesylbHa1LtR
# V9U/7m0q7Ma2CQ/t392ioOssXW7oKLdOmMBl14suVFBmbzrt5V5cQPnwtd3UOTpS
# 9oCG+ZZheiIvPgkDmA8FzPsnfXW5qHELB43ET7HHFHeRPRYrMBKjkb8/IN7Po0d0
# hQoF4TeMM+zYAJzoKQnVKOLg8pZVPT8wgga5MIIEoaADAgECAhEAmaOACiZVO2Wr
# 3G6EprPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAgBgNVBAoT
# GVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1bSBDZXJ0
# aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0ZWQgTmV0
# d29yayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIxOFowVjELMAkG
# A1UEBhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIG
# A1UEAxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5cTbq96y34vuTm
# flN4mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7VS5+djSoMcbv
# IKck6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1PH9ud0IF+njvM
# k2xqbNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOouu9Tj1yHIohzu
# C8KNqfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv8aGUsRdaCtVD
# 2bSlbfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtMLK+Wo837Q4QO
# ZgYqVWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9lDV2nT8mFSkc
# SkAExzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/JHuurfTI5XDY
# O962WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkKbWpQ5boufUnq
# 1UiYPIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADaCi2JSplKShBS
# ND36E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAWd18Jx5n858JS
# qPECAwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFN10XUwA
# 23ufoHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4HKbROg79
# MA4GA1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAwBgNVHR8EKTAn
# MCWgI6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwGCCsGAQUF
# BwEBBGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2VydHVtLmNv
# bTAyBggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBsL2N0bmNh
# Mi5jZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0dHA6Ly93
# d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhYD+WPUCiaU58Q
# 7EP89DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUStJl490L94C9L
# GF3vjzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChDUyuQy6rGDxLU
# UAsO0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiRsWrhWM2f8pXd
# d3x2mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7bWRLDm0CdY9rN
# LqyA3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mATwZWwSD+B7eMc
# ZNhpn8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3/bFAEloMU+vU
# BfSouCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESYkOh1/w1tVxTp
# V2Na3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR+x+zPF/2DaGg
# K2W1eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C+xN4YaNjt2yw
# zOr+tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qwt4HOUBCrW602
# NCmvO1nm+/80nLy5r0AZvCQxaQ4xggXDMIIFvwIBATBqMFYxCzAJBgNVBAYTAlBM
# MSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0Nl
# cnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQQIQCDJPnbfakW9j5PKjPF5dUTANBglg
# hkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3
# DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
# MC8GCSqGSIb3DQEJBDEiBCB6qEM9jMXL1r0pQ3urkGOnTUSQe6Xms305Khr5AKmC
# +zANBgkqhkiG9w0BAQEFAASCAYAA7YA6GrCH9wPUDebnCPm+dBGAW2CvBb3IAnFY
# S7+LVSNARNhlF4zmbED7/31yozm3t7fv2AKVns0Ar8/azW63kSInHpXVoZzAnxCo
# yILnfB1tw3Z7kuQAUwA6HXevi2Vz/+tbydGtDvMkOLD6lRUVayp+BT/RY5EU3U0X
# PVnAhY8MqHpMdKPbR6x7Z/Q1WDf+UAjVZOwLcVgp7Z6VHphMbX+tNq8sJccV8H/g
# LEp+5j3C2Br0DCm4AwYnHPZkCtiJCGvaEWMtAtZG665KHPakjKozm59LdXovT+e9
# G3pHMeOtaPskUo0D9ofjpekrql66Cy8POOS/h9CJKoCsDgzZ4tW5J6QoCIvDNrNc
# /6RDWEWnZyKcwI4fNVIulhXHVr4j8cQBG2ZBGxjTAb3EqUzJ4HvMoQyCBkd3jVlm
# KBRxz60wiVRJGZ5XnjgthA+EbJJqIUyYWx8Ez+gCHNxKr7/mcaS5+8rkno0wG2i4
# JgVqRnmP3T0nWbd/uE65DL9+LxahggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDMxMjE1MjFaMD8GCSqGSIb3
# DQEJBDEyBDC4l7OamnJyBthaZ6CDsSadXAZRiZL0Bj7JlUJ1Smd7WW+CfzdPx9hN
# TPper1glmYswDQYJKoZIhvcNAQEBBQAEggIAke9EMThco34N1QFgg846sbtxOeBa
# RLz3v8jDMuMsklKIy/JsWdIBwKVnTMQj9uJo+X3qoJKOa/b4gA2trwJWhdqE5sa+
# 2km9ad29To9FR3Dt1POI+EUhdorLzvUaDFkbONc/V6uWMVINmj2BTv6Mmaq5E8PN
# rBbNF9doBYuAgbAD1+DWU0WeDPHqSXq4wf9p3D5rP9PV4vJcTO5F8ztDsdaUKrg+
# jT1QiYjBeIL3V7XnwUOwtNtp84oVBSJMWAirQur8P9+fpyhjAhSttVsXlOd46q/W
# gAxC/JjIlDxYKl8mWrmK38x2884gvdEa4NZYIDd4a0FaNbKXEPMz1zv/Nxr8u+su
# kuX4lS6XZ6itWWm41Nx/Iew6W8uUFs0FRVoyaSX6hASmR6GABKi2kkzHBtroY6bh
# 3AA63VtQ65QCv8TiKyDrnpxwGdVeRMJLslP2P+d5EyDTKbH1XBQurSDgGqN+uBKz
# o6/PQPdXFiKtSS2B14pwOKdxktuN3reRcK14hxvQGkMJ+AlDijtCYlWN4qDXiT8W
# SKyv2Rk4dXCfsr3bIn86t5bQgjaJXm+HS2ZSNQY7cZFbNjfEHum6e3mdPnsmsiAB
# Pukxaqdqh2Z656wX6q3TuExLIyab+GAvTyITZm+EpSxlKdVRsR9WEyJ0A04mP55f
# 5+P3VKtvlU3NT2o=
# SIG # End signature block
