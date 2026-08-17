---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetICAPProfile

## SYNOPSIS
Clears one or more NetScaler nsicapprofile resource properties.

## SYNTAX

```
Invoke-NSUnsetICAPProfile [-Name] <String> [-Allow204] [-ConnectionKeepalive] [-HostHeader]
 [-InsertHTTPRequest] [-InsertIcapHeaderS] [-InSpecTHTTP2] [-LogAction] [-Preview] [-PreviewLength]
 [-Queryparams] [-ReqTimeout] [-ReqTimeoutAction] [-UserAgent] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for ICAP profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetICAPProfile -Name 'example' -Allow204 ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetICAPProfile -Name 'example' -Allow204 ENABLED -WhatIf
```

## PARAMETERS

### -Name
Name for an ICAP profile.
Must begin with a letter, number, or the underscore \\(_\\) character.
Other characters allowed, after the first character, are the hyphen \\(-\\), period \\(.\\), hash \\(\#\\), space \\( \\), at \\(@\\), colon \\(:\\), and equal \\(=\\) characters.
The name of a ICAP profile cannot be changed after it is created.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks \\(for example, "my icap profile" or 'my icap profile'\\).
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

### -Allow204
Enable or Disable sending Allow: 204 header in ICAP request.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -ConnectionKeepalive
If enabled, Citrix ADC keeps the ICAP connection alive after a transaction to reuse it to send next ICAP request.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -HostHeader
ICAP Host Header.
Minimum length = 1

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

### -InsertHTTPRequest
Exact HTTP request, in the form of an expression, which the Citrix ADC encapsulates and sends to the ICAP server.
If you set this parameter, the ICAP request is sent using only this header.
This can be used when the HTTP header is not available to send or ICAP server only needs part of the incoming HTTP request.
The request expression is constrained by the feature for which it is used.
The Citrix ADC does not check the validity of this request.
You must manually validate the request.
Minimum length = 1

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

### -InsertIcapHeaderS
Insert custom ICAP headers in the ICAP request to send to ICAP server.
The headers can be static or can be dynamically constructed using PI Policy Expression.
For example, to send static user agent and Client's IP address, the expression can be specified as "User-Agent: NS-ICAP-Client/V1.0\r\nX-Client-IP: "+CLIENT.IP.SRC+"\r\n".
The Citrix ADC does not check the validity of the specified header name-value.
You must manually validate the specified header syntax.
Minimum length = 1

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

### -InSpecTHTTP2
Enable or Disable ICAP inspection for HTTP/2 traffic.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -LogAction
Name of the audit message action which would be evaluated on receiving the ICAP response to emit the logs.

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

### -Preview
Enable or Disable preview header with ICAP request.
This feature allows an ICAP server to see the beginning of a transaction, then decide if it wants to opt-out of the transaction early instead of receiving the remainder of the request message.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -PreviewLength
Value of Preview Header field.
Citrix ADC uses the minimum of this set value and the preview size received on OPTIONS response.
Default value: 4096 Minimum value = 0 Maximum value = 4294967294

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

### -Queryparams
Query parameters to be included with ICAP request URI.
Entered values should be in arg=value format.
For more than one parameters, add & separated values.
e.g.: arg1=val1&arg2=val2.
Minimum length = 1

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

### -ReqTimeout
Time, in seconds, within which the remote server should respond to the ICAP-request.
If the Netscaler does not receive full response with this time, the specified request timeout action is performed.
Zero value disables this timeout functionality.
Default value: 0 Minimum value = 0 Maximum value = 86400

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

### -ReqTimeoutAction
Name of the action to perform if the Vserver/Server representing the remote service does not respond with any response within the timeout value configured.
The Supported actions are * BYPASS - This Ignores the remote server response and sends the request/response to Client/Server.
* If the ICAP response with Encapsulated headers is not received within the request-timeout value configured, this Ignores the remote ICAP server response and sends the Full request/response to Server/Client.
* RESET - Reset the client connection by closing it.
The client program, such as a browser, will handle this and may inform the user.
The client may then resend the request if desired.
* DROP - Drop the request without sending a response to the user.
Default value: RESET Possible values = BYPASS, DROP, RESET

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

### -UserAgent
ICAP User Agent Header String.
Minimum length = 1

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

