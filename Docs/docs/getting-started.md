# Getting Started

Import the module from a local checkout:

```powershell
Import-Module .\NetScalerToolkit\NetScalerToolkit.psd1 -Force
```

Create a credential and connect to an HA pair:

```powershell
$credential = [pscredential]::new(
    'nsroot',
    (ConvertTo-SecureString 'Sup3rS3cretP@ssw0rd' -AsPlainText -Force)
)

$connectParams = @{
    ManagementURL        = 'https://ns-01.domain.local'
    Credential           = $credential
    HA                   = $true
    PassThru             = $true
    SkipCertificateCheck = $true
}

$session = Connect-NSNode @connectParams
```

Use `-SkipCertificateCheck` only when the appliance management certificate is self-signed, expired, or issued by a private CA that is not trusted by the current machine.

Check the active session:

```powershell
$session | Select-Object ManagementUrl,IsHA,ConnectedNodeState,IsPrimary
```

For certificate automation, start with [Staging And Production](certificates/staging-production.md), then choose a validation scenario from the [scenario matrix](certificates/scenario-matrix.md).
