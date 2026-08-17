---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetAppFwSettings

## SYNOPSIS
Clears one or more NetScaler appfwsettings resource properties.

## SYNTAX

```
Invoke-NSUnsetAppFwSettings [-Ceflogging] [-CentralizedLearning] [-ClientIploggingHeader] [-CookieFlags]
 [-CookiePostencryptprefix] [-DefaultProfile] [-Entitydecoding] [-Geolocationlogging] [-ImPortSizelimit]
 [-Learnratelimit] [-LogmalFormEdreq] [-MalFormEdreqAction] [-ProxyPassword] [-ProxyPort] [-ProxyServer]
 [-ProxyUserName] [-SessionCookieName] [-Sessionlifetime] [-Sessionlimit] [-SessionTimeout]
 [-SignatureAutoupdate] [-SignatureURL] [-UndefAction] [-UseconfigurablesecretKey] [[-Session] <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for AS settings resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetAppFwSettings -Ceflogging ON -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetAppFwSettings -Ceflogging ON -WhatIf
```

## PARAMETERS

### -Ceflogging
Enable CEF format logs.
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

### -CentralizedLearning
Flag used to enable/disable ADM centralized learning.
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

### -ClientIploggingHeader
Name of an HTTP header that contains the IP address that the client used to connect to the protected web site or service.

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

### -CookieFlags
Add the specified flags to AppFW cookies.
Available setttings function as follows: * None - Do not add flags to AppFW cookies.
* HTTP Only - Add the HTTP Only flag to AppFW cookies, which prevent scripts from accessing them.
* Secure - Add Secure flag to AppFW cookies.
* All - Add both HTTPOnly and Secure flag to AppFW cookies.
Default value: none Possible values = none, httpOnly, secure, all

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

### -CookiePostencryptprefix
String that is prepended to all encrypted cookie values.
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

### -DefaultProfile
Profile to use when a connection does not match any policy.
Default setting is APPFW_BYPASS, which sends unmatched connections back to the Citrix ADC without attempting to filter them further.
Default value: APPFW_BYPASS Minimum length = 1

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

### -Entitydecoding
Transform multibyte (double- or half-width) characters to single width characters.
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

### -Geolocationlogging
Enable Geo-Location Logging in CEF format logs.
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

### -ImPortSizelimit
Maximum cumulative size in bytes of all objects imported to Netscaler.
The user is not allowed to import an object if the operation exceeds the currently configured limit.
Default value: 134217728 Minimum value = 1 Maximum value = 268435456

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

### -Learnratelimit
Maximum number of connections per second that the application firewall learning engine examines to generate new relaxations for learning-enabled security checks.
The application firewall drops any connections above this limit from the list of connections used by the learning engine.
Default value: 400 Minimum value = 1 Maximum value = 1000

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

### -LogmalFormEdreq
Log requests that are so malformed that application firewall parsing doesn't occur.
Default value: ON Possible values = ON, OFF

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

### -MalFormEdreqAction
flag to define action on malformed requests that application firewall cannot parse.
Possible values = none, block, log, stats

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

### -ProxyPassword
Password with which proxy user logs on.
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

### -ProxyPort
Proxy Server Port to get updated signatures from AWS.
Default value: 8080 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API

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

### -ProxyServer
Proxy Server IP to get updated signatures from AWS.

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

### -ProxyUserName
Proxy Username.
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

### -SessionCookieName
Name of the session cookie that the application firewall uses to track user sessions.
Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name').
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

### -Sessionlifetime
Maximum amount of time (in seconds) that the application firewall allows a user session to remain active, regardless of user activity.
After this time, the user session is terminated.
Before continuing to use the protected web site, the user must establish a new session by opening a designated start URL.
A value of 0 represents infinite time.
Default value: 0 Minimum value = 0 Maximum value = 2147483647

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

### -Sessionlimit
Maximum number of sessions that the application firewall allows to be active, regardless of user activity.
After the max_limit reaches, No more user session will be created .
Default value: 100000 Minimum value = 0 Maximum value = 500000

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

### -SessionTimeout
Timeout, in seconds, after which a user session is terminated.
Before continuing to use the protected web site, the user must establish a new session by opening a designated start URL.
Default value: 900 Minimum value = 1 Maximum value = 65535

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

### -SignatureAutoupdate
Flag used to enable/disable auto update signatures.
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

### -SignatureURL
URL to download the mapping file from server.
Default value: https://s3.amazonaws.com/NSAppFwSignatures/SignaturesMapping.xml

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

### -UndefAction
Profile to use when an application firewall policy evaluates to undefined (UNDEF).
An UNDEF event indicates an internal error condition.
The APPFW_BLOCK built-in profile is the default setting.
You can specify a different built-in or user-created profile as the UNDEF profile.
Default value: APPFW_BLOCK Minimum length = 1

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

### -UseconfigurablesecretKey
Use configurable secret key in AppFw operations.
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

