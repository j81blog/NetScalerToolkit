# NetScalerToolkit

PowerShell module for the NetScaler ADC NITRO API.

## Install From Source

Clone the repository and import the module from the repository root:

```powershell
Import-Module .\NetScalerToolkit\NetScalerToolkit.psd1 -Force
Get-Command -Module NetScalerToolkit
```

## Connect

```powershell
$credential = Get-Credential

Connect-NSNode `
    -ManagementUrl 'https://ns.example.local' `
    -Credential $credential `
    -SkipCertificateCheck
```

`Connect-NSNode` detects the appliance version after login. Generated commands use the detected version to choose compatible metadata. Current generated metadata supports NetScaler `13.1` and `14.1`.

When connecting directly to an HA node, use `-HA` to let the module detect the peer state and switch to the primary node when needed. Connecting to a secondary node without `-HA` produces a warning.

## Examples

```powershell
Invoke-NSGetLBVServer
Invoke-NSGetLBVServer -Name 'lb_test'
Invoke-NSGetLBVServerStats -Name 'lb_test'
Invoke-NSPing -HostName '192.0.2.10' -C 1

Invoke-NSAddLBVServer `
    -Name 'lb_test' `
    -ServiceType HTTP `
    -IPv46 '192.0.2.10' `
    -Port 80 `
    -PassThru
```

## Update From PowerShell Gallery

After the module is published to the PowerShell Gallery, update it with:

```powershell
Update-NetScalerToolkit -Confirm:$false
```

The command checks the latest gallery version first. If the gallery version is newer than the loaded module version, it installs that exact version with `Install-Module`; otherwise it returns a status object showing that the current version is already up to date. Before publication, the command returns `Status = NotPublished`.

Example scheduled task action:

```powershell
New-ScheduledTaskAction `
    -Execute 'pwsh.exe' `
    -Argument '-NoProfile -Command "Import-Module NetScalerToolkit; Update-NetScalerToolkit -Confirm:$false"'
```

## GenLeCertForNS Wrapper

`GenLeCertForNS.ps1` in the repository root is a compatibility wrapper for existing batch files and scheduled tasks. It imports the local repository module when present; otherwise it imports the installed `NetScalerToolkit` module. If the module is not installed, it installs the latest gallery version for the current user and then forwards all arguments to `Request-NSACMECertificate`.

For compatibility with legacy GenLeCertForNS usage against self-signed NetScaler management certificates, the wrapper adds `-SkipCertificateCheck` by default for NetScaler-connected operations unless the caller already specified it. Call `Request-NSACMECertificate` directly when strict management certificate validation is required.

The wrapper does not update the module on every certificate run. To opt in to an update before a run, add `-AutoUpdate`. The wrapper installs the latest gallery version before import when it is using an installed module. Direct `Request-NSACMECertificate -AutoUpdate` calls also check for updates, but if the module is already loaded the updated version is used after restarting PowerShell or re-importing the module.

```powershell
.\GenLeCertForNS.ps1 -AutoUpdate -ConfigFile .\GenLeCertForNS.json -AutoRun
```

## Current Scope

Generated configuration support currently includes 390 profile-backed resources across AAA, analytics, API, AppFlow, AppFW, AppQoE, audit, authentication, authorization, autoscale, Azure, bot, cache, cloud, cluster, CMP, content inspection, CR, CS, DB, DNS, endpoint, FEO, FIS, GSLB, HA, ICA, INAT, IPsec, Kafka, LB, LLDP, LSN, MAP, NAT64, network, NS, NTP, PCP, policy, QUIC, RDP, responder, rewrite, SNMP, SSL, stream, system, TM, transform, tunnel, user, video optimization, VPN, and utility categories.

Write-capable generated resources currently include:

- `lbvserver`, `nspartition`, `service`, `server`, and `csvserver` get/add/set/remove/enable/disable where supported by NITRO.
- `appflowcollector` get/add/set/remove.
- `aaagroup_intranetip_binding`, `aaagroup_auditsyslogpolicy_binding`, `sslservice_sslcipher_binding`, `sslservicegroup_sslcipher_binding`, and `sslvserver_sslcipher_binding` get/add/remove.
- `appfwarchive` and `systemfile` get/remove.
- `ping`, `ping6`, `traceroute`, and `traceroute6` as generated `Invoke-NS<Action><Resource>` commands.

Additional generated configuration resources are read-only until their write operations are profiled and validated.

Generated statistics support currently includes 80 generated `Invoke-NSGet*Stats` commands. Use this to inspect the generated statistics surface:

```powershell
Get-Command -Module NetScalerToolkit -Name 'Invoke-NSGet*Stats'
```

## Low-Level Requests

`Invoke-NSRestRequest` accepts either a raw HTTP `-Method` (`GET`, `POST`, `PUT`, `DELETE`) or a documented NITRO `-Operation`. NITRO operations such as `SAVE`, `IMPORT`, `EXPORT`, `UNSET`, `ENABLE`, `DISABLE`, `PING`, and `TRACEROUTE` are not HTTP methods; the helper resolves them to the correct HTTP verb and `action=` query where that generic mapping is known.

The generator and source conversion scripts are private project tooling and are not part of this public module repository.
