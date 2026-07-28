---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddAuthenticationRADIUSAction

## SYNOPSIS
Creates a NetScaler authenticationradiusaction resource.

## SYNTAX

```
Invoke-NSAddAuthenticationRADIUSAction [-AccountIng <String>] [-Authentication <String>]
 [-Authservretry <Int32>] [-AuthTimeout <Int32>] [-Callingstationid <String>]
 [-DefaultAuthenticationGroup <String>] [-IpattributeType <Int32>] [-Ipvendorid <Int32>]
 [-MessageAuthenticator <String>] [-Name] <String> [-Passencoding <String>] [-PwdattributeType <Int32>]
 [-Pwdvendorid <Int32>] [-RadattributeType <Int32>] [-RadGroupSeparator <String>] [-RadGroupSprefix <String>]
 -RadKey <String> [-Radnasid <String>] [-RadnaSIP <String>] [-Radvendorid <Int32>] [-ServerIp <String>]
 [-ServerName <String>] [-ServerPort <Int32>] [-TargetlbVServer <String>] [-TransPort <String>]
 [-TunnelendpointClientIp <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for RADIUS action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddAuthenticationRADIUSAction -Name 'example' -RadKey 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddAuthenticationRADIUSAction -Name 'example' -RadKey 'example' -WhatIf
```

## PARAMETERS

### -AccountIng
Whether the RADIUS server is currently accepting accounting messages.
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

### -Authentication
Configure the RADIUS server state to accept or refuse authentication messages.
Default value: ON Possible values = ON, OFF

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

### -Authservretry
Number of retry by the Citrix ADC before getting response from the RADIUS server.
Default value: 3 Minimum value = 1 Maximum value = 10

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

### -AuthTimeout
Number of seconds the Citrix ADC waits for a response from the RADIUS server.
Default value: 3 Minimum value = 1

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

### -Callingstationid
Send Calling-Station-ID of the client to the RADIUS server.
IP Address of the client is sent as its Calling-Station-ID.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -DefaultAuthenticationGroup
This is the default group that is chosen when the authentication succeeds in addition to extracted groups.

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

### -IpattributeType
Remote IP address attribute type in a RADIUS response.
Minimum value = 1

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

### -Ipvendorid
Vendor ID of the intranet IP attribute in the RADIUS response.
NOTE: A value of 0 indicates that the attribute is not vendor encoded.

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

### -MessageAuthenticator
Control whether the Message-Authenticator attribute is included in a RADIUS Access-Request packet.
Default value: ON Possible values = ON, OFF

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
Name for the RADIUS action.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Cannot be changed after the RADIUS action is added.
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

### -Passencoding
Encoding type for passwords in RADIUS packets that the Citrix ADC sends to the RADIUS server.
Default value: pap Possible values = pap, chap, mschapv1, mschapv2

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

### -PwdattributeType
Vendor-specific password attribute type in a RADIUS response.
Minimum value = 1

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

### -Pwdvendorid
Vendor ID of the attribute, in the RADIUS response, used to extract the user password.
Minimum value = 1

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

### -RadattributeType
RADIUS attribute type, used for RADIUS group extraction.
Minimum value = 1

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

### -RadGroupSeparator
RADIUS group separator string The group separator delimits group names within a RADIUS attribute for RADIUS group extraction.

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

### -RadGroupSprefix
RADIUS groups prefix string.
This groups prefix precedes the group names within a RADIUS attribute for RADIUS group extraction.

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

### -RadKey
Key shared between the RADIUS server and the Citrix ADC.
Required to allow the Citrix ADC to communicate with the RADIUS server.
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

### -Radnasid
If configured, this string is sent to the RADIUS server as the Network Access Server ID (NASID).

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

### -RadnaSIP
If enabled, the Citrix ADC IP address (NSIP) is sent to the RADIUS server as the Network Access Server IP (NASIP) address.
The RADIUS protocol defines the meaning and use of the NASIP address.
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

### -Radvendorid
RADIUS vendor ID attribute, used for RADIUS group extraction.
Minimum value = 1

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

### -ServerIp
IP address assigned to the RADIUS server.
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

### -ServerName
RADIUS server name as a FQDN.
Mutually exclusive with RADIUS IP address.
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

### -ServerPort
Port number on which the RADIUS server listens for connections.
Minimum value = 1

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

### -TargetlbVServer
If transport mode is TLS, specify the name of LB vserver to associate.
The LB vserver needs to be of type TCP and service associated needs to be SSL_TCP.

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

### -TransPort
Transport mode to RADIUS server.
Default value: RAD_TRANSPORT_UDP Possible values = UDP, TCP, TLS

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

### -TunnelendpointClientIp
Send Tunnel Endpoint Client IP address to the RADIUS server.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

