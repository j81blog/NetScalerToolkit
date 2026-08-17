---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateRDPClientProfile

## SYNOPSIS
Updates a NetScaler rdpclientprofile resource.

## SYNTAX

```
Invoke-NSUpdateRDPClientProfile [-AddUserNameInRDPFile <String>] [-AudiocaptureMode <String>]
 [-KeyBoardhook <String>] [-MultiMonItorsupPort <String>] [-Name] <String> [-Psk <String>]
 [-RandomizeRDPFileName <String>] [-RDPCookieValidity <Int32>] [-RDPCustomParams <String>]
 [-RDPFileName <String>] [-RDPHost <String>] [-RDPLinkattribute <String>] [-RDPListenEr <String>]
 [-RDPURLOverride <String>] [-RDPValidateClientIp <String>] [-RedirectCLIPboard <String>]
 [-RedirectComPortS <String>] [-RedirectDrives <String>] [-RedirectPnpdevices <String>]
 [-RedirectPrinters <String>] [-VideoplaybackMode <String>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for RDP clientprofile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateRDPClientProfile -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateRDPClientProfile -Name 'example' -WhatIf
```

## PARAMETERS

### -AddUserNameInRDPFile
Add username in rdp file.
Default value: NO Possible values = YES, NO

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

### -AudiocaptureMode
This setting corresponds to the selections in the Remote audio area on the Local Resources tab under Options in RDC.
Default value: DISABLE Possible values = ENABLE, DISABLE

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

### -KeyBoardhook
This setting corresponds to the selection in the Keyboard drop-down list on the Local Resources tab under Options in RDC.
Default value: InFullScreenMode Possible values = OnLocal, OnRemote, InFullScreenMode

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

### -MultiMonItorsupPort
Enable/Disable Multiple Monitor Support for Remote Desktop Connection (RDC).
Default value: ENABLE Possible values = ENABLE, DISABLE

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
The name of the rdp profile.
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

### -Psk
Pre shared key value.
Default value: 0

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

### -RandomizeRDPFileName
Will generate unique filename everytime rdp file is downloaded by appending output of time() function in the format \<rdpfileName\>_\<time\>.rdp.
This tries to avoid the pop-up for replacement of existing rdp file during each rdp connection launch, hence providing better end-user experience.
Default value: NO Possible values = YES, NO

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

### -RDPCookieValidity
RDP cookie validity period.
RDP cookie validity time is applicable for new connection and also for any re-connection that might happen, mostly due to network disruption or during fail-over.
Default value: 60 Minimum value = 1 Maximum value = 86400

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

### -RDPCustomParams
Option for RDP custom parameters settings (if any).
Custom params needs to be separated by '&'.
Default value: 0 Minimum length = 1

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

### -RDPFileName
RDP file name to be sent to End User.
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

### -RDPHost
Fully-qualified domain name (FQDN) of the RDP Listener.
Maximum length = 252

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

### -RDPLinkattribute
Citrix Gateway allows the configuration of rdpLinkAttribute parameter which can be used to fetch a list of RDP servers(IP/FQDN) that a user can access, from an Authentication server attribute(Example: LDAP, SAML).
Based on the list received, the RDP links will be generated and displayed to the user.
Note: The Attribute mentioned in the rdpLinkAttribute should be fetched through corresponding authentication method.

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

### -RDPListenEr
IP address (or) Fully-qualified domain name(FQDN) of the RDP Listener with the port in the format IP:Port (or) FQDN:Port.
Maximum length = 255

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

### -RDPURLOverride
This setting determines whether the RDP parameters supplied in the vpn url override those specified in the RDP profile.
Default value: ENABLE Possible values = ENABLE, DISABLE

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

### -RDPValidateClientIp
This setting determines whether RDC launch is initiated by the valid client IP.
Default value: DISABLE Possible values = ENABLE, DISABLE

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

### -RedirectCLIPboard
This setting corresponds to the Clipboard check box on the Local Resources tab under Options in RDC.
Default value: ENABLE Possible values = ENABLE, DISABLE

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

### -RedirectComPortS
This setting corresponds to the selections for comports under More on the Local Resources tab under Options in RDC.
Default value: DISABLE Possible values = ENABLE, DISABLE

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

### -RedirectDrives
This setting corresponds to the selections for Drives under More on the Local Resources tab under Options in RDC.
Default value: DISABLE Possible values = ENABLE, DISABLE

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

### -RedirectPnpdevices
This setting corresponds to the selections for pnpdevices under More on the Local Resources tab under Options in RDC.
Default value: DISABLE Possible values = ENABLE, DISABLE

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

### -RedirectPrinters
This setting corresponds to the selection in the Printers check box on the Local Resources tab under Options in RDC.
Default value: ENABLE Possible values = ENABLE, DISABLE

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

### -VideoplaybackMode
This setting determines if Remote Desktop Connection (RDC) will use RDP efficient multimedia streaming for video playback.
Default value: ENABLE Possible values = ENABLE, DISABLE

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

