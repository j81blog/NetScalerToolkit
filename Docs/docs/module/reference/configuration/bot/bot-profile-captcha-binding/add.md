---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddBotProfileCaptchaBinding

## SYNOPSIS
Creates a NetScaler botprofile_captcha_binding resource.

## SYNTAX

```
Invoke-NSAddBotProfileCaptchaBinding [-BotBindComment <String>] [-BotCaptchaAction <String[]>]
 [-BotCaptchaEnabled <String>] [-BotCaptchaURL <String>] [-CaptchaResource <Boolean>] [-Graceperiod <Int32>]
 [-LogMessage <String>] [-Muteperiod <Int32>] [-Name] <String> [-RequestSizelimit <Int32>]
 [-Retryattempts <Int32>] [-Waittime <Int32>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the captcha that can be bound to botprofile.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddBotProfileCaptchaBinding -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddBotProfileCaptchaBinding -Name 'example' -WhatIf
```

## PARAMETERS

### -BotBindComment
Any comments about this binding.
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

### -BotCaptchaAction
One or more actions to be taken when client fails captcha challenge.
Only, log action can be configured with DROP, REDIRECT or RESET action.
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

### -BotCaptchaEnabled
Enable or disable the captcha binding.
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

### -BotCaptchaURL
URL for which the Captcha action, if configured under IP reputation, TPS or device fingerprint, need to be applied.
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

### -CaptchaResource
Captcha action binding.
For each URL, only one binding is allowed.
To update the values of an existing URL binding, user has to first unbind that binding, and then needs to bind the URL again with new values.
Maximum 30 bindings can be configured per profile.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Graceperiod
Time (in seconds) duration for which no new captcha challenge is sent after current captcha challenge has been answered successfully.
Default value: 900 Minimum value = 60 Maximum value = 900

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

### -LogMessage
Message to be logged for this binding.
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

### -Muteperiod
Time (in seconds) duration for which client which failed captcha need to wait until allowed to try again.
The requests from this client are silently dropped during the mute period.
Default value: 300 Minimum value = 60 Maximum value = 900

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

### -RequestSizelimit
Length of body request (in Bytes) up to (equal or less than) which captcha challenge will be provided to client.
Above this length threshold the request will be dropped.
This is to avoid DOS and DDOS attacks.
Default value: 8000 Minimum value = 10 Maximum value = 30000

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

### -Retryattempts
Number of times client can retry solving the captcha.
Default value: 3 Minimum value = 1 Maximum value = 10

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

### -Waittime
Wait time in seconds for which ADC needs to wait for the Captcha response.
This is to avoid DOS attacks.
Default value: 15 Minimum value = 10 Maximum value = 60

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

