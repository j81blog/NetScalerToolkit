---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetSSLZerotouchparam

## SYNOPSIS
Clears one or more NetScaler sslzerotouchparam resource properties.

## SYNTAX

```
Invoke-NSUnsetSSLZerotouchparam [-OCSPBatchingdelay] [-OCSPBatchingdepth] [-OCSPCacheTimeout] [-OCSPHTTPMethod]
 [-OCSPProducedattimeskew] [-OCSPResponseTimeout] [-OCSPTrustResponder] [-OCSPURLResolveTimeout]
 [-OCSPUsenonce] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Zerotouch params resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetSSLZerotouchparam -OCSPBatchingdelay  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetSSLZerotouchparam -OCSPBatchingdelay  -WhatIf
```

## PARAMETERS

### -OCSPBatchingdelay
Maximum time, in milliseconds, to wait to accumulate OCSP requests to batch.
Does not apply if the Batching Depth is 1.
Minimum value = 1 Maximum value = 10000

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

### -OCSPBatchingdepth
Number of certificates to batch together into one OCSP request.
Batching avoids overloading the OCSP responder.
A value of 1 signifies that each request is queried independently.
For a value greater than 1, specify a timeout (batching delay) to avoid inordinately delaying the processing of a single certificate.
Minimum value = 1 Maximum value = 8

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

### -OCSPCacheTimeout
Timeout(in minutes) for caching the OCSP response.
Default value: 1 Minimum value = 1 Maximum value = 43200

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

### -OCSPHTTPMethod
HTTP method used to send ocsp request.
POST is the default httpmethod.
If request length is \> 255, POST wil be used even if GET is set as httpMethod.
Default value: POST Possible values = GET, POST

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

### -OCSPProducedattimeskew
Time, in seconds, for which the Citrix ADC waits before considering the response as invalid.
The response is considered invalid if the Produced At time stamp in the OCSP response exceeds or precedes the current Citrix ADC clock time by the amount of time specified.
Default value: 300 Minimum value = 0 Maximum value = 86400

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

### -OCSPResponseTimeout
Time, in milliseconds, to wait for an OCSP response.
When this time elapses, an error message appears or the transaction is forwarded, depending on the settings on the virtual server.
Includes Batching Delay time.
Minimum value = 100 Maximum value = 120000

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

### -OCSPTrustResponder
If trustResponder is set to YES, signature verification will be skipped for the OCSP response.
Possible values = YES, NO

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

### -OCSPURLResolveTimeout
Time, in milliseconds, to wait for an OCSP URL Resolution.
When this time elapses, an error message appears or the transaction is forwarded, depending on the settings on the virtual server.
Minimum value = 100 Maximum value = 2000

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

### -OCSPUsenonce
Enable the OCSP nonce extension, which is designed to prevent replay attacks.
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

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

