---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate-user/new/
schema: 2.0.0
---

# New-NSACMECertificateUser

## SYNOPSIS
Creates or updates a NetScaler user for certificate automation.

## SYNTAX

### Connect (Default)
```
New-NSACMECertificateUser -ManagementURL <String> -Credential <PSCredential> [-PolicyName <String>]
 [-ApiUsername <String>] [-ApiPassword <Object>] [-CsVipName <String[]>] [-UseLbVip] [-LbName <String>]
 [-SvcName <String>] [-RspName <String>] [-RsaName <String>] [-CspName <String>] [-CsaName <String>]
 [-EnableVipBefore] [-DisableVipAfter] [-UseNetScalerDNS] [-UpdateGlobalVPNCertBinding]
 [-Partitions <String[]>] [-PruneExistingPolicyBindings] [-SaveADCConfig] [-SkipCertificateCheck] [-PassThru]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Session
```
New-NSACMECertificateUser -Session <Object> [-PolicyName <String>] [-ApiUsername <String>]
 [-ApiPassword <Object>] [-CsVipName <String[]>] [-UseLbVip] [-LbName <String>] [-SvcName <String>]
 [-RspName <String>] [-RsaName <String>] [-CspName <String>] [-CsaName <String>] [-EnableVipBefore]
 [-DisableVipAfter] [-UseNetScalerDNS] [-UpdateGlobalVPNCertBinding] [-Partitions <String[]>]
 [-PruneExistingPolicyBindings] [-SaveADCConfig] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates the limited command policies used by Request-NSACMECertificate and,
optionally, creates or updates a NetScaler system user and binds those
policies to the user.
This is the module replacement for the legacy
GenLeCertForNS -CreateUserPermissions and -CreateApiUser bootstrap path.

The function is idempotent.
Existing command policies are updated with the
current command specification, existing users are updated when ApiPassword is
provided, and missing policy bindings are added.

## EXAMPLES

### EXAMPLE 1
```
New-NSACMECertificateUser -ManagementURL https://adc.example.com -Credential (Get-Credential) -PolicyName script-GenLeCertForNS -CsVipName cs_example_http -ApiUsername leuser -ApiPassword 'L34s3r!' -SaveADCConfig
```

Creates or updates the certificate automation policies, creates/updates
leuser, binds the policies, and saves the ADC configuration.

## PARAMETERS

### -Session
Existing NetScaler session returned by Connect-NSNode.

```yaml
Type: Object
Parameter Sets: Session
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ManagementURL
NetScaler management URL.
Used when Session is not supplied.

```yaml
Type: String
Parameter Sets: Connect
Aliases: URL, NSManagementURL

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credential used to connect when Session is not supplied.

```yaml
Type: PSCredential
Parameter Sets: Connect
Aliases: NSCredential, ADCCredential

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyName
Base name for the three command policies.
The effective base is truncated to
24 characters when needed so the suffixed policy names stay within NetScaler
limits.
Alias: NSCPName.

```yaml
Type: String
Parameter Sets: (All)
Aliases: NSCPName

Required: False
Position: Named
Default value: Script-GenLeCertForNS
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApiUsername
Optional NetScaler system user to create or update.

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

### -ApiPassword
Password for ApiUsername.
Accepts plain text, SecureString, PSCredential, or
legacy GenLeCertForNS secret objects.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CsVipName
Content switching vServers that the generated command policy should permit.
Required unless UseLbVip is used.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: NSCsVipName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseLbVip
Indicates that HTTP validation uses an existing load balancing vServer instead
of content switching vServers.

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

### -LbName
Load balancing vServer name used by HTTP validation.

```yaml
Type: String
Parameter Sets: (All)
Aliases: NSLbName

Required: False
Position: Named
Default value: Lb_letsencrypt_cert
Accept pipeline input: False
Accept wildcard characters: False
```

### -SvcName
Service name used by HTTP validation.

```yaml
Type: String
Parameter Sets: (All)
Aliases: NSSvcName

Required: False
Position: Named
Default value: Svc_letsencrypt_cert_dummy
Accept pipeline input: False
Accept wildcard characters: False
```

### -RspName
Responder policy name prefix.

```yaml
Type: String
Parameter Sets: (All)
Aliases: NSRspName

Required: False
Position: Named
Default value: Rsp_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -RsaName
Responder action name prefix.

```yaml
Type: String
Parameter Sets: (All)
Aliases: NSRsaName

Required: False
Position: Named
Default value: Rsa_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -CspName
Content switching policy name.

```yaml
Type: String
Parameter Sets: (All)
Aliases: NSCspName

Required: False
Position: Named
Default value: Csp_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -CsaName
Content switching action name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Csa_letsencrypt
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableVipBefore
Adds enable permission for configured CS vServers.

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

### -DisableVipAfter
Adds disable permission for configured CS vServers.

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

### -UseNetScalerDNS
Adds DNS TXT record permissions for NetScaler-hosted DNS validation.

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

### -UpdateGlobalVPNCertBinding
Adds VPN global binding permissions.

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

### -Partitions
Optional NetScaler partitions to bind to the created user.
Partition command
policy permissions are included when non-default partitions are specified.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @('default')
Accept pipeline input: False
Accept wildcard characters: False
```

### -PruneExistingPolicyBindings
Removes command policy bindings from ApiUsername that do not match the three
generated policies or have the wrong priority.

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

### -SaveADCConfig
Saves the NetScaler configuration after changes.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: SaveNSConfig

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCertificateCheck
Skips TLS certificate validation when connecting to the NetScaler.

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

### -PassThru
Returns a result object.

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
Function  : New-NSACMECertificateUser
Author    : John Billekens
Copyright : Copyright (c) John Billekens Consultancy
Version   : 2026.0526.0001

## RELATED LINKS

[https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate-user/new/](https://netscalertoolkit.j81.nl/module/reference/common/nsacmecertificate-user/new/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


