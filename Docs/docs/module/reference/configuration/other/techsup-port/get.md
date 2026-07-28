---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSGetTechsupPort

## SYNOPSIS
Gets NetScaler techsupport configuration.

## SYNTAX

```
Invoke-NSGetTechsupPort [-Filter <Hashtable>] [-ViewSummary] [-Scope <String>] [-PartitionName <String>]
 [-Upload] [-Proxy <String>] [-Casenumber <String>] [-File <String>] [-Description <String>]
 [-Authtoken <String>] [-Time <String>] [-Adss] [-Notruncate] [-Nopecore] [-Nodes <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

## DESCRIPTION
Configuration for tech support resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSGetTechsupPort
```

### EXAMPLE 2
```
Invoke-NSGetTechsupPort -Filter @{ servicetype = 'HTTP' }
```

## PARAMETERS

### -Filter
{{ Fill Filter Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
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
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Use this option to gather data on the present node, all cluster nodes, or for the specified partitions.
The CLUSTER scope generates smaller abbreviated archives for all nodes.
The PARTITION scope collects the admin partition in addition to those specified.
The partitionName option is only required for the PARTITION scope.
Default value: NODE Possible values = NODE, CLUSTER, PARTITION

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

### -PartitionName
Name of the partition.
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

### -Upload
Securely upload the collector archive to Citrix Technical Support using SSL.
MyCitrix credentials will be required.
If used with the -file option, no new collector archive is generated.
Instead, the specified archive is uploaded.
Note that the upload operation time depends on the size of the archive file, and the connection bandwidth.

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
Specifies the proxy server to be used when uploading a collector archive.
Use this parameter if the Citrix ADC does not have direct internet connectivity.
The basic format of the proxy string is: "proxy_IP:\<proxy_port\>" (without quotes).
If the proxy requires authentication the format is: "username:password@proxy_IP:\<proxy_port\>".

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

### -Casenumber
Specifies the associated case or service request number if it has already been opened with Citrix Technical Support.

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

### -File
Specifies the name (with full path) of the collector archive file to be uploaded.
If this is specified, no new collector archive is generated.

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

### -Description
Provides a text description for the the upload, and can be used for logging purposes.

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

### -Authtoken
Specifies the Authentication Token, which is used to login to Citrix upload server.
Please copy/paste the URL https://cis.citrix.com/auth/api/create_identity_v2/?expiration=3600 in a browser to complete the two factor authentication and generate it.
The token is valid for 3600 seconds (1 hour).

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

### -Time
Specifies the time in common log format, ie.
DD/MMM/YYYY:HH:MM:SS, to be used for locating the newnslog file.
With this option at most four newnslog log files are collected.
First is the newnslog file, spanning the given time.
Second is the one, created just prior to the first (if it exists).
Third is the one, created just later than the first (if it exists).
And the fourth is the latest newnslog directory.
In case, the scope is cluster, then second and third type is skipped on all nodes.
Minimum length = 20 Maximum length = 20

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

### -Adss
Option for collecting showtechsupport bundle on ADSS cluster/node.

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

### -Notruncate
Option for collecting showtechsupport bundle without truncating log files.

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

### -Nopecore
Option for collecting showtechsupport bundle without PE core files.

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

### -Nodes
Use this option to collect showtechsupport bundle only from the nodes given as a list to this option.
If -file option is used, it will collect the files from the given nodes back to the cco and will upload the compressed folder containing the files from there.
Minimum value = 0 Maximum value = 255

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

