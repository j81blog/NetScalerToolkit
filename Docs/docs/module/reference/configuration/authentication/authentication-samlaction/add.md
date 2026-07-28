---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddAuthenticationSAMLAction

## SYNOPSIS
Creates a NetScaler authenticationsamlaction resource.

## SYNTAX

```
Invoke-NSAddAuthenticationSAMLAction [-ArtifactresolutionServiceURL <String>] [-Attribute1 <String>]
 [-Attribute10 <String>] [-Attribute11 <String>] [-Attribute12 <String>] [-Attribute13 <String>]
 [-Attribute14 <String>] [-Attribute15 <String>] [-Attribute16 <String>] [-Attribute2 <String>]
 [-Attribute3 <String>] [-Attribute4 <String>] [-Attribute5 <String>] [-Attribute6 <String>]
 [-Attribute7 <String>] [-Attribute8 <String>] [-Attribute9 <String>] [-AttributeconsuMinGServiceIndex <Int32>]
 [-Attributes <String>] [-Audience <String>] [-AuthnCtxclassref <String[]>] [-CustomAuthnCtxclassref <String>]
 [-DefaultAuthenticationGroup <String>] [-DigestMethod <String>] [-EnforceUserName <String>]
 [-ForceAuthn <String>] [-GroupNameField <String>] [-LogoutBinding <String>] [-LogoutURL <String>]
 [-MetaDataRefreshInterval <Int32>] [-MetaDataURL <String>] [-Name] <String> [-PreferredbindType <String[]>]
 [-Relaystaterule <String>] [-RequestEdAuthnConText <String>] [-SAMLAcsindex <Int32>] [-SAMLBinding <String>]
 [-SAMLIdpCertName <String>] [-SAMLIssuerName <String>] [-SAMLRedirectURL <String>]
 [-SAMLRejectunsignedassertion <String>] [-SAMLSigningCertName <String>] [-SAMLTwofactor <String>]
 [-SAMLUserField <String>] [-Sendthumbprint <String>] [-SignatureAlg <String>] [-Skewtime <Int32>]
 [-Statechecks <String>] [-StoreSAMLResponse <String>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for AAA Saml action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddAuthenticationSAMLAction -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddAuthenticationSAMLAction -Name 'example' -WhatIf
```

## PARAMETERS

### -ArtifactresolutionServiceURL
URL of the Artifact Resolution Service on IdP to which Citrix ADC will post artifact to get actual SAML token.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute1.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute10.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute11.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute12.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute13.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute14.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute15.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute16.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute2.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute3.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute4.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute5.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute6.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute7.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute8.
Maximum length of the extracted attribute is 239 bytes.

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
Name of the attribute in SAML Assertion whose value needs to be extracted and stored as attribute9.
Maximum length of the extracted attribute is 239 bytes.

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

### -AttributeconsuMinGServiceIndex
Index/ID of the attribute specification at Identity Provider (IdP).
IdP will locate attributes requested by SP using this index and send those attributes in Assertion.
Default value: 255 Minimum value = 0 Maximum value = 255

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

### -Attributes
List of attribute names separated by ',' which needs to be extracted.
Note that preceeding and trailing spaces will be removed.
Attribute name can be 127 bytes and total length of this string should not cross 2047 bytes.
These attributes have multi-value support separated by ',' and stored as key-value pair in AAA session.

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

### -AuthnCtxclassref
This element specifies the authentication class types that are requested from IdP (IdentityProvider).
InternetProtocol: This is applicable when a principal is authenticated through the use of a provided IP address.
InternetProtocolPassword: This is applicable when a principal is authenticated through the use of a provided IP address, in addition to a username/password.
Kerberos: This is applicable when the principal has authenticated using a password to a local authentication authority, in order to acquire a Kerberos ticket.
MobileOneFactorUnregistered: This indicates authentication of the mobile device without requiring explicit end-user interaction.
MobileTwoFactorUnregistered: This indicates two-factor based authentication during mobile customer registration process, such as secure device and user PIN.
MobileOneFactorContract: Reflects mobile contract customer registration procedures and a single factor authentication.
MobileTwoFactorContract: Reflects mobile contract customer registration procedures and a two-factor based authentication.
Password: This class is applicable when a principal authenticates using password over unprotected http session.
PasswordProtectedTransport: This class is applicable when a principal authenticates to an authentication authority through the presentation of a password over a protected session.
PreviousSession: This class is applicable when a principal had authenticated to an authentication authority at some point in the past using any authentication context.
X509: This indicates that the principal authenticated by means of a digital signature where the key was validated as part of an X.509 Public Key Infrastructure.
PGP: This indicates that the principal authenticated by means of a digital signature where the key was validated as part of a PGP Public Key Infrastructure.
SPKI: This indicates that the principal authenticated by means of a digital signature where the key was validated via an SPKI Infrastructure.
XMLDSig: This indicates that the principal authenticated by means of a digital signature according to the processing rules specified in the XML Digital Signature specification.
Smartcard: This indicates that the principal has authenticated using smartcard.
SmartcardPKI: This class is applicable when a principal authenticates to an authentication authority through a two-factor authentication mechanism using a smartcard with enclosed private key and a PIN.
SoftwarePKI: This class is applicable when a principal uses an X.509 certificate stored in software to authenticate to the authentication authority.
Telephony: This class is used to indicate that the principal authenticated via the provision of a fixed-line telephone number, transported via a telephony protocol such as ADSL.
NomadTelephony: Indicates that the principal is "roaming" and authenticates via the means of the line number, a user suffix, and a password element.
PersonalTelephony: This class is used to indicate that the principal authenticated via the provision of a fixed-line telephone.
AuthenticatedTelephony: Indicates that the principal authenticated via the means of the line number, a user suffix, and a password element.
SecureRemotePassword: This class is applicable when the authentication was performed by means of Secure Remote Password.
TLSClient: This class indicates that the principal authenticated by means of a client certificate, secured with the SSL/TLS transport.
TimeSyncToken: This is applicable when a principal authenticates through a time synchronization token.
Unspecified: This indicates that the authentication was performed by unspecified means.
Windows: This indicates that Windows integrated authentication is utilized for authentication.
Possible values = InternetProtocol, InternetProtocolPassword, Kerberos, MobileOneFactorUnregistered, MobileTwoFactorUnregistered, MobileOneFactorContract, MobileTwoFactorContract, Password, PasswordProtectedTransport, PreviousSession, X509, PGP, SPKI, XMLDSig, Smartcard, SmartcardPKI, SoftwarePKI, Telephony, NomadTelephony, PersonalTelephony, AuthenticatedTelephony, SecureRemotePassword, TLSClient, TimeSyncToken, Unspecified, Windows

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomAuthnCtxclassref
This element specifies the custom authentication class reference to be sent as a part of the Authentication Request that is sent by the SP to SAML IDP.
The input string must be the body of the authentication class being requested.
Input format: Alphanumeric string or URL specifying the body of the Request.If more than one string has to be provided, then the same can be done by specifying the classes as a string of comma separated values.
Example input: set authentication samlaction samlact1 -customAuthnCtxClassRef http://www.class1.com/LoA1,http://www.class2.com/LoA2 .
Maximum length = 512

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
This is the default group that is chosen when the authentication succeeds in addition to extracted groups.

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

### -EnforceUserName
Option to choose whether the username that is extracted from SAML assertion can be edited in login page while doing second factor.
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

### -ForceAuthn
Option that forces authentication at the Identity Provider (IdP) that receives Citrix ADC's request.
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

### -GroupNameField
Name of the tag in assertion that contains user groups.

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

### -LogoutURL
SingleLogout URL on IdP to which logoutRequest will be sent on Citrix ADC session cleanup.

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
Interval in minutes for fetching metadata from specified metadata URL.
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
This URL is used for obtaining saml metadata.
Note that it fills samlIdPCertName and samlredirectUrl fields so those fields should not be updated when metadataUrl present.

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
Name for the SAML server profile (action).
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Cannot be changed after SAML profile is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my authentication action" or 'my authentication action').
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

### -PreferredbindType
This element specifies the preferred binding types for sso and logout for metadata configuration.
. Possible values = SSOREDIRECT, LOGOUTPOST

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Relaystaterule
Boolean expression that will be evaluated to validate the SAML Response.
Examples: set authentication samlaction \<actionname\> -relaystateRule 'AAA.LOGIN.RELAYSTATE.EQ("https://fqdn.com/")' set authentication samlaction \<actionname\> -relaystateRule 'AAA.LOGIN.RELAYSTATE.CONTAINS("https://fqdn.com/")' set authentication samlaction \<actionname\> -relaystateRule 'AAA.LOGIN.RELAYSTATE.CONTAINS_ANY("patset_name")' set authentication samlAction samlsp -relaystateRule 'AAA.LOGIN.RELAYSTATE.REGEX_MATCH(re#http://\<regex\>.com/#)'.
Maximum length = 8192

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

### -RequestEdAuthnConText
This element specifies the authentication context requirements of authentication statements returned in the response.
Default value: exact Possible values = exact, minimum, maximum, better

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

### -SAMLAcsindex
Index/ID of the metadata entry corresponding to this configuration.
Default value: 255 Minimum value = 0 Maximum value = 255

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
Name of the SSL certificate used to verify responses from SAML Identity Provider (IdP).
Note that if metadateURL is present then this filed should be empty.
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

### -SAMLRedirectURL
URL to which users are redirected for authentication.
Note that if metadateURL is present then this filed should be empty.
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

### -SAMLRejectunsignedassertion
Reject unsigned SAML assertions.
ON option results in rejection of Assertion that is received without signature.
STRICT option ensures that both Response and Assertion are signed.
Default value: ON Possible values = ON, STRICT

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

### -SAMLSigningCertName
Name of the SSL certificate to sign requests from ServiceProvider (SP) to Identity Provider (IdP).
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

### -SAMLTwofactor
Option to enable second factor after SAML.
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

### -SAMLUserField
SAML user ID, as given in the SAML assertion.
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

### -Sendthumbprint
Option to send thumbprint instead of x509 certificate in SAML request.
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

### -Skewtime
This option specifies the allowed clock skew in number of minutes that Citrix ADC ServiceProvider allows on an incoming assertion.
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

### -Statechecks
Boolean expression that will be evaluated to validate HTTP requests on SAML endpoints.
Examples: set authentication samlaction \<actionname\> -stateChecks 'HTTP.REQ.HOSTNAME.EQ("https://fqdn.com/")' .
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

### -StoreSAMLResponse
Option to store entire SAML Response through the life of user session.
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

