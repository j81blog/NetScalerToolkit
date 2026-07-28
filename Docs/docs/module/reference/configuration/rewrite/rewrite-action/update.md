---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateRewriteAction

## SYNOPSIS
Updates a NetScaler rewriteaction resource.

## SYNTAX

```
Invoke-NSUpdateRewriteAction [-Comment <String>] [-Name] <String> [-Refinesearch <String>] [-Search <String>]
 [-Stringbuilderexpr <String>] [-Target <String>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for rewrite action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateRewriteAction -Name 'example' -Comment 'Updated by automation' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateRewriteAction -Name 'example' -Comment 'Updated by automation' -WhatIf
```

## PARAMETERS

### -Comment
Comment.
Can be used to preserve information about this rewrite action.

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
Name for the user-defined rewrite action.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) hash (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Can be changed after the rewrite policy is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my rewrite action" or 'my rewrite action').

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

### -Refinesearch
Specify additional criteria to refine the results of the search.
Always starts with the "extend(m,n)" operation, where 'm' specifies number of bytes to the left of selected data and 'n' specifies number of bytes to the right of selected data to extend the selected area.
You can use refineSearch only on body expressions, and for the INSERT_BEFORE_ALL, INSERT_AFTER_ALL, REPLACE_ALL, and DELETE_ALL action types.
Example: -refineSearch 'EXTEND(10, 20).REGEX_SELECT(re~0x\[0-9a-zA-Z\]+~).

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

### -Search
Search facility that is used to match multiple strings in the request or response.
Used in the INSERT_BEFORE_ALL, INSERT_AFTER_ALL, REPLACE_ALL, and DELETE_ALL action types.
The following search types are supported: * Text ("text(string)") - A literal string.
Example: -search text("hello") * Regular expression ("regex(re\<delimiter\>regular exp\<delimiter\>)") - Pattern that is used to match multiple strings in the request or response.
The pattern may be a PCRE-format regular expression with a delimiter that consists of any printable ASCII non-alphanumeric character except for the underscore (_) and space ( ) that is not otherwise used in the expression.
Example: -search regex(re~^hello*~) The preceding regular expression can use the tilde (~) as the delimiter because that character does not appear in the regular expression itself.
* XPath ("xpath(xp\<delimiter\>xpath expression\<delimiter\>)") - An XPath expression to search XML.
The delimiter has the same rules as for regex.
Example: -search xpath(xp%/a/b%) * JSON ("xpath_json(xp\<delimiter\>xpath expression\<delimiter\>)") - An XPath expression to search JSON.
The delimiter has the same rules as for regex.
Example: -search xpath_json(xp%/a/b%) NOTE: JSON searches use the same syntax as XPath searches, but operate on JSON files instead of standard XML files.
* HTML ("xpath_html(xp\<delimiter\>xpath expression\<delimiter\>)") - An XPath expression to search HTML.
The delimiter has the same rules as for regex.
Example: -search xpath_html(xp%/html/body%) NOTE: HTML searches use the same syntax as XPath searches, but operate on HTML files instead of standard XML files; HTML 5 rules for the file syntax are used; HTML 4 and later are supported.
* Patset ("patset(patset)") - A predefined pattern set.
Example: -search patset("patset1").
* Datset ("dataset(dataset)") - A predefined dataset.
Example: -search dataset("dataset1").
* AVP ("avp(avp number)") - AVP number that is used to match multiple AVPs in a Diameter/Radius Message.
Example: -search avp(999) Note: for all these the TARGET prefix can be used in the replacement expression to specify the text that was selected by the -search parameter, optionally adjusted by the -refineSearch parameter.
Example: TARGET.BEFORE_STR(",").

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

### -Stringbuilderexpr
Expression that specifies the content to insert into the request or response at the specified location, or that replaces the specified string.

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

### -Target
Expression that specifies which part of the request or response to rewrite.
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

