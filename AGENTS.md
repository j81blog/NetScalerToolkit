# AGENTS.md

Instructions for agents working in this repository.

General coding behavior (think before coding, simplicity first, surgical changes, goal-driven
execution, writing style) lives in the personal global files: `~/.claude/CLAUDE.md` for Claude Code
and `~/.codex/AGENTS.md` for Codex. Both tools load those on their own, so they are not repeated here.

The PowerShell coding standard is copied into the section below from a personal file. When the
source changes, update the copy.

This file is public. Local paths, signing details and the test lab live in `AGENTS.local.md`, which
is gitignored. Read it when it exists. Never put local paths, lab details or customer names in this
file.

## Preflight

Before edits:
1. State the current request scope in one sentence.
2. Apply the PowerShell standard section when touching `.ps1`, `.psm1` or `.psd1`.
3. Read the current file state before modifying it.
4. Define explicit success checks (tests, analyzer, command behavior).

Before the final response:
1. Check that every changed line traces to the request.
2. Run the test suite and report pass/fail/skip counts.
3. Run the analyzer on changed files.
4. Sign changed module files.
5. Name anything that was not validated. Do not report work complete when a validation was skipped.

## Delegation

Standing permission: spawn subagents for the work below without asking first. Say in the response
that a subagent did it, and which one.

Delegate, on a cheaper model (`haiku` or `sonnet`), when the task reads far more than it writes and
has an objective success check:

- Searching or reading the large generated files (`ns-functions-config-*.ps1`,
  `ns-functions-stat-*.ps1`) or `GenLeCertForNS.ps1`, returning only the relevant lines. Use the
  `Explore` agent.
- Sweeping the tree for a pattern across many files and reporting a list.
- Running the analyzer or the suite over a wide set and reporting findings.

Do not delegate:

- Anything that needs the conversation's accumulated context. A subagent starts cold and re-deriving
  a live investigation costs more than doing the work.
- Design decisions, or choosing between options the user should weigh.
- Small edits already scoped to a known file and line.

Verification is the point of delegating, so it must be objective: the suite passes, the analyzer is
clean, the signature validates. Re-reading a subagent's code to judge it by eye costs what the
delegation saved. Treat a subagent's report as a claim, not a result, and check it before repeating
it to the user.

## PowerShell standard

Copy of the personal standard, project-relevant parts only.

- Target Windows PowerShell 5.1 unless stated otherwise. Note any pwsh 7 feature or non-standard
  module explicitly. Prefer native cmdlets.
- US English for code, comments, names and help.
- OTBS braces: `{` on the statement line, `else`, `catch` and `finally` on the line of the preceding
  `}`. 4 spaces, no tabs, spaces around operators, blank lines between logical blocks.
- Verb-Noun PascalCase functions with approved verbs, camelCase internal variables, `"$($Item.Name)"`
  in strings, `[PSCustomObject]` and `[PSCredential]` casing, full cmdlet names, splatting for long
  calls.
- `[CmdletBinding()]` and a comment-based help block on every function. Parameter attributes each on
  their own line, type and name together on the last line, a blank line between parameters.
- Help header:

  ```powershell
  <#
      .SYNOPSIS
          Brief description.

      .DESCRIPTION
          Detailed description.

      .PARAMETER Name
          Parameter explanation.

      .EXAMPLE
          At least one example.

      .NOTES
          Function  : FunctionName
          Author    : John Billekens
          Copyright : Copyright (c) John Billekens Consultancy
          Version   : yyyy.Mdd.Hmm (Amsterdam time)
  #>
  ```

- Only make a function of code used more than once; otherwise keep it inline.
- Comments: minimal, short, technical, only where they add context. No em-dashes.
- 5.1 vs 7 traps:
  - `$IsWindows` does not exist on 5.1. Use `($PSVersionTable.PSEdition -eq 'Desktop' -or $IsWindows)`.
  - `Set-Content -Encoding UTF8` writes a BOM on 5.1 and none on 7, and `utf8BOM` fails on 5.1. For
    identical bytes use `[System.IO.File]::WriteAllText($path, $text, (New-Object System.Text.UTF8Encoding $true))`.
  - When a manifest claims both editions, run the tests on both.
- Encoding: signed files need UTF-8 with BOM and CRLF throughout. Keep source ASCII and write Unicode
  as `[char]0x2588`. Normalize before signing, never after.
- Type traps:
  - `Measure-Object -Property X -Sum` over nothing gives a `$null` Sum; cast with `[int]`.
  - `.Substring(0, $n)` throws on a negative `$n`; clamp width arithmetic first.
  - `ConvertTo-Json` defaults to `-Depth 2`; always set the depth.
  - A `[string]` parameter turns `$null` into `''`, so `[AllowEmptyString()]` covers both.
- Pester 5: `-Skip:` and `-ForEach` resolve at discovery, so their variables belong in
  `BeforeDiscovery`. `Should -Be` coerces types. `Write-Host` output can be captured with `6>&1`.
  Mock a cmdlet called inside a module with `-ModuleName`.
- Calling `powershell -Command` from pwsh: pass a single-quoted string, or write a script file and
  use `-File`. A double-quoted string is expanded by the outer shell first.

## Deployment

- Expect customer runs on Windows PowerShell 5.1 from a scheduled task. The module can be copied by hand into `C:\Program Files\WindowsPowerShell\Modules`, so a build can be deployed under a version
  number that was never published. Check the PowerShell Gallery before reusing a version number;
  bump with `Update-ModuleInfo.ps1` when the installed build differs.
- Test on 5.1 as well as pwsh 7. Behavior that only breaks on 5.1 (for example `Import-PSSession`)
  is what reaches the customer.

## Layout

- Four modules under `NetScalerToolkit\`: the root aggregator plus `.Common`, `.Configuration`,
  `.Statistics`.
- `.Configuration` and `.Statistics` are generated NITRO wrappers and are large. Do not hand-edit
  unless asked.
- `Public\` is exported, `Private\` is dot-sourced by the `.psm1` per directory. A new private
  function needs no manifest change. Only public commands belong in `FunctionsToExport`.

## Build and release

- `.\Update-ModuleInfo.ps1` bumps all four manifests to a date version and signs the module tree.
  Run it at the end of a change set.
- It only signs when the signing module from `AGENTS.local.md` is already imported in the session (it checks
  `Get-Module`, not `-ListAvailable`). Import it first or signing is silently skipped.

## Release notes

`RELEASENOTES.md` follows ASD-STE100 (Simplified Technical English):

- One fact per sentence, short sentences, active voice, present tense, simple words.
- Say what changed, not why or how it was found. A short "Before, ..." is fine when it shows the old
  failure.
- One change per entry. Split an entry that covers two features.
- Put each entry under its matching section (New, Changed, Fixed, Improved) with the matching prefix
  (`NEW:`, `CHANGED:`, `FIX:`, `IMPROVED:`).
- Keep the file UTF-8 with BOM and CRLF. No customer names.

## Signing

- The signing commands are in `AGENTS.local.md`.
- Files with a valid signature are skipped unless `-Force`. Sign only what changed, not the whole
  tree.
- Module files are signed. `Tests\*.ps1` are not, by convention. `Examples\` is not signed so far.
- Do not edit module files with `sed` from Git Bash: it rewrites CRLF to LF, and patterns ending in
  `\r$` silently fail to match. Use the Edit tool or PowerShell, then normalize to BOM + CRLF and
  check that the file parses before signing.
- To sign only what changed: take `git status --porcelain` paths under `NetScalerToolkit\` and sign
  those where `(Get-AuthenticodeSignature $path).Status -ne 'Valid'`.

## Tests

- `Invoke-Pester -Path .\Tests -Output None -PassThru`. Use an absolute path when the shell working
  directory may have been reset.
- Run the suite in a child process (`pwsh -NoProfile -File` and `powershell -NoProfile -File`) that
  writes only the counts and failures to a file. In-process, the status output of the full-run tests
  floods the tool output and truncates the counts.
- Known 5.1-only failure, not a regression: "reports the exception shape instead of throwing when
  Data keys are null". .NET on 5.1 reports the exception's `Data` as null.
- A test that a change fixes something must fail without the change. Verify that by reverting the
  fix temporarily, running the one test, and restoring the file byte for byte.
- `-WarningVariable` on an outer call also collects warnings that a nested command silenced. To
  check what reaches the console, capture the stream with `3>&1` and filter `WarningRecord`.
- A shadow function without `[CmdletBinding()]` silently drops `-WarningAction`, `-WarningVariable`
  and `-ErrorAction` into `$args`. Add `[CmdletBinding()]` when the test depends on them.
- Status output is active in tests whenever a command calls `Initialize-NSConsoleStatus`. Never
  assert on rendered status lines, their width depends on the host; assert on state, mock
  invocations, or the warning stream.
- On Windows PowerShell 5.1 the full-run tests need Posh-ACME on that edition's `PSModulePath`.
  `powershell.exe` started from pwsh rebuilds `PSModulePath`, so add the folder inside the 5.1
  process, and append it: a pwsh `PowerShellGet` earlier in the path breaks `Install-Module` on 5.1.
- CI runs the suite in pwsh only, with a global `$ErrorActionPreference = 'Stop'`. A test must pass
  under both `Stop` and `Continue`.
- Do not hand `TestDrive:` paths to module code. `Test-Path -LiteralPath` fails on them from module
  scope. Use a real temp directory.
- Mocking a third-party cmdlet that has `ValidateScript` (for example Posh-ACME `KeyLength`) fails,
  because `Mock` keeps the real parameter metadata and the validation calls module-private helpers.
  Define local shadow functions with simple parameter lists inside the `It` instead.

## Analyzer

- `Invoke-ScriptAnalyzer -Path` takes one path, not an array. Loop or pipe.
- Pre-existing findings that are accepted, do not chase them:
  - `PSUseSingularNouns` on `Invoke-NSCleanCertKeyFiles`
  - `PSAvoidAssignmentToAutomaticVariable` (`$Profile`), `PSAvoidUsingConvertToSecureStringWithPlainText`
    and `PSAvoidUsingEmptyCatchBlock` in `Request-NSACMECertificate.ps1`
  - `PSUseShouldProcessForStateChangingFunctions` and `PSUseOutputTypeCorrectly` on `New-*` private
    factory helpers, matching `New-NSNitroException`

## Console output

- All user-visible output goes through the `Write-NSStatus*` wrappers. ASCII only, no Unicode glyphs.
- Never `Write-Warning` while an item line is open, it splits the line. Attach a note with
  `Write-NSStatusResult -Note`, or collect warnings and emit them after the item closes.
- The status output is built in: `Initialize-NSConsoleStatus` plus the `Write-NSStatus*` functions
  and their helpers in `NetScalerToolkit.Common\Private`. It was adapted from the ConsoleStatus
  module 2026.824.1230 and no longer depends on it. Changes to ConsoleStatus do not flow back here
  and do not need to.
- Every `Write-NSStatus*` function no-ops until a command calls `Initialize-NSConsoleStatus`.
  `Request-NSACMECertificate -NoConsoleOutput` switches it off instead, and its returned result
  objects carry the outcome. There is no plain-text console fallback.
- Status state is module scope and lives for the whole session. Anything that must not draw has to
  switch it off explicitly; it does not reset between commands.
- Third-party code that calls `Write-Warning` (Posh-ACME does) splits an open status line too. Call it
  with `-WarningAction SilentlyContinue -WarningVariable` and route the text through the log.

## Post scripts

- `Request-NSACMECertificate` runs `PostPoSHScriptFilename` (resolved against `PostPoSHScriptDir`)
  with `-Thumbprint`, `-PFXfilename` (the full-chain PFX) and `-PFXPassword` (clear text), plus the
  `PostPoSHScriptExtraParameters` hashtable splatted. Output is logged per record by level.
- To rerun a post script by hand, take the same values from Posh-ACME as the account that ran the
  renewal: `Get-PACertificate -MainDomain <cn>` gives `Thumbprint`, `PfxFullChain` and `PfxPass`.
  Posh-ACME state is per user in `%LOCALAPPDATA%\Posh-ACME`.
- An encrypted `PfxPassword` in the JSON config uses the fixed GenLeCertForNS key:
  `ConvertTo-SecureString -String $value -Key (0..15)`. It is obfuscation, not protection.
- Example post scripts live in `Examples\PostScripts\`, outside the module. On 5.1, `Import-PSSession`
  re-validates the calling script's variables, so an optional parameter with a validation attribute
  and an empty value breaks it. Validate optional parameters in the script body instead.

## NetScaler behavior worth knowing

- NITRO 1541 on `sslcertkey ?action=update` means the certkey is referenced. The error lists every
  possible cause, never the actual one, so look the reference up with
  `Get-NSACMECertificateCertKeyReference`.
- `nodomaincheck` only covers the domain-mismatch case. A certkey bound to VPN global cannot be
  updated in place at all.
- NITRO 1545 from `?action=unlink` means no CA link exists. It is not a failure worth surfacing.

## Notes

- `AI\` holds design documents, not instructions. `AI\archive\` is superseded material, ignore it
  unless asked.
