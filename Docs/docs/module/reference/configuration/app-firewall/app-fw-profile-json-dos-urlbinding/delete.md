---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteAppFwProfileJsonDosURLBinding

## SYNOPSIS
Removes a NetScaler appfwprofile_jsondosurl_binding resource.

## SYNTAX

```
Invoke-NSDeleteAppFwProfileJsonDosURLBinding [-Name] <String> [-JsonDosURL <String>] [-RuleType <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the jsondosurl that can be bound to appfwprofile.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteAppFwProfileJsonDosURLBinding -Name 'example' -JsonDosURL 'example' -RuleType ALLOW -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetAppFwProfileJsonDosURLBinding -Name 'appfwprofile_jsondosurl_binding_example' | Invoke-NSDeleteAppFwProfileJsonDosURLBinding -Confirm:$false
```

## PARAMETERS

### -Name
Name of the profile to which to bind an exemption or rule.
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

### -JsonDosURL
The URL on which we need to enforce the specified JSON denial-of-service (JSONDoS) attack protections.
An JSON DoS configuration consists of the following items: * URL.
PCRE-format regular expression for the URL.
* Maximum-document-length-check toggle.
ON to enable this check, OFF to disable it.
* Maximum document length.
Positive integer representing the maximum length of the JSON document.
* Maximum-container-depth-check toggle.
ON to enable, OFF to disable.
* Maximum container depth.
Positive integer representing the maximum container depth of the JSON document.
* Maximum-object-key-count-check toggle.
ON to enable, OFF to disable.
* Maximum object key count.
Positive integer representing the maximum allowed number of keys in any of the JSON object.
* Maximum-object-key-length-check toggle.
ON to enable, OFF to disable.
* Maximum object key length.
Positive integer representing the maximum allowed length of key in any of the JSON object.
* Maximum-array-value-count-check toggle.
ON to enable, OFF to disable.
* Maximum array value count.
Positive integer representing the maximum allowed number of values in any of the JSON array.
* Maximum-string-length-check toggle.
ON to enable, OFF to disable.
* Maximum string length.
Positive integer representing the maximum length of string in JSON.
Minimum length = 1 Maximum length = 2047

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

### -RuleType
Specifies rule type of binding.
Possible values = ALLOW, DENY

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

