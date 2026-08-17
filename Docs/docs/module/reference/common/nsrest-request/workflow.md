---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nsrest-request/workflow/
schema: 2.0.0
---

# Invoke-NSRestRequest

## SYNOPSIS
Sends a NITRO REST request through the current NetScaler session.

## SYNTAX

### ByResource (Default)
```
Invoke-NSRestRequest [-Session <PSObject>] [-Method <String>] [-Operation <String>] -Task <String>
 -Type <String> [-Resource <String>] [-Action <String>] [-Query <Hashtable>] [-Payload <Hashtable>]
 [-RawResponse] [-Headers <Hashtable>] [-IgnoreNotFound] [-NotFoundErrorCode <Int32[]>] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-NitroWarning <String>] [-NitroOnError <String>] [-RetryCount <Int32>]
 [-RetryDelaySeconds <Int32>] [-RetryStatusCode <Int32[]>] [-RetryUnsafeMethods] [<CommonParameters>]
```

### ByPath
```
Invoke-NSRestRequest [-Session <PSObject>] [-Method <String>] [-Operation <String>] -NitroPath <String>
 [-Action <String>] [-Query <Hashtable>] [-Payload <Hashtable>] [-RawResponse] [-Headers <Hashtable>]
 [-IgnoreNotFound] [-NotFoundErrorCode <Int32[]>] [-ReturnNullOnNotFound] [-ThrowOnWarning]
 [-NitroWarning <String>] [-NitroOnError <String>] [-RetryCount <Int32>] [-RetryDelaySeconds <Int32>]
 [-RetryStatusCode <Int32[]>] [-RetryUnsafeMethods] [<CommonParameters>]
```

## DESCRIPTION
Low level access to the NetScaler NITRO API for operations the generated
configuration and statistics functions do not cover.
The request target is given
either as a resource (-Task, -Type and optionally -Resource) or as a full NITRO
path (-NitroPath).

Responses are unwrapped to the resource collection by default.
Use -RawResponse
to get the complete NITRO response including the errorcode and message fields.

Not-found responses can be turned into an empty result or null instead of an
error, and failed requests can be retried for transient HTTP status codes.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSRestRequest -Task config -Type lbvserver
```

Returns all load balancing vServers.

### EXAMPLE 2
```
Invoke-NSRestRequest -Task config -Type lbvserver -Resource lb_web -IgnoreNotFound
```

Returns one vServer, or an empty result when it does not exist.

### EXAMPLE 3
```
Invoke-NSRestRequest -Task config -Type sslcertkey -Operation ADD -Payload @{ sslcertkey = @{ certkey = 'web-cert'; cert = 'web.cer'; key = 'web.key' } }
```

Creates a certkey from files already present on the appliance.

### EXAMPLE 4
```
Invoke-NSRestRequest -NitroPath 'nitro/v1/config/nsversion' -RawResponse
```

Calls an endpoint by path and returns the full NITRO response.

## PARAMETERS

### -Session
NetScaler session to use.
Defaults to the active session from Get-NSSession.

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

### -Method
HTTP method: GET, POST, PUT or DELETE.
Derived from the operation when omitted.

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

### -Operation
NITRO operation such as ADD, UPDATE, DELETE, ENABLE or GET.
Determines the method
and payload shape when those are not given explicitly.

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

### -NitroPath
Full NITRO path to call, for example 'nitro/v1/config/lbvserver'.
Use this
instead of Task and Type for endpoints that do not follow the resource layout.

```yaml
Type: String
Parameter Sets: ByPath
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Task
NITRO area to address: 'config' for configuration or 'stat' for statistics.

```yaml
Type: String
Parameter Sets: ByResource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
NITRO resource type, for example lbvserver, sslcertkey or service.

```yaml
Type: String
Parameter Sets: ByResource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Resource
Name of a specific resource instance.
Omit to address the whole collection.

```yaml
Type: String
Parameter Sets: ByResource
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Action
NITRO action appended to the request, for example 'enable' or 'update'.

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

### -Query
Hashtable of NITRO query arguments such as filter, args or attrs.

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

### -Payload
Hashtable sent as the request body for operations that need one.

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

### -RawResponse
Returns the complete NITRO response instead of only the resource collection.

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

### -Headers
Additional HTTP headers merged into the request.

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

### -IgnoreNotFound
Treats not-found responses as success and returns an empty result.

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

### -NotFoundErrorCode
NITRO error codes treated as not-found.
Defaults to the common no-such-resource
codes.

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @(258, 344, 373, 538, 1540, 3441)
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReturnNullOnNotFound
Returns null instead of an empty collection when the resource is not found.
Requires IgnoreNotFound.

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
Turns NITRO warnings into terminating errors.

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

### -NitroWarning
Sets the NITRO warning header to 'yes' or 'no'.

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

### -NitroOnError
NITRO behavior when part of a bulk request fails: EXIT, CONTINUE or ROLLBACK.

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

### -RetryCount
Number of times a failed request is retried.
Default is 0.

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

### -RetryDelaySeconds
Seconds to wait between retries.
Default is 1.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -RetryStatusCode
HTTP status codes that trigger a retry.
Defaults to 429 and the 5xx codes that
usually indicate a busy appliance.

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @(429, 500, 502, 503, 504)
Accept pipeline input: False
Accept wildcard characters: False
```

### -RetryUnsafeMethods
Also retries POST, PUT and DELETE.
By default only GET is retried, because
repeating a write may not be safe.

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

## NOTES

## RELATED LINKS

[https://netscalertoolkit.j81.nl/module/reference/common/nsrest-request/workflow/](https://netscalertoolkit.j81.nl/module/reference/common/nsrest-request/workflow/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


