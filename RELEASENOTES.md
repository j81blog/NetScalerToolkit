# Release Notes

## v2026.817.1745

### New
- NEW: A request is renewed when it no longer matches the certificate it last produced: added or removed SANs, a changed key length, or a move between staging and production. Tracked in the JSON config with `LastIssuedSerial`, `LastIssuedDomains`, `LastIssuedAcmeServer` and `LastIssuedKeyLength`, written only after a successful deploy and only trusted while the serial still matches the deployed certkey, so a first run after upgrading renews nothing on this basis
- NEW: A staging certificate found on the appliance during a production run is replaced, even when it is still inside its validity window
- NEW: A certkey the NetScaler does not report as `Valid`, or one issued to a different common name than the request, is replaced

### Fixed
- FIX: The renewal decision now treats the certificate installed on the NetScaler as the primary source. Local Posh-ACME state is a per-machine cache, so a stale order left by another machine or an older ACME account could claim a certificate had expired while the appliance was serving a valid one, renewing certificates that did not need it. Provider renewal information such as ARI can still move renewal earlier, but only when the ACME order describes the certificate that is actually installed
- FIX: The NetScaler certkey renewal source never worked. The sslcertkey validity fields were read under names NITRO does not use, and the NITRO date format (`Jul 16 18:51:18 2020 GMT`, including a space padded day) could not be parsed. `daystoexpiration` alone is now enough to establish expiry
- FIX: `CertExpires` and `RenewAfter` were written as local time carrying a literal `Z`, so every run reparsed them as UTC and shifted the stored values by the local offset. They are now stored as true UTC and survive any number of runs unchanged
- FIX: Renewal metadata is no longer written from the pre-flight decision. Values describing an issued certificate are written after a successful deploy, so a failed renewal can no longer replace accurate dates with a guess taken from whichever source the decision happened to use
- FIX: `ForceCertRenew` set on a request in a JSON config is reset after the certificate is successfully deployed. It previously persisted and renewed the same certificate on every subsequent run. The reset happens after the deploy, not after issuance, so a failed NetScaler update still retries next run
- FIX: Posh-ACME orders are scoped to the current ACME account, but the renewal check read them before the account was selected. Which orders were visible therefore depended on whichever account happened to be active and changed partway through a run, so the same request could be skipped in one run and renewed in the next on identical input. The account is now selected before the order metadata is read, and is never registered for a request that only gets checked
- FIX: `RenewalSource` and `RenewalStrategy` were overwritten with a fixed `ACME order` value after every successful deploy, so a forced or definition driven renewal was recorded as an ACME order decision. They now keep what the renewal check decided
- FIX: The config file is saved by merging into the file as it stands rather than overwriting it with the copy loaded at run start. Only fields the run owns are replaced, and only on requests it processed, so an edit made while a run is in progress is no longer discarded. The write goes through a temporary file and keeps the previous version as `<config>.bak`

### Improved
- IMPROVED: The console header reports the running NetScalerToolkit version. Which build actually ran is the first thing needed when a run behaves unexpectedly, and it was previously only in the log file
- IMPROVED: The log header reports NetScalerToolkit, Posh-ACME and ConsoleStatus through one resolver. It distinguishes a loaded version from an installed one, since the header is written before those two modules are imported, and previously reported the highest installed Posh-ACME version as though it were the one in use
- IMPROVED: A `Loaded ConsoleStatus v<version>` line matches the existing Posh-ACME one, and a warning is logged when ConsoleStatus is unavailable and console output falls back to plain text
- IMPROVED: The Setup section reports `Load ConsoleStatus` alongside `Load Posh-ACME`, so both dependencies are shown the same way. The header line above it names the NetScalerToolkit version
- IMPROVED: Disabled certificate requests are logged by name instead of only counted, so a request excluded by `Enabled: false` is visible in the log
- IMPROVED: The certkey renewal source logs status, validity, serial and issuer
- IMPROVED: `CurrentCertIsProduction` is retired and removed from a request when it is next saved. `LastIssuedAcmeServer` carries the same information
- IMPROVED: Test coverage added for the NITRO date format, the deployed certificate decision path, request definition drift, first run after upgrade, UTC round tripping, the config merge and backup, and the ACME account being selected before order metadata is read
- IMPROVED: Documentation updated for the renewal decision order, the one shot `ForceCertRenew` flag, the `LastIssued*` config fields, and the merging config save
- IMPROVED: `-UnbindGlobalVPNCertOnUpdate` is documented. It shipped in v2026.817.1230 but appeared in no page, including the generated command reference. Global VPN Binding now covers updating a certkey that is already bound, the NITRO 1541 message, and the alternative of moving the binding to a new certkey name

### Known Issues
- None at the moment

## v2026.817.1230

### New
- NEW: Console output now runs through ConsoleStatus, with sections, per-item ticks and a closing summary for `Request-NSACMECertificate` and `Invoke-NSCleanCertKeyFiles`. Both commands end with a Results block naming what they produced. Plain text is used when ConsoleStatus is not available
- NEW: `-UnbindGlobalVPNCertOnUpdate` on `Request-NSACMECertificate` opts in to unbinding a certkey from VPN global so it can be updated in place. Without the switch the run still fails, but the message names the fix

### Fixed
- FIX: A failed notification mail left the attachment file handle open, which locked the log file for the rest of the run
- FIX: An unwritable log file no longer aborts the run
- FIX: HTTP-01 validation now fails right away when the content switch vServer is not serving, instead of waiting for the CA to time out. The failure message names the `-EnableVipBefore` / `-DisableVipAfter` pairing
- FIX: A certkey bound to VPN global cannot be updated in place. NITRO 1541 lists every possible cause but the real one, so the reference is now looked up and named in the error
- FIX: NITRO 2626 ("does not exist" for a system user) was missing from the not-found list, so `-ReturnNullOnNotFound` threw instead of returning null and `New-NSACMECertificateUser` could not create a user. Fixed in both `ConvertFrom-NSNitroResponse` and `Invoke-NSRestRequest`
- FIX: A rejected TLS handshake now suggests `-SkipCertificateCheck`, covering the PowerShell 7 and 5.1 exception shapes, and stays quiet when the switch is already set
- FIX: `New-NSACMECertificateUser` returned its result unconditionally, which made `-PassThru` a no-op
- FIX: `Invoke-NSCleanCertKeyFiles` counted an expired certkey twice, once as expired and once as expiring
- FIX: `.gitattributes` disables text normalization for `.ps1`, `.psm1` and `.psd1`, so `core.autocrlf` can no longer strip the CR and invalidate Authenticode signatures

### Known Issues
- None at the moment

## v2026.803.1615

### Fixed
- FIX: Certificate renewals no longer log harmless "Could not unbind/remove responder policy or action" warnings during cleanup when a domain's ACME authorization was already valid and no new HTTP validation challenge needed to be published

### Known Issues
- None at the moment

## v2026.727.1845

### Fixed
- FIX: ACME accounts are now reused across a run instead of registering a new account per certificate, which could exhaust the Let's Encrypt "new registrations per IP" rate limit on multi-certificate runs
- FIX: `New-PAAccount` no longer receives `-Force`, restoring the Posh-ACME duplicate-account safeguard
- FIX: Existing ACME account lookup now filters through `Get-PAAccount -Contact -KeyLength -Status`, matching Posh-ACME's own contact comparison instead of a manual check that never matched
- FIX: Account key length is kept as a string, so EC values (`ec-256`, `ec-384`, `ec-521`) are no longer silently replaced with RSA 2048
- FIX: `Write-NSACMECertificateErrorDetail` no longer throws `NullArrayIndex` while reporting exceptions whose `Data` dictionary is unusable, which previously truncated diagnostics for the original failure
- FIX: Failures while listing existing ACME accounts are logged instead of silently discarded

### Improved
- IMPROVED: ACME account resolution logs the account ID on both reuse and creation
- IMPROVED: `Write-NSACMECertificateErrorDetail` reports exception `Data` shape at debug level when the dictionary cannot be enumerated
- IMPROVED: Test coverage added for ACME account reuse, account key length handling, and exception detail logging

### Known Issues
- None at the moment

## v2026.608.1415

### Fixed
- FIX: Staging certkey naming fallback now uses `T-` prefix for non-production certificate requests
- FIX: Safe previous-certificate removal integrates cleanup logic with `-RemovePrevious` production path
- FIX: ACME module version logging now prefers loaded NetScalerToolkit module
- FIX: Generated remove wrappers no longer throw ShouldProcess null-reference errors when called from module functions
- FIX: `Invoke-NSDeleteSystemFile` now correctly handles NITRO args encoding for `/nsconfig/ssl/` PFX cleanup

### New
- NEW: `Remove-NSACMECertificatePreviousCertKey` safety helper function for certificate cleanup
- NEW: Comprehensive certificate deployment hardening for staging vs production environments
- NEW: Enhanced ACME certificate request validation and safety checks

### Improved
- IMPROVED: `Invoke-NSEnableNsFeature` now accepts string array input for multiple features
- IMPROVED: `Invoke-NSUpdateSSLCertKey` uses native `sslcertkey?action=update` for certkey replacement
- IMPROVED: Generated config/stat functions now complete for 13.1 and 14.1 reference sets
- IMPROVED: Common not-found error handling includes NITRO codes 373 and 3441
- IMPROVED: Test coverage expanded for ACME certificate operations and edge cases

### Known Issues
- None at the moment

