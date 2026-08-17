---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdatePolicyHTTPCallout

## SYNOPSIS
Updates a NetScaler policyhttpcallout resource.

## SYNTAX

```
Invoke-NSUpdatePolicyHTTPCallout [-Bodyexpr <String>] [-Cacheforsecs <Int32>] [-Comment <String>]
 [-Fullreqexpr <String>] [-HeaderS <String[]>] [-HostExpr <String>] [-HTTPMethod <String>]
 [-Ipaddress <String>] [-Name] <String> [-Parameters <String[]>] [-Port <Int32>] [-Resultexpr <String>]
 [-ReturnType <String>] [-Scheme <String>] [-URLStemexpr <String>] [-VServer <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for HTTP callout resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdatePolicyHTTPCallout -Name 'example' -Comment 'Updated by automation' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdatePolicyHTTPCallout -Name 'example' -Comment 'Updated by automation' -WhatIf
```

## PARAMETERS

### -Bodyexpr
An advanced string expression for generating the body of the request.
The expression can contain a literal string or an expression that derives the value (for example, client.ip.src).
Mutually exclusive with -fullReqExpr.
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

### -Cacheforsecs
Duration, in seconds, for which the callout response is cached.
The cached responses are stored in an integrated caching content group named "calloutContentGroup".
If no duration is configured, the callout responses will not be cached unless normal caching configuration is used to cache them.
This parameter takes precedence over any normal caching configuration that would otherwise apply to these responses.
Note that the calloutContentGroup definition may not be modified or removed nor may it be used with other cache policies.
Minimum value = 1 Maximum value = 31536000

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

### -Comment
Any comments to preserve information about this HTTP callout.

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

### -Fullreqexpr
Exact HTTP request, in the form of an expression, which the Citrix ADC sends to the callout agent.
If you set this parameter, you must not include HTTP method, host expression, URL stem expression, headers, or parameters.
The request expression is constrained by the feature for which the callout is used.
For example, an HTTP.RES expression cannot be used in a request-time policy bank or in a TCP content switching policy bank.
The Citrix ADC does not check the validity of this request.
You must manually validate the request.
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

### -HeaderS
One or more headers to insert into the HTTP request.
Each header is specified as "name(expr)", where expr is an expression that is evaluated at runtime to provide the value for the named header.
You can configure a maximum of eight headers for an HTTP callout.
Mutually exclusive with the full HTTP request expression.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HostExpr
String expression to configure the Host header.
Can contain a literal value (for example, 10.101.10.11) or a derived value (for example, http.req.header("Host")).
The literal value can be an IP address or a fully qualified domain name.
Mutually exclusive with the full HTTP request expression.
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

### -HTTPMethod
Method used in the HTTP request that this callout sends.
Mutually exclusive with the full HTTP request expression.
Possible values = GET, POST

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

### -Ipaddress
IP Address of the server (callout agent) to which the callout is sent.
Can be an IPv4 or IPv6 address.
Mutually exclusive with the Virtual Server parameter.
Therefore, you cannot set the \<IP Address, Port\> and the Virtual Server in the same HTTP callout.

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
Name for the HTTP callout.
Not case sensitive.
Must begin with an ASCII letter or underscore (_) character, and must consist only of ASCII alphanumeric or underscore characters.
Must not begin with 're' or 'xp' or be a word reserved for use as an expression qualifier prefix (such as HTTP) or enumeration value (such as ASCII).
Must not be the name of an existing named expression, pattern set, dataset, stringmap, or HTTP callout.
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

### -Parameters
One or more query parameters to insert into the HTTP request URL (for a GET request) or into the request body (for a POST request).
Each parameter is specified as "name(expr)", where expr is an expression that is evaluated at run time to provide the value for the named parameter (name=value).
The parameter values are URL encoded.
Mutually exclusive with the full HTTP request expression.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
Server port to which the HTTP callout agent is mapped.
Mutually exclusive with the Virtual Server parameter.
Therefore, you cannot set the \<IP Address, Port\> and the Virtual Server in the same HTTP callout.
Minimum value = 1

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

### -Resultexpr
Expression that extracts the callout results from the response sent by the HTTP callout agent.
Must be a response based expression, that is, it must begin with HTTP.RES.
The operations in this expression must match the return type.
For example, if you configure a return type of TEXT, the result expression must be a text based expression.
If the return type is NUM, the result expression (resultExpr) must return a numeric value, as in the following example: http.res.body(10000).length.
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

### -ReturnType
Type of data that the target callout agent returns in response to the callout.
Available settings function as follows: * TEXT - Treat the returned value as a text string.
* NUM - Treat the returned value as a number.
* BOOL - Treat the returned value as a Boolean value.
Note: You cannot change the return type after it is set.
Possible values = BOOL, NUM, TEXT

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

### -Scheme
Type of scheme for the callout server.
Possible values = http, https

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

### -URLStemexpr
String expression for generating the URL stem.
Can contain a literal string (for example, "/mysite/index.html") or an expression that derives the value (for example, http.req.url).
Mutually exclusive with the full HTTP request expression.
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

### -VServer
Name of the load balancing, content switching, or cache redirection virtual server (the callout agent) to which the HTTP callout is sent.
The service type of the virtual server must be HTTP.
Mutually exclusive with the IP address and port parameters.
Therefore, you cannot set the \<IP Address, Port\> and the Virtual Server in the same HTTP callout.
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

