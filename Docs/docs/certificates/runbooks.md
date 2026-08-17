# Operations Runbooks

## First-Time Run

1. Import the module.
2. Connect to NetScaler with an administrative credential.
3. Run a certificate request.
4. Confirm the returned status is `Success`.
5. Confirm the NetScaler certkey is `Valid`.
6. Confirm temporary validation objects or TXT records were cleaned up.

## Production Renewal

1. Reuse the same request parameters.
2. Remove `-ForceCertRenew` unless a forced replacement is intentional.
3. Add `-Production` when issuing with Let's Encrypt production.
4. Validate the service binding or Global VPN binding.
5. Keep previous certkeys until rollback is no longer needed.

## Scheduled Renewal

Use the same command without `-ForceCertRenew`. NetScalerToolkit evaluates the certificate installed on the NetScaler, then ACME order metadata, certificate validity in local Posh-ACME storage, and legacy renewal metadata, and skips requests that are not due.

For JSON config based schedules, use:

```powershell
Request-NSACMECertificate -ConfigFile '.\GenLe-Config.json' -AutoRun
```

Existing schedules that call `GenLeCertForNS.ps1` can continue to call the wrapper:

```powershell
.\GenLeCertForNS.ps1 -ConfigFile '.\GenLe-Config.json' -AutoRun
```

See [Renewal Behavior](renewal-behavior.md) for the decision order and dynamic lifetime fallback.

## DNS Plugin Change

1. Update the Posh-ACME plugin name and `-DNSParams` hashtable.
2. Use a fresh hostname when retrying repeated DNS-01 changes.
3. Increase `-DNSWaitTime` if public resolvers observe stale TXT values.
4. Inspect provider records after failures.

## Interrupted HTTP Validation Run

1. Reuse the validation object names from the failed request.
2. Run `Request-NSACMECertificate -CleanADC`.
3. Confirm the temporary responder, LB, service, and CS policy/action objects are removed.
4. Retry the request.
