---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateSSLParameter

## SYNOPSIS
Updates a NetScaler sslparameter resource.

## SYNTAX

```
Invoke-NSUpdateSSLParameter [[-Crlmemorysizemb] <Int32>] [[-CryptodevDisableLimit] <Int32>]
 [[-DefaultProfile] <String>] [[-DenySSLReneg] <String>] [[-DropreqwithnoHostHeader] <String>]
 [[-Encrypttriggerpktcount] <Int32>] [[-HeterogeneousSSLHw] <String>] [[-HybridfipsMode] <String>]
 [[-InsertCertSpace] <String>] [[-InsertIonencoding] <String>] [[-NdcppcomplianceCertCheck] <String>]
 [[-OCSPCachesize] <Int32>] [[-Operationqueuelimit] <Int32>] [[-PushenctriggerTimeout] <Int32>]
 [[-Pushflag] <Int32>] [[-Quantumsize] <String>] [[-Sendclosenotify] <String>] [[-SigdigestType] <String[]>]
 [[-SniHTTPHostMatch] <String>] [[-SoftwarecryptoThreshold] <Int32>] [[-SSLIErrorCache] <String>]
 [[-SSLIMaxErrorCachemem] <Int32>] [[-SSLTriggerTimeout] <Int32>] [[-Strictcachecks] <String>]
 [[-UndefActionControl] <String>] [[-UndefActionData] <String>] [[-Session] <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for SSL parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateSSLParameter  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateSSLParameter  -WhatIf
```

## PARAMETERS

### -Crlmemorysizemb
Maximum memory size to use for certificate revocation lists (CRLs).
This parameter reserves memory for a CRL but sets a limit to the maximum memory that the CRLs loaded on the appliance can consume.
Default value: 256 Minimum value = 10 Maximum value = 1024

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CryptodevDisableLimit
Limit to the number of disabled SSL chips after which the ADC restarts.
A value of zero implies that the ADC does not automatically restart.
Default value: 0

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultProfile
Global parameter used to enable default profile feature.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
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
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DropreqwithnoHostHeader
Host header check for SNI enabled sessions.
If this check is enabled and the HTTP request does not contain the host header for SNI enabled sessions(i.e vserver or profile bound to vserver has SNI enabled and 'Client Hello' arrived with SNI extension), the request is dropped.
Default value: NO Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Encrypttriggerpktcount
Maximum number of queued packets after which encryption is triggered.
Use this setting for SSL transactions that send small packets from server to Citrix ADC.
Default value: 45 Minimum value = 10 Maximum value = 50

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeterogeneousSSLHw
To support both cavium and coleto based platforms in cluster environment, this mode has to be enabled.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HybridfipsMode
When this mode is enabled, system will use additional crypto hardware to accelerate symmetric crypto operations.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InsertCertSpace
To insert space between lines in the certificate header of request.
Default value: YES Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InsertIonencoding
Encoding method used to insert the subject or issuer's name in HTTP requests to servers.
Default value: Unicode Possible values = Unicode, UTF-8

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NdcppcomplianceCertCheck
Determines whether or not additional checks are carried out during a TLS handshake when validating an X.509 certificate received from the peer.
Settings apply as follows: YES - (1) During certificate verification, ignore the Common Name field (inside the subject name) if Subject Alternative Name X.509 extension is present in the certificate for backend connection.
(2) Verify the Extended Key Usage X.509 extension server/client leaf certificate received over the wire is consistent with the peer's role.
(applicable for frontend and backend connections) (3) Verify the Basic Constraint CA field set to TRUE for non-leaf certificates.
(applicable for frontend, backend connections and CAs bound to the Citrix ADC.
NO - (1) Verify the Common Name field (inside the subject name) irrespective of Subject Alternative Name X.509 extension.
(2) Ignore the Extended Key Usage X.509 extension for server/client leaf certificate.
(3) Do not verify the Basic Constraint CA true flag for non-leaf certificates.
Default value: NO Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OCSPCachesize
Size, per packet engine, in megabytes, of the OCSP cache.
A maximum of 10% of the packet engine memory can be assigned.
Because the maximum allowed packet engine memory is 4GB, the maximum value that can be assigned to the OCSP cache is approximately 410 MB.
Default value: 10 Minimum value = 0 Maximum value = 512

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Operationqueuelimit
Limit in percentage of capacity of the crypto operations queue beyond which new SSL connections are not accepted until the queue is reduced.
Default value: 150 Minimum value = 0 Maximum value = 10000

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PushenctriggerTimeout
PUSH encryption trigger timeout value.
The timeout value is applied only if you set the Push Encryption Trigger parameter to Timer in the SSL virtual server settings.
Default value: 1 Minimum value = 1 Maximum value = 200

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
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
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quantumsize
Amount of data to collect before the data is pushed to the crypto hardware for encryption.
For large downloads, a larger quantum size better utilizes the crypto resources.
Default value: 8192 Possible values = 4096, 8192, 16384

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sendclosenotify
Send an SSL Close-Notify message to the client at the end of a transaction.
Default value: YES Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SigdigestType
Signature Digest Algorithms that are supported by appliance.
Default value is "ALL" and it will enable the following algorithms depending on the platform.
On VPX: ECDSA-SHA1 ECDSA-SHA224 ECDSA-SHA256 ECDSA-SHA384 ECDSA-SHA512 RSA-SHA1 RSA-SHA224 RSA-SHA256 RSA-SHA384 RSA-SHA512 DSA-SHA1 DSA-SHA224 DSA-SHA256 DSA-SHA384 DSA-SHA512 On MPX with Nitrox-III and coleto cards: RSA-SHA1 RSA-SHA224 RSA-SHA256 RSA-SHA384 RSA-SHA512 ECDSA-SHA1 ECDSA-SHA224 ECDSA-SHA256 ECDSA-SHA384 ECDSA-SHA512 Others: RSA-SHA1 RSA-SHA224 RSA-SHA256 RSA-SHA384 RSA-SHA512.
Note:ALL doesnot include RSA-MD5 for any platform.
Default value: ALL Possible values = ALL, RSA-MD5, RSA-SHA1, RSA-SHA224, RSA-SHA256, RSA-SHA384, RSA-SHA512, DSA-SHA1, DSA-SHA224, DSA-SHA256, DSA-SHA384, DSA-SHA512, ECDSA-SHA1, ECDSA-SHA224, ECDSA-SHA256, ECDSA-SHA384, ECDSA-SHA512

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
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
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SoftwarecryptoThreshold
Citrix ADC CPU utilization threshold (in percentage) beyond which crypto operations are not done in software.
A value of zero implies that CPU is not utilized for doing crypto in software.
Default value: 0 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLIErrorCache
Enable or disable dynamically learning and caching the learned information to make the subsequent interception or bypass decision.
When enabled, NS does the lookup of this cached data to do early bypass.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLIMaxErrorCachemem
Specify the maximum memory that can be used for caching the learned data.
This memory is used as a LRU cache so that the old entries gets replaced with new entry once the set memory limit is fully utilised.
A value of 0 decides the limit automatically.
Default value: 0 Minimum value = 0 Maximum value = 4294967294

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLTriggerTimeout
Time, in milliseconds, after which encryption is triggered for transactions that are not tracked on the Citrix ADC because their length is not known.
There can be a delay of up to 10ms from the specified timeout value before the packet is pushed into the queue.
Default value: 100 Minimum value = 1 Maximum value = 200

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Strictcachecks
Enable strict CA certificate checks on the appliance.
Default value: NO Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UndefActionControl
Name of the undefined built-in control action: CLIENTAUTH, NOCLIENTAUTH, NOOP, RESET, or DROP.
Default value: "CLIENTAUTH"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UndefActionData
Name of the undefined built-in data action: NOOP, RESET or DROP.
Default value: "NOOP"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
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
Position: 27
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

