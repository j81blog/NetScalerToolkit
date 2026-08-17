---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddAppFwProfileJsonDosURLBinding

## SYNOPSIS
Creates a NetScaler appfwprofile_jsondosurl_binding resource.

## SYNTAX

```
Invoke-NSAddAppFwProfileJsonDosURLBinding [-Comment <String>] [-Isautodeployed <String>] [-JsonDosURL <String>]
 [-JsonMaxArrayLength <Int32>] [-JsonMaxArrayLengthCheck <String>] [-JsonMaxContainerdepth <Int32>]
 [-JsonMaxContainerdepthcheck <String>] [-JsonMaxDocumentLength <Int32>] [-JsonMaxDocumentLengthCheck <String>]
 [-JsonMaxObjectKeyCount <Int32>] [-JsonMaxObjectKeyCountcheck <String>] [-JsonMaxObjectKeyLength <Int32>]
 [-JsonMaxObjectKeyLengthCheck <String>] [-JsonMaxStringLength <Int32>] [-JsonMaxStringLengthCheck <String>]
 [-Name] <String> [-Resourceid <String>] [-RuleType <String>] [-State <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the jsondosurl that can be bound to appfwprofile.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddAppFwProfileJsonDosURLBinding -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddAppFwProfileJsonDosURLBinding -Name 'example' -WhatIf
```

## PARAMETERS

### -Comment
Any comments about the purpose of profile, or other useful information about the profile.

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

### -Isautodeployed
Is the rule auto deployed by dynamic profile ?.
Possible values = AUTODEPLOYED, NOTAUTODEPLOYED

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

### -JsonMaxArrayLength
Maximum array length in the any of JSON object.
This check protects against arrays having large lengths.
Default value: 10000 Minimum value = 0 Maximum value = 2147483647

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

### -JsonMaxArrayLengthCheck
State if JSON Max array value count check is ON or OFF.
Possible values = ON, OFF

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

### -JsonMaxContainerdepth
Maximum allowed nesting depth of JSON document.
JSON allows one to nest the containers (object and array) in any order to any depth.
This check protects against documents that have excessive depth of hierarchy.
Default value: 5 Minimum value = 0 Maximum value = 127

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

### -JsonMaxContainerdepthcheck
State if JSON Max depth check is ON or OFF.
Possible values = ON, OFF

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

### -JsonMaxDocumentLength
Maximum document length of JSON document, in bytes.
Default value: 20000000 Minimum value = 0 Maximum value = 2147483647

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

### -JsonMaxDocumentLengthCheck
State if JSON Max document length check is ON or OFF.
Possible values = ON, OFF

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

### -JsonMaxObjectKeyCount
Maximum key count in the any of JSON object.
This check protects against objects that have large number of keys.
Default value: 10000 Minimum value = 0 Maximum value = 2147483647

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

### -JsonMaxObjectKeyCountcheck
State if JSON Max object key count check is ON or OFF.
Possible values = ON, OFF

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

### -JsonMaxObjectKeyLength
Maximum key length in the any of JSON object.
This check protects against objects that have large keys.
Default value: 128 Minimum value = 0 Maximum value = 2147483647

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

### -JsonMaxObjectKeyLengthCheck
State if JSON Max object key length check is ON or OFF.
Possible values = ON, OFF

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

### -JsonMaxStringLength
Maximum string length in the JSON.
This check protects against strings that have large length.
Default value: 1000000 Minimum value = 0 Maximum value = 2147483647

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

### -JsonMaxStringLengthCheck
State if JSON Max string value count check is ON or OFF.
Possible values = ON, OFF

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
Name of the profile to which to bind an exemption or rule.
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

### -Resourceid
A "id" that identifies the rule.

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

### -State
Enabled.
Possible values = ENABLED, DISABLED

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

