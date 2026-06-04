[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-Module Pester -MinimumVersion 5.5.0 -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module PSScriptAnalyzer -Scope CurrentUser -Force -SkipPublisherCheck
