# Release Notes

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

