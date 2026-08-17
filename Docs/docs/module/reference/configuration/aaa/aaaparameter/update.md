---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateAAAParameter

## SYNOPSIS
Updates a NetScaler aaaparameter resource.

## SYNTAX

```
Invoke-NSUpdateAAAParameter [[-AAADloglevel] <String>] [[-AAADnatip] <String>] [[-AAASessionloglevel] <String>]
 [[-APITokencache] <String>] [[-Classicendpoints] <String>] [[-DefaultauthType] <String>]
 [[-DefaultcspHeader] <String>] [[-Dynaddr] <String>] [[-Enableenhancedauthfeedback] <String>]
 [[-Enablesessionstickiness] <String>] [[-EnablestaticPageCaching] <String>] [[-Enhancedepa] <String>]
 [[-FailedLoginTimeout] <Int32>] [[-FtMode] <String>] [[-HTTPOnlyCookie] <String>]
 [[-LoginEncryption] <String>] [[-MaxAAAUserS] <Int32>] [[-MaxKbquestions] <Int32>]
 [[-MaxLoginAttempts] <Int32>] [[-MaxSAMLDeflatesize] <Int32>] [[-PersistentLoginAttempts] <String>]
 [[-Pwdexpirynotificationdays] <Int32>] [[-Samesite] <String>] [[-Securityinsights] <String>]
 [[-TokenintroSpecTionInterval] <Int32>] [[-Wafprotection] <String[]>] [[-WebViewendpoints] <String>]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for AAA parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateAAAParameter  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateAAAParameter  -WhatIf
```

## PARAMETERS

### -AAADloglevel
AAAD log level, which specifies the types of AAAD events to log in nsvpn.log.
Available values function as follows: * EMERGENCY - Events that indicate an immediate crisis on the server.
* ALERT - Events that might require action.
* CRITICAL - Events that indicate an imminent server crisis.
* ERROR - Events that indicate some type of error.
* WARNING - Events that require action in the near future.
* NOTICE - Events that the administrator should know about.
* INFORMATIONAL - All but low-level events.
* DEBUG - All events, in extreme detail.
Default value: INFORMATIONAL Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AAADnatip
Source IP address to use for traffic that is sent to the authentication server.

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

### -AAASessionloglevel
Audit log level, which specifies the types of events to log for cli executed commands.
Available values function as follows: * EMERGENCY - Events that indicate an immediate crisis on the server.
* ALERT - Events that might require action.
* CRITICAL - Events that indicate an imminent server crisis.
* ERROR - Events that indicate some type of error.
* WARNING - Events that require action in the near future.
* NOTICE - Events that the administrator should know about.
* INFORMATIONAL - All but low-level events.
* DEBUG - All events, in extreme detail.
Default value: DEFAULT_LOGLEVEL_AAA Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG

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

### -APITokencache
Option to enable/disable API cache feature.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Classicendpoints
Parameter to enable/disable classic endpoints.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -DefaultauthType
The default authentication server type.
Default value: LOCAL Possible values = LOCAL, LDAP, RADIUS, TACACS, CERT

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

### -DefaultcspHeader
Parameter to enable/disable default CSP header.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Dynaddr
Set by the DHCP client when the IP address was fetched dynamically.
Default value: OFF Possible values = ON, OFF

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

### -Enableenhancedauthfeedback
Enhanced auth feedback provides more information to the end user about the reason for an authentication failure.
The default value is set to NO.
Default value: NO Possible values = YES, NO

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

### -Enablesessionstickiness
Enables/Disables stickiness to authentication servers.
Default value: NO Possible values = YES, NO

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

### -EnablestaticPageCaching
The default state of VPN Static Page caching.
Static Page caching is enabled by default.
Default value: YES Possible values = YES, NO

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

### -Enhancedepa
Parameter to enable/disable EPA v2 functionality.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FailedLoginTimeout
Number of minutes an account will be locked if user exceeds maximum permissible attempts.
Minimum value = 1 Maximum value = 525600

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FtMode
First time user mode determines which configuration options are shown by default when logging in to the GUI.
This setting is controlled by the GUI.
Default value: ON Possible values = ON, HA, OFF

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

### -HTTPOnlyCookie
Parameter to set/reset HttpOnly Flag for NSC_AAAC/NSC_TMAS cookies in nfactor.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -LoginEncryption
Parameter to encrypt login information for nFactor flow.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -MaxAAAUserS
Maximum number of concurrent users allowed to log on to VPN simultaneously.
Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxKbquestions
This will set maximum number of Questions to be asked for KB Validation.
Default value is 2, Max Value is 6.
Minimum value = 2 Maximum value = 6

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

### -MaxLoginAttempts
Maximum Number of login Attempts.
Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxSAMLDeflatesize
This will set the maximum deflate size in case of SAML Redirect binding.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PersistentLoginAttempts
Persistent storage of unsuccessful user login attempts.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Pwdexpirynotificationdays
This will set the threshold time in days for password expiry notification.
Default value is 0, which means no notification is sent.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Samesite
SameSite attribute value for Cookies generated in AAATM context.
This attribute value will be appended only for the cookies which are specified in the builtin patset ns_cookies_samesite.
Possible values = None, LAX, STRICT

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Securityinsights
On enabling this option, the Citrix ADC will send the security insight records to the configured collectors when request comes to Authentication endpoint.
* If cs vserver is frontend with Authentication vserver as target for cs action, then record is sent using Authentication vserver name.
* If vpn/lb/cs vserver are configured with Authentication ON, then then record is sent using vpn/lb/cs vserver name accordingly.
* If authentication vserver is frontend, then record is sent using Authentication vserver name.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TokenintroSpecTionInterval
Frequency at which a token must be verified at the Authorization Server (AS) despite being found in cache.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wafprotection
Entities for which WAF Protection need to be applied.
Available settings function as follows: * DEFAULT - AUTH and VPN Protections are enabled.
This is the default value for wafProtection * AUTH - Endpoints used for Authentication applicable for both AAATM, IDP, GATEWAY use cases.
* VPN - Endpoints used for Gateway use cases.
* PORTAL - Endpoints related to web portal.
* DISABLED - No Endpoint WAF protection.
Currently supported only in default partition.
Default value: DEFAULT Possible values = DISABLED, AUTH, VPN, PORTAL, DEFAULT

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebViewendpoints
Parameter to enable/disable webview endpoints.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 27
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
Position: 28
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

