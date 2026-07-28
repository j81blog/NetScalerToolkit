---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetAuthenticationLDAPAction

## SYNOPSIS
Clears one or more NetScaler authenticationldapaction resource properties.

## SYNTAX

```
Invoke-NSUnsetAuthenticationLDAPAction [-Name] <String> [-AlternateEmailAttr] [-Attribute1] [-Attribute10]
 [-Attribute11] [-Attribute12] [-Attribute13] [-Attribute14] [-Attribute15] [-Attribute16] [-Attribute2]
 [-Attribute3] [-Attribute4] [-Attribute5] [-Attribute6] [-Attribute7] [-Attribute8] [-Attribute9]
 [-Attributes] [-Authentication] [-AuthTimeout] [-Cloudattributes] [-DefaultAuthenticationGroup] [-Email]
 [-Followreferrals] [-GroupAttrName] [-GroupNameIdentifier] [-GroupSearchattribute] [-GroupSearchfilter]
 [-GroupSearchsubattribute] [-Kbattribute] [-LDAPBase] [-LDAPBinddn] [-LDAPBinddnpassword] [-LDAPHostName]
 [-LDAPLoginName] [-MaxLDAPReferrals] [-MaxNestinglevel] [-MssrvRecordLocation] [-NestedGroupExtrAction]
 [-Otpsecret] [-Passwdchange] [-Passwordlessmgmtaccess] [-PushService] [-ReferralDNSLookup] [-RequireUser]
 [-Searchfilter] [-SecType] [-ServerPort] [-SSONameAttribute] [-SubattributeName] [-SvrType]
 [-ValidateServerCert] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for LDAP action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetAuthenticationLDAPAction -Name 'example' -AlternateEmailAttr  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetAuthenticationLDAPAction -Name 'example' -AlternateEmailAttr  -WhatIf
```

## PARAMETERS

### -Name
Name for the new LDAP action.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Cannot be changed after the LDAP action is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my authentication action" or 'my authentication action').
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

### -AlternateEmailAttr
The NetScaler appliance uses the alternateive email attribute to query the Active Directory for the alternative email id of a user.
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

### -Attribute1
Expression that would be evaluated to extract attribute1 from the ldap response.

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
Expression that would be evaluated to extract attribute10 from the ldap response.

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
Expression that would be evaluated to extract attribute11 from the ldap response.

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
Expression that would be evaluated to extract attribute12 from the ldap response.

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
Expression that would be evaluated to extract attribute13 from the ldap response.

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
Expression that would be evaluated to extract attribute14 from the ldap response.

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
Expression that would be evaluated to extract attribute15 from the ldap response.

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
Expression that would be evaluated to extract attribute16 from the ldap response.

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
Expression that would be evaluated to extract attribute2 from the ldap response.

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
Expression that would be evaluated to extract attribute3 from the ldap response.

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
Expression that would be evaluated to extract attribute4 from the ldap response.

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
Expression that would be evaluated to extract attribute5 from the ldap response.

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
Expression that would be evaluated to extract attribute6 from the ldap response.

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
Expression that would be evaluated to extract attribute7 from the ldap response.

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
Expression that would be evaluated to extract attribute8 from the ldap response.

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
Expression that would be evaluated to extract attribute9 from the ldap response.

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

### -Attributes
List of attribute names separated by ',' which needs to be fetched from ldap server.
Note that preceeding and trailing spaces will be removed.
Attribute name can be 127 bytes and total length of this string should not cross 2047 bytes.
These attributes have multi-value support separated by ',' and stored as key-value pair in AAA session.

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

### -Authentication
Perform LDAP authentication.
If authentication is disabled, any LDAP authentication attempt returns authentication success if the user is found.
CAUTION!
Authentication should be disabled only for authorization group extraction or where other (non-LDAP) authentication methods are in use and either bound to a primary list or flagged as secondary.
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

### -AuthTimeout
Number of seconds the Citrix ADC waits for a response from the RADIUS server.
Default value: 3 Minimum value = 1

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

### -Cloudattributes
The Citrix ADC uses the cloud attributes to extract additional attributes from LDAP servers required for Citrix Cloud operations.
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

### -DefaultAuthenticationGroup
This is the default group that is chosen when the authentication succeeds in addition to extracted groups.

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

### -Email
The Citrix ADC uses the email attribute to query the Active Directory for the email id of a user.
Default value: mail Maximum length = 128

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

### -Followreferrals
Setting this option to ON enables following LDAP referrals received from the LDAP server.
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

### -GroupAttrName
LDAP group attribute name.
Used for group extraction on the LDAP server.

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

### -GroupNameIdentifier
Name that uniquely identifies a group in LDAP or Active Directory.

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

### -GroupSearchattribute
LDAP group search attribute.
Used to determine to which groups a group belongs.

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

### -GroupSearchfilter
String to be combined with the default LDAP group search string to form the search value.
For example, the group search filter ""vpnallowed=true"" when combined with the group identifier ""samaccount"" and the group name ""g1"" yields the LDAP search string ""(&(vpnallowed=true)(samaccount=g1)"".
If nestedGroupExtraction is ENABLED, the filter is applied on the first level group search as well, otherwise first level groups (of which user is a direct member of) will be fetched without applying this filter.
(Be sure to enclose the search string in two sets of double quotation marks; both sets are needed.).

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

### -GroupSearchsubattribute
LDAP group search subattribute.
Used to determine to which groups a group belongs.

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

### -Kbattribute
KnowledgeBasedAuthentication(KBA) attribute on AD.
This attribute is used to store and retrieve preconfigured Question and Answer knowledge base used for KBA authentication.
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

### -LDAPBase
Base (node) from which to start LDAP searches.
If the LDAP server is running locally, the default value of base is dc=netscaler, dc=com.

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

### -LDAPBinddn
Full distinguished name (DN) that is used to bind to the LDAP server.
Default: cn=Manager,dc=netscaler,dc=com.

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

### -LDAPBinddnpassword
Password used to bind to the LDAP server.
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

### -LDAPHostName
Hostname for the LDAP server.
If -validateServerCert is ON then this must be the host name on the certificate from the LDAP server.
A hostname mismatch will cause a connection failure.

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

### -LDAPLoginName
LDAP login name attribute.
The Citrix ADC uses the LDAP login name to query external LDAP servers or Active Directories.

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

### -MaxLDAPReferrals
Specifies the maximum number of nested referrals to follow.
Default value: 1 Minimum value = 1

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

### -MaxNestinglevel
If nested group extraction is ON, specifies the number of levels up to which group extraction is performed.
Default value: 2 Minimum value = 2

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

### -MssrvRecordLocation
MSSRV Specific parameter.
Used to locate the DNS node to which the SRV record pertains in the domainname.
The domainname is appended to it to form the srv record.
Example : For "dc._msdcs", the srv record formed is _ldap._tcp.dc._msdcs.\<domainname\>.

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

### -NestedGroupExtrAction
Allow nested group extraction, in which the Citrix ADC queries external LDAP servers to determine whether a group is part of another group.
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

### -Otpsecret
OneTimePassword(OTP) Secret key attribute on AD.
This attribute is used to store and retrieve secret key used for OTP check.
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

### -Passwdchange
Allow password change requests.
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

### -Passwordlessmgmtaccess
This feature configures NetScaler management access to use LDAP exclusively for retrieving user group information.
It ensures that LDAP is not used for authenticating user logins (i.e., verifying passwords) for NetScaler management access.
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

### -PushService
Name of the service used to send push notifications.
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

### -ReferralDNSLookup
Specifies the DNS Record lookup Type for the referrals.
Default value: A-REC Possible values = A-REC, SRV-REC, MSSRV-REC

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

### -RequireUser
Require a successful user search for authentication.
CAUTION!
This field should be set to NO only if usersearch not required \[Both username validation as well as password validation skipped\] and (non-LDAP) authentication methods are in use and either bound to a primary list or flagged as secondary.
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

### -Searchfilter
String to be combined with the default LDAP user search string to form the search value.
For example, if the search filter "vpnallowed=true" is combined with the LDAP login name "samaccount" and the user-supplied username is "bob", the result is the LDAP search string ""&(vpnallowed=true)(samaccount=bob)"" (Be sure to enclose the search string in two sets of double quotation marks; both sets are needed.).
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

### -SecType
Type of security used for communications between the Citrix ADC and the LDAP server.
For the PLAINTEXT setting, no encryption is required.
Default value: PLAINTEXT Possible values = PLAINTEXT, TLS, SSL

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

### -ServerPort
Port on which the LDAP server accepts connections.
Default value: 389 Minimum value = 1

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

### -SSONameAttribute
LDAP single signon (SSO) attribute.
The Citrix ADC uses the SSO name attribute to query external LDAP servers or Active Directories for an alternate username.

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

### -SubattributeName
LDAP group sub-attribute name.
Used for group extraction from the LDAP server.

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

### -SvrType
The type of LDAP server.
Default value: AAA_LDAP_SERVER_TYPE_DEFAULT Possible values = AD, NDS

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

### -ValidateServerCert
When to validate LDAP server certs.
Default value: NO Possible values = YES, NO

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

