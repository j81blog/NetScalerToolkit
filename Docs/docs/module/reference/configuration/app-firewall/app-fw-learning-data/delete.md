---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteAppFwLearningData

## SYNOPSIS
Removes a NetScaler appfwlearningdata resource.

## SYNTAX

```
Invoke-NSDeleteAppFwLearningData [[-ProfileName] <String>] [[-StartURL] <String>]
 [[-CookieConsistency] <String>] [[-FieldConsistency] <String>] [[-FormActionURLFfc] <String>]
 [[-ContentType] <String>] [[-Crosssitescripting] <String>] [[-FormActionURLXss] <String>]
 [[-AsScanLocationXss] <String>] [[-AsValueTypeXss] <String>] [[-AsValueExprXss] <String>]
 [[-Sqlinjection] <String>] [[-FormActionURLSql] <String>] [[-AsScanLocationSql] <String>]
 [[-AsValueTypeSql] <String>] [[-AsValueExprSql] <String>] [[-FieldFormAt] <String>]
 [[-FormActionURLFf] <String>] [[-Csrftag] <String>] [[-CsrfFormOriginURL] <String>]
 [[-Creditcardnumber] <String>] [[-CreditcardnumberURL] <String>] [[-XMLDoscheck] <String>]
 [[-XMLWsicheck] <String>] [[-XMLAttachmentcheck] <String>] [[-TotalXMLRequestS] <Boolean>]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for learning data resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteAppFwLearningData -ProfileName 'example' -StartURL 'example' -CookieConsistency 'example' -FieldConsistency 'example' -ContentType 'example' -Crosssitescripting 'example' -Sqlinjection 'example' -FieldFormAt 'example' -Csrftag 'example' -CsrfFormOriginURL 'example' -Creditcardnumber 'example' -CreditcardnumberURL 'example' -XMLDoscheck 'example' -XMLWsicheck 'example' -XMLAttachmentcheck 'example' -TotalXMLRequestS $true -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetAppFwLearningData  | Invoke-NSDeleteAppFwLearningData -Confirm:$false
```

## PARAMETERS

### -ProfileName
Name of the profile.

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

### -StartURL
Start URL configuration.
Minimum length = 1

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

### -CookieConsistency
Cookie Name.
Minimum length = 1

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

### -FieldConsistency
Form field name.
Minimum length = 1

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

### -FormActionURLFfc
Form action URL.

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

### -ContentType
Content Type Name.
Minimum length = 1

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

### -Crosssitescripting
Cross-site scripting.
Minimum length = 1

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

### -FormActionURLXss
Form action URL.
Minimum length = 1

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

### -AsScanLocationXss
Location of cross-site scripting exception - form field, header, cookie or url.
Possible values = FORMFIELD, HEADER, COOKIE, URL

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

### -AsValueTypeXss
XSS value type.
(Tag | Attribute | Pattern).
Possible values = Tag, Attribute, Pattern

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

### -AsValueExprXss
XSS value expressions consistituting expressions for Tag, Attribute or Pattern.

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

### -Sqlinjection
Form field name.
Minimum length = 1

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

### -FormActionURLSql
Form action URL.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsScanLocationSql
Location of sql injection exception - form field, header or cookie.
Possible values = FORMFIELD, HEADER, COOKIE

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

### -AsValueTypeSql
SQL value type.
Keyword, SpecialString or Wildchar.
Possible values = Keyword, SpecialString, Wildchar

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

### -AsValueExprSql
SQL value expressions consistituting expressions for Keyword, SpecialString or Wildchar.

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

### -FieldFormAt
Field format name.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FormActionURLFf
Form action URL.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Csrftag
CSRF Form Action URL.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CsrfFormOriginURL
CSRF Form Origin URL.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Creditcardnumber
The object expression that is to be excluded from safe commerce check.
Minimum length = 1

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

### -CreditcardnumberURL
The url for which the list of credit card numbers are needed to be bypassed from inspection.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -XMLDoscheck
XML Denial of Service check, one of MaxAttributes MaxAttributeNameLength MaxAttributeValueLength MaxElementNameLength MaxFileSize MinFileSize MaxCDATALength MaxElements MaxElementDepth MaxElementChildren NumDTDs NumProcessingInstructions NumExternalEntities MaxEntityExpansions MaxEntityExpansionDepth MaxNamespaces MaxNamespaceUriLength MaxSOAPArraySize MaxSOAPArrayRank .
Minimum length = 1

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

### -XMLWsicheck
Web Services Interoperability Rule ID.
Minimum length = 1

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

### -XMLAttachmentcheck
XML Attachment Content-Type.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TotalXMLRequestS
Total XML requests.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
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
Position: 27
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

