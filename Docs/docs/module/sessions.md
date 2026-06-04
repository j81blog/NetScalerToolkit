# Sessions

Use `Connect-NSNode` to create a NetScaler API session.

For HA pairs, point `-ManagementURL` at the node you normally manage, for example `ns-01.domain.local`. Use `ns-02.domain.local` when you intentionally want to connect to the other node.

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

Pass the session to generated commands:

```powershell
Invoke-NSGetSSLCertKey -Session $session -CertKey 'portal.example.com'
```

Clear or disconnect sessions when finished:

```powershell
Disconnect-NSNode -Session $session
Clear-NSSession
```
