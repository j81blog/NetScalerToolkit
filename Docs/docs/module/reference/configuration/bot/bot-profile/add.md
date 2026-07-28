---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddBotProfile

## SYNOPSIS
Creates a NetScaler botprofile resource.

## SYNTAX

```
Invoke-NSAddBotProfile [-AddCookieFlags <String>] [-BotEnableBlackList <String>]
 [-BotEnableIpReputation <String>] [-BotEnableRateLimit <String>] [-BotEnableTps <String>]
 [-BotEnableWhiteList <String>] [-ClientIpexpression <String>] [-Comment <String>]
 [-Devicefingerprint <String>] [-DevicefingerprintAction <String[]>] [-Devicefingerprintmobile <String[]>]
 [-DfpRequestLimit <Int32>] [-ErrorURL <String>] [-Headlessbrowserdetection <String>] [-Kmdetection <String>]
 [-Kmeventspostbodylimit <Int32>] [-KmjavascriptName <String>] [-Name] <String> [-SessionCookieName <String>]
 [-SessionTimeout <Int32>] [-Signature <String>] [-SignatureMultiPleUserAgentHeaderAction <String[]>]
 [-SignatureNoUserAgentHeaderAction <String[]>] [-SpoofedreqAction <String[]>] [-Trap <String>]
 [-TrapAction <String[]>] [-TrapURL <String>] [-Verboseloglevel <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for Bot profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddBotProfile -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddBotProfile -Name 'example' -WhatIf
```

## PARAMETERS

### -AddCookieFlags
Add the specified flags to bot session cookies.
Available settings function as follows: * None - Do not add flags to cookies.
* HTTP Only - Add the HTTP Only flag to cookies, which prevents scripts from accessing cookies.
* Secure - Add Secure flag to cookies.
* All - Add both HTTPOnly and Secure flags to cookies.
Default value: httpOnly Possible values = none, httpOnly, secure, all

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

### -BotEnableBlackList
Enable black-list bot detection.
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

### -BotEnableIpReputation
Enable IP-reputation bot detection.
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

### -BotEnableRateLimit
Enable rate-limit bot detection.
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

### -BotEnableTps
Enable TPS.
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

### -BotEnableWhiteList
Enable white-list bot detection.
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

### -ClientIpexpression
Expression to get the client IP.

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

### -Comment
Any comments about the purpose of profile, or other useful information about the profile.
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

### -Devicefingerprint
Enable device-fingerprint bot detection.
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

### -DevicefingerprintAction
Action to be taken for device-fingerprint based bot detection.
Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET, MITIGATION

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

### -Devicefingerprintmobile
Enabling bot device fingerprint protection for mobile clients.
Default value: NONE Possible values = NONE, Android, iOS

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

### -DfpRequestLimit
Number of requests to allow without bot session cookie if device fingerprint is enabled.
Minimum value = 1

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

### -ErrorURL
URL that Bot protection uses as the Error URL.
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

### -Headlessbrowserdetection
Enable Headless Browser detection.
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

### -Kmdetection
Enable keyboard-mouse based bot detection.
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

### -Kmeventspostbodylimit
Size of the KM data send by the browser, needs to be processed on ADC.
Minimum value = 1 Maximum value = 204800

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

### -KmjavascriptName
Name of the JavaScript file that the Bot Management feature will insert in the response for keyboard-mouse based detection.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my javascript file name" or 'my javascript file name').

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
Name for the profile.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters.
Cannot be changed after the profile is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile').
Minimum length = 1 Maximum length = 31

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

### -SessionCookieName
Name of the SessionCookie that the Bot Management feature uses for tracking.
Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name').
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

### -SessionTimeout
Timeout, in seconds, after which a user session is terminated.
Minimum value = 1 Maximum value = 65535

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

### -Signature
Name of object containing bot static signature details.
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

### -SignatureMultiPleUserAgentHeaderAction
Actions to be taken if multiple User-Agent headers are seen in a request (Applicable if Signature check is enabled).
Log action should be combined with other actions.
Default value: CHECKLAST Possible values = CHECKLAST, LOG, DROP, REDIRECT, RESET

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

### -SignatureNoUserAgentHeaderAction
Actions to be taken if no User-Agent header in the request (Applicable if Signature check is enabled).
Default value: DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET

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

### -SpoofedreqAction
Actions to be taken on a spoofed request (A request spoofing good bot user agent string).
Default value: BOT_ACTION_LOG_DROP Possible values = NONE, LOG, DROP, REDIRECT, RESET

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

### -Trap
Enable trap bot detection.
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

### -TrapAction
Action to be taken for bot trap based bot detection.
Default value: NONE Possible values = NONE, LOG, DROP, REDIRECT, RESET

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

### -TrapURL
URL that Bot protection uses as the Trap URL.
Minimum length = 1 Maximum length = 127

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

### -Verboseloglevel
Bot verbose Logging.
Based on the log level, ADC will log additional information whenever client is detected as a bot.
Default value: NONE Possible values = NONE, HTTP_FULL_HEADER

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

