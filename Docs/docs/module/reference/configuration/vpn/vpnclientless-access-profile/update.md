---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateVPNClientlessAccessProfile

## SYNOPSIS
Updates a NetScaler vpnclientlessaccessprofile resource.

## SYNTAX

```
Invoke-NSUpdateVPNClientlessAccessProfile [-ClientConsumedCookieS <String>]
 [-JavascriptRewritePolicyLabel <String>] [-ProfileName] <String> [-RegexforfindingCustomURLS <String>]
 [-RegexforfindingURLIncss <String>] [-RegexforfindingURLInjavascript <String>]
 [-RegexforfindingURLInxcomponent <String>] [-RegexforfindingURLInXML <String>]
 [-ReqhdrRewritePolicyLabel <String>] [-RequirepersistentCookie <String>] [-ReshdrRewritePolicyLabel <String>]
 [-URLRewritePolicyLabel <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Clientless VPN rewrite profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateVPNClientlessAccessProfile -ProfileName 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateVPNClientlessAccessProfile -ProfileName 'example' -WhatIf
```

## PARAMETERS

### -ClientConsumedCookieS
Specify the name of the pattern set containing the names of the cookies, which are allowed between the client and the server.
If a pattern set is not specified, Citrix Gateway does not allow any cookies between the client and the server.
A cookie that is not specified in the pattern set is handled by Citrix Gateway on behalf of the client.
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

### -JavascriptRewritePolicyLabel
Name of the configured JavaScript rewrite policy label.
If you do not specify a policy label name, then JAVA scripts are not rewritten.
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

### -ProfileName
Name for the Citrix Gateway clientless access profile.
Must begin with an ASCII alphabetic or underscore (_) character, and must consist only of ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Cannot be changed after the profile is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile').
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

### -RegexforfindingCustomURLS
Name of the pattern set that contains the regular expressions, which match the URLs in the custom content type other than HTML, CSS, XML, XCOMP, and JavaScript.
The custom content type should be included in the patset ns_cvpn_custom_content_types.
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

### -RegexforfindingURLIncss
Name of the pattern set that contains the regular expressions, which match the URL in the CSS.
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

### -RegexforfindingURLInjavascript
Name of the pattern set that contains the regular expressions, which match the URL in Java script.
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

### -RegexforfindingURLInxcomponent
Name of the pattern set that contains the regular expressions, which match the URL in X Component.
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

### -RegexforfindingURLInXML
Name of the pattern set that contains the regular expressions, which match the URL in XML.
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

### -ReqhdrRewritePolicyLabel
Name of the configured Request rewrite policy label.
If you do not specify a policy label name, then requests are not rewritten.
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

### -RequirepersistentCookie
Specify whether a persistent session cookie is set and accepted for clientless access.
If this parameter is set to ON, COM objects, such as MSOffice, which are invoked by the browser can access the files using clientless access.
Use caution because the persistent cookie is stored on the disk.
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

### -ReshdrRewritePolicyLabel
Name of the configured Response rewrite policy label.
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

### -URLRewritePolicyLabel
Name of the configured URL rewrite policy label.
If you do not specify a policy label name, then URLs are not rewritten.
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

