---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nsnode/connect/
schema: 2.0.0
---

# Connect-NSNode

## SYNOPSIS
Connects to a NetScaler node.

## SYNTAX

### Session (Default)
```
Connect-NSNode -ManagementUrl <Uri> -Credential <PSCredential> [-UseSessionCookie] [-SkipCertificateCheck]
 [-HA] [-SuppressHAWarning] [-PassThru] [<CommonParameters>]
```

### NitroHeader
```
Connect-NSNode -ManagementUrl <Uri> -Credential <PSCredential> [-UseNitroHeader] [-SkipCertificateCheck] [-HA]
 [-SuppressHAWarning] [-PassThru] [<CommonParameters>]
```

## DESCRIPTION
Authenticates against the NITRO API and stores the resulting session as the
module default, so later commands can be called without passing -Session.
The
appliance version is queried during connect and used to select the matching
NITRO metadata set.

Authentication uses a session cookie by default, which creates a server-side
session that Disconnect-NSNode logs out.
Use -UseNitroHeader to send credentials
with every request instead, which creates no server-side session.

With -HA the high availability pair is inspected and sessions to both nodes are
attached to the returned object, so commands can target the primary node.

## EXAMPLES

### EXAMPLE 1
```
Connect-NSNode -ManagementUrl https://192.168.1.10 -Credential (Get-Credential)
```

Connects and stores the session as the module default.

### EXAMPLE 2
```
$session = Connect-NSNode -ManagementUrl https://192.168.1.10 -Credential $cred -SkipCertificateCheck -PassThru
```

Connects to a NetScaler with a self-signed management certificate and keeps the
session object for later use.

### EXAMPLE 3
```
Connect-NSNode -ManagementUrl https://192.168.1.10 -Credential $cred -HA -PassThru
```

Connects and inspects the HA pair, so the returned session knows which node is
primary.

## PARAMETERS

### -ManagementUrl
Management address of the NetScaler, for example https://192.168.1.10.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credential used to authenticate.
Use New-NSACMECertificateUser to create an
account limited to the commands this module needs.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseSessionCookie
Authenticates once and reuses a session cookie.
This is the default.

```yaml
Type: SwitchParameter
Parameter Sets: Session
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseNitroHeader
Sends the credentials as NITRO headers on every request instead of creating a
server-side session.
Useful when session limits are a concern.

```yaml
Type: SwitchParameter
Parameter Sets: NitroHeader
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCertificateCheck
Skips TLS validation of the management certificate.
Use this for self-signed or
private CA certificates.

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

### -HA
Inspects the high availability configuration and attaches sessions for the
primary and secondary nodes.

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

### -SuppressHAWarning
{{ Fill SuppressHAWarning Description }}

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
Returns the session object.
Without this the session is stored as the module
default but nothing is written to the pipeline.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://netscalertoolkit.j81.nl/module/reference/common/nsnode/connect/](https://netscalertoolkit.j81.nl/module/reference/common/nsnode/connect/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


