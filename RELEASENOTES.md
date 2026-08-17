# Release Notes

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

