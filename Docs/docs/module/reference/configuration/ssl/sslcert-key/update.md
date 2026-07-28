---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateSSLCertKey

## SYNOPSIS
Invokes the change operation for a NetScaler sslcertkey resource.

## SYNTAX

```
Invoke-NSUpdateSSLCertKey [-Cert <String>] [-CertKey] <String> [-FipsKey <String>] [-InForm <String>]
 [-Key <String>] [-Nodomaincheck <Boolean>] [-Passplain <String>] [-Password <Boolean>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for certificate key resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateSSLCertKey -CertKey 'example'
```

### EXAMPLE 2
```
Invoke-NSUpdateSSLCertKey -CertKey 'example' -WhatIf
```

## PARAMETERS

### -Cert
Name of and, optionally, path to the X509 certificate file that is used to form the certificate-key pair.
The certificate file should be present on the appliance's hard-disk drive or solid-state drive.
Storing a certificate in any location other than the default might cause inconsistency in a high availability setup.
/nsconfig/ssl/ is the default path.
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

### -CertKey
Name for the certificate and private-key pair.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after the certificate-key pair is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cert" or 'my cert').
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

### -FipsKey
Name of the FIPS key that was created inside the Hardware Security Module (HSM) of a FIPS appliance, or a key that was imported into the HSM.
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

### -InForm
Input format of the certificate and the private-key files.
The three formats supported by the appliance are: PEM - Privacy Enhanced Mail DER - Distinguished Encoding Rule PFX - Personal Information Exchange.
Default value: PEM Possible values = DER, PEM, PFX

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

### -Key
Name of and, optionally, path to the private-key file that is used to form the certificate-key pair.
The certificate file should be present on the appliance's hard-disk drive or solid-state drive.
Storing a certificate in any location other than the default might cause inconsistency in a high availability setup.
/nsconfig/ssl/ is the default path.
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

### -Nodomaincheck
Override the check for matching domain names during a certificate update operation.

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

### -Passplain
Pass phrase used to encrypt the private-key.
Required when adding an encrypted private-key in PEM format.
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

### -Password
Passphrase that was used to encrypt the private-key.
Use this option to load encrypted private-keys in PEM format.

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

