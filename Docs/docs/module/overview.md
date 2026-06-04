# Module Overview

NetScalerToolkit is organized into three module areas:

- **Common**: hand-written session, transport, validation, update, and certificate workflow commands.
- **Configuration**: generated commands for NetScaler configuration resources.
- **Statistics**: generated commands for NetScaler statistics resources.

The root module exports commands from these areas as a single public surface.

## Naming

Generated commands use this pattern:

```text
Invoke-NS<Action><Resource>
```

Examples:

- `Invoke-NSGetSSLCertKey`
- `Invoke-NSAddService`
- `Invoke-NSUpdateLBVServer`
- `Invoke-NSDeleteDNSTXTRecord`

Common workflow commands use idiomatic PowerShell names where that is clearer:

- `Connect-NSNode`
- `Get-NSSession`
- `Request-NSACMECertificate`
- `New-NSACMECertificateUser`
