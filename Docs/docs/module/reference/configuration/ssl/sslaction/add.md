---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddSSLAction

## SYNOPSIS
Creates a NetScaler sslaction resource.

## SYNTAX

```
Invoke-NSAddSSLAction [-CaCertGrpName <String>] [-CertFingerprintdigest <String>]
 [-CertFingerprintHeader <String>] [-CertHashHeader <String>] [-CertHeader <String>]
 [-CertIssuerHeader <String>] [-CertNotafterHeader <String>] [-CertNotbeforeHeader <String>]
 [-CertSerialHeader <String>] [-CertSubjectHeader <String>] [-Cipher <String>] [-CipherHeader <String>]
 [-ClientAuth <String>] [-ClientCert <String>] [-ClientCertFingerprint <String>] [-ClientCertHash <String>]
 [-ClientCertIssuer <String>] [-ClientCertNotafter <String>] [-ClientCertNotbefore <String>]
 [-ClientCertSerialnumber <String>] [-ClientCertSubject <String>] [-ClientCertVerification <String>]
 [-Forward <String>] [-Name] <String> [-OCSPCache <String>] [-OCSPCertValidation <String>]
 [-OCSPStapling <String>] [-OwasupPort <String>] [-Sessionid <String>] [-SessionidHeader <String>]
 [-SSLLogProfile <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for SSL action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddSSLAction -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddSSLAction -Name 'example' -WhatIf
```

## PARAMETERS

### -CaCertGrpName
This action will allow to pick CA(s) from the specific CA group, to verify the client certificate.
Minimum length = 1 Maximum length = 31

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

### -CertFingerprintdigest
Digest algorithm used to compute the fingerprint of the client certificate.
Possible values = SHA1, SHA224, SHA256, SHA384, SHA512

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

### -CertFingerprintHeader
Name of the header into which to insert the client certificate fingerprint.

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

### -CertHashHeader
Name of the header into which to insert the client certificate signature (hash).

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

### -CertHeader
Name of the header into which to insert the client certificate.

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

### -CertIssuerHeader
Name of the header into which to insert the client certificate issuer details.

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

### -CertNotafterHeader
Name of the header into which to insert the certificate's expiry date.

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

### -CertNotbeforeHeader
Name of the header into which to insert the date and time from which the certificate is valid.

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

### -CertSerialHeader
Name of the header into which to insert the client serial number.

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

### -CertSubjectHeader
Name of the header into which to insert the client certificate subject.

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

### -Cipher
Insert the cipher suite that the client and the Citrix ADC negotiated for the SSL session into the HTTP header of the request being sent to the web server.
The appliance inserts the cipher-suite name, SSL protocol, export or non-export string, and cipher strength bit, depending on the type of browser connecting to the SSL virtual server or service (for example, Cipher-Suite: RC4- MD5 SSLv3 Non-Export 128-bit).
Possible values = ENABLED, DISABLED

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

### -CipherHeader
Name of the header into which to insert the name of the cipher suite.

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
Perform client certificate authentication.
Possible values = DOCLIENTAUTH, NOCLIENTAUTH

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
Insert the entire client certificate into the HTTP header of the request being sent to the web server.
The certificate is inserted in ASCII (PEM) format.
Possible values = ENABLED, DISABLED

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

### -ClientCertFingerprint
Insert the certificate's fingerprint into the HTTP header of the request being sent to the web server.
The fingerprint is derived by computing the specified hash value (SHA256, for example) of the DER-encoding of the client certificate.
Possible values = ENABLED, DISABLED

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

### -ClientCertHash
Insert the certificate's signature into the HTTP header of the request being sent to the web server.
The signature is the value extracted directly from the X.509 certificate signature field.
All X.509 certificates contain a signature field.
Possible values = ENABLED, DISABLED

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

### -ClientCertIssuer
Insert the certificate issuer details into the HTTP header of the request being sent to the web server.
Possible values = ENABLED, DISABLED

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

### -ClientCertNotafter
Insert the date of expiry of the certificate into the HTTP header of the request being sent to the web server.
Every certificate is configured with the date and time at which the certificate expires.
Possible values = ENABLED, DISABLED

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

### -ClientCertNotbefore
Insert the date from which the certificate is valid into the HTTP header of the request being sent to the web server.
Every certificate is configured with the date and time from which it is valid.
Possible values = ENABLED, DISABLED

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

### -ClientCertSerialnumber
Insert the entire client serial number into the HTTP header of the request being sent to the web server.
Possible values = ENABLED, DISABLED

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

### -ClientCertSubject
Insert the client certificate subject, also known as the distinguished name (DN), into the HTTP header of the request being sent to the web server.
Possible values = ENABLED, DISABLED

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

### -ClientCertVerification
Client certificate verification is mandatory or optional.
Default value: Mandatory Possible values = Mandatory, Optional

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

### -Forward
This action takes an argument a vserver name, to this vserver one will be able to forward all the packets.
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

### -Name
Name for the SSL action.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after the action is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
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

### -OCSPCache
Enable cache of OCSP response.
Caching of response received from the OCSP responder enables faster response to the client and reduces the load on the OCSP responder.
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

### -OCSPCertValidation
This option is used to check the revocation status of client/server certificate in SSL handshake using OCSP.
Possible values = DISABLE, OPTIONAL, MANDATORY

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

### -OCSPStapling
This option is used to enable ocspStapling parameter for the SSL connection.
Possible values = ENABLED, DISABLED

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

### -OwasupPort
If the appliance is in front of an Outlook Web Access (OWA) server, insert a special header field, FRONT-END-HTTPS: ON, into the HTTP requests going to the OWA server.
This header communicates to the server that the transaction is HTTPS and not HTTP.
Possible values = ENABLED, DISABLED

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

### -Sessionid
Insert the SSL session ID into the HTTP header of the request being sent to the web server.
Every SSL connection that the client and the Citrix ADC share has a unique ID that identifies the specific connection.
Possible values = ENABLED, DISABLED

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

### -SessionidHeader
Name of the header into which to insert the Session ID.

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

### -SSLLogProfile
The name of the ssllogprofile.
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

