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

        The certificate installed on the NetScaler decides whether a replacement is needed.
        Local Posh-ACME state is a per-machine cache and is not authoritative on its own,
        so runs spread across several machines reach the same decision.

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
        The switch itself is never written to a config file.
        A ForceCertRenew flag set on a request inside a JSON config is one shot, and is
        reset once that certificate deploys successfully, so it does not renew the same
        certificate on every later run.

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
    [CmdletBinding(DefaultParameterSetName = 'LECertificatesHTTP', SupportsShouldProcess)]
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
        # Starts the run timer for the closing summary. A bare if adds no line when it does not match.
        $titleSubtitle = @(
            'NetScaler    : {0}' -f $ManagementURL
            'Provider     : {0} ({1}), {2} request(s)' -f $CertificateProvider, $(if ($Production) { 'production' } else { 'staging' }), @($requests).Count
            'Module       : NetScalerToolkit {0}' -f $toolkitInfo.Display
            'ACME storage : {0}' -f (Join-Path $env:LOCALAPPDATA 'Posh-ACME')
            if ($AutoRun) { 'Config       : {0}' -f $ConfigFile }
            'Log          : {0}' -f $(if ($script:NSACMECertificateLogFile) { $script:NSACMECertificateLogFile } else { 'disabled' })
        )
        Write-NSStatusTitle -Title 'Request-NSACMECertificate' -Subtitle $titleSubtitle

        Write-NSStatusSection -Title 'Setup'

        # Reports the import done before the title block. Only reachable when ConsoleStatus loaded,
        # since without it every Write-NSStatus wrapper is a no-op.
        $consoleStatusInfo = Get-NSACMECertificateModuleVersion -Name 'ConsoleStatus'
        Write-NSStatusItem -Label 'Load ConsoleStatus'
        Write-NSStatusResult -Status OK -Detail "v$($consoleStatusInfo.Version)"

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
            # Posh-ACME treats KeyLength as a string: RSA sizes ('2048'-'4096', divisible by 128) or
            # EC curves ('ec-256', 'ec-384', 'ec-521'). Keep it a string so account lookup matches.
            $accountKeyLength = [string]$request.KeyLength
            if ($accountKeyLength -notmatch '^(ec-(256|384|521)|\d+)$') { $accountKeyLength = '2048' }
            # Reuse a resolved account for the same contact and key length so a multi-request run
            # registers once instead of once per certificate.
            $accountCacheKey = "$($request.EmailAddress)|$accountKeyLength"

            # Orders are scoped to the current Posh-ACME account, so the account has to be selected
            # before the order metadata is read. Otherwise which orders are visible depends on
            # whichever account was last active and changes partway through a run. This never
            # registers an account: when none exists there are no orders to read either.
            if ($request.EmailAddress) {
                if (-not $resolvedAcmeAccounts[$accountCacheKey]) {
                    try {
                        $knownAccount = @(Get-PAAccount -List -Refresh -Contact $request.EmailAddress -KeyLength $accountKeyLength -Status 'valid' -ErrorAction Stop) | Select-Object -First 1
                        if ($knownAccount) { $resolvedAcmeAccounts[$accountCacheKey] = $knownAccount }
                    } catch {
                        Write-NSACMECertificateLog Debug 'ACME' "Could not resolve an existing ACME account for $($request.CN) before the renewal check: $($_.Exception.Message)"
                    }
                }
                if ($resolvedAcmeAccounts[$accountCacheKey]) {
                    try {
                        Set-PAAccount -ID $resolvedAcmeAccounts[$accountCacheKey].ID -Force | Out-Null
                    } catch {
                        Write-NSACMECertificateLog Debug 'ACME' "Could not select ACME account $($resolvedAcmeAccounts[$accountCacheKey].ID) before the renewal check: $($_.Exception.Message)"
                    }
                }
            }

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
                # One note line per sentence rather than one wrapped paragraph.
                foreach ($reasonLine in @($renewalDecision.ReasonLines)) { Write-NSStatusNote -Text $reasonLine }
                Write-NSStatusResult -Status SKIP
                Write-NSACMECertificateLog Info 'CheckCertRenewal' "$($request.CN) skipped. $($renewalDecision.Summary)"
                $results += [PSCustomObject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $request.CertKeyNameToUpdate; PfxPath = $null; Thumbprint = $null; NotAfter = $renewalDecision.CertExpires; RenewAfter = $renewalDecision.RenewAfter; Status = 'Skipped'; Reason = $renewalDecision.Reason; LogFile = $script:NSACMECertificateLogFile }
                continue
            }
            Write-NSStatusResult -Status OK -Detail 'renewal required'
            Write-NSACMECertificateLog Info 'CheckCertRenewal' "$($request.CN) renewal required. $($renewalDecision.Summary)"
            # Everything up to here only reads. This is the point the run commits to changing
            # something, so -WhatIf stops here rather than trying to simulate the ACME exchange,
            # which would publish challenges the CA cannot validate and report failures that mean
            # nothing. -Confirm prompts per certificate at the same point.
            if (-not $PSCmdlet.ShouldProcess($request.CN, 'Request a new certificate and deploy it to the NetScaler')) {
                Write-NSStatusItem -Label 'Renewal action' -Value $request.CN
                Write-NSStatusResult -Status SKIP -Detail 'not performed'
                Write-NSACMECertificateLog Info 'CheckCertRenewal' "$($request.CN) would be renewed. $($renewalDecision.Reason)"
                $results += [PSCustomObject]@{ CN = $request.CN; Domains = $domains; AcmeServer = $serverName; Production = [bool]$Production; ValidationMethod = $request.ValidationMethod; CertKeyName = $request.CertKeyNameToUpdate; PfxPath = $null; Thumbprint = $null; NotAfter = $renewalDecision.CertExpires; Status = 'WhatIf'; Reason = $renewalDecision.Reason; RenewalSource = $renewalDecision.Source; LogFile = $script:NSACMECertificateLogFile }
                continue
            }
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
            # $accountKeyLength and $accountCacheKey are resolved before the renewal check.
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
                    # RenewalSource and RenewalStrategy record what decided this run and are written
                    # by the renewal check. Overwriting them here reported every renewal as an ACME
                    # order decision, including forced ones, which makes the field useless for
                    # working out why a certificate was replaced.
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
        # Gated explicitly: the write uses Out-File, which has no WhatIf support of its own.
        if ($ConfigFile -and $configChanged -and -not $PSCmdlet.ShouldProcess($ConfigFile, 'Save renewal metadata')) {
            Write-NSStatusItem -Label 'Save config file' -Value (Split-Path -Path $ConfigFile -Leaf)
            Write-NSStatusResult -Status SKIP -Detail 'not saved'
            Write-NSACMECertificateLog Info 'ConfigFile' "Config file '$ConfigFile' would be updated."
            $configChanged = $false
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
# MII6AQYJKoZIhvcNAQcCoII58jCCOe4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCEEJOBbq/mb5+Y
# KbBhhJS3o4+s2ESikQzu+aqg0lDqCKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAU7VEGo
# lx23RKiXAAAABTtUMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYwODIyMjAzOTQ3WhcNMjYwODI1
# MjAzOTQ3WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAhsdohjvxG6ieFsDfsRL5MY2W
# DacAjM9Gu4JlNDTDjN+M2/NPylPinGzAYtdahZv0H07D6xRGHh/a13IGRr1lJkjF
# dr57yFEnFIUhGvlWqrgWere4fXlesr+DRP5+qKZo+hUj/qz+1zZ3O2AXx7lDHTKY
# RIlqI0n0ROUJiS+gWnB9o4frvFjmM+NZ6v6MXv3Uftqb0XxM7I5vzgTO1jMLLyw6
# yuRIk5N+uzjniFdzDRSOLy0Ii5PITJVXRC+jDUBhAyp4I89KDh56ROUSjkroi0Eq
# yoGYU4X4ic1DmBJz1jIzC0xZiSr9ktJzL+D6WO9e1IhaD4gwGt5XU84oAkMR300i
# YN1rkf7vXD3IOmgX3JVkG7awDjn4ljPPHce/mge7vpZwmChLfyyMy+AAN/jYtoYP
# luVJEac7Evb2SzoRuqQWJcsA51EcImRxF6zuuSUgqbxUyixpWpFXGOYSzwZpMhPy
# vuNwNBAVA8YxQEfN3pUQzunbhzMmUEk9Jcj0AddvAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# vG6fUuRN3JHAKzu9tZUsxqMfZuEwHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAJX0
# 7v1xFsUfJqEuQpSMqFHYvSKiFe3D5/skVk1vya8w837tXtrEcnUTwAVgh+/we92R
# HRRewEkZyP66sv5iDuu6BrpgTio5KxyjTSpgYkZ3OsI0N2gSMxeDlHgUlFv1h6FX
# Nf/S/MkqwtIONAUC/WqYVxcc5T/+0ZDkfWcIUKKV32CvaMdXAIRJ9ckNqpKL9tog
# gCWINkvxaP6C1Kgi0nXUUGUyrkhTN0GARPqjOL3JjPem0M0oLurq/rlLUBCkRe55
# jB/9DnVQPOBO4XS1XbshwD8U3qKyVwFb7nL1HQahl5ewaCPE0Y5VroYfO2Mr9tCQ
# s0H1Ou3+HZMY6Ec4V9Z3gDzHsYEU6mOuqair6b7Rzr4/3lLYe6/5xf5uvnKJa8BD
# QPu4jUMTEtwb+j3/jM4b/xpckNmnzFzTOGvjumeSW3Pl58qL9tS4GeWbK+u3qD4c
# Kjk9ei9r3gtfonM5T9m+PqlTehNdBHGiUMx00ZvjH8C1GrHGxjRIZ6gCqRYRw9bY
# d2wN+GPKbLLgaPOevH0u+DvTwh9njmALiXrrxjBd6YGwNGSrkFndylNqLUQQqcSt
# FHBx6iJFl9DF/ozjQE0HS8RphbSEnbw+Szk94cdjbOQE7cs/T8Y/GgOQFRZTBFap
# QEDmijvqq2LdAXKwal9Sc3wEXw81HxJfnGycGLWGMIIGwDCCBKigAwIBAgITMwAF
# O1RBqJcdt0SolwAAAAU7VDANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MDgyMjIwMzk0N1oXDTI2
# MDgyNTIwMzk0N1owgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAIbHaIY78RuonhbA37ES
# +TGNlg2nAIzPRruCZTQ0w4zfjNvzT8pT4pxswGLXWoWb9B9Ow+sURh4f2tdyBka9
# ZSZIxXa+e8hRJxSFIRr5Vqq4Fnq3uH15XrK/g0T+fqimaPoVI/6s/tc2dztgF8e5
# Qx0ymESJaiNJ9ETlCYkvoFpwfaOH67xY5jPjWer+jF791H7am9F8TOyOb84EztYz
# Cy8sOsrkSJOTfrs454hXcw0Uji8tCIuTyEyVV0Qvow1AYQMqeCPPSg4eekTlEo5K
# 6ItBKsqBmFOF+InNQ5gSc9YyMwtMWYkq/ZLScy/g+ljvXtSIWg+IMBreV1POKAJD
# Ed9NImDda5H+71w9yDpoF9yVZBu2sA45+JYzzx3Hv5oHu76WcJgoS38sjMvgADf4
# 2LaGD5blSRGnOxL29ks6EbqkFiXLAOdRHCJkcRes7rklIKm8VMosaVqRVxjmEs8G
# aTIT8r7jcDQQFQPGMUBHzd6VEM7p24czJlBJPSXI9AHXbwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFLxun1LkTdyRwCs7vbWVLMajH2bhMB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQCV9O79cRbFHyahLkKUjKhR2L0iohXtw+f7JFZNb8mvMPN+7V7axHJ1E8AFYIfv
# 8HvdkR0UXsBJGcj+urL+Yg7ruga6YE4qOSsco00qYGJGdzrCNDdoEjMXg5R4FJRb
# 9YehVzX/0vzJKsLSDjQFAv1qmFcXHOU//tGQ5H1nCFCild9gr2jHVwCESfXJDaqS
# i/baIIAliDZL8Wj+gtSoItJ11FBlMq5IUzdBgET6ozi9yYz3ptDNKC7q6v65S1AQ
# pEXueYwf/Q51UDzgTuF0tV27IcA/FN6islcBW+5y9R0GoZeXsGgjxNGOVa6GHztj
# K/bQkLNB9Trt/h2TGOhHOFfWd4A8x7GBFOpjrqmoq+m+0c6+P95S2Huv+cX+br5y
# iWvAQ0D7uI1DExLcG/o9/4zOG/8aXJDZp8xc0zhr47pnkltz5efKi/bUuBnlmyvr
# t6g+HCo5PXova94LX6JzOU/Zvj6pU3oTXQRxolDMdNGb4x/AtRqxxsY0SGeoAqkW
# EcPW2HdsDfhjymyy4Gjznrx9Lvg708IfZ45gC4l668YwXemBsDRkq5BZ3cpTai1E
# EKnErRRwceoiRZfQxf6M40BNB0vEaYW0hJ28Pks5PeHHY2zkBO3LP0/GPxoDkBUW
# UwRWqUBA5oo76qti3QFysGpfUnN8BF8PNR8SX5xsnBi1hjCCBygwggUQoAMCAQIC
# EzMAAAAYDeuRVamKAJgAAAAAABgwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMzJaFw0zMTAzMjYxODExMzJaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDIgNpgNFaiif2VWeWP5I6PnFXxJ/lB37fJR55GCvR7GLZBMkBijbiKVwgp
# BI3xM5nf484znH/qncJ+OCq6y3jgnQW+R8Zd7U+7LjlrmcskalzSQ0ghMxEpnBW8
# /HHs2V8ZJzQk6HP+SDsbvsL7LdlH/eO2l4mknhDBwr0Z/Q966TvEth5b8kCxj1vq
# iV4YNthLGRqZR9u2fK/yBMWu83p6O4uo2Edg++gEew5IL7vnnnKFqmSh/R9vPJy3
# WF1YcZewAUx8sXZNUnx3ZhVg59l2LpitPiwzE6FMqIsqaEvVe3MzuFd2a/uWDZH6
# VbDyUiRK78mIg1DQYA9zDEyyBFcNI+nxVSzglvL6u7PRuNqgcV3sf6ELxw89ysQM
# /Z4R1hRFWXRpyOWKKAKtfBHTk0UnNiPcxmLMMYs8jeUjOidfVPjTIry/UVwnwxdl
# kK85cZfBEMYZ/DBNOwdomP459Y1n8izKkbhsa+p4lw+cQVxATBFx9ggR79HhryT7
# HDmpPLvkJvBZ4wW4CW32UT2SMyDe28nIOU3m+hfHlVeKcLBQcym5VoRDjIcCVI7u
# qgGW2PNME0cfei8zCwCy6HCsssJWFS7eg/YbFhnATJcyWfMrkNuAbMfMN8Npg8cr
# S6jVVowyD0GG5zdgi+uQVcSK/638mA1xEYK3pnIoQgO09uuDBwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBSk
# Qwx/dlqlhec+jSgPDBeiRWlwxjBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQBxxyBW+X6mhdRiSwD9PMMWcGUAnx5/QUwnNvZdFGEX+4DR
# DIr9WCh4C87wHtw+lg1D3uzK10DstPX0LFLBFAC3vWMYX4ImXwoLhoR0xlN8mUdo
# rJ3bgnpCJWuI1531Z1rCwPuUrSkBxfOIGDk3p2ECb3Ho/xHi5PRSR/OUrWuQHwXi
# aXMTuXu3IRLezwVkZpFmNwYRD57R9Nx2F/yM7tzOY0Hh0hGCaYEK38/6FrS0SXad
# XWyDUCfn5XOGACRjUCnHx+JQUG0f4SHD+iblpAI0gl+ZHnVmdXXxHTZeTa0CYCIh
# FxKP2922s0g6zLmeiV13LWUmtt/UF7TrWXpMi2/0UNniaDoH7rnPGRV5xVX8uXy4
# sZii4aswzqPM7Y7+mzcranqZ8EjZk5gjLhQ3A2sZaprlOu8CaRmyfcIiVH7zVfgA
# vm81MWXFziAf7my7QOvnyEFPGddq8MSfPtfRyw/Uq3uH6KpoaJNIfPYH6fceZSi5
# 3Rat1A9grExq3ROjhhSpTcchuBItAMNVPxoKNbUm+iR/X3XkL+9WQginjyHe+hXL
# clY8vAGXFD1p40PqMIpAYsmEJBFKW9df4//1N5oQDr/FY9IBJl/oSS979i5rtT7N
# Zz9KvYraCPRBGs0QCy+sWvgQa0coM70QJVLeVwmSxUO/0od0w9Qry7bSLrxGoDCC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMABTtU
# QaiXHbdEqJcAAAAFO1QwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgsWnQ
# pWOgDqORH1xQ5ViNRtWKUIGEEjaAE75+lFOpAHkwDQYJKoZIhvcNAQEBBQAEggGA
# I9OsvPZebCidlGFDmiABSMvqJp07qQ4oh2WCEUYzy5v4Bhj9KgMaMp2aGfsRlpk1
# 5xTizlEccR+ztQYzSYGrCnAIDHK5FGNw7s3P0YkYHDTU2PtBBOMi9Orxu7nSJKQJ
# Pvumwj2yIuZg9qAAZaYlHSegqFvWD3u57gKS5StC+O/3Dyu7/mLkfo0g0dAmjZRc
# /w3XP1Ommd3jnCahinrzNgi9c0JKjamzzviQnZ9uTCdYVvKMonIZRx79FV0TqUyE
# /fSICU/5+Gec42hfXM7kTo87YxulNJgP3TPFHcX53haCK1gsAxDDgwXf1KfAMc89
# TAcfHtSfJ2S6CnOTq8kw32nsno2nzJMoBzHUtcwAZuXvLlQL59hRuO5UIUAr1eFH
# Y6h6OlplltwctnA+4MJlcPsZ+JXj1RIEK29aTqGFkukBog3AiGvUyt/cbBmCcMNL
# 3lTegLDLzeMvA9k4Yu13uxxPRi74k69hs3cLCUVM1DoQX0g0BXic0JCVvmKr+SmL
# oYIUsTCCFK0GCisGAQQBgjcDAwExghSdMIIUmQYJKoZIhvcNAQcCoIIUijCCFIYC
# AQMxDzANBglghkgBZQMEAgEFADCCAWkGCyqGSIb3DQEJEAEEoIIBWASCAVQwggFQ
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIEwsVBliSMqGnKMR7bST
# QvPcFfOA7idELDS/Ji2/dyV1AgZqNTCV6awYEjIwMjYwODI0MTgyNjA2LjM4WjAE
# gAIB9KCB6aSB5jCB4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVk
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NDkxQS0wNUUwLUQ5NDcxNTAzBgNV
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
# hthsGHumaABdWzCCB58wggWHoAMCAQICEzMAAABa9g1njIXt3QgAAAAAAFowDQYJ
# KoZIhvcNAQEMBQAwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjAwHhcNMjYwMTA4MTg1OTAzWhcNMjcwMTA3MTg1OTAzWjCB
# 4zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMk
# TWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5u
# U2hpZWxkIFRTUyBFU046NDkxQS0wNUUwLUQ5NDcxNTAzBgNVBAMTLE1pY3Jvc29m
# dCBQdWJsaWMgUlNBIFRpbWUgU3RhbXBpbmcgQXV0aG9yaXR5MIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEA7/Q7R5aOBRv2ucdxAtF19Y83gf73VrdieVo/
# joTWbi4P4krHpyxYxK1fv1/EslQCocmpBYTX1SU0yFL2MQHfZ0AnjK5awfJS4z52
# mGMPPgTmOXiBgZkSZo6sq8234qqUVrLKD+hODcGUtG7hoGrzrrwDmqUdx+y6HoN1
# KoUgPWLEkVnMetkUbWIYEbtTUGfY40sOjuNvBfmsxw925MBTD9zszdaFLFAG5mlC
# LPxFAYoioIp8jGBCQp3OkKlTRJZA4T8OBNdvPdzXkoxEJ2QaUvbNv6We5JXiyx5C
# bep+VmJlyQvKfbEkjxlcOSr4iD5v+uw88h8jx2Lbbxa8rWPrslenJ5UJpJQ70SvO
# UudOueNCR5dVAinvfG5UFWua+hN/+/hrsyeua4pLIhdzm8lQcQYHfjn47yiYW3XD
# xv5eD0P08ohGoM8S/sdGTQL5i/G7wW8cm9KhxIhkr6/8WYoU6Kliek/vrICYk2fK
# F65xKE6CTxCJTndRKf/4DIxvvFb3TmBmfI2pvb0d5V1DXvmkMckYTPwLHnCId5WW
# IbPmEAG5wUPKVH3PctJOYHr7dm4jF4b0FlLjo/oA0+S5W4PmbzCBzsYsvODvcKwM
# XT26S3xR/x1NwwFfeuj7v+T0zpe3xY8bsgv2//gO/IxjTe2Rv1j1GLodZq9dE9hE
# JR4+yk8CAwEAAaOCAcswggHHMB0GA1UdDgQWBBSOY7JDq3Axw/VltHK0nEjh+deZ
# wjAfBgNVHSMEGDAWgBRraSg6NS9IY0DPe9ivSek+2T3bITBsBgNVHR8EZTBjMGGg
# X6BdhltodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3Nv
# ZnQlMjBQdWJsaWMlMjBSU0ElMjBUaW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3Js
# MHkGCCsGAQUFBwEBBG0wazBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBQdWJsaWMlMjBSU0ElMjBU
# aW1lc3RhbXBpbmclMjBDQSUyMDIwMjAuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0l
# AQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMGYGA1UdIARfMF0wUQYM
# KwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTAIBgZngQwBBAIwDQYJKoZI
# hvcNAQEMBQADggIBAICUzyv63eEhvaHWUNMDH6JiRCXEW5TtA417IgUgFnb3G8aX
# yl6ErESsPMieI6khf96W5QDBAqhojTPC4oB1HSatIdcKeIygs2Sjlb7mvuxc1qYp
# ftAxXcF8Y5feCL2pV/HJR7sAddupDwoFAc1gKc0W1BAeABGuViG3IAqiXly0zQIB
# z/LehjttMyxUm+cDm7sNVY95ehJPYoQwN4sG8lirQglnrIykM5YtnhQ/zZuSzJKE
# gH9d1rCKsgYt2x652vJHFUyTfXeYByMZFvn34i223qi1W9hBaof48atNTMRx7Pxp
# C47e6ag1mMq4WhflWw8/+BJmx76iuEbfN9mT0gPITcN9QWuG+S/ofS2KMrUPS4ga
# HAwFZKb2S1Dqh5T5q6tkXHcwj4s4OcextEVkDLXW4y/Aqr5k0LVJ7i0gzW72mJYC
# GdM+iHqZQsqKQc5WEdo73ne2TMMK2Oyx7kZQo7H3KD2eocpYyCc4Onrb+48/ML/I
# MQhKtcJxTtQHu0BOvfNY0R20zh3TT2JdYjp1X9J1wghfjiumgvIIvD6dePGn59j9
# 3KAs7tR1JBpVpQVWPcradXK66M+ym3ku6dzkW+5g+qaL/PyQBKabBuIX5bQ/RRNY
# VoLzgxZ9TaHowODmzSjGZ00UrvqNevfBl91KhXsUIp+rkZ14ajLlTANDAwLQMYID
# 1DCCA9ACAQEweDBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3Rh
# bXBpbmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjANBglghkgBZQMEAgEF
# AKCCAS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEi
# BCCrlDvAqoHWknYlw+einvGX/Q0/WEWJFNZM+CG//oaDSzCB3QYLKoZIhvcNAQkQ
# Ai8xgc0wgcowgccwgaAEIGK5ZECL6n3o9GwG3dPBbeM2jOA9BL5ByjUJWb81pTRD
# MHwwZaRjMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVzdGFtcGlu
# ZyBDQSAyMDIwAhMzAAAAWvYNZ4yF7d0IAAAAAABaMCIEIG5oD9IV8GI3B4Y7/5oJ
# G0CzTo+vxrY2gYmVPjVhJKxhMA0GCSqGSIb3DQEBCwUABIICAJkKfetheJ2LBM2w
# M13nT9RRSsreoxcS99sdyn3OGr9thatkPXnKf1zbJ0MVckzKV5B1JEZF9xPDPh+x
# 6ulql04MxYVIVKcNbK0bDWfahyvsYJdIfVPtLm1DpLiExzijkVNAoXRZ0B3qqdIA
# 6LZMHxjOL8qX6p+nn8d3VvuudFfcHvezjgiAxtUQ14sDe/DgI7rq0Bs329JYwN8/
# r/lGS72+7gcAzXKMEWEo/PShUfhXrjw83JM4DRUlkk4pQYViBol4HivgJibbLrR+
# AheVs4Bc4wDc6GEdGm5GewwId5M5Rr8cnDuKCFjka5V1oeqSrc2gqkGhhsWGmtnU
# z51qDvnW9MMzTLKv+Sk6ix6Xg+5G4aCAi1SWZSJ/9u6r4VL7lt5/0eWFcHhIqrIk
# LjL459xA6Hfnu7hfhXIV+yQRorF38YkEFTiJm57r+VRCaKhG+asuYNPwKTvRtvcz
# ZYpnMhpwICOahcLBrMWA9bDOpLxuaqBh6mTrc/0XhXGbY+RdGKzCx5iJEhnRT3Ev
# CJF+o1BSP79U5OW8hpYk2SqwtAoJF7mH/L1d+MN1m2qbiv7jrGeS1x26YGrAYkmz
# slJOL0/x7Rd/hrii1FL4Y7gJpSw205EPU8UvYIPRCz358lGP5ReinNG8PlfeenvQ
# WlLDeHGmQ6NGYRRlevm4jx2RiZQH
# SIG # End signature block
