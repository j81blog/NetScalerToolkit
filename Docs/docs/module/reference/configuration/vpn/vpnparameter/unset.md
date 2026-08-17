---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetVPNParameter

## SYNOPSIS
Clears one or more NetScaler vpnparameter resource properties.

## SYNTAX

```
Invoke-NSUnsetVPNParameter [-AccessrestrictedPageRedirect] [-AdvancedClientLessVPNMode] [-AllowedLoginGroupS]
 [-AllProtocolProxy] [-AlwaysonProfileName] [-ApptokenTimeout] [-AuthorizationGroup] [-AutoProxyURL]
 [-BackendCertValidation] [-Backenddtls12] [-BackendServerSni] [-CitrixReceiverhome] [-ClientChoices]
 [-ClientCleanupprompt] [-ClientConfiguration] [-ClientDebug] [-ClientIdleTimeout] [-ClientLessModeURLEncoding]
 [-ClientLesspersistentCookie] [-ClientLessVPNMode] [-ClientOptions] [-ClientsEcurity] [-ClientsEcurityGroup]
 [-ClientsEcuritylog] [-ClientsEcurityMessage] [-ClientVersions] [-DefaultauthorizationAction] [-Deviceposture]
 [-DNSVServerName] [-EmailHome] [-Encryptcsecexp] [-EpaClientType] [-Forcecleanup] [-ForcedTimeout]
 [-ForcedTimeoutWarning] [-FqDNSPoofedip] [-FtpProxy] [-GopherProxy] [-HomePage] [-HTTPPort] [-HTTPProxy]
 [-HTTPTrackConnProxy] [-IcaProxy] [-IcasessionTimeout] [-IcaUserAccountIng] [-Iconwithreceiver]
 [-IipDNSSuffix] [-KCDAccount] [-KillConnectionS] [-Linuxpluginupgrade] [-LocalLanaccess] [-LoginScript]
 [-Logoutscript] [-Macpluginupgrade] [-MaxIipperUser] [-MdxtokenTimeout] [-NetMask] [-Ntdomain]
 [-PCoIPProfileName] [-Proxy] [-ProxyException] [-ProxyLocalBypass] [-RDPClientProfileName] [-Rfc1918]
 [-Samesite] [-Securebrowse] [-Secureprivateaccess] [-SecureprivateaccessProfile] [-SessTimeout] [-SmartGroup]
 [-SocksProxy] [-SplitDNS] [-Splittunnel] [-Spoofiip] [-SSLProxy] [-SSO] [-SSOCredential] [-StorefrontURL]
 [-Transparentinterception] [-Uitheme] [-Useiip] [-Usemip] [-UserDomains] [-Wihome] [-Windowsautologon]
 [-WindowsClientType] [-Windowspluginupgrade] [-WinSIP] [-WiPortAlMode] [[-Session] <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for VPN parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetVPNParameter -AccessrestrictedPageRedirect CDN -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetVPNParameter -AccessrestrictedPageRedirect CDN -WhatIf
```

## PARAMETERS

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

### -AdvancedClientLessVPNMode
Option to enable/disable Advanced ClientlessVpnMode.
Additionaly, it can be set to STRICT to block Classic ClientlessVpnMode while in AdvancedClientlessMode.
Default value: DISABLED Possible values = ENABLED, DISABLED, STRICT

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

### -AllowedLoginGroupS
Specify groups that have permission to log on to Citrix Gateway.
Users who do not belong to this group or groups are denied access even if they have valid credentials.
Minimum length = 1 Maximum length = 511

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

### -AllProtocolProxy
IP address of the proxy server to use for all protocols supported by Citrix Gateway.
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

### -AlwaysonProfileName
Name of the AlwaysON profile.
The builtin profile named none can be used to explicitly disable AlwaysON.
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

### -ApptokenTimeout
The timeout value in seconds for tokens to access XenMobile applications.
Default value: 100 Minimum value = 1 Maximum value = 255

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

### -AuthorizationGroup
Comma-separated list of groups in which the user is placed when none of the groups that the user is a part of is configured on Citrix Gateway.
The authorization policy can be bound to these groups to control access to the resources.
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

### -AutoProxyURL
URL to auto proxy config file.

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

### -BackendCertValidation
enables backend server certificate validation.
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

### -Backenddtls12
Enables DTLS 1.2 for backend server handshakes.
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

### -BackendServerSni
enables sni extension for backend server handshakes.
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

### -CitrixReceiverhome
Web address for the Citrix Receiver home page.
Configure Citrix Gateway so that when users log on to the appliance, the Citrix Gateway Plug-in opens a web browser that allows single sign-on to the Citrix Receiver home page.

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

### -ClientChoices
Provide users with multiple logon options.
With client choices, users have the option of logging on by using the Citrix Gateway Plug-in for Windows, Citrix Gateway Plug-in for Java, the Web Interface, or clientless access from one location.
Depending on how Citrix Gateway is configured, users are presented with up to three icons for logon choices.
The most common are the Citrix Gateway Plug-in for Windows, Web Interface, and clientless access.
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

### -ClientCleanupprompt
Prompt for client-side cache clean-up when a client-initiated session closes.
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

### -ClientConfiguration
Allow users to change client Debug logging level in Configuration tab of the Citrix Gateway Plug-in for Windows.
Possible values = none, trace

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

### -ClientDebug
Set the trace level on Citrix Gateway.
Technical support technicians use these debug logs for in-depth debugging and troubleshooting purposes.
Available settings function as follows: * DEBUG - Detailed debug messages are collected and written into the specified file.
* STATS - Application audit level error messages and debug statistic counters are written into the specified file.
* EVENTS - Application audit-level error messages are written into the specified file.
* OFF - Only critical events are logged into the Windows Application Log.
Default value: OFF Possible values = debug, stats, events, OFF

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

### -ClientIdleTimeout
Time, in minutes, after which to time out the user session if Citrix Gateway does not detect mouse or keyboard activity.
Minimum value = 1 Maximum value = 9999

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

### -ClientLessModeURLEncoding
When clientless access is enabled, you can choose to encode the addresses of internal web applications or to leave the address as clear text.
Available settings function as follows: * OPAQUE - Use standard encoding mechanisms to make the domain and protocol part of the resource unclear to users.
* TRANSPARENT - Do not encode the web address and make it visible to users.
* ENCRYPT - Allow the domain and protocol to be encrypted using a session key.
When the web address is encrypted, the URL is different for each user session for the same web resource.
If users bookmark the encoded web address, save it in the web browser and then log off, they cannot connect to the web address when they log on and use the bookmark.
If users save the encrypted bookmark in the Access Interface during their session, the bookmark works each time the user logs on.
Default value: OPAQUE Possible values = TRANSPARENT, OPAQUE, ENCRYPT

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

### -ClientLesspersistentCookie
State of persistent cookies in clientless access mode.
Persistent cookies are required for accessing certain features of SharePoint, such as opening and editing Microsoft Word, Excel, and PowerPoint documents hosted on the SharePoint server.
A persistent cookie remains on the user device and is sent with each HTTP request.
Citrix Gateway encrypts the persistent cookie before sending it to the plug-in on the user device, and refreshes the cookie periodically as long as the session exists.
The cookie becomes stale if the session ends.
Available settings function as follows: * ALLOW - Enable persistent cookies.
Users can open and edit Microsoft documents stored in SharePoint.
* DENY - Disable persistent cookies.
Users cannot open and edit Microsoft documents stored in SharePoint.
* PROMPT - Prompt users to allow or deny persistent cookies during the session.
Persistent cookies are not required for clientless access if users do not connect to SharePoint.
Default value: DENY Possible values = ALLOW, DENY, PROMPT

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

### -ClientLessVPNMode
Enable clientless access for web, XenApp or XenDesktop, and FileShare resources without installing the Citrix Gateway Plug-in.
Available settings function as follows: * ON - Allow only clientless access.
* OFF - Allow clientless access after users log on with the Citrix Gateway Plug-in.
* DISABLED - Do not allow clientless access.
Default value: OFF Possible values = ON, OFF, DISABLED

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

### -ClientOptions
Display only the configured menu options when you select the "Configure Citrix Gateway" option in the Citrix Gateway Plug-in's system tray icon for Windows.
Possible values = none, all, services, filetransfer, configuration

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

### -ClientsEcurity
Specify the client security check for the user device to permit a Citrix Gateway session.
The web address or IP address is not included in the expression for the client security check.

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

### -ClientsEcurityGroup
The client security group that will be assigned on failure of the client security check.
Users can in general be organized into Groups.
In this case, the Client Security Group may have a more restrictive security policy.
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

### -ClientsEcuritylog
Specifies whether or not to display all failed Client Security scans to the end user.
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

### -ClientsEcurityMessage
The client security message that will be displayed on failure of the client security check.
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

### -ClientVersions
checkversion api.
Minimum length = 1 Maximum length = 100

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

### -DefaultauthorizationAction
Specify the network resources that users have access to when they log on to the internal network.
The default setting for authorization is to deny access to all network resources.
Citrix recommends using the default global setting and then creating authorization policies to define the network resources users can access.
If you set the default authorization policy to DENY, you must explicitly authorize access to any network resource, which improves security.
Default value: DENY Possible values = ALLOW, DENY

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

### -DNSVServerName
Name of the DNS virtual server for the user session.
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

### -EmailHome
Web address for the web-based email, such as Outlook Web Access.

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

### -Encryptcsecexp
Enable encryption of client security expressions.
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

### -EpaClientType
Choose between two types of End point Windows Client a) Application Agent - which always runs in the task bar as a standalone application and also has a supporting service which runs permanently when installed b) Activex Control - ActiveX control run by Microsoft Internet Explorer.
Possible values = AGENT, PLUGIN

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

### -Forcecleanup
Force cache clean-up when the user closes a session.
You can specify all, none, or any combination of the client-side items.
Possible values = none, all, cookie, addressbar, plugin, filesystemapplication, application, applicationdata, clientcertificate, autocomplete, cache

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

### -ForcedTimeout
Force a disconnection from the Citrix Gateway Plug-in with Citrix Gateway after a specified number of minutes.
If the session closes, the user must log on again.
Minimum value = 1 Maximum value = 65535

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

### -ForcedTimeoutWarning
Number of minutes to warn a user before the user session is disconnected.
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

### -FqDNSPoofedip
Spoofed IP address range that can be used by client for FQDN based split tunneling.
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

### -FtpProxy
IP address of the proxy server to be used for FTP access for all subsequent connections to the internal network.
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

### -GopherProxy
IP address of the proxy server to be used for GOPHER access for all subsequent connections to the internal network.
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

### -HomePage
Web address of the home page that appears when users log on.
Otherwise, users receive the default home page for Citrix Gateway, which is the Access Interface.

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

### -HTTPPort
Destination port numbers other than port 80, added as a comma-separated list.
Traffic to these ports is processed as HTTP traffic, which allows functionality, such as HTTP authorization and single sign-on to a web application to work.
Minimum value = 1

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

### -HTTPProxy
IP address of the proxy server to be used for HTTP access for all subsequent connections to the internal network.
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

### -HTTPTrackConnProxy
Use separate TCP connections for each connection proxy request in GSLB Active-Active setups.
Improves session isolation but may impact performance due to increased connections and TLS overhead.
Disabled by default.
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

### -IcaProxy
Enable ICA proxy to configure secure Internet access to servers running Citrix XenApp or XenDesktop by using Citrix Receiver instead of the Citrix Gateway Plug-in.
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

### -IcasessionTimeout
Enable or disable ica session timeout.
If enabled and in case AAA session gets terminated, ICA connections associated with that will also get terminated.
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

### -IcaUserAccountIng
The name of the radiusPolicy to use for RADIUS user accounting info on the session.

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

### -Iconwithreceiver
Option to decide whether to show plugin icon along with receiver icon.
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

### -IipDNSSuffix
An intranet IP DNS suffix.
When a user logs on to Citrix Gateway and is assigned an IP address, a DNS record for the user name and IP address combination is added to the Citrix Gateway DNS cache.
You can configure a DNS suffix to append to the user name when the DNS record is added to the cache.
You can reach to the host from where the user is logged on by using the user's name, which can be easier to remember than an IP address.
When the user logs off from Citrix Gateway, the record is removed from the DNS cache.
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

### -KCDAccount
The KCD account details to be used in SSO.

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

### -KillConnectionS
Specify whether the Citrix Gateway Plug-in should disconnect all preexisting connections, such as the connections existing before the user logged on to Citrix Gateway, and prevent new incoming connections on the Citrix Gateway Plug-in for Windows and MAC when the user is connected to Citrix Gateway and split tunneling is disabled.
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

### -Linuxpluginupgrade
Option to set plugin upgrade behaviour for Linux.
Default value: Always Possible values = Always, Essential, Never

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

### -LocalLanaccess
Set local LAN access.
If split tunneling is OFF, and you set local LAN access to ON, the local client can route traffic to its local interface.
When the local area network switch is specified, this combination of switches is useful.
The client can allow local LAN access to devices that commonly have non-routable addresses, such as local printers or local file servers.
Default value: OFF Possible values = ON, OFF, FORCED

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

### -LoginScript
Path to the logon script that is run when a session is established.
Separate multiple scripts by using comma.
A "$" in the path signifies that the word following the "$" is an environment variable.
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

### -Logoutscript
Path to the logout script.
Separate multiple scripts by using comma.
A "$" in the path signifies that the word following the "$" is an environment variable.
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

### -Macpluginupgrade
Option to set plugin upgrade behaviour for Mac.
Default value: Always Possible values = Always, Essential, Never

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

### -MaxIipperUser
Maximum number of Intranet IP that can be assigned to a user from AAA group, VPN vserver or VPN global pool.
This setting is not applicable for AAA user level Intranet IP configuration.
Default value: 1 Minimum value = 1 Maximum value = 10

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

### -MdxtokenTimeout
Validity of MDX Token in minutes.
This token is used for mdx services to access backend and valid HEAD and GET request.
Default value: 10 Minimum value = 1 Maximum value = 1440

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

### -NetMask
The netmask for the spoofed ip address.
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

### -Ntdomain
Single sign-on domain to use for single sign-on to applications in the internal network.
This setting can be overwritten by the domain that users specify at the time of logon or by the domain that the authentication server returns.
Minimum length = 1 Maximum length = 32

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

### -PCoIPProfileName
Name of the PCOIP profile.
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

### -Proxy
Set options to apply proxy for accessing the internal resources.
Available settings function as follows: * BROWSER - Proxy settings are configured only in Internet Explorer and Firefox browsers.
* NS - Proxy settings are configured on the Citrix ADC.
* OFF - Proxy settings are not configured.
Possible values = BROWSER, NS, OFF

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

### -ProxyException
Proxy exception string that will be configured in the browser for bypassing the previously configured proxies.
Allowed only if proxy type is Browser.
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

### -ProxyLocalBypass
Bypass proxy server for local addresses option in Internet Explorer and Firefox proxy server settings.
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

### -RDPClientProfileName
Name of the RDP profile associated with the vserver.
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

### -Rfc1918
As defined in the local area network, allow only the following local area network addresses to bypass the VPN tunnel when the local LAN access feature is enabled: * 10.*.*.*, * 172.16.*.*, * 192.168.*.*.
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

### -Securebrowse
Allow users to connect through Citrix Gateway to network resources from iOS and Android mobile devices with Citrix Receiver.
Users do not need to establish a full VPN tunnel to access resources in the secure network.
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

### -Secureprivateaccess
Enables or disables the secure private access configuration.
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

### -SecureprivateaccessProfile
Clears Secure Private Access profile that may be set.

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

### -SessTimeout
Number of minutes after which the session times out.
Default value: 30 Minimum value = 1 Maximum value = 65535

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

### -SmartGroup
This is the default group that is chosen when the authentication succeeds in addition to extracted groups.
Minimum length = 1 Maximum length = 64

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

### -SocksProxy
IP address of the proxy server to be used for SOCKS access for all subsequent connections to the internal network.
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

### -SplitDNS
Route the DNS requests to the local DNS server configured on the user device, or Citrix Gateway (remote), or both.
Possible values = LOCAL, REMOTE, BOTH

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

### -Splittunnel
Send, through the tunnel, traffic only for intranet applications that are defined in Citrix Gateway.
Route all other traffic directly to the Internet.
The OFF setting routes all traffic through Citrix Gateway.
With the REVERSE setting, intranet applications define the network traffic that is not intercepted.
All network traffic directed to internal IP addresses bypasses the VPN tunnel, while other traffic goes through Citrix Gateway.
Reverse split tunneling can be used to log all non-local LAN traffic.
For example, if users have a home network and are logged on through the Citrix Gateway Plug-in, network traffic destined to a printer or another device within the home network is not intercepted.
Default value: OFF Possible values = ON, OFF, REVERSE

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

### -Spoofiip
Indicate whether or not the application requires IP spoofing, which routes the connection to the intranet application through the virtual adapter.
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

### -SSLProxy
IP address of the proxy server to be used for SSL access for all subsequent connections to the internal network.
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

### -SSO
Set single sign-on (SSO) for the session.
When the user accesses a server, the user's logon credentials are passed to the server for authentication.
NOTE : This configuration does not honor the following authentication types for security reason.
BASIC, DIGEST, and NTLM (without Negotiate NTLM2 Key or Negotiate Sign Flag).
Use VPN TrafficAction to configure SSO for these authentication types.
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

### -SSOCredential
Specify whether to use the primary or secondary authentication credentials for single sign-on to the server.
Default value: PRIMARY Possible values = PRIMARY, SECONDARY

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

### -StorefrontURL
Web address for StoreFront to be used in this session for enumeration of resources from XenApp or XenDesktop.
Minimum length = 1 Maximum length = 255

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

### -Transparentinterception
Allow access to network resources by using a single IP address and subnet mask or a range of IP addresses.
The OFF setting sets the mode to proxy, in which you configure destination and source IP addresses and port numbers.
If you are using the Citrix Gateway Plug-in for Windows, set this parameter to ON, in which the mode is set to transparent.
If you are using the Citrix Gateway Plug-in for Java, set this parameter to OFF.
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

### -Uitheme
Set VPN UI Theme to Green-Bubble, Caxton or Custom; default is Caxton.
Possible values = DEFAULT, GREENBUBBLE, CUSTOM

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

### -Useiip
Define IP address pool options.
Available settings function as follows: * SPILLOVER - When an address pool is configured and the mapped IP is used as an intranet IP address, the mapped IP address is used when an intranet IP address cannot be assigned.
* NOSPILLOVER - When intranet IP addresses are enabled and the mapped IP address is not used, the Transfer Login page appears for users who have used all available intranet IP addresses.
* OFF - Address pool is not configured.
Default value: NOSPILLOVER Possible values = NOSPILLOVER, SPILLOVER, OFF

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

### -Usemip
Enable or disable the use of a unique IP address alias, or a mapped IP address, as the client IP address for each client session.
Allow Citrix Gateway to use the mapped IP address as an intranet IP address when all other IP addresses are not available.
When IP pooling is configured and the mapped IP is used as an intranet IP address, the mapped IP address is used when an intranet IP address cannot be assigned.
Default value: NS Possible values = NS, OFF

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

### -Wihome
Web address of the Web Interface server, such as http://\<ipAddress\>/Citrix/XenApp, or Receiver for Web, which enumerates the virtualized resources, such as XenApp, XenDesktop, and cloud applications.
This web address is used as the home page in ICA proxy mode.
If Client Choices is ON, you must configure this setting.
Because the user can choose between FullClient and ICAProxy, the user may see a different home page.
An Internet web site may appear if the user gets the FullClient option, or a Web Interface site if the user gets the ICAProxy option.
If the setting is not configured, the XenApp option does not appear as a client choice.

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

### -Windowsautologon
Enable or disable the Windows Auto Logon for the session.
If a VPN session is established after this setting is enabled, the user is automatically logged on by using Windows credentials after the system is restarted.
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

### -WindowsClientType
The Windows client type.
Choose between two types of Windows Client\ a) Application Agent - which always runs in the task bar as a standalone application and also has a supporting service which runs permanently when installed\ b) Activex Control - ActiveX control run by Microsoft Internet Explorer.
Default value: AGENT Possible values = AGENT, PLUGIN

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

### -Windowspluginupgrade
Option to set plugin upgrade behaviour for Win.
Default value: Always Possible values = Always, Essential, Never

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

### -WinSIP
WINS server IP address to add to Citrix Gateway for name resolution.
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

### -WiPortAlMode
Layout on the Access Interface.
The COMPACT value indicates the use of small icons.
Possible values = NORMAL, COMPACT

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
Position: 1
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

