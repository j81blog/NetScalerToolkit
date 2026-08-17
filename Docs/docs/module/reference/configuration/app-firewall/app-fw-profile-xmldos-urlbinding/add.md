---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddAppFwProfileXMLDosURLBinding

## SYNOPSIS
Creates a NetScaler appfwprofile_xmldosurl_binding resource.

## SYNTAX

```
Invoke-NSAddAppFwProfileXMLDosURLBinding [-Comment <String>] [-Isautodeployed <String>] [-Name] <String>
 [-Resourceid <String>] [-RuleType <String>] [-State <String>] [-XMLBlockdtd <String>]
 [-XMLBlockexternalentities <String>] [-XMLBlockpi <String>] [-XMLDosURL <String>]
 [-XMLMaxAttributeNameLength <Int32>] [-XMLMaxAttributeNameLengthCheck <String>] [-XMLMaxAttributes <Int32>]
 [-XMLMaxAttributescheck <String>] [-XMLMaxAttributevalueLength <Int32>]
 [-XMLMaxAttributevalueLengthCheck <String>] [-XMLMaxCharDataLength <Int32>]
 [-XMLMaxCharDataLengthCheck <String>] [-XMLMaxElementchildren <Int32>] [-XMLMaxElementchildrencheck <String>]
 [-XMLMaxElementdepth <Int32>] [-XMLMaxElementdepthcheck <String>] [-XMLMaxElementNameLength <Int32>]
 [-XMLMaxElementNameLengthCheck <String>] [-XMLMaxElements <Int32>] [-XMLMaxElementscheck <String>]
 [-XMLMaxEntityexpansiondepth <Int32>] [-XMLMaxEntityexpansiondepthcheck <String>]
 [-XMLMaxEntityexpansions <Int32>] [-XMLMaxEntityexpansionscheck <String>] [-XMLMaxFileSize <Int32>]
 [-XMLMaxFileSizecheck <String>] [-XMLMaxNameSpaces <Int32>] [-XMLMaxNameSpacescheck <String>]
 [-XMLMaxNameSpaceuriLength <Int32>] [-XMLMaxNameSpaceuriLengthCheck <String>] [-XMLMaxNodes <Int32>]
 [-XMLMaxNodescheck <String>] [-XMLMaxSoaparrayrank <Int32>] [-XMLMaxSoaparraysize <Int32>]
 [-XMLMinFileSize <Int32>] [-XMLMinFileSizecheck <String>] [-XMLSoaparraycheck <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the xmldosurl that can be bound to appfwprofile.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddAppFwProfileXMLDosURLBinding -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddAppFwProfileXMLDosURLBinding -Name 'example' -WhatIf
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

### -XMLBlockdtd
State if XML DTD is ON or OFF.
Protects against recursive Document Type Declaration (DTD) entity expansion attacks.
Also, SOAP messages cannot have DTDs in messages.
. Possible values = ON, OFF

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

### -XMLBlockexternalentities
State if XML Block External Entities Check is ON or OFF.
Protects against XML External Entity (XXE) attacks that force applications to parse untrusted external entities (sources) in XML documents.
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

### -XMLBlockpi
State if XML Block PI is ON or OFF.
Protects resources from denial of service attacks as SOAP messages cannot have processing instructions (PI) in messages.
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

### -XMLDosURL
XML DoS URL regular expression length.

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

### -XMLMaxAttributeNameLength
Specify the longest name of any XML attribute.
Protects against overflow attacks.

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

### -XMLMaxAttributeNameLengthCheck
State if XML Max attribute name length check is ON or OFF.
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

### -XMLMaxAttributes
Specify maximum number of attributes per XML element.
Protects against overflow attacks.

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

### -XMLMaxAttributescheck
State if XML Max attributes check is ON or OFF.
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

### -XMLMaxAttributevalueLength
Specify the longest value of any XML attribute.
Protects against overflow attacks.

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

### -XMLMaxAttributevalueLengthCheck
State if XML Max atribute value length is ON or OFF.
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

### -XMLMaxCharDataLength
Specify the maximum size of CDATA.
Protects against overflow attacks and large quantities of unparsed data within XML messages.
Minimum value = 0 Maximum value = 1000000000

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

### -XMLMaxCharDataLengthCheck
State if XML Max CDATA length check is ON or OFF.
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

### -XMLMaxElementchildren
Specify the maximum number of children allowed per XML element.
Protects against overflow attacks.

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

### -XMLMaxElementchildrencheck
State if XML Max element children check is ON or OFF.
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

### -XMLMaxElementdepth
Maximum nesting (depth) of XML elements.
This check protects against documents that have excessive hierarchy depths.

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

### -XMLMaxElementdepthcheck
State if XML Max element depth check is ON or OFF.
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

### -XMLMaxElementNameLength
Specify the longest name of any element (including the expanded namespace) to protect against overflow attacks.

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

### -XMLMaxElementNameLengthCheck
State if XML Max element name length check is ON or OFF.
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

### -XMLMaxElements
Specify the maximum number of XML elements allowed.
Protects against overflow attacks.

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

### -XMLMaxElementscheck
State if XML Max elements check is ON or OFF.
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

### -XMLMaxEntityexpansiondepth
Specify maximum entity expansion depth.
Protects aganist Entity Expansion Attack.

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

### -XMLMaxEntityexpansiondepthcheck
State if XML Max Entity Expansions Depth Check is ON or OFF.
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

### -XMLMaxEntityexpansions
Specify maximum allowed number of entity expansions.
Protects aganist Entity Expansion Attack.

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

### -XMLMaxEntityexpansionscheck
State if XML Max Entity Expansions Check is ON or OFF.
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

### -XMLMaxFileSize
Specify the maximum size of XML messages.
Protects against overflow attacks.
Minimum value = 0 Maximum value = 1000000000

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

### -XMLMaxFileSizecheck
State if XML Max file size check is ON or OFF.
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

### -XMLMaxNameSpaces
Specify maximum number of active namespaces.
Protects against overflow attacks.

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

### -XMLMaxNameSpacescheck
State if XML Max namespaces check is ON or OFF.
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

### -XMLMaxNameSpaceuriLength
Specify the longest URI of any XML namespace.
Protects against overflow attacks.

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

### -XMLMaxNameSpaceuriLengthCheck
State if XML Max namespace URI length check is ON or OFF.
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

### -XMLMaxNodes
Specify the maximum number of XML nodes.
Protects against overflow attacks.

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

### -XMLMaxNodescheck
State if XML Max nodes check is ON or OFF.
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

### -XMLMaxSoaparrayrank
XML Max Individual SOAP Array Rank.
This is the dimension of the SOAP array.

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

### -XMLMaxSoaparraysize
XML Max Total SOAP Array Size.
Protects against SOAP Array Abuse attack.
Minimum value = 0 Maximum value = 1000000000

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

### -XMLMinFileSize
Enforces minimum message size.
Minimum value = 0 Maximum value = 1000000000

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

### -XMLMinFileSizecheck
State if XML Min file size check is ON or OFF.
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

### -XMLSoaparraycheck
State if XML SOAP Array check is ON or OFF.
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

