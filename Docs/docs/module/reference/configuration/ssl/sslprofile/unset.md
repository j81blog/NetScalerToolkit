---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetSSLProfile

## SYNOPSIS
Clears one or more NetScaler sslprofile resource properties.

## SYNTAX

```
Invoke-NSUnsetSSLProfile [-Name] <String> [-Allowextendedmastersecret] [-Allowlegacykdf] [-Allowunknownsni]
 [-AlpnProtocol] [-CipherName] [-CipherPriority] [-CipherRedirect] [-CipherURL] [-ClearTextPort] [-ClientAuth]
 [-ClientAuthuseboundcachain] [-ClientCert] [-ComMonName] [-Defaultsni] [-DenySSLReneg] [-Dh] [-Dhcount]
 [-DheKeyExchangewithpsk] [-DhFile] [-DhKeyExpsizelimit] [-DropreqwithnoHostHeader] [-DynamicClientCert]
 [-EncryptedClientHello] [-Encrypttriggerpktcount] [-Ersa] [-Ersacount] [-Hsts] [-Includesubdomains]
 [-InsertIonencoding] [-MaxAge] [-MaxRenegrate] [-OCSPStapling] [-Preload] [-PrevsessionKeyLifetime]
 [-Pushenctrigger] [-PushenctriggerTimeout] [-Pushflag] [-Quantumsize] [-RedirectPortRewrite]
 [-Sendclosenotify] [-ServerAuth] [-SessionKeyLifetime] [-Sessionticket] [-SessionticketKeyData]
 [-SessionticketKeyRefresh] [-Sessionticketlifetime] [-Sessreuse] [-SessTimeout] [-SkipClientCertPolicyCheck]
 [-Snienable] [-SniHTTPHostMatch] [-SSL3] [-SSLClientLogs] [-SSLIMaxSessperServer] [-SSLInterception]
 [-SSLIOCSPCheck] [-SSLIreneg] [-SSLLogProfile] [-SSLRedirect] [-SSLTriggerTimeout] [-Strictcachecks]
 [-Strictsigdigestcheck] [-Tls1] [-Tls11] [-Tls12] [-Tls13] [-Tls13sessionticketsperauthconText]
 [-ZerorttearlyData] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for SSL profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetSSLProfile -Name 'example' -Allowextendedmastersecret YES -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetSSLProfile -Name 'example' -Allowextendedmastersecret YES -WhatIf
```

## PARAMETERS

### -Name
Name for the SSL profile.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after the profile is created.
Minimum length = 1 Maximum length = 127

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Allowextendedmastersecret
When set to YES, attempt to use the TLS Extended Master Secret (EMS, as described in RFC 7627) when negotiating TLS 1.0, TLS 1.1 and TLS 1.2 connection parameters.
EMS must be supported by both the TLS client and server in order to be enabled during a handshake.
This setting applies to both frontend and backend SSL profiles.
Default value: NO Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Allowlegacykdf
FIPS 140-3 certification requires all handshakes without EMS be blocked.
Such KDFs are allowed by default.
This setting is to allow/disallow such legacy KDFs when needed.
This setting applies to both frontend and backend SSL profiles.
Default value: YES Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Allowunknownsni
Controls how the handshake is handled when the server name extension does not match any of the bound certificates.
These checks are performed only if the session is SNI enabled (i.e.
when profile bound to vserver has SNIEnable and Client Hello arrived with SNI extension).
Available settings function as follows : ENABLED - handshakes with an unknown SNI are allowed to continue, if a default cert is bound.
DISLABED - handshakes with an unknown SNI are not allowed to continue.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AlpnProtocol
Application protocol supported by the server and used in negotiation of the protocol with the client.
Possible values are HTTP1.1, HTTP2 and NONE.
Default value is NONE which implies application protocol is not enabled hence remain unknown to the TLS layer.
This parameter is relevant only if SSL connection is handled by the virtual server of the type SSL_TCP.
Default value: NONE Possible values = NONE, HTTP1.1, HTTP2

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CipherName
The cipher group/alias/individual cipher configuration.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CipherPriority
cipher priority.
Minimum value = 1

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CipherRedirect
State of Cipher Redirect.
If this parameter is set to ENABLED, you can configure an SSL virtual server or service to display meaningful error messages if the SSL handshake fails because of a cipher mismatch between the virtual server or service and the client.
This parameter is not applicable when configuring a backend profile.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CipherURL
The redirect URL to be used with the Cipher Redirect feature.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClearTextPort
Port on which clear-text data is sent by the appliance to the server.
Do not specify this parameter for SSL offloading with end-to-end encryption.
Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientAuth
State of client authentication.
In service-based SSL offload, the service terminates the SSL handshake if the SSL client does not provide a valid certificate.
This parameter is not applicable when configuring a backend profile.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientAuthuseboundcachain
Certficates bound on the VIP are used for validating the client cert.
Certficates came along with client cert are not used for validating the client cert.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientCert
The rule for client certificate requirement in client authentication.
Possible values = Mandatory, Optional

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComMonName
Name to be checked against the CommonName (CN) field in the server certificate bound to the SSL server.
Minimum length = 1

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Defaultsni
Default domain name supported by the SSL virtual server.
The parameter is effective, when zero touch certificate management is active for the SSL virtual server i.e.
no manual SNI cert or default server cert is bound to the v-server.
For SSL transactions, when SNI is not presented by the client, server-certificate corresponding to the default SNI, if available in the cert-store, is selected else connection is terminated.
Minimum length = 1 Maximum length = 126

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DenySSLReneg
Deny renegotiation in specified circumstances.
Available settings function as follows: * NO - Allow SSL renegotiation.
* FRONTEND_CLIENT - Deny secure and nonsecure SSL renegotiation initiated by the client.
* FRONTEND_CLIENTSERVER - Deny secure and nonsecure SSL renegotiation initiated by the client or the Citrix ADC during policy-based client authentication.
* ALL - Deny all secure and nonsecure SSL renegotiation.
* NONSECURE - Deny nonsecure SSL renegotiation.
Allows only clients that support RFC 5746.
Default value: ALL Possible values = NO, FRONTEND_CLIENT, FRONTEND_CLIENTSERVER, ALL, NONSECURE

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dh
State of Diffie-Hellman (DH) key exchange.
This parameter is not applicable when configuring a backend profile.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dhcount
Number of interactions, between the client and the Citrix ADC, after which the DH private-public pair is regenerated.
A value of zero (0) specifies refresh every time.
This parameter is not applicable when configuring a backend profile.
Allowed DH count values are 0 and \>= 500.
Minimum value = 0 Maximum value = 65534

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DheKeyExchangewithpsk
Whether or not the SSL Virtual Server will require a DHE key exchange to occur when a PSK is accepted during a TLS 1.3 resumption handshake.
A DHE key exchange ensures forward secrecy even in the event that ticket keys are compromised, at the expense of an additional round trip and resources required to carry out the DHE key exchange.
If disabled, a DHE key exchange will be performed when a PSK is accepted but only if requested by the client.
If enabled, the server will require a DHE key exchange when a PSK is accepted regardless of whether the client supports combined PSK-DHE key exchange.
This setting only has an effect when resumption is enabled.
Default value: NO Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DhFile
The file name and path for the DH parameter.
Minimum length = 1

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DhKeyExpsizelimit
This option enables the use of NIST recommended (NIST Special Publication 800-56A) bit size for private-key size.
For example, for DH params of size 2048bit, the private-key size recommended is 224bits.
This is rounded-up to 256bits.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DropreqwithnoHostHeader
Host header check for SNI enabled sessions.
If this check is enabled and the HTTP request does not contain the host header for SNI enabled sessions(i.e vserver or profile bound to vserver has SNI enabled and 'Client Hello' arrived with SNI extension), the request is dropped.
Default value: NO Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DynamicClientCert
Enable or disable Dynamic Client Certificate Generation for SSL sessions.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EncryptedClientHello
State of TLS 1.3 Encrypted Client Hello Support.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Encrypttriggerpktcount
Maximum number of queued packets after which encryption is triggered.
Use this setting for SSL transactions that send small packets from server to Citrix ADC.
Default value: 45 Minimum value = 10 Maximum value = 50

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ersa
State of Ephemeral RSA (eRSA) key exchange.
Ephemeral RSA allows clients that support only export ciphers to communicate with the secure server even if the server certificate does not support export clients.
The ephemeral RSA key is automatically generated when you bind an export cipher to an SSL or TCP-based SSL virtual server or service.
When you remove the export cipher, the eRSA key is not deleted.
It is reused at a later date when another export cipher is bound to an SSL or TCP-based SSL virtual server or service.
The eRSA key is deleted when the appliance restarts.
This parameter is not applicable when configuring a backend profile.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ersacount
The refresh count for the re-generation of RSA public-key and private-key pair.
Minimum value = 0 Maximum value = 65534

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hsts
State of HSTS protocol support for the SSL profile.
Using HSTS, a server can enforce the use of an HTTPS connection for all communication with a client.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Includesubdomains
Enable HSTS for subdomains.
If set to Yes, a client must send only HTTPS requests for subdomains.
Default value: NO Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InsertIonencoding
Encoding method used to insert the subject or issuer's name in HTTP requests to servers.
Default value: Unicode Possible values = Unicode, UTF-8

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxAge
Set the maximum time, in seconds, in the strict transport security (STS) header during which the client must send only HTTPS requests to the server.
Default value: 0 Minimum value = 0 Maximum value = 4294967294

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxRenegrate
Maximum number of renegotiation requests allowed, in one second, to each SSL entity to which this profile is bound.
When set to 0, an unlimited number of renegotiation requests are allowed.
Applicable only when Deny SSL renegotiation is set to a value other than ALL.
Default value: 0 Minimum value = 0 Maximum value = 65535

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -OCSPStapling
State of OCSP stapling support on the SSL virtual server.
Supported only if the protocol used is higher than SSLv3.
Possible values: ENABLED: The appliance sends a request to the OCSP responder to check the status of the server certificate and caches the response for the specified time.
If the response is valid at the time of SSL handshake with the client, the OCSP-based server certificate status is sent to the client during the handshake.
DISABLED: The appliance does not check the status of the server certificate.
. Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Preload
Flag indicates the consent of the site owner to have their domain preloaded.
Default value: NO Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrevsessionKeyLifetime
This option sets the life time of symm key used to generate session tickets issued by NS in secs.
Default value: 0 Minimum value = 0 Maximum value = 172800

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Pushenctrigger
Trigger encryption on the basis of the PUSH flag value.
Available settings function as follows: * ALWAYS - Any PUSH packet triggers encryption.
* IGNORE - Ignore PUSH packet for triggering encryption.
* MERGE - For a consecutive sequence of PUSH packets, the last PUSH packet triggers encryption.
* TIMER - PUSH packet triggering encryption is delayed by the time defined in the set ssl parameter command or in the Change Advanced SSL Settings dialog box.
Possible values = Always, Merge, Ignore, Timer

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PushenctriggerTimeout
PUSH encryption trigger timeout value.
The timeout value is applied only if you set the Push Encryption Trigger parameter to Timer in the SSL virtual server settings.
Default value: 1 Minimum value = 1 Maximum value = 200

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Pushflag
Insert PUSH flag into decrypted, encrypted, or all records.
If the PUSH flag is set to a value other than 0, the buffered records are forwarded on the basis of the value of the PUSH flag.
Available settings function as follows: 0 - Auto (PUSH flag is not set.) 1 - Insert PUSH flag into every decrypted record.
2 -Insert PUSH flag into every encrypted record.
3 - Insert PUSH flag into every decrypted and encrypted record.
Minimum value = 0 Maximum value = 3

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quantumsize
Amount of data to collect before the data is pushed to the crypto hardware for encryption.
For large downloads, a larger quantum size better utilizes the crypto resources.
Default value: 8192 Possible values = 4096, 8192, 16384

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RedirectPortRewrite
State of the port rewrite while performing HTTPS redirect.
If this parameter is set to ENABLED, and the URL from the server does not contain the standard port, the port is rewritten to the standard.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sendclosenotify
Enable sending SSL Close-Notify at the end of a transaction.
Default value: YES Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServerAuth
State of server authentication support for the SSL Backend profile.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessionKeyLifetime
This option sets the life time of symm key used to generate session tickets issued by NS in secs.
Default value: 3000 Minimum value = 600 Maximum value = 86400

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sessionticket
This option enables the use of session tickets, as per the RFC 5077.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessionticketKeyData
Session ticket enc/dec key , admin can set it.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessionticketKeyRefresh
This option enables the use of session tickets, as per the RFC 5077.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sessionticketlifetime
This option sets the life time of session tickets issued by NS in secs.
Default value: 300 Minimum value = 0 Maximum value = 172800

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sessreuse
State of session reuse.
Establishing the initial handshake requires CPU-intensive public key encryption operations.
With the ENABLED setting, session key exchange is avoided for session resumption requests received from the client.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessTimeout
The Session timeout value in seconds.
Minimum value = 0 Maximum value = 4294967294

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipClientCertPolicyCheck
This flag controls the processing of X509 certificate policies.
If this option is Enabled, then the policy check in Client authentication will be skipped.
This option can be used only when Client Authentication is Enabled and ClientCert is set to Mandatory.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Snienable
State of the Server Name Indication (SNI) feature on the virtual server and service-based offload.
SNI helps to enable SSL encryption on multiple domains on a single virtual server or service if the domains are controlled by the same organization and share the same second-level domain name.
For example, *.sports.net can be used to secure domains such as login.sports.net and help.sports.net.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SniHTTPHostMatch
Controls how the HTTP 'Host' header value is validated.
These checks are performed only if the session is SNI enabled (i.e when vserver or profile bound to vserver has SNI enabled and 'Client Hello' arrived with SNI extension) and HTTP request contains 'Host' header.
Available settings function as follows: CERT - Request is forwarded if the 'Host' value is covered by the certificate used to establish this SSL session.
Note: 'CERT' matching mode cannot be applied in TLS 1.3 connections established by resuming from a previous TLS 1.3 session.
On these connections, 'STRICT' matching mode will be used instead.
STRICT - Request is forwarded only if value of 'Host' header in HTTP is identical to the 'Server name' value passed in 'Client Hello' of the SSL connection.
NO - No validation is performed on the HTTP 'Host' header value.
Default value: CERT Possible values = NO, CERT, STRICT

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSL3
State of SSLv3 protocol support for the SSL profile.
Note: On platforms with SSL acceleration chips, if the SSL chip does not support SSLv3, this parameter cannot be set to ENABLED.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLClientLogs
When enabled, NetScaler will log the session ID and SNI name during SSL handshakes on both the external and internal interfaces.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLIMaxSessperServer
Maximum ssl session to be cached per dynamic origin server.
A unique ssl session is created for each SNI received from the client on ClientHello and the matching session is used for server session reuse.
Default value: 10 Minimum value = 1 Maximum value = 1000

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLInterception
Enable or disable transparent interception of SSL sessions.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLIOCSPCheck
Enable or disable OCSP check for origin server certificate.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLIreneg
Enable or disable triggering the client renegotiation when renegotiation request is received from the origin server.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLLogProfile
The name of the ssllogprofile.
Minimum length = 1 Maximum length = 127

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLRedirect
State of HTTPS redirects for the SSL service.
For an SSL session, if the client browser receives a redirect message, the browser tries to connect to the new location.
However, the secure SSL session breaks if the object has moved from a secure site (https://) to an unsecure site (http://).
Typically, a warning message appears on the screen, prompting the user to continue or disconnect.
If SSL Redirect is ENABLED, the redirect message is automatically converted from http:// to https:// and the SSL session does not break.
This parameter is not applicable when configuring a backend profile.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLTriggerTimeout
Time, in milliseconds, after which encryption is triggered for transactions that are not tracked on the Citrix ADC because their length is not known.
There can be a delay of up to 10ms from the specified timeout value before the packet is pushed into the queue.
Default value: 100 Minimum value = 1 Maximum value = 200

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Strictcachecks
Enable strict CA certificate checks on the appliance.
Default value: NO Possible values = YES, NO

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Strictsigdigestcheck
Parameter indicating to check whether peer entity certificate during TLS1.2 handshake is signed with one of signature-hash combination supported by Citrix ADC.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls1
State of TLSv1.0 protocol support for the SSL profile.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls11
State of TLSv1.1 protocol support for the SSL profile.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls12
State of TLSv1.2 protocol support for the SSL profile.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls13
State of TLSv1.3 protocol support for the SSL profile.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls13sessionticketsperauthconText
Number of tickets the SSL Virtual Server will issue anytime TLS 1.3 is negotiated, ticket-based resumption is enabled, and either (1) a handshake completes or (2) post-handhsake client auth completes.
This value can be increased to enable clients to open multiple parallel connections using a fresh ticket for each connection.
No tickets are sent if resumption is disabled.
Default value: 1 Minimum value = 1 Maximum value = 10

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ZerorttearlyData
State of TLS 1.3 0-RTT early data support for the SSL Virtual Server.
This setting only has an effect if resumption is enabled, as early data cannot be sent along with an initial handshake.
Early application data has significantly different security properties - in particular there is no guarantee that the data cannot be replayed.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-NSSession)
Accept pipeline input: False
Accept wildcard characters: False
```

### -IgnoreNotFound
Returns null instead of throwing for known NITRO not-found responses.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReturnNullOnNotFound
Returns null instead of throwing for known NITRO not-found responses.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ThrowOnWarning
Treats NITRO warning responses as terminating errors.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Returns the updated resource after the operation completes.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
Generated from NetScaler NITRO API metadata.
Generated: 2026-06-01 21:28
Supported metadata versions: 13.1, 14.1.

## RELATED LINKS

