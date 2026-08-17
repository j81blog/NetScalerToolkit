---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteBotProfileIpreputationBinding

## SYNOPSIS
Removes a NetScaler botprofile_ipreputation_binding resource.

## SYNTAX

```
Invoke-NSDeleteBotProfileIpreputationBinding [-Name] <String> [-BotIpreputation <Boolean>] [-Category <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the ipreputation that can be bound to botprofile.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteBotProfileIpreputationBinding -Name 'example' -Category IP -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetBotProfileIpreputationBinding -Name 'botprofile_ipreputation_binding_example' | Invoke-NSDeleteBotProfileIpreputationBinding -Confirm:$false
```

## PARAMETERS

### -Name
Name for the profile.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters.
Cannot be changed after the profile is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile').
Minimum length = 1 Maximum length = 31

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

### -BotIpreputation
IP reputation binding.
For each category, only one binding is allowed.
To update the values of an existing binding, user has to first unbind that binding, and then needs to bind again with the new values.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
IP Repuation category.
Following IP Reuputation categories are allowed: *IP_BASED - This category checks whether client IP is malicious or not.
*BOTNET - This category includes Botnet C&C channels, and infected zombie machines controlled by Bot master.
*SPAM_SOURCES - This category includes tunneling spam messages through a proxy, anomalous SMTP activities, and forum spam activities.
*SCANNERS - This category includes all reconnaissance such as probes, host scan, domain scan, and password brute force attack.
*DOS - This category includes DOS, DDOS, anomalous sync flood, and anomalous traffic detection.
*REPUTATION - This category denies access from IP addresses currently known to be infected with malware.
This category also includes IPs with average low Webroot Reputation Index score.
Enabling this category will prevent access from sources identified to contact malware distribution points.
*PHISHING - This category includes IP addresses hosting phishing sites and other kinds of fraud activities such as ad click fraud or gaming fraud.
*PROXY - This category includes IP addresses providing proxy services.
*NETWORK - IPs providing proxy and anonymization services including The Onion Router aka TOR or darknet.
*MOBILE_THREATS - This category checks client IP with the list of IPs harmful for mobile devices.
*WINDOWS_EXPLOITS - This category includes active IP address offering or distributig malware, shell code, rootkits, worms or viruses.
*WEB_ATTACKS - This category includes cross site scripting, iFrame injection, SQL injection, cross domain injection or domain password brute force attack.
*TOR_PROXY - This category includes IP address acting as exit nodes for the Tor Network.
*CLOUD - This category checks client IP with list of public cloud IPs.
*CLOUD_AWS - This category checks client IP with list of public cloud IPs from Amazon Web Services.
*CLOUD_GCP - This category checks client IP with list of public cloud IPs from Google Cloud Platform.
*CLOUD_AZURE - This category checks client IP with list of public cloud IPs from Azure.
*CLOUD_ORACLE - This category checks client IP with list of public cloud IPs from Oracle.
*CLOUD_IBM - This category checks client IP with list of public cloud IPs from IBM.
*CLOUD_SALESFORCE - This category checks client IP with list of public cloud IPs from Salesforce.
Possible values = IP, BOTNETS, SPAM_SOURCES, SCANNERS, DOS, REPUTATION, PHISHING, PROXY, NETWORK, MOBILE_THREATS, WINDOWS_EXPLOITS, WEB_ATTACKS, TOR_PROXY, CLOUD, CLOUD_AWS, CLOUD_GCP, CLOUD_AZURE, CLOUD_ORACLE, CLOUD_IBM, CLOUD_SALESFORCE

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

