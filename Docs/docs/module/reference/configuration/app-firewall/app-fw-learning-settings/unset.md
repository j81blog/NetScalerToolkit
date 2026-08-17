---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetAppFwLearningSettings

## SYNOPSIS
Clears one or more NetScaler appfwlearningsettings resource properties.

## SYNTAX

```
Invoke-NSUnsetAppFwLearningSettings [-ProfileName] <String> [-ContentTypeAutodeploygraceperiod]
 [-ContentTypeMinThreshold] [-ContentTypePercentThreshold] [-CookieConsistencyautodeploygraceperiod]
 [-CookieConsistencyMinThreshold] [-CookieConsistencypercentThreshold] [-CreditcardnumberMinThreshold]
 [-CreditcardnumberpercentThreshold] [-Crosssitescriptingautodeploygraceperiod]
 [-CrosssitescriptingMinThreshold] [-CrosssitescriptingpercentThreshold] [-Csrftagautodeploygraceperiod]
 [-CsrftagMinThreshold] [-CsrftagpercentThreshold] [-FieldConsistencyautodeploygraceperiod]
 [-FieldConsistencyMinThreshold] [-FieldConsistencypercentThreshold] [-FieldFormAtautodeploygraceperiod]
 [-FieldFormAtMinThreshold] [-FieldFormAtpercentThreshold] [-Sqlinjectionautodeploygraceperiod]
 [-SqlinjectionMinThreshold] [-SqlinjectionpercentThreshold] [-StartURLAutodeploygraceperiod]
 [-StartURLMinThreshold] [-StartURLPercentThreshold] [-XMLAttachmentMinThreshold]
 [-XMLAttachmeNTPErcentThreshold] [-XMLWsiMinThreshold] [-XMLWSIPErcentThreshold] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for learning settings resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetAppFwLearningSettings -ProfileName 'example' -ContentTypeAutodeploygraceperiod  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetAppFwLearningSettings -ProfileName 'example' -ContentTypeAutodeploygraceperiod  -WhatIf
```

## PARAMETERS

### -ProfileName
Name of the profile.
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

### -ContentTypeAutodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -ContentTypeMinThreshold
Minimum threshold to learn Content Type information.
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

### -ContentTypePercentThreshold
Minimum threshold in percent to learn Content Type information.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -CookieConsistencyautodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -CookieConsistencyMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn cookies.
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

### -CookieConsistencypercentThreshold
Minimum percentage of application firewall sessions that must contain a particular cookie pattern for the learning engine to learn that cookie.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -CreditcardnumberMinThreshold
Minimum threshold to learn Credit Card information.
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

### -CreditcardnumberpercentThreshold
Minimum threshold in percent to learn Credit Card information.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -Crosssitescriptingautodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -CrosssitescriptingMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn HTML cross-site scripting patterns.
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

### -CrosssitescriptingpercentThreshold
Minimum percentage of application firewall sessions that must contain a particular cross-site scripting pattern for the learning engine to learn that cross-site scripting pattern.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -Csrftagautodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -CsrftagMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn cross-site request forgery (CSRF) tags.
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

### -CsrftagpercentThreshold
Minimum percentage of application firewall sessions that must contain a particular CSRF tag for the learning engine to learn that CSRF tag.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -FieldConsistencyautodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -FieldConsistencyMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn field consistency information.
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

### -FieldConsistencypercentThreshold
Minimum percentage of application firewall sessions that must contain a particular field consistency pattern for the learning engine to learn that field consistency pattern.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -FieldFormAtautodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -FieldFormAtMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn field formats.
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

### -FieldFormAtpercentThreshold
Minimum percentage of application firewall sessions that must contain a particular web form field pattern for the learning engine to recommend a field format for that form field.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -Sqlinjectionautodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -SqlinjectionMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn HTML SQL injection patterns.
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

### -SqlinjectionpercentThreshold
Minimum percentage of application firewall sessions that must contain a particular HTML SQL injection pattern for the learning engine to learn that HTML SQL injection pattern.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -StartURLAutodeploygraceperiod
The number of minutes after the threshold hit alert the learned rule will be deployed.
Default value: 10080 Minimum value = 5 Maximum value = 43200

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

### -StartURLMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn start URLs.
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

### -StartURLPercentThreshold
Minimum percentage of application firewall sessions that must contain a particular start URL pattern for the learning engine to learn that start URL.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -XMLAttachmentMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn XML attachment patterns.
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

### -XMLAttachmeNTPErcentThreshold
Minimum percentage of application firewall sessions that must contain a particular XML attachment pattern for the learning engine to learn that XML attachment pattern.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -XMLWsiMinThreshold
Minimum number of application firewall sessions that the learning engine must observe to learn web services interoperability (WSI) information.
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

### -XMLWSIPErcentThreshold
Minimum percentage of application firewall sessions that must contain a particular pattern for the learning engine to learn a web services interoperability (WSI) pattern.
Default value: 0 Minimum value = 0 Maximum value = 100

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

