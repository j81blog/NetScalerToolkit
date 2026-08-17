---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetEncryptionKey

## SYNOPSIS
Clears one or more NetScaler nsencryptionkey resource properties.

## SYNTAX

```
Invoke-NSUnsetEncryptionKey [-Name] <String> [-Comment] [-InitializationVector] [-Padding]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for encryption key resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetEncryptionKey -Name 'example' -Comment 'Updated by automation' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetEncryptionKey -Name 'example' -Comment 'Updated by automation' -WhatIf
```

## PARAMETERS

### -Name
Key name.
This follows the same syntax rules as other expression entity names: It must begin with an alpha character (A-Z or a-z) or an underscore (_).
The rest of the characters must be alpha, numeric (0-9) or underscores.
It cannot be re or xp (reserved for regular and XPath expressions).
It cannot be an expression reserved word (e.g.
SYS or HTTP).
It cannot be used for an existing expression object (HTTP callout, patset, dataset, stringmap, or named expression).
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

### -Comment
Comments associated with this encryption key.

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

### -InitializationVector
The initalization voector (IV) for a block cipher, one block of data used to initialize the encryption.
The best practice is to not specify an IV, in which case a new random IV will be generated for each encryption.
The format must be iv_data or keyid_iv_data to include the generated IV in the encrypted data.
The IV should only be specified if it cannot be included in the encrypted data.
The IV length is the cipher block size: RC4 - not used (error if IV is specified) DES - 8 bytes (all modes) DES3 - 8 bytes (all modes) AES128 - 16 bytes (all modes) AES192 - 16 bytes (all modes) AES256 - 16 bytes (all modes).

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

### -Padding
Enables or disables the padding of plaintext to meet the block size requirements of block ciphers: ON - For encryption, PKCS5/7 padding is used, which appends n bytes of value n on the end of the plaintext to bring it to the cipher block lnegth.
If the plaintext length is alraady a multiple of the block length, an additional block with bytes of value block_length will be added.
For decryption, ISO 10126 padding is accepted, which expects the last byte of the block to be the number of added pad bytes.
Note that this accepts PKCS5/7 padding, as well as ANSI_X923 padding.
Padding ON is the default for the ECB and CBD modes.
OFF - No padding.
An Undef error will occur with the ECB or CBC modes if the plaintext length is not a multitple of the cipher block size.
This can be used with the CFB and OFB modes, and with the ECB and CBC modes if the plaintext will always be an integral number of blocks, or if custom padding is implemented using a policy extension function.
Padding OFf is the default for CFB and OFB modes.
Default value: DEFAULT Possible values = OFF, ON

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

