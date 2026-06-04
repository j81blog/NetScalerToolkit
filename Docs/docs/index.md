# NetScalerToolkit

NetScalerToolkit is a PowerShell module for Citrix NetScaler automation through the NITRO API. It includes hand-written workflow commands for sessions, transport, and ACME certificate automation, plus generated Configuration and Statistics command sets for NetScaler resources.

This documentation focuses on practical operation:

- connecting to NetScaler safely
- understanding the module layout and command naming
- requesting ACME certificates from Let's Encrypt
- deploying externally issued certificates to NetScaler
- validating HTTP-01 and DNS-01 challenges
- deploying PFX certificates and certificate chains to NetScaler
- replacing SSL certkeys and Global VPN bindings
- finding the generated command that maps to a NetScaler resource

!!! note "Reference pages"
    The module reference is generated from the PowerShell module source.

## Start Here

- [Getting Started](getting-started.md)
- [Module Overview](module/overview.md)
- [Sessions](module/sessions.md)
- [Certificate Automation Overview](certificates/overview.md)
- [Staging And Production](certificates/staging-production.md)
- [Scenario Matrix](certificates/scenario-matrix.md)
- [Module Reference](module/reference/index.md)
