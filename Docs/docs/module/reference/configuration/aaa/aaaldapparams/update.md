---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateAAALDAPParams

## SYNOPSIS
Updates a NetScaler aaaldapparams resource.

## SYNTAX

```
Invoke-NSUpdateAAALDAPParams [[-AuthTimeout] <Int32>] [[-DefaultAuthenticationGroup] <String>]
 [[-GroupAttrName] <String>] [[-GroupNameIdentifier] <String>] [[-GroupSearchattribute] <String>]
 [[-GroupSearchfilter] <String>] [[-GroupSearchsubattribute] <String>] [[-LDAPBase] <String>]
 [[-LDAPBinddn] <String>] [[-LDAPBinddnpassword] <String>] [[-LDAPLoginName] <String>]
 [[-MaxNestinglevel] <Int32>] [[-NestedGroupExtrAction] <String>] [[-Passwdchange] <String>]
 [[-Searchfilter] <String>] [[-SecType] <String>] [[-ServerIp] <String>] [[-ServerPort] <Int32>]
 [[-SSONameAttribute] <String>] [[-SubattributeName] <String>] [[-SvrType] <String>] [[-Session] <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for LDAP parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateAAALDAPParams  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateAAALDAPParams  -WhatIf
```

## PARAMETERS

### -AuthTimeout
Maximum number of seconds that the Citrix ADC waits for a response from the LDAP server.
Default value: 3 Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultAuthenticationGroup
This is the default group that is chosen when the authentication succeeds in addition to extracted groups.
Maximum length = 64

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupAttrName
Attribute name used for group extraction from the LDAP server.

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

### -GroupNameIdentifier
LDAP-group attribute that uniquely identifies the group.
No two groups on one LDAP server can have the same group name identifier.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupSearchattribute
LDAP-group attribute that designates the parent group of the specified group.
Use this attribute to search for a group's parent group.

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

### -GroupSearchfilter
Search-expression that can be specified for sending group-search requests to the LDAP server.

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

### -GroupSearchsubattribute
LDAP-group subattribute that designates the parent group of the specified group.
Use this attribute to search for a group's parent group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LDAPBase
Base (the server and location) from which LDAP search commands should start.
If the LDAP server is running locally, the default value of base is dc=netscaler, dc=com.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LDAPBinddn
Complete distinguished name (DN) string used for binding to the LDAP server.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LDAPBinddnpassword
Password for binding to the LDAP server.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LDAPLoginName
Name attribute that the Citrix ADC uses to query the external LDAP server or an Active Directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxNestinglevel
Number of levels up to which the system can query nested LDAP groups.
Default value: 2 Minimum value = 2

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -NestedGroupExtrAction
Queries the external LDAP server to determine whether the specified group belongs to another group.
Default value: OFF Possible values = ON, OFF

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passwdchange
Accept password change requests.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Searchfilter
String to be combined with the default LDAP user search string to form the value to use when executing an LDAP search.
For example, the following values: vpnallowed=true, ldaploginame=""samaccount"" when combined with the user-supplied username ""bob"", yield the following LDAP search string: ""(&(vpnallowed=true)(samaccount=bob)"".
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecType
Type of security used for communications between the Citrix ADC and the LDAP server.
For the PLAINTEXT setting, no encryption is required.
Default value: TLS Possible values = PLAINTEXT, TLS, SSL

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServerIp
IP address of your LDAP server.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServerPort
Port number on which the LDAP server listens for connections.
Default value: 389 Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSONameAttribute
Attribute used by the Citrix ADC to query an external LDAP server or Active Directory for an alternative username.
This alternative username is then used for single sign-on (SSO).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubattributeName
Subattribute name used for group extraction from the LDAP server.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SvrType
The type of LDAP server.
Default value: AAA_LDAP_SERVER_TYPE_DEFAULT Possible values = AD, NDS

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
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
Position: 22
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

