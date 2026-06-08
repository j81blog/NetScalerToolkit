# NetScalerToolkit

NetScalerToolkit is a PowerShell module for Citrix NetScaler automation through the NITRO API.

It includes common session and transport functions, generated Configuration and Statistics commands, and certificate automation for ACME and externally issued certificates.

## Documentation

The full documentation site is planned for:

https://netscalertoolkit.j81.nl/

The site contains the getting started guide, session handling, certificate scenarios, ACME provider examples, NetScaler certificate deployment flows, cleanup guidance, and the generated module reference.

Documentation source is kept in `Docs/`.

## Install From Source

Clone the repository and import the module from the repository root:

```powershell
Import-Module .\NetScalerToolkit\NetScalerToolkit.psd1 -Force
Get-Command -Module NetScalerToolkit
```

## Install From GitHub

The repository includes installer scripts for users who want to install the module directly from the GitHub repository into their current-user PowerShell module path:

```powershell
irm https://raw.githubusercontent.com/j81blog/NetScalerToolkit/main/Install-ModuleFromGithubMain.ps1 | iex
```

From a local checkout:

```powershell
.\Install-ModuleFromGithubMain.ps1
```

Use the development branch installer when testing unreleased changes:

```powershell
irm https://raw.githubusercontent.com/j81blog/NetScalerToolkit/dev/Install-ModuleFromGithubDev.ps1 | iex
```

From a local checkout:

```powershell
.\Install-ModuleFromGithubDev.ps1
```

When run from a local checkout, the installer scripts copy the local `NetScalerToolkit` module folder into the current-user module path and import it.

## Connect To NetScaler

Create a credential and connect to a NetScaler node or HA pair:

```powershell
$credential = Get-Credential

$connectParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    HA                   = $true
    PassThru             = $true
    SkipCertificateCheck = $true
}

$session = Connect-NSNode @connectParams
```

`Connect-NSNode` detects the appliance version after login. Generated commands use the detected version to choose compatible metadata. Current generated metadata supports NetScaler `13.1` and `14.1`.

When `-HA` is used, the module detects the HA state and switches to the primary node when needed. Connecting directly to a secondary node without `-HA` produces a warning.

When the initial management endpoint is reachable (for example SNIP/load-balanced management URL) but direct secondary-node session attachment is not reachable from the caller network, HA connect logs a warning and continues with the active session. Primary failover remains strict: if the initial connection lands on a secondary node and the primary cannot be reached, connect fails.

Use `-SkipCertificateCheck` only when the appliance management certificate is self-signed, expired, or issued by a private CA that is not trusted by the current machine. The documentation site has more detail about session handling and connection patterns.

## Basic Usage

```powershell
Invoke-NSGetLBVServer
Invoke-NSGetLBVServer -Name 'lb_test'
Invoke-NSGetLBVServerStats -Name 'lb_test'
Invoke-NSPing -HostName '192.0.2.10' -C 1
```

Example create operation:

```powershell
$lbParams = @{
    Name        = 'lb_test'
    ServiceType = 'HTTP'
    IPv46       = '192.0.2.10'
    Port        = 80
    PassThru    = $true
}

Invoke-NSAddLBVServer @lbParams
```

## Certificate Automation

`Request-NSACMECertificate` automates ACME certificate requests and NetScaler deployment workflows. The module supports DNS-01 through Posh-ACME plugins, HTTP-01 validation, PFX deployment, certificate replacement, and generated JSON configuration files.

Start with the certificate section on the documentation site for the supported scenarios and examples.

The repository root also contains `GenLeCertForNS.ps1`, a compatibility wrapper for existing batch files and scheduled tasks that used the older script flow. New automation should call `Request-NSACMECertificate` directly where possible.

## Update From PowerShell Gallery

After the module is published to the PowerShell Gallery, update it with:

```powershell
Update-NetScalerToolkit -Confirm:$false
```

Before publication, the command returns `Status = NotPublished`.

## Command Reference

The generated command reference is part of the documentation site. Use PowerShell discovery locally when working from a checkout:

```powershell
Get-Command -Module NetScalerToolkit
Get-Command -Module NetScalerToolkit -Name 'Invoke-NSGet*Stats'
Get-Help Connect-NSNode -Full
```

Generated configuration support includes profile-backed resources across the NetScaler NITRO surface. Additional generated resources may be read-only until their write operations are profiled and validated.
