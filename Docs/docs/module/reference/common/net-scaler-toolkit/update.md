---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/net-scaler-toolkit/update/
schema: 2.0.0
---

# Update-NetScalerToolkit

## SYNOPSIS
Updates NetScalerToolkit from the PowerShell Gallery when a newer version is available.

## SYNTAX

```
Update-NetScalerToolkit [[-Repository] <String>] [[-Scope] <String>] [-AllowPrerelease] [-AcceptLicense]
 [-SkipPublisherCheck] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Checks the configured PowerShell Gallery repository for the latest NetScalerToolkit version.
If the gallery version is newer than the currently loaded module version, installs that exact version.

The command returns a status object so it can be used from scheduled tasks or automation logs.

## EXAMPLES

### EXAMPLE 1
```
Update-NetScalerToolkit
```

### EXAMPLE 2
```
Update-NetScalerToolkit -Scope AllUsers -Confirm:$false
```

### EXAMPLE 3
```
Register-ScheduledTask -TaskName 'Update NetScalerToolkit' -Action (New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-NoProfile -Command "Import-Module NetScalerToolkit; Update-NetScalerToolkit -Confirm:$false"') -Trigger (New-ScheduledTaskTrigger -Daily -At 03:00)
```

## PARAMETERS

### -Repository
PowerShellGet repository to query.
Defaults to PSGallery.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: PSGallery
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Installation scope used when a newer version is installed.
Defaults to CurrentUser.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: CurrentUser
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowPrerelease
Includes prerelease gallery versions when checking and installing.

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

### -AcceptLicense
Accepts the module license during installation when the gallery package requires it.

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

### -SkipPublisherCheck
Allows installation when publisher metadata differs from the installed module.

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

## RELATED LINKS

[https://netscalertoolkit.j81.nl/module/reference/common/net-scaler-toolkit/update/](https://netscalertoolkit.j81.nl/module/reference/common/net-scaler-toolkit/update/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


