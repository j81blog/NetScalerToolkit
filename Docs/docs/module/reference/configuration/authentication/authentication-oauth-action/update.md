---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateAuthenticationOAuthAction

## SYNOPSIS
Updates a NetScaler authenticationoauthaction resource.

## SYNTAX

```
Invoke-NSUpdateAuthenticationOAuthAction [-Allowedalgorithms <String[]>] [-Attribute1 <String>]
 [-Attribute10 <String>] [-Attribute11 <String>] [-Attribute12 <String>] [-Attribute13 <String>]
 [-Attribute14 <String>] [-Attribute15 <String>] [-Attribute16 <String>] [-Attribute2 <String>]
 [-Attribute3 <String>] [-Attribute4 <String>] [-Attribute5 <String>] [-Attribute6 <String>]
 [-Attribute7 <String>] [-Attribute8 <String>] [-Attribute9 <String>] [-Attributes <String>]
 [-Audience <String>] [-Authentication <String>] [-Authorizationendpoint <String>] [-CertEndpoint <String>]
 [-CertFilePath <String>] [-ClientId <String>] [-ClientsEcret <String>] [-DefaultAuthenticationGroup <String>]
 [-GrantType <String>] [-Graphendpoint <String>] [-Idtokendecryptendpoint <String>] [-IntroSpecTURL <String>]
 [-Intunedeviceidexpression <String>] [-Issuer <String>] [-MetaDataURL <String>] [-Name] <String>
 [-OAuthMiscflags <String[]>] [-OAuthType <String>] [-Pkce <String>] [-RefreshInterval <Int32>]
 [-RequestAttribute <String>] [-Resourceuri <String>] [-Skewtime <Int32>] [-Tenantid <String>]
 [-Tokenendpoint <String>] [-TokenendpointauthMethod <String>] [-UserInfoURL <String>]
 [-UserNameField <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for OAuth authentication action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateAuthenticationOAuthAction -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateAuthenticationOAuthAction -Name 'example' -WhatIf
```

## PARAMETERS

### -Allowedalgorithms
Multivalued option to specify allowed token verification algorithms.
. Default value: OAUTH_ALG_ALL Possible values = HS256, RS256, RS512, HS512

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

### -Attribute1
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute1.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute10.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute11.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute12.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute13.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute14.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute15.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute16.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute2.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute3.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute4.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute5.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute6.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute7.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute8.

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
Name of the attribute to be extracted from OAuth Token and to be stored in the attribute9.

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

### -Attributes
List of attribute names separated by ',' which needs to be extracted.
Note that preceding and trailing spaces will be removed.
Attribute name can be 127 bytes and total length of this string should not cross 1023 bytes.
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
Audience for which token sent by Authorization server is applicable.
This is typically entity name or url that represents the recipient.

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

### -Authentication
If authentication is disabled, password is not sent in the request.
. Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Authorizationendpoint
Authorization endpoint/url to which unauthenticated user will be redirected.
Citrix ADC redirects user to this endpoint by adding query parameters including clientid.
If this parameter not specified then as default value we take Token Endpoint/URL value.
Please note that Authorization Endpoint or Token Endpoint is mandatory for oauthAction.

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

### -CertEndpoint
URL of the endpoint that contains JWKs (Json Web Key) for JWT (Json Web Token) verification.

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

### -CertFilePath
Path to the file that contains JWKs (Json Web Key) for JWT (Json Web Token) verification.

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

### -ClientId
Unique identity of the client/user who is getting authenticated.
Authorization server infers client configuration using this ID.
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

### -ClientsEcret
Secret string established by user and authorization server.
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

### -GrantType
Grant type support.
value can be code or password.
Default value: CODE Possible values = CODE, PASSWORD

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

### -Graphendpoint
URL of the Graph API service to learn Enterprise Mobility Services (EMS) endpoints.

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

### -Idtokendecryptendpoint
URL to which obtained idtoken will be posted to get a decrypted user identity.
Encrypted idtoken will be obtained by posting OAuth token to token endpoint.
In order to decrypt idtoken, Citrix ADC posts request to the URL configured.

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

### -IntroSpecTURL
URL to which access token would be posted for validation.

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

### -Intunedeviceidexpression
The expression that will be evaluated to obtain IntuneDeviceId for compliance check against IntuneNAC device compliance endpoint.
The expression is applicable when the OAuthType is INTUNE.
The maximum length allowed to be used as IntuneDeviceId for the device compliance check from the computed response after the expression evaluation is 41.
Examples: add authentication oauthAction \<actionName\> -intuneDeviceIdExpression 'AAA.LOGIN.INTUNEURI.AFTER_STR("IntuneDeviceId://")' .

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

### -Issuer
Identity of the server whose tokens are to be accepted.

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

### -MetaDataURL
Well-known configuration endpoint of the Authorization Server.
Citrix ADC fetches server details from this endpoint.
.

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
Name for the OAuth Authentication action.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Cannot be changed after the profile is created.
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

### -OAuthMiscflags
Option to set/unset miscellaneous feature flags.
Available values function as follows: * Base64Encode_Authorization_With_Padding - On setting this value, for endpoints (token and introspect), basic authorization header will be base64 encoded with padding.
* EnableJWTRequest - By enabling this field, Authorisation request to IDP will have jwt signed 'request' parameter.
Possible values = Base64Encode_Authorization_With_Padding, EnableJWTRequest

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

### -OAuthType
Type of the OAuth implementation.
Default value is generic implementation that is applicable for most deployments.
Default value: GENERIC Possible values = GENERIC, INTUNE

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

### -Pkce
Option to enable/disable PKCE flow during authentication.
. Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -RefreshInterval
Interval at which services are monitored for necessary configuration.
Default value: 1440

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

### -RequestAttribute
Name-Value pairs of attributes to be inserted in request parameter.
Configuration format is name=value_expr@@@name2=value2_expr@@@.
'@@@' is used as delimiter between Name-Value pairs.
name is a literal string whose value is 127 characters and does not contain '=' character.
Value is advanced policy expression terminated by @@@ delimiter.
Last value need not contain the delimiter.

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

### -Resourceuri
Resource URL for Oauth configuration.

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
This option specifies the allowed clock skew in number of minutes that Citrix ADC allows on an incoming token.
For example, if skewTime is 10, then token would be valid from (current time - 10) min to (current time + 10) min, ie 20min in all.
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

### -Tenantid
TenantID of the application.
This is usually specific to providers such as Microsoft and usually refers to the deployment identifier.

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

### -Tokenendpoint
URL to which OAuth token will be posted to verify its authenticity.
User obtains this token from Authorization server upon successful authentication.
Citrix ADC will validate presented token by posting it to the URL configured.

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

### -TokenendpointauthMethod
Option to select the variant of token authentication method.
This method is used while exchanging code with IdP.
. Default value: client_secret_post, Possible values = client_secret_post, client_secret_jwt, private_key_jwt, client_secret_basic

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

### -UserInfoURL
URL to which OAuth access token will be posted to obtain user information.

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

### -UserNameField
Attribute in the token from which username should be extracted.
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

