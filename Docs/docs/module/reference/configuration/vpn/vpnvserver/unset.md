---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetVPNVServer

## SYNOPSIS
Clears one or more NetScaler vpnvserver resource properties.

## SYNTAX

```
Invoke-NSUnsetVPNVServer [-Name] <String> [-AccessrestrictedPageRedirect] [-Advancedepa] [-AppFlowLog]
 [-Authentication] [-AuthnProfile] [-CertKeyNameS] [-CginfrahomePageRedirect] [-Comment] [-DeviceCert]
 [-Deviceposture] [-Doublehop] [-DownStateFlush] [-Dtls] [-HTTPProfileName] [-Icaonly]
 [-IcaProxySessionmigration] [-ICMPVsrResponse] [-IPSet] [-L2Conn] [-Linuxepapluginupgrade] [-ListenPolicy]
 [-ListenPriority] [-LoginOnce] [-Logoutonsmartcardremoval] [-Macepapluginupgrade] [-MaxAAAUserS]
 [-MaxLoginAttempts] [-NetProfile] [-PCoIPVServerProfileName] [-QUICProfileName] [-RDPServerProfileName]
 [-Rhistate] [-Samesite] [-Secureprivateaccess] [-TCPProfileName] [-UserDomains] [-VServerFqdn] [-WASMModule]
 [-Windowsepapluginupgrade] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for VPN virtual server resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetVPNVServer -Name 'example' -AccessrestrictedPageRedirect CDN -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetVPNVServer -Name 'example' -AccessrestrictedPageRedirect CDN -WhatIf
```

## PARAMETERS

### -Name
Name for the Citrix Gateway virtual server.
Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
Can be changed after the virtual server is created.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my server" or 'my server').
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

### -AccessrestrictedPageRedirect
By default, an access restricted page hosted on secure private access CDN is displayed when a restricted app is accessed.
The setting can be changed to NS to display the access restricted page hosted on the gateway or OFF to not display any access restricted page.
Default value: CDN Possible values = CDN, NS, OFF

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

### -Advancedepa
This option tells whether advanced EPA is enabled on this virtual server.
Default value: OFF Possible values = ON, OFF

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

### -AppFlowLog
Log AppFlow records that contain standard NetFlow or IPFIX information, such as time stamps for the beginning and end of a flow, packet count, and byte count.
Also log records that contain application-level information, such as HTTP web addresses, HTTP request methods and response status codes, server response time, and latency.
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

### -Authentication
Require authentication for users connecting to Citrix Gateway.
Default value: ON Possible values = ON, OFF

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

### -AuthnProfile
Authentication Profile entity on virtual server.
This entity can be used to offload authentication to AAA vserver for multi-factor(nFactor) authentication.

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

### -CertKeyNameS
Name of the certificate key that was bound to the corresponding SSL virtual server as the Certificate Authority for the device certificate.
Minimum length = 1 Maximum length = 127

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

### -CginfrahomePageRedirect
When client requests ShareFile resources and Citrix Gateway detects that the user is unauthenticated or the user session has expired, disabling this option takes the user to the originally requested ShareFile resource after authentication (instead of taking the user to the default VPN home page).
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

### -Comment
Any comments associated with the virtual server.

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

### -DeviceCert
Indicates whether device certificate check as a part of EPA is on or off.
Default value: OFF Possible values = ON, OFF

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

### -Deviceposture
Enable device posture.
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

### -Doublehop
Use the Citrix Gateway appliance in a double-hop configuration.
A double-hop deployment provides an extra layer of security for the internal network by using three firewalls to divide the DMZ into two stages.
Such a deployment can have one appliance in the DMZ and one appliance in the secure network.
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

### -DownStateFlush
Close existing connections when the virtual server is marked DOWN, which means the server might have timed out.
Disconnecting existing connections frees resources and in certain cases speeds recovery of overloaded load balancing setups.
Enable this setting on servers in which the connections can safely be closed when they are marked DOWN.
Do not enable DOWN state flush on servers that must complete their transactions.
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

### -Dtls
This option starts/stops the turn service on the vserver.
Default value: ON Possible values = ON, OFF

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

### -HTTPProfileName
Name of the HTTP profile to assign to this virtual server.
Default value: "nshttp_default_strict_validation" Minimum length = 1 Maximum length = 127

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

### -Icaonly
- When set to ON, it implies Basic mode where the user can log on using either Citrix Receiver or a browser and get access to the published apps configured at the XenApp/XenDEsktop environment pointed out by the WIHome parameter. Users are not allowed to connect using the Citrix Gateway Plug-in and end point scans cannot be configured. Number of users that can log in and access the apps are not limited by the license in this mode. - When set to OFF, it implies Smart Access mode where the user can log on using either Citrix Receiver or a browser or a Citrix Gateway Plug-in. The admin can configure end point scans to be run on the client systems and then use the results to control access to the published apps. In this mode, the client can connect to the gateway in other client modes namely VPN and CVPN. Number of users that can log in and access the resources are limited by the CCU licenses in this mode. Default value: OFF Possible values = ON, OFF

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

### -IcaProxySessionmigration
This option determines if an existing ICA Proxy session is transferred when the user logs on from another device.
Default value: OFF Possible values = ON, OFF

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

### -ICMPVsrResponse
Criterion for responding to PING requests sent to this virtual server.
If this parameter is set to ACTIVE, respond only if the virtual server is available.
With the PASSIVE setting, respond even if the virtual server is not available.
Default value: PASSIVE Possible values = PASSIVE, ACTIVE

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

### -IPSet
The list of IPv4/IPv6 addresses bound to ipset would form a part of listening service on the current vpn vserver.
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

### -L2Conn
Use Layer 2 parameters (channel number, MAC address, and VLAN ID) in addition to the 4-tuple (\<source IP\>:\<source port\>::\<destination IP\>:\<destination port\>) that is used to identify a connection.
Allows multiple TCP and non-TCP connections with the same 4-tuple to coexist on the Citrix ADC.
Possible values = ON, OFF

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

### -Linuxepapluginupgrade
Option to set plugin upgrade behaviour for Linux.
Possible values = Always, Essential, Never

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

### -ListenPolicy
String specifying the listen policy for the Citrix Gateway virtual server.
Can be either a named expression or an expression.
The Citrix Gateway virtual server processes only the traffic for which the expression evaluates to true.
Default value: "none"

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

### -ListenPriority
Integer specifying the priority of the listen policy.
A higher number specifies a lower priority.
If a request matches the listen policies of more than one virtual server, the virtual server whose listen policy has the highest priority (the lowest priority number) accepts the request.
Default value: 101 Minimum value = 0 Maximum value = 100

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

### -LoginOnce
This option enables/disables seamless SSO for this Vserver.
Default value: OFF Possible values = ON, OFF

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

### -Logoutonsmartcardremoval
Option to VPN plugin behavior when smartcard or its reader is removed.
Default value: OFF Possible values = ON, OFF

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

### -Macepapluginupgrade
Option to set plugin upgrade behaviour for Mac.
Possible values = Always, Essential, Never

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

### -MaxAAAUserS
Maximum number of concurrent user sessions allowed on this virtual server.
The actual number of users allowed to log on to this virtual server depends on the total number of user licenses.

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

### -MaxLoginAttempts
Maximum number of logon attempts.
Minimum value = 1 Maximum value = 255

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

### -NetProfile
The name of the network profile.
Minimum length = 1 Maximum length = 127

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

### -PCoIPVServerProfileName
Name of the PCoIP vserver profile associated with the vserver.
Minimum length = 1 Maximum length = 31

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

### -QUICProfileName
Name of the QUIC profile to assign to this virtual server.
Minimum length = 1 Maximum length = 127

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

### -RDPServerProfileName
Name of the RDP server profile associated with the vserver.
Minimum length = 1 Maximum length = 31

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

### -Rhistate
A host route is injected according to the setting on the virtual servers.
* If set to PASSIVE on all the virtual servers that share the IP address, the appliance always injects the hostroute.
* If set to ACTIVE on all the virtual servers that share the IP address, the appliance injects even if one virtual server is UP.
* If set to ACTIVE on some virtual servers and PASSIVE on the others, the appliance injects even if one virtual server set to ACTIVE is UP.
Default value: PASSIVE Possible values = PASSIVE, ACTIVE

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

### -Samesite
SameSite attribute value for Cookies generated in VPN context.
This attribute value will be appended only for the cookies which are specified in the builtin patset ns_cookies_samesite.
Possible values = None, LAX, STRICT

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

### -Secureprivateaccess
Configure secure private access.
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

### -TCPProfileName
Name of the TCP profile to assign to this virtual server.
Minimum length = 1 Maximum length = 127

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

### -UserDomains
List of user domains specified as comma seperated value.

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

### -VServerFqdn
Fully qualified domain name for a VPN virtual server.
This is used during StoreFront configuration generation.

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

### -WASMModule
Name of the WASM module to assign to this virtual server.

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

### -Windowsepapluginupgrade
Option to set plugin upgrade behaviour for Win.
Possible values = Always, Essential, Never

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

