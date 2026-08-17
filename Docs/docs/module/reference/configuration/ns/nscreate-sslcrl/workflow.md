---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSCreateSSLCrl

## SYNOPSIS
Invokes the create operation for a NetScaler sslcrl resource.

## SYNTAX

```
Invoke-NSCreateSSLCrl [-CaCertFile] <String> [-CaKeyFile] <String> [[-Gencrl] <String>] [-IndexFile] <String>
 [[-Password] <String>] [[-Revoke] <String>] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Certificate Revocation List resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSCreateSSLCrl -CaCertFile 'example' -CaKeyFile 'example' -IndexFile 'example'
```

### EXAMPLE 2
```
Invoke-NSCreateSSLCrl -CaCertFile 'example' -CaKeyFile 'example' -IndexFile 'example' -WhatIf
```

## PARAMETERS

### -CaCertFile
Name of and, optionally, path to the CA certificate file.
/nsconfig/ssl/ is the default path.
Maximum length = 63

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

### -CaKeyFile
Name of and, optionally, path to the CA key file.
/nsconfig/ssl/ is the default path.
Maximum length = 63

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Gencrl
Name of and, optionally, path to the CRL file to be generated.
The list of certificates that have been revoked is obtained from the index file.
/nsconfig/ssl/ is the default path.
Maximum length = 63

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

### -IndexFile
Name of and, optionally, path to the file containing the serial numbers of all the certificates that are revoked.
Revoked certificates are appended to the file.
/nsconfig/ssl/ is the default path.
Maximum length = 63

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password to access the CRL in the LDAP repository if access to the LDAP repository is restricted or anonymous access is not allowed.
Minimum length = 1

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

### -Revoke
Name of and, optionally, path to the certificate to be revoked.
/nsconfig/ssl/ is the default path.
Maximum length = 63

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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
Position: 7
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

