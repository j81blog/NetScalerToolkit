<#
    .SYNOPSIS
        Installs a renewed certificate on one or more Exchange servers.

    .DESCRIPTION
        Example post script for Request-NSACMECertificate. Connects to the Exchange Management Shell
        on a remote Exchange server, imports the PFX on every server in ExchangeServer and assigns
        it to the requested Exchange services.

        The PFX is read locally and sent as file data, so the Exchange servers need no access to the
        machine that runs the toolkit. A certificate that is already present on a server is not
        imported again, only re-enabled.

        Thumbprint, PFXfilename and PFXPassword are supplied by Request-NSACMECertificate. All other
        parameters come from PostPoSHScriptExtraParameters.

    .PARAMETER Thumbprint
        Thumbprint of the new certificate. Supplied by the toolkit.

    .PARAMETER PFXfilename
        Full path of the PFX file. Supplied by the toolkit.

    .PARAMETER PFXPassword
        PFX password in clear text. Supplied by the toolkit.

    .PARAMETER ExchangeServer
        Exchange servers to install the certificate on.

    .PARAMETER ConnectionServer
        Exchange server that hosts the remote PowerShell session. Defaults to the first entry of
        ExchangeServer.

    .PARAMETER Services
        Exchange services to assign the certificate to. Defaults to IIS and SMTP.

    .PARAMETER FriendlyName
        Optional friendly name for the imported certificate.

    .PARAMETER CredentialFile
        Optional Export-Clixml credential file for the Exchange connection. Without it the account
        that runs the toolkit connects with Kerberos. The file is DPAPI bound, so create it as the
        account and on the machine that runs the scheduled task.

    .PARAMETER RemovePreviousCertificate
        After the new certificate is enabled on a server, remove older certificates on that server
        with the same subject. Certificates with another subject, such as a wildcard pinned on a
        connector, are never touched. Needs Remove-ExchangeCertificate in the RBAC role.

    .EXAMPLE
        AutoRun config entry:

        {
            "CN": "mail.example.com",
            "PostPoSHScriptFilename": "Update-ExchangeCertificate.ps1",
            "PostPoSHScriptExtraParameters": {
                "ExchangeServer": [ "exch01.example.local", "exch02.example.local" ],
                "Services": [ "IIS", "SMTP" ],
                "RemovePreviousCertificate": true
            }
        }

    .EXAMPLE
        Manual test against an existing PFX:

        .\Update-ExchangeCertificate.ps1 -Thumbprint 'AB12...' -PFXfilename 'C:\Certificates\mail.pfx' -PFXPassword 'secret' -ExchangeServer 'exch01.example.local'

    .NOTES
        Function  : Update-ExchangeCertificate
        Author    : John Billekens
        Copyright : Copyright (c) John Billekens Consultancy
        Version   : 2026.1102.1830
#>
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', 'PFXPassword', Justification = 'The toolkit passes the PFX password as clear text.')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', 'CredentialFile', Justification = 'Path to a Clixml file, not a secret.')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '', Justification = 'The toolkit passes the PFX password as clear text.')]
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[0-9A-Fa-f]{40}$')]
    [String]$Thumbprint,

    [Parameter(Mandatory)]
    [ValidateScript({ Test-Path -LiteralPath $_ -PathType Leaf })]
    [String]$PFXfilename,

    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [String]$PFXPassword,

    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [String[]]$ExchangeServer,

    [String]$ConnectionServer,

    [ValidateSet('IIS', 'SMTP', 'IMAP', 'POP', 'UM', 'UMCallRouter', 'Federation')]
    [String[]]$Services = @('IIS', 'SMTP'),

    # No validation attributes on optional parameters: Windows PowerShell 5.1 Import-PSSession
    # re-validates caller variables and fails on an empty one. Checked below instead.
    [String]$FriendlyName,

    [String]$CredentialFile,

    [Switch]$RemovePreviousCertificate
)

$ErrorActionPreference = 'Stop'
if (-not $ConnectionServer) { $ConnectionServer = $ExchangeServer[0] }
if ($FriendlyName.Length -gt 63) { throw "FriendlyName is longer than 63 characters." }
if ($CredentialFile -and -not (Test-Path -LiteralPath $CredentialFile -PathType Leaf)) { throw "CredentialFile not found: $CredentialFile" }

$sessionParams = @{
    ConfigurationName = 'Microsoft.Exchange'
    ConnectionUri     = "http://$ConnectionServer/PowerShell/"
    Authentication    = 'Kerberos'
}
if ($CredentialFile) { $sessionParams.Credential = Import-Clixml -LiteralPath $CredentialFile }

$session = $null
try {
    Write-Output "Connecting to Exchange on $ConnectionServer."
    $session = New-PSSession @sessionParams
    $importSessionParams = @{
        Session             = $session
        CommandName         = @('Get-ExchangeCertificate', 'Import-ExchangeCertificate', 'Enable-ExchangeCertificate')
        AllowClobber        = $true
        DisableNameChecking = $true
    }
    if ($RemovePreviousCertificate) { $importSessionParams.CommandName += 'Remove-ExchangeCertificate' }
    Import-PSSession @importSessionParams | Out-Null

    # FileName was removed in Exchange 2016/2019 (2022 H1 CU), FileData works on every version.
    $pfxData = [System.IO.File]::ReadAllBytes($PFXfilename)
    $pfxSecret = ConvertTo-SecureString -String $PFXPassword -AsPlainText -Force

    foreach ($server in $ExchangeServer) {
        $existing = Get-ExchangeCertificate -Server $server -Thumbprint $Thumbprint -ErrorAction SilentlyContinue
        if ($existing) {
            Write-Output "$($server): certificate $Thumbprint is already installed."
        } else {
            $importParams = @{
                Server   = $server
                FileData = $pfxData
                Password = $pfxSecret
            }
            if ($FriendlyName) { $importParams.FriendlyName = $FriendlyName }
            $imported = @(Import-ExchangeCertificate @importParams)
            if ($imported.Thumbprint -notcontains $Thumbprint) {
                throw "$($server): imported thumbprint '$($imported.Thumbprint -join ', ')' does not match '$Thumbprint'."
            }
            Write-Output "$($server): imported certificate $Thumbprint."
        }

        # Force suppresses the prompt to replace the default SMTP certificate.
        $enableParams = @{
            Server     = $server
            Thumbprint = $Thumbprint
            Services   = $Services -join ','
            Force      = $true
        }
        Enable-ExchangeCertificate @enableParams
        Write-Output "$($server): certificate $Thumbprint enabled for $($Services -join ', ')."

        if ($RemovePreviousCertificate) {
            $current = Get-ExchangeCertificate -Server $server -Thumbprint $Thumbprint
            $previous = @(Get-ExchangeCertificate -Server $server | Where-Object {
                    $_.Subject -eq $current.Subject -and $_.Thumbprint -ne $Thumbprint -and $_.NotAfter -lt $current.NotAfter
                })
            foreach ($old in $previous) {
                # A failed cleanup must not fail the run, the new certificate is already active.
                try {
                    Remove-ExchangeCertificate -Server $server -Thumbprint $old.Thumbprint -Confirm:$false
                    Write-Output "$($server): removed previous certificate $($old.Thumbprint) (expires $($old.NotAfter))."
                } catch {
                    Write-Warning "$($server): could not remove previous certificate $($old.Thumbprint): $($_.Exception.Message)"
                }
            }
            if (-not $previous) { Write-Output "$($server): no previous certificate for $($current.Subject) to remove." }
        }
    }
} finally {
    if ($session) { Remove-PSSession -Session $session }
}
