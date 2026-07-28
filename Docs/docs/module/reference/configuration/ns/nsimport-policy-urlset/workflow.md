---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSImportPolicyURLSet

## SYNOPSIS
Imports NetScaler policyurlset data.

## SYNTAX

```
Invoke-NSImportPolicyURLSet [-CanaryURL <String>] [-Delimiter <String>] [-Interval <Int32>]
 [-Matchedid <Int32>] [-Name] <String> [-Overwrite <Boolean>] [-Privateset <Boolean>] [-Rowseparator <String>]
 [-Subdomainexactmatch <Boolean>] -URL <String> [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for URL set resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSImportPolicyURLSet -Name 'example' -URL 'example'
```

### EXAMPLE 2
```
Invoke-NSImportPolicyURLSet -Name 'example' -URL 'example' -WhatIf
```

## PARAMETERS

### -CanaryURL
Add this URL to this urlset.
Used for testing when contents of urlset is kept confidential.
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

### -Delimiter
CSV file record delimiter.
Default value: 44

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

### -Interval
The interval, in seconds, rounded down to the nearest 15 minutes, at which the update of urlset occurs.
Default value: 0 Minimum value = 0 Maximum value = 2592000

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

### -Matchedid
An ID that would be sent to AppFlow to indicate which URLSet was the last one that matched the requested URL.
Default value: 1 Minimum value = 2 Maximum value = 31

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
Unique name of the url set.
Not case sensitive.
Must begin with an ASCII letter or underscore (_) character and must contain only alphanumeric and underscore characters.
Must not be the name of an existing named expression, pattern set, dataset, string map, or HTTP callout.
Minimum length = 1 Maximum length = 127

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

### -Overwrite
Overwrites the existing file.
Default value: 0

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

### -Privateset
Prevent this urlset from being exported.
Default value: 0

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

### -Rowseparator
CSV file row separator.
Default value: 10

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

### -Subdomainexactmatch
Force exact subdomain matching, ex.
given an entry 'google.com' in the urlset, a request to 'news.google.com' won't match, if subdomainExactMatch is set.
Default value: 0

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

### -URL
URL (protocol, host, path and file name) from where the CSV (comma separated file) file will be imported or exported.
Each record/line will one entry within the urlset.
The first field contains the URL pattern, subsequent fields contains the metadata, if available.
HTTP, HTTPS and FTP protocols are supported.
NOTE: The operation fails if the destination HTTPS server requires client certificate authentication for access.
Minimum length = 1 Maximum length = 2047

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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

