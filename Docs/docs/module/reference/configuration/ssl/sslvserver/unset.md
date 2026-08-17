---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetSSLVServer

## SYNOPSIS
Clears one or more NetScaler sslvserver resource properties.

## SYNTAX

```
Invoke-NSUnsetSSLVServer [-VServerName] <String> [-CipherRedirect] [-CipherURL] [-ClearTextPort] [-ClientAuth]
 [-ClientCert] [-Defaultsni] [-Dh] [-Dhcount] [-DheKeyExchangewithpsk] [-DhFile] [-DhKeyExpsizelimit] [-Dtls1]
 [-Dtls12] [-DtlsProfileName] [-Ersa] [-Ersacount] [-Hsts] [-Includesubdomains] [-MaxAge] [-OCSPStapling]
 [-Preload] [-RedirectPortRewrite] [-Sendclosenotify] [-Sessreuse] [-SessTimeout] [-Snienable] [-SSL2] [-SSL3]
 [-SSLClientLogs] [-SSLProfile] [-SSLRedirect] [-SSLV2Redirect] [-SSLV2URL] [-Strictsigdigestcheck] [-Tls1]
 [-Tls11] [-Tls12] [-Tls13] [-Tls13sessionticketsperauthconText] [-ZerorttearlyData] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for SSL virtual server resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetSSLVServer -VServerName 'example' -CipherRedirect ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetSSLVServer -VServerName 'example' -CipherRedirect ENABLED -WhatIf
```

## PARAMETERS

### -VServerName
Name of the SSL virtual server for which to set advanced configuration.
Minimum length = 1

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

### -CipherRedirect
State of Cipher Redirect.
If cipher redirect is enabled, you can configure an SSL virtual server or service to display meaningful error messages if the SSL handshake fails because of a cipher mismatch between the virtual server or service and the client.
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
Default value: 0 Minimum value = 0 Maximum value = 65534

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
If client authentication is enabled, the virtual server terminates the SSL handshake if the SSL client does not provide a valid certificate.
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
Type of client authentication.
If this parameter is set to MANDATORY, the appliance terminates the SSL handshake if the SSL client does not provide a valid certificate.
With the OPTIONAL setting, the appliance requests a certificate from the SSL clients but proceeds with the SSL transaction even if the client presents an invalid certificate.
Caution: Define proper access control policies before changing this setting to Optional.
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

### -Dh
State of Diffie-Hellman (DH) key exchange.
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
Name of and, optionally, path to the DH parameter file, in PEM format, to be installed.
/nsconfig/ssl/ is the default path.
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

### -Dtls1
State of DTLSv1.0 protocol support for the SSL Virtual Server.
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

### -Dtls12
State of DTLSv1.2 protocol support for the SSL Virtual Server.
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

### -DtlsProfileName
Name of the DTLS profile whose settings are to be applied to the virtual server.
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

### -Ersa
State of Ephemeral RSA (eRSA) key exchange.
Ephemeral RSA allows clients that support only export ciphers to communicate with the secure server even if the server certificate does not support export clients.
The ephemeral RSA key is automatically generated when you bind an export cipher to an SSL or TCP-based SSL virtual server or service.
When you remove the export cipher, the eRSA key is not deleted.
It is reused at a later date when another export cipher is bound to an SSL or TCP-based SSL virtual server or service.
The eRSA key is deleted when the appliance restarts.
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
Refresh count for regeneration of the RSA public-key and private-key pair.
Zero (0) specifies infinite usage (no refresh).
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
State of HSTS protocol support for the SSL Virtual Server.
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

### -RedirectPortRewrite
State of the port rewrite while performing HTTPS redirect.
If this parameter is ENABLED and the URL from the server does not contain the standard port, the port is rewritten to the standard.
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
Time, in seconds, for which to keep the session active.
Any session resumption request received after the timeout period will require a fresh SSL handshake and establishment of a new SSL session.
Default value: 120 Minimum value = 0 Maximum value = 4294967294

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

### -SSL2
State of SSLv2 protocol support for the SSL Virtual Server.
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

### -SSL3
State of SSLv3 protocol support for the SSL Virtual Server.
Note: On platforms with SSL acceleration chips, if the SSL chip does not support SSLv3, this parameter cannot be set to ENABLED.
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

### -SSLClientLogs
This parameter is used to enable or disable the logging of additional information, such as the Session ID and SNI names, from SSL handshakes to the audit logs.
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

### -SSLProfile
Name of the SSL profile that contains SSL settings for the virtual server.
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
State of HTTPS redirects for the SSL virtual server.
For an SSL session, if the client browser receives a redirect message, the browser tries to connect to the new location.
However, the secure SSL session breaks if the object has moved from a secure site (https://) to an unsecure site (http://).
Typically, a warning message appears on the screen, prompting the user to continue or disconnect.
If SSL Redirect is ENABLED, the redirect message is automatically converted from http:// to https:// and the SSL session does not break.
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

### -SSLV2Redirect
State of SSLv2 Redirect.
If SSLv2 redirect is enabled, you can configure an SSL virtual server or service to display meaningful error messages if the SSL handshake fails because of a protocol version mismatch between the virtual server or service and the client.
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

### -SSLV2URL
URL of the page to which to redirect the client in case of a protocol version mismatch.
Typically, this page has a clear explanation of the error or an alternative location that the transaction can continue from.

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
State of TLSv1.0 protocol support for the SSL Virtual Server.
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
State of TLSv1.1 protocol support for the SSL Virtual Server.
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
State of TLSv1.2 protocol support for the SSL Virtual Server.
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
State of TLSv1.3 protocol support for the SSL Virtual Server.
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

