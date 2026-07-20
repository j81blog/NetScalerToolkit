function Request-NSACMECertificate {
    <#
    .SYNOPSIS
        Request an ACME certificate and deploy it to a NetScaler.
    .DESCRIPTION
        Compatibility-focused module version of GenLeCertForNS. This first converted path supports HTTP-01 validation through a NetScaler and deploys the resulting certificate to /nsconfig/ssl. The public parameter surface intentionally mirrors the legacy script so existing config files and wrappers keep binding.
    #>
    [CmdletBinding(DefaultParameterSetName = 'LECertificatesHTTP')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingUserNameAndPasswordParams', '')]
    param(
        [Parameter(ParameterSetName = 'Help', Mandatory = $true)][Alias('h')][Switch]$Help,
        [Parameter(ParameterSetName = 'CleanADC', Mandatory = $true)][Alias('CleanNS')][Switch]$CleanADC,
        [Parameter(ParameterSetName = 'CleanTestCertificate', Mandatory = $true)][Switch]$RemoveTestCertificates,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanTestCertificate')][Alias('CleanVault')][Switch]$CleanPoshACMEStorage,
        [Parameter(ParameterSetName = 'CommandPolicy', Mandatory = $true)][Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)][Parameter(ParameterSetName = 'LECertificatesHTTP', Mandatory = $true)][Parameter(ParameterSetName = 'LECertificatesDNS', Mandatory = $true)][Parameter(ParameterSetName = 'CleanADC', Mandatory = $true)][Parameter(ParameterSetName = 'CleanTestCertificate', Mandatory = $true)][Alias('URL', 'NSManagementURL')][String]$ManagementURL,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][Alias('User', 'NSUsername', 'ADCUsername')][String]$Username,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][Alias('NSPassword', 'ADCPassword')][Object]$Password,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][Alias('NSCredential', 'ADCCredential')][System.Management.Automation.PSCredential]$Credential = [System.Management.Automation.PSCredential]::Empty,
        [Parameter(ParameterSetName = 'LECertificatesHTTP', Mandatory = $true)][Parameter(ParameterSetName = 'LECertificatesDNS', Mandatory = $true)][String]$CN,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String[]]$SAN = @(),
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String]$FriendlyName,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][ValidateSet('http', 'dns')][String]$ValidationMethod = 'http',
        [Parameter(ParameterSetName = 'LECertificatesDNS')][String]$DNSPlugin = 'Manual',
        [Parameter(ParameterSetName = 'LECertificatesDNS')][Object]$DNSParams = @{},
        [Parameter(ParameterSetName = 'LECertificatesDNS')][Int]$DNSWaitTime = 120,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Alias('NSCertNameToUpdate')][String]$CertKeyNameToUpdate,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$RemovePrevious,
        [Parameter(ParameterSetName = 'LECertificatesHTTP', Mandatory = $true)][Parameter(ParameterSetName = 'LECertificatesDNS', Mandatory = $true)][Parameter(ParameterSetName = 'CleanExpiredCerts', Mandatory = $true)][Parameter(ParameterSetName = 'AutoRun')][String]$CertDir,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Object]$PfxPassword = $null,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String]$EmailAddress,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][ValidateScript({
                if ($_ -is [int] -or $_ -as [int]) {
                    $size = [int]$_
                    if ($size -lt 2048 -or $size -gt 4096 -or ($size % 128) -ne 0) { throw 'Unsupported RSA key size. Must be 2048-4096 and divisible by 128.' }
                    return $true
                }
                if ([string]$_ -notin @('ec-256', 'ec-384', 'ec-521')) { throw 'Unsupported key size. Use RSA 2048-4096 or ec-256, ec-384, ec-521.' }
                return $true
            })][Object]$KeyLength = 2048,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'AutoRun')][Switch]$Production,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][Switch]$DisableLogging,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][Alias('LogLocation')][String]$LogFile = '<DEFAULT>',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][ValidateSet('Error', 'Warning', 'Info', 'Debug', 'None')][String]$LogLevel = 'Info',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][ValidateSet('txt', 'jsonl')][String]$LogType = 'txt',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('SaveNSConfig')][Switch]$SaveADCConfig,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$SendMail,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String[]]$SMTPTo,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String]$SMTPFrom,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][System.Management.Automation.PSCredential]$SMTPCredential = [System.Management.Automation.PSCredential]::Empty,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String]$SMTPServer,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Int]$SMTPPort = 25,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$SMTPUseSSL,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$LogAsAttachment,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$DisableIPCheck,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$IPv6,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$UpdateIIS,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$UpdateGlobalVPNCertBinding,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$GlobalVPNCertBindingIncludeCA,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][ValidateSet('Mandatory', 'Optional')][String]$GlobalVPNCertBindingCrlCheck,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][ValidateSet('Mandatory', 'Optional')][String]$GlobalVPNCertBindingOcspCheck,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String]$IISSiteToUpdate = 'Default Web Site',
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][String]$PostPoSHScriptFilename,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Hashtable]$PostPoSHScriptExtraParameters = @{},
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSCsVipName')][String[]]$CsVipName,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$UseLbVip,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSCspName')][String]$CspName = 'csp_letsencrypt',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][String]$CsaName = 'csa_letsencrypt',
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSCsVipBinding')][String]$CsVipBinding = '11',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSSvcName')][String]$SvcName = 'svc_letsencrypt_cert_dummy',
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSSvcDestination')][String]$SvcDestination = '1.2.3.4',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSLbName')][String]$LbName = 'lb_letsencrypt_cert',
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('TD')][Int]$TrafficDomain = 0,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSRspName')][String]$RspName = 'rsp_letsencrypt',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'CleanADC')][Alias('NSRsaName')][String]$RsaName = 'rsa_letsencrypt',
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP', DontShow)][Parameter(ParameterSetName = 'LECertificatesDNS', DontShow)][Parameter(ParameterSetName = 'CleanADC', DontShow)][String[]]$Partitions = @('default'),
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$EnableVipBefore,
        [Parameter(ParameterSetName = 'LECertificatesDNS')][String]$AlternateDNSValidationDomain,
        [Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$AlternateDNSValidationDomainSkipCheck,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$UseNetScalerDNS,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$DisableVipAfter,
        [Parameter(ParameterSetName = 'CommandPolicy', Mandatory = $true)][Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)][Switch]$CreateUserPermissions,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][String]$NSCPName = 'script-GenLeCertForNS',
        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)][Switch]$CreateApiUser,
        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)][String]$ApiUsername,
        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)][Object]$ApiPassword,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'AutoRun', Mandatory = $true)][String]$ConfigFile = $null,
        [Parameter(ParameterSetName = 'AutoRun', Mandatory = $true)][Switch]$AutoRun,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'AutoRun')][Alias('Force')][Switch]$ForceCertRenew,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'AutoRun')][Switch]$StopOnError,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Switch]$CleanExpiredCertsOnDisk,
        [Parameter(ParameterSetName = 'CleanExpiredCerts', Mandatory = $true)][Switch]$CleanAllExpiredCertsOnDisk,
        [Parameter(ParameterSetName = 'CleanExpiredCerts')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Int16]$CleanExpiredCertsOnDiskDays = 100,
        [Switch]$NoConsoleOutput,
        [Switch]$AutoUpdate,
        [Parameter(ParameterSetName = 'CommandPolicy')][Parameter(ParameterSetName = 'CommandPolicyUser')][Parameter(ParameterSetName = 'LECertificatesHTTP')][Parameter(ParameterSetName = 'LECertificatesDNS')][Parameter(ParameterSetName = 'AutoRun')][Parameter(ParameterSetName = 'CleanADC')][Parameter(ParameterSetName = 'CleanTestCertificate')][Switch]$SkipCertificateCheck,
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [ValidateSet('LetsEncrypt', 'ZeroSSL', 'Google', 'SSLCom', 'Actalis', 'CustomAcme')]
        [String]$CertificateProvider = 'LetsEncrypt',

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [String]$AcmeDirectoryUrl,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Alias('ExtAcctKID')]
        [String]$ExternalAccountBindingKeyId,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Alias('ExtAcctHMACKey')]
        [Object]$ExternalAccountBindingHmacKey,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [ValidateSet('HS256', 'HS384', 'HS512')]
        [Alias('ExtAcctAlgorithm')]
        [String]$ExternalAccountBindingAlgorithm = 'HS256',

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Switch]$UseModernPfxEncryption,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [ValidateSet('None', 'Warn', 'Fail')]
        [String]$CertificateChainValidation = 'Warn',

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [String]$PreferredChain,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [String]$Profile,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [String[]]$DnsAlias,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Int]$ValidationTimeout = 240,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Int]$LifetimeDays,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Switch]$AlwaysNewKey,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Switch]$SkipPoshACMEInstall,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Switch]$RemoveUploadedPfx
    )

    begin {
        $script:NSACMECertificateLogFile = $null
        $script:NSACMECertificateLogLevel = $LogLevel
        $script:NSACMECertificateLogType = $LogType
        $script:NSACMECertificateSensitiveValues = [System.Collections.Generic.List[object]]::new()
        $script:NSACMECertificateAutoUpdateResult = $null
        $script:NSACMETermsOfServiceLogged = $false
        $ProgressPreference = 'SilentlyContinue'

        $script:NSACMECertificateNoConsoleOutput = [bool]$NoConsoleOutput
        if ($NoConsoleOutput) {
            $InformationPreference = 'SilentlyContinue'
            $WarningPreference = 'SilentlyContinue'
            $ProgressPreference = 'SilentlyContinue'
            $VerbosePreference = 'SilentlyContinue'
            $DebugPreference = 'SilentlyContinue'
        }

        if ($AutoUpdate -and -not $Help -and [string]$env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE -ne '1') {
            $updateResult = Update-NetScalerToolkit -Confirm:$false
            $script:NSACMECertificateAutoUpdateResult = $updateResult
            if ($updateResult.Updated) {
                Write-Warning "WARNING: NetScalerToolkit was updated to $($updateResult.AvailableVersion), but this command is already running from the previously loaded module. Restart PowerShell or re-import NetScalerToolkit before the next run to use the updated code."
            } else {
                Write-Information "NetScalerToolkit auto-update status: $($updateResult.Status). $($updateResult.Message)" -InformationAction Continue
            }
        }
    }

    process {
        if ($Help) { Get-Help Request-NSACMECertificate -Detailed; return }
        if ($CleanAllExpiredCertsOnDisk) {
            return Remove-NSACMECertificateExpiredDiskCertificate -CertDir $CertDir -Days $CleanExpiredCertsOnDiskDays
        }

        $scriptRoot = if ($PSScriptRoot) { $PSScriptRoot } else { (Get-Location).Path }
        $settings = [pscustomobject]@{}
        $requests = @()
        if ($AutoRun) {
            if (-not (Test-Path -LiteralPath $ConfigFile)) { throw "Config file not found: $ConfigFile" }
            $config = Get-Content -LiteralPath $ConfigFile -Raw | ConvertFrom-Json
            $settings = $config.settings
            $requests = @($config.certrequests | Where-Object { $_.Enabled -ne $false })
            if (-not $ManagementURL) { $ManagementURL = $settings.ManagementURL }
            if (-not $Credential -or $Credential -eq [pscredential]::Empty) {
                if ($settings.ADCCredentialUsername -and $settings.ADCCredentialPassword) {
                    $Credential = [pscredential]::new($settings.ADCCredentialUsername, (ConvertFrom-NSACMECertificateLegacySecret -Object $settings.ADCCredentialPassword))
                }
            }
            if ($settings.LogFile) { $LogFile = $settings.LogFile }
            if ($settings.LogLevel) { $LogLevel = $settings.LogLevel; $script:NSACMECertificateLogLevel = $LogLevel }
            if ($settings.LogType) { $LogType = $settings.LogType; $script:NSACMECertificateLogType = $LogType }
        } else {
            $requests = @([pscustomobject]@{ Enabled = $true; CN = $CN; SANs = ($SAN -join ','); FriendlyName = $FriendlyName; CsVipName = $CsVipName; UseLbVip = [bool]$UseLbVip; EnableVipBefore = [bool]$EnableVipBefore; DisableVipAfter = [bool]$DisableVipAfter; CertKeyNameToUpdate = $CertKeyNameToUpdate; RemovePrevious = [bool]$RemovePrevious; CertDir = $CertDir; EmailAddress = $EmailAddress; KeyLength = $KeyLength; ValidationMethod = $ValidationMethod; DNSPlugin = $DNSPlugin; DNSParams = $DNSParams; DNSWaitTime = $DNSWaitTime; AlternateDNSValidationDomain = $AlternateDNSValidationDomain; AlternateDNSValidationDomainSkipCheck = [bool]$AlternateDNSValidationDomainSkipCheck; UseNetScalerDNS = [bool]$UseNetScalerDNS; ForceCertRenew = [bool]$ForceCertRenew; DisableIPCheck = [bool]$DisableIPCheck; PfxPassword = $PfxPassword; UpdateIIS = [bool]$UpdateIIS; IISSiteToUpdate = $IISSiteToUpdate; UpdateGlobalVPNCertBinding = [bool]$UpdateGlobalVPNCertBinding; GlobalVPNCertBindingIncludeCA = [bool]$GlobalVPNCertBindingIncludeCA; GlobalVPNCertBindingCrlCheck = $GlobalVPNCertBindingCrlCheck; GlobalVPNCertBindingOcspCheck = $GlobalVPNCertBindingOcspCheck; PostPoSHScriptFilename = $PostPoSHScriptFilename; PostPoSHScriptExtraParameters = $PostPoSHScriptExtraParameters; CleanExpiredCertsOnDisk = [bool]$CleanExpiredCertsOnDisk; CleanExpiredCertsOnDiskDays = $CleanExpiredCertsOnDiskDays })
            $settings = [pscustomobject]@{ ManagementURL = $ManagementURL; SvcName = $SvcName; SvcDestination = $SvcDestination; LbName = $LbName; RspName = $RspName; RsaName = $RsaName; CspName = $CspName; CsaName = $CsaName; CsVipBinding = $CsVipBinding; TrafficDomain = $TrafficDomain; SaveADCConfig = [bool]$SaveADCConfig; DisableIPCheck = [bool]$DisableIPCheck; SendMail = [bool]$SendMail; SMTPTo = $SMTPTo; SMTPFrom = $SMTPFrom; SMTPCredential = $SMTPCredential; SMTPServer = $SMTPServer; SMTPPort = $SMTPPort; SMTPUseSSL = [bool]$SMTPUseSSL; LogAsAttachment = [bool]$LogAsAttachment; ExternalAccountBindingKeyId = $ExternalAccountBindingKeyId; ExternalAccountBindingHmacKey = $ExternalAccountBindingHmacKey; ExternalAccountBindingAlgorithm = $ExternalAccountBindingAlgorithm; CertificateChainValidation = $CertificateChainValidation }
        }
        foreach ($name in 'SvcName', 'SvcDestination', 'LbName', 'RspName', 'RsaName', 'CspName', 'CsaName', 'CsVipBinding', 'TrafficDomain', 'SaveADCConfig', 'SendMail', 'SMTPTo', 'SMTPFrom', 'SMTPServer', 'SMTPPort', 'SMTPUseSSL', 'LogAsAttachment', 'CertificateChainValidation') {
            if (-not ($settings.PSObject.Properties.Name -contains $name)) { $settings | Add-Member -NotePropertyName $name -NotePropertyValue (Get-Variable $name -ValueOnly) }
        }
        if (-not ($settings.PSObject.Properties.Name -contains 'SMTPCredential')) { $settings | Add-Member -NotePropertyName SMTPCredential -NotePropertyValue $SMTPCredential }
        if (($settings.SMTPCredential -eq [pscredential]::Empty -or -not $settings.SMTPCredential -or $settings.SMTPCredential -isnot [pscredential]) -and $settings.SMTPCredentialUsername -and $settings.SMTPCredentialPassword) {
            $settings.SMTPCredential = [pscredential]::new($settings.SMTPCredentialUsername, (ConvertFrom-NSACMECertificateLegacySecret -Object $settings.SMTPCredentialPassword))
        }
        if ($LogFile -eq '<DEFAULT>' -or [string]::IsNullOrWhiteSpace($LogFile)) {
            $logExtension = if ($LogType -eq 'jsonl') { 'jsonl' } else { 'log' }
            $LogFile = Join-Path $scriptRoot "Request-NSACMECertificate.$logExtension"
        }
        if (-not $DisableLogging) {
            $script:NSACMECertificateLogFile = $LogFile
            Initialize-NSACMECertificateLog -Path $LogFile -LogType $LogType
        }
        if (-not $DisableLogging -and $AutoUpdate) {
            if ([string]$env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_DONE -eq '1') {
                $message = if ($env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE) { $env:NETSCALERTOOLKIT_WRAPPER_AUTOUPDATE_MESSAGE } else { 'AutoUpdate was completed by the GenLeCertForNS wrapper before module import.' }
                Write-NSACMECertificateLog Info 'AutoUpdate' $message
            } elseif ($script:NSACMECertificateAutoUpdateResult) {
                $updateResult = $script:NSACMECertificateAutoUpdateResult
                $level = if ($updateResult.Updated) { 'Warning' } else { 'Info' }
                Write-NSACMECertificateLog $level 'AutoUpdate' "Status=$($updateResult.Status); Updated=$($updateResult.Updated); CurrentVersion=$($updateResult.CurrentVersion); AvailableVersion=$($updateResult.AvailableVersion); Message=$($updateResult.Message)"
            }
        }
        if (-not $Credential -or $Credential -eq [pscredential]::Empty) {
            if ($Username -and $Password) { $Credential = [pscredential]::new($Username, (ConvertFrom-NSACMECertificateLegacySecret -Object $Password)) }
            else { throw 'No NetScaler credential specified. Use -Credential, -Username/-Password, or config file credentials.' }
        }
        Add-NSACMECertificateSensitiveValue -Value $Credential.UserName -Placeholder '<NetScalerUsername>'
        Add-NSACMECertificateSensitiveValue -Value $Credential -Placeholder '<NetScalerPassword>'
        if ($Password) { Add-NSACMECertificateSensitiveValue -Value (ConvertFrom-NSACMECertificateLegacySecret -Object $Password -AsClearText) -Placeholder '<NetScalerPassword>' }
        if ($settings.SMTPCredential -is [pscredential] -and $settings.SMTPCredential -ne [pscredential]::Empty) {
            Add-NSACMECertificateSensitiveValue -Value $settings.SMTPCredential.UserName -Placeholder '<SMTPUsername>'
            Add-NSACMECertificateSensitiveValue -Value $settings.SMTPCredential -Placeholder '<SMTPPassword>'
        }
        if ($ApiUsername) { Add-NSACMECertificateSensitiveValue -Value $ApiUsername -Placeholder '<NetScalerApiUsername>' }
        if ($ApiPassword) { Add-NSACMECertificateSensitiveValue -Value (ConvertFrom-NSACMECertificateLegacySecret -Object $ApiPassword -AsClearText) -Placeholder '<NetScalerApiPassword>' }
        if (-not $ManagementURL) { $ManagementURL = $settings.ManagementURL }
        $ManagementURL = ([string]$ManagementURL).TrimEnd('/') + '/'
        $settings.ManagementURL = $ManagementURL
        $configChanged = $false
        $config = if ($AutoRun) { $config } else { [pscustomobject]@{ settings = $settings; certrequests = $requests } }

        if ($AutoRun) {
            foreach ($propertyName in 'ADCCredentialPassword', 'SMTPCredentialPassword', 'ExternalAccountBindingHmacKey') {
                if (($settings.PSObject.Properties.Name -contains $propertyName) -and $settings.$propertyName -and ($settings.$propertyName.PSObject.Properties.Name -contains 'IsEncrypted') -and -not $settings.$propertyName.IsEncrypted) {
                    $settings.$propertyName = ConvertTo-NSACMECertificateLegacySecret -Object $settings.$propertyName
                    $configChanged = $true
                }
            }

            foreach ($request in @($requests)) {
                if (($request.PSObject.Properties.Name -contains 'PfxPassword') -and $request.PfxPassword -and ($request.PfxPassword.PSObject.Properties.Name -contains 'IsEncrypted') -and -not $request.PfxPassword.IsEncrypted) {
                    $request.PfxPassword = ConvertTo-NSACMECertificateLegacySecret -Object $request.PfxPassword
                    $configChanged = $true
                }
            }
        } elseif ($ConfigFile) {
            Set-NSACMECertificateNoteProperty -InputObject $settings -Name ADCCredentialUsername -Value $Credential.UserName
            Set-NSACMECertificateNoteProperty -InputObject $settings -Name ADCCredentialPassword -Value (ConvertTo-NSACMECertificateLegacySecret -Object $Credential.Password)
            if ($settings.SMTPCredential -is [pscredential] -and $settings.SMTPCredential -ne [pscredential]::Empty) {
                Set-NSACMECertificateNoteProperty -InputObject $settings -Name SMTPCredentialUsername -Value $settings.SMTPCredential.UserName
                Set-NSACMECertificateNoteProperty -InputObject $settings -Name SMTPCredentialPassword -Value (ConvertTo-NSACMECertificateLegacySecret -Object $settings.SMTPCredential.Password)
            }
            if ($ExternalAccountBindingHmacKey) {
                Set-NSACMECertificateNoteProperty -InputObject $settings -Name ExternalAccountBindingHmacKey -Value (ConvertTo-NSACMECertificateLegacySecret -Object $ExternalAccountBindingHmacKey)
            }
            foreach ($request in @($requests)) {
                if (($request.PSObject.Properties.Name -contains 'PfxPassword') -and $request.PfxPassword) {
                    $request.PfxPassword = ConvertTo-NSACMECertificateLegacySecret -Object $request.PfxPassword
                }
            }
            $configChanged = $true
        }

        if (-not $ExternalAccountBindingKeyId -and ($settings.PSObject.Properties.Name -contains 'ExternalAccountBindingKeyId')) { $ExternalAccountBindingKeyId = $settings.ExternalAccountBindingKeyId }
        if (-not $ExternalAccountBindingHmacKey -and ($settings.PSObject.Properties.Name -contains 'ExternalAccountBindingHmacKey')) { $ExternalAccountBindingHmacKey = $settings.ExternalAccountBindingHmacKey }
        if (-not $PSBoundParameters.ContainsKey('ExternalAccountBindingAlgorithm') -and ($settings.PSObject.Properties.Name -contains 'ExternalAccountBindingAlgorithm') -and $settings.ExternalAccountBindingAlgorithm) { $ExternalAccountBindingAlgorithm = $settings.ExternalAccountBindingAlgorithm }
        $externalAccountBindingHmacClearText = if ($ExternalAccountBindingHmacKey) { ConvertFrom-NSACMECertificateLegacySecret -Object $ExternalAccountBindingHmacKey -AsClearText } else { $null }
        if ($ExternalAccountBindingKeyId) { Add-NSACMECertificateSensitiveValue -Value $ExternalAccountBindingKeyId -Placeholder '<ExternalAccountBindingKeyId>' }
        if ($externalAccountBindingHmacClearText) { Add-NSACMECertificateSensitiveValue -Value $externalAccountBindingHmacClearText -Placeholder '<ExternalAccountBindingHmacKey>' }
        Write-NSACMECertificateLog Debug 'Config' "Loaded $(@($requests).Count) enabled certificate request(s)."

        $providersWithStaging = @('LetsEncrypt', 'Google')
        if (-not $Production -and -not $AcmeDirectoryUrl -and $CertificateProvider -notin $providersWithStaging) {
            $message = "Certificate provider '$CertificateProvider' does not have a configured staging environment. Rerun with -Production, or specify -AcmeDirectoryUrl for a custom ACME directory."
            Write-NSACMECertificateLog Error 'ACME' $message
            throw $message
        }

        Import-NSACMECertificatePoshACME -SkipInstall:$SkipPoshACMEInstall

        # Resolve the Posh-ACME server alias before account or order operations.
        $serverName = if ($AcmeDirectoryUrl) {
            $AcmeDirectoryUrl
        } elseif ($Production) {
            switch ($CertificateProvider) {
                'ZeroSSL' { 'ZEROSSL_PROD' }
                'Google' { 'GOOGLE_PROD' }
                'SSLCom' { 'SSLCOM_RSA' }
                'Actalis' { 'ACTALIS_PROD' }
                default { 'LE_PROD' }
            }
        } else {
            switch ($CertificateProvider) {
                'Google' { 'GOOGLE_STAGE' }
                default { 'LE_STAGE' }
            }
        }
        Write-NSACMECertificateLog Info 'ACME' "Using ACME server '$serverName'. Production=$([bool]$Production)."
        Set-NSACMEPoshACMEServer -DirectoryUrl $serverName
        if ($CleanPoshACMEStorage) {
            $acmeStorage = Join-Path $env:LOCALAPPDATA 'Posh-ACME'
            Remove-Item -LiteralPath $acmeStorage -Recurse -Force -ErrorAction SilentlyContinue
            New-Item -Path $acmeStorage -ItemType Directory -Force | Out-Null
            Set-NSACMEPoshACMEServer -DirectoryUrl $serverName
        }

        Write-NSACMECertificateLog Info 'NetScaler' "Connecting to $ManagementURL as $($Credential.UserName)."
        try {
            $nsSession = Connect-NSNode -ManagementURL $ManagementURL -Credential $Credential -SkipCertificateCheck:$SkipCertificateCheck -HA -PassThru -ErrorAction Stop
            Write-NSACMECertificateLog Debug 'NetScaler' "Connected node state: $($nsSession.ConnectedNodeState); HA=$([bool]$nsSession.IsHA); Version=$($nsSession.Version)."
        } catch {
            if (-not $SkipCertificateCheck -and $_.Exception.Message -match 'trust relationship|certificate|SSL/TLS|remote certificate') {
                Write-NSACMECertificateLog Error 'NetScaler' "TLS trust validation failed for '$ManagementURL'. If this NetScaler uses a self-signed or private CA management certificate, rerun with -SkipCertificateCheck or install the issuing CA certificate in the Windows trust store."
                Write-NSACMECertificateErrorDetail -ErrorRecord $_ -Component 'NetScaler'
                throw "TLS trust validation failed for '$ManagementURL'. Add -SkipCertificateCheck for lab/self-signed NetScaler certificates, or install the issuing CA certificate. Original error: $($_.Exception.Message)"
            }
            Write-NSACMECertificateLog Error 'NetScaler' "Connection failed for '$ManagementURL': $($_.Exception.Message)"
            Write-NSACMECertificateErrorDetail -ErrorRecord $_ -Component 'NetScaler'
            throw
        }
        if ($nsSession.IsHA -and -not $nsSession.IsPrimary) {
            throw "Connected NetScaler HA session is '$($nsSession.ConnectedNodeState)', expected Primary."
        }
        if ($CreateUserPermissions -or $CreateApiUser) {
            $userParams = @{
                Session                   = $nsSession
                PolicyName                  = $NSCPName
                CsVipName                   = $CsVipName
                UseLbVip                    = [bool]$UseLbVip
                LbName                      = $LbName
                SvcName                     = $SvcName
                RspName                     = $RspName
                RsaName                     = $RsaName
                CspName                     = $CspName
                CsaName                     = $CsaName
                EnableVipBefore             = [bool]$EnableVipBefore
                DisableVipAfter             = [bool]$DisableVipAfter
                UseNetScalerDNS             = [bool]$UseNetScalerDNS
                UpdateGlobalVPNCertBinding  = [bool]$UpdateGlobalVPNCertBinding
                Partitions                  = $Partitions
                PruneExistingPolicyBindings = $true
                SaveADCConfig               = [bool]$SaveADCConfig
                PassThru                    = $true
            }
            if ($CreateApiUser) {
                $userParams.ApiUsername = $ApiUsername
                $userParams.ApiPassword = $ApiPassword
            }
            return New-NSACMECertificateUser @userParams
        }
        if ($CleanADC) {
            return Remove-NSACMECertificateHttpValidationConfig -Session $nsSession -Settings $settings -CsVipName $CsVipName -RemoveCertificateFiles
        }
        if ($RemoveTestCertificates) {
            return Remove-NSACMECertificateTestCertificate -Session $nsSession -DeleteFromDevice
        }

        $results = @()
        $allErrors = @()
        $httpValidationConfigInitialized = $false
        $httpValidationCleanupCsVipNames = @()
        try {
        foreach ($request in $requests) {
            $challengeBindings = @()
            $requestVipEnabled = $false
            try {
            # Normalize one request at a time so AutoRun can continue after a later request fails.
            $normalizedRequest = Normalize-NSACMECertificateRequest -Request $request -DefaultCertDir $CertDir
            $domains = $normalizedRequest.Domains
            $effectiveForceCertRenew = [bool]$ForceCertRenew -or [bool]$request.ForceCertRenew
            Write-NSACMECertificateLog Debug 'Request' "CN=$($request.CN); Validation=$($request.ValidationMethod); Domains=$($domains -join ', '); Force=$effectiveForceCertRenew."
            if ($request.ValidationMethod -eq 'http' -and -not $request.CsVipName -and -not $request.UseLbVip) { throw "CsVipName is required for HTTP validation unless UseLbVip is set. CN=$($request.CN)" }
            if ([string]::IsNullOrWhiteSpace([string]$request.CertDir)) { throw "CertDir is required. Provide -CertDir on the command line or set CertDir in the config for CN=$($request.CN)." }
            if (-not (Test-Path -LiteralPath $request.CertDir)) { New-Item -ItemType Directory -Path $request.CertDir -Force | Out-Null }
            $existingAcmeOrder = $null
            $existingAcmeCertificate = $null
            $existingNetScalerCertificate = $null
            try {
                $existingAcmeOrder = Get-PAOrder -MainDomain $request.CN -Refresh -ErrorAction Stop
                if ($existingAcmeOrder) {
                    Write-NSACMECertificateLog Debug 'CheckCertRenewal' "Loaded ACME order metadata for $($request.CN)." -Data ([ordered]@{
                            Status      = $existingAcmeOrder.status
                            CertExpires = $existingAcmeOrder.CertExpires
                            RenewAfter  = $existingAcmeOrder.RenewAfter
                        }) -ConsoleDataKeys @('RenewAfter', 'CertExpires')
                }
            } catch {
                Write-NSACMECertificateLog Debug 'CheckCertRenewal' "No usable ACME order metadata found for $($request.CN): $($_.Exception.Message)"
            }
            try {
                $existingPoshCertificate = Get-PACertificate -MainDomain $request.CN -ErrorAction Stop
                if ($existingPoshCertificate.CertFile -and (Test-Path -LiteralPath $existingPoshCertificate.CertFile)) {
                    $existingAcmeCertificate = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($existingPoshCertificate.CertFile)
                    Write-NSACMECertificateLog Debug 'CheckCertRenewal' "Loaded existing ACME certificate validity for $($request.CN)." -Data ([ordered]@{
                            NotBefore  = $existingAcmeCertificate.NotBefore.ToString('yyyy-MM-dd HH:mm:ss')
                            NotAfter   = $existingAcmeCertificate.NotAfter.ToString('yyyy-MM-dd HH:mm:ss')
                            Thumbprint = $existingAcmeCertificate.Thumbprint
                        }) -ConsoleDataKeys @('NotAfter', 'Thumbprint')
                }
            } catch {
                Write-NSACMECertificateLog Debug 'CheckCertRenewal' "No usable ACME certificate file found for $($request.CN): $($_.Exception.Message)"
            }
            if ($request.CertKeyNameToUpdate) {
                try {
                    $existingNetScalerCertificate = Invoke-NSGetSSLCertKey -Session $nsSession -CertKey $request.CertKeyNameToUpdate -ReturnNullOnNotFound -ErrorAction Stop
                    if ($existingNetScalerCertificate) {
                        Write-NSACMECertificateLog Debug 'CheckCertRenewal' "Loaded NetScaler certkey '$($request.CertKeyNameToUpdate)' for renewal fallback." -Data ([ordered]@{
                                CertKey     = $request.CertKeyNameToUpdate
                                NotBefore   = $existingNetScalerCertificate.notbefore
                                NotAfter    = $existingNetScalerCertificate.notafter
                                CertExpires = $existingNetScalerCertificate.certexpires
                            }) -ConsoleDataKeys @('NotAfter', 'CertExpires')
                    }
                } catch {
                    Write-NSACMECertificateLog Warning 'CheckCertRenewal' "Could not inspect NetScaler certkey '$($request.CertKeyNameToUpdate)' for renewal fallback: $($_.Exception.Message)"
                }
            }
            $renewalDecision = Test-NSACMECertificateRenewalRequired -Request $request -AcmeOrder $existingAcmeOrder -AcmeCertificate $existingAcmeCertificate -NetScalerCertificate $existingNetScalerCertificate -Force:$effectiveForceCertRenew
            if ($renewalDecision.CertExpires) {
                Set-NSACMECertificateNoteProperty -InputObject $request -Name CertExpires -Value $renewalDecision.CertExpires.ToString('yyyy-MM-ddTHH:mm:ssZ', [Globalization.CultureInfo]::InvariantCulture)
                $configChanged = $true
            }
            if ($renewalDecision.RenewAfter) {
                Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewAfter -Value $renewalDecision.RenewAfter.ToString('yyyy-MM-ddTHH:mm:ssZ', [Globalization.CultureInfo]::InvariantCulture)
                $configChanged = $true
            }
            Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewalSource -Value $renewalDecision.Source
            Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewalStrategy -Value $renewalDecision.Strategy
            $acmeServerInfo = Get-PAServer
            $acmeRenewalInfoSupported = [bool]($acmeServerInfo.renewalInfo -and -not $acmeServerInfo.DisableARI)
            Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeProvider -Value $CertificateProvider
            Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeServer -Value $serverName
            Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeRenewalInfoSupported -Value $acmeRenewalInfoSupported
            $configChanged = $true
            $renewalDecisionData = [ordered]@{
                Decision                 = if ($renewalDecision.ShouldRenew) { 'Renew' } else { 'Skip' }
                Source                   = $renewalDecision.Source
                Strategy                 = $renewalDecision.Strategy
                Reason                   = $renewalDecision.Reason
                CertExpires              = if ($renewalDecision.CertExpires) { $renewalDecision.CertExpires.ToString('yyyy-MM-dd HH:mm:ss') } else { $null }
                RenewAfter               = if ($renewalDecision.RenewAfter) { $renewalDecision.RenewAfter.ToString('yyyy-MM-dd HH:mm:ss') } else { $null }
                ExpireDays               = $renewalDecision.ExpireDays
                RenewAfterDays           = $renewalDecision.RenewAfterDays
                AcmeRenewalInfoSupported = $acmeRenewalInfoSupported
            }
            Write-NSACMECertificateLog Debug 'CheckCertRenewal' 'Renewal decision.' -Data $renewalDecisionData -ConsoleDataKeys @('Decision', 'Source', 'RenewAfter', 'CertExpires')
            if (-not $renewalDecision.ShouldRenew) {
                Write-NSACMECertificateLog Info 'CheckCertRenewal' "$($request.CN) skipped. $($renewalDecision.Summary)"
                $results += [pscustomobject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $request.CertKeyNameToUpdate; PfxPath = $null; Thumbprint = $null; NotAfter = $renewalDecision.CertExpires; Status = 'Skipped'; Reason = $renewalDecision.Reason; LogFile = $script:NSACMECertificateLogFile }
                continue
            }
            Write-NSACMECertificateLog Info 'CheckCertRenewal' "$($request.CN) renewal required. $($renewalDecision.Summary)"
            if ($request.ValidationMethod -eq 'http' -and $request.EnableVipBefore) {
                foreach ($csVip in @($request.CsVipName)) { try { Invoke-NSEnableCSVServer -Session $nsSession -Name $csVip | Out-Null } catch { Write-NSACMECertificateLog Warning 'NetScaler' "Could not enable CS VIP $csVip`: $($_.Exception.Message)" } }
                $requestVipEnabled = $true
            }
            $pfxSecret = if ($request.PfxPassword) { ConvertFrom-NSACMECertificateLegacySecret -Object $request.PfxPassword } elseif ($PfxPassword) { ConvertFrom-NSACMECertificateLegacySecret -Object $PfxPassword } else { ConvertTo-SecureString (New-NSACMECertificatePassword) -AsPlainText -Force }
            Add-NSACMECertificateSensitiveValue -Value $pfxSecret -Placeholder '<PfxPassword>'
            Write-NSACMECertificateLog Info 'ACME' "Ensuring ACME account for $($request.EmailAddress)."
            try { $account = Get-PAAccount -List -Refresh -ErrorAction Stop | Where-Object { $_.Contact -contains "mailto:$($request.EmailAddress)" -or $_.Contact -contains $request.EmailAddress } | Select-Object -First 1 } catch { $account = $null }
            $accountKeyLength = if ([string]$request.KeyLength -match '^\d+$') { [int]$request.KeyLength } else { 2048 }
            if (-not $account) {
                Write-NSACMECertificateLog Debug 'ACME' "Creating ACME account for $($request.EmailAddress) with account key length $accountKeyLength."
                $newAccountParams = @{
                    Contact     = $request.EmailAddress
                    KeyLength   = $accountKeyLength
                    AcceptTOS   = $true
                    Force       = $true
                    ErrorAction = 'Stop'
                }
                if ($ExternalAccountBindingKeyId -and $externalAccountBindingHmacClearText) {
                    $newAccountParams.ExtAcctKID = $ExternalAccountBindingKeyId
                    $newAccountParams.ExtAcctHMACKey = $externalAccountBindingHmacClearText
                    $newAccountParams.ExtAcctAlgorithm = $ExternalAccountBindingAlgorithm
                }
                $account = New-PAAccount @newAccountParams
            }
            Set-PAAccount -ID $account.ID -Force | Out-Null
                $cert = $null
                if ($request.ValidationMethod -eq 'dns') {
                    Write-NSACMECertificateLog Debug 'ACME' "Requesting DNS order for $($request.CN) with plugin '$DNSPlugin'."
                    $acmeOptions = @{
                        DNSPlugin              = $DNSPlugin
                        DNSParams              = $DNSParams
                        DNSWaitTime            = $DNSWaitTime
                        UseModernPfxEncryption = [bool]$UseModernPfxEncryption
                        PreferredChain         = $PreferredChain
                        Profile                = $Profile
                        DnsAlias               = $DnsAlias
                        ValidationTimeout      = $ValidationTimeout
                        LifetimeDays           = $LifetimeDays
                        AlwaysNewKey           = [bool]$AlwaysNewKey
                    }
                    if ($request.AlternateDNSValidationDomain) {
                        $acmeOptions.DnsAlias = @($domains | ForEach-Object { $request.AlternateDNSValidationDomain })
                    }
                    $cert = Request-NSACMECertificateDnsOrder -Request $request -Domains $domains -PfxSecret $pfxSecret -AcmeOptions $acmeOptions -Session $nsSession -Account $account -Force:$effectiveForceCertRenew
                    if (-not $cert) { $cert = Get-PACertificate -MainDomain $request.CN -ErrorAction Stop }
                } else {
                    Write-NSACMECertificateLog Info 'ACME' "Creating ACME HTTP order for $($domains -join ', ')."
                    Write-NSACMECertificateLog Debug 'ACME' "HTTP validation uses CS VIP(s): $(@($request.CsVipName) -join ', '); UseLbVip=$([bool]$request.UseLbVip)."
                    $orderParams = @{ Domain = $domains; AlwaysNewKey = ([bool]$AlwaysNewKey -or $effectiveForceCertRenew); KeyLength = [string]$request.KeyLength; Force = $true; FriendlyName = $request.FriendlyName; PfxPassSecure = $pfxSecret }
                    if ($UseModernPfxEncryption) { $orderParams.UseModernPfxEncryption = $true }
                    if ($PreferredChain) { $orderParams.PreferredChain = $PreferredChain }
                    if ($Profile) { $orderParams.Profile = $Profile }
                    if ($LifetimeDays) { $orderParams.LifetimeDays = $LifetimeDays }
                    if ($ValidationTimeout) { $orderParams.ValidationTimeout = $ValidationTimeout }
                    if ($effectiveForceCertRenew) {
                        Write-NSACMECertificateLog Debug 'ACME' "Removing existing ACME order for $($request.CN) before creating a forced order."
                        try { Remove-PAOrder -MainDomain $request.CN -Force -ErrorAction SilentlyContinue | Out-Null } catch {}
                    }
                    $order = New-PAOrder @orderParams -ErrorAction Stop
                    Initialize-NSACMECertificateHttpValidationConfig -Session $nsSession -Settings $settings -Request $request
                    if (-not $request.UseLbVip) {
                        $httpValidationConfigInitialized = $true
                        $httpValidationCleanupCsVipNames = @($httpValidationCleanupCsVipNames + @($request.CsVipName) | Where-Object { $_ } | Select-Object -Unique)
                    }
                    $challengeBindings = Publish-NSACMECertificateHttpChallenge -Session $nsSession -Settings $settings -Order $order -Account $account
                    Wait-NSACMECertificateAuthorization -MainDomain $request.CN -TimeoutSeconds $ValidationTimeout | Out-Null
                    Write-NSACMECertificateLog Info 'ACME' "Finalizing ACME order for $($request.CN)."
                    $null = Submit-OrderFinalize -Order (Get-PAOrder -MainDomain $request.CN -Refresh) -ErrorAction Stop
                    Wait-NSACMECertificateOrderFinal -MainDomain $request.CN -TimeoutSeconds $ValidationTimeout | Out-Null
                    Write-NSACMECertificateLog Info 'ACME' "Downloading ACME certificate artifacts for $($request.CN)."
                    $null = Complete-PAOrder -Order (Get-PAOrder -MainDomain $request.CN -Refresh) -ErrorAction Stop
                    $cert = Get-PACertificate -MainDomain $request.CN -ErrorAction Stop
                }
                $cert = Copy-NSACMECertificateArtifactsToCertDir -Certificate $cert -CertDir $request.CertDir -CommonName $request.CN
                $deploy = Install-NSACMECertificateNetScalerCertificate -Session $nsSession -Settings $settings -Request $request -Certificate $cert -PfxSecret $pfxSecret -CertificateChainValidation $settings.CertificateChainValidation -IsProduction:$Production
                Write-NSACMECertificateLog Debug 'Deploy' "Installed NetScaler certkey '$($deploy.CertKeyName)' from PFX '$($deploy.PfxFileName)'."
                $x509 = if ($cert.CertFile -and (Test-Path $cert.CertFile)) { [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($cert.CertFile) } else { $null }
                try {
                    # Store Posh-ACME renewal metadata back into generated config files.
                    $completedOrder = Get-PAOrder -MainDomain $request.CN -Refresh -ErrorAction Stop
                    if ($completedOrder.CertExpires) {
                        Set-NSACMECertificateNoteProperty -InputObject $request -Name CertExpires -Value $completedOrder.CertExpires
                        $configChanged = $true
                    }
                    if ($completedOrder.RenewAfter) {
                        Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewAfter -Value $completedOrder.RenewAfter
                        $configChanged = $true
                    }
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewalSource -Value 'ACME order'
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewalStrategy -Value 'ACME/Posh-ACME renewal metadata.'
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeProvider -Value $CertificateProvider
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeServer -Value $serverName
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeRenewalInfoSupported -Value ([bool]((Get-PAServer).renewalInfo -and -not (Get-PAServer).DisableARI))
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name CurrentCertIsProduction -Value ([bool]$Production)
                    $configChanged = $true
                } catch {
                    Write-NSACMECertificateLog Debug 'CheckCertRenewal' "Could not update renewal metadata for $($request.CN): $($_.Exception.Message)"
                }
                if ($request.UpdateGlobalVPNCertBinding) {
                    Update-NSACMECertificateGlobalVpnBinding -Session $nsSession -OldCertKeyName $request.CertKeyNameToUpdate -NewCertKeyName $deploy.CertKeyName -IncludeCA:$request.GlobalVPNCertBindingIncludeCA -CaCertKeyName @($deploy.ChainCertKeyName)[0] -CrlCheck $request.GlobalVPNCertBindingCrlCheck -OcspCheck $request.GlobalVPNCertBindingOcspCheck | Out-Null
                }
                if ($request.UpdateIIS) {
                    try { Update-NSACMECertificateIisBinding -PfxPath $deploy.PfxPath -PfxSecret $pfxSecret -SiteName $request.IISSiteToUpdate | Out-Null }
                    catch { Write-NSACMECertificateLog Warning 'IIS' "UpdateIIS failed: $($_.Exception.Message)" }
                }
                if ($request.PostPoSHScriptFilename) {
                    Request-NSACMECertificatePostScript -ScriptPath $request.PostPoSHScriptFilename -ScriptRoot $scriptRoot -Thumbprint $(if ($x509) { $x509.Thumbprint } else { $cert.Thumbprint }) -PfxPath $deploy.PfxPath -PfxPassword (ConvertFrom-NSACMECertificateLegacySecret -Object $pfxSecret -AsClearText) -ExtraParameters $request.PostPoSHScriptExtraParameters | Out-Null
                }
                if ($request.CleanExpiredCertsOnDisk) {
                    Remove-NSACMECertificateExpiredDiskCertificate -CertDir $request.CertDir -Days $request.CleanExpiredCertsOnDiskDays -CN $request.CN | Out-Null
                }
                if ($RemoveUploadedPfx) {
                    try { Invoke-NSDeleteSystemFile -Session $nsSession -FileName $deploy.PfxFileName -FileLocation '/nsconfig/ssl/' -IgnoreNotFound -Confirm:$false | Out-Null }
                    catch { Write-NSACMECertificateLog Debug 'Deploy' "Uploaded PFX cleanup skipped: $($_.Exception.Message)" }
                }
                if ($request.RemovePrevious -and $Production -and $request.CertKeyNameToUpdate) {
                    try {
                        $removePreviousResult = Remove-NSACMECertificatePreviousCertKey `
                            -Session $nsSession `
                            -OldCertKeyName $request.CertKeyNameToUpdate `
                            -NewCertKeyName $deploy.CertKeyName `
                            -NewChainCertKeyName @($deploy.ChainCertKeyName) `
                            -DeleteFromDevice
                        $removePreviousMessage = if ($removePreviousResult.Reason) {
                            "RemovePrevious: $($removePreviousResult.Status). $($removePreviousResult.Reason)"
                        } else {
                            "RemovePrevious: $($removePreviousResult.Status)."
                        }
                        Write-NSACMECertificateLog Info 'Deploy' $removePreviousMessage
                    } catch {
                        Write-NSACMECertificateLog Warning 'Deploy' "RemovePrevious failed for '$($request.CertKeyNameToUpdate)': $($_.Exception.Message)"
                    }
                }
                $result = [pscustomobject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $deploy.CertKeyName; PfxPath = $deploy.PfxPath; Thumbprint = if ($x509) { $x509.Thumbprint } else { $cert.Thumbprint }; NotAfter = if ($x509) { $x509.NotAfter } else { $null }; Status = 'Success'; LogFile = $script:NSACMECertificateLogFile }
                $results += $result
                Write-NSACMECertificateLog Info 'Result' "Finished certificate request for $($request.CN); NetScaler certkey: $($deploy.CertKeyName)."
            } catch {
                Write-NSACMECertificateLog Error 'Result' "Failed certificate request for $($request.CN): $($_.Exception.Message)"
                Write-NSACMECertificateErrorDetail -ErrorRecord $_ -Component 'Result'
                $allErrors += $_
                $results += [pscustomobject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $request.CertKeyNameToUpdate; PfxPath = $null; Thumbprint = $null; NotAfter = $null; Status = 'Failed'; Reason = $_.Exception.Message; LogFile = $script:NSACMECertificateLogFile }
                if ($StopOnError) { throw }
            } finally {
                # Per-order challenge bindings are short-lived; reusable HTTP objects are cleaned after all requests.
                Remove-NSACMECertificateHttpChallengeBinding -Session $nsSession -ChallengeBindings $challengeBindings -Settings $settings
                if ($requestVipEnabled -and $request.ValidationMethod -eq 'http' -and $request.DisableVipAfter) { foreach ($csVip in @($request.CsVipName)) { try { Invoke-NSDisableCSVServer -Session $nsSession -Name $csVip | Out-Null } catch { Write-NSACMECertificateLog Warning 'NetScaler' "Could not disable CS VIP $csVip`: $($_.Exception.Message)" } } }
            }
        }
        } finally {
            if ($httpValidationConfigInitialized) {
                Write-NSACMECertificateLog Info 'Cleanup' 'Removing reusable NetScaler HTTP validation objects.'
                Remove-NSACMECertificateHttpValidationConfig -Session $nsSession -Settings $settings -CsVipName $httpValidationCleanupCsVipNames | Out-Null
            }
        }
        if ($settings.SendMail) {
            $subjectStatus = if ($allErrors.Count -gt 0) { 'failed' } else { 'completed' }
            $body = ($results | Format-List | Out-String)
            Send-NSACMECertificateMail -Settings $settings -Subject "Request-NSACMECertificate $subjectStatus" -Body $body -LogFile $script:NSACMECertificateLogFile
        }
        if ($ConfigFile -and $configChanged) {
            try {
                $configAction = if ($AutoRun) { 'updated renewal metadata' } else { 'request configuration' }
                Write-NSACMECertificateLog Info 'ConfigFile' "Saving $configAction to '$ConfigFile'."
                if ($config.settings.PSObject.Properties.Name -contains 'SMTPCredential') {
                    $config.settings.PSObject.Properties.Remove('SMTPCredential')
                }
                $configDirectory = Split-Path -Path $ConfigFile -Parent
                if (-not [string]::IsNullOrWhiteSpace($configDirectory) -and -not (Test-Path -LiteralPath $configDirectory)) {
                    New-Item -ItemType Directory -Path $configDirectory -Force | Out-Null
                }
                $config | ConvertTo-Json -Depth 20 | Out-File -LiteralPath $ConfigFile -Encoding Unicode -Force
            } catch {
                Write-NSACMECertificateLog Warning 'ConfigFile' "Could not save config file '$ConfigFile': $($_.Exception.Message)"
            }
        }
        if ($NoConsoleOutput) {
            $results
        } else {
            Write-NSACMECertificateResultSummary -Results $results
        }
    }
}

# SIG # Begin signature block
# MIInigYJKoZIhvcNAQcCoIInezCCJ3cCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAGJkdP16OmSzIy
# yt9NeRatIV6M5hpIMHQopq70/K2Pw6CCIR0wggZFMIIELaADAgECAhAIMk+dt9qR
# b2Pk8qM8Xl1RMA0GCSqGSIb3DQEBCwUAMFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQK
# ExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0NlcnR1bSBDb2Rl
# IFNpZ25pbmcgMjAyMSBDQTAeFw0yNDA0MDQxNDA0MjRaFw0yNzA0MDQxNDA0MjNa
# MGsxCzAJBgNVBAYTAk5MMRIwEAYDVQQHDAlTY2hpam5kZWwxIzAhBgNVBAoMGkpv
# aG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MSMwIQYDVQQDDBpKb2huIEJpbGxla2Vu
# cyBDb25zdWx0YW5jeTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAMsl
# ntDbSQwHZXwFhmibivbnd0Qfn6sqe/6fos3pKzKxEsR907RkDMet2x6RRg3eJkiI
# r3TFPwqBooyXXgK3zxxpyhGOcuIqyM9J28DVf4kUyZHsjGO/8HFjrr3K1hABNUsz
# P0o7H3o6J31eqV1UmCXYhQlNoW9FOmRC1amlquBmh7w4EKYEytqdmdOBavAD5Xq4
# vLPxNP6kyA+B2YTtk/xM27TghtbwFGKnu9Vwnm7dFcpLxans4ONt2OxDQOMA5Nwg
# cUv/YTpjhq9qoz6ivG55NRJGNvUXsM3w2o7dR6Xh4MuEGrTSrOWGg2A5EcLH1XqQ
# tkF5cZnAPM8W/9HUp8ggornWnFVQ9/6Mga+ermy5wy5XrmQpN+x3u6tit7xlHk1H
# c+4XY4a4ie3BPXG2PhJhmZAn4ebNSBwNHh8z7WTT9X9OFERepGSytZVeEP7hgypt
# SLcuhpwWeR4QdBb7dV++4p3PsAUQVHFpwkSbrRTv4EiJ0Lcz9P1HPGFoHiFAQQID
# AQABo4IBeDCCAXQwDAYDVR0TAQH/BAIwADA9BgNVHR8ENjA0MDKgMKAuhixodHRw
# Oi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNybDBzBggrBgEF
# BQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0
# dW0uY29tMDUGCCsGAQUFBzAChilodHRwOi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwv
# Y2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAWgBTddF1MANt7n6B0yrFu9zzAMsBwzTAd
# BgNVHQ4EFgQUO6KtBpOBgmrlANVAnyiQC6W6lJwwSwYDVR0gBEQwQjAIBgZngQwB
# BAEwNgYLKoRoAYb2dwIFAQQwJzAlBggrBgEFBQcCARYZaHR0cHM6Ly93d3cuY2Vy
# dHVtLnBsL0NQUzATBgNVHSUEDDAKBggrBgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4Aw
# DQYJKoZIhvcNAQELBQADggIBAEQsN8wgPMdWVkwHPPTN+jKpdns5AKVFjcn00psf
# 2NGVVgWWNQBIQc9lEuTBWb54IK6Ga3hxQRZfnPNo5HGl73YLmFgdFQrFzZ1lnaMd
# Icyh8LTWv6+XNWfoyCM9wCp4zMIDPOs8LKSMQqA/wRgqiACWnOS4a6fyd5GUIAm4
# CuaptpFYr90l4Dn/wAdXOdY32UhgzmSuxpUbhD8gVJUaBNVmQaRqeU8y49MxiVrU
# KJXde1BCrtR9awXbqembc7Nqvmi60tYKlD27hlpKtj6eGPjkht0hHEsgzU0Fxw7Z
# JghYG2wXfpF2ziN893ak9Mi/1dmCNmorGOnybKYfT6ff6YTCDDNkod4egcMZdOSv
# +/Qv+HAeIgEvrxE9QsGlzTwbRtbm6gwYYcVBs/SsVUdBn/TSB35MMxRhHE5iC3aU
# TkDbceo/XP3uFhVL4g2JZHpFfCSu2TQrrzRn2sn07jfMvzeHArCOJgBW1gPqR3Wr
# J4hUxL06Rbg1gs9tU5HGGz9KNQMfQFQ70Wz7UIhezGcFcRfkIfSkMmQYYpsc7rfz
# j+z0ThfDVzzJr2dMOFsMlfj1T6l22GBq9XQx0A4lcc5Fl9pRxbOuHHWFqIBD/BCE
# hwniOCySzqENd2N+oz8znKooSISStnkNaYXt6xblJF2dx9Dn89FK7d1IquNxOwt0
# tI5dMIIGgjCCBGqgAwIBAgIQNsKwvXwbOuejs902y8l1aDANBgkqhkiG9w0BAQwF
# ADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
# C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAs
# BgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcN
# MjEwMzIyMDAwMDAwWhcNMzgwMTE4MjM1OTU5WjBXMQswCQYDVQQGEwJHQjEYMBYG
# A1UEChMPU2VjdGlnbyBMaW1pdGVkMS4wLAYDVQQDEyVTZWN0aWdvIFB1YmxpYyBU
# aW1lIFN0YW1waW5nIFJvb3QgUjQ2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAiJ3YuUVnnR3d6LkmgZpUVMB8SQWbzFoVD9mUEES0QUCBdxSZqdTkdizI
# CFNeINCSJS+lV1ipnW5ihkQyC0cRLWXUJzodqpnMRs46npiJPHrfLBOifjfhpdXJ
# 2aHHsPHggGsCi7uE0awqKggE/LkYw3sqaBia67h/3awoqNvGqiFRJ+OTWYmUCO2G
# AXsePHi+/JUNAax3kpqstbl3vcTdOGhtKShvZIvjwulRH87rbukNyHGWX5tNK/WA
# BKf+Gnoi4cmisS7oSimgHUI0Wn/4elNd40BFdSZ1EwpuddZ+Wr7+Dfo0lcHflm/F
# DDrOJ3rWqauUP8hsokDoI7D/yUVI9DAE/WK3Jl3C4LKwIpn1mNzMyptRwsXKrop0
# 6m7NUNHdlTDEMovXAIDGAvYynPt5lutv8lZeI5w3MOlCybAZDpK3Dy1MKo+6aEtE
# 9vtiTMzz/o2dYfdP0KWZwZIXbYsTIlg1YIetCpi5s14qiXOpRsKqFKqav9R1R5vj
# 3NgevsAsvxsAnI8Oa5s2oy25qhsoBIGo/zi6GpxFj+mOdh35Xn91y72J4RGOJEoq
# zEIbW3q0b2iPuWLA911cRxgY5SJYubvjay3nSMbBPPFsyl6mY4/WYucmyS9lo3l7
# jk27MAe145GWxK4O3m3gEFEIkv7kRmefDR7Oe2T1HxAnICQvr9sCAwEAAaOCARYw
# ggESMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBT2
# d2rdP/0BE/8WoWyCAi/QCj0UJTAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUw
# AwEB/zATBgNVHSUEDDAKBggrBgEFBQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYD
# VR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVz
# dFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMDUGCCsGAQUFBwEBBCkwJzAl
# BggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0B
# AQwFAAOCAgEADr5lQe1oRLjlocXUEYfktzsljOt+2sgXke3Y8UPEooU5y39rAARa
# AdAxUeiX1ktLJ3+lgxtoLQhn5cFb3GF2SSZRX8ptQ6IvuD3wz/LNHKpQ5nX8hjsD
# LRhsyeIiJsms9yAWnvdYOdEMq1W61KE9JlBkB20XBee6JaXx4UBErc+YuoSb1SxV
# f7nkNtUjPfcxuFtrQdRMRi/fInV/AobE8Gw/8yBMQKKaHt5eia8ybT8Y/Ffa6HAJ
# yz9gvEOcF1VWXG8OMeM7Vy7Bs6mSIkYeYtddU1ux1dQLbEGur18ut97wgGwDiGin
# CwKPyFO7ApcmVJOtlw9FVJxw/mL1TbyBns4zOgkaXFnnfzg4qbSvnrwyj1NiurMp
# 4pmAWjR+Pb/SIduPnmFzbSN/G8reZCL4fvGlvPFk4Uab/JVCSmj59+/mB2Gn6G/U
# YOy8k60mKcmaAZsEVkhOFuoj4we8CYyaR9vd9PGZKSinaZIkvVjbH/3nlLb0a7SB
# IkiRzfPfS9T+JesylbHa1LtRV9U/7m0q7Ma2CQ/t392ioOssXW7oKLdOmMBl14su
# VFBmbzrt5V5cQPnwtd3UOTpS9oCG+ZZheiIvPgkDmA8FzPsnfXW5qHELB43ET7HH
# FHeRPRYrMBKjkb8/IN7Po0d0hQoF4TeMM+zYAJzoKQnVKOLg8pZVPT8wgganMIIE
# j6ADAgECAhEAkKwIciD9xafEa1zHDfc9BjANBgkqhkiG9w0BAQwFADBXMQswCQYD
# VQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMS4wLAYDVQQDEyVTZWN0
# aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIFJvb3QgUjQ2MB4XDTI2MDMyNTAwMDAw
# MFoXDTQxMDMyNDIzNTk1OVowVTELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3Rp
# Z28gTGltaXRlZDEsMCoGA1UEAxMjU2VjdGlnbyBQdWJsaWMgVGltZSBTdGFtcGlu
# ZyBDQSBSNDEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCu5EqiAa2C
# HGL5Zi1bmgPM8NUXwYZJ+BtQqHps43GLTC+sjVLypsBh+8uv+TLkgtVGD//vSmA0
# qrzELf9YRCh2MTAA/aGaQZKGg0BRCmziR3pbCnvgWjtGXBDUyn3j3K2lZAO8KxgF
# tlxwOYEAkL+CCqK4v9zzTl8ZwzDpPMiDIFa5THk8an1ieF5I09cXNrPQw+1ER1li
# ThaG0z6FrOpqwxZWmPRZQBw2E32878UB1bL0Zp91vuWZgsMpNNiPCoBj0/1F+LE8
# +NRokfqacFI0F2tftrRB2W7HQClLR9zjxFbWb5be2rceIfNyHUUfKGIvMI2NzoxS
# lxXnFqUG887D8W1Cj8DFok688JKxWvHR/9aQykSbd+9Vutj36ij2sgq/125wTpUZ
# /AgC0ph50bRs7gFrUyaXE9wSsOqMvCCC+sEm7vd/BemSG0TSHNXSmyCba+FCzeke
# WX03TRIcF3Laqd0Rw24OH7jpei4zaGhcI7nfdhBA4c8RScxNY6jeHLHHmSMMTk9W
# qn7H4dLhUBP5YEwbgbN4uv1i9ltTnHli8t1xHV0StX9BFgrnmunTX19kUXY1H5OR
# JbRZyZDdvm1oZyteDj0SnMozr+YSmdIleDUTXdfoY7b2taz8s2+QbOxLxcahEIYG
# Wzqu6h955tKwcANHcZ4gTmAhT3btuOiQsQIDAQABo4IBbjCCAWowHwYDVR0jBBgw
# FoAU9ndq3T/9ARP/FqFsggIv0Ao9FCUwHQYDVR0OBBYEFDp0pQxnxkJQwv21/Me7
# KTSC9Hq5MA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMCMGA1UdIAQcMBowCAYGZ4EMAQQCMA4GDCsGAQQBsjEB
# AgEDCDBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3JsLnNlY3RpZ28uY29tL1Nl
# Y3RpZ29QdWJsaWNUaW1lU3RhbXBpbmdSb290UjQ2LmNybDB8BggrBgEFBQcBAQRw
# MG4wRwYIKwYBBQUHMAKGO2h0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1
# YmxpY1RpbWVTdGFtcGluZ1Jvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8v
# b2NzcC5zZWN0aWdvLmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAMt5SR2bxngNm+N8o
# c6Gq76Gx1c235fkX7jw8Ho9MAkJGADerHE7dhsBXttqmzgr/7ZZahZSykGRPhPY1
# crj028kB8KzO0dKC2qQBAwtfgqMLKkkX/6bYq2uT33eD6ByAp2/XKD0LcmZh0kKe
# cvSBr6ln9ajX6u1dnx2fA7xEKy1M3qBhfQSUWLtjs2nFt0ELVLptzTlX9ID0cL+i
# OPfdboZ3CelT+JXKVKR2Sge0d4YiFAtPZkfSo8z1Z1x7y/Z9mwMIlBAnyuWXs4Ys
# NuxdrYIt/QxE31PDOJ9DesS4Bc7H9OTORlEV/AvfiF/VepKZpira1MzLYuCw+uoL
# Zn/pkpvd+CvNTS+mEHjBJNa6WK1j8qXFu+jIq+sG9QILHiyB6p/xpHrkJu8zkw39
# 3+VqF9eKlTY2VjRxdycZLrVemZ4Yp3wi33b+W58CllH3HqjmowlZ7SOrgmx8YwYO
# kgrHsXOQHyBp6O4FRb8In0+FzjT7ElGie9V7CfhL3IlVFZ4zjuKsZtH1iU3fGu4z
# /JnOGT6sCb0BbTqe/uhvpFCQBdH5xPGIA/LrbQUXjU2tWJgHhTIqnN/HvHyOHi5t
# M4zP3nhgh2rJ6Kqq2xsHBeNYs/R18xQ8DeIg+c90Eoaeh0YlN1KU8AyYol3K9M+q
# Y5ez8syd/7ZlrRnoVewgH3P1pcswgga5MIIEoaADAgECAhEAmaOACiZVO2Wr3G6E
# prPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAgBgNVBAoTGVVu
# aXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1bSBDZXJ0aWZp
# Y2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0ZWQgTmV0d29y
# ayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIxOFowVjELMAkGA1UE
# BhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIGA1UE
# AxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjANBgkqhkiG9w0BAQEF
# AAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5cTbq96y34vuTmflN4
# mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7VS5+djSoMcbvIKck
# 6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1PH9ud0IF+njvMk2xq
# bNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOouu9Tj1yHIohzuC8KN
# qfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv8aGUsRdaCtVD2bSl
# bfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtMLK+Wo837Q4QOZgYq
# VWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9lDV2nT8mFSkcSkAE
# xzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/JHuurfTI5XDYO962
# WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkKbWpQ5boufUnq1UiY
# PIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADaCi2JSplKShBSND36
# E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAWd18Jx5n858JSqPEC
# AwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFN10XUwA23uf
# oHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4HKbROg79MA4G
# A1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAwBgNVHR8EKTAnMCWg
# I6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwGCCsGAQUFBwEB
# BGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2VydHVtLmNvbTAy
# BggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBsL2N0bmNhMi5j
# ZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0dHA6Ly93d3cu
# Y2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhYD+WPUCiaU58Q7EP8
# 9DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUStJl490L94C9LGF3v
# jzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChDUyuQy6rGDxLUUAsO
# 0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiRsWrhWM2f8pXdd3x2
# mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7bWRLDm0CdY9rNLqyA
# 3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mATwZWwSD+B7eMcZNhp
# n8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3/bFAEloMU+vUBfSo
# uCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESYkOh1/w1tVxTpV2Na
# 3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR+x+zPF/2DaGgK2W1
# eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C+xN4YaNjt2ywzOr+
# tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qwt4HOUBCrW602NCmv
# O1nm+/80nLy5r0AZvCQxaQ4wggbiMIIEyqADAgECAhEA507yVbBQT/rbpt/3/Iuj
# FTANBgkqhkiG9w0BAQwFADBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGln
# byBMaW1pdGVkMSwwKgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5n
# IENBIFI0MTAeFw0yNjAzMjUwMDAwMDBaFw0zNzA2MjQyMzU5NTlaMHIxCzAJBgNV
# BAYTAkdCMRcwFQYDVQQIEw5HcmVhdGVyIExvbmRvbjEYMBYGA1UEChMPU2VjdGln
# byBMaW1pdGVkMTAwLgYDVQQDEydTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5n
# IFNpZ25lciBSMzcwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCy/8Nt
# S9xQ2UUtBRF32bj7VK3n4m50Uqjk/zTciSziYV40H1LKah0/oEklYG42E4VCP3Dv
# sBUB6DmpCkDZ0jCnZBPIEevaH15ZJOQwFWP2ZXr5YjlJpb68Nlbs+ElNvKx32/1Y
# Hde3qqUSLybjulxPLz6T85+HOIqK7M1Bep8LspyhEP/q6nw5kGxTSrGvufmeH+JF
# 8CnVBcVMFA40FlIYh0cDJVFhhfTfdWgLy/vWuLMQoKkf3s/FvByf16r0rtbyHm/i
# emwxSioJL9zyZDDKUNAbHXl0dhXo2VxUV2NcPXWXuoKsjL+6cfk6Vm2DHnxAlFdF
# saBDIF1JOkSnC6PeLlBznZn2buF3vIIYJcq6N/zeFRCk4/HXDz7zgRsRRMdUB+rh
# yk5FoZaBjw0nLq3GZ3fClLUx5es5pUAxzNODMBn7JkFYip2BAGBPER5eV0ROhk6t
# GTG+fUiMiV+vgjg1YnP5FvnYWyEtWeQD/B2hp3vz0RvtdkM0p3igyadzrfpOBq5p
# pVk/YsuhTQkP99ivneHAGfi5e7lmxJ+meoBPrRLuzMmb81rzzbESjJHMsn5RVtc6
# Ucs7rcMqQC13PUIO7BbGBETV2ufCmV6lPTp3P7XJOvmnUCRTPbVvMTpxP/z+SOHg
# 4/OCBhiqs4FA9+4oQvlkk9w32NGASli9GWrm5wIDAQABo4IBjjCCAYowHwYDVR0j
# BBgwFoAUOnSlDGfGQlDC/bX8x7spNIL0erkwHQYDVR0OBBYEFGEQ6XoSr1HEhdTy
# z6R0D1DNIK/4MA4GA1UdDwEB/wQEAwIGwDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB
# /wQMMAoGCCsGAQUFBwMIMEoGA1UdIARDMEEwCAYGZ4EMAQQCMDUGDCsGAQQBsjEB
# AgEDCDAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzBKBgNV
# HR8EQzBBMD+gPaA7hjlodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
# aWNUaW1lU3RhbXBpbmdDQVI0MS5jcmwwegYIKwYBBQUHAQEEbjBsMEUGCCsGAQUF
# BzAChjlodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNUaW1lU3Rh
# bXBpbmdDQVI0MS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28u
# Y29tMA0GCSqGSIb3DQEBDAUAA4ICAQAD6j2N0azN+hl6k6bKB5/U6VuSOs93ZBb3
# Pczy9VtBIKu4947Z5GwL0aFngIxl+GSuLFrJgPruBCRvKJEJsm7kv+LQ1COVCEG9
# tZ+IRtr4ocUoa53lgdFaENlS0N4wgkZkbQEPv+x+1lSjYh+T4JeL9mUznT7Erc6S
# p5dWLka5sMP/m3GZi6oJPdPcsCKWagH7m2H2xDGIyHJC5PdH9phvi/KmhkktiSVT
# NNqVeV5bWdX2zhRE6UTfz0IcMoCL996lFIydXxOCE4MNDHDM0as4lnTiT/KHMccO
# 6l8c9TnUVgmpci9ar1IABZ2U1XUkYjGGSn9MC3EHDP9V39VuBVvZ33/BEV/EWSRr
# f07T7jFplKX+gQr/UOqPGMlE7ZJ72UaUkNJy7bVl3bcLKzdpjIHzLkf/4MVa1V7w
# 8wqCv5W4gOnRGTlud5UMARbRM8BPxR/CXYXoMmIOD8pmTk2axgRL4LG8XtuchISd
# CHRmtacAmLGq5XSYSVTHTXADlO48iDKh3HM2r98LSF6f0sG12d8V9Jn7C3wDUieO
# xuKj4MdWrW+hiJU2kF87v6eH00HgCFFc2V0+CvfOCMn7juzS41jLaINcBlKWQ/fK
# b/uDLfWOW73z1I2lFY7Xj8tQ1XYtK5eREjWItM8jpl1cbQOc88btR+0XS2TmboE/
# 141+va2PWzGCBcMwggW/AgEBMGowVjELMAkGA1UEBhMCUEwxITAfBgNVBAoTGEFz
# c2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIGA1UEAxMbQ2VydHVtIENvZGUgU2ln
# bmluZyAyMDIxIENBAhAIMk+dt9qRb2Pk8qM8Xl1RMA0GCWCGSAFlAwQCAQUAoIGE
# MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQB
# gjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkE
# MSIEIFatDE8f5h0Xa/3kAO0K2x/xHhhtj7mx7P5EAQxmqJyuMA0GCSqGSIb3DQEB
# AQUABIIBgKdgP9s25a1CMZSc7I9oUDueJbbAXufypnMwljjlTNNgKZzthfmPjZkw
# GtQjIxpavy9q8jQwzKWRZiUrHrOxcmfmsbcjUvL8CqmJKxwe23E2+YnIokmMJXXb
# BVOJThAGkFnFQNd2ePKsdM40UleGywn5Ge0DzTaf6TVotRD+3ycK4SlOz/xZjtst
# v3IjRJXN/siWU/VPAlO4UnPL0Z8Tb7ADPpjzrPRhF4870IuOvFEM/klv3mGpNIJn
# MmbybEp06kHMXzWRu7mfZW5cidl+xOfvhkFRZzQLTJRKFF3yvVYc/Aij0K1yfPiu
# fhq6sK8AHKkp5zevfc5dn5gVQldcVgwJpvUo7HVct6p+UXOq2OBaH+kjcxBx74iZ
# ZkI2HuGuYzTQeexj4hscMva4gQSXJy/hVOi49ynK4PavVjHFB1EIpezmXgkwrgTq
# IWZ4IVENX1n7cvHedELSu4qVLn6QNO0Vsi1X7mzgCqFQYjcThehJM6hwLP27JrXZ
# +HFoJ/S6UaGCAyMwggMfBgkqhkiG9w0BCQYxggMQMIIDDAIBATBqMFUxCzAJBgNV
# BAYTAkdCMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxLDAqBgNVBAMTI1NlY3Rp
# Z28gUHVibGljIFRpbWUgU3RhbXBpbmcgQ0EgUjQxAhEA507yVbBQT/rbpt/3/Iuj
# FTANBglghkgBZQMEAgIFAKB5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
# KoZIhvcNAQkFMQ8XDTI2MDcyMDEyMjUwM1owPwYJKoZIhvcNAQkEMTIEMCLRV9z6
# r3cOOb0VyQDQE3+BuLn79B/bZUS0QIMG91nw+kjHKv4B7PR/6tkt6ux1mTANBgkq
# hkiG9w0BAQEFAASCAgCObSIiy7Q5guxUNuKcPMqsOGBUJWV/3HxH4lMhJOxYhVDO
# 8XQSOgT4j9AabIXDkJ87UwsD2TBu4zCIzmbAgTTpLaWMV2Yw8GWMlFR7WCZVYYTH
# Zmr+JSbJ8FHUU/XoCb6LTsRY1eAza2Eg2mK6VGNn8GDURfU7FR1PpuYB00rYRGL+
# ijpbCfchCshMPe9wlS7yerW1dNPMzpKqWsp9oT1Wi+zZoorulpP4B6TXeQISIPf7
# FF9gHm2CS+GoYiDEu8LpyQwWDHmP7BwoJeAGlgkhepwKBkJ8L634+cfKbIt/bsmE
# IRwBuFFANXsCgw3J2nd2DCIy2It5qBkvk3eX73sKO9WxeA7Ibk7JNXkiQEVs17YT
# w17WmNjXTw+w/kMNqZoR2AC93o1xIjRUvCxoya+SRdlNRgjPejedCmJvvE3epN/z
# GRE3IYhWfPKMhmFX/rXl/uFz/pl0BgADuu5WF7+Y+1dv6deKd+fSEcw7hZDOWMsA
# JTU9gHjAG2tpruwhYjvpPA2XPsrUUHo0ewAIYxJ7GIDcmu8Hm46DFSLmYX78wvlR
# wyPKeLU2cEa4mb/nl5O5Mczsrkl1sTVRjnLxHufpg2FhDn7wgrDWG4ShUjqMxyuw
# DxtcG/j3oi+7LIHkhvFXBXU+dIv9FtcDHdZ4t1hyQsS6gn7GAzZPFHX9ap5Tuw==
# SIG # End signature block
