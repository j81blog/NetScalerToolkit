function Request-NSACMECertificate {
    <#
    .SYNOPSIS
        Requests ACME certificates and deploys them to a NetScaler.

    .DESCRIPTION
        Module replacement for the legacy GenLeCertForNS script. Requests certificates
        from an ACME provider, validates them through the NetScaler, and deploys the
        result to /nsconfig/ssl with the certificate chain linked.

        Validation is done over HTTP-01 (using a temporary responder policy on a content
        switch or load balancing vServer) or DNS-01 (using a Posh-ACME DNS plugin).
        Let's Encrypt, ZeroSSL, Google, SSLCom, Actalis and custom ACME directories are
        supported, against production or staging endpoints.

        A single run can process many certificates from a config file with -AutoRun.
        Renewal is skipped for certificates that are still outside their renewal window
        unless -ForceCertRenew is used, and one ACME account is reused for all requests
        that share a contact address and account key length.

        Besides requesting certificates, the function also creates the NetScaler command
        policies and API user used for automation, cleans up NetScaler validation
        objects and test certificates, and removes expired certificates from disk.

        The public parameter surface intentionally mirrors the legacy script so existing
        config files and wrappers keep binding.

    .PARAMETER Help
        Shows the built-in usage information and exits without contacting a NetScaler.

    .PARAMETER CleanADC
        Removes the temporary NetScaler objects used for HTTP-01 validation (responder
        policy and action, content switch policy and action, load balancing vServer and
        service) and exits.

    .PARAMETER RemoveTestCertificates
        Removes previously deployed staging or test certificates from the NetScaler and
        exits. Test certificates are the ones created with a non-production ACME server.

    .PARAMETER CleanPoshACMEStorage
        Deletes the local Posh-ACME storage directory before the run. This discards
        cached ACME accounts and orders, so the next request registers a new account.

    .PARAMETER ManagementURL
        Management address of the NetScaler, for example https://192.168.1.10. When the
        NetScaler runs an HA pair, connect to the address of the primary node.

    .PARAMETER Username
        NetScaler user name used for the NITRO connection. Use New-NSACMECertificateUser
        to create an account with only the permissions this function needs.

    .PARAMETER Password
        Password for the NetScaler user. Accepts a plain string, a SecureString or the
        encrypted secret object used in the config file.

    .PARAMETER Credential
        NetScaler credential object. Use this instead of Username and Password.

    .PARAMETER CN
        Common name of the certificate, for example www.example.com. This is also the
        first domain in the certificate request.

    .PARAMETER SAN
        Additional Subject Alternative Names for the certificate. The common name does
        not need to be repeated here.

    .PARAMETER FriendlyName
        Friendly name stored in the PFX file. Defaults to the common name.

    .PARAMETER ValidationMethod
        ACME challenge type. Use 'http' for HTTP-01 validation through the NetScaler, or
        'dns' for DNS-01 validation through a Posh-ACME DNS plugin. Default is 'http'.

    .PARAMETER DNSPlugin
        Posh-ACME DNS plugin used for DNS-01 validation, for example Cloudflare or Azure.
        Use 'Manual' to be prompted for the TXT records. Default is 'Manual'.

    .PARAMETER DNSParams
        Hashtable of plugin arguments passed to the Posh-ACME DNS plugin, such as API
        tokens or zone identifiers. See the Posh-ACME plugin documentation for the keys
        each plugin expects.

    .PARAMETER DNSWaitTime
        Seconds to wait after publishing DNS records before asking the ACME provider to
        validate them. Increase this for slow-propagating zones. Default is 120.

    .PARAMETER CertKeyNameToUpdate
        Name of the existing NetScaler certkey to replace with the new certificate. When
        omitted, a certkey name is derived from the common name.

    .PARAMETER RemovePrevious
        Removes the previous certkey after the new certificate is bound. The old certkey
        is kept when it is still part of the new chain or bound to the VPN global
        configuration.

    .PARAMETER CertDir
        Directory where certificate artifacts (PFX, chain and key files) are written.

    .PARAMETER PfxPassword
        Password for the generated PFX file. A random password is generated when this is
        not supplied.

    .PARAMETER EmailAddress
        Contact address registered with the ACME account. The provider uses it for
        expiry notifications. Requests that share this address and account key length
        reuse the same ACME account.

    .PARAMETER KeyLength
        Certificate and account key size. Accepts an RSA size between 2048 and 4096 that
        is divisible by 128, or an EC curve name: 'ec-256', 'ec-384' or 'ec-521'.
        Default is 2048.

    .PARAMETER Production
        Requests a certificate from the production ACME endpoint. Without this switch the
        staging endpoint is used, which issues untrusted certificates but does not consume
        production rate limits.

    .PARAMETER DisableLogging
        Disables writing the log file for this run.

    .PARAMETER LogFile
        Path of the log file. The default resolves to GenLE-Log.txt in the certificate
        directory.

    .PARAMETER LogLevel
        Minimum severity written to the log: Error, Warning, Info, Debug or None. Default
        is 'Info'. Use 'Debug' when troubleshooting validation or deployment problems.

    .PARAMETER LogType
        Log file format: 'txt' for readable text or 'jsonl' for one JSON object per line.
        Default is 'txt'.

    .PARAMETER SaveADCConfig
        Saves the NetScaler running configuration after changes are applied.

    .PARAMETER SendMail
        Sends a summary mail when the run finishes. Requires the SMTP parameters.

    .PARAMETER SMTPTo
        One or more recipient addresses for the summary mail.

    .PARAMETER SMTPFrom
        Sender address for the summary mail.

    .PARAMETER SMTPCredential
        Credential used to authenticate to the SMTP server. Omit for anonymous relays.

    .PARAMETER SMTPServer
        Host name or address of the SMTP server.

    .PARAMETER SMTPPort
        TCP port of the SMTP server. Default is 25.

    .PARAMETER SMTPUseSSL
        Uses TLS for the SMTP connection.

    .PARAMETER LogAsAttachment
        Attaches the log file to the summary mail instead of only linking to it.

    .PARAMETER DisableIPCheck
        Skips the public DNS check that verifies each domain resolves to a reachable
        address before validation starts.

    .PARAMETER IPv6
        Treats the validation addresses as IPv6.

    .PARAMETER UpdateIIS
        Binds the new certificate to a local IIS site after deployment.

    .PARAMETER IISSiteToUpdate
        Name of the IIS site to bind the certificate to. Default is 'Default Web Site'.

    .PARAMETER UpdateGlobalVPNCertBinding
        Replaces the certificate bound to the NetScaler VPN global configuration.

    .PARAMETER UnbindGlobalVPNCertOnUpdate
        Allows the certkey update to unbind the certificate from the VPN global configuration
        and bind it back afterwards. NetScaler refuses to update a certkey while it is bound
        there. Without this switch such a request fails and reports the binding.

    .PARAMETER GlobalVPNCertBindingIncludeCA
        Also binds the issuing CA certificate to the VPN global configuration.

    .PARAMETER GlobalVPNCertBindingCrlCheck
        CRL checking for the VPN global CA binding: 'Mandatory' or 'Optional'.

    .PARAMETER GlobalVPNCertBindingOcspCheck
        OCSP checking for the VPN global CA binding: 'Mandatory' or 'Optional'.

    .PARAMETER PostPoSHScriptFilename
        Path to a PowerShell script executed after a certificate is deployed, for
        distributing the certificate to other systems.

    .PARAMETER PostPoSHScriptExtraParameters
        Hashtable of additional parameters splatted into the post-run script.

    .PARAMETER CsVipName
        Name of the content switch vServer that already serves the domains being
        validated. The HTTP-01 challenge is bound to it for the duration of the run.

    .PARAMETER UseLbVip
        Validates through a dedicated load balancing vServer instead of an existing
        content switch vServer. Use this when no content switch fronts the domains.

    .PARAMETER CspName
        Name of the content switch policy created for validation. Default is
        'csp_letsencrypt'.

    .PARAMETER CsaName
        Name of the content switch action created for validation. Default is
        'csa_letsencrypt'.

    .PARAMETER CsVipBinding
        Binding priority used when the validation policy is bound to the content switch
        vServer. Default is '11'.

    .PARAMETER SvcName
        Name of the dummy service created for validation. Default is
        'svc_letsencrypt_cert_dummy'.

    .PARAMETER SvcDestination
        Destination address of the dummy validation service. This address is never
        contacted. Default is '1.2.3.4'.

    .PARAMETER LbName
        Name of the load balancing vServer created for validation. Default is
        'lb_letsencrypt_cert'.

    .PARAMETER TrafficDomain
        NetScaler traffic domain used for the validation objects. Default is 0.

    .PARAMETER RspName
        Name of the responder policy created for validation. Default is
        'rsp_letsencrypt'.

    .PARAMETER RsaName
        Name of the responder action created for validation. Default is
        'rsa_letsencrypt'.

    .PARAMETER Partitions
        NetScaler admin partitions to search when locating existing certkeys. Default is
        the default partition.

    .PARAMETER EnableVipBefore
        Enables the content switch vServer before validation starts. Use this when the
        vServer is normally kept disabled.

    .PARAMETER DisableVipAfter
        Disables the content switch vServer again after validation finishes.

    .PARAMETER AlternateDNSValidationDomain
        Domain holding the _acme-challenge records when DNS-01 validation is delegated
        to another zone through a CNAME.

    .PARAMETER AlternateDNSValidationDomainSkipCheck
        Skips verification that the delegating CNAME records exist.

    .PARAMETER UseNetScalerDNS
        Publishes DNS-01 challenge records on the NetScaler itself instead of an external
        DNS provider. Requires a NetScaler session.

    .PARAMETER CreateUserPermissions
        Creates or updates the NetScaler command policy used for certificate automation
        and exits.

    .PARAMETER NSCPName
        Name of the command policy created by CreateUserPermissions. Default is
        'script-GenLeCertForNS'.

    .PARAMETER CreateApiUser
        Creates or updates a NetScaler system user for automation and binds the command
        policy to it.

    .PARAMETER ApiUsername
        User name of the NetScaler API account to create or update.

    .PARAMETER ApiPassword
        Password for the NetScaler API account.

    .PARAMETER ConfigFile
        Path to the JSON configuration file. Settings and certificate requests are read
        from it in AutoRun mode, and command line settings are written back to it.

    .PARAMETER AutoRun
        Processes every enabled certificate request in the configuration file. Requests
        outside their renewal window are skipped.

    .PARAMETER ForceCertRenew
        Renews certificates even when they are still outside their renewal window.

    .PARAMETER StopOnError
        Stops the run at the first failed certificate request. By default the remaining
        requests are still processed.

    .PARAMETER CleanExpiredCertsOnDisk
        Removes expired certificate directories from the certificate directory after a
        successful run.

    .PARAMETER CleanAllExpiredCertsOnDisk
        Removes expired certificate directories from the certificate directory and exits.

    .PARAMETER CleanExpiredCertsOnDiskDays
        Age in days after expiry before a certificate directory is removed from disk.
        Default is 100.

    .PARAMETER NoConsoleOutput
        Suppresses console output. The log file is still written.

    .PARAMETER AutoUpdate
        Checks for and installs a newer NetScalerToolkit module before running.

    .PARAMETER SkipCertificateCheck
        Skips TLS validation of the NetScaler management certificate. Use this for
        self-signed or private CA management certificates.

    .PARAMETER CertificateProvider
        ACME provider to request the certificate from: LetsEncrypt, ZeroSSL, Google,
        SSLCom, Actalis or CustomAcme. Providers other than LetsEncrypt generally require
        external account binding. Default is 'LetsEncrypt'.

    .PARAMETER AcmeDirectoryUrl
        Directory URL of the ACME server. Required when CertificateProvider is
        'CustomAcme', and overrides the built-in URL for the other providers.

    .PARAMETER ExternalAccountBindingKeyId
        External account binding key identifier (EAB KID) supplied by the ACME provider.

    .PARAMETER ExternalAccountBindingHmacKey
        External account binding HMAC key supplied by the ACME provider.

    .PARAMETER ExternalAccountBindingAlgorithm
        Algorithm used for the external account binding: HS256, HS384 or HS512. Default
        is 'HS256'.

    .PARAMETER UseModernPfxEncryption
        Writes the PFX with AES encryption instead of the legacy RC2 format. Older
        NetScaler firmware may not read these files.

    .PARAMETER CertificateChainValidation
        Behavior when the issued chain fails validation: 'None' to skip the check,
        'Warn' to log and continue, or 'Fail' to stop the request. Default is 'Warn'.

    .PARAMETER PreferredChain
        Issuer common name of the preferred certificate chain when the provider offers
        alternates, for example 'ISRG Root X1'.

    .PARAMETER Profile
        Certificate profile requested from the ACME provider, when the provider supports
        profile selection.

    .PARAMETER DnsAlias
        DNS challenge alias domains used when validation is delegated through CNAME
        records.

    .PARAMETER ValidationTimeout
        Seconds to wait for the ACME provider to complete validation before the request
        fails. Default is 240.

    .PARAMETER LifetimeDays
        Requested certificate lifetime in days, when the provider supports short-lived
        certificates.

    .PARAMETER AlwaysNewKey
        Generates a new private key for every renewal instead of reusing the existing
        key.

    .PARAMETER RemoveUploadedPfx
        Deletes the uploaded PFX file from the NetScaler after the certkey is created.

    .PARAMETER SkipPoshACMEInstall
        Fails instead of installing the Posh-ACME module automatically when it is
        missing.

    .EXAMPLE
        Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Username nsroot -Password 'password' -CN www.example.com -CertDir C:\Certs -EmailAddress hostmaster@example.com -CsVipName cs_https -Production

        Requests a production certificate for www.example.com using HTTP-01 validation
        through the existing cs_https content switch vServer, and deploys it.

    .EXAMPLE
        Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Username nsroot -Password 'password' -CN www.example.com -SAN mail.example.com,portal.example.com -CertDir C:\Certs -EmailAddress hostmaster@example.com -CsVipName cs_https

        Requests a staging SAN certificate for three domains. Without -Production the
        certificate is untrusted, which is the safe way to test a new configuration.

    .EXAMPLE
        Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Credential $cred -CN example.com -SAN *.example.com -ValidationMethod dns -DNSPlugin Cloudflare -DNSParams @{ CFToken = $token } -CertDir C:\Certs -EmailAddress hostmaster@example.com -Production

        Requests a wildcard certificate using DNS-01 validation through the Cloudflare
        plugin. Wildcard names require DNS validation.

    .EXAMPLE
        Request-NSACMECertificate -ConfigFile C:\Certs\config.json -AutoRun -Production

        Processes every enabled request in the configuration file, skipping certificates
        that are still outside their renewal window. This is the usual scheduled task.

    .EXAMPLE
        Request-NSACMECertificate -ManagementURL https://192.168.1.10 -Username nsroot -Password 'password' -CreateUserPermissions -CreateApiUser -ApiUsername svc_acme -ApiPassword 'password'

        Creates the limited NetScaler command policy and an API user bound to it, so
        later runs do not need a full administrator account.

    .LINK
        https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate/request/

    .LINK
        https://netscalertoolkit.j81.nl/
    #>
    [CmdletBinding(DefaultParameterSetName = 'LECertificatesHTTP')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingUserNameAndPasswordParams', '')]
    param(
        [Parameter(ParameterSetName = 'Help', Mandatory = $true)]
        [Alias('h')]
        [Switch]$Help,

        [Parameter(ParameterSetName = 'CleanADC', Mandatory = $true)]
        [Alias('CleanNS')]
        [Switch]$CleanADC,

        [Parameter(ParameterSetName = 'CleanTestCertificate', Mandatory = $true)]
        [Switch]$RemoveTestCertificates,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [Alias('CleanVault')]
        [Switch]$CleanPoshACMEStorage,

        [Parameter(ParameterSetName = 'CommandPolicy', Mandatory = $true)]
        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)]
        [Parameter(ParameterSetName = 'LECertificatesHTTP', Mandatory = $true)]
        [Parameter(ParameterSetName = 'LECertificatesDNS', Mandatory = $true)]
        [Parameter(ParameterSetName = 'CleanADC', Mandatory = $true)]
        [Parameter(ParameterSetName = 'CleanTestCertificate', Mandatory = $true)]
        [Alias('URL', 'NSManagementURL')]
        [String]$ManagementURL,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [Alias('User', 'NSUsername', 'ADCUsername')]
        [String]$Username,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [Alias('NSPassword', 'ADCPassword')]
        [Object]$Password,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [Alias('NSCredential', 'ADCCredential')]
        [System.Management.Automation.PSCredential]$Credential = [System.Management.Automation.PSCredential]::Empty,

        [Parameter(ParameterSetName = 'LECertificatesHTTP', Mandatory = $true)]
        [Parameter(ParameterSetName = 'LECertificatesDNS', Mandatory = $true)]
        [String]$CN,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String[]]$SAN = @(),

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$FriendlyName,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [ValidateSet('http', 'dns')]
        [String]$ValidationMethod = 'http',

        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$DNSPlugin = 'Manual',

        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Object]$DNSParams = @{},

        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Int]$DNSWaitTime = 120,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Alias('NSCertNameToUpdate')]
        [String]$CertKeyNameToUpdate,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$RemovePrevious,

        [Parameter(ParameterSetName = 'LECertificatesHTTP', Mandatory = $true)]
        [Parameter(ParameterSetName = 'LECertificatesDNS', Mandatory = $true)]
        [Parameter(ParameterSetName = 'CleanExpiredCerts', Mandatory = $true)]
        [Parameter(ParameterSetName = 'AutoRun')]
        [String]$CertDir,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Object]$PfxPassword = $null,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$EmailAddress,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [ValidateScript({
                if ($_ -is [int] -or $_ -as [int]) {
                    $size = [int]$_
                    if ($size -lt 2048 -or $size -gt 4096 -or ($size % 128) -ne 0) { throw 'Unsupported RSA key size. Must be 2048-4096 and divisible by 128.' }
                    return $true
                }
                if ([string]$_ -notin @('ec-256', 'ec-384', 'ec-521')) { throw 'Unsupported key size. Use RSA 2048-4096 or ec-256, ec-384, ec-521.' }
                return $true
            })]
        [Object]$KeyLength = 2048,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Switch]$Production,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [Switch]$DisableLogging,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [Alias('LogLocation')]
        [String]$LogFile = '<DEFAULT>',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [ValidateSet('Error', 'Warning', 'Info', 'Debug', 'None')]
        [String]$LogLevel = 'Info',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [ValidateSet('txt', 'jsonl')]
        [String]$LogType = 'txt',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('SaveNSConfig')]
        [Switch]$SaveADCConfig,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$SendMail,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String[]]$SMTPTo,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$SMTPFrom,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [System.Management.Automation.PSCredential]$SMTPCredential = [System.Management.Automation.PSCredential]::Empty,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$SMTPServer,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Int]$SMTPPort = 25,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$SMTPUseSSL,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$LogAsAttachment,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$DisableIPCheck,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$IPv6,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$UpdateIIS,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$UpdateGlobalVPNCertBinding,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$UnbindGlobalVPNCertOnUpdate,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$GlobalVPNCertBindingIncludeCA,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [ValidateSet('Mandatory', 'Optional')]
        [String]$GlobalVPNCertBindingCrlCheck,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [ValidateSet('Mandatory', 'Optional')]
        [String]$GlobalVPNCertBindingOcspCheck,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$IISSiteToUpdate = 'Default Web Site',

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$PostPoSHScriptFilename,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Hashtable]$PostPoSHScriptExtraParameters = @{},

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSCsVipName')]
        [String[]]$CsVipName,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$UseLbVip,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSCspName')]
        [String]$CspName = 'csp_letsencrypt',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [String]$CsaName = 'csa_letsencrypt',

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSCsVipBinding')]
        [String]$CsVipBinding = '11',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSSvcName')]
        [String]$SvcName = 'svc_letsencrypt_cert_dummy',

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSSvcDestination')]
        [String]$SvcDestination = '1.2.3.4',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSLbName')]
        [String]$LbName = 'lb_letsencrypt_cert',

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('TD')]
        [Int]$TrafficDomain = 0,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSRspName')]
        [String]$RspName = 'rsp_letsencrypt',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Alias('NSRsaName')]
        [String]$RsaName = 'rsa_letsencrypt',

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP', DontShow)]
        [Parameter(ParameterSetName = 'LECertificatesDNS', DontShow)]
        [Parameter(ParameterSetName = 'CleanADC', DontShow)]
        [String[]]$Partitions = @('default'),

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$EnableVipBefore,

        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [String]$AlternateDNSValidationDomain,

        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$AlternateDNSValidationDomainSkipCheck,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$UseNetScalerDNS,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$DisableVipAfter,

        [Parameter(ParameterSetName = 'CommandPolicy', Mandatory = $true)]
        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)]
        [Switch]$CreateUserPermissions,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [String]$NSCPName = 'script-GenLeCertForNS',

        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)]
        [Switch]$CreateApiUser,

        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)]
        [String]$ApiUsername,

        [Parameter(ParameterSetName = 'CommandPolicyUser', Mandatory = $true)]
        [Object]$ApiPassword,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun', Mandatory = $true)]
        [String]$ConfigFile = $null,

        [Parameter(ParameterSetName = 'AutoRun', Mandatory = $true)]
        [Switch]$AutoRun,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Alias('Force')]
        [Switch]$ForceCertRenew,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Switch]$StopOnError,

        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Switch]$CleanExpiredCertsOnDisk,

        [Parameter(ParameterSetName = 'CleanExpiredCerts', Mandatory = $true)]
        [Switch]$CleanAllExpiredCertsOnDisk,

        [Parameter(ParameterSetName = 'CleanExpiredCerts')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Int16]$CleanExpiredCertsOnDiskDays = 100,

        [Switch]$NoConsoleOutput,

        [Switch]$AutoUpdate,

        [Parameter(ParameterSetName = 'CommandPolicy')]
        [Parameter(ParameterSetName = 'CommandPolicyUser')]
        [Parameter(ParameterSetName = 'LECertificatesHTTP')]
        [Parameter(ParameterSetName = 'LECertificatesDNS')]
        [Parameter(ParameterSetName = 'AutoRun')]
        [Parameter(ParameterSetName = 'CleanADC')]
        [Parameter(ParameterSetName = 'CleanTestCertificate')]
        [Switch]$SkipCertificateCheck,

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
        $settings = [PSCustomObject]@{}
        $requests = @()
        $disabledRequestNames = @()
        if ($AutoRun) {
            if (-not (Test-Path -LiteralPath $ConfigFile)) { throw "Config file not found: $ConfigFile" }
            $config = Get-Content -LiteralPath $ConfigFile -Raw | ConvertFrom-Json
            $settings = $config.settings
            $requests = @($config.certrequests | Where-Object { $_.Enabled -ne $false })
            $disabledRequestNames = @($config.certrequests | Where-Object { $_.Enabled -eq $false } | ForEach-Object { $_.CN } | Where-Object { $_ })
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
            $requests = @([PSCustomObject]@{ Enabled = $true; CN = $CN; SANs = ($SAN -join ','); FriendlyName = $FriendlyName; CsVipName = $CsVipName; UseLbVip = [bool]$UseLbVip; EnableVipBefore = [bool]$EnableVipBefore; DisableVipAfter = [bool]$DisableVipAfter; CertKeyNameToUpdate = $CertKeyNameToUpdate; RemovePrevious = [bool]$RemovePrevious; CertDir = $CertDir; EmailAddress = $EmailAddress; KeyLength = $KeyLength; ValidationMethod = $ValidationMethod; DNSPlugin = $DNSPlugin; DNSParams = $DNSParams; DNSWaitTime = $DNSWaitTime; AlternateDNSValidationDomain = $AlternateDNSValidationDomain; AlternateDNSValidationDomainSkipCheck = [bool]$AlternateDNSValidationDomainSkipCheck; UseNetScalerDNS = [bool]$UseNetScalerDNS; ForceCertRenew = [bool]$ForceCertRenew; DisableIPCheck = [bool]$DisableIPCheck; PfxPassword = $PfxPassword; UpdateIIS = [bool]$UpdateIIS; IISSiteToUpdate = $IISSiteToUpdate; UpdateGlobalVPNCertBinding = [bool]$UpdateGlobalVPNCertBinding; UnbindGlobalVPNCertOnUpdate = [bool]$UnbindGlobalVPNCertOnUpdate; GlobalVPNCertBindingIncludeCA = [bool]$GlobalVPNCertBindingIncludeCA; GlobalVPNCertBindingCrlCheck = $GlobalVPNCertBindingCrlCheck; GlobalVPNCertBindingOcspCheck = $GlobalVPNCertBindingOcspCheck; PostPoSHScriptFilename = $PostPoSHScriptFilename; PostPoSHScriptExtraParameters = $PostPoSHScriptExtraParameters; CleanExpiredCertsOnDisk = [bool]$CleanExpiredCertsOnDisk; CleanExpiredCertsOnDiskDays = $CleanExpiredCertsOnDiskDays })
            $settings = [PSCustomObject]@{ ManagementURL = $ManagementURL; SvcName = $SvcName; SvcDestination = $SvcDestination; LbName = $LbName; RspName = $RspName; RsaName = $RsaName; CspName = $CspName; CsaName = $CsaName; CsVipBinding = $CsVipBinding; TrafficDomain = $TrafficDomain; SaveADCConfig = [bool]$SaveADCConfig; DisableIPCheck = [bool]$DisableIPCheck; SendMail = [bool]$SendMail; SMTPTo = $SMTPTo; SMTPFrom = $SMTPFrom; SMTPCredential = $SMTPCredential; SMTPServer = $SMTPServer; SMTPPort = $SMTPPort; SMTPUseSSL = [bool]$SMTPUseSSL; LogAsAttachment = [bool]$LogAsAttachment; ExternalAccountBindingKeyId = $ExternalAccountBindingKeyId; ExternalAccountBindingHmacKey = $ExternalAccountBindingHmacKey; ExternalAccountBindingAlgorithm = $ExternalAccountBindingAlgorithm; CertificateChainValidation = $CertificateChainValidation }
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
        if (-not $NoConsoleOutput) {
            # Debug level, so the default Info level does not duplicate the call site lines.
            $null = Import-NSConsoleStatus -LogAction {
                param($Record)
                # The text formatter prints every key it is given.
                $statusData = [ordered]@{}
                foreach ($field in 'Section', 'Value', 'Detail', 'Error') {
                    if (-not [string]::IsNullOrWhiteSpace([string]$Record.$field)) { $statusData[$field] = $Record.$field }
                }
                $statusData['DurationMs'] = $Record.DurationMs
                Write-NSACMECertificateLog Debug 'Status' "$($Record.Label): $($Record.Status)" -Data $statusData
            }
            # Matches the 'Loaded Posh-ACME' line. The log header is written before this import, so
            # without it the header is the only ConsoleStatus record and it always reads as unloaded.
            $consoleStatusLoaded = Get-NSACMECertificateModuleVersion -Name 'ConsoleStatus'
            if ($consoleStatusLoaded.Loaded) {
                Write-NSACMECertificateLog Info 'ConsoleStatus' "Loaded ConsoleStatus v$($consoleStatusLoaded.Version)."
            } else {
                Write-NSACMECertificateLog Warning 'ConsoleStatus' 'ConsoleStatus is not available. Console output falls back to plain text.'
            }
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
        $config = if ($AutoRun) { $config } else { [PSCustomObject]@{ settings = $settings; certrequests = $requests } }

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
        if (@($disabledRequestNames).Count -gt 0) {
            Write-NSACMECertificateLog Info 'Config' "Skipped $(@($disabledRequestNames).Count) disabled certificate request(s): $($disabledRequestNames -join ', ')."
        }

        $providersWithStaging = @('LetsEncrypt', 'Google')
        if (-not $Production -and -not $AcmeDirectoryUrl -and $CertificateProvider -notin $providersWithStaging) {
            $message = "Certificate provider '$CertificateProvider' does not have a configured staging environment. Rerun with -Production, or specify -AcmeDirectoryUrl for a custom ACME directory."
            Write-NSACMECertificateLog Error 'ACME' $message
            throw $message
        }

        # Which build actually ran is the first thing needed when a run behaves unexpectedly, so it
        # is reported where it is read rather than only in the log header.
        $toolkitInfo = Get-NSACMECertificateModuleVersion -Name 'NetScalerToolkit'
        if (-not $toolkitInfo.Version) {
            $toolkitCommand = Get-Command Request-NSACMECertificate -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($toolkitCommand -and $toolkitCommand.Module) { $toolkitInfo = [PSCustomObject]@{ Version = $toolkitCommand.Module.Version; Display = [string]$toolkitCommand.Module.Version } }
        }
        $moduleLine = 'NetScalerToolkit {0}, ConsoleStatus {1}' -f $toolkitInfo.Display, (Get-NSACMECertificateModuleVersion -Name 'ConsoleStatus').Display

        # Starts the run timer for the closing summary. A bare if adds no line when it does not match.
        $titleSubtitle = @(
            'NetScaler    : {0}' -f $ManagementURL
            'Provider     : {0} ({1}), {2} request(s)' -f $CertificateProvider, $(if ($Production) { 'production' } else { 'staging' }), @($requests).Count
            'Module       : {0}' -f $moduleLine
            'ACME storage : {0}' -f (Join-Path $env:LOCALAPPDATA 'Posh-ACME')
            if ($AutoRun) { 'Config       : {0}' -f $ConfigFile }
            'Log          : {0}' -f $(if ($script:NSACMECertificateLogFile) { $script:NSACMECertificateLogFile } else { 'disabled' })
        )
        Write-NSStatusTitle -Title 'Request-NSACMECertificate' -Subtitle $titleSubtitle

        Write-NSStatusSection -Title 'Setup'

        Write-NSStatusItem -Label 'Load Posh-ACME'
        try {
            Import-NSACMECertificatePoshACME -SkipInstall:$SkipPoshACMEInstall
            $poshACMEModule = Get-Module -Name Posh-ACME | Select-Object -First 1
            Write-NSStatusResult -Status OK -Detail "v$($poshACMEModule.Version)"
        } catch {
            Write-NSStatusResult -Status FAIL -ErrorRecord $_
            throw
        }

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
        Write-NSStatusItem -Label 'ACME server' -Value $serverName
        Write-NSACMECertificateLog Info 'ACME' "Using ACME server '$serverName'. Production=$([bool]$Production)."
        try {
            Set-NSACMEPoshACMEServer -DirectoryUrl $serverName
            if ($CleanPoshACMEStorage) {
                $acmeStorage = Join-Path $env:LOCALAPPDATA 'Posh-ACME'
                Remove-Item -LiteralPath $acmeStorage -Recurse -Force -ErrorAction SilentlyContinue
                New-Item -Path $acmeStorage -ItemType Directory -Force | Out-Null
                Set-NSACMEPoshACMEServer -DirectoryUrl $serverName
            }
            if ($Production) {
                Write-NSStatusResult -Status OK -Detail 'production'
            } else {
                Write-NSStatusResult -Status WARN -Detail 'staging' -Note 'Staging certificates are not publicly trusted. Use -Production for a usable certificate.'
            }
        } catch {
            Write-NSStatusResult -Status FAIL -ErrorRecord $_
            throw
        }

        Write-NSStatusItem -Label 'Connect to NetScaler' -Value $ManagementURL
        Write-NSACMECertificateLog Info 'NetScaler' "Connecting to $ManagementURL as $($Credential.UserName)."
        try {
            $nsSession = Connect-NSNode -ManagementURL $ManagementURL -Credential $Credential -SkipCertificateCheck:$SkipCertificateCheck -HA -PassThru -ErrorAction Stop
            Write-NSACMECertificateLog Debug 'NetScaler' "Connected node state: $($nsSession.ConnectedNodeState); HA=$([bool]$nsSession.IsHA); Version=$($nsSession.Version)."
            $connectDetail = @($nsSession.ConnectedNodeState, $(if ($nsSession.Version) { "v$($nsSession.Version)" })) | Where-Object { $_ }
            Write-NSStatusResult -Status OK -Detail ($connectDetail -join ', ')
        } catch {
            Write-NSStatusResult -Status FAIL -ErrorRecord $_
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
        $cleanupSectionWritten = $false
        $resolvedAcmeAccounts = @{}
        try {
        foreach ($request in $requests) {
            $challengeBindings = @()
            $requestVipEnabled = $false
            Write-NSStatusSection -Title "Certificate $($request.CN)"
            try {
            # Normalize one request at a time so AutoRun can continue after a later request fails.
            $normalizedRequest = Normalize-NSACMECertificateRequest -Request $request -DefaultCertDir $CertDir
            $domains = $normalizedRequest.Domains
            $effectiveForceCertRenew = [bool]$ForceCertRenew -or [bool]$request.ForceCertRenew
            Write-NSACMECertificateLog Debug 'Request' "CN=$($request.CN); Validation=$($request.ValidationMethod); Domains=$($domains -join ', '); Force=$effectiveForceCertRenew."
            if ($request.ValidationMethod -eq 'http' -and -not $request.CsVipName -and -not $request.UseLbVip) { throw "CsVipName is required for HTTP validation unless UseLbVip is set. CN=$($request.CN)" }
            if ([string]::IsNullOrWhiteSpace([string]$request.CertDir)) { throw "CertDir is required. Provide -CertDir on the command line or set CertDir in the config for CN=$($request.CN)." }
            if (-not (Test-Path -LiteralPath $request.CertDir)) { New-Item -ItemType Directory -Path $request.CertDir -Force | Out-Null }
            Write-NSStatusItem -Label 'Renewal check' -Value ($domains -join ', ')
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
                        Write-NSACMECertificateLog Debug 'CheckCertRenewal' "Loaded NetScaler certkey '$($request.CertKeyNameToUpdate)' as the primary renewal source." -Data ([ordered]@{
                                CertKey          = $request.CertKeyNameToUpdate
                                Status           = $existingNetScalerCertificate.status
                                NotBefore        = $existingNetScalerCertificate.clientcertnotbefore
                                NotAfter         = $existingNetScalerCertificate.clientcertnotafter
                                DaysToExpiration = $existingNetScalerCertificate.daystoexpiration
                                Serial           = $existingNetScalerCertificate.serial
                                Issuer           = $existingNetScalerCertificate.issuer
                            }) -ConsoleDataKeys @('Status', 'NotAfter', 'DaysToExpiration')
                    }
                } catch {
                    Write-NSACMECertificateLog Warning 'CheckCertRenewal' "Could not inspect NetScaler certkey '$($request.CertKeyNameToUpdate)' for renewal fallback: $($_.Exception.Message)"
                }
            }
            $renewalDecision = Test-NSACMECertificateRenewalRequired -Request $request -AcmeOrder $existingAcmeOrder -AcmeCertificate $existingAcmeCertificate -NetScalerCertificate $existingNetScalerCertificate -Domains $domains -AcmeServer $serverName -IsProduction:$Production -Force:$effectiveForceCertRenew
            # CertExpires and RenewAfter describe an issued certificate, so they are written only
            # after a successful deploy. Writing them here would overwrite good values with a
            # guess taken from whatever source the decision happened to use.
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
                Write-NSStatusResult -Status SKIP -Detail $renewalDecision.Reason
                Write-NSACMECertificateLog Info 'CheckCertRenewal' "$($request.CN) skipped. $($renewalDecision.Summary)"
                $results += [PSCustomObject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $request.CertKeyNameToUpdate; PfxPath = $null; Thumbprint = $null; NotAfter = $renewalDecision.CertExpires; Status = 'Skipped'; Reason = $renewalDecision.Reason; LogFile = $script:NSACMECertificateLogFile }
                continue
            }
            Write-NSStatusResult -Status OK -Detail 'renewal required'
            Write-NSACMECertificateLog Info 'CheckCertRenewal' "$($request.CN) renewal required. $($renewalDecision.Summary)"
            if ($request.ValidationMethod -eq 'http' -and $request.EnableVipBefore) {
                foreach ($csVip in @($request.CsVipName | Where-Object { $_ })) {
                    $stateBefore = Get-NSACMECertificateVServerState -Session $nsSession -Name $csVip -Type 'CS'
                    Write-NSStatusItem -Label 'Enable CS vServer' -Value $csVip
                    try { Invoke-NSEnableCSVServer -Session $nsSession -Name $csVip | Out-Null } catch { Write-NSACMECertificateLog Warning 'NetScaler' "Could not enable CS VIP $csVip`: $($_.Exception.Message)" }
                    $stateAfter = Get-NSACMECertificateVServerState -Session $nsSession -Name $csVip -Type 'CS'
                    Write-NSStatusResult -Status OK -Detail ('{0} -> {1}' -f $stateBefore.Text, $stateAfter.Text)
                }
                $requestVipEnabled = $true
            }
            $pfxSecret = if ($request.PfxPassword) { ConvertFrom-NSACMECertificateLegacySecret -Object $request.PfxPassword } elseif ($PfxPassword) { ConvertFrom-NSACMECertificateLegacySecret -Object $PfxPassword } else { ConvertTo-SecureString (New-NSACMECertificatePassword) -AsPlainText -Force }
            Add-NSACMECertificateSensitiveValue -Value $pfxSecret -Placeholder '<PfxPassword>'
            Write-NSStatusItem -Label 'ACME account' -Value $request.EmailAddress
            Write-NSACMECertificateLog Info 'ACME' "Ensuring ACME account for $($request.EmailAddress)."
            $accountAction = 'reused'
            # Posh-ACME treats KeyLength as a string: RSA sizes ('2048'-'4096', divisible by 128) or
            # EC curves ('ec-256', 'ec-384', 'ec-521'). Keep it a string so account lookup matches.
            $accountKeyLength = [string]$request.KeyLength
            if ($accountKeyLength -notmatch '^(ec-(256|384|521)|\d+)$') { $accountKeyLength = '2048' }
            # Reuse a resolved account for the same contact and key length so a multi-request run
            # registers once instead of once per certificate.
            $accountCacheKey = "$($request.EmailAddress)|$accountKeyLength"
            $account = $resolvedAcmeAccounts[$accountCacheKey]
            if (-not $account) {
                # Match Posh-ACME's own account resolution (New-PACertificate): let Get-PAAccount do the
                # contact/key filtering, and only create when nothing valid matches.
                $existingAccounts = @()
                try {
                    $existingAccounts = @(Get-PAAccount -List -Refresh -Contact $request.EmailAddress -KeyLength $accountKeyLength -Status 'valid' -ErrorAction Stop)
                } catch {
                    Write-NSACMECertificateLog Warning 'ACME' "Could not list existing ACME accounts for $($request.EmailAddress): $($_.Exception.Message)"
                    Write-NSACMECertificateErrorDetail -ErrorRecord $_ -Component 'ACME'
                }
                if ($existingAccounts.Count -gt 0) {
                    $account = $existingAccounts[0]
                    Write-NSACMECertificateLog Debug 'ACME' "Reusing existing ACME account $($account.ID) for $($request.EmailAddress)."
                } else {
                    Write-NSACMECertificateLog Debug 'ACME' "Creating ACME account for $($request.EmailAddress) with account key length $accountKeyLength."
                    $newAccountParams = @{
                        Contact     = $request.EmailAddress
                        KeyLength   = $accountKeyLength
                        AcceptTOS   = $true
                        ErrorAction = 'Stop'
                    }
                    if ($ExternalAccountBindingKeyId -and $externalAccountBindingHmacClearText) {
                        $newAccountParams.ExtAcctKID = $ExternalAccountBindingKeyId
                        $newAccountParams.ExtAcctHMACKey = $externalAccountBindingHmacClearText
                        $newAccountParams.ExtAcctAlgorithm = $ExternalAccountBindingAlgorithm
                    }
                    $account = New-PAAccount @newAccountParams
                    $accountAction = 'created'
                    Write-NSACMECertificateLog Info 'ACME' "Created ACME account $($account.ID) for $($request.EmailAddress)."
                }
                $resolvedAcmeAccounts[$accountCacheKey] = $account
            }
            Set-PAAccount -ID $account.ID -Force | Out-Null
            Write-NSStatusResult -Status OK -Detail "$accountAction, ID $($account.ID)"
                $cert = $null
                if ($request.ValidationMethod -eq 'dns') {
                    Write-NSStatusItem -Label 'DNS validation' -Value $DNSPlugin
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
                    Write-NSStatusResult -Status OK -Detail "$(@($domains).Count) domain(s)" -ShowDuration
                } else {
                    Write-NSStatusItem -Label 'Create ACME order' -Value ($domains -join ', ')
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
                    Write-NSStatusResult -Status OK -Detail "$(@($domains).Count) domain(s)"

                    Write-NSStatusItem -Label 'Configure validation' -Value $(if ($request.UseLbVip) { $settings.LbName } else { @($request.CsVipName) -join ', ' })
                    Initialize-NSACMECertificateHttpValidationConfig -Session $nsSession -Settings $settings -Request $request
                    if (-not $request.UseLbVip) {
                        $httpValidationConfigInitialized = $true
                        $httpValidationCleanupCsVipNames = @($httpValidationCleanupCsVipNames + @($request.CsVipName) | Where-Object { $_ } | Select-Object -Unique)
                    }
                    Write-NSStatusResult -Status OK

                    # The validation LB vServer is non-addressable (0.0.0.0) behind a dummy service with health
                    # monitoring off, so its state says nothing about reachability. Reported, never acted on.
                    $vServerChecks = @()
                    if ($request.UseLbVip) {
                        $vServerChecks += [PSCustomObject]@{ Name = $settings.LbName; Type = 'LB'; Required = $true }
                    } else {
                        foreach ($csVip in @($request.CsVipName | Where-Object { $_ })) {
                            $vServerChecks += [PSCustomObject]@{ Name = $csVip; Type = 'CS'; Required = $true }
                        }
                        $vServerChecks += [PSCustomObject]@{ Name = $settings.LbName; Type = 'LB'; Required = $false }
                    }
                    foreach ($check in $vServerChecks) {
                        $vServerState = Get-NSACMECertificateVServerState -Session $nsSession -Name $check.Name -Type $check.Type
                        Write-NSStatusItem -Label ('{0} vServer' -f $check.Type) -Value $check.Name
                        $stateDetail = (@($vServerState.Text, $vServerState.Endpoint) | Where-Object { $_ }) -join ' '
                        if ($vServerState.IsServing -or -not $check.Required) {
                            Write-NSStatusResult -Status OK -Detail $stateDetail
                        } else {
                            # The CA reaches the HTTP-01 challenge over this vServer. Continuing can only
                            # end in a validation timeout, so fail now and move on to the next request.
                            $vServerReason = if (-not $vServerState.Found) {
                                "$($check.Type) vServer '$($check.Name)' does not exist on the NetScaler. HTTP-01 validation needs it to serve the challenge."
                            } elseif (-not $request.EnableVipBefore -and $vServerState.Text -match 'DISABLED|OUT OF SERVICE') {
                                # DisableVipAfter leaves the vServer down for the next run, which is only
                                # a working setup when EnableVipBefore brings it back up.
                                "$($check.Type) vServer '$($check.Name)' is $($vServerState.Text). The CA cannot reach the HTTP-01 challenge. Use EnableVipBefore to enable it for the request, which is what DisableVipAfter pairs with."
                            } else {
                                "$($check.Type) vServer '$($check.Name)' is not serving traffic ($($vServerState.Text)). The CA cannot reach the HTTP-01 challenge, so validation would time out."
                            }
                            Write-NSStatusResult -Status FAIL -Detail $stateDetail -Note $vServerReason
                            Write-NSACMECertificateLog Error 'NetScaler' $vServerReason
                            throw $vServerReason
                        }
                    }

                    Write-NSStatusItem -Label 'Publish HTTP challenge' -Value $request.CN -TotalSteps @($domains).Count
                    $challengeBindings = @(Publish-NSACMECertificateHttpChallenge -Session $nsSession -Settings $settings -Order $order -Account $account)
                    Write-NSStatusResult -Status OK -Detail "$(@($challengeBindings).Count) binding(s)"

                    Write-NSStatusItem -Label 'Await authorization' -Value $request.CN
                    Wait-NSACMECertificateAuthorization -MainDomain $request.CN -TimeoutSeconds $ValidationTimeout | Out-Null
                    Write-NSStatusResult -Status OK -ShowDuration

                    Write-NSStatusItem -Label 'Finalize order' -Value $request.CN
                    Write-NSACMECertificateLog Info 'ACME' "Finalizing ACME order for $($request.CN)."
                    $null = Submit-OrderFinalize -Order (Get-PAOrder -MainDomain $request.CN -Refresh) -ErrorAction Stop
                    Wait-NSACMECertificateOrderFinal -MainDomain $request.CN -TimeoutSeconds $ValidationTimeout | Out-Null
                    Write-NSStatusResult -Status OK -ShowDuration

                    Write-NSStatusItem -Label 'Download certificate' -Value $request.CN
                    Write-NSACMECertificateLog Info 'ACME' "Downloading ACME certificate artifacts for $($request.CN)."
                    $null = Complete-PAOrder -Order (Get-PAOrder -MainDomain $request.CN -Refresh) -ErrorAction Stop
                    $cert = Get-PACertificate -MainDomain $request.CN -ErrorAction Stop
                    Write-NSStatusResult -Status OK
                }
                $cert = Copy-NSACMECertificateArtifactsToCertDir -Certificate $cert -CertDir $request.CertDir -CommonName $request.CN

                Write-NSStatusItem -Label 'Chain validation' -Value $request.CN
                $chainResult = Test-NSACMECertificateChainValidation -Certificate $cert -PfxSecret $pfxSecret -Mode $settings.CertificateChainValidation -IsProduction:$Production
                if (-not $chainResult.Validated) {
                    $chainSkipReason = if ($settings.CertificateChainValidation -eq 'None') { 'validation disabled' } else { @($chainResult.Status) -join '; ' }
                    Write-NSStatusResult -Status SKIP -Detail $chainSkipReason
                } elseif ($chainResult.IsValid) {
                    Write-NSStatusResult -Status OK -Detail ('{0} chain certificate(s)' -f @($chainResult.Chain).Count)
                } else {
                    # An untrusted root, and the revocation statuses that follow from it, are expected
                    # against a staging CA.
                    $chainDetail = if (-not $Production -and (@($chainResult.Status) -join ' ') -match 'UntrustedRoot') {
                        'staging root untrusted, expected'
                    } else {
                        '{0} issue(s)' -f @($chainResult.Status).Count
                    }
                    Write-NSStatusResult -Status WARN -Detail $chainDetail
                }

                Write-NSStatusItem -Label 'Install on NetScaler' -Value $request.CertKeyNameToUpdate
                $deploy = Install-NSACMECertificateNetScalerCertificate -Session $nsSession -Settings $settings -Request $request -Certificate $cert -PfxSecret $pfxSecret -IsProduction:$Production
                Write-NSACMECertificateLog Debug 'Deploy' "Installed NetScaler certkey '$($deploy.CertKeyName)' from PFX '$($deploy.PfxFileName)'."
                Write-NSStatusResult -Status OK -Detail "certkey $($deploy.CertKeyName)" -ShowDuration
                $x509 = if ($cert.CertFile -and (Test-Path $cert.CertFile)) { [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($cert.CertFile) } else { $null }
                try {
                    # Store Posh-ACME renewal metadata back into generated config files.
                    $completedOrder = Get-PAOrder -MainDomain $request.CN -Refresh -ErrorAction Stop
                    if ($completedOrder.CertExpires) {
                        Set-NSACMECertificateNoteProperty -InputObject $request -Name CertExpires -Value (([datetimeoffset]$completedOrder.CertExpires).UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ', [Globalization.CultureInfo]::InvariantCulture))
                        $configChanged = $true
                    }
                    if ($completedOrder.RenewAfter) {
                        Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewAfter -Value (([datetimeoffset]$completedOrder.RenewAfter).UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ', [Globalization.CultureInfo]::InvariantCulture))
                        $configChanged = $true
                    }
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewalSource -Value 'ACME order'
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name RenewalStrategy -Value 'ACME/Posh-ACME renewal metadata.'
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeProvider -Value $CertificateProvider
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeServer -Value $serverName
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name AcmeRenewalInfoSupported -Value ([bool]((Get-PAServer).renewalInfo -and -not (Get-PAServer).DisableARI))
                    # Superseded by LastIssuedAcmeServer, which is *_PROD or *_STAGE per provider.
                    if ($request.PSObject.Properties.Name -contains 'CurrentCertIsProduction') {
                        $request.PSObject.Properties.Remove('CurrentCertIsProduction')
                    }
                    $configChanged = $true
                } catch {
                    Write-NSACMECertificateLog Debug 'CheckCertRenewal' "Could not update renewal metadata for $($request.CN): $($_.Exception.Message)"
                }
                # Records what this request produced, so a later run on any machine can tell whether
                # the deployed certificate still matches the request. The serial is read back from the
                # appliance so it is directly comparable with what the renewal check reads.
                try {
                    $deployedCertKey = Invoke-NSGetSSLCertKey -Session $nsSession -CertKey $deploy.CertKeyName -ReturnNullOnNotFound -ErrorAction Stop
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name LastIssuedSerial -Value ([string]$deployedCertKey.serial)
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name LastIssuedDomains -Value ((@($domains | Where-Object { $_ } | ForEach-Object { ([string]$_).Trim().ToLowerInvariant() } | Sort-Object -Unique) -join ','))
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name LastIssuedAcmeServer -Value $serverName
                    Set-NSACMECertificateNoteProperty -InputObject $request -Name LastIssuedKeyLength -Value ([string]$request.KeyLength)
                    if ([bool]$request.ForceCertRenew) {
                        Set-NSACMECertificateNoteProperty -InputObject $request -Name ForceCertRenew -Value $false
                        Write-NSACMECertificateLog Info 'ConfigFile' "Cleared ForceCertRenew for $($request.CN) after a successful deploy."
                    }
                    $configChanged = $true
                } catch {
                    Write-NSACMECertificateLog Warning 'ConfigFile' "Could not record the issued certificate details for $($request.CN): $($_.Exception.Message)"
                }
                if ($request.UpdateGlobalVPNCertBinding) {
                    Write-NSStatusItem -Label 'VPN global binding' -Value $deploy.CertKeyName
                    Update-NSACMECertificateGlobalVpnBinding -Session $nsSession -OldCertKeyName $request.CertKeyNameToUpdate -NewCertKeyName $deploy.CertKeyName -IncludeCA:$request.GlobalVPNCertBindingIncludeCA -CaCertKeyName @($deploy.ChainCertKeyName)[0] -CrlCheck $request.GlobalVPNCertBindingCrlCheck -OcspCheck $request.GlobalVPNCertBindingOcspCheck | Out-Null
                    Write-NSStatusResult -Status OK
                }
                if ($request.UpdateIIS) {
                    Write-NSStatusItem -Label 'IIS binding' -Value $request.IISSiteToUpdate
                    try {
                        Update-NSACMECertificateIisBinding -PfxPath $deploy.PfxPath -PfxSecret $pfxSecret -SiteName $request.IISSiteToUpdate | Out-Null
                        Write-NSStatusResult -Status OK
                    } catch {
                        Write-NSACMECertificateLog Warning 'IIS' "UpdateIIS failed: $($_.Exception.Message)"
                        Write-NSStatusResult -Status WARN -Detail $_.Exception.Message
                    }
                }
                if ($request.PostPoSHScriptFilename) {
                    Write-NSStatusItem -Label 'Post script' -Value (Split-Path -Path $request.PostPoSHScriptFilename -Leaf)
                    Request-NSACMECertificatePostScript -ScriptPath $request.PostPoSHScriptFilename -ScriptRoot $scriptRoot -Thumbprint $(if ($x509) { $x509.Thumbprint } else { $cert.Thumbprint }) -PfxPath $deploy.PfxPath -PfxPassword (ConvertFrom-NSACMECertificateLegacySecret -Object $pfxSecret -AsClearText) -ExtraParameters $request.PostPoSHScriptExtraParameters | Out-Null
                    Write-NSStatusResult -Status OK -ShowDuration
                }
                if ($request.CleanExpiredCertsOnDisk) {
                    Write-NSStatusItem -Label 'Clean expired on disk' -Value $request.CertDir
                    Remove-NSACMECertificateExpiredDiskCertificate -CertDir $request.CertDir -Days $request.CleanExpiredCertsOnDiskDays -CN $request.CN | Out-Null
                    Write-NSStatusResult -Status OK
                }
                if ($RemoveUploadedPfx) {
                    Write-NSStatusItem -Label 'Remove uploaded PFX' -Value $deploy.PfxFileName
                    try {
                        Invoke-NSDeleteSystemFile -Session $nsSession -FileName $deploy.PfxFileName -FileLocation '/nsconfig/ssl/' -IgnoreNotFound -Confirm:$false | Out-Null
                        Write-NSStatusResult -Status OK
                    } catch {
                        Write-NSACMECertificateLog Debug 'Deploy' "Uploaded PFX cleanup skipped: $($_.Exception.Message)"
                        Write-NSStatusResult -Status SKIP -Detail $_.Exception.Message
                    }
                }
                if ($request.RemovePrevious -and $Production -and $request.CertKeyNameToUpdate) {
                    Write-NSStatusItem -Label 'Remove previous certkey' -Value $request.CertKeyNameToUpdate
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
                        Write-NSStatusResult -Status OK -Detail $removePreviousResult.Status
                    } catch {
                        Write-NSACMECertificateLog Warning 'Deploy' "RemovePrevious failed for '$($request.CertKeyNameToUpdate)': $($_.Exception.Message)"
                        Write-NSStatusResult -Status WARN -Detail $_.Exception.Message
                    }
                }
                # ECC certificates throw on PublicKey.Key under .NET Framework.
                $publicKeySize = if ($x509) { try { $x509.PublicKey.Key.KeySize } catch { $null } } else { $null }
                $renewAfter = $null
                if ($request.RenewAfter) { try { $renewAfter = [datetime]$request.RenewAfter } catch { $renewAfter = $null } }
                $intermediate = @($chainResult.Chain) | Where-Object { $_ } | Select-Object -First 1
                $result = [PSCustomObject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $deploy.CertKeyName; PfxPath = $deploy.PfxPath; Thumbprint = if ($x509) { $x509.Thumbprint } else { $cert.Thumbprint }; NotAfter = if ($x509) { $x509.NotAfter } else { $null }; RenewAfter = $renewAfter; PublicKeySize = $publicKeySize; CertDir = if ($cert.CertFile) { Split-Path -Parent $cert.CertFile } else { $request.CertDir }; CertFile = $cert.CertFile; KeyFile = $cert.KeyFile; PfxFilePath = $cert.PfxFile; PfxFullChainPath = $cert.PfxFullChain; IntermediateName = if ($intermediate) { if ($intermediate.Subject -match 'CN=([^,]+)') { $Matches[1] } else { $intermediate.Subject } } else { $null }; IntermediateNotAfter = if ($intermediate) { $intermediate.NotAfter } else { $null }; IntermediateCertKeyName = @($deploy.ChainCertKeyName | Where-Object { $_ }); Status = 'Success'; LogFile = $script:NSACMECertificateLogFile }
                $results += $result
                Write-NSACMECertificateLog Info 'Result' "Finished certificate request for $($request.CN); NetScaler certkey: $($deploy.CertKeyName)."
            } catch {
                # No-op when the last item already got its status.
                Write-NSStatusResult -Status FAIL -ErrorRecord $_
                Write-NSACMECertificateLog Error 'Result' "Failed certificate request for $($request.CN): $($_.Exception.Message)"
                Write-NSACMECertificateErrorDetail -ErrorRecord $_ -Component 'Result'
                $allErrors += $_
                $results += [PSCustomObject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $request.CertKeyNameToUpdate; PfxPath = $null; Thumbprint = $null; NotAfter = $null; Status = 'Failed'; Reason = $_.Exception.Message; LogFile = $script:NSACMECertificateLogFile }
                if ($StopOnError) { throw }
            } finally {
                # Per-order challenge bindings are short-lived; reusable HTTP objects are cleaned after all requests.
                if (@($challengeBindings).Count -gt 0) {
                    Write-NSStatusItem -Label 'Remove challenge bindings' -Value "$(@($challengeBindings).Count) binding(s)"
                    Remove-NSACMECertificateHttpChallengeBinding -Session $nsSession -ChallengeBindings $challengeBindings -Settings $settings
                    Write-NSStatusResult -Status OK
                } else {
                    Remove-NSACMECertificateHttpChallengeBinding -Session $nsSession -ChallengeBindings $challengeBindings -Settings $settings
                }
                if ($requestVipEnabled -and $request.ValidationMethod -eq 'http' -and $request.DisableVipAfter) {
                    foreach ($csVip in @($request.CsVipName | Where-Object { $_ })) {
                        $stateBefore = Get-NSACMECertificateVServerState -Session $nsSession -Name $csVip -Type 'CS'
                        Write-NSStatusItem -Label 'Disable CS vServer' -Value $csVip
                        try { Invoke-NSDisableCSVServer -Session $nsSession -Name $csVip | Out-Null } catch { Write-NSACMECertificateLog Warning 'NetScaler' "Could not disable CS VIP $csVip`: $($_.Exception.Message)" }
                        $stateAfter = Get-NSACMECertificateVServerState -Session $nsSession -Name $csVip -Type 'CS'
                        Write-NSStatusResult -Status OK -Detail ('{0} -> {1}' -f $stateBefore.Text, $stateAfter.Text)
                    }
                }
            }
        }
        } finally {
            if ($httpValidationConfigInitialized) {
                Write-NSStatusSection -Title 'Cleanup'
                $cleanupSectionWritten = $true
                Write-NSStatusItem -Label 'Remove validation objects' -Value ($httpValidationCleanupCsVipNames -join ', ')
                Write-NSACMECertificateLog Info 'Cleanup' 'Removing reusable NetScaler HTTP validation objects.'
                Remove-NSACMECertificateHttpValidationConfig -Session $nsSession -Settings $settings -CsVipName $httpValidationCleanupCsVipNames | Out-Null
                Write-NSStatusResult -Status OK
            }
        }
        if (-not $cleanupSectionWritten -and ($settings.SendMail -or ($ConfigFile -and $configChanged))) {
            Write-NSStatusSection -Title 'Cleanup'
            $cleanupSectionWritten = $true
        }
        if ($settings.SendMail) {
            Write-NSStatusItem -Label 'Send mail' -Value ($settings.SMTPTo -join ', ')
            $subjectStatus = if ($allErrors.Count -gt 0) { 'failed' } else { 'completed' }
            $body = ($results | Format-List | Out-String)
            Send-NSACMECertificateMail -Settings $settings -Subject "Request-NSACMECertificate $subjectStatus" -Body $body -LogFile $script:NSACMECertificateLogFile
            Write-NSStatusResult -Status OK
        }
        if ($ConfigFile -and $configChanged) {
            Write-NSStatusItem -Label 'Save config file' -Value (Split-Path -Path $ConfigFile -Leaf)
            try {
                $configAction = if ($AutoRun) { 'updated renewal metadata' } else { 'request configuration' }
                Write-NSACMECertificateLog Info 'ConfigFile' "Saving $configAction to '$ConfigFile'."
                $configDirectory = Split-Path -Path $ConfigFile -Parent
                if (-not [string]::IsNullOrWhiteSpace($configDirectory) -and -not (Test-Path -LiteralPath $configDirectory)) {
                    New-Item -ItemType Directory -Path $configDirectory -Force | Out-Null
                }

                # Merge into the file as it stands now rather than overwriting with the copy loaded at
                # run start, so an edit made during the run, or by another runner, is not discarded.
                $configToSave = $config
                $saveDetail = $configAction
                if ($AutoRun -and (Test-Path -LiteralPath $ConfigFile)) {
                    $ownedFields = @(
                        'CertExpires', 'RenewAfter', 'RenewalSource', 'RenewalStrategy',
                        'AcmeProvider', 'AcmeServer', 'AcmeRenewalInfoSupported',
                        'LastIssuedSerial', 'LastIssuedDomains', 'LastIssuedAcmeServer', 'LastIssuedKeyLength',
                        'ForceCertRenew'
                    )
                    $retiredFields = @('CurrentCertIsProduction')
                    try {
                        $currentConfig = Get-Content -LiteralPath $ConfigFile -Raw | ConvertFrom-Json
                        foreach ($processedRequest in $requests) {
                            $targetRequest = @($currentConfig.certrequests | Where-Object { $_.CN -eq $processedRequest.CN }) | Select-Object -First 1
                            if (-not $targetRequest) { continue }
                            foreach ($ownedField in $ownedFields) {
                                if ($processedRequest.PSObject.Properties.Name -contains $ownedField) {
                                    Set-NSACMECertificateNoteProperty -InputObject $targetRequest -Name $ownedField -Value $processedRequest.$ownedField
                                }
                            }
                            foreach ($retiredField in $retiredFields) {
                                if ($targetRequest.PSObject.Properties.Name -contains $retiredField) {
                                    $targetRequest.PSObject.Properties.Remove($retiredField)
                                }
                            }
                        }
                        $configToSave = $currentConfig
                    } catch {
                        Write-NSACMECertificateLog Warning 'ConfigFile' "Could not merge into the current config file, writing this run's copy instead: $($_.Exception.Message)"
                        $saveDetail = "$configAction (not merged)"
                    }
                }
                if ($configToSave.settings.PSObject.Properties.Name -contains 'SMTPCredential') {
                    $configToSave.settings.PSObject.Properties.Remove('SMTPCredential')
                }

                # Write through a temp file and keep one backup, so a failed or partial write cannot
                # leave an unusable config behind for every machine that reads it.
                $tempConfigFile = "$ConfigFile.tmp"
                $configToSave | ConvertTo-Json -Depth 20 | Out-File -LiteralPath $tempConfigFile -Encoding Unicode -Force
                if (Test-Path -LiteralPath $ConfigFile) {
                    Copy-Item -LiteralPath $ConfigFile -Destination "$ConfigFile.bak" -Force
                }
                Move-Item -LiteralPath $tempConfigFile -Destination $ConfigFile -Force
                Write-NSStatusResult -Status OK -Detail $saveDetail
            } catch {
                Write-NSACMECertificateLog Warning 'ConfigFile' "Could not save config file '$ConfigFile': $($_.Exception.Message)"
                Write-NSStatusResult -Status WARN -Detail $_.Exception.Message
            }
        }
        if ($NoConsoleOutput) {
            $results
        } else {
            Write-NSACMECertificateResultSummary -Results $results
            Write-NSStatusSummary -Title 'Run summary'
        }
    }
}

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCClIGT7bcdFm8WX
# rxWkUFQvMq9NIozCDKRIsG5CQw7+aqCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
# lUgTecgRwIeZMA0GCSqGSIb3DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVu
# dGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAy
# MDAeFw0yMDA0MTYxODM2MTZaFw00NTA0MTYxODQ0NDBaMHcxCzAJBgNVBAYTAlVT
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jv
# c29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRo
# b3JpdHkgMjAyMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALORKgeD
# Bmf9np3gx8C3pOZCBH8Ppttf+9Va10Wg+3cL8IDzpm1aTXlT2KCGhFdFIMeiVPvH
# or+Kx24186IVxC9O40qFlkkN/76Z2BT2vCcH7kKbK/ULkgbk/WkTZaiRcvKYhOuD
# PQ7k13ESSCHLDe32R0m3m/nJxxe2hE//uKya13NnSYXjhr03QNAlhtTetcJtYmrV
# qXi8LW9J+eVsFBT9FMfTZRY33stuvF4pjf1imxUs1gXmuYkyM6Nix9fWUmcIxC70
# ViueC4fM7Ke0pqrrBc0ZV6U6CwQnHJFnni1iLS8evtrAIMsEGcoz+4m+mOJyoHI1
# vnnhnINv5G0Xb5DzPQCGdTiO0OBJmrvb0/gwytVXiGhNctO/bX9x2P29Da6SZEi3
# W295JrXNm5UhhNHvDzI9e1eM80UHTHzgXhgONXaLbZ7LNnSrBfjgc10yVpRnlyUK
# xjU9lJfnwUSLgP3B+PR0GeUw9gb7IVc+BhyLaxWGJ0l7gpPKWeh1R+g/OPTHU3mg
# trTiXFHvvV84wRPmeAyVWi7FQFkozA8kwOy6CXcjmTimthzax7ogttc32H83rwjj
# O3HbbnMbfZlysOSGM1l0tRYAe1BtxoYT2v3EOYI9JACaYNq6lMAFUSw0rFCZE4e7
# swWAsk0wAly4JoNdtGNz764jlU9gKL431VulAgMBAAGjVDBSMA4GA1UdDwEB/wQE
# AwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTIftJqhSobyhmYBAcnz1AQ
# T2ioojAQBgkrBgEEAYI3FQEEAwIBADANBgkqhkiG9w0BAQwFAAOCAgEAr2rd5hnn
# LZRDGU7L6VCVZKUDkQKL4jaAOxWiUsIWGbZqWl10QzD0m/9gdAmxIR6QFm3FJI9c
# Zohj9E/MffISTEAQiwGf2qnIrvKVG8+dBetJPnSgaFvlVixlHIJ+U9pW2UYXeZJF
# xBA2CFIpF8svpvJ+1Gkkih6PsHMNzBxKq7Kq7aeRYwFkIqgyuH4yKLNncy2RtNwx
# AQv3Rwqm8ddK7VZgxCwIo3tAsLx0J1KH1r6I3TeKiW5niB31yV2g/rarOoDXGpc8
# FzYiQR6sTdWD5jw4vU8w6VSp07YEwzJ2YbuwGMUrGLPAgNW3lbBeUU0i/OxYqujY
# lLSlLu2S3ucYfCFX3VVj979tzR/SpncocMfiWzpbCNJbTsgAlrPhgzavhgplXHT2
# 6ux6anSg8Evu75SjrFDyh+3XOjCDyft9V77l4/hByuVkrrOj7FjshZrM77nq81YY
# uVxzmq/FdxeDWds3GhhyVKVB0rYjdaNDmuV3fJZ5t0GNv+zcgKCf0Xd1WF81E+Al
# GmcLfc4l+gcK5GEh2NQc5QfGNpn0ltDGFf5Ozdeui53bFv0ExpK91IjmqaOqu/dk
# ODtfzAzQNb50GQOmxapMomE2gj4d8yu8l13bS3g7LfU772Aj6PXsCyM2la+YZr9T
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAATfMuDq
# zV60pQpVAAAABN8yMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQwHhcNMjYwODE1MjAxNzA0WhcNMjYwODE4
# MjAxNzA0WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAiZBf/l2RqJyJ+1+4okn6GNfE
# iw/Kq7cMh8aXc5cazPlH2fN8jJzabqNNqBfrLZp3UWIGLvCYAHOpOEu1gavAdrJa
# osXyJophs9z4wR/AKKszZanZ+A5+oofL7D1NwIKsA7X2RMJSlPWBGn9fTPx/4TU+
# LtQaRzg9RoZjJanDSIHPx2PYAQGkw3XsXfiQRpjcvIfRAtSDC4VtD8OZ6/tsmaou
# TDY/ACLgyMTtUthzekFUjHfEnz5yGVWPOKd8Ch62TM2Dg0PEiJbtwtYOH6f22iN2
# telegUdXsvl7MGjbQU4rSQ176ON3/GgAkOe1ZDK7ykdNRVBuHPx8dIlnR6qGyXhb
# ChmI8Tuh2vy3ak3MppLhI+TIn2znPZg/2ysv+ZM2lVJOBmsYPkrJAm6YuJENNN5b
# LbpaEMk94XQvDwwWMV5FzaK+HhmCK7K1xcqB1+kInx433VYUIYGqCLSZiOQJyA0+
# EUK+PLgFfvwjU82iy9j1pfQh54flH1wvwYBAg86vAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# ZFuWNZpkA8KtQxPIXw67POaVNIcwHwYDVR0jBBgwFoAUayVB3vtrfP0YgAotf492
# XapzPbgwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwNC5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDQuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAKno
# dx/TzwuGuRRzvIQ5C0v0LlvWY8T1yEhoLehulqNLVrzfLVU0Lj3O9k3nmXeaj7qF
# Oq/J5aNxssX2bB5NSWLvrlOrkZ7cdVSJ/SyDCn6Wtvt24d21J7Oc3USzyLQlngZ1
# QwtahcowVJE+mE+0/Z4CU3ZLtIA+6C9doK4TovCJfadbBiBI9jxI2UsoD2p0b0Ec
# Nlpyc/rbThZxQc/lQNAQxRsb6I5eWa7DG+JsRxyHA+d8RwhrAJg8avHtDdJNuZ8r
# P7C6d+71Cf6EVG9rh2bsVBkELD/FtC+zdUsNjp1vVFHtHMJhl0UjerXrEmJ23bW2
# FhWI51GRm1aXTwt9rbXxveH/9fx7EaFipgS+hCYF/gFGyUhuJLzY34CdRNXTdTSg
# st2JqFNHLeHlNNV2g704nD+0RX4HaZjumk+60mbRFVyzGITDvjTWRBHJVfoelaxi
# 0xO9zU83xOyVzpi9ECBdqXxdda6blKbMIzaqQv4rx1EPWqhkI1fUNRnXR6vZ56Bc
# lNSnpzevptJmQU7K3RV9A6Ld3qSvTEmjvBOQnjygFrVokSBh+SO9Dc/6GRi3v7CU
# dRQrcFXt8EiMm9dP2ZnWAqe/djm5VtxI6IpDSl8H6Z3cwpdC1ThnZ+uZgxKZcsET
# XgXsf7DcU119x6GbgvQi2TaKVG4kPG3F6BJmerTEMIIGwDCCBKigAwIBAgITMwAE
# 3zLg6s1etKUKVQAAAATfMjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDA0MB4XDTI2MDgxNTIwMTcwNFoXDTI2
# MDgxODIwMTcwNFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAImQX/5dkaiciftfuKJJ
# +hjXxIsPyqu3DIfGl3OXGsz5R9nzfIyc2m6jTagX6y2ad1FiBi7wmABzqThLtYGr
# wHayWqLF8iaKYbPc+MEfwCirM2Wp2fgOfqKHy+w9TcCCrAO19kTCUpT1gRp/X0z8
# f+E1Pi7UGkc4PUaGYyWpw0iBz8dj2AEBpMN17F34kEaY3LyH0QLUgwuFbQ/Dmev7
# bJmqLkw2PwAi4MjE7VLYc3pBVIx3xJ8+chlVjzinfAoetkzNg4NDxIiW7cLWDh+n
# 9tojdrXpXoFHV7L5ezBo20FOK0kNe+jjd/xoAJDntWQyu8pHTUVQbhz8fHSJZ0eq
# hsl4WwoZiPE7odr8t2pNzKaS4SPkyJ9s5z2YP9srL/mTNpVSTgZrGD5KyQJumLiR
# DTTeWy26WhDJPeF0Lw8MFjFeRc2ivh4ZgiuytcXKgdfpCJ8eN91WFCGBqgi0mYjk
# CcgNPhFCvjy4BX78I1PNosvY9aX0IeeH5R9cL8GAQIPOrwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFGRbljWaZAPCrUMTyF8OuzzmlTSHMB8GA1UdIwQYMBaAFGslQd77a3z9GIAK
# LX+Pdl2qcz24MGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDQuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDA0LmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQCp6Hcf088LhrkUc7yEOQtL9C5b1mPE9chIaC3obpajS1a83y1VNC49zvZN55l3
# mo+6hTqvyeWjcbLF9mweTUli765Tq5Ge3HVUif0sgwp+lrb7duHdtSeznN1Es8i0
# JZ4GdUMLWoXKMFSRPphPtP2eAlN2S7SAPugvXaCuE6LwiX2nWwYgSPY8SNlLKA9q
# dG9BHDZacnP6204WcUHP5UDQEMUbG+iOXlmuwxvibEcchwPnfEcIawCYPGrx7Q3S
# TbmfKz+wunfu9Qn+hFRva4dm7FQZBCw/xbQvs3VLDY6db1RR7RzCYZdFI3q16xJi
# dt21thYViOdRkZtWl08Lfa218b3h//X8exGhYqYEvoQmBf4BRslIbiS82N+AnUTV
# 03U0oLLdiahTRy3h5TTVdoO9OJw/tEV+B2mY7ppPutJm0RVcsxiEw7401kQRyVX6
# HpWsYtMTvc1PN8Tslc6YvRAgXal8XXWum5SmzCM2qkL+K8dRD1qoZCNX1DUZ10er
# 2eegXJTUp6c3r6bSZkFOyt0VfQOi3d6kr0xJo7wTkJ48oBa1aJEgYfkjvQ3P+hkY
# t7+wlHUUK3BV7fBIjJvXT9mZ1gKnv3Y5uVbcSOiKQ0pfB+md3MKXQtU4Z2frmYMS
# mXLBE14F7H+w3FNdfcehm4L0Itk2ilRuJDxtxegSZnq0xDCCBygwggUQoAMCAQIC
# EzMAAAAWMZKNkgJle5oAAAAAABYwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMjlaFw0zMTAzMjYxODExMjlaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDKVfrI2+gJMM/0bQ5OVKNdvOASzLbUUMvXuf+Vl7YGuofPaZHVo3gMHF5i
# nT+GMSpIcfIZ9qtXU1UG68ry8vNbQtOL4Nm30ifXpqI1+ByiAWLO1YT0WnzG7XPO
# uoTeeWsNZv5FmjxCsReBZvyzyzCyXZbu1EQfJxWTH4ebUwtAiW9rqMf9eDj/wYhi
# EfNteJV3ZFeibD2ztCHr9JhFdd97XbnCHgQoTIqc02X5xlRKtUGBa++OtHBBjiJ/
# uwBnzTkqu4FjpZjQeJtrmda+ur1CT2jflWIB/ypn7u7V9tvW9wJbJYt/H2EtJ0GO
# NWxJZ7TEu8jWPindOO3lzPP7UtzS/mVDV94HucWaltmsra6zSG8BoEJ87IM8QSb7
# vfm/O41FhYkUv89WIj5ES2O4kxyiMSfe95CMivCuYrRP2hKvx7egPMrWgDDBkxML
# grKZO9hRNUMm8vk3w5b9SogHOyJVhxyFm8aFXfIxgqDF4S0g4bhbhnzljmSlCLlu
# mMZcXFGDjpF2tNoAu3VGFGYtHtTSNVKvZpgB3b4ynaoDkbPf+Wg4523jt4VneasB
# gZhC1srZI2NCnCBBfgjLq04pqEKAWEohyW2K29KSkkHvt5VaE1ac3Yt+oyiOzMS5
# 7tXwQDJLGvLg/OXFO0VNvczDndfIfXYExB/ab2PuMSwd5VIBOwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRr
# JUHe+2t8/RiACi1/j3ZdqnM9uDBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQAG1VBeVHTVRBljlcZD3IiMxwPyMjQyLNaEnVu5mODm2hRB
# JfH8GsBLATmrHAc8F47jmk5CnpUPiIguCbw6Z/KVj4Dsoiq228NSLMLewFfGMri7
# uwNGLISC5ccp8vUdADDEIsS2dE+QI9OwkDpv3XuUD7d+hAgcLVcMOl1AsfEZtsZe
# nhGvSYUrm/FuLq0BqEGL9GXM5c+Ho9q8o+Vn/S+GWQN2y+gkRO15s0kI05nUpq/d
# OD4ri9rgVs6tipEd0YZqGgD+CZNiaZWrDTOQbNPncd2F9qOsUa20miYruoT5PwJA
# aI+QQiTE2ZJeMJOkOpzhTUgqVMZwZidEUZKCqudaeQA08WwnkQMfKyHzaU8j48UL
# cU4hUwvMsv7fSurOe9GAdRQCPvF8WcSK5oDHe8VVJM4tv6KKCm91HqLx9JamBgRI
# 6R2SfY3nu26EGznu0rCg/769z8xWm4PVcC2ZaL6VlKVqFp1NsN8YqMyf5t+bbGVb
# 09noFKcJG/UwyGlxRmQBlfeBUQx5/ytlzZzsEnhrJF9fTAfje8j3OdX5lEnePTFQ
# LRlvzZFBqUXnIeQKv3fHQjC9m2fo/Z01DII/qp3d8LhGVUW0BCG04fRwHJNH8iqq
# CG/qofMv+kym2AxBDnHzNgRjL60JOFiBgiurvLhYQNhB95KWojFA6shQnggkMTCC
# B54wggWGoAMCAQICEzMAAAAHh6M0o3uljhwAAAAAAAcwDQYJKoZIhvcNAQEMBQAw
# dzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjFI
# MEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBSb290IENl
# cnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIxMDQwMTIwMDUyMFoXDTM2MDQw
# MTIwMTUyMFowYzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjE0MDIGA1UEAxMrTWljcm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2ln
# bmluZyBQQ0EgMjAyMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALLw
# wK8ZiCji3VR6TElsaQhVCbRS/3pK+MHrJSj3Zxd3KU3rlfL3qrZilYKJNqztA9OQ
# acr1AwoNcHbKBLbsQAhBnIB34zxf52bDpIO3NJlfIaTE/xrweLoQ71lzCHkD7A4A
# s1Bs076Iu+mA6cQzsYYH/Cbl1icwQ6C65rU4V9NQhNUwgrx9rGQ//h890Q8JdjLL
# w0nV+ayQ2Fbkd242o9kH82RZsH3HEyqjAB5a8+Ae2nPIPc8sZU6ZE7iRrRZywRmr
# KDp5+TcmJX9MRff241UaOBs4NmHOyke8oU1TYrkxh+YeHgfWo5tTgkoSMoayqoDp
# HOLJs+qG8Tvh8SnifW2Jj3+ii11TS8/FGngEaNAWrbyfNrC69oKpRQXY9bGH6jn9
# NEJv9weFxhTwyvx9OJLXmRGbAUXN1U9nf4lXezky6Uh/cgjkVd6CGUAf0K+Jw+GE
# /5VpIVbcNr9rNE50Sbmy/4RTCEGvOq3GhjITbCa4crCzTTHgYYjHs1NbOc6brH+e
# KpWLtr+bGecy9CrwQyx7S/BfYJ+ozst7+yZtG2wR461uckFu0t+gCwLdN0A6cFtS
# RtR8bvxVFyWwTtgMMFRuBa3vmUOTnfKLsLefRaQcVTgRnzeLzdpt32cdYKp+dhr2
# ogc+qM6K4CBI5/j4VFyC4QFeUP2YAidLtvpXRRo3AgMBAAGjggI1MIICMTAOBgNV
# HQ8BAf8EBAMCAYYwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFNlBKbAPD2Ns
# 72nX9c0pnqRIajDmMFQGA1UdIARNMEswSQYEVR0gADBBMD8GCCsGAQUFBwIBFjNo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5o
# dG0wGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBTIftJqhSobyhmYBAcnz1AQT2ioojCBhAYDVR0fBH0wezB5oHeg
# dYZzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0
# JTIwSWRlbnRpdHklMjBWZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUl
# MjBBdXRob3JpdHklMjAyMDIwLmNybDCBwwYIKwYBBQUHAQEEgbYwgbMwgYEGCCsG
# AQUFBzAChnVodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01p
# Y3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0aW9uJTIwUm9vdCUyMENlcnRp
# ZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcnQwLQYIKwYBBQUHMAGGIWh0dHA6
# Ly9vbmVvY3NwLm1pY3Jvc29mdC5jb20vb2NzcDANBgkqhkiG9w0BAQwFAAOCAgEA
# fyUqnv7Uq+rdZgrbVyNMul5skONbhls5fccPlmIbzi+OwVdPQ4H55v7VOInnmezQ
# EeW4LqK0wja+fBznANbXLB0KrdMCbHQpbLvG6UA/Xv2pfpVIE1CRFfNF4XKO8XYE
# a3oW8oVH+KZHgIQRIwAbyFKQ9iyj4aOWeAzwk+f9E5StNp5T8FG7/VEURIVWArbA
# zPt9ThVN3w1fAZkF7+YU9kbq1bCR2YD+MtunSQ1Rft6XG7b4e0ejRA7mB2IoX5hN
# h3UEauY0byxNRG+fT2MCEhQl9g2i2fs6VOG19CNep7SquKaBjhWmirYyANb0RJSL
# WjinMLXNOAga10n8i9jqeprzSMU5ODmrMCJE12xS/NWShg/tuLjAsKP6SzYZ+1Ry
# 358ZTFcx0FS/mx2vSoU8s8HRvy+rnXqyUJ9HBqS0DErVLjQwK8VtsBdekBmdTbQV
# oCgPCqr+PDPB3xajYnzevs7eidBsM71PINK2BoE2UfMwxCCX3mccFgx6UsQeRSdV
# VVNSyALQe6PT12418xon2iDGE81OGCreLzDcMAZnrUAx4XQLUz6ZTl65yPUiOh3k
# 7Yww94lDf+8oG2oZmDh5O1Qe38E+M3vhKwmzIeoB1dVLlz4i3IpaDcR+iuGjH2Td
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcyMIIXLgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABN8y
# 4OrNXrSlClUAAAAE3zIwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQg6F4w
# lqkyyDymzzjBjhSEkJx1VZ2rK0IsvtG79bUG1HkwDQYJKoZIhvcNAQEBBQAEggGA
# IlaD/AoFTXBEB8APHeDCPqsk7HmpYkHoI8SJIof5DasnbqH+mHvR/GhZZKDME41d
# K0fssLD2j0I3zGOaFKevz0ATAekyanjI9hpnwbuxLwUJ/xLuigl3Pk6AqR73XGxE
# F+HwqdI8QlmoIUIt3xjlzHj8vLR0QKrtNRer6WbXMUA2qcIZUGXrXkL316BbQ1ip
# fqwvPRfL18/VUd7To+6H5il4otl+lgyU3f82yOqsdg5qlgGmlLOlM+jPVIlBMvEF
# +sFAoySaUXGyU/ZHMUwUPnL0PlsCEV1bzJlEDSc8uabtK0SOBwJt83bdL20tWaTC
# hvITrrmaAFBgXdbq2RaP08bjUcVNxxcHCOjR5/gEBTqkbmeY4x27b55yeK2SkDYY
# YD45g3UE43SCPtN3xEHjA67Wxagx0zLnBkFEtZwucXzB8hDj0a67kmdPf6m9o10X
# otIbueZ7V73SLZTYLcpz/Tx8oX8ispwRTEUK1Of3y4SZY0vzYbS2vMtIxee8jtIj
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIL+vwnKWaayQkMqxNtBd
# 8s9ISCQdvbGRu9ULPXC6Z7SlAgZqNTCDe/YYEzIwMjYwODE3MTQzMjI3LjA0N1ow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYD
# VQQDEyxNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0
# eaCCDykwggeCMIIFaqADAgECAhMzAAAABeXPD/9mLsmHAAAAAAAFMA0GCSqGSIb3
# DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24g
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAyMDAeFw0yMDExMTkyMDMyMzFa
# Fw0zNTExMTkyMDQyMzFaMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRp
# bWVzdGFtcGluZyBDQSAyMDIwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEAnnznUmP94MWfBX1jtQYioxwe1+eXM9ETBb1lRkd3kcFdcG9/sqtDlwxKoVIc
# aqDb+omFio5DHC4RBcbyQHjXCwMk/l3TOYtgoBjxnG/eViS4sOx8y4gSq8Zg49RE
# Af5huXhIkQRKe3Qxs8Sgp02KHAznEa/Ssah8nWo5hJM1xznkRsFPu6rfDHeZeG1W
# a1wISvlkpOQooTULFm809Z0ZYlQ8Lp7i5F9YciFlyAKwn6yjN/kR4fkquUWfGmMo
# pNq/B8U/pdoZkZZQbxNlqJOiBGgCWpx69uKqKhTPVi3gVErnc/qi+dR8A2MiAz0k
# N0nh7SqINGbmw5OIRC0EsZ31WF3Uxp3GgZwetEKxLms73KG/Z+MkeuaVDQQheang
# OEMGJ4pQZH55ngI0Tdy1bi69INBV5Kn2HVJo9XxRYR/JPGAaM6xGl57Ei95HUw9N
# V/uC3yFjrhc087qLJQawSC3xzY/EXzsT4I7sDbxOmM2rl4uKK6eEpurRduOQ2hTk
# mG1hSuWYBunFGNv21Kt4N20AKmbeuSnGnsBCd2cjRKG79+TX+sTehawOoxfeOO/j
# R7wo3liwkGdzPJYHgnJ54UxbckF914AqHOiEV7xTnD1a69w/UTxwjEugpIPMIIE6
# 7SFZ2PMo27xjlLAHWW3l1CEAFjLNHd3EQ79PUr8FUXetXr0CAwEAAaOCAhswggIX
# MA4GA1UdDwEB/wQEAwIBhjAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQUa2ko
# OjUvSGNAz3vYr0npPtk92yEwVAYDVR0gBE0wSzBJBgRVHSAAMEEwPwYIKwYBBQUH
# AgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0
# b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMA
# dQBiAEMAQTAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFMh+0mqFKhvKGZgE
# ByfPUBBPaKiiMIGEBgNVHR8EfTB7MHmgd6B1hnNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZlcmlmaWNh
# dGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIwMjAuY3Js
# MIGUBggrBgEFBQcBAQSBhzCBhDCBgQYIKwYBBQUHMAKGdWh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwSWRlbnRpdHklMjBW
# ZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUlMjBBdXRob3JpdHklMjAy
# MDIwLmNydDANBgkqhkiG9w0BAQwFAAOCAgEAX4h2x35ttVoVdedMeGj6TuHYRJkl
# FaW4sTQ5r+k77iB79cSLNe+GzRjv4pVjJviceW6AF6ycWoEYR0LYhaa0ozJLU5Yi
# +LCmcrdovkl53DNt4EXs87KDogYb9eGEndSpZ5ZM74LNvVzY0/nPISHz0Xva71Qj
# D4h+8z2XMOZzY7YQ0Psw+etyNZ1CesufU211rLslLKsO8F2aBs2cIo1k+aHOhrw9
# xw6JCWONNboZ497mwYW5EfN0W3zL5s3ad4Xtm7yFM7Ujrhc0aqy3xL7D5FR2J7x9
# cLWMq7eb0oYioXhqV2tgFqbKHeDick+P8tHYIFovIP7YG4ZkJWag1H91KlELGWi3
# SLv10o4KGag42pswjybTi4toQcC/irAodDW8HNtX+cbz0sMptFJK+KObAnDFHEsu
# kxD+7jFfEV9Hh/+CSxKRsmnuiovCWIOb+H7DRon9TlxydiFhvu88o0w35JkNbJxT
# k4MhF/KgaXn0GxdH8elEa2Imq45gaa8D+mTm8LWVydt4ytxYP/bqjN49D9NZ81co
# E6aQWm88TwIf4R4YZbOpMKN0CyejaPNN41LGXHeCUMYmBx3PkP8ADHD1J2Cr/6tj
# uOOCztfp+o9Nc+ZoIAkpUcA/X2gSMkgHAPUvIdtoSAHEUKiBhI6JQivRepyvWcl+
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAWvYNZ4yF7d0IAAAAAABaMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwM1oXDTI3MDEwNzE4NTkwM1ow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAO/0O0eWjgUb9rnHcQLRdfWPN4H+91a3Ynla
# P46E1m4uD+JKx6csWMStX79fxLJUAqHJqQWE19UlNMhS9jEB32dAJ4yuWsHyUuM+
# dphjDz4E5jl4gYGZEmaOrKvNt+KqlFayyg/oTg3BlLRu4aBq8668A5qlHcfsuh6D
# dSqFID1ixJFZzHrZFG1iGBG7U1Bn2ONLDo7jbwX5rMcPduTAUw/c7M3WhSxQBuZp
# Qiz8RQGKIqCKfIxgQkKdzpCpU0SWQOE/DgTXbz3c15KMRCdkGlL2zb+lnuSV4sse
# Qm3qflZiZckLyn2xJI8ZXDkq+Ig+b/rsPPIfI8di228WvK1j67JXpyeVCaSUO9Er
# zlLnTrnjQkeXVQIp73xuVBVrmvoTf/v4a7MnrmuKSyIXc5vJUHEGB345+O8omFt1
# w8b+Xg9D9PKIRqDPEv7HRk0C+Yvxu8FvHJvSocSIZK+v/FmKFOipYnpP76yAmJNn
# yheucShOgk8QiU53USn/+AyMb7xW905gZnyNqb29HeVdQ175pDHJGEz8Cx5wiHeV
# liGz5hABucFDylR9z3LSTmB6+3ZuIxeG9BZS46P6ANPkuVuD5m8wgc7GLLzg73Cs
# DF09ukt8Uf8dTcMBX3ro+7/k9M6Xt8WPG7IL9v/4DvyMY03tkb9Y9Ri6HWavXRPY
# RCUePspPAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQUjmOyQ6twMcP1ZbRytJxI4fnX
# mcIwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQCAlM8r+t3hIb2h1lDTAx+iYkQlxFuU7QONeyIFIBZ29xvG
# l8pehKxErDzIniOpIX/eluUAwQKoaI0zwuKAdR0mrSHXCniMoLNko5W+5r7sXNam
# KX7QMV3BfGOX3gi9qVfxyUe7AHXbqQ8KBQHNYCnNFtQQHgARrlYhtyAKol5ctM0C
# Ac/y3oY7bTMsVJvnA5u7DVWPeXoST2KEMDeLBvJYq0IJZ6yMpDOWLZ4UP82bksyS
# hIB/XdawirIGLdseudryRxVMk313mAcjGRb59+Ittt6otVvYQWqH+PGrTUzEcez8
# aQuO3umoNZjKuFoX5VsPP/gSZse+orhG3zfZk9IDyE3DfUFrhvkv6H0tijK1D0uI
# GhwMBWSm9ktQ6oeU+aurZFx3MI+LODnHsbRFZAy11uMvwKq+ZNC1Se4tIM1u9piW
# AhnTPoh6mULKikHOVhHaO953tkzDCtjsse5GUKOx9yg9nqHKWMgnODp62/uPPzC/
# yDEISrXCcU7UB7tATr3zWNEdtM4d009iXWI6dV/SdcIIX44rpoLyCLw+nXjxp+fY
# /dygLO7UdSQaVaUFVj3K2nVyuujPspt5Lunc5FvuYPqmi/z8kASmmwbiF+W0P0UT
# WFaC84MWfU2h6MDg5s0oxmdNFK76jXr3wZfdSoV7FCKfq5GdeGoy5UwDQwMC0DGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABa9g1njIXt3QgAAAAAAFowDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQguJAhgUtQfwXFnBUZMs1nEMukk3CDI/T+rqrZ8l2LyRkwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCAgqtjeG80BojCocMwl
# 1STFmFHvyPwfAlK5TQwYKigjgjANBgkqhkiG9w0BAQsFAASCAgDdtDmPoF3bf8as
# XAhEsYTYi8s3c9yVmENZlM8E09Y+pD5DHicEapyXB5BmMXfOfIkpQhi65yyJkSEC
# 7mk/NpI5pUj85iTJ1V33F5/qx7pQO4IwMk3zwd7/b/cx2zYBETxfQTdIM6INM4BZ
# CW9am01lwXHbyrRPojT5MvnVcuuUFi3f7sbfxVk01cw2dlU/X+wY4W/ME5sysn49
# +rG30Z5Z5ZPKC/0BYXe3WrY7xeNA92nD6ERySNbSHONLLTPD2vs2nFcUZukzXEBI
# qXeup5PL9/eD8N7cLajDQfxlE0BbD7pjghgamsgymVtu6wgHMgnnQrBnY4+oA1iG
# Q43VQbA7s/6fidVPWIob7tMroL6TQVqThtylWKfSCmpDCY0R5WPGL60pdOowMxIX
# 0IEJb2kEDwop82q890iABmbS2Ak8A9vH0D19+eAiReESgSpZgvPIP7bXAt7ol0ex
# uVfKDTBZd5SyDu5Whb0kNYDgTmj4uN/tBsosfViBUNoFM3i2uAcsub4ohabH7FTf
# 18elBj+ZUwAk21MNM76LCpXljpBxuiqYqeTjGGXIdfrB18K8dIk3PRQwyBqmrKZJ
# N+ayQcbQ3LFhCZpZKxBHvzhYqLQABvXeTNxj/9WSK/XKfFT2l2FZcOdgkbKEp0/7
# kqeIwtWXL5/3P22aKJgQF1Yl+OB4Cw==
# SIG # End signature block
