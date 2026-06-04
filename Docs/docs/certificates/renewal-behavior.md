# Renewal Behavior

NetScalerToolkit checks whether a request is due before it starts a new ACME order. `-ForceCertRenew` and its `-Force` alias bypass this check and request a replacement immediately.

## Renewal Decision Order

The module uses the first reliable source it can find:

1. Refreshed Posh-ACME order metadata.
2. Existing ACME certificate validity from local Posh-ACME storage.
3. Existing NetScaler certkey validity from `CertKeyNameToUpdate`.
4. Legacy `RenewAfter` and `CertExpires` values from a request or JSON config.

When the ACME provider supplies renewal information through Posh-ACME, that provider-supplied renewal window is preferred. When no provider renewal window is available but the certificate validity dates are known, NetScalerToolkit calculates the renewal window from the certificate lifetime and starts renewal after roughly two thirds of the lifetime has passed.

This avoids assuming a fixed certificate lifetime. The same behavior works for 90-day, 45-day, short-lived, and custom-lifetime certificates when the certificate validity dates are available.

## Valid Certificate Skip

If the current certificate is still valid and outside its renewal window, the request is skipped:

```text
j81.nl skipped. Outside renewal window. Use -ForceCertRenew to renew now.
```

This can happen with direct splatted requests and with JSON config runs. A direct splatted request does not need to include `RenewAfter`; the module can use the existing ACME order or NetScaler certkey when available.

## Debug Decision Details

Use `-LogLevel Debug` when you need to see why a request was renewed or skipped. The console shows the final decision source and dates:

```text
DEBUG  CheckCertRenewal    Renewal decision.
       Decision              Skip
       Source                ACME order
       RenewAfter            2026-07-04 12:00:00
       CertExpires           2026-09-02 12:00:00
```

The log file also stores the full structured decision details, including the reason, strategy, days until expiry, days until renewal, and whether ACME renewal information was available from the selected server.

## JSON Metadata

When a JSON config file is used or generated, NetScalerToolkit stores renewal information for visibility and later runs:

- `CertExpires`
- `RenewAfter`
- `RenewalSource`
- `RenewalStrategy`
- `AcmeProvider`
- `AcmeServer`
- `AcmeRenewalInfoSupported`

These values describe what the module observed during the run. They are useful for troubleshooting and scheduled renewal visibility, but live ACME order metadata and certificate validity are preferred when available.

## When Renewal Still Starts

The module starts a renewal when:

- `-ForceCertRenew` or `-Force` is specified.
- The provider renewal window has started.
- The calculated certificate lifetime window has started.
- The known certificate expiry date has passed.
- No reliable renewal window or certificate validity data is available.
