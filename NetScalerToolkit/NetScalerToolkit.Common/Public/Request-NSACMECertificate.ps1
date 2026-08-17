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

        $providersWithStaging = @('LetsEncrypt', 'Google')
        if (-not $Production -and -not $AcmeDirectoryUrl -and $CertificateProvider -notin $providersWithStaging) {
            $message = "Certificate provider '$CertificateProvider' does not have a configured staging environment. Rerun with -Production, or specify -AcmeDirectoryUrl for a custom ACME directory."
            Write-NSACMECertificateLog Error 'ACME' $message
            throw $message
        }

        # Starts the run timer for the closing summary. A bare if adds no line when it does not match.
        $titleSubtitle = @(
            'NetScaler    : {0}' -f $ManagementURL
            'Provider     : {0} ({1}), {2} request(s)' -f $CertificateProvider, $(if ($Production) { 'production' } else { 'staging' }), @($requests).Count
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
                if ($config.settings.PSObject.Properties.Name -contains 'SMTPCredential') {
                    $config.settings.PSObject.Properties.Remove('SMTPCredential')
                }
                $configDirectory = Split-Path -Path $ConfigFile -Parent
                if (-not [string]::IsNullOrWhiteSpace($configDirectory) -and -not (Test-Path -LiteralPath $configDirectory)) {
                    New-Item -ItemType Directory -Path $configDirectory -Force | Out-Null
                }
                $config | ConvertTo-Json -Depth 20 | Out-File -LiteralPath $ConfigFile -Encoding Unicode -Force
                Write-NSStatusResult -Status OK -Detail $configAction
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
# MII6AQYJKoZIhvcNAQcCoII58jCCOe4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC3jupxT5L9+v8s
# 36UK+N/CiJEr3xNBBXUn7FY9SSabqaCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAS405bY
# qvWOnUNsAAAABLjTMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQwHhcNMjYwODEyMjAwNzA0WhcNMjYwODE1
# MjAwNzA0WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAi56FBfwzf5vShzPjNpAFDlIx
# rP+WNwkHmP1Ca70ZVfvy+KP7+SJg61G0oDAs401zvQ84SQ+vpU8/DLCA66MphoTa
# 0lynwbUy7I4gX/Ei+x1PnFa7O+XlkkAkU/S8AS8+MD7SZN258+t0r9dv+6aDiIZi
# se826v+dg7qk2zhWUC77gLaTxYxUUP0aJsCd6ma6Wk073Hlro33++lgZe9wFs/Wv
# jyvOi7hdbvNVoYrbmbumwqx4VXFhqeozGkZipsw7q3TE5zhsiKaNjsnMfoReiVe9
# XcgBV1zpyLB10atYXKnA58jzrJrBf1plp9JFlmRRdyPLddK+QAPDdod74OAuVyui
# zZAgxJEOiXpiwUiiR4wt5LIZWBrnHkBIX3n6avnMoPIUfWAHNoz3JB7tnYUeupQP
# 4KFoKDJjqAnD+gnpEkqT5pKu1sVDU5tOhTppB5OGtULEwUToj3c3Twprl6P48u2x
# BPvHdbRNfZSkEEjqOIUAZRzgTBW2vAdq5TJKQA8jAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# iG7CwBXCUdrbg+i9vMzoTbq78g4wHwYDVR0jBBgwFoAUayVB3vtrfP0YgAotf492
# XapzPbgwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwNC5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDQuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAKjO
# LANEbvVcXnVYrx4NjQmly/9j4fNQvIBC3OxcnOR2ioVCrTfraGPFcVBYr0yl5G/m
# Aj7anDfPVghMcTfMkqbd+WZ0Rt099iOuyZBELH5T4K2lOPT3fHr/jAPTZnF5x0eo
# eftM2dJldo4n1hauwudmLrC9sv6K95lolW+ZNC19L96/xJBvXHjFQKeLs8XiMOBz
# OCOzT2g0TiUut5I6XbwGDy9Jjr7vh8WRruFTLHFN5RD2+svsFQwUihUdOSNY7iBm
# 4FLVVoRGB6JnbueJJkmLDqfjx9h+FjUoVgRVNLXCmUJDe6PZJKpx4WyAlH2eLjtG
# S/xu/R9eXN/fk5YJl3eNhRMQ05j+7XFk8YpJKAkpX24Zitf8LPDZlIiEbl2RSAom
# 23ib878A+MhkT5zvIFAXQglL4ydbkRDow5BNJYk2QNODgVm5KadMH2kQnZHAVNx+
# d72G1Q5OEdGi1A2D+nhWB36P66FFKUlNvZ5zNdDxewSeWnNczGQoOrxykYckymdh
# w/Po58mkeGeyKxd4ofvkurfhVJocrRg3/ytLk+jXLTXUCy5hgXb9cb7eybhSC7Rt
# v83aXsk5ZpSCKnZ6KNRSJXo6u8UWLPrbqR4M4diIHBv6szF4XYynCiV+vqgYn1tf
# R8PWV/zHIz92zHXqyd0dZVF6numJlaJS7dl7/L0jMIIGwDCCBKigAwIBAgITMwAE
# uNOW2Kr1jp1DbAAAAAS40zANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDA0MB4XDTI2MDgxMjIwMDcwNFoXDTI2
# MDgxNTIwMDcwNFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAIuehQX8M3+b0ocz4zaQ
# BQ5SMaz/ljcJB5j9Qmu9GVX78vij+/kiYOtRtKAwLONNc70POEkPr6VPPwywgOuj
# KYaE2tJcp8G1MuyOIF/xIvsdT5xWuzvl5ZJAJFP0vAEvPjA+0mTdufPrdK/Xb/um
# g4iGYrHvNur/nYO6pNs4VlAu+4C2k8WMVFD9GibAnepmulpNO9x5a6N9/vpYGXvc
# BbP1r48rzou4XW7zVaGK25m7psKseFVxYanqMxpGYqbMO6t0xOc4bIimjY7JzH6E
# XolXvV3IAVdc6ciwddGrWFypwOfI86yawX9aZafSRZZkUXcjy3XSvkADw3aHe+Dg
# Llcros2QIMSRDol6YsFIokeMLeSyGVga5x5ASF95+mr5zKDyFH1gBzaM9yQe7Z2F
# HrqUD+ChaCgyY6gJw/oJ6RJKk+aSrtbFQ1ObToU6aQeThrVCxMFE6I93N08Ka5ej
# +PLtsQT7x3W0TX2UpBBI6jiFAGUc4EwVtrwHauUySkAPIwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFIhuwsAVwlHa24PovbzM6E26u/IOMB8GA1UdIwQYMBaAFGslQd77a3z9GIAK
# LX+Pdl2qcz24MGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDQuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDA0LmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQCoziwDRG71XF51WK8eDY0Jpcv/Y+HzULyAQtzsXJzkdoqFQq0362hjxXFQWK9M
# peRv5gI+2pw3z1YITHE3zJKm3flmdEbdPfYjrsmQRCx+U+CtpTj093x6/4wD02Zx
# ecdHqHn7TNnSZXaOJ9YWrsLnZi6wvbL+iveZaJVvmTQtfS/ev8SQb1x4xUCni7PF
# 4jDgczgjs09oNE4lLreSOl28Bg8vSY6+74fFka7hUyxxTeUQ9vrL7BUMFIoVHTkj
# WO4gZuBS1VaERgeiZ27niSZJiw6n48fYfhY1KFYEVTS1wplCQ3uj2SSqceFsgJR9
# ni47Rkv8bv0fXlzf35OWCZd3jYUTENOY/u1xZPGKSSgJKV9uGYrX/Czw2ZSIhG5d
# kUgKJtt4m/O/APjIZE+c7yBQF0IJS+MnW5EQ6MOQTSWJNkDTg4FZuSmnTB9pEJ2R
# wFTcfne9htUOThHRotQNg/p4Vgd+j+uhRSlJTb2eczXQ8XsEnlpzXMxkKDq8cpGH
# JMpnYcPz6OfJpHhnsisXeKH75Lq34VSaHK0YN/8rS5Po1y011AsuYYF2/XG+3sm4
# Ugu0bb/N2l7JOWaUgip2eijUUiV6OrvFFiz626keDOHYiBwb+rMxeF2Mpwolfr6o
# GJ9bX0fD1lf8xyM/dsx16sndHWVRep7piZWiUu3Ze/y9IzCCBygwggUQoAMCAQIC
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
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcxMIIXLQIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABLjT
# ltiq9Y6dQ2wAAAAEuNMwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgsxqm
# 4aP6Iy32l51uoaxDPpw89YSAGo+3cqz4dLXw88QwDQYJKoZIhvcNAQEBBQAEggGA
# LC87WT955YXQ8bPRHigPXlqXFHnb92BVYhyxLPaNKOJqUs4upPwRrk0qWSimTS3l
# JZBLdTBEX0CIAqVztU6He/ybvFp45ZelYqL+2IjGYc1Rl5356A5fWDvccDf4+uwa
# NhVqIkIicpj5nelLdMxFZGIi6nlJeH/QX/YvvMIQloHG5QmGZwlS/BBZYnAWK0Xq
# sTebLpOH30efLSf4iZIndeGMRsd/7DXTS9Zr0h5WWE7lKRC0gqou3henMf8o+zeN
# p23svG/r5OWegFee70XLaSgbQhCiza1B90glDxc/+cUXPntaDqKCFEmKK9oND9Bw
# RWJ+jXG1Vr5sBklqem4bMJ49mths2YhoBj7nwxiHvT1zTTn7VD4kJfsfZzMGOQO/
# jYWTSqUHBL6rgIAGn4W9x0o2giAL3yR1RdPQowHBDoV0K3RzoDErd9gmv/fauvlH
# NceoYpVUa/1C/UiwxQtBVzU7jP7cSCDA4G3/BX53LPaKDKxB+J8+lTg6ppKfxQjB
# oYIUsTCCFK0GCisGAQQBgjcDAwExghSdMIIUmQYJKoZIhvcNAQcCoIIUijCCFIYC
# AQMxDzANBglghkgBZQMEAgEFADCCAWkGCyqGSIb3DQEJEAEEoIIBWASCAVQwggFQ
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEINTzInop77/Jc0IA2eO9
# cCM1t24NL4YL2ZDJxHvFI8soAgZqddIui7QYEjIwMjYwODE0MDkwNzI1Ljk0WjAE
# gAIB9KCB6aSB5jCB4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVk
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046N0ExQS0wNUUwLUQ5NDcxNTAzBgNV
# BAMTLE1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5
# oIIPKTCCB4IwggVqoAMCAQICEzMAAAAF5c8P/2YuyYcAAAAAAAUwDQYJKoZIhvcN
# AQEMBQAwdzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjFIMEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBS
# b290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIwMTExOTIwMzIzMVoX
# DTM1MTExOTIwNDIzMVowYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGlt
# ZXN0YW1waW5nIENBIDIwMjAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQCefOdSY/3gxZ8FfWO1BiKjHB7X55cz0RMFvWVGR3eRwV1wb3+yq0OXDEqhUhxq
# oNv6iYWKjkMcLhEFxvJAeNcLAyT+XdM5i2CgGPGcb95WJLiw7HzLiBKrxmDj1EQB
# /mG5eEiRBEp7dDGzxKCnTYocDOcRr9KxqHydajmEkzXHOeRGwU+7qt8Md5l4bVZr
# XAhK+WSk5CihNQsWbzT1nRliVDwunuLkX1hyIWXIArCfrKM3+RHh+Sq5RZ8aYyik
# 2r8HxT+l2hmRllBvE2Wok6IEaAJanHr24qoqFM9WLeBUSudz+qL51HwDYyIDPSQ3
# SeHtKog0ZubDk4hELQSxnfVYXdTGncaBnB60QrEuazvcob9n4yR65pUNBCF5qeA4
# QwYnilBkfnmeAjRN3LVuLr0g0FXkqfYdUmj1fFFhH8k8YBozrEaXnsSL3kdTD01X
# +4LfIWOuFzTzuoslBrBILfHNj8RfOxPgjuwNvE6YzauXi4orp4Sm6tF245DaFOSY
# bWFK5ZgG6cUY2/bUq3g3bQAqZt65KcaewEJ3ZyNEobv35Nf6xN6FrA6jF9447+NH
# vCjeWLCQZ3M8lgeCcnnhTFtyQX3XgCoc6IRXvFOcPVrr3D9RPHCMS6Ckg8wggTrt
# IVnY8yjbvGOUsAdZbeXUIQAWMs0d3cRDv09SvwVRd61evQIDAQABo4ICGzCCAhcw
# DgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRraSg6
# NS9IY0DPe9ivSek+2T3bITBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEFBQcC
# ARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRv
# cnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1
# AGIAQwBBMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUyH7SaoUqG8oZmAQH
# J89QEE9oqKIwgYQGA1UdHwR9MHsweaB3oHWGc2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0
# aW9uJTIwUm9vdCUyMENlcnRpZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcmww
# gZQGCCsGAQUFBwEBBIGHMIGEMIGBBggrBgEFBQcwAoZ1aHR0cDovL3d3dy5taWNy
# b3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZl
# cmlmaWNhdGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIw
# MjAuY3J0MA0GCSqGSIb3DQEBDAUAA4ICAQBfiHbHfm21WhV150x4aPpO4dhEmSUV
# pbixNDmv6TvuIHv1xIs174bNGO/ilWMm+Jx5boAXrJxagRhHQtiFprSjMktTliL4
# sKZyt2i+SXncM23gRezzsoOiBhv14YSd1Klnlkzvgs29XNjT+c8hIfPRe9rvVCMP
# iH7zPZcw5nNjthDQ+zD563I1nUJ6y59TbXWsuyUsqw7wXZoGzZwijWT5oc6GvD3H
# DokJY401uhnj3ubBhbkR83RbfMvmzdp3he2bvIUztSOuFzRqrLfEvsPkVHYnvH1w
# tYyrt5vShiKheGpXa2AWpsod4OJyT4/y0dggWi8g/tgbhmQlZqDUf3UqUQsZaLdI
# u/XSjgoZqDjamzCPJtOLi2hBwL+KsCh0Nbwc21f5xvPSwym0Ukr4o5sCcMUcSy6T
# EP7uMV8RX0eH/4JLEpGyae6Ki8JYg5v4fsNGif1OXHJ2IWG+7zyjTDfkmQ1snFOT
# gyEX8qBpefQbF0fx6URrYiarjmBprwP6ZObwtZXJ23jK3Fg/9uqM3j0P01nzVygT
# ppBabzxPAh/hHhhls6kwo3QLJ6No803jUsZcd4JQxiYHHc+Q/wAMcPUnYKv/q2O4
# 44LO1+n6j01z5mggCSlRwD9faBIySAcA9S8h22hIAcRQqIGEjolCK9F6nK9ZyX4l
# hthsGHumaABdWzCCB58wggWHoAMCAQICEzMAAABbSrWNQTJt3HQAAAAAAFswDQYJ
# KoZIhvcNAQEMBQAwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjAwHhcNMjYwMTA4MTg1OTA1WhcNMjcwMTA3MTg1OTA1WjCB
# 4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMk
# TWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5u
# U2hpZWxkIFRTUyBFU046N0ExQS0wNUUwLUQ5NDcxNTAzBgNVBAMTLE1pY3Jvc29m
# dCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5MIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAkFTMFtueUNd57QHQoPkbj/jvm2EXJ9y0LK4R
# JNZBe+UuLhbH+13apR16riJ156DpVaGI4d+7fAlXhNQZJG2qH0JyvUGaIEq/2K4W
# mAfIgG7lDHfxmzHCUV5dVL5mokkqddFsM1B1xhKgL/pzSFAn88fnQMFENCQ9dXDI
# WLMutEf0CWsl5SDsEp5PbfN+1Lz8o4ku8QRsc4XqlI5jdlWmtlRZtaNbBFOagdpD
# 8Ty+ta0s3IQn5vTz1VbUiStre3gZMHlZvLcIvUrbNicDEEi9p+wowXKP065cdxM8
# owOgVIx5qYb0wo4xvq6gbU+N2cOCws/oQ4xFLOssvuMQPWZsH1FJ31+G3L4dCvq9
# mCwGfqhTL5hOk1UuyTB21QzzZZgCQ/O2U63cCIvSrJXv9TeP+6re8cyM8zTDTfjQ
# zns16LSDgEJwy3R1uqhz3VWAJvf/fqwdAA2ie2fUc4XaguTzX3RBFLjeKwdWtrwf
# yx/n4aWohixiIIpfTgdmI7NlbzbqdUjp377yXJN5aamP3RRr249smFWPATeiHq07
# nXTJKqZIxIsQ3Tuncht7cToEBvbD3etbNvbr52lK2FsoXiQCmh+oGxY9fgwS0cpI
# 5+0+ZVMJDju2CGtW4eJr2Nj4eyPTWbgpbha2SZWbcvqExkQIxriyMzEBfP5tf8Am
# FZN7pNkCAwEAAaOCAcswggHHMB0GA1UdDgQWBBTv8upSVZZiFcl1fCBgrHhvwa/S
# tjAfBgNVHSMEGDAWgBRraSg6NS9IY0DPe9ivSek+2T3bITBsBgNVHR8EZTBjMGGg
# X6BdhltodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3Nv
# ZnQlMjBQdWJsaWMlMjBSU0ElMjBUaW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3Js
# MHkGCCsGAQUFBwEBBG0wazBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBQdWJsaWMlMjBSU0ElMjBU
# aW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0l
# AQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMGYGA1UdIARfMF0wUQYM
# KwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTAIBgZngQwBBAIwDQYJKoZI
# hvcNAQEMBQADggIBAAAf7N35cqHg7FdgxYWa2CKVcBAZy06MJQHXD+4GIL85dwfc
# hrj9dt1SErMVtqJNsgTq9hkp3Wni7uco4uRrDKYAxXK47stKXqssq21kjIuFaNMr
# TNc7PS7jEur35tG0EQom8DqwPmcnAfUg7rPViLPK4hGhqUwKdutSLF9bFCfhMCY3
# u326T5fYVROERrd7DNHCG0b7HBoBssyTFGZHbgmd9d3VXEqj3T6btbO6i/3pS6DH
# nBl17CIgibVlZOPiUIke6nrv0tw5ru0DEkyKlVpKW1Af1+b1M4pzOV/G1a4FwtTh
# 25l+rCCwguwfs8yRxfXPBDNAPTIC0+GdjP0o0bXbltf6KKU57VLxEeq/ZtsGkylq
# jiRxS9Ajp0yApG8WabV4tuFI05CmUMxMYPW01V00aQj3qNS762uhSNYwyLjpNB8E
# AfG0NOlGEi7/zu8BVDxnpEeEXF6zPgR3klOFohBEDLoZw78mT5DMPOhnRqtEiQiw
# YnutmA5UCPH1y1/DyUf1F+NzAHfB0YFg0w1UmpClRqLZNp11/mlfNNkQciosQXnd
# KsGMh4iehCs/tTlWVeIxCzF7At0g2sATaXZNHcoGKRv5FBHKBtOnyOPbKILQ0JTA
# b4r6d2CU3lExteMVbpoprn1er5vxfMr8Mr4Am2A6keAm/xCuTrYD63A5Us6mMYID
# 1DCCA9ACAQEweDBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3Rh
# bXBpbmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzANBglghkgBZQMEAgEF
# AKCCAS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEi
# BCAAN1ZPHfilgV5FVjK/ARTxV2k50C8wKlJocOhvpuWAiDCB3QYLKoZIhvcNAQkQ
# Ai8xgc0wgcowgccwgaAEIC8xA1VdnRvTHGUbDxf/cgTJs5u5PprlbV3rUJb5wYPv
# MHwwZaRjMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVzdGFtcGlu
# ZyBDQSAyMDIwAhMzAAAAW0q1jUEybdx0AAAAAABbMCIEIMlPRaqp795pD5Fkpvfy
# bO3/m5gV1og3egokbqF0IY3+MA0GCSqGSIb3DQEBCwUABIICABDQjbzFQOcDfNv0
# +JP1/oROyU7K/NX1fg7QE0V7NN+2vp4YJI6u3qafFqoSn8OzWxlmnRIlf56G7WyP
# l1UUUsrA8maFtHWYGI0CwFtAvuEXaGIByjNR3WuRkUXkRV3P55tVHpxYAet2m0Uj
# fvoYtqEZMAO55k9L2omkF/UetaPbh5fYIgmVMUyP3ksthLmpVA2IXC8SqCWiLzuS
# ypKKSyr8jG8esTpqYphxWnGtGqoI9q0CTvxK9FPDFEDtXN77oTbROGqO2W7/1Dyt
# S1digZeOyzcBZSuDRU2SQiMWJamazxOJpLEujsuuWQv+9mr1tex+LG/ahs5i93ix
# dHj9JfDVDO8uYA0ALhWJKHb5JbNjoFVliAgE4hbz97DF7igPZZz36AkQRdtEY3Xq
# 2Z7YsTGWhlLKGmVq25ycMRodPBuCMzy2/PtiJv2XrctnmF9mlB3uhtZmUS2HxQBJ
# /RFMgf3Dk1wSXtqLebrabi++qpGAfmfAlWtG3IxxBdXoZtY4nMqNxYF0D6ziDOMw
# BFPT0qN1COYV8tIrsClkPl4S3VQ9mCtxi34noH6qTGjjZD91Kb65Bia10WdQUTs4
# HjYgvbUoBJM+LGJRCXo/aZ/p7ht3Zt+rrTdEDjKc7cNjOXGZPKdBvuPKgikn0ITg
# xlqYW4EurBD9HPoaqU7btOeRtGcv
# SIG # End signature block
