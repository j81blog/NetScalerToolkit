# Tests

This folder contains Pester tests for `NetScalerToolkit`.

## Test Files

- `ACME.Unit.Tests.ps1`
  - Unit tests for ACME request helpers, renewal logic, DNS option handling, chain handling, VPN binding helper behavior, and `RemovePrevious` safety checks.
- `CertKeyCleanup.Unit.Tests.ps1`
  - Unit tests for certificate/key file cleanup logic and safety guards.
- `Common.Transport.Tests.ps1`
  - Unit tests for shared NITRO transport behavior, retries, warnings, not-found handling, and query formatting.
- `Integration.ACME.NetScaler.Tests.ps1`
  - Live NetScaler integration tests (DNS TXT and optional VPN binding replacement).
- `Wrapper.GenLeCertForNS.Tests.ps1`
  - Wrapper compatibility regression tests for `GenLeCertForNS.ps1`.

## Run Tests

Run all tests:

```powershell
Invoke-Pester -Path .\Tests -Output Detailed
```

Run unit tests only:

```powershell
Invoke-Pester -Path .\Tests\ACME.Unit.Tests.ps1,.\\Tests\\CertKeyCleanup.Unit.Tests.ps1,.\\Tests\\Common.Transport.Tests.ps1,.\\Tests\\Wrapper.GenLeCertForNS.Tests.ps1 -Output Detailed
```

Run only integration tests:

```powershell
Invoke-Pester -Path .\Tests\Integration.ACME.NetScaler.Tests.ps1 -Output Detailed
```

## Integration Test Gating

Integration tests are skipped by default.

Enable NetScaler integration suite:

```powershell
$env:NSTOOLKIT_TEST_RUN_NETSCALER = 'true'
```

Required integration environment variables:

```powershell
$env:NSTOOLKIT_TEST_NS_URL = 'https://10.254.0.10'
$env:NSTOOLKIT_TEST_USERNAME = '<user>'
$env:NSTOOLKIT_TEST_PASSWORD = '<password>'
$env:NSTOOLKIT_TEST_SKIP_CERT_CHECK = 'true'
```

Optional DNS zone override:

```powershell
$env:NSTOOLKIT_TEST_DNS_ZONE = 'adns.example.com'
```

Enable optional VPN global binding replacement test:

```powershell
$env:NSTOOLKIT_TEST_RUN_VPN_BINDING = 'true'
$env:NSTOOLKIT_TEST_VPN_OLD_CERTKEY = '<current-global-vpn-certkey>'
$env:NSTOOLKIT_TEST_VPN_NEW_CERTKEY = '<replacement-certkey>'
$env:NSTOOLKIT_TEST_VPN_CA_CERTKEY = '<optional-ca-certkey>'
```

## Notes

- Integration tests require reachable lab infrastructure and valid credentials.
- If integration gating variables are not set, skipped tests are expected behavior.
