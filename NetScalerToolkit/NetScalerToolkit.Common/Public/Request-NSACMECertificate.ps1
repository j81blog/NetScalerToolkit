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
        [Parameter(ParameterSetName = 'LECertificatesHTTP', Mandatory = $true)][Parameter(ParameterSetName = 'LECertificatesDNS', Mandatory = $true)][Parameter(ParameterSetName = 'CleanExpiredCerts', Mandatory = $true)][String]$CertDir,
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
        [ValidateSet('LetsEncrypt', 'ZeroSSL', 'Google', 'SSLCom', 'Actalis', 'CustomAcme')][String]$CertificateProvider = 'LetsEncrypt',
        [String]$AcmeDirectoryUrl,
        [Alias('ExtAcctKID')][String]$ExternalAccountBindingKeyId,
        [Alias('ExtAcctHMACKey')][Object]$ExternalAccountBindingHmacKey,
        [ValidateSet('HS256', 'HS384', 'HS512')][Alias('ExtAcctAlgorithm')][String]$ExternalAccountBindingAlgorithm = 'HS256',
        [Switch]$UseModernPfxEncryption,
        [ValidateSet('None', 'Warn', 'Fail')][String]$CertificateChainValidation = 'Warn',
        [String]$PreferredChain,
        [String]$Profile,
        [String[]]$DnsAlias,
        [Int]$ValidationTimeout = 240,
        [Int]$LifetimeDays,
        [Switch]$AlwaysNewKey,
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

        Import-Module Posh-ACME -MinimumVersion 4.31.0 -ErrorAction Stop

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
                if ($request.RemovePrevious -and $Production -and $request.CertKeyNameToUpdate -and $deploy.CertKeyName -ne $request.CertKeyNameToUpdate) {
                    try { Invoke-NSDeleteSSLCertKey -Session $nsSession -CertKey $request.CertKeyNameToUpdate -DeleteFromDevice -Confirm:$false | Out-Null }
                    catch { Write-NSACMECertificateLog Warning 'Deploy' "RemovePrevious failed for '$($request.CertKeyNameToUpdate)': $($_.Exception.Message)" }
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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDGxUv2XvwDm65P
# GJ/J60qllPsmPSUUpa9qBCB7GOvc2qCCIAowggYUMIID/KADAgECAhB6I67aU2mW
# D5HIPlz0x+M/MA0GCSqGSIb3DQEBDAUAMFcxCzAJBgNVBAYTAkdCMRgwFgYDVQQK
# Ew9TZWN0aWdvIExpbWl0ZWQxLjAsBgNVBAMTJVNlY3RpZ28gUHVibGljIFRpbWUg
# U3RhbXBpbmcgUm9vdCBSNDYwHhcNMjEwMzIyMDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSwwKgYD
# VQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNjCCAaIwDQYJ
# KoZIhvcNAQEBBQADggGPADCCAYoCggGBAM2Y2ENBq26CK+z2M34mNOSJjNPvIhKA
# VD7vJq+MDoGD46IiM+b83+3ecLvBhStSVjeYXIjfa3ajoW3cS3ElcJzkyZlBnwDE
# JuHlzpbN4kMH2qRBVrjrGJgSlzzUqcGQBaCxpectRGhhnOSwcjPMI3G0hedv2eNm
# GiUbD12OeORN0ADzdpsQ4dDi6M4YhoGE9cbY11XxM2AVZn0GiOUC9+XE0wI7CQKf
# OUfigLDn7i/WeyxZ43XLj5GVo7LDBExSLnh+va8WxTlA+uBvq1KO8RSHUQLgzb1g
# bL9Ihgzxmkdp2ZWNuLc+XyEmJNbD2OIIq/fWlwBp6KNL19zpHsODLIsgZ+WZ1AzC
# s1HEK6VWrxmnKyJJg2Lv23DlEdZlQSGdF+z+Gyn9/CRezKe7WNyxRf4e4bwUtrYE
# 2F5Q+05yDD68clwnweckKtxRaF0VzN/w76kOLIaFVhf5sMM/caEZLtOYqYadtn03
# 4ykSFaZuIBU9uCSrKRKTPJhWvXk4CllgrwIDAQABo4IBXDCCAVgwHwYDVR0jBBgw
# FoAU9ndq3T/9ARP/FqFsggIv0Ao9FCUwHQYDVR0OBBYEFF9Y7UwxeqJhQo1SgLqz
# YZcZojKbMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGg
# P6A9hjtodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNUaW1lU3Rh
# bXBpbmdSb290UjQ2LmNybDB8BggrBgEFBQcBAQRwMG4wRwYIKwYBBQUHMAKGO2h0
# dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY1RpbWVTdGFtcGluZ1Jv
# b3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAN
# BgkqhkiG9w0BAQwFAAOCAgEAEtd7IK0ONVgMnoEdJVj9TC1ndK/HYiYh9lVUacah
# RoZ2W2hfiEOyQExnHk1jkvpIJzAMxmEc6ZvIyHI5UkPCbXKspioYMdbOnBWQUn73
# 3qMooBfIghpR/klUqNxx6/fDXqY0hSU1OSkkSivt51UlmJElUICZYBodzD3M/SFj
# eCP59anwxs6hwj1mfvzG+b1coYGnqsSz2wSKr+nDO+Db8qNcTbJZRAiSazr7KyUJ
# Go1c+MScGfG5QHV+bps8BX5Oyv9Ct36Y4Il6ajTqV2ifikkVtB3RNBUgwu/mSiSU
# ice/Jp/q8BMk/gN8+0rNIE+QqU63JoVMCMPY2752LmESsRVVoypJVt8/N3qQ1c6F
# ibbcRabo3azZkcIdWGVSAdoLgAIxEKBeNh9AQO1gQrnh1TA8ldXuJzPSuALOz1Uj
# b0PCyNVkWk7hkhVHfcvBfI8NtgWQupiaAeNHe0pWSGH2opXZYKYG4Lbukg7HpNi/
# KqJhue2Keak6qH9A8CeEOB7Eob0Zf+fU+CCQaL0cJqlmnx9HCDxF+3BLbUufrV64
# EbTI40zqegPZdA+sXCmbcZy6okx/SjwsusWRItFA3DE8MORZeFb6BmzBtqKJ7l93
# 9bbKBy2jvxcJI98Va95Q5JnlKor3m0E7xpMeYRriWklUPsetMSf2NvUQa/E5vVye
# fQIwggZFMIIELaADAgECAhAIMk+dt9qRb2Pk8qM8Xl1RMA0GCSqGSIb3DQEBCwUA
# MFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMu
# QS4xJDAiBgNVBAMTG0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQTAeFw0yNDA0
# MDQxNDA0MjRaFw0yNzA0MDQxNDA0MjNaMGsxCzAJBgNVBAYTAk5MMRIwEAYDVQQH
# DAlTY2hpam5kZWwxIzAhBgNVBAoMGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5
# MSMwIQYDVQQDDBpKb2huIEJpbGxla2VucyBDb25zdWx0YW5jeTCCAaIwDQYJKoZI
# hvcNAQEBBQADggGPADCCAYoCggGBAMslntDbSQwHZXwFhmibivbnd0Qfn6sqe/6f
# os3pKzKxEsR907RkDMet2x6RRg3eJkiIr3TFPwqBooyXXgK3zxxpyhGOcuIqyM9J
# 28DVf4kUyZHsjGO/8HFjrr3K1hABNUszP0o7H3o6J31eqV1UmCXYhQlNoW9FOmRC
# 1amlquBmh7w4EKYEytqdmdOBavAD5Xq4vLPxNP6kyA+B2YTtk/xM27TghtbwFGKn
# u9Vwnm7dFcpLxans4ONt2OxDQOMA5NwgcUv/YTpjhq9qoz6ivG55NRJGNvUXsM3w
# 2o7dR6Xh4MuEGrTSrOWGg2A5EcLH1XqQtkF5cZnAPM8W/9HUp8ggornWnFVQ9/6M
# ga+ermy5wy5XrmQpN+x3u6tit7xlHk1Hc+4XY4a4ie3BPXG2PhJhmZAn4ebNSBwN
# Hh8z7WTT9X9OFERepGSytZVeEP7hgyptSLcuhpwWeR4QdBb7dV++4p3PsAUQVHFp
# wkSbrRTv4EiJ0Lcz9P1HPGFoHiFAQQIDAQABo4IBeDCCAXQwDAYDVR0TAQH/BAIw
# ADA9BgNVHR8ENjA0MDKgMKAuhixodHRwOi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0u
# cGwvY2NzY2EyMDIxLmNybDBzBggrBgEFBQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0
# dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0dW0uY29tMDUGCCsGAQUFBzAChilodHRw
# Oi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAW
# gBTddF1MANt7n6B0yrFu9zzAMsBwzTAdBgNVHQ4EFgQUO6KtBpOBgmrlANVAnyiQ
# C6W6lJwwSwYDVR0gBEQwQjAIBgZngQwBBAEwNgYLKoRoAYb2dwIFAQQwJzAlBggr
# BgEFBQcCARYZaHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzATBgNVHSUEDDAKBggr
# BgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAEQsN8wg
# PMdWVkwHPPTN+jKpdns5AKVFjcn00psf2NGVVgWWNQBIQc9lEuTBWb54IK6Ga3hx
# QRZfnPNo5HGl73YLmFgdFQrFzZ1lnaMdIcyh8LTWv6+XNWfoyCM9wCp4zMIDPOs8
# LKSMQqA/wRgqiACWnOS4a6fyd5GUIAm4CuaptpFYr90l4Dn/wAdXOdY32UhgzmSu
# xpUbhD8gVJUaBNVmQaRqeU8y49MxiVrUKJXde1BCrtR9awXbqembc7Nqvmi60tYK
# lD27hlpKtj6eGPjkht0hHEsgzU0Fxw7ZJghYG2wXfpF2ziN893ak9Mi/1dmCNmor
# GOnybKYfT6ff6YTCDDNkod4egcMZdOSv+/Qv+HAeIgEvrxE9QsGlzTwbRtbm6gwY
# YcVBs/SsVUdBn/TSB35MMxRhHE5iC3aUTkDbceo/XP3uFhVL4g2JZHpFfCSu2TQr
# rzRn2sn07jfMvzeHArCOJgBW1gPqR3WrJ4hUxL06Rbg1gs9tU5HGGz9KNQMfQFQ7
# 0Wz7UIhezGcFcRfkIfSkMmQYYpsc7rfzj+z0ThfDVzzJr2dMOFsMlfj1T6l22GBq
# 9XQx0A4lcc5Fl9pRxbOuHHWFqIBD/BCEhwniOCySzqENd2N+oz8znKooSISStnkN
# aYXt6xblJF2dx9Dn89FK7d1IquNxOwt0tI5dMIIGYjCCBMqgAwIBAgIRAKQpO24e
# 3denNAiHrXpOtyQwDQYJKoZIhvcNAQEMBQAwVTELMAkGA1UEBhMCR0IxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEsMCoGA1UEAxMjU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBDQSBSMzYwHhcNMjUwMzI3MDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjByMQswCQYDVQQGEwJHQjEXMBUGA1UECBMOV2VzdCBZb3Jrc2hpcmUxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEwMC4GA1UEAxMnU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBTaWduZXIgUjM2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEA04SV9G6kU3jyPRBLeBIHPNyUgVNnYayfsGOyYEXrn3+SkDYTLs1crcw/
# ol2swE1TzB2aR/5JIjKNf75QBha2Ddj+4NEPKDxHEd4dEn7RTWMcTIfm492TW22I
# 8LfH+A7Ehz0/safc6BbsNBzjHTt7FngNfhfJoYOrkugSaT8F0IzUh6VUwoHdYDpi
# ln9dh0n0m545d5A5tJD92iFAIbKHQWGbCQNYplqpAFasHBn77OqW37P9BhOASdmj
# p3IijYiFdcA0WQIe60vzvrk0HG+iVcwVZjz+t5OcXGTcxqOAzk1frDNZ1aw8nFhG
# EvG0ktJQknnJZE3D40GofV7O8WzgaAnZmoUn4PCpvH36vD4XaAF2CjiPsJWiY/j2
# xLsJuqx3JtuI4akH0MmGzlBUylhXvdNVXcjAuIEcEQKtOBR9lU4wXQpISrbOT8ux
# +96GzBq8TdbhoFcmYaOBZKlwPP7pOp5Mzx/UMhyBA93PQhiCdPfIVOCINsUY4U23
# p4KJ3F1HqP3H6Slw3lHACnLilGETXRg5X/Fp8G8qlG5Y+M49ZEGUp2bneRLZoyHT
# yynHvFISpefhBCV0KdRZHPcuSL5OAGWnBjAlRtHvsMBrI3AAA0Tu1oGvPa/4yeei
# Ayu+9y3SLC98gDVbySnXnkujjhIh+oaatsk/oyf5R2vcxHahajMCAwEAAaOCAY4w
# ggGKMB8GA1UdIwQYMBaAFF9Y7UwxeqJhQo1SgLqzYZcZojKbMB0GA1UdDgQWBBSI
# YYyhKjdkgShgoZsx0Iz9LALOTzAOBgNVHQ8BAf8EBAMCBsAwDAYDVR0TAQH/BAIw
# ADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBKBgNVHSAEQzBBMDUGDCsGAQQBsjEB
# AgEDCDAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzAIBgZn
# gQwBBAIwSgYDVR0fBEMwQTA/oD2gO4Y5aHR0cDovL2NybC5zZWN0aWdvLmNvbS9T
# ZWN0aWdvUHVibGljVGltZVN0YW1waW5nQ0FSMzYuY3JsMHoGCCsGAQUFBwEBBG4w
# bDBFBggrBgEFBQcwAoY5aHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUHVi
# bGljVGltZVN0YW1waW5nQ0FSMzYuY3J0MCMGCCsGAQUFBzABhhdodHRwOi8vb2Nz
# cC5zZWN0aWdvLmNvbTANBgkqhkiG9w0BAQwFAAOCAYEAAoE+pIZyUSH5ZakuPVKK
# 4eWbzEsTRJOEjbIu6r7vmzXXLpJx4FyGmcqnFZoa1dzx3JrUCrdG5b//LfAxOGy9
# Ph9JtrYChJaVHrusDh9NgYwiGDOhyyJ2zRy3+kdqhwtUlLCdNjFjakTSE+hkC9F5
# ty1uxOoQ2ZkfI5WM4WXA3ZHcNHB4V42zi7Jk3ktEnkSdViVxM6rduXW0jmmiu71Z
# pBFZDh7Kdens+PQXPgMqvzodgQJEkxaION5XRCoBxAwWwiMm2thPDuZTzWp/gUFz
# i7izCmEt4pE3Kf0MOt3ccgwn4Kl2FIcQaV55nkjv1gODcHcD9+ZVjYZoyKTVWb4V
# qMQy/j8Q3aaYd/jOQ66Fhk3NWbg2tYl5jhQCuIsE55Vg4N0DUbEWvXJxtxQQaVR5
# xzhEI+BjJKzh3TQ026JxHhr2fuJ0mV68AluFr9qshgwS5SpN5FFtaSEnAwqZv3IS
# +mlG50rK7W3qXbWwi4hmpylUfygtYLEdLQukNEX1jiOKMIIGgjCCBGqgAwIBAgIQ
# NsKwvXwbOuejs902y8l1aDANBgkqhkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYD
# VQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBS
# U0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMjEwMzIyMDAwMDAwWhcNMzgw
# MTE4MjM1OTU5WjBXMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1p
# dGVkMS4wLAYDVQQDEyVTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIFJvb3Qg
# UjQ2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAiJ3YuUVnnR3d6Lkm
# gZpUVMB8SQWbzFoVD9mUEES0QUCBdxSZqdTkdizICFNeINCSJS+lV1ipnW5ihkQy
# C0cRLWXUJzodqpnMRs46npiJPHrfLBOifjfhpdXJ2aHHsPHggGsCi7uE0awqKggE
# /LkYw3sqaBia67h/3awoqNvGqiFRJ+OTWYmUCO2GAXsePHi+/JUNAax3kpqstbl3
# vcTdOGhtKShvZIvjwulRH87rbukNyHGWX5tNK/WABKf+Gnoi4cmisS7oSimgHUI0
# Wn/4elNd40BFdSZ1EwpuddZ+Wr7+Dfo0lcHflm/FDDrOJ3rWqauUP8hsokDoI7D/
# yUVI9DAE/WK3Jl3C4LKwIpn1mNzMyptRwsXKrop06m7NUNHdlTDEMovXAIDGAvYy
# nPt5lutv8lZeI5w3MOlCybAZDpK3Dy1MKo+6aEtE9vtiTMzz/o2dYfdP0KWZwZIX
# bYsTIlg1YIetCpi5s14qiXOpRsKqFKqav9R1R5vj3NgevsAsvxsAnI8Oa5s2oy25
# qhsoBIGo/zi6GpxFj+mOdh35Xn91y72J4RGOJEoqzEIbW3q0b2iPuWLA911cRxgY
# 5SJYubvjay3nSMbBPPFsyl6mY4/WYucmyS9lo3l7jk27MAe145GWxK4O3m3gEFEI
# kv7kRmefDR7Oe2T1HxAnICQvr9sCAwEAAaOCARYwggESMB8GA1UdIwQYMBaAFFN5
# v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBT2d2rdP/0BE/8WoWyCAi/QCj0U
# JTAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zATBgNVHSUEDDAKBggr
# BgEFBQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0
# cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25B
# dXRob3JpdHkuY3JsMDUGCCsGAQUFBwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDov
# L29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEADr5lQe1oRLjl
# ocXUEYfktzsljOt+2sgXke3Y8UPEooU5y39rAARaAdAxUeiX1ktLJ3+lgxtoLQhn
# 5cFb3GF2SSZRX8ptQ6IvuD3wz/LNHKpQ5nX8hjsDLRhsyeIiJsms9yAWnvdYOdEM
# q1W61KE9JlBkB20XBee6JaXx4UBErc+YuoSb1SxVf7nkNtUjPfcxuFtrQdRMRi/f
# InV/AobE8Gw/8yBMQKKaHt5eia8ybT8Y/Ffa6HAJyz9gvEOcF1VWXG8OMeM7Vy7B
# s6mSIkYeYtddU1ux1dQLbEGur18ut97wgGwDiGinCwKPyFO7ApcmVJOtlw9FVJxw
# /mL1TbyBns4zOgkaXFnnfzg4qbSvnrwyj1NiurMp4pmAWjR+Pb/SIduPnmFzbSN/
# G8reZCL4fvGlvPFk4Uab/JVCSmj59+/mB2Gn6G/UYOy8k60mKcmaAZsEVkhOFuoj
# 4we8CYyaR9vd9PGZKSinaZIkvVjbH/3nlLb0a7SBIkiRzfPfS9T+JesylbHa1LtR
# V9U/7m0q7Ma2CQ/t392ioOssXW7oKLdOmMBl14suVFBmbzrt5V5cQPnwtd3UOTpS
# 9oCG+ZZheiIvPgkDmA8FzPsnfXW5qHELB43ET7HHFHeRPRYrMBKjkb8/IN7Po0d0
# hQoF4TeMM+zYAJzoKQnVKOLg8pZVPT8wgga5MIIEoaADAgECAhEAmaOACiZVO2Wr
# 3G6EprPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAgBgNVBAoT
# GVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1bSBDZXJ0
# aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0ZWQgTmV0
# d29yayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIxOFowVjELMAkG
# A1UEBhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIG
# A1UEAxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5cTbq96y34vuTm
# flN4mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7VS5+djSoMcbv
# IKck6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1PH9ud0IF+njvM
# k2xqbNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOouu9Tj1yHIohzu
# C8KNqfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv8aGUsRdaCtVD
# 2bSlbfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtMLK+Wo837Q4QO
# ZgYqVWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9lDV2nT8mFSkc
# SkAExzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/JHuurfTI5XDY
# O962WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkKbWpQ5boufUnq
# 1UiYPIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADaCi2JSplKShBS
# ND36E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAWd18Jx5n858JS
# qPECAwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFN10XUwA
# 23ufoHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4HKbROg79
# MA4GA1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAwBgNVHR8EKTAn
# MCWgI6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwGCCsGAQUF
# BwEBBGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2VydHVtLmNv
# bTAyBggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBsL2N0bmNh
# Mi5jZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0dHA6Ly93
# d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhYD+WPUCiaU58Q
# 7EP89DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUStJl490L94C9L
# GF3vjzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChDUyuQy6rGDxLU
# UAsO0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiRsWrhWM2f8pXd
# d3x2mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7bWRLDm0CdY9rN
# LqyA3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mATwZWwSD+B7eMc
# ZNhpn8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3/bFAEloMU+vU
# BfSouCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESYkOh1/w1tVxTp
# V2Na3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR+x+zPF/2DaGg
# K2W1eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C+xN4YaNjt2yw
# zOr+tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qwt4HOUBCrW602
# NCmvO1nm+/80nLy5r0AZvCQxaQ4xggXDMIIFvwIBATBqMFYxCzAJBgNVBAYTAlBM
# MSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0Nl
# cnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQQIQCDJPnbfakW9j5PKjPF5dUTANBglg
# hkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3
# DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
# MC8GCSqGSIb3DQEJBDEiBCBJ40SH78zz7KhpZiGiYJ0PqjHGmP9NKIOEbpmNQtqf
# XTANBgkqhkiG9w0BAQEFAASCAYCS+7LyvJ23gJIXJx49Ok5xowwr0Jvs2hLqozVC
# P6qGhYg2jHS4rAaoHJt+QmKSSqgCKBHy/Rln08PK3FXiW1TJ+8vhY2CRrwNEo1vk
# wZMOEc+YXuU29Uf9QHTUzMOSJWnqlGE5hef+xSTZpxwGfCxBaG0qIhjprOFXaLO0
# 3CNfym5cHxXOi4UvWNp3QlOMODS2PeoIVVn7JQm1yDyl7AmkdKv3cgXUaYLR5baH
# C95lkTQaWaD1gNhIwk7o5jmzN4EzQOpxSpLvlh9RD5SsY274lMzpOlfpFbMTWk3k
# F1K59vyU5p6qGdwFPlPy+9gXmlvVbsJT7VHiYBOFs+YMV9pioUt/fqQBZL70/7f2
# 16Nnmf/+I10fLxOBPhelFBNCCxcZ0rfxcEHbtHntPWvN2+m7wbSiYXYXdE7SWUpn
# 893rIRGn0gHZlmTK8OxihVyZM/Ha4lGgn7d02E9oubzbWEX4Ju1QAMGKwepUjHVM
# oSF9J//HTOQ/pHgq03DeWQ8E9KKhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDQxMDE0MjVaMD8GCSqGSIb3
# DQEJBDEyBDAUKhPd7MfhUpY23G4j1laFV/QxybBYYHWhHtsGLdtyOCsCsgkKF5ct
# 3u/VPwQRPhEwDQYJKoZIhvcNAQEBBQAEggIAc5hKnFKuLd8Qo0QXvn3Wvt03SYcG
# xWzcR7OUaAOJsCYflvhSQK8xBp/L9nmTqKO12BcH88uJ0ExyqFMSK6pPkrNugk5i
# 1UhyOfxfcCDFTCNFlJQQvPp9qOIXZmOAOO0pAn1OBx7OtHeSUHjhEgqvJMROPeJp
# 1vzUHpQrO13KfDIcs5rrKWcGm4ZxRKEY6lEb/vbRIaQwuvBJ9v/G41PcmQzma5vG
# AlnZI/GrrvG/UyM6UtHvsWRAwqtHu1CEg1dC7SzBYF0tLP2JN7I/gY9coNJ+2TEZ
# xQsI1g3ocJaP7Ctgv5pPnRq4ryi0iL0cGhEyadNry/Ff/5EfAanj8o5dV+PUEyYH
# miGx5uEcLL0ZlvUZmeOroKUSr5SGaiSEewLtNktcFKDHFmZm02xLQxHpai8AaDju
# nvFcovFiNyugGPpT6YIIvtoIAVJiRzt7LII92ud8411BN0AvFC0A7t4XRxs/XqrG
# s9KaTQt8GH+kd1n7SjoXn21MhN+TrePII79qOc8WhXBuMxNrLdjL9zDPGudqvU8H
# 45fymXych990tYSk000AlNlCAK6RJHIobsCTD2UiX7ZmdG/Grnmc+Jcc19DH3Yi7
# Ndy1l8OwZ2ijdSHvv9eQGyDIhHONishKY9UW1xHcG7dnvJbAlVXsyEPD2ZyeiB64
# YH1AQMvqNNZl008=
# SIG # End signature block
