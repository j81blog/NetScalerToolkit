---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateSystemGroup

## SYNOPSIS
Updates a NetScaler systemgroup resource.

## SYNTAX

```
Invoke-NSUpdateSystemGroup [-Allowedmanagementinterface <String[]>] [-Daystoexpire <Int32>]
 [-GroupName] <String> [-Promptstring <String>] [-Timeout <Int32>] [-Warnpriorndays <Int32>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for system group resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateSystemGroup -GroupName 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateSystemGroup -GroupName 'example' -WhatIf
```

## PARAMETERS

### -Allowedmanagementinterface
Allowed Management interfaces of the system users in the group.
By default allowed from both API and CLI interfaces.
If management interface for a group is set to API, then all users under this group will not allowed to access NS through CLI.
GUI interface will come under API interface.
Default value: NS_INTERFACE_ALL Possible values = CLI, API

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Daystoexpire
Password days to expire for system groups.
The daystoexpire value ranges from 30 to 255.
Minimum value = 30 Maximum value = 255

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

### -GroupName
Name for the group.
Must begin with a letter, number, hash(#) or the underscore (_) character, and must contain only alphanumeric, hyphen (-), period (.), hash (#), space ( ), at (@), equal (=), colon (:), and underscore characters.
Cannot be changed after the group is created.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my group" or 'my group').
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

### -Promptstring
String to display at the command-line prompt.
Can consist of letters, numbers, hyphen (-), period (.), hash (#), space ( ), at (@), equal (=), colon (:), underscore (_), and the following variables: * %u - Will be replaced by the user name.
* %h - Will be replaced by the hostname of the Citrix ADC.
* %t - Will be replaced by the current time in 12-hour format.
* %T - Will be replaced by the current time in 24-hour format.
* %d - Will be replaced by the current date.
* %s - Will be replaced by the state of the Citrix ADC.
Note: The 63-character limit for the length of the string does not apply to the characters that replace the variables.
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

### -Timeout
CLI session inactivity timeout, in seconds.
If Restrictedtimeout argument of system parameter is enabled, Timeout can have values in the range \[300-86400\] seconds.If Restrictedtimeout argument of system parameter is disabled, Timeout can have values in the range \[0, 10-100000000\] seconds.
Default value is 900 seconds.

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

### -Warnpriorndays
Number of days before which password expiration warning would be thrown with respect to daystoexpire.
The warnpriorndays value ranges from 5 to 40.
Minimum value = 5 Maximum value = 40

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

