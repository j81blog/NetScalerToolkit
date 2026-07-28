---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetVPNSAMLSSOProfile

## SYNOPSIS
Clears one or more NetScaler vpnsamlssoprofile resource properties.

## SYNTAX

```
Invoke-NSUnsetVPNSAMLSSOProfile [-Name] <String> [-Attribute1] [-Attribute10] [-Attribute10FormAt]
 [-Attribute10friendlyName] [-Attribute11] [-Attribute11FormAt] [-Attribute11friendlyName] [-Attribute12]
 [-Attribute12FormAt] [-Attribute12friendlyName] [-Attribute13] [-Attribute13FormAt] [-Attribute13friendlyName]
 [-Attribute14] [-Attribute14FormAt] [-Attribute14friendlyName] [-Attribute15] [-Attribute15FormAt]
 [-Attribute15friendlyName] [-Attribute16] [-Attribute16FormAt] [-Attribute16friendlyName] [-Attribute1FormAt]
 [-Attribute1friendlyName] [-Attribute2] [-Attribute2FormAt] [-Attribute2friendlyName] [-Attribute3]
 [-Attribute3FormAt] [-Attribute3friendlyName] [-Attribute4] [-Attribute4FormAt] [-Attribute4friendlyName]
 [-Attribute5] [-Attribute5FormAt] [-Attribute5friendlyName] [-Attribute6] [-Attribute6FormAt]
 [-Attribute6friendlyName] [-Attribute7] [-Attribute7FormAt] [-Attribute7friendlyName] [-Attribute8]
 [-Attribute8FormAt] [-Attribute8friendlyName] [-Attribute9] [-Attribute9FormAt] [-Attribute9friendlyName]
 [-Audience] [-DigestMethod] [-Encryptassertion] [-Encryptionalgorithm] [-NameIdexpr] [-NameIdFormAt]
 [-Relaystaterule] [-SAMLIssuerName] [-SAMLSigningCertName] [-SAMLSpCertName] [-Sendpassword] [-Signassertion]
 [-SignatureAlg] [-SignaturesErvice] [-Skewtime] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for SAML sso action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetVPNSAMLSSOProfile -Name 'example' -Attribute1  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetVPNSAMLSSOProfile -Name 'example' -Attribute1  -WhatIf
```

## PARAMETERS

### -Name
Name for the new saml single sign-on profile.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after an SSO action is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my action" or 'my action').
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

### -Attribute1
Name of attribute1 that needs to be sent in SAML Assertion.

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

### -Attribute10
Name of attribute10 that needs to be sent in SAML Assertion.

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

### -Attribute10FormAt
Format of Attribute10 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute10friendlyName
User-Friendly Name of attribute10 that needs to be sent in SAML Assertion.

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

### -Attribute11
Name of attribute11 that needs to be sent in SAML Assertion.

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

### -Attribute11FormAt
Format of Attribute11 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute11friendlyName
User-Friendly Name of attribute11 that needs to be sent in SAML Assertion.

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

### -Attribute12
Name of attribute12 that needs to be sent in SAML Assertion.

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

### -Attribute12FormAt
Format of Attribute12 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute12friendlyName
User-Friendly Name of attribute12 that needs to be sent in SAML Assertion.

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

### -Attribute13
Name of attribute13 that needs to be sent in SAML Assertion.

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

### -Attribute13FormAt
Format of Attribute13 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute13friendlyName
User-Friendly Name of attribute13 that needs to be sent in SAML Assertion.

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

### -Attribute14
Name of attribute14 that needs to be sent in SAML Assertion.

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

### -Attribute14FormAt
Format of Attribute14 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute14friendlyName
User-Friendly Name of attribute14 that needs to be sent in SAML Assertion.

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

### -Attribute15
Name of attribute15 that needs to be sent in SAML Assertion.

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

### -Attribute15FormAt
Format of Attribute15 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute15friendlyName
User-Friendly Name of attribute15 that needs to be sent in SAML Assertion.

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

### -Attribute16
Name of attribute16 that needs to be sent in SAML Assertion.

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

### -Attribute16FormAt
Format of Attribute16 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute16friendlyName
User-Friendly Name of attribute16 that needs to be sent in SAML Assertion.

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

### -Attribute1FormAt
Format of Attribute1 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute1friendlyName
User-Friendly Name of attribute1 that needs to be sent in SAML Assertion.

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

### -Attribute2
Name of attribute2 that needs to be sent in SAML Assertion.

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

### -Attribute2FormAt
Format of Attribute2 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute2friendlyName
User-Friendly Name of attribute2 that needs to be sent in SAML Assertion.

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

### -Attribute3
Name of attribute3 that needs to be sent in SAML Assertion.

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

### -Attribute3FormAt
Format of Attribute3 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute3friendlyName
User-Friendly Name of attribute3 that needs to be sent in SAML Assertion.

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

### -Attribute4
Name of attribute4 that needs to be sent in SAML Assertion.

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

### -Attribute4FormAt
Format of Attribute4 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute4friendlyName
User-Friendly Name of attribute4 that needs to be sent in SAML Assertion.

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

### -Attribute5
Name of attribute5 that needs to be sent in SAML Assertion.

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

### -Attribute5FormAt
Format of Attribute5 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute5friendlyName
User-Friendly Name of attribute5 that needs to be sent in SAML Assertion.

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

### -Attribute6
Name of attribute6 that needs to be sent in SAML Assertion.

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

### -Attribute6FormAt
Format of Attribute6 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute6friendlyName
User-Friendly Name of attribute6 that needs to be sent in SAML Assertion.

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

### -Attribute7
Name of attribute7 that needs to be sent in SAML Assertion.

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

### -Attribute7FormAt
Format of Attribute7 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute7friendlyName
User-Friendly Name of attribute7 that needs to be sent in SAML Assertion.

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

### -Attribute8
Name of attribute8 that needs to be sent in SAML Assertion.

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

### -Attribute8FormAt
Format of Attribute8 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute8friendlyName
User-Friendly Name of attribute8 that needs to be sent in SAML Assertion.

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

### -Attribute9
Name of attribute9 that needs to be sent in SAML Assertion.

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

### -Attribute9FormAt
Format of Attribute9 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute9friendlyName
User-Friendly Name of attribute9 that needs to be sent in SAML Assertion.

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

### -Audience
Audience for which assertion sent by IdP is applicable.
This is typically entity name or url that represents ServiceProvider.

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

### -DigestMethod
Algorithm to be used to compute/verify digest for SAML transactions.
Default value: SHA256 Possible values = SHA1, SHA256

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

### -Encryptassertion
Option to encrypt assertion when Citrix ADC sends one.
Default value: OFF Possible values = ON, OFF

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

### -Encryptionalgorithm
Algorithm to be used to encrypt SAML assertion.
Default value: AES256 Possible values = DES3, AES128, AES192, AES256

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

### -NameIdexpr
Expression that will be evaluated to obtain NameIdentifier to be sent in assertion.
Maximum length = 128

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

### -NameIdFormAt
Format of Name Identifier sent in Assertion.
Default value: transient Possible values = Unspecified, emailAddress, X509SubjectName, WindowsDomainQualifiedName, kerberos, entity, persistent, transient

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

### -Relaystaterule
Expression to extract relaystate to be sent along with assertion.
Evaluation of this expression should return TEXT content.
This is typically a target url to which user is redirected after the recipient validates SAML token.

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

### -SAMLIssuerName
The name to be used in requests sent from Citrix ADC to IdP to uniquely identify Citrix ADC.
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

### -SAMLSigningCertName
Name of the signing authority as given in the SAML server's SSL certificate.
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

### -SAMLSpCertName
Name of the SSL certificate of peer/receving party using which Assertion is encrypted.
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

### -Sendpassword
Option to send password in assertion.
Default value: OFF Possible values = ON, OFF

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

### -Signassertion
Option to sign portions of assertion when Citrix ADC IDP sends one.
Based on the user selection, either Assertion or Response or Both or none can be signed.
Default value: ASSERTION Possible values = NONE, ASSERTION, RESPONSE, BOTH

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

### -SignatureAlg
Algorithm to be used to sign/verify SAML transactions.
Default value: RSA-SHA256 Possible values = RSA-SHA1, RSA-SHA256

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

### -SignaturesErvice
Name of the service in cloud used to sign the data.
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

### -Skewtime
This option specifies the number of minutes on either side of current time that the assertion would be valid.
For example, if skewTime is 10, then assertion would be valid from (current time - 10) min to (current time + 10) min, ie 20min in all.
Default value: 5

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

