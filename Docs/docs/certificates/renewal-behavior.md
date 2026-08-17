# Renewal Behavior

NetScalerToolkit checks whether a request is due before it starts a new ACME order. `-ForceCertRenew` and its `-Force` alias bypass this check and request a replacement immediately.

## Renewal Decision Order

The certificate installed on the NetScaler is the only source that describes what is actually serving traffic, so it decides whether a replacement is needed. Local Posh-ACME state is a per-machine cache and is never authoritative on its own. That matters when runs are spread across an automation pool or a CI pipeline, where any given machine may hold no ACME state at all, or state left over from an older account.

A renewal starts when any of these hold, checked in order:

1. `-ForceCertRenew` or `-Force`, or `ForceCertRenew` on the request in the JSON config.
2. The request no longer matches the certificate it last produced. See [Request Definition Drift](#request-definition-drift).
3. A staging certificate is installed and this is a production run.
4. The NetScaler reports the certkey status as anything other than `Valid`.
5. The installed certificate is expired, or inside its renewal window.

Otherwise the request is skipped.

When `CertKeyNameToUpdate` resolves to nothing, or the certkey has no usable validity dates, the decision falls back to refreshed Posh-ACME order metadata, then the ACME certificate in local Posh-ACME storage, then legacy `RenewAfter` and `CertExpires` values from the request or JSON config. A request with no reliable source at all is renewed.

The renewal window is calculated from the certificate lifetime, starting after roughly two thirds of that lifetime has passed. This avoids assuming a fixed lifetime, so 90-day, 45-day, short-lived, and custom-lifetime certificates all work. Provider renewal information supplied through Posh-ACME, such as ARI, can move renewal earlier than the two-thirds point, but only when the ACME order describes the certificate that is actually installed. An order whose `CertExpires` does not match the installed certificate is stale and is ignored.

## Request Definition Drift

`LastIssuedDomains`, `LastIssuedAcmeServer`, `LastIssuedKeyLength` and `LastIssuedSerial` record what a request last produced. They are written to the JSON config only after a successful deploy, so any machine reading the config sees the same record.

The record is only trusted when `LastIssuedSerial` still matches the serial of the installed certkey. That corroboration is what makes the check safe to run from several machines: if something else replaced the certificate, or the record is missing because this is the first run after upgrading, the record is treated as unknown and drift is not considered. Nothing is renewed on that basis until a new record is written.

When the record is corroborated, a renewal starts if the requested domains, the ACME server, or the key length differ from what was last issued. Adding a SAN therefore renews a certificate that is otherwise still valid, and so does moving a request from staging to production.

## Force Renewal Is One Shot

`ForceCertRenew` set on a request in a JSON config is reset to `false` after the certificate is successfully deployed to the NetScaler. Without that reset the flag renews the same certificate on every subsequent run.

The reset happens after the deploy, not after issuance. If the certificate is issued but the NetScaler update fails, the flag survives so the next run retries.

The `-ForceCertRenew` command line switch is never written to the config and needs no reset.

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
       Source                NetScaler certificate
       RenewAfter            2026-07-04 12:00:00
       CertExpires           2026-09-02 12:00:00
```

`Source` names which input decided: `Force`, `request definition`, `NetScaler certificate`, `ACME order`, `ACME certificate`, `request metadata`, or `none`.

The log file also stores the full structured decision details, including the reason, strategy, days until expiry, days until renewal, and whether ACME renewal information was available from the selected server.

## JSON Metadata

When a JSON config file is used or generated, NetScalerToolkit stores renewal information for visibility and later runs:

Written after a successful deploy, describing the certificate that was issued:

- `CertExpires`
- `RenewAfter`
- `LastIssuedSerial`
- `LastIssuedDomains`
- `LastIssuedAcmeServer`
- `LastIssuedKeyLength`
- `AcmeProvider`
- `AcmeServer`
- `AcmeRenewalInfoSupported`

`CurrentCertIsProduction` was written by earlier versions and is removed from a request when that request is next saved. `LastIssuedAcmeServer` carries the same information, since the server name is `*_PROD` or `*_STAGE` per provider.

Written on every run, describing what the last decision used:

- `RenewalSource`
- `RenewalStrategy`

`CertExpires` and `RenewAfter` are stored as UTC and are not rewritten by a run that only checks a request, so repeated runs leave them unchanged.

### Saving

The config is saved by merging into the file as it stands at that moment, not by overwriting it with the copy loaded at run start. Only the fields listed above are replaced, and only on requests the run processed. Everything else, including `Enabled`, the `settings` block, and requests the run did not touch, is left as found. An edit made to the file while a run is in progress therefore survives.

The write goes through a temporary file and the previous version is kept as `<config>.bak`, so an interrupted write cannot leave an unusable config behind.
