# Release Notes

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
- None
