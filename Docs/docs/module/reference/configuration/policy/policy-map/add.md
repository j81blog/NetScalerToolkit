---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddPolicyMap

## SYNOPSIS
Creates a NetScaler policymap resource.

## SYNTAX

```
Invoke-NSAddPolicyMap [-MapPolicyName] <String> -Sd <String> [-Su <String>] [-TrafficDomain <String>]
 [-Tu <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for map policy resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddPolicyMap -MapPolicyName 'example' -Sd 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddPolicyMap -MapPolicyName 'example' -Sd 'example' -WhatIf
```

## PARAMETERS

### -MapPolicyName
Name for the map policy.
Must begin with a letter, number, or the underscore (_) character and must consist only of letters, numbers, and the hash (#), period (.), colon (:), space ( ), at (@), equals (=), hyphen (-), and underscore (_) characters.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my map" or 'my map').
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

### -Sd
Publicly known source domain name.
This is the domain name with which a client request arrives at a reverse proxy virtual server for cache redirection.
If you specify a source domain, you must specify a target domain.
Minimum length = 1

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

### -Su
Source URL.
Specify all or part of the source URL, in the following format: /\[\[prefix\] \[*\]\] \[.suffix\].
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

### -TrafficDomain
Target domain name sent to the server.
The source domain name is replaced with this domain name.
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

### -Tu
Target URL.
Specify the target URL in the following format: /\[\[prefix\] \[*\]\]\[.suffix\].
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

