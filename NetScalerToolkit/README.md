# NetScalerToolkit Prototype

This prototype is a possible replacement framework for a future `J81.NSToolkit` generation target. It stays inside `PlayGround` and uses `NS` as the NetScaler shorthand in command names.

## Layout

```text
NetScalerToolkit
|-- NetScalerToolkit.psd1
|-- NetScalerToolkit.psm1
|-- NetScalerToolkit.Common
|   |-- Public
|   |-- Private
|-- NetScalerToolkit.Configuration
|   |-- Public
|   |-- Private
|-- NetScalerToolkit.Statistics
|   |-- Public
|   |-- Private
```

The root module dot-sources the three areas and exports the public commands as one user-facing module. The submodule folders are kept separate so the generator can still emit configuration and statistics functions into different trees.

## Public Commands

Common:

- `Connect-NSNode`
- `Disconnect-NSNode`
- `Get-NSSession`
- `Set-NSSession`
- `Clear-NSSession`
- `Invoke-NSRestRequest`

Configuration example:

- `Get-NSLBVServer`
- `New-NSLBVServer`
- `Set-NSLBVServer`
- `Remove-NSLBVServer`
- `Enable-NSLBVServer`
- `Disable-NSLBVServer`

Statistics example:

- `Get-NSLBVServerStats`

## Example Usage

```powershell
Import-Module .\PlayGround\NetScalerToolkit\NetScalerToolkit.psd1 -Force

$credential = Get-Credential
Connect-NSNode -ManagementUrl 'https://adc.example.local' -Credential $credential -SkipCertificateCheck

Get-NSLBVServer
Get-NSLBVServer -Name 'lb_web'
Get-NSLBVServerStats -Name 'lb_web'

New-NSLBVServer -Name 'lb_test' -ServiceType HTTP -IPv46 '192.0.2.10' -Port 80 -PassThru
Set-NSLBVServer -Name 'lb_test' -LBMethod LEASTCONNECTION -PassThru
Disable-NSLBVServer -Name 'lb_test' -PassThru
Enable-NSLBVServer -Name 'lb_test' -PassThru
Remove-NSLBVServer -Name 'lb_test' -Confirm:$false

Disconnect-NSNode
```

With the local playground credential file:

```powershell
$credential = Import-Clixml -LiteralPath '.\PlayGround\NSCred.xml'
Connect-NSNode -ManagementUrl 'https://10.254.0.10' -Credential $credential -SkipCertificateCheck
Get-NSLBVServer
Disconnect-NSNode -Confirm:$false
```

`-SkipCertificateCheck` supports PowerShell 7 and Windows PowerShell 5.1. In Windows PowerShell 5.1 the module temporarily installs a .NET certificate validation callback for the single request and restores the previous callback afterwards.

## HA Detection

`Connect-NSNode` always queries HA information after login by using `nsconfig` and `hanode`.

The session exposes:

- `IsHA`
- `IsStandalone`
- `ConnectedNodeIP`
- `ConnectedNodeState`
- `IsPrimary`
- `IsSecondary`
- `PrimaryIP`
- `SecondaryIP`
- `HAInfo`

If the connected endpoint is a secondary node, `Connect-NSNode` writes a warning but keeps that session unless `-HA` is specified.

```powershell
$session = Connect-NSNode -ManagementUrl 'https://10.254.0.12' -Credential $credential -SkipCertificateCheck -PassThru
$session.IsSecondary
$session.PrimaryIP
```

With `-HA`, the module discovers both nodes. If the initial endpoint is secondary, the returned active session is reconnected to the primary node and the secondary session is attached under `SecondarySession`.

```powershell
$session = Connect-NSNode -ManagementUrl 'https://10.254.0.12' -Credential $credential -SkipCertificateCheck -HA -PassThru
$session.ManagementUrl
$session.PrimarySession.Session.ManagementUrl
$session.SecondarySession.Session.ManagementUrl
```

When connecting through the SNIP, the active session remains on the SNIP URL. HA metadata still identifies the active primary node and attaches a direct secondary node session when `-HA` is specified.

## Version Handling

`Connect-NSNode` does not accept a version parameter. After authentication it queries `nitro/v1/config/nsversion` and stores the returned version details on the session as `Version`, `VersionText`, `VersionRaw`, and `VersionInfo`. `Version` is normalized to the major/minor release, for example `13.1` or `14.1`. The base REST path remains `nitro/v1/...` for supported versions. The intended generator behavior is:

- Emit only functions available for the target version.
- Emit version-specific parameter sets or validation metadata when properties differ.
- Keep `Invoke-NSRestRequest` version-aware only for transport-level behavior, not for resource-specific rules.

## Naming Decisions

The module name is `NetScalerToolkit`. Public commands use approved PowerShell verbs where practical:

- `Get` for read operations.
- `New` for create operations.
- `Set` for update operations.
- `Remove` for delete operations.
- `Enable` and `Disable` for state operations.
- `Invoke` only for the low-level transport function.

The shorthand is `NS`, not `NST`, so generated resource commands should follow the shape `Verb-NS<ResourceName>`.

## Generator Target

For generated functions, prefer thin wrappers:

1. Validate parameters and parameter sets.
2. Build the NITRO payload or query.
3. Call `Invoke-NSRestRequest`.
4. Return resource objects by default, with `-PassThru` on mutating commands when a fresh object is useful.

Avoid putting transport, authentication, retry, version, or response parsing logic in generated resource functions. Those should stay in `NetScalerToolkit.Common`.
