# Release Notes

## v2026.1103.2130

### New
- NEW: Example post script `Examples\PostScripts\Update-ExchangeCertificate.ps1`. It installs the renewed certificate on one or more Exchange servers and enables it for IIS and SMTP by default. A custom RBAC role with `Get-`, `Import-` and `Enable-ExchangeCertificate` is sufficient
- NEW: `-RemovePreviousCertificate` on the Exchange example removes older certificates with the same subject. It needs `Remove-ExchangeCertificate` in the role

### Changed
- CHANGED: Status output is now part of the toolkit. The ConsoleStatus module is no longer installed or imported. You can remove it if no other tool uses it
- CHANGED: The plain-text console fallback is removed. `Invoke-NSCleanCertKeyFiles` writes expired and expiring certkeys and failed deletes as WARN status lines only

### Fixed
- FIX: The post script step always showed OK. It now shows WARN with the error when the script is missing, throws, or rejects the parameters
- FIX: Post script output is logged as it arrives. Output and `Write-Host` go to Info, verbose and debug to Debug, warnings and errors to Warning. Warnings, errors and a non-zero exit code set the step to WARN
- FIX: The Results recap in the log file uses one line per certificate. The log path is written once at the end
- FIX: `-NoConsoleOutput` showed status lines after an earlier run in the same session
- FIX: The Posh-ACME "renewed AS SOON AS POSSIBLE" warning split the status line. It is now logged at Debug
- FIX: A post script on a UNC path is logged without the `Microsoft.PowerShell.Core\FileSystem::` prefix

### Improved
- IMPROVED: The details of a renewed certificate show at the end of its own section, not in the Results recap
- IMPROVED: The Results recap uses one line per certificate and the `yyyy-MM-dd HH:mm` date format
- IMPROVED: Tests added for post script output, the recap log lines, the Posh-ACME warning and `-NoConsoleOutput`

### Known Issues
- None at the moment

## v2026.914.1645

### New
- NEW: `-PostPoSHScriptDir` sets the folder for post scripts, so `PostPoSHScriptFilename` can be a file name only. Set it on the command line or under `settings` in an AutoRun config. The command line value wins. The value must be a full path

### Fixed
- FIX: The default log file went to the module's `Public` folder. A log path without a directory now goes to `CertDir`, or to `%LOCALAPPDATA%\NetScalerToolkit` when there is no `CertDir`. A full path is used as given
- FIX: `-LogFile` now works with `-AutoRun` and overrides `LogFile` in the config file
- FIX: A relative `PostPoSHScriptFilename` was resolved against a module folder that does not exist. It now resolves against `PostPoSHScriptDir`. A missing script now fails the request before the certificate is ordered

### Improved
- IMPROVED: Documentation for the log file location and the post script folder. The `-LogFile` help no longer names the unused `GenLE-Log.txt` default
- IMPROVED: Tests added for the log path, `-LogFile` precedence and the post script path rules

### Known Issues
- None at the moment

## v2026.824.2030

### New
- NEW: A request renews when it no longer matches its last certificate: changed SANs, changed key length, or a switch between staging and production. The config stores this in `LastIssuedSerial`, `LastIssuedDomains`, `LastIssuedAcmeServer` and `LastIssuedKeyLength`. The first run after an upgrade does not renew on this basis
- NEW: A production run replaces a staging certificate on the appliance, also when it is still valid
- NEW: A certkey that is not `Valid` on the NetScaler, or that has a different common name, is replaced
- NEW: `Request-NSACMECertificate` supports `-WhatIf` and `-Confirm`. `-WhatIf` makes the real renewal decision and logs it, then stops before it requests or changes anything

### Changed
- CHANGED: ConsoleStatus 2026.824.1230 is the minimum version

### Fixed
- FIX: The renewal decision uses the certificate on the NetScaler first. Local Posh-ACME state no longer causes unnecessary renewals. ARI can still make renewal earlier when the ACME order matches the installed certificate
- FIX: The NetScaler certkey renewal source did not work. The validity field names and the NITRO date format are now read correctly
- FIX: `CertExpires` and `RenewAfter` are stored as UTC. They no longer shift by the local offset on every run
- FIX: Renewal metadata is written only after a successful deploy
- FIX: `ForceCertRenew` in a JSON config resets after a successful deploy. Before, it renewed the certificate on every run
- FIX: The ACME account is selected before the renewal check reads the orders. Before, the same request could skip in one run and renew in the next
- FIX: `RenewalSource` and `RenewalStrategy` keep the value from the renewal check. Before, a deploy set them to `ACME order`
- FIX: The config save merges into the current file. Edits made during a run are kept. The save uses a temporary file and keeps the previous version as `<config>.bak`
- FIX: A warning during an open status line split the line. The warning now shows as a note and the item shows WARN

### Improved
- IMPROVED: The console header shows the NetScalerToolkit version
- IMPROVED: The log header shows the loaded or installed version of NetScalerToolkit, Posh-ACME and ConsoleStatus
- IMPROVED: The log and the Setup section show `Load ConsoleStatus` next to `Load Posh-ACME`
- IMPROVED: A skipped request shows its reason in three lines: the state, the renewal date and how to override
- IMPROVED: Each warning on an open item gets its own line
- IMPROVED: The Results recap uses one line per certificate with wider columns
- IMPROVED: The log names each disabled request
- IMPROVED: The certkey renewal source logs status, validity, serial and issuer
- IMPROVED: `CurrentCertIsProduction` is removed from a request at the next save. `LastIssuedAcmeServer` replaces it
- IMPROVED: Tests added for the NITRO date format, the renewal decision, definition changes, UTC storage, the config merge and the ACME account selection
- IMPROVED: Documentation for the renewal decision, `ForceCertRenew`, the `LastIssued*` fields and the config save
- IMPROVED: `-UnbindGlobalVPNCertOnUpdate` is documented, including the NITRO 1541 message and the option to bind a new certkey name

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

