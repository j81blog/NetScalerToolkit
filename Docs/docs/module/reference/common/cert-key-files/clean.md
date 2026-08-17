---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/cert-key-files/clean/
schema: 2.0.0
---

# Invoke-NSCleanCertKeyFiles

## SYNOPSIS
Removes unused NetScaler SSL certkey objects and orphaned certificate files.

## SYNTAX

### Session (Default)
```
Invoke-NSCleanCertKeyFiles -Session <PSObject> [-Backup] [-NoSaveConfig] [-Attempts <Int32>]
 [-ExpirationDays <Int32>] [-FileLocation <String>] [-ExcludeCertKey <String[]>] [-ExcludeFile <String[]>]
 [-ExcludeFilePattern <String[]>] [-PassThru] [-Summary] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Connect
```
Invoke-NSCleanCertKeyFiles -ManagementUrl <Uri> -Credential <PSCredential> [-SkipCertificateCheck]
 [-UseNitroHeader] [-Backup] [-NoSaveConfig] [-Attempts <Int32>] [-ExpirationDays <Int32>]
 [-FileLocation <String>] [-ExcludeCertKey <String[]>] [-ExcludeFile <String[]>]
 [-ExcludeFilePattern <String[]>] [-PassThru] [-Summary] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Scans SSL certkey objects, generated binding resources, selected global references, linked certificates, SAML actions,
SSL DH file references, and the running configuration before removing anything.
A certkey or file is only removed
when no detected configuration reference remains.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSCleanCertKeyFiles -ManagementUrl 'https://ns-01.domain.local' -Credential (Get-Credential) -Backup -WhatIf
```

### EXAMPLE 2
```
$session = Connect-NSNode -ManagementUrl 'https://ns-01.domain.local' -Credential (Get-Credential) -HA -PassThru
```

Invoke-NSCleanCertKeyFiles -Session $session -PassThru

## PARAMETERS

### -ManagementUrl
NetScaler management URL used to create a new HA-aware session.

```yaml
Type: Uri
Parameter Sets: Connect
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credential used when connecting to the NetScaler.

```yaml
Type: PSCredential
Parameter Sets: Connect
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Session
Existing NetScaler session.
If it contains PrimarySession and SecondarySession records, files are removed from both nodes.

```yaml
Type: PSObject
Parameter Sets: Session
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCertificateCheck
Skips TLS certificate validation when creating a new NetScaler session with ManagementUrl and Credential.

```yaml
Type: SwitchParameter
Parameter Sets: Connect
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseNitroHeader
Uses the NITRO authentication header when creating a new NetScaler session with ManagementUrl and Credential.

```yaml
Type: SwitchParameter
Parameter Sets: Connect
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Backup
Saves nsconfig and creates a full system backup before cleanup.

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

### -NoSaveConfig
Skips saving nsconfig after cleanup.

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

### -Attempts
Number of certkey removal scan attempts before file cleanup.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpirationDays
Warns about remaining certificates expiring in this many days.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileLocation
NetScaler file location to scan for certificate files.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: /nsconfig/ssl/
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeCertKey
SSL certkey names that must never be removed.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @('ns-server-certificate')
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeFile
Certificate file names that must never be removed.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @('adc-root-certs.crt', 'trusted_root_certs.pem')
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeFilePattern
Wildcard file-name patterns that must never be removed.
Default patterns protect NetScaler SSL support files and certificate hash links.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @('ns-root.*', 'ns-server.*', 'ns-sftrust-root.*', 'ns-sftrust.*', '*.0', '*.1', '*.2', '*.3', '*.4', '*.5', '*.6', '*.7', '*.8', '*.9', '*.a', '*.b', '*.c', '*.d', '*.e', '*.f')
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Returns the final cleanup plan with removed certkey and file details.

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

### -Summary
Writes a compact cleanup summary to the host and returns the final cleanup plan.

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

## NOTES

## RELATED LINKS

[https://netscalertoolkit.j81.nl/module/reference/common/cert-key-files/clean/](https://netscalertoolkit.j81.nl/module/reference/common/cert-key-files/clean/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


