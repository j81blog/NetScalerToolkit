---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSGetIP

## SYNOPSIS
Gets NetScaler nsip configuration.

## SYNTAX

### All (Default)
```
Invoke-NSGetIP [-Filter <Hashtable>] [-ViewSummary] [-Ipaddress <String>] [-TrafficDomain <Int32>]
 [-Type <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [<CommonParameters>]
```

### Count
```
Invoke-NSGetIP [-Count] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for ip resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSGetIP
```

### EXAMPLE 2
```
Invoke-NSGetIP -Filter @{ servicetype = 'HTTP' }
```

## PARAMETERS

### -Filter
{{ Fill Filter Description }}

```yaml
Type: Hashtable
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ViewSummary
Requests the NITRO summary view.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ipaddress
IPv4 address to create on the Citrix ADC.
Cannot be changed after the IP address is created.
Minimum length = 1

```yaml
Type: String
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrafficDomain
Integer value that uniquely identifies the traffic domain in which you want to configure the entity.
If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0.
TD id 4095 is used reserved for LSN use .
Minimum value = 0 Maximum value = 4095

```yaml
Type: Int32
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Type of the IP address to create on the Citrix ADC.
Cannot be changed after the IP address is created.
The following are the different types of Citrix ADC owned IP addresses: * A Subnet IP (SNIP) address is used by the Citrix ADC to communicate with the servers.
The Citrix ADC also uses the subnet IP address when generating its own packets, such as packets related to dynamic routing protocols, or to send monitor probes to check the health of the servers.
* A Virtual IP (VIP) address is the IP address associated with a virtual server.
It is the IP address to which clients connect.
An appliance managing a wide range of traffic may have many VIPs configured.
Some of the attributes of the VIP address are customized to meet the requirements of the virtual server.
* A GSLB site IP (GSLBIP) address is associated with a GSLB site.
It is not mandatory to specify a GSLBIP address when you initially configure the Citrix ADC.
A GSLBIP address is used only when you create a GSLB site.
* A Cluster IP (CLIP) address is the management address of the cluster.
All cluster configurations must be performed by accessing the cluster through this IP address.
Default value: SNIP Possible values = SNIP, VIP, NSIP, HostIP, GSLBsiteIP, CLIP

```yaml
Type: String
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
Returns only the number of matching resources.

```yaml
Type: SwitchParameter
Parameter Sets: Count
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

