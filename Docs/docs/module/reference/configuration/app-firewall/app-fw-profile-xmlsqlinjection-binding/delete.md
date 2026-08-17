---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteAppFwProfileXMLSqlinjectionBinding

## SYNOPSIS
Removes a NetScaler appfwprofile_xmlsqlinjection_binding resource.

## SYNTAX

```
Invoke-NSDeleteAppFwProfileXMLSqlinjectionBinding [-Name] <String> [-XMLSqlinjection <String>]
 [-AsScanLocationXMLSql <String>] [-RuleType <String>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the xmlsqlinjection that can be bound to appfwprofile.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteAppFwProfileXMLSqlinjectionBinding -Name 'example' -XMLSqlinjection 'example' -RuleType ALLOW -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetAppFwProfileXMLSqlinjectionBinding -Name 'appfwprofile_xmlsqlinjection_binding_example' | Invoke-NSDeleteAppFwProfileXMLSqlinjectionBinding -Confirm:$false
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

### -XMLSqlinjection
Exempt the specified URL from the XML SQL injection check.
An XML SQL injection exemption (relaxation) consists of the following items: * Name.
Name to exempt, as a string or a PCRE-format regular expression.
* ISREGEX flag.
REGEX if URL is a regular expression, NOTREGEX if URL is a fixed string.
* Location.
ELEMENT if the injection is located in an XML element, ATTRIBUTE if located in an XML attribute.

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

### -AsScanLocationXMLSql
Location of SQL injection exception - XML Element or Attribute.
Possible values = ELEMENT, ATTRIBUTE

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

