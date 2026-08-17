---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateAuthenticationSAMLIDPProfile

## SYNOPSIS
Updates a NetScaler authenticationsamlidpprofile resource.

## SYNTAX

```
Invoke-NSUpdateAuthenticationSAMLIDPProfile [-AcsURLRule <String>] [-AssertionconsumerServiceURL <String>]
 [-Attribute1 <String>] [-Attribute10 <String>] [-Attribute10expr <String>] [-Attribute10FormAt <String>]
 [-Attribute10friendlyName <String>] [-Attribute11 <String>] [-Attribute11expr <String>]
 [-Attribute11FormAt <String>] [-Attribute11friendlyName <String>] [-Attribute12 <String>]
 [-Attribute12expr <String>] [-Attribute12FormAt <String>] [-Attribute12friendlyName <String>]
 [-Attribute13 <String>] [-Attribute13expr <String>] [-Attribute13FormAt <String>]
 [-Attribute13friendlyName <String>] [-Attribute14 <String>] [-Attribute14expr <String>]
 [-Attribute14FormAt <String>] [-Attribute14friendlyName <String>] [-Attribute15 <String>]
 [-Attribute15expr <String>] [-Attribute15FormAt <String>] [-Attribute15friendlyName <String>]
 [-Attribute16 <String>] [-Attribute16expr <String>] [-Attribute16FormAt <String>]
 [-Attribute16friendlyName <String>] [-Attribute1expr <String>] [-Attribute1FormAt <String>]
 [-Attribute1friendlyName <String>] [-Attribute2 <String>] [-Attribute2expr <String>]
 [-Attribute2FormAt <String>] [-Attribute2friendlyName <String>] [-Attribute3 <String>]
 [-Attribute3expr <String>] [-Attribute3FormAt <String>] [-Attribute3friendlyName <String>]
 [-Attribute4 <String>] [-Attribute4expr <String>] [-Attribute4FormAt <String>]
 [-Attribute4friendlyName <String>] [-Attribute5 <String>] [-Attribute5expr <String>]
 [-Attribute5FormAt <String>] [-Attribute5friendlyName <String>] [-Attribute6 <String>]
 [-Attribute6expr <String>] [-Attribute6FormAt <String>] [-Attribute6friendlyName <String>]
 [-Attribute7 <String>] [-Attribute7expr <String>] [-Attribute7FormAt <String>]
 [-Attribute7friendlyName <String>] [-Attribute8 <String>] [-Attribute8expr <String>]
 [-Attribute8FormAt <String>] [-Attribute8friendlyName <String>] [-Attribute9 <String>]
 [-Attribute9expr <String>] [-Attribute9FormAt <String>] [-Attribute9friendlyName <String>]
 [-Audience <String>] [-DefaultAuthenticationGroup <String>] [-DigestMethod <String>]
 [-Encryptassertion <String>] [-Encryptionalgorithm <String>] [-KeyTransPortAlg <String>]
 [-LogoutBinding <String>] [-MetaDataRefreshInterval <Int32>] [-MetaDataURL <String>] [-Name] <String>
 [-NameIdexpr <String>] [-NameIdFormAt <String>] [-RejectunsignedRequestS <String>] [-SAMLBinding <String>]
 [-SAMLIdpCertName <String>] [-SAMLIssuerName <String>] [-SAMLSigningCertVersion <String>]
 [-SAMLSpCertName <String>] [-SAMLSpCertVersion <String>] [-Sendpassword <String>]
 [-ServiceProviderid <String>] [-Signassertion <String>] [-SignatureAlg <String>] [-SignaturesErvice <String>]
 [-Skewtime <Int32>] [-SplogoutURL <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for AAA Saml IdentityProvider (IdP) profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateAuthenticationSAMLIDPProfile -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateAuthenticationSAMLIDPProfile -Name 'example' -WhatIf
```

## PARAMETERS

### -AcsURLRule
Expression that will be evaluated to allow Assertion Consumer Service URI coming in the SAML Request.
Maximum length = 8191

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

### -AssertionconsumerServiceURL
URL to which the assertion is to be sent.
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

### -Attribute1
Name of attribute1 that needs to be sent in SAML Assertion.

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

### -Attribute10
Name of attribute10 that needs to be sent in SAML Assertion.

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

### -Attribute10expr
Expression that will be evaluated to obtain attribute10's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute10FormAt
Format of Attribute10 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute10friendlyName
User-Friendly Name of attribute10 that needs to be sent in SAML Assertion.

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

### -Attribute11
Name of attribute11 that needs to be sent in SAML Assertion.

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

### -Attribute11expr
Expression that will be evaluated to obtain attribute11's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute11FormAt
Format of Attribute11 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute11friendlyName
User-Friendly Name of attribute11 that needs to be sent in SAML Assertion.

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

### -Attribute12
Name of attribute12 that needs to be sent in SAML Assertion.

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

### -Attribute12expr
Expression that will be evaluated to obtain attribute12's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute12FormAt
Format of Attribute12 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute12friendlyName
User-Friendly Name of attribute12 that needs to be sent in SAML Assertion.

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

### -Attribute13
Name of attribute13 that needs to be sent in SAML Assertion.

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

### -Attribute13expr
Expression that will be evaluated to obtain attribute13's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute13FormAt
Format of Attribute13 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute13friendlyName
User-Friendly Name of attribute13 that needs to be sent in SAML Assertion.

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

### -Attribute14
Name of attribute14 that needs to be sent in SAML Assertion.

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

### -Attribute14expr
Expression that will be evaluated to obtain attribute14's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute14FormAt
Format of Attribute14 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute14friendlyName
User-Friendly Name of attribute14 that needs to be sent in SAML Assertion.

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

### -Attribute15
Name of attribute15 that needs to be sent in SAML Assertion.

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

### -Attribute15expr
Expression that will be evaluated to obtain attribute15's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute15FormAt
Format of Attribute15 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute15friendlyName
User-Friendly Name of attribute15 that needs to be sent in SAML Assertion.

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

### -Attribute16
Name of attribute16 that needs to be sent in SAML Assertion.

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

### -Attribute16expr
Expression that will be evaluated to obtain attribute16's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute16FormAt
Format of Attribute16 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute16friendlyName
User-Friendly Name of attribute16 that needs to be sent in SAML Assertion.

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

### -Attribute1expr
Expression that will be evaluated to obtain attribute1's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute1FormAt
Format of Attribute1 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute1friendlyName
User-Friendly Name of attribute1 that needs to be sent in SAML Assertion.

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

### -Attribute2
Name of attribute2 that needs to be sent in SAML Assertion.

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

### -Attribute2expr
Expression that will be evaluated to obtain attribute2's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute2FormAt
Format of Attribute2 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute2friendlyName
User-Friendly Name of attribute2 that needs to be sent in SAML Assertion.

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

### -Attribute3
Name of attribute3 that needs to be sent in SAML Assertion.

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

### -Attribute3expr
Expression that will be evaluated to obtain attribute3's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute3FormAt
Format of Attribute3 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute3friendlyName
User-Friendly Name of attribute3 that needs to be sent in SAML Assertion.

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

### -Attribute4
Name of attribute4 that needs to be sent in SAML Assertion.

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

### -Attribute4expr
Expression that will be evaluated to obtain attribute4's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute4FormAt
Format of Attribute4 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute4friendlyName
User-Friendly Name of attribute4 that needs to be sent in SAML Assertion.

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

### -Attribute5
Name of attribute5 that needs to be sent in SAML Assertion.

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

### -Attribute5expr
Expression that will be evaluated to obtain attribute5's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute5FormAt
Format of Attribute5 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute5friendlyName
User-Friendly Name of attribute5 that needs to be sent in SAML Assertion.

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

### -Attribute6
Name of attribute6 that needs to be sent in SAML Assertion.

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

### -Attribute6expr
Expression that will be evaluated to obtain attribute6's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute6FormAt
Format of Attribute6 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute6friendlyName
User-Friendly Name of attribute6 that needs to be sent in SAML Assertion.

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

### -Attribute7
Name of attribute7 that needs to be sent in SAML Assertion.

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

### -Attribute7expr
Expression that will be evaluated to obtain attribute7's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute7FormAt
Format of Attribute7 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute7friendlyName
User-Friendly Name of attribute7 that needs to be sent in SAML Assertion.

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

### -Attribute8
Name of attribute8 that needs to be sent in SAML Assertion.

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

### -Attribute8expr
Expression that will be evaluated to obtain attribute8's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute8FormAt
Format of Attribute8 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute8friendlyName
User-Friendly Name of attribute8 that needs to be sent in SAML Assertion.

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

### -Attribute9
Name of attribute9 that needs to be sent in SAML Assertion.

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

### -Attribute9expr
Expression that will be evaluated to obtain attribute9's value to be sent in Assertion.
Maximum length = 128

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

### -Attribute9FormAt
Format of Attribute9 to be sent in Assertion.
Possible values = URI, Basic

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

### -Attribute9friendlyName
User-Friendly Name of attribute9 that needs to be sent in SAML Assertion.

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

### -Audience
Audience for which assertion sent by IdP is applicable.
This is typically entity name or url that represents ServiceProvider.

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

### -DefaultAuthenticationGroup
This group will be part of AAA session's internal group list.
This will be helpful to admin in Nfactor flow to decide right AAA configuration for Relaying Party.
In authentication policy AAA.USER.IS_MEMBER_OF("\<default_auth_group\>") is way to use this feature.

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

### -DigestMethod
Algorithm to be used to compute/verify digest for SAML transactions.
Default value: SHA256 Possible values = SHA1, SHA256

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

### -Encryptassertion
Option to encrypt assertion when Citrix ADC IDP sends one.
Default value: OFF Possible values = ON, OFF

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

### -Encryptionalgorithm
Algorithm to be used to encrypt SAML assertion.
Default value: AES256 Possible values = DES3, AES128, AES192, AES256

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

### -KeyTransPortAlg
Key transport algorithm to be used in encryption of SAML assertion.
Default value: RSA_OAEP Possible values = RSA-V1_5, RSA_OAEP

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

### -LogoutBinding
This element specifies the transport mechanism of saml logout messages.
Default value: POST Possible values = REDIRECT, POST

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

### -MetaDataRefreshInterval
Interval in minute for fetching metadata from specified metadata URL.
Default value: 3600

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

### -MetaDataURL
This URL is used for obtaining samlidp metadata.

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
Name for the new saml single sign-on profile.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after an action is created.
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

### -NameIdexpr
Expression that will be evaluated to obtain NameIdentifier to be sent in assertion.
Maximum length = 128

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

### -NameIdFormAt
Format of Name Identifier sent in Assertion.
Default value: transient Possible values = Unspecified, emailAddress, X509SubjectName, WindowsDomainQualifiedName, kerberos, entity, persistent, transient

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

### -RejectunsignedRequestS
Option to Reject unsigned SAML Requests.
ON option denies any authentication requests that arrive without signature.
Default value: ON Possible values = ON, OFF

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

### -SAMLBinding
This element specifies the transport mechanism of saml messages.
Default value: POST Possible values = REDIRECT, POST, ARTIFACT

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

### -SAMLIdpCertName
Name of the certificate used to sign the SAMLResposne that is sent to Relying Party or Service Provider after successful authentication.
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

### -SAMLIssuerName
The name to be used in requests sent from Citrix ADC to IdP to uniquely identify Citrix ADC.
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

### -SAMLSigningCertVersion
version of the certificate in signature service used to sign the SAMLResposne that is sent to Relying Party or Service Provider after successful authentication.
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

### -SAMLSpCertName
Name of the SSL certificate of SAML Relying Party.
This certificate is used to verify signature of the incoming AuthnRequest from a Relying Party or Service Provider.
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

### -SAMLSpCertVersion
version of the certificate in signature service used to verify the signature of the incoming AuthnRequest from a Relying Party or Service Provider.
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

### -Sendpassword
Option to send password in assertion.
Default value: OFF Possible values = ON, OFF

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

### -ServiceProviderid
Unique identifier of the Service Provider that sends SAML Request.
Citrix ADC will ensure that the Issuer of the SAML Request matches this URI.
In case of SP initiated sign-in scenarios, this value must be same as samlIssuerName configured in samlAction.
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

### -Signassertion
Option to sign portions of assertion when Citrix ADC IDP sends one.
Based on the user selection, either Assertion or Response or Both or none can be signed.
Default value: ASSERTION Possible values = NONE, ASSERTION, RESPONSE, BOTH

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

### -SignatureAlg
Algorithm to be used to sign/verify SAML transactions.
Default value: RSA-SHA256 Possible values = RSA-SHA1, RSA-SHA256

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

### -SignaturesErvice
Name of the service in cloud used to sign the data.
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

### -Skewtime
This option specifies the number of minutes on either side of current time that the assertion would be valid.
For example, if skewTime is 10, then assertion would be valid from (current time - 10) min to (current time + 10) min, ie 20min in all.
Default value: 5

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

### -SplogoutURL
Endpoint on the ServiceProvider (SP) to which logout messages are to be sent.
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

