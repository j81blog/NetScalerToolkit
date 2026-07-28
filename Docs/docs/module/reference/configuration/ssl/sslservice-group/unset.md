---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetSSLServiceGroup

## SYNOPSIS
Clears one or more NetScaler sslservicegroup resource properties.

## SYNTAX

```
Invoke-NSUnsetSSLServiceGroup [-ServiceGroupName] <String> [-ComMonName] [-OCSPStapling] [-Sendclosenotify]
 [-ServerAuth] [-Sessreuse] [-SessTimeout] [-Snienable] [-SSL3] [-SSLClientLogs] [-SSLProfile]
 [-Strictsigdigestcheck] [-Tls1] [-Tls11] [-Tls12] [-Tls13] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for SSL service group resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetSSLServiceGroup -ServiceGroupName 'example' -ComMonName  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetSSLServiceGroup -ServiceGroupName 'example' -ComMonName  -WhatIf
```

## PARAMETERS

### -ServiceGroupName
Name of the SSL service group for which to set advanced configuration.
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

### -OCSPStapling
State of OCSP stapling support on the SSL virtual server.
Supported only if the protocol used is higher than SSLv3.
Possible values: ENABLED: The appliance sends a request to the OCSP responder to check the status of the server certificate and caches the response for the specified time.
If the response is valid at the time of SSL handshake with the client, the OCSP-based server certificate status is sent to the client during the handshake.
DISABLED: The appliance does not check the status of the server certificate.
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
State of server authentication support for the SSL service group.
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
Default value: 300 Minimum value = 0 Maximum value = 4294967294

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
State of the Server Name Indication (SNI) feature on the service.
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

### -SSL3
State of SSLv3 protocol support for the SSL service group.
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
Name of the SSL profile that contains SSL settings for the Service Group.
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

### -Strictsigdigestcheck
Parameter indicating to check whether peer's certificate is signed with one of signature-hash combination supported by Citrix ADC.
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
State of TLSv1.0 protocol support for the SSL service group.
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
State of TLSv1.1 protocol support for the SSL service group.
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
State of TLSv1.2 protocol support for the SSL service group.
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
State of TLSv1.3 protocol support for the SSL service group.
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

