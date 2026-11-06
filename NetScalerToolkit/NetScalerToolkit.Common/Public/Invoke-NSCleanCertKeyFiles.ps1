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

function Add-NSCleanCertKeyFilesWarning {
    param(
        [System.Collections.Generic.List[string]] $Sink,

        [Parameter(Mandatory)]
        [string] $Message
    )

    # A raw Write-Warning splits the open ConsoleStatus item line, so collect it for the note instead.
    if ($null -ne $Sink) {
        $Sink.Add($Message) | Out-Null
    } else {
        Write-Warning $Message
    }
}

function Get-NSCleanCertKeyFilesSystemFile {
    param(
        [Parameter(Mandatory)]
        [psobject] $Session,

        [Parameter(Mandatory)]
        [string] $FileLocation,

        [System.Collections.Generic.HashSet[string]] $VisitedLocation = ([System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)),

        [System.Collections.Generic.List[string]] $WarningSink
    )

    $normalizedLocation = '/' + $FileLocation.Trim('/') + '/'
    if (-not $VisitedLocation.Add($normalizedLocation)) { return @() }

    Write-Verbose ('Scanning certificate files in {0}.' -f $normalizedLocation)
    $systemFiles = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation ('Get system files from {0}' -f $normalizedLocation) -ScriptBlock {
            Invoke-NSGetSystemFile -Session $Session -FileLocation $normalizedLocation -ReturnNullOnNotFound
        }
    } catch {
        Add-NSCleanCertKeyFilesWarning -Sink $WarningSink -Message ('Skipping certificate file cleanup for location "{0}" because the file listing failed. {1}' -f $normalizedLocation, $_.Exception.Message)
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
                Get-NSCleanCertKeyFilesSystemFile -Session $Session -FileLocation (('{0}/{1}' -f $fileLocationValue.TrimEnd('/'), $fileName).TrimEnd('/') + '/') -VisitedLocation $VisitedLocation -WarningSink $WarningSink
            }
            continue
        }

        [PSCustomObject] @{
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
        [string[]] $ExcludeFilePattern,

        [string] $StatusLabel,

        [string] $StatusValue
    )

    Write-Verbose ('Building NetScaler certificate cleanup plan for {0}.' -f $FileLocation)
    $gatherWarnings = [System.Collections.Generic.List[string]]::new()
    # Scanning is the slow part of a run, so it gets a progress bar of its own.
    if ($StatusLabel) { Write-NSStatusItem -Label $StatusLabel -Value $StatusValue }
    $certKeys = @(Invoke-NSCleanCertKeyFilesOperation -Operation 'Get SSL certkeys' -ScriptBlock {
        Invoke-NSGetSSLCertKey -Session $Session -ReturnNullOnNotFound
    } | Where-Object { $_.certkey })
    Write-NSStatusTick
    Write-Verbose ('Found {0} SSL certkey object(s).' -f $certKeys.Count)

    $referenceMap = [System.Collections.Specialized.OrderedDictionary]::new([System.StringComparer]::OrdinalIgnoreCase)
    $fileReferenceFailures = [System.Collections.Generic.List[string]]::new()
    $runningConfig = Invoke-NSCleanCertKeyFilesOperation -Operation 'Get running configuration' -ScriptBlock {
        Invoke-NSGetNsrunningconfig -Session $Session -ReturnNullOnNotFound
    }
    Write-NSStatusTick
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
            $bindingOperation = '{0} for certkey {1}' -f $bindingCommand, $name
            $binding = try {
                Invoke-NSCleanCertKeyFilesOperation -Operation $bindingOperation -ScriptBlock {
                    & $bindingCommand -Session $Session -CertKey $name -ReturnNullOnNotFound
                }
            } catch {
                # If an optional reference check fails, keep this certkey instead of risking a bad delete.
                Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $name -Reason ('reference check failed: {0}' -f $bindingOperation)
                Add-NSCleanCertKeyFilesWarning -Sink $gatherWarnings -Message ('Skipping cleanup for SSL certkey "{0}" because reference check "{1}" failed. {2}' -f $name, $bindingOperation, $_.Exception.Message)
                Write-Verbose ('Certkey "{0}" marked non-removable because optional reference check failed.' -f $name)
                $null
            }

            # Binding APIs can echo only the requested certkey name; that alone is not a real reference.
            $bindingHasValue = @(
                foreach ($item in (ConvertTo-NSCleanCertKeyFilesArray $binding)) {
                    if ($null -eq $item) { continue }
                    foreach ($property in $item.PSObject.Properties) {
                        if ($property.Name -in @('certkey', 'certkeyname')) { continue }
                        if ($null -eq $property.Value) { continue }
                        if ($property.Value -is [string] -and [string]::IsNullOrWhiteSpace($property.Value)) { continue }
                        if ($property.Value -is [System.Array] -and $property.Value.Count -eq 0) { continue }
                        $true
                    }
                }
            ).Count -gt 0
            if ($bindingHasValue) {
                Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $name -Reason $bindingCommand
            }
        }

        if (Test-NSCleanCertKeyFilesRunningConfigReference -Line $runningConfigLines -Value $name -CertKeyDeclarationName $name) {
            Add-NSCleanCertKeyReference -ReferenceMap $referenceMap -CertKey $name -Reason 'running config'
        }
        Write-NSStatusTick
    }

    $certLinks = try {
        Invoke-NSCleanCertKeyFilesOperation -Operation 'Get SSL certificate links' -ScriptBlock {
            Invoke-NSGetSSLCertLink -Session $Session -ReturnNullOnNotFound
        }
    } catch {
        $reason = 'reference check failed: Get SSL certificate links'
        Add-NSCleanCertKeyReferenceForAll -ReferenceMap $referenceMap -CertKey $certKeys -Reason $reason
        Add-NSCleanCertKeyFilesWarning -Sink $gatherWarnings -Message ('Skipping certkey cleanup for this run because reference check "Get SSL certificate links" failed. {0}' -f $_.Exception.Message)
        $null
    }
    Write-NSStatusTick
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
        Add-NSCleanCertKeyFilesWarning -Sink $gatherWarnings -Message ('Skipping certkey cleanup for this run because reference check "Get VPN global SSL certkey bindings" failed. {0}' -f $_.Exception.Message)
        $null
    }
    Write-NSStatusTick
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
        Add-NSCleanCertKeyFilesWarning -Sink $gatherWarnings -Message ('Skipping certkey cleanup for this run because reference check "Get authentication SAML actions" failed. {0}' -f $_.Exception.Message)
        $null
    }
    Write-NSStatusTick
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
        Add-NSCleanCertKeyFilesWarning -Sink $gatherWarnings -Message ('Skipping certificate file cleanup for this run because reference check "Get SSL profiles" failed. {0}' -f $_.Exception.Message)
        $null
    }
    Write-NSStatusTick
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
        Add-NSCleanCertKeyFilesWarning -Sink $gatherWarnings -Message ('Skipping certificate file cleanup for this run because reference check "Get SSL vServers" failed. {0}' -f $_.Exception.Message)
        $null
    }
    Write-NSStatusTick
    foreach ($sslVServer in (ConvertTo-NSCleanCertKeyFilesArray $sslVServers)) {
        $name = Get-NSCleanCertKeyFilesName -Path $sslVServer.dhfile
        if ($name) { $dhFiles.Add($name) | Out-Null }
    }
    Write-Verbose ('Found {0} SSL DH file reference(s).' -f $dhFiles.Count)

    $certKeyPlan = foreach ($certKey in $certKeys) {
        $name = $certKey.certkey
        $excluded = $ExcludeCertKey -contains $name
        $referenceReasons = if ($referenceMap.Contains($name)) { @($referenceMap[$name]) } else { @() }
        [PSCustomObject] @{
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

    $systemFileList = @(Get-NSCleanCertKeyFilesSystemFile -Session $Session -FileLocation $FileLocation -WarningSink $gatherWarnings)
    Write-NSStatusTick
    $filePlan = foreach ($file in $systemFileList) {
        $fileName = $file.FileName
        $referenceReasons = [System.Collections.Generic.List[string]]::new()
        if (($ExcludeFile -contains $fileName) -or (@($ExcludeFilePattern | Where-Object { $fileName -like $_ }).Count -gt 0)) { $referenceReasons.Add('excluded file') | Out-Null }
        if ($referencedFiles.Contains($fileName)) { $referenceReasons.Add('installed sslcertkey') | Out-Null }
        if ($dhFiles.Contains($fileName)) { $referenceReasons.Add('SSL DH file') | Out-Null }
        foreach ($failure in $fileReferenceFailures) { $referenceReasons.Add($failure) | Out-Null }
        if (Test-NSCleanCertKeyFilesRunningConfigReference -Line $runningConfigLines -Value $fileName) {
            $referenceReasons.Add('running config') | Out-Null
        }

        [PSCustomObject] @{
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
    if ($StatusLabel) {
        $scanDetail = '{0} certkey(s), {1} file(s), {2} removable' -f @($certKeyPlan).Count, @($filePlan).Count, ($removableCertKeyNames.Count + $removableFileNames.Count)
        if ($gatherWarnings.Count -gt 0) {
            Write-NSStatusResult -Status WARN -Detail $scanDetail -Note ($gatherWarnings -join ' ')
        } else {
            Write-NSStatusResult -Status OK -Detail $scanDetail
        }
    } elseif ($gatherWarnings.Count -gt 0) {
        foreach ($gatherWarning in $gatherWarnings) { Write-Warning $gatherWarning }
    }
    [PSCustomObject] @{
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

    # HA sessions expose node-specific sessions so file removal can run on both nodes.
    $nodeSessions = [System.Collections.Generic.List[object]]::new()
    if ($Session.PrimarySession -and $Session.PrimarySession.Session) {
        $nodeSessions.Add($Session.PrimarySession) | Out-Null
    }
    if ($Session.SecondarySession -and $Session.SecondarySession.Session) {
        $nodeSessions.Add($Session.SecondarySession) | Out-Null
    }
    if ($nodeSessions.Count -eq 0) {
        $nodeSessions.Add([PSCustomObject] @{
            State = if ($Session.IsPrimary) { 'Primary' } elseif ($Session.IsSecondary) { 'Secondary' } else { 'Connected' }
            Session = $Session
        }) | Out-Null
    }

    $changed = $false
    $savedConfig = $false
    $initialPlan = $null
    $removedCertKeys = [System.Collections.Generic.List[object]]::new()
    $removedFiles = [System.Collections.Generic.List[object]]::new()
    Write-Verbose ('Using {0} node session(s) for file cleanup: {1}.' -f $nodeSessions.Count, (($nodeSessions | ForEach-Object { $_.State }) -join ', '))

    Initialize-NSConsoleStatus
    Write-NSStatusTitle -Title 'Invoke-NSCleanCertKeyFiles' -Subtitle @(
        'Location : {0}' -f $FileLocation
        'Nodes    : {0}' -f (($nodeSessions | ForEach-Object { $_.State }) -join ', ')
        'Mode     : {0}' -f $(if ($WhatIfPreference) { 'WhatIf, no changes are made' } else { 'live' })
    )

    if ($Backup) {
        $backupName = 'CleanCerts_{0}' -f (Get-Date -Format 'yyyyMMdd_HHmm')
        if ($PSCmdlet.ShouldProcess('NetScaler configuration', ('Create full system backup {0}' -f $backupName))) {
            Write-NSStatusSection -Title 'Backup'
            Write-NSStatusItem -Label 'Create system backup' -Value $backupName
            try {
                Invoke-NSCleanCertKeyFilesOperation -Operation 'Save nsconfig before backup' -ScriptBlock {
                    Invoke-NSSaveNSConfig -Session $primarySession -All $true -Confirm:$false
                } | Out-Null
                Invoke-NSCleanCertKeyFilesOperation -Operation ('Create system backup {0}' -f $backupName) -ScriptBlock {
                    Invoke-NSCreateSystemBackup -Session $primarySession -FileName $backupName -Level full -Comment 'Backup created by Invoke-NSCleanCertKeyFiles' -Confirm:$false
                } | Out-Null
                Write-NSStatusResult -Status OK -ShowDuration
            } catch {
                Write-NSStatusResult -Status FAIL -ErrorRecord $_
                throw
            }
        }
    }

    for ($attempt = 1; $attempt -le $Attempts; $attempt++) {
        Write-Verbose ('Starting certkey cleanup attempt {0}/{1}.' -f $attempt, $Attempts)
        Write-NSStatusSection -Title ('Remove certkeys, attempt {0}/{1}' -f $attempt, $Attempts)
        $plan = Get-NSCleanCertKeyFilesPlan -Session $primarySession -FileLocation $FileLocation -ExcludeCertKey $ExcludeCertKey -ExcludeFile $ExcludeFile -ExcludeFilePattern $ExcludeFilePattern -StatusLabel 'Scan configuration' -StatusValue ('attempt {0}/{1}' -f $attempt, $Attempts)
        if ($null -eq $initialPlan) { $initialPlan = $plan }
        $removableCertKeys = @($plan.CertKeys | Where-Object { $_.Removable })
        Write-Verbose ('Attempt {0}/{1} found {2} removable certkey object(s).' -f $attempt, $Attempts, $removableCertKeys.Count)
        if ($removableCertKeys.Count -eq 0) { break }

        foreach ($certKey in $removableCertKeys) {
            Write-NSStatusItem -Label $certKey.CertKey -Value $certKey.Status
            if ($PSCmdlet.ShouldProcess($certKey.CertKey, ('Delete unused SSL certkey, attempt {0}/{1}' -f $attempt, $Attempts))) {
                try {
                    Invoke-NSCleanCertKeyFilesOperation -Operation ('Delete SSL certkey {0}' -f $certKey.CertKey) -ScriptBlock {
                        Invoke-NSDeleteSSLCertKey -Session $primarySession -CertKey $certKey.CertKey -Confirm:$false
                    } | Out-Null
                    $removedCertKeys.Add($certKey) | Out-Null
                    Write-Debug ('Removed SSL certkey: {0}' -f $certKey.CertKey)
                    $changed = $true
                    Write-NSStatusResult -Status OK -Detail 'removed'
                } catch {
                    Write-NSStatusResult -Status FAIL -ErrorRecord $_
                    throw
                }
            } elseif ($WhatIfPreference) {
                # Nothing was actually deleted under -WhatIf; record it so PassThru/Summary still preview it.
                $removedCertKeys.Add($certKey) | Out-Null
                $changed = $true
                Write-NSStatusResult -Status SKIP -Detail 'WhatIf, would be removed'
            } else {
                Write-NSStatusResult -Status SKIP -Detail 'declined'
            }
        }

        if ($WhatIfPreference) {
            # Without a real deletion the next attempt would just find the same removable certkeys again.
            break
        }
    }

    Write-Verbose 'Refreshing cleanup plan before deleting certificate files.'
    Write-NSStatusSection -Title 'Remove certificate files'
    $plan = Get-NSCleanCertKeyFilesPlan -Session $primarySession -FileLocation $FileLocation -ExcludeCertKey $ExcludeCertKey -ExcludeFile $ExcludeFile -ExcludeFilePattern $ExcludeFilePattern -StatusLabel 'Scan configuration'
    $removableFiles = @($plan.Files | Where-Object { $_.Removable })
    foreach ($file in $removableFiles) {
        foreach ($nodeSession in $nodeSessions) {
            $targetSession = $nodeSession.Session
            $target = '{0}/{1} [{2}]' -f $file.FileLocation.TrimEnd('/'), $file.FileName, $nodeSession.State
            try {
                $existingFile = Invoke-NSCleanCertKeyFilesOperation -Operation ('Check system file {0}' -f $target) -ScriptBlock {
                    Invoke-NSGetSystemFile -Session $targetSession -FileName $file.FileName -FileLocation $file.FileLocation -ReturnNullOnNotFound
                }
            } catch {
                Write-NSStatusItem -Label $file.FileName -Value $nodeSession.State
                Write-NSStatusResult -Status WARN -Detail 'existence check failed' -Note ('Skipping {0}. {1}' -f $target, $_.Exception.Message)
                continue
            }

            if ($null -eq $existingFile) {
                Write-Verbose ('Skipping missing file {0}/{1} on {2}.' -f $file.FileLocation.TrimEnd('/'), $file.FileName, $nodeSession.State)
                continue
            }

            if ($PSCmdlet.ShouldProcess($target, 'Delete unused certificate file')) {
                Write-NSStatusItem -Label $file.FileName -Value $nodeSession.State
                try {
                    Invoke-NSCleanCertKeyFilesOperation -Operation ('Delete system file {0}' -f $target) -ScriptBlock {
                        Invoke-NSDeleteSystemFile -Session $targetSession -FileName $file.FileName -FileLocation $file.FileLocation -Confirm:$false
                    } | Out-Null
                    $removedFiles.Add([PSCustomObject] @{
                        PSTypeName = 'NetScalerToolkit.CertKeyCleanup.RemovedFile'
                        FileName = $file.FileName
                        FileLocation = $file.FileLocation
                        NodeState = $nodeSession.State
                        Target = $target
                    }) | Out-Null
                    Write-Debug ('Removed certificate file: {0}' -f $target)
                    $changed = $true
                    Write-NSStatusResult -Status OK -Detail 'removed'
                } catch {
                    Write-NSStatusResult -Status WARN -Detail $_.Exception.Message -Note ('Deleting {0} failed. Cleanup continues with the next file.' -f $target)
                }
            } elseif ($WhatIfPreference) {
                # Nothing was actually deleted under -WhatIf; record it so PassThru/Summary still preview it.
                Write-NSStatusItem -Label $file.FileName -Value $nodeSession.State
                $removedFiles.Add([PSCustomObject] @{
                    PSTypeName = 'NetScalerToolkit.CertKeyCleanup.RemovedFile'
                    FileName = $file.FileName
                    FileLocation = $file.FileLocation
                    NodeState = $nodeSession.State
                    Target = $target
                }) | Out-Null
                $changed = $true
                Write-NSStatusResult -Status SKIP -Detail 'WhatIf, would be removed'
            }
        }
    }

    Write-Verbose 'Building final cleanup plan.'
    Write-NSStatusSection -Title 'Certificate expiry'
    $finalPlan = Get-NSCleanCertKeyFilesPlan -Session $primarySession -FileLocation $FileLocation -ExcludeCertKey $ExcludeCertKey -ExcludeFile $ExcludeFile -ExcludeFilePattern $ExcludeFilePattern -StatusLabel 'Final scan'
    $expiredCertKeys = @($finalPlan.CertKeys | Where-Object { $_.Status -eq 'Expired' })
    # Expired certkeys report 0 days left, so they must not be counted twice.
    $expiringCertKeys = @($finalPlan.CertKeys | Where-Object { $_.Status -ne 'Expired' -and $null -ne $_.DaysToExpiration -and $_.DaysToExpiration -ge 0 -and $_.DaysToExpiration -le $ExpirationDays })
    foreach ($expiredCertKey in $expiredCertKeys) {
        Write-NSStatusItem -Label $expiredCertKey.CertKey -Value 'expired'
        Write-NSStatusResult -Status WARN -Detail 'expired and still configured'
    }

    foreach ($expiringCertKey in $expiringCertKeys) {
        Write-NSStatusItem -Label $expiringCertKey.CertKey -Value 'expiring'
        Write-NSStatusResult -Status WARN -Detail ('expires in {0} day(s)' -f $expiringCertKey.DaysToExpiration)
    }

    if ($expiredCertKeys.Count -eq 0 -and $expiringCertKeys.Count -eq 0) {
        Write-NSStatusItem -Label 'Expiry check' -Value ('within {0} day(s)' -f $ExpirationDays)
        Write-NSStatusResult -Status OK -Detail 'no expired or expiring certkeys'
    }

    if ($changed -and -not $NoSaveConfig) {
        if ($PSCmdlet.ShouldProcess('NetScaler configuration', 'Save nsconfig')) {
            Write-NSStatusSection -Title 'Save'
            Write-NSStatusItem -Label 'Save NetScaler config' -Value 'nsconfig'
            try {
                Invoke-NSCleanCertKeyFilesOperation -Operation 'Save nsconfig after cleanup' -ScriptBlock {
                    Invoke-NSSaveNSConfig -Session $primarySession -All $true -Confirm:$false
                } | Out-Null
                $savedConfig = $true
                Write-NSStatusResult -Status OK -ShowDuration
            } catch {
                Write-NSStatusResult -Status FAIL -ErrorRecord $_
                throw
            }
        }
    }

    $summaryObject = [PSCustomObject] @{
        PSTypeName = 'NetScalerToolkit.CertKeyCleanup.Summary'
        InitialCertKeys = @($initialPlan.CertKeys).Count
        FinalCertKeys = @($finalPlan.CertKeys).Count
        RemovedCertKeys = @($removedCertKeys).Count
        RemainingRemovableCertKeys = @($finalPlan.CertKeys | Where-Object { $_.Removable }).Count
        InitialFiles = @($initialPlan.Files).Count
        FinalFiles = @($finalPlan.Files).Count
        RemovedFiles = @($removedFiles).Count
        RemainingRemovableFiles = @($finalPlan.Files | Where-Object { $_.Removable }).Count
        Changed = $changed
        SavedConfig = $savedConfig
    }

    $finalPlan | Add-Member -NotePropertyName RemovedCertKeys -NotePropertyValue @($removedCertKeys) -Force
    $finalPlan | Add-Member -NotePropertyName RemovedFiles -NotePropertyValue @($removedFiles) -Force
    $result = $finalPlan

    if ($Summary) {
        # NoRecord: already counted by the steps above.
        Write-NSStatusSection -Title $(if ($WhatIfPreference) { 'Results, WhatIf preview' } else { 'Results' })

        Write-NSStatusItem -Label 'CertKeys' -Value ('{0} -> {1}' -f $summaryObject.InitialCertKeys, $summaryObject.FinalCertKeys)
        $certKeyDetail = '{0} removed, {1} still removable' -f $summaryObject.RemovedCertKeys, $summaryObject.RemainingRemovableCertKeys
        Write-NSStatusResult -Status $(if ($summaryObject.RemainingRemovableCertKeys -gt 0) { 'WARN' } else { 'OK' }) -Detail $certKeyDetail -NoRecord

        Write-NSStatusItem -Label 'Files' -Value ('{0} -> {1}' -f $summaryObject.InitialFiles, $summaryObject.FinalFiles)
        $fileDetail = '{0} removed, {1} still removable' -f $summaryObject.RemovedFiles, $summaryObject.RemainingRemovableFiles
        Write-NSStatusResult -Status $(if ($summaryObject.RemainingRemovableFiles -gt 0) { 'WARN' } else { 'OK' }) -Detail $fileDetail -NoRecord

        Write-NSStatusItem -Label 'Configuration' -Value $(if ($summaryObject.Changed) { 'changed' } else { 'unchanged' })
        if (-not $summaryObject.Changed) {
            Write-NSStatusResult -Status SKIP -Detail 'nothing to save' -NoRecord
        } elseif ($summaryObject.SavedConfig) {
            Write-NSStatusResult -Status OK -Detail 'nsconfig saved' -NoRecord
        } else {
            Write-NSStatusResult -Status WARN -Detail 'not saved, changes are lost on reboot' -NoRecord
        }
    }

    # Reports the run timer started by the title.
    Write-NSStatusSummary -Title 'Run summary'

    if ($PassThru -or $Summary) {
        return $result
    }
}

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA5YV5OT+845aLo
# N8GYjE93gwq1oDq4Q0FME3kx7k4yJaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAApgcKRL
# VXge2nhCAAAACmBwMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYxMTAyMDE0MDE2WhcNMjYxMTA1
# MDE0MDE2WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAnVjyyGHEaSM5kPEj0PmXnrii
# z+RQo0mfEhi4d1aRSj7ahqi75poWHhgv8MD8XzGLMM2PSjLvaxwgIlq86d9Xn3FD
# 6AxxgBaTXGyHf6qwKsDVzfGehkOvsFT/mORiqhTkO6JgBHDRf8hijYA5cG6UnNsX
# qS2bERxHFnEynYM8PL4ic3uTXBtTyq7Wf3ZipaZJKDrPpc3UlX6IV3O3geUCGw6z
# 8Zi1tmeTlwy8TLiTMiI58PTpfKiQVO5ubk7qtMjEzqnQ3yvI7ye0B6SonuxU2ymi
# 7sb3jI1ZoCBsPS2nWZaYKKi+xj8UFQmB0Gw1riLHcBFSUlV2ncRCiAkxX8eL6QZ5
# wexCg0FRt0GLziR424t4R//k+jllgA7+JlXVYr8csulwG7rBeDe6b/1zKZ8ni5vW
# k5bwOETJ5Ct1kJ2+VccOFOlV+Y9qlgXxU1FtJVsnNrfOjpHrT82vRx5SqutLgCic
# UuIu2p0VsPImH4JDp19p+KsdyyqYoQ1siHzSJ4yzAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# glf3Q5bglH9qb4svXMaZtVFl/ZswHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAL+z
# xJ+kw96Z5Llix/Cnd4qd5kZubh0Btp1nvi+j2BJ8XK5ciMxbEEfEiO+gRpxuPBSI
# ngvW95eTBWqH1PN18jfWJBjtR7jIJXqP9DnT6xmYBTTZyL7RYG9DvUGCOzQdrFzZ
# h+31eYJAKzgye6Wjt5KGZB2/njvG0eeF/lIrW8tYBlB9J6kahfl0/2EFYifcbg52
# a/fKUpGWOP0zD3GvjjZd0Y9H6/vGjeEJdXydNB4DbbG+iphkGFu5upMzzkwD9xLT
# Dn5iqySH0myL9orfZ3Oqfoy8/VeA0EL9jPIVFaoxevdexSs315nltThXfRz3A78s
# 7wfo51yALvIhEBirJP2GWh9oP4j9Y9ed+Wwzvo+ZRiLYv3YyLZWDMCFD684W3Cl+
# ATGhu3hpwN4O9MNuE/xHqxNA54zxuf56UIDSCHRbjv0DYuLj4Okwt7er2V/62miH
# p/TPAK2N9+D6CbgCHRxDMVPfheRTh6lnQujdjq09EtYl5kYSjS6sMLfHlXJM4IJn
# 1l5L+yyZ8hcYJ10QLmJc/Se6LboxV4sS1Euw9Ns7YvcHQNBmICLVyOc1N3Hfke2i
# U+p22jyimMPCvWTDs3A4Jzc/HuC1VmLiTBE/YNKQdQKnXKuCAbRps1en4ZuFvHSr
# vudGdIKuSdm0jM3wWXvwf0y/S18N/9jKSNPeFY4cMIIGwDCCBKigAwIBAgITMwAK
# YHCkS1V4Htp4QgAAAApgcDANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MTEwMjAxNDAxNloXDTI2
# MTEwNTAxNDAxNlowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAJ1Y8shhxGkjOZDxI9D5
# l564os/kUKNJnxIYuHdWkUo+2oaou+aaFh4YL/DA/F8xizDNj0oy72scICJavOnf
# V59xQ+gMcYAWk1xsh3+qsCrA1c3xnoZDr7BU/5jkYqoU5DuiYARw0X/IYo2AOXBu
# lJzbF6ktmxEcRxZxMp2DPDy+InN7k1wbU8qu1n92YqWmSSg6z6XN1JV+iFdzt4Hl
# AhsOs/GYtbZnk5cMvEy4kzIiOfD06XyokFTubm5O6rTIxM6p0N8ryO8ntAekqJ7s
# VNspou7G94yNWaAgbD0tp1mWmCiovsY/FBUJgdBsNa4ix3ARUlJVdp3EQogJMV/H
# i+kGecHsQoNBUbdBi84keNuLeEf/5Po5ZYAO/iZV1WK/HLLpcBu6wXg3um/9cymf
# J4ub1pOW8DhEyeQrdZCdvlXHDhTpVfmPapYF8VNRbSVbJza3zo6R60/Nr0ceUqrr
# S4AonFLiLtqdFbDyJh+CQ6dfafirHcsqmKENbIh80ieMswIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFIJX90OW4JR/am+LL1zGmbVRZf2bMB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQC/s8SfpMPemeS5Ysfwp3eKneZGbm4dAbadZ74vo9gSfFyuXIjMWxBHxIjvoEac
# bjwUiJ4L1veXkwVqh9TzdfI31iQY7Ue4yCV6j/Q50+sZmAU02ci+0WBvQ71Bgjs0
# Haxc2Yft9XmCQCs4Mnulo7eShmQdv547xtHnhf5SK1vLWAZQfSepGoX5dP9hBWIn
# 3G4Odmv3ylKRljj9Mw9xr442XdGPR+v7xo3hCXV8nTQeA22xvoqYZBhbubqTM85M
# A/cS0w5+Yqskh9Jsi/aK32dzqn6MvP1XgNBC/YzyFRWqMXr3XsUrN9eZ5bU4V30c
# 9wO/LO8H6OdcgC7yIRAYqyT9hlofaD+I/WPXnflsM76PmUYi2L92Mi2VgzAhQ+vO
# FtwpfgExobt4acDeDvTDbhP8R6sTQOeM8bn+elCA0gh0W479A2Li4+DpMLe3q9lf
# +tpoh6f0zwCtjffg+gm4Ah0cQzFT34XkU4epZ0Lo3Y6tPRLWJeZGEo0urDC3x5Vy
# TOCCZ9ZeS/ssmfIXGCddEC5iXP0nui26MVeLEtRLsPTbO2L3B0DQZiAi1cjnNTdx
# 35HtolPqdto8opjDwr1kw7NwOCc3Px7gtVZi4kwRP2DSkHUCp1yrggG0abNXp+Gb
# hbx0q77nRnSCrknZtIzN8Fl78H9Mv0tfDf/YykjT3hWOHDCCBygwggUQoAMCAQIC
# EzMAAAAYDeuRVamKAJgAAAAAABgwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMzJaFw0zMTAzMjYxODExMzJaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDIgNpgNFaiif2VWeWP5I6PnFXxJ/lB37fJR55GCvR7GLZBMkBijbiKVwgp
# BI3xM5nf484znH/qncJ+OCq6y3jgnQW+R8Zd7U+7LjlrmcskalzSQ0ghMxEpnBW8
# /HHs2V8ZJzQk6HP+SDsbvsL7LdlH/eO2l4mknhDBwr0Z/Q966TvEth5b8kCxj1vq
# iV4YNthLGRqZR9u2fK/yBMWu83p6O4uo2Edg++gEew5IL7vnnnKFqmSh/R9vPJy3
# WF1YcZewAUx8sXZNUnx3ZhVg59l2LpitPiwzE6FMqIsqaEvVe3MzuFd2a/uWDZH6
# VbDyUiRK78mIg1DQYA9zDEyyBFcNI+nxVSzglvL6u7PRuNqgcV3sf6ELxw89ysQM
# /Z4R1hRFWXRpyOWKKAKtfBHTk0UnNiPcxmLMMYs8jeUjOidfVPjTIry/UVwnwxdl
# kK85cZfBEMYZ/DBNOwdomP459Y1n8izKkbhsa+p4lw+cQVxATBFx9ggR79HhryT7
# HDmpPLvkJvBZ4wW4CW32UT2SMyDe28nIOU3m+hfHlVeKcLBQcym5VoRDjIcCVI7u
# qgGW2PNME0cfei8zCwCy6HCsssJWFS7eg/YbFhnATJcyWfMrkNuAbMfMN8Npg8cr
# S6jVVowyD0GG5zdgi+uQVcSK/638mA1xEYK3pnIoQgO09uuDBwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBSk
# Qwx/dlqlhec+jSgPDBeiRWlwxjBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQBxxyBW+X6mhdRiSwD9PMMWcGUAnx5/QUwnNvZdFGEX+4DR
# DIr9WCh4C87wHtw+lg1D3uzK10DstPX0LFLBFAC3vWMYX4ImXwoLhoR0xlN8mUdo
# rJ3bgnpCJWuI1531Z1rCwPuUrSkBxfOIGDk3p2ECb3Ho/xHi5PRSR/OUrWuQHwXi
# aXMTuXu3IRLezwVkZpFmNwYRD57R9Nx2F/yM7tzOY0Hh0hGCaYEK38/6FrS0SXad
# XWyDUCfn5XOGACRjUCnHx+JQUG0f4SHD+iblpAI0gl+ZHnVmdXXxHTZeTa0CYCIh
# FxKP2922s0g6zLmeiV13LWUmtt/UF7TrWXpMi2/0UNniaDoH7rnPGRV5xVX8uXy4
# sZii4aswzqPM7Y7+mzcranqZ8EjZk5gjLhQ3A2sZaprlOu8CaRmyfcIiVH7zVfgA
# vm81MWXFziAf7my7QOvnyEFPGddq8MSfPtfRyw/Uq3uH6KpoaJNIfPYH6fceZSi5
# 3Rat1A9grExq3ROjhhSpTcchuBItAMNVPxoKNbUm+iR/X3XkL+9WQginjyHe+hXL
# clY8vAGXFD1p40PqMIpAYsmEJBFKW9df4//1N5oQDr/FY9IBJl/oSS979i5rtT7N
# Zz9KvYraCPRBGs0QCy+sWvgQa0coM70QJVLeVwmSxUO/0od0w9Qry7bSLrxGoDCC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMACmBw
# pEtVeB7aeEIAAAAKYHAwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgnO7s
# 1/NADqw4uxJtYAndUEDO4k/rwQU1YFde7osZZDYwDQYJKoZIhvcNAQEBBQAEggGA
# H7WfnJYJcAkQSZfbdBTVRidCj6ONJei3Wd8I0HPsATFYS6+NvEfMpRcAtuB7egIf
# Eu8qCRvcub/xItKrYfSksOWj369ql5+e5iuUwALihva0S9ihmsHtKUTP9FglNxT1
# ZCHySd2C3YP40m9an90rIWo+GC5s6VuRtEU+cmI81AU8Y9MhZ9wgNPMM/qYdpjRc
# B4M44yd1S0IefrjjSp1OBPs+V6tTMTSyKkOvNDo9rg9VXdf+DKJTFVfg0uj9wIJp
# 6VSkixIiLZkeJCeOTItXjrW5mPW84/+VQolIbvy5SvlrVaoO0WaAEoq9OIOU0DEy
# 97ou7LTOfP17FbGByVP90GWJfqKexgHwlPRzQv9qr3776rNMkAS0gs/2p+61YWLN
# 5zaNn3aIrFYLyrygp5vhPuq8tC/j6ldaWopN+T1qs68GQdnUbLJ/RsQvvpu4hsAk
# z7YL93q+ZUzNsTzu3jB7yGV9r4+nbpXMrwW9l+m5+kPUhB7b4T0ykNty/79BdocN
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIE6ui586vVgunvWL+L2K
# P4g7ETpTxNifhM0IMUY49RGWAgZqwGDrJbsYEzIwMjYxMTAzMjEwMzA5LjA5M1ow
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
# IgQg2t9p15Jp3TA5SURc8TwF4rlV2Od1ftdDjIaB6jX3Ohowgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCDlBkDP9Rnq9cpj/Gh9
# QkEs7AwRuZ4J+BYM99j3Yuvx2DANBgkqhkiG9w0BAQsFAASCAgDTxIYxND69dYxQ
# DSoyzBXaaHYMUKUqxJuHVHfDbFW/EmtLOHl1AlmificbvlkAQaHa2kdDfjmHr1cH
# VP9J67EUMiPxuE1UqUU93f4INdUkf1HHLvb3k3JILj8cLrZ4fmYFHhVBZWnP7YGz
# AXPUUnPRoit69pIX8EaStlgxqMQn/9mhxwbeAZprncJKbNWMKK5bN36fJvNQthOK
# 0JZsxc2bUcTzfcotZc/ml9i96Td2RRj3ujBy9n7UmCR2hkW/bO41l+zApZvCp6bK
# +WzRvcB4SBvZb7wgMGJuZGCS9HLci6R+/1JFKy8HSrPhSSPkPLvs0xq4SxYQqLZr
# m/gdYv+NTywtrIOkXf10Vlcsez1xz6EEQ2OWNlPNDgsour3NwSAVgrBt61YHt7Xq
# Gk7bvHcmV1Hqba7gNPqkPlCaNZlwY/7c4KH71iQ386T1VAA/L1c2gmkEx2aRMagl
# Fv1mnOFMG0OISvIllGdW/hTMaBapyekP0MyAlPcbMYJwADqPTrgSdkfxd/VMFGjs
# 3FtI3ANXK3zkqjN28ihpWMhyAo9QtPQdhC1kNqJXZLVIuaVjHXMRLf3bELclc2DQ
# s0lQBfXex1FQw6dagHPN1stkNS2tFI/c+/PocAxgtdfCKZ3bhjDv+DEgEQWKFONv
# AyB34VuA9EnXUGQZ8Ey0GzTCBmcXMg==
# SIG # End signature block
