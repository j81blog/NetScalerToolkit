---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateSSLService

## SYNOPSIS
Updates a NetScaler sslservice resource.

## SYNTAX

```
Invoke-NSUpdateSSLService [-CipherRedirect <String>] [-CipherURL <String>] [-ClientAuth <String>]
 [-ClientCert <String>] [-ComMonName <String>] [-Dh <String>] [-Dhcount <Int32>] [-DhFile <String>]
 [-DhKeyExpsizelimit <String>] [-Dtls1 <String>] [-Dtls12 <String>] [-DtlsProfileName <String>]
 [-Ersa <String>] [-Ersacount <Int32>] [-OCSPStapling <String>] [-Pushenctrigger <String>]
 [-RedirectPortRewrite <String>] [-Sendclosenotify <String>] [-ServerAuth <String>] [-ServiceName] <String>
 [-Sessreuse <String>] [-SessTimeout <Int32>] [-Snienable <String>] [-SSL2 <String>] [-SSL3 <String>]
 [-SSLClientLogs <String>] [-SSLProfile <String>] [-SSLRedirect <String>] [-SSLV2Redirect <String>]
 [-SSLV2URL <String>] [-Strictsigdigestcheck <String>] [-Tls1 <String>] [-Tls11 <String>] [-Tls12 <String>]
 [-Tls13 <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for SSL service resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateSSLService -ServiceName 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateSSLService -ServiceName 'example' -WhatIf
```

## PARAMETERS

### -CipherRedirect
State of Cipher Redirect.
If this parameter is set to ENABLED, you can configure an SSL virtual server or service to display meaningful error messages if the SSL handshake fails because of a cipher mismatch between the virtual server or service and the client.
This parameter is not applicable when configuring a backend service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CipherURL
URL of the page to which to redirect the client in case of a cipher mismatch.
Typically, this page has a clear explanation of the error or an alternative location that the transaction can continue from.
This parameter is not applicable when configuring a backend service.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientAuth
State of client authentication.
In service-based SSL offload, the service terminates the SSL handshake if the SSL client does not provide a valid certificate.
This parameter is not applicable when configuring a backend service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientCert
Type of client authentication.
If this parameter is set to MANDATORY, the appliance terminates the SSL handshake if the SSL client does not provide a valid certificate.
With the OPTIONAL setting, the appliance requests a certificate from the SSL clients but proceeds with the SSL transaction even if the client presents an invalid certificate.
This parameter is not applicable when configuring a backend SSL service.
Caution: Define proper access control policies before changing this setting to Optional.
Possible values = Mandatory, Optional

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComMonName
Name to be checked against the CommonName (CN) field in the server certificate bound to the SSL server.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dh
State of Diffie-Hellman (DH) key exchange.
This parameter is not applicable when configuring a backend service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dhcount
Number of interactions, between the client and the Citrix ADC, after which the DH private-public pair is regenerated.
A value of zero (0) specifies refresh every time.
This parameter is not applicable when configuring a backend service.
Allowed DH count values are 0 and \>= 500.
Minimum value = 0 Maximum value = 65534

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DhFile
Name for and, optionally, path to the PEM-format DH parameter file to be installed.
/nsconfig/ssl/ is the default path.
This parameter is not applicable when configuring a backend service.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DhKeyExpsizelimit
This option enables the use of NIST recommended (NIST Special Publication 800-56A) bit size for private-key size.
For example, for DH params of size 2048bit, the private-key size recommended is 224bits.
This is rounded-up to 256bits.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dtls1
State of DTLSv1.0 protocol support for the SSL service.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dtls12
State of DTLSv1.2 protocol support for the SSL service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DtlsProfileName
Name of the DTLS profile that contains DTLS settings for the service.
Minimum length = 1 Maximum length = 127

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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
This parameter is not applicable when configuring a backend service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ersacount
Refresh count for regeneration of RSA public-key and private-key pair.
Zero (0) specifies infinite usage (no refresh).
This parameter is not applicable when configuring a backend service.
Minimum value = 0 Maximum value = 65534

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
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
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RedirectPortRewrite
State of the port rewrite while performing HTTPS redirect.
If this parameter is set to ENABLED, and the URL from the server does not contain the standard port, the port is rewritten to the standard.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sendclosenotify
Enable sending SSL Close-Notify at the end of a transaction.
Default value: YES Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServerAuth
State of server authentication support for the SSL service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServiceName
Name of the SSL service.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sessreuse
State of session reuse.
Establishing the initial handshake requires CPU-intensive public key encryption operations.
With the ENABLED setting, session key exchange is avoided for session resumption requests received from the client.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessTimeout
Time, in seconds, for which to keep the session active.
Any session resumption request received after the timeout period will require a fresh SSL handshake and establishment of a new SSL session.
Default value: 300 Minimum value = 0 Maximum value = 4294967294

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Snienable
State of the Server Name Indication (SNI) feature on the virtual server and service-based offload.
SNI helps to enable SSL encryption on multiple domains on a single virtual server or service if the domains are controlled by the same organization and share the same second-level domain name.
For example, *.sports.net can be used to secure domains such as login.sports.net and help.sports.net.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSL2
State of SSLv2 protocol support for the SSL service.
This parameter is not applicable when configuring a backend service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSL3
State of SSLv3 protocol support for the SSL service.
Note: On platforms with SSL acceleration chips, if the SSL chip does not support SSLv3, this parameter cannot be set to ENABLED.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLClientLogs
This parameter is used to enable or disable the logging of additional information, such as the Session ID and SNI name, from SSL handshakes to the audit logs.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLProfile
Name of the SSL profile that contains SSL settings for the service.
Minimum length = 1 Maximum length = 127

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLRedirect
State of HTTPS redirects for the SSL service.
For an SSL session, if the client browser receives a redirect message, the browser tries to connect to the new location.
However, the secure SSL session breaks if the object has moved from a secure site (https://) to an unsecure site (http://).
Typically, a warning message appears on the screen, prompting the user to continue or disconnect.
If SSL Redirect is ENABLED, the redirect message is automatically converted from http:// to https:// and the SSL session does not break.
This parameter is not applicable when configuring a backend service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLV2Redirect
State of SSLv2 Redirect.
If this parameter is set to ENABLED, you can configure an SSL virtual server or service to display meaningful error messages if the SSL handshake fails because of a protocol version mismatch between the virtual server or service and the client.
This parameter is not applicable when configuring a backend service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLV2URL
URL of the page to which to redirect the client in case of a protocol version mismatch.
Typically, this page has a clear explanation of the error or an alternative location that the transaction can continue from.
This parameter is not applicable when configuring a backend service.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Strictsigdigestcheck
Parameter indicating to check whether peer's certificate during TLS1.2 handshake is signed with one of signature-hash combination supported by Citrix ADC.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls1
State of TLSv1.0 protocol support for the SSL service.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls11
State of TLSv1.1 protocol support for the SSL service.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls12
State of TLSv1.2 protocol support for the SSL service.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tls13
State of TLSv1.3 protocol support for the SSL service.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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

