---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddCSPolicyLabel

## SYNOPSIS
Creates a NetScaler cspolicylabel resource.

## SYNTAX

```
Invoke-NSAddCSPolicyLabel -CsPolicyLabelType <String> [-LabelName] <String> [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for CS policy label resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddCSPolicyLabel -LabelName 'example' -CsPolicyLabelType HTTP -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddCSPolicyLabel -LabelName 'example' -CsPolicyLabelType HTTP -WhatIf
```

## PARAMETERS

### -CsPolicyLabelType
Protocol supported by the policy label.
All policies bound to the policy label must either match the specified protocol or be a subtype of that protocol.
Available settings function as follows: * HTTP - Supports policies that process HTTP traffic.
Used to access unencrypted Web sites.
(The default.) * SSL - Supports policies that process HTTPS/SSL encrypted traffic.
Used to access encrypted Web sites.
* TCP - Supports policies that process any type of TCP traffic, including HTTP.
* SSL_TCP - Supports policies that process SSL-encrypted TCP traffic, including SSL.
* UDP - Supports policies that process any type of UDP-based traffic, including DNS.
* DNS - Supports policies that process DNS traffic.
* ANY - Supports all types of policies except HTTP, SSL, and TCP.
* SIP_UDP - Supports policies that process UDP based Session Initiation Protocol (SIP) traffic.
SIP initiates, manages, and terminates multimedia communications sessions, and has emerged as the standard for Internet telephony (VoIP).
* RTSP - Supports policies that process Real Time Streaming Protocol (RTSP) traffic.
RTSP provides delivery of multimedia and other streaming data, such as audio, video, and other types of streamed media.
* RADIUS - Supports policies that process Remote Authentication Dial In User Service (RADIUS) traffic.
RADIUS supports combined authentication, authorization, and auditing services for network management.
* MYSQL - Supports policies that process MYSQL traffic.
* MSSQL - Supports policies that process Microsoft SQL traffic.
Possible values = HTTP, TCP, RTSP, SSL, SSL_TCP, UDP, DNS, SIP_UDP, SIP_TCP, ANY, RADIUS, RDP, MYSQL, MSSQL, ORACLE, DIAMETER, SSL_DIAMETER, FTP, DNS_TCP, SMPP, MQTT, MQTT_TLS, HTTP_QUIC

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

### -LabelName
Name for the policy label.
Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at sign (@), equal sign (=), and hyphen (-) characters.
The label name must be unique within the list of policy labels for content switching.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my policylabel" or 'my policylabel').

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

