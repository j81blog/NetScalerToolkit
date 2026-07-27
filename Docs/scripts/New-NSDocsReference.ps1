[CmdletBinding()]
param(
    [string]$ModulePath,
    [string]$DocsRoot,
    [ValidateSet('All', 'Common', 'Configuration', 'Statistics')]
    [string]$Area = 'All',
    [string]$ReferenceInfoRoot,
    [string]$ReferenceDescriptionPath,
    [switch]$Clean,
    [switch]$SkipPlatyPS,
    [int]$CommandLimit = 0
)

$ErrorActionPreference = 'Stop'

$scriptRoot = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
if (-not $ModulePath) {
    $ModulePath = Join-Path $scriptRoot '..\..\NetScalerToolkit\NetScalerToolkit.psd1'
}
if (-not $DocsRoot) {
    $DocsRoot = Join-Path $scriptRoot '..\docs'
}
if (-not $ReferenceInfoRoot) {
    $ReferenceInfoRoot = Join-Path $scriptRoot '..\..\ReferenceInfo'
}
if (-not $ReferenceDescriptionPath) {
    $ReferenceDescriptionPath = Join-Path $scriptRoot 'ns-reference-descriptions.json'
}

function ConvertTo-NSDocsSlug {
    param([Parameter(Mandatory)][string]$Value)
    $slug = $Value -creplace '([a-z0-9])([A-Z])', '$1-$2'
    $slug = $slug -replace '[^A-Za-z0-9]+', '-'
    $slug.Trim('-').ToLowerInvariant()
}

function Get-NSDocsCommandParts {
    param([Parameter(Mandatory)][string]$Name)

    $actions = @(
        'Add', 'Clean', 'Clear', 'Count', 'Delete', 'Disable', 'Enable', 'Get', 'Link',
        'Ping', 'Rename', 'Save', 'Set', 'Switch', 'Traceroute', 'Unset',
        'Unlink', 'Update'
    )

    foreach ($action in $actions) {
        if ($Name -match "^Invoke-NS$action(?<Resource>.+)$") {
            return [pscustomobject]@{
                Action = $action
                Resource = $Matches.Resource
            }
        }
    }

    if ($Name -match '^(?<Action>Request|New|Get|Set|Clear|Connect|Disconnect|Update|Resolve)-(?<Resource>.+)$') {
        return [pscustomobject]@{
            Action = $Matches.Action
            Resource = $Matches.Resource
        }
    }

    [pscustomobject]@{
        Action = 'Workflow'
        Resource = ($Name -replace '^(Invoke|Request|New|Get|Set|Clear|Connect|Disconnect|Update|Resolve)-', '')
    }
}

function Get-NSDocsFeatureArea {
    param(
        [Parameter(Mandatory)][string]$Resource,
        [Parameter(Mandatory)][string]$AreaName
    )

    if ($AreaName -eq 'Common') {
        return 'Common'
    }

    $normalized = ($Resource -replace '[^A-Za-z0-9]', '') -replace 'Stats$', ''
    $prefixes = @(
        @{ Prefix = 'VideoOptimization'; Name = 'Video Optimization' }
        @{ Prefix = 'ContentInspection'; Name = 'Content Inspection' }
        @{ Prefix = 'Authentication'; Name = 'Authentication' }
        @{ Prefix = 'Authorization'; Name = 'Authorization' }
        @{ Prefix = 'AppFlow'; Name = 'App Flow' }
        @{ Prefix = 'AppFw'; Name = 'App Firewall' }
        @{ Prefix = 'AppQoE'; Name = 'AppQoE' }
        @{ Prefix = 'Autoscale'; Name = 'Autoscale' }
        @{ Prefix = 'Analytics'; Name = 'Analytics' }
        @{ Prefix = 'Protocol'; Name = 'Protocol' }
        @{ Prefix = 'Responder'; Name = 'Responder' }
        @{ Prefix = 'Rewrite'; Name = 'Rewrite' }
        @{ Prefix = 'Transform'; Name = 'Transform' }
        @{ Prefix = 'Tunnel'; Name = 'Tunnel' }
        @{ Prefix = 'Traffic'; Name = 'Traffic' }
        @{ Prefix = 'SimpleACL'; Name = 'Simple ACL' }
        @{ Prefix = 'Cloud'; Name = 'Cloud' }
        @{ Prefix = 'Cluster'; Name = 'Cluster' }
        @{ Prefix = 'ServiceGroup'; Name = 'Service Group' }
        @{ Prefix = 'Service'; Name = 'Service' }
        @{ Prefix = 'GSLB'; Name = 'GSLB' }
        @{ Prefix = 'DNS'; Name = 'DNS' }
        @{ Prefix = 'SSL'; Name = 'SSL' }
        @{ Prefix = 'AAA'; Name = 'AAA' }
        @{ Prefix = 'ACL'; Name = 'ACL' }
        @{ Prefix = 'API'; Name = 'API' }
        @{ Prefix = 'Audit'; Name = 'Audit' }
        @{ Prefix = 'Bot'; Name = 'Bot' }
        @{ Prefix = 'Cache'; Name = 'Cache' }
        @{ Prefix = 'CMP'; Name = 'CMP' }
        @{ Prefix = 'CS'; Name = 'CS' }
        @{ Prefix = 'FEO'; Name = 'FEO' }
        @{ Prefix = 'HA'; Name = 'HA' }
        @{ Prefix = 'HTTP'; Name = 'HTTP' }
        @{ Prefix = 'ICA'; Name = 'ICA' }
        @{ Prefix = 'ICAP'; Name = 'ICAP' }
        @{ Prefix = 'INAT'; Name = 'INAT' }
        @{ Prefix = 'Interface'; Name = 'Interface' }
        @{ Prefix = 'IPSec'; Name = 'IPSec' }
        @{ Prefix = 'IPTunnel'; Name = 'IP Tunnel' }
        @{ Prefix = 'LB'; Name = 'LB' }
        @{ Prefix = 'LLDP'; Name = 'LLDP' }
        @{ Prefix = 'LSN'; Name = 'LSN' }
        @{ Prefix = 'MAP'; Name = 'MAP' }
        @{ Prefix = 'NAT64'; Name = 'NAT64' }
        @{ Prefix = 'NS'; Name = 'NS' }
        @{ Prefix = 'PBR'; Name = 'PBR' }
        @{ Prefix = 'PCP'; Name = 'PCP' }
        @{ Prefix = 'Policy'; Name = 'Policy' }
        @{ Prefix = 'QoS'; Name = 'QoS' }
        @{ Prefix = 'RDP'; Name = 'RDP' }
        @{ Prefix = 'RNAT'; Name = 'RNAT' }
        @{ Prefix = 'SNMP'; Name = 'SNMP' }
        @{ Prefix = 'Spillover'; Name = 'Spillover' }
        @{ Prefix = 'Stream'; Name = 'Stream' }
        @{ Prefix = 'System'; Name = 'System' }
        @{ Prefix = 'TM'; Name = 'TM' }
        @{ Prefix = 'User'; Name = 'User' }
        @{ Prefix = 'VLAN'; Name = 'VLAN' }
        @{ Prefix = 'VPN'; Name = 'VPN' }
        @{ Prefix = 'VRID'; Name = 'VRID' }
        @{ Prefix = 'VXLAN'; Name = 'VXLAN' }
        @{ Prefix = 'WASM'; Name = 'WASM' }
        @{ Prefix = 'XML'; Name = 'XML' }
    ) | Sort-Object { $_.Prefix.Length } -Descending

    foreach ($prefix in $prefixes) {
        if ($normalized.StartsWith($prefix.Prefix, [StringComparison]::OrdinalIgnoreCase)) {
            return $prefix.Name
        }
    }

    'Other'
}

function ConvertTo-NSDocsApiCategory {
    param([Parameter(Mandatory)][string]$FeatureArea)

    $map = @{
        'App Firewall' = 'appfw'
        'App Flow' = 'appflow'
        'AppQoE' = 'appqoe'
        'Content Inspection' = 'contentinspection'
        'IP Tunnel' = 'iptunnel'
        'Service Group' = 'servicegroup'
        'Simple ACL' = 'simpleacl'
        'Video Optimization' = 'videooptimization'
    }

    if ($map.ContainsKey($FeatureArea)) {
        return $map[$FeatureArea]
    }

    ($FeatureArea -replace '[^A-Za-z0-9]', '').ToLowerInvariant()
}

function ConvertTo-NSDocsTableText {
    param([AllowNull()][string]$Value)

    if (-not $Value) {
        return ''
    }

    ($Value -replace '\r?\n', ' ' -replace '\|', '\|').Trim()
}

function Get-NSDocsReferenceInfoRoot {
    param([Parameter(Mandatory)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return $null
    }

    $resolvedRoot = (Resolve-Path -LiteralPath $Path).Path
    $versionRoot = Get-ChildItem -LiteralPath $resolvedRoot -Directory |
        Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'html') } |
        Sort-Object Name -Descending |
        Select-Object -First 1

    if ($versionRoot) {
        return $versionRoot.FullName
    }

    if (Test-Path -LiteralPath (Join-Path $resolvedRoot 'html')) {
        return $resolvedRoot
    }

    $null
}

function Import-NSDocsReferenceDescription {
    param([Parameter(Mandatory)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return $null
    }

    Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
}

function Get-NSDocsStagedFeatureDescription {
    param(
        [AllowNull()]$DescriptionData,
        [Parameter(Mandatory)][ValidateSet('Configuration', 'Statistics')][string]$AreaName,
        [Parameter(Mandatory)][string]$FeatureArea
    )

    if (-not $DescriptionData) {
        return ''
    }

    $category = ConvertTo-NSDocsApiCategory -FeatureArea $FeatureArea
    $areaNames = @($AreaName, $AreaName.ToLowerInvariant())
    $keys = @($category, $FeatureArea, (ConvertTo-NSDocsSlug -Value $FeatureArea)) | Select-Object -Unique

    $roots = @($DescriptionData)
    if ($DescriptionData.PSObject.Properties.Name -contains 'areas') {
        $roots += $DescriptionData.areas
    }

    foreach ($root in $roots) {
        foreach ($area in $areaNames) {
            if ($root.PSObject.Properties.Name -notcontains $area) {
                continue
            }

            $areaNode = $root.$area
            foreach ($key in $keys) {
                if ($areaNode.PSObject.Properties.Name -notcontains $key) {
                    continue
                }

                $value = $areaNode.$key
                if ($value -is [string]) {
                    return $value
                }

                if ($value.PSObject.Properties.Name -contains 'description') {
                    return [string] $value.description
                }
            }
        }
    }

    ''
}

function ConvertFrom-NSDocsHtmlText {
    param([Parameter(Mandatory)][string]$Html)

    $text = $Html -replace '(?is)<script\b.*?</script>', ' '
    $text = $text -replace '(?is)<style\b.*?</style>', ' '
    $text = $text -replace '(?i)<br\s*/?>', "`n"
    $text = $text -replace '(?i)</p\s*>', "`n"
    $text = $text -replace '(?i)</div\s*>', "`n"
    $text = $text -replace '(?is)<[^>]+>', ' '
    $text = [System.Net.WebUtility]::HtmlDecode($text)
    $text -replace '[ \t]+', ' '
}

function Get-NSDocsFeatureDescription {
    param(
        [AllowNull()]$DescriptionData,
        [AllowNull()][string]$ReferenceRoot,
        [Parameter(Mandatory)][ValidateSet('Configuration', 'Statistics')][string]$AreaName,
        [Parameter(Mandatory)][string]$FeatureArea
    )

    $stagedDescription = Get-NSDocsStagedFeatureDescription -DescriptionData $DescriptionData -AreaName $AreaName -FeatureArea $FeatureArea
    if ($stagedDescription) {
        return $stagedDescription
    }

    if (-not $ReferenceRoot) {
        return ''
    }

    $apiArea = if ($AreaName -eq 'Statistics') { 'stat' } else { 'config' }
    $category = ConvertTo-NSDocsApiCategory -FeatureArea $FeatureArea
    $htmlPath = Join-Path $ReferenceRoot ('html\{0}\{1}\{1}.html' -f $apiArea, $category)
    if (-not (Test-Path -LiteralPath $htmlPath)) {
        return ''
    }

    $html = Get-Content -LiteralPath $htmlPath -Raw
    foreach ($match in [regex]::Matches($html, '(?is)<p\b[^>]*>(?<Text>.*?)</p>')) {
        $line = (ConvertFrom-NSDocsHtmlText -Html $match.Groups['Text'].Value).Trim()
        if ($line -match '\b(configuration|statistics)\b' -and $line.Length -gt 20) {
            return $line
        }
    }

    $lines = ConvertFrom-NSDocsHtmlText -Html $html -split '\r?\n' |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -match '\b(configuration|statistics)\b' -and $_.Length -gt 20 }

    @($lines)[0]
}

function Test-NSDocsFeatureDescription {
    param([AllowNull()][string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return $false
    }

    if ($Value -match '^Fetch statistics of the bound resources:') {
        return $false
    }

    if ($Value -match '^Configuration for 0 resource\.?$') {
        return $false
    }

    if ($Value -match '\bPossible values\b' -and $Value.Length -gt 220) {
        return $false
    }

    $true
}

function Get-NSDocsFeatureFallbackDescription {
    param(
        [Parameter(Mandatory)][ValidateSet('Configuration', 'Statistics')][string]$AreaName,
        [Parameter(Mandatory)][string]$FeatureArea
    )

    if ($AreaName -eq 'Statistics') {
        return ('Statistics for {0} resources.' -f $FeatureArea)
    }

    ('Configuration resources for {0}.' -f $FeatureArea)
}

function Get-NSDocsCommandSynopsis {
    param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][string]$CommandName
    )

    $fallback = @{
        'Clear-NSSession' = 'Clear the active NetScaler session.'
        'Connect-NSNode' = 'Connect to a NetScaler node.'
        'Disconnect-NSNode' = 'Disconnect from a NetScaler node.'
        'Get-NSSession' = 'Get the active NetScaler session.'
        'Invoke-NSCleanCertKeyFiles' = 'Find and remove unused NetScaler certificate and key files.'
        'Invoke-NSRestRequest' = 'Send an advanced NITRO REST request through the current NetScaler session.'
        'New-NSACMECertificateUser' = 'Create or update a NetScaler API user for certificate automation.'
        'Request-NSACMECertificate' = 'Request an ACME certificate and deploy it to a NetScaler.'
        'Set-NSSession' = 'Set the active NetScaler session.'
        'Update-NetScalerToolkit' = 'Update the local NetScalerToolkit module from GitHub.'
    }

    # Comment-based help wins so index pages and command pages stay in sync.
    try {
        $help = Get-Help -Name $CommandName -ErrorAction Stop
        $synopsis = ($help.Synopsis -split '\r?\n' |
            ForEach-Object { $_.Trim() } |
            Where-Object { $_ -and $_ -notmatch '^\{\{.*\}\}$' } |
            Select-Object -First 1)
        if ($synopsis) {
            return $synopsis
        }
    } catch {
        Write-Verbose "No comment-based help synopsis for $CommandName."
    }

    if (Test-Path -LiteralPath $Path) {
        $content = Get-Content -LiteralPath $Path -Raw
        $match = [regex]::Match($content, '(?ms)^## SYNOPSIS\s*(?<Synopsis>.*?)(?=^## )')
        if ($match.Success) {
            $synopsis = ($match.Groups['Synopsis'].Value -split '\r?\n' |
                ForEach-Object { $_.Trim() } |
                Where-Object { $_ -and $_ -notmatch '^\{\{.*\}\}$' } |
                Select-Object -First 1)
            if ($synopsis) {
                return $synopsis
            }
        }
    }

    if ($fallback.ContainsKey($CommandName)) {
        return $fallback[$CommandName]
    }

    'Generated command reference.'
}

function Get-NSDocsCommonCategory {
    param([Parameter(Mandatory)][string]$CommandName)

    switch -Regex ($CommandName) {
        '^(Request-NSACMECertificate|New-NSACMECertificateUser|Invoke-NSCleanCertKeyFiles)$' { 'Certificates'; break }
        '^(Connect-NSNode|Disconnect-NSNode|Get-NSSession|Set-NSSession|Clear-NSSession)$' { 'Session'; break }
        '^(Invoke-NSRestRequest)$' { 'Advanced REST'; break }
        '^(Update-NetScalerToolkit)$' { 'Module'; break }
        default { 'General' }
    }
}

function Get-NSDocsFunctionNamesFromPath {
    param([Parameter(Mandatory)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return @()
    }

    $names = [System.Collections.Generic.List[string]]::new()
    foreach ($file in Get-ChildItem -LiteralPath $Path -Recurse -File -Filter '*.ps1') {
        $tokens = $null
        $errors = $null
        $ast = [System.Management.Automation.Language.Parser]::ParseFile($file.FullName, [ref]$tokens, [ref]$errors)
        if ($errors) {
            Write-Warning "Skipping function discovery for $($file.FullName): $($errors[0].Message)"
            continue
        }
        foreach ($functionAst in $ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.FunctionDefinitionAst] }, $true)) {
            $names.Add($functionAst.Name)
        }
    }
    $names | Sort-Object -Unique
}

function New-NSDocsFallbackHelp {
    param(
        [Parameter(Mandatory)][System.Management.Automation.CommandInfo]$Command,
        [Parameter(Mandatory)][string]$Path
    )

    $syntax = @($Command.ParameterSets | ForEach-Object {
        $items = foreach ($parameter in $_.Parameters) {
            if ($parameter.Name -in @('Verbose', 'Debug', 'ErrorAction', 'WarningAction', 'InformationAction', 'ProgressAction', 'ErrorVariable', 'WarningVariable', 'InformationVariable', 'OutVariable', 'OutBuffer', 'PipelineVariable', 'WhatIf', 'Confirm')) {
                continue
            }
            if ($parameter.IsMandatory) {
                '-{0} <{1}>' -f $parameter.Name, $parameter.ParameterType.Name
            } else {
                '[-{0} <{1}>]' -f $parameter.Name, $parameter.ParameterType.Name
            }
        }
        ('{0} {1}' -f $Command.Name, ($items -join ' ')).Trim()
    })

    $parameters = @($Command.Parameters.GetEnumerator() | Sort-Object Key | Where-Object {
        $_.Key -notin @('Verbose', 'Debug', 'ErrorAction', 'WarningAction', 'InformationAction', 'ProgressAction', 'ErrorVariable', 'WarningVariable', 'InformationVariable', 'OutVariable', 'OutBuffer', 'PipelineVariable')
    })

    # Comment-based help is the source for prose; command metadata stays the source for
    # types, parameter sets and aliases.
    $help = $null
    try { $help = Get-Help -Name $Command.Name -Full -ErrorAction Stop } catch { $help = $null }

    $helpText = {
        param($Value)

        if ($null -eq $Value) { return '' }
        $text = if ($Value -is [string]) { $Value } else { ($Value | ForEach-Object { $_.Text }) -join "`n" }
        if ([string]::IsNullOrWhiteSpace($text)) { return '' }
        # Comment-based help wraps at authoring width; unwrap so Markdown reflows it.
        $paragraphs = $text -split '\r?\n\s*\r?\n'
        (($paragraphs | ForEach-Object {
            (($_ -split '\r?\n' | ForEach-Object { $_.Trim() } | Where-Object { $_ }) -join ' ')
        } | Where-Object { $_ }) -join "`n`n").Trim()
    }

    $synopsis = & $helpText $help.Synopsis
    if (-not $synopsis -or $synopsis -match '^\s*$') {
        $synopsis = 'Generated command reference. Review the command syntax and parameter metadata before use.'
    }
    $description = & $helpText $help.Description

    $content = [System.Collections.Generic.List[string]]::new()
    $content.Add(('# {0}' -f $Command.Name))
    $content.Add('')
    $content.Add(('Module area: `{0}`' -f $Command.Source))
    $content.Add('')
    $content.Add('## Synopsis')
    $content.Add('')
    $content.Add($synopsis)
    $content.Add('')
    if ($description) {
        $content.Add('## Description')
        $content.Add('')
        $content.Add($description)
        $content.Add('')
    }
    $content.Add('## Syntax')
    $content.Add('')
    foreach ($line in $syntax) {
        $content.Add('```powershell')
        $content.Add($line)
        $content.Add('```')
        $content.Add('')
    }
    $content.Add('## Parameters')
    $content.Add('')
    foreach ($parameter in $parameters) {
        $metadata = $parameter.Value
        $content.Add(('### -{0}' -f $parameter.Key))
        $content.Add('')

        $parameterHelp = & $helpText (
            $help.parameters.parameter | Where-Object { $_.name -eq $parameter.Key } | Select-Object -First 1
        ).description
        if ($parameterHelp) {
            $content.Add($parameterHelp)
            $content.Add('')
        }

        $content.Add(('- Type: `{0}`' -f $metadata.ParameterType.FullName))
        $mandatory = @($metadata.Attributes | Where-Object { $_.Mandatory }).Count -gt 0
        $content.Add(('- Required: `{0}`' -f $mandatory))
        $content.Add(('- Pipeline input: `{0}`' -f ($metadata.ValueFromPipeline -or $metadata.ValueFromPipelineByPropertyName)))
        if ($metadata.Aliases.Count -gt 0) {
            $content.Add(('- Aliases: `{0}`' -f ($metadata.Aliases -join '`, `')))
        }
        $validValues = @($metadata.Attributes | Where-Object { $_ -is [System.Management.Automation.ValidateSetAttribute] } | ForEach-Object { $_.ValidValues })
        if ($validValues.Count -gt 0) {
            $content.Add(('- Accepted values: `{0}`' -f ($validValues -join '`, `')))
        }
        $content.Add('')
    }

    $examples = @($help.Examples.Example)
    if ($examples.Count -gt 0) {
        $content.Add('## Examples')
        $content.Add('')
        $exampleNumber = 0
        foreach ($example in $examples) {
            $exampleNumber++
            $content.Add(('### Example {0}' -f $exampleNumber))
            $content.Add('')
            $code = ($example.code -split '\r?\n' | ForEach-Object { $_.Trim() } | Where-Object { $_ }) -join "`n"
            if ($code) {
                $content.Add('```powershell')
                $content.Add($code)
                $content.Add('```')
                $content.Add('')
            }
            $remark = & $helpText $example.remarks
            if ($remark) {
                $content.Add($remark)
                $content.Add('')
            }
        }
    }

    $links = @($help.relatedLinks.navigationLink | ForEach-Object { $_.uri } | Where-Object { $_ })
    if ($links.Count -gt 0) {
        $content.Add('## Related links')
        $content.Add('')
        foreach ($link in $links) {
            $content.Add(('- <{0}>' -f $link))
        }
        $content.Add('')
    }

    $content.Add('## Notes')
    $content.Add('')
    $content.Add('This page was generated from exported PowerShell command metadata and comment-based help.')

    Set-Content -LiteralPath $Path -Value $content -Encoding UTF8
}

function Update-NSDocsPublicText {
    param([Parameter(Mandatory)][string]$Path)

    $content = Get-Content -LiteralPath $Path -Raw
    $content = $content -replace '\s*\[-ProgressAction <ActionPreference>\]', ''
    $content = $content -replace '(?ms)\r?\n### -ProgressAction\r?\n.*?(?=\r?\n### )', ''
    $content = $content.Replace('GenLEUser', 'leuser')
    $content = $content.Replace('P@ssw0rd!', 'L34s3r!')
    Set-Content -LiteralPath $Path -Value $content -Encoding UTF8
}

$resolvedModulePath = (Resolve-Path -LiteralPath $ModulePath).Path
$moduleRoot = Split-Path -Parent $resolvedModulePath
$referenceRoot = Join-Path $DocsRoot 'module\reference'
$resolvedReferenceInfoRoot = Get-NSDocsReferenceInfoRoot -Path $ReferenceInfoRoot
$referenceDescriptions = Import-NSDocsReferenceDescription -Path $ReferenceDescriptionPath

if ($Clean -and (Test-Path -LiteralPath $referenceRoot)) {
    Remove-Item -LiteralPath $referenceRoot -Recurse -Force
}

New-Item -ItemType Directory -Path $referenceRoot -Force | Out-Null

Import-Module $resolvedModulePath -Force
Import-Module platyPS -ErrorAction SilentlyContinue

$areaMap = [ordered]@{
    Common = (Join-Path $moduleRoot 'NetScalerToolkit.Common\Public')
    Configuration = (Join-Path $moduleRoot 'NetScalerToolkit.Configuration\Public')
    Statistics = (Join-Path $moduleRoot 'NetScalerToolkit.Statistics\Public')
}

$areasToBuild = if ($Area -eq 'All') { @('Common', 'Configuration', 'Statistics') } else { @($Area) }
$platyPSCommand = Get-Command New-MarkdownHelp -ErrorAction SilentlyContinue
$hasPlatyPS = (-not ([bool]$SkipPlatyPS)) -and ($null -ne $platyPSCommand)
Write-Verbose ('platyPS available: {0}' -f $hasPlatyPS)
$summary = [System.Collections.Generic.List[object]]::new()

foreach ($areaName in $areasToBuild) {
    $sourcePath = $areaMap[$areaName]
    $areaSlug = (ConvertTo-NSDocsSlug $areaName)
    $areaRoot = Join-Path $referenceRoot $areaSlug
    New-Item -ItemType Directory -Path $areaRoot -Force | Out-Null

    $functionNames = @(Get-NSDocsFunctionNamesFromPath -Path $sourcePath)
    $commands = @($functionNames | ForEach-Object {
        Get-Command -Name $_ -CommandType Function -ErrorAction SilentlyContinue
    } | Sort-Object Name)
    if ($CommandLimit -gt 0) {
        $commands = @($commands | Select-Object -First $CommandLimit)
    }

    $featureGroups = [ordered]@{}
    $resourceFiles = @{}
    foreach ($command in $commands) {
        $parts = Get-NSDocsCommandParts -Name $command.Name
        $featureName = Get-NSDocsFeatureArea -Resource $parts.Resource -AreaName $areaName
        $featureSlug = ConvertTo-NSDocsSlug $featureName
        $resourceSlug = ConvertTo-NSDocsSlug $parts.Resource
        $resourceFileKey = '{0}/{1}' -f $featureSlug, $resourceSlug

        if (-not $featureGroups.Contains($featureSlug)) {
            $featureGroups[$featureSlug] = [pscustomobject]@{
                Name = $featureName
                Resources = [ordered]@{}
            }
        }

        $resourceGroups = $featureGroups[$featureSlug].Resources
        if (-not $resourceGroups.Contains($resourceSlug)) {
            $resourceGroups[$resourceSlug] = [pscustomobject]@{
                Name = $parts.Resource
                Feature = $featureName
                FeatureSlug = $featureSlug
                Commands = [System.Collections.Generic.List[object]]::new()
            }
            $resourceFiles[$resourceFileKey] = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
        }

        $resourceRoot = if ($areaName -eq 'Common') {
            Join-Path $areaRoot $resourceSlug
        } else {
            Join-Path (Join-Path $areaRoot $featureSlug) $resourceSlug
        }
        New-Item -ItemType Directory -Path $resourceRoot -Force | Out-Null
        $commandFile = ('{0}.md' -f (ConvertTo-NSDocsSlug $parts.Action))
        if (-not $resourceFiles[$resourceFileKey].Add($commandFile)) {
            $commandFile = ('{0}.md' -f (ConvertTo-NSDocsSlug $command.Name))
            [void]$resourceFiles[$resourceFileKey].Add($commandFile)
        }
        $commandPath = Join-Path $resourceRoot $commandFile

        if ($hasPlatyPS) {
            try {
                New-MarkdownHelp -Command $command.Name -OutputFolder $resourceRoot -Force | Out-Null
                $generatedPath = Join-Path $resourceRoot ('{0}.md' -f $command.Name)
                if ((Test-Path -LiteralPath $generatedPath) -and ($generatedPath -ne $commandPath)) {
                    Move-Item -LiteralPath $generatedPath -Destination $commandPath -Force
                }
            } catch {
                New-NSDocsFallbackHelp -Command $command -Path $commandPath
            }
        } else {
            New-NSDocsFallbackHelp -Command $command -Path $commandPath
        }
        Update-NSDocsPublicText -Path $commandPath

        $resourceGroups[$resourceSlug].Commands.Add([pscustomobject]@{
            Name = $command.Name
            Action = $parts.Action
            File = $commandFile
            ResourceSlug = $resourceSlug
            Synopsis = Get-NSDocsCommandSynopsis -Path $commandPath -CommandName $command.Name
            Category = Get-NSDocsCommonCategory -CommandName $command.Name
        })
    }

    foreach ($featureSlug in $featureGroups.Keys) {
        $featureGroup = $featureGroups[$featureSlug]

        if ($areaName -ne 'Common') {
            $featureRoot = Join-Path $areaRoot $featureSlug
            New-Item -ItemType Directory -Path $featureRoot -Force | Out-Null

            $featureIndex = [System.Collections.Generic.List[string]]::new()
            $featureIndex.Add(('# {0}' -f $featureGroup.Name))
            $featureIndex.Add('')
            $featureDescription = Get-NSDocsFeatureDescription -DescriptionData $referenceDescriptions -ReferenceRoot $resolvedReferenceInfoRoot -AreaName $areaName -FeatureArea $featureGroup.Name
            if (-not (Test-NSDocsFeatureDescription -Value $featureDescription)) {
                $featureDescription = Get-NSDocsFeatureFallbackDescription -AreaName $areaName -FeatureArea $featureGroup.Name
            }
            $featureIndex.Add($featureDescription)
            $featureIndex.Add('')
            $featureIndex.Add('| Resource | Commands |')
            $featureIndex.Add('| --- | ---: |')
            foreach ($resourceSlug in ($featureGroup.Resources.Keys | Sort-Object)) {
                $resourceGroup = $featureGroup.Resources[$resourceSlug]
                $featureIndex.Add(('| [{0}]({1}/index.md) | {2} |' -f $resourceGroup.Name, $resourceSlug, $resourceGroup.Commands.Count))
            }
            Set-Content -LiteralPath (Join-Path $featureRoot 'index.md') -Value $featureIndex -Encoding UTF8
        }

        foreach ($resourceSlug in $featureGroup.Resources.Keys) {
            $group = $featureGroup.Resources[$resourceSlug]
            $resourceRoot = if ($areaName -eq 'Common') {
                Join-Path $areaRoot $resourceSlug
            } else {
                Join-Path (Join-Path $areaRoot $featureSlug) $resourceSlug
            }
            $lines = [System.Collections.Generic.List[string]]::new()
            $lines.Add(('# {0}' -f $group.Name))
            $lines.Add('')
            $lines.Add(('Module area: **{0}**' -f $areaName))
            if ($areaName -ne 'Common') {
                $lines.Add(('Feature area: **{0}**' -f $group.Feature))
            }
            $lines.Add('')
            $lines.Add('| Action | Command |')
            $lines.Add('| --- | --- |')
            foreach ($item in @($group.Commands | Sort-Object Action, Name)) {
                $lines.Add(('| {0} | [{1}]({2}) |' -f $item.Action, $item.Name, $item.File))
            }
            Set-Content -LiteralPath (Join-Path $resourceRoot 'index.md') -Value $lines -Encoding UTF8
        }
    }

    $areaIndex = [System.Collections.Generic.List[string]]::new()
    $areaIndex.Add(('# {0}' -f $areaName))
    $areaIndex.Add('')
    $areaIndex.Add(('Generated reference for `{0}`.' -f $areaName))
    $areaIndex.Add('')
    if ($areaName -eq 'Common') {
        $commonCommands = @($featureGroups['common'].Resources.Values | ForEach-Object { $_.Commands } | Sort-Object Category, Name)
        foreach ($category in @($commonCommands.Category | Sort-Object -Unique)) {
            $areaIndex.Add(('## {0}' -f $category))
            $areaIndex.Add('')
            $areaIndex.Add('| Command | Description |')
            $areaIndex.Add('| --- | --- |')
            foreach ($item in @($commonCommands | Where-Object { $_.Category -eq $category } | Sort-Object Name)) {
                $areaIndex.Add(('| [{0}]({1}/{2}) | {3} |' -f $item.Name, $item.ResourceSlug, $item.File, (ConvertTo-NSDocsTableText -Value $item.Synopsis)))
            }
            $areaIndex.Add('')
        }
    } else {
        $featureDescriptions = @{}
        foreach ($featureSlug in $featureGroups.Keys) {
            $featureDescription = Get-NSDocsFeatureDescription -DescriptionData $referenceDescriptions -ReferenceRoot $resolvedReferenceInfoRoot -AreaName $areaName -FeatureArea $featureGroups[$featureSlug].Name
            if (-not (Test-NSDocsFeatureDescription -Value $featureDescription)) {
                $featureDescription = Get-NSDocsFeatureFallbackDescription -AreaName $areaName -FeatureArea $featureGroups[$featureSlug].Name
            }
            $featureDescriptions[$featureSlug] = $featureDescription
        }
        $hasFeatureDescriptions = @($featureDescriptions.Values | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }).Count -gt 0

        if ($hasFeatureDescriptions) {
            $areaIndex.Add('| Feature Area | Description | Resources | Commands |')
            $areaIndex.Add('| --- | --- | ---: | ---: |')
        } else {
            $areaIndex.Add('| Feature Area | Resources | Commands |')
            $areaIndex.Add('| --- | ---: | ---: |')
        }

        foreach ($featureSlug in ($featureGroups.Keys | Sort-Object)) {
            $featureGroup = $featureGroups[$featureSlug]
            $commandCount = @($featureGroup.Resources.Values | ForEach-Object { $_.Commands.Count } | Measure-Object -Sum).Sum
            if ($hasFeatureDescriptions) {
                $areaIndex.Add(('| [{0}]({1}/index.md) | {2} | {3} | {4} |' -f $featureGroup.Name, $featureSlug, (ConvertTo-NSDocsTableText -Value $featureDescriptions[$featureSlug]), $featureGroup.Resources.Count, $commandCount))
            } else {
                $areaIndex.Add(('| [{0}]({1}/index.md) | {2} | {3} |' -f $featureGroup.Name, $featureSlug, $featureGroup.Resources.Count, $commandCount))
            }
        }
    }
    Set-Content -LiteralPath (Join-Path $areaRoot 'index.md') -Value $areaIndex -Encoding UTF8

    $summary.Add([pscustomobject]@{
        Area = $areaName
        Commands = $commands.Count
        Groups = $featureGroups.Count
        Resources = @($featureGroups.Values | ForEach-Object { $_.Resources.Count } | Measure-Object -Sum).Sum
        PlatyPS = $hasPlatyPS
    })
}

$rootIndex = @(
    '# Module Reference'
    ''
    'The function reference is generated from the module source.'
    ''
    '- [Common](common/index.md)'
    '- [Configuration](configuration/index.md)'
    '- [Statistics](statistics/index.md)'
)
Set-Content -LiteralPath (Join-Path $referenceRoot 'index.md') -Value $rootIndex -Encoding UTF8

$summary
