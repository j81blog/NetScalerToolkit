---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetICAAccessProfile

## SYNOPSIS
Clears one or more NetScaler icaaccessprofile resource properties.

## SYNTAX

```
Invoke-NSUnsetICAAccessProfile [-Name] <String> [-ClientAudioRedirectIon] [-ClientCLIPboardRedirectIon]
 [-ClientComPortRedirectIon] [-ClientDriveRedirectIon] [-ClientPrinterRedirectIon]
 [-ClientTwaindeviceRedirectIon] [-ClientUsbdriveRedirectIon] [-ConnEctClientLptPortS] [-Draganddrop]
 [-Fido2RedirectIon] [-LocalRemoteDataSharing] [-MultiStream] [-SmartcardRedirectIon] [-WiaRedirectIon]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for ica accessprofile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetICAAccessProfile -Name 'example' -ClientAudioRedirectIon DEFAULT -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetICAAccessProfile -Name 'example' -ClientAudioRedirectIon DEFAULT -WhatIf
```

## PARAMETERS

### -Name
Name for the ICA accessprofile.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Cannot be changed after the ICA accessprofile is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my ica accessprofile" or 'my ica accessprofile').
Each of the features can be configured as DEFAULT/DISABLED.
Here, DISABLED means that the policy settings on the backend XenApp/XenDesktop server are overridden and the Citrix ADC makes the decision to deny access.
Whereas DEFAULT means that the Citrix ADC allows the request to reach the XenApp/XenDesktop that takes the decision to allow/deny access based on the policy configured on it.
For example, if ClientAudioRedirection is enabled on the backend XenApp/XenDesktop server, and the configured profile has ClientAudioRedirection as DISABLED, the Citrix ADC makes the decision to deny the request irrespective of the configuration on the backend.
If the configured profile has ClientAudioRedirection as DEFAULT, then the Citrix ADC forwards the requests to the backend XenApp/XenDesktop server.It then makes the decision to allow/deny access based on the policy configured on it.
Minimum length = 1

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

### -ClientAudioRedirectIon
Allow Default access/Disable applications hosted on the server to play sounds through a sound device installed on the client computer, also allows or prevents users to record audio input.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -ClientCLIPboardRedirectIon
Allow Default access/Disable the clipboard on the client device to be mapped to the clipboard on the server.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -ClientComPortRedirectIon
Allow Default access/Disable COM port redirection to and from the client.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -ClientDriveRedirectIon
Allow Default access/Disables drive redirection to and from the client.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -ClientPrinterRedirectIon
Allow Default access/Disable client printers to be mapped to a server when a user logs on to a session.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -ClientTwaindeviceRedirectIon
Allow default access or disable TWAIN devices, such as digital cameras or scanners, on the client device from published image processing applications.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -ClientUsbdriveRedirectIon
Allow Default access/Disable the redirection of USB devices to and from the client.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -ConnEctClientLptPortS
Allow Default access/Disable automatic connection of LPT ports from the client when the user logs on.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -Draganddrop
Allow default access or disable drag and drop between client and remote applications and desktops.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -Fido2RedirectIon
Allow default access or disable FIDO2 redirection.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -LocalRemoteDataSharing
Allow Default access/Disable file/data sharing via the Receiver for HTML5.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -MultiStream
Allow Default access/Disable the multistream feature for the specified users.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -SmartcardRedirectIon
Allow default access or disable smart card redirection.
Smart card virtual channel is always allowed in CVAD.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

### -WiaRedirectIon
Allow default access or disable WIA scanner redirection.
Default value: DISABLED Possible values = DEFAULT, DISABLED

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

