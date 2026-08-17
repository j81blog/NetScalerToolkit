---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateSSLOCSPResponder

## SYNOPSIS
Updates a NetScaler sslocspresponder resource.

## SYNTAX

```
Invoke-NSUpdateSSLOCSPResponder [-Batchingdelay <Int32>] [-Batchingdepth <Int32>] [-Cache <String>]
 [-CacheTimeout <Int32>] [-HTTPMethod <String>] [-InsertClientCert <String>] [-Name] <String>
 [-OCSPURLResolveTimeout <Int32>] [-Producedattimeskew <Int32>] [-ResponderCert <String>]
 [-ResponseTimeout <Int32>] [-SigningCert <String>] [-TrustResponder <Boolean>] [-URL <String>]
 [-Usenonce <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for OCSP responser resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateSSLOCSPResponder -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateSSLOCSPResponder -Name 'example' -WhatIf
```

## PARAMETERS

### -Batchingdelay
Maximum time, in milliseconds, to wait to accumulate OCSP requests to batch.
Does not apply if the Batching Depth is 1.
Minimum value = 1 Maximum value = 10000

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

### -Batchingdepth
Number of client certificates to batch together into one OCSP request.
Batching avoids overloading the OCSP responder.
A value of 1 signifies that each request is queried independently.
For a value greater than 1, specify a timeout (batching delay) to avoid inordinately delaying the processing of a single certificate.
Minimum value = 1 Maximum value = 8

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

### -Cache
Enable caching of responses.
Caching of responses received from the OCSP responder enables faster responses to the clients and reduces the load on the OCSP responder.
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

### -CacheTimeout
Timeout for caching the OCSP response.
After the timeout, the Citrix ADC sends a fresh request to the OCSP responder for the certificate status.
If a timeout is not specified, the timeout provided in the OCSP response applies.
Default value: 1 Minimum value = 1 Maximum value = 43200

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

### -HTTPMethod
HTTP method used to send ocsp request.
POST is the default httpmethod.
If request length is \> 255, POST wil be used even if GET is set as httpMethod.
Default value: POST Possible values = GET, POST

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

### -InsertClientCert
Include the complete client certificate in the OCSP request.
Possible values = YES, NO

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
Name for the OCSP responder.
Cannot begin with a hash (#) or space character and must contain only ASCII alphanumeric, underscore (_), hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after the responder is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my responder" or 'my responder').
Minimum length = 1 Maximum length = 127

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

### -OCSPURLResolveTimeout
Time, in milliseconds, to wait for an OCSP URL Resolution.
When this time elapses, an error message appears or the transaction is forwarded, depending on the settings on the virtual server.
Minimum value = 100 Maximum value = 2000

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

### -Producedattimeskew
Time, in seconds, for which the Citrix ADC waits before considering the response as invalid.
The response is considered invalid if the Produced At time stamp in the OCSP response exceeds or precedes the current Citrix ADC clock time by the amount of time specified.
Default value: 300 Minimum value = 0 Maximum value = 86400

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

### -ResponderCert
.
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

### -ResponseTimeout
Time, in milliseconds, to wait for an OCSP response.
When this time elapses, an error message appears or the transaction is forwarded, depending on the settings on the virtual server.
Includes Batching Delay time.
Minimum value = 100 Maximum value = 120000

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

### -SigningCert
Certificate-key pair that is used to sign OCSP requests.
If this parameter is not set, the requests are not signed.
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

### -TrustResponder
A certificate to use to validate OCSP responses.
Alternatively, if -trustResponder is specified, no verification will be done on the reponse.
If both are omitted, only the response times (producedAt, lastUpdate, nextUpdate) will be verified.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -URL
URL of the OCSP responder.
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

### -Usenonce
Enable the OCSP nonce extension, which is designed to prevent replay attacks.
Possible values = YES, NO

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

