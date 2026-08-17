---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetTmsessionparameter

## SYNOPSIS
Clears one or more NetScaler tmsessionparameter resource properties.

## SYNTAX

```
Invoke-NSUnsetTmsessionparameter [-DefaultauthorizationAction] [-HomePage] [-HTTPOnlyCookie] [-KCDAccount]
 [-PersistentCookie] [-PersistentCookieValidity] [-SessTimeout] [-SSO] [-SSOCredential] [-SSODomain]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for session parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetTmsessionparameter -DefaultauthorizationAction ALLOW -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetTmsessionparameter -DefaultauthorizationAction ALLOW -WhatIf
```

## PARAMETERS

### -DefaultauthorizationAction
Allow or deny access to content for which there is no specific authorization policy.
Default value: DENY Possible values = ALLOW, DENY

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

### -HomePage
Web address of the home page that a user is displayed when authentication vserver is bookmarked and used to login.
Default value: "None"

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

### -HTTPOnlyCookie
Allow only an HTTP session cookie, in which case the cookie cannot be accessed by scripts.
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

### -KCDAccount
Kerberos constrained delegation account name.
Minimum length = 1 Maximum length = 32

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

### -PersistentCookie
Use persistent SSO cookies for the traffic session.
A persistent cookie remains on the user device and is sent with each HTTP request.
The cookie becomes stale if the session ends.
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

### -PersistentCookieValidity
Integer specifying the number of minutes for which the persistent cookie remains valid.
Can be set only if the persistence cookie setting is enabled.
Minimum value = 1

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

### -SessTimeout
Session timeout, in minutes.
If there is no traffic during the timeout period, the user is disconnected and must reauthenticate to access the intranet resources.
Default value: 30 Minimum value = 1

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

### -SSO
Log users on to all web applications automatically after they authenticate, or pass users to the web application logon page to authenticate for each application.
Note that this configuration does not honor the following authentication types for security reason.
BASIC, DIGEST, and NTLM (without Negotiate NTLM2 Key or Negotiate Sign Flag).
Use TM TrafficAction to configure SSO for these authentication types.
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

### -SSOCredential
Use primary or secondary authentication credentials for single sign-on.
Default value: PRIMARY Possible values = PRIMARY, SECONDARY

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

### -SSODomain
Domain to use for single sign-on.
Minimum length = 1 Maximum length = 32

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
Position: 1
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

