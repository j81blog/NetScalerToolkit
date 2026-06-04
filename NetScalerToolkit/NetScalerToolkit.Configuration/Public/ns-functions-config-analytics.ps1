# Generated NetScalerToolkit Configuration bundle for category 'analytics'.

# region Invoke-NSAddAnalyticsGlobalAnalyticsProfileBinding
function Invoke-NSAddAnalyticsGlobalAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler analyticsglobal_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to analyticsglobal.
    .PARAMETER AnalyticsProfile
        Name of the analytics profile bound.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAnalyticsGlobalAnalyticsProfileBinding -AnalyticsProfile 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAnalyticsGlobalAnalyticsProfileBinding -AnalyticsProfile 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string] $AnalyticsProfile,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AnalyticsProfile')) { $properties['analyticsprofile'] = $AnalyticsProfile }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('analyticsglobal_analyticsprofile_binding', 'Create analyticsglobal_analyticsprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type analyticsglobal_analyticsprofile_binding -Payload @{ analyticsglobal_analyticsprofile_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddAnalyticsGlobalAnalyticsProfileBinding

# region Invoke-NSAddAnalyticsProfile
function Invoke-NSAddAnalyticsProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler analyticsprofile resource.
    .DESCRIPTION
        Configuration for Analytics profile resource.
    .PARAMETER AllHTTPHeaderS
        On enabling this option, the Citrix ADC will log all the request and response headers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER AnalyticsAuthtoken
        Token for authenticating with the endpoint. If the endpoint requires the Authorization header in a particular format, specify the complete format as the value to this parameter. For eg., in case of splunk, the Authorizaiton header is required to be of the form - Splunk <auth-token>. Maximum length = 256
    .PARAMETER AnalyticsEndpointContentType
        By default, application/json content-type is used. If this needs to be overridden, specify the value. Maximum length = 128
    .PARAMETER AnalyticsEndpointmetaData
        If the endpoint requires some metadata to be present before the actual json data, specify the same. Maximum length = 128
    .PARAMETER AnalyticsEndpointURL
        The URL at which to upload the analytics data on the endpoint. Maximum length = 256
    .PARAMETER AuditLogs
        This option indicates the whether auditlog should be sent to the REST collector. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Collectors
        The collector can be an IP, an appflow collector name, a service or a vserver. If IP is specified, the transport is considered as logstream and default port of 5557 is taken. If collector name is specified, the collector properties are taken from the configured collector. If service is specified, the configured service is assumed as the collector. If vserver is specified, the services bound to it are considered as collectors and the records are load balanced. Minimum length = 1
    .PARAMETER CqarePortIng
        On enabling this option, the Citrix ADC will log TCP CQA parameters. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DataFormAtFile
        This option is for configuring the file containing the data format and metadata required by the analytics endpoint. Maximum length = 64
    .PARAMETER Events
        This option indicates the whether events should be sent to the REST collector. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GrpcStatus
        On enabling this option, the Citrix ADC will log the gRPC status headers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPAuthentication
        On enabling this option, the Citrix ADC will log Authentication header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPClientsIdemeasurements
        On enabling this option, the Citrix ADC will insert a javascript into the HTTP response to collect the client side page-timings and will send the same to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPContentType
        On enabling this option, the Citrix ADC will log content-length header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPCookie
        On enabling this option, the Citrix ADC will log cookie header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPCustomHeaderS
        Specify the list of custom headers to be exported in web transaction records. Minimum length = 1
    .PARAMETER HTTPDomainName
        On enabling this option, the Citrix ADC will log domain name. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPHost
        On enabling this option, the Citrix ADC will log the Host header in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPLocation
        On enabling this option, the Citrix ADC will log location header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPMethod
        On enabling this option, the Citrix ADC will log the method header in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPPageTracking
        On enabling this option, the Citrix ADC will link the embedded objects of a page together. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPReferer
        On enabling this option, the Citrix ADC will log the referer header in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie
        On enabling this option, the Citrix ADC will log set-cookie header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie2
        On enabling this option, the Citrix ADC will log set-cookie2 header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPURL
        On enabling this option, the Citrix ADC will log the URL in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPURLQuery
        On enabling this option, the Citrix ADC will log URL Query. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPUserAgent
        On enabling this option, the Citrix ADC will log User-Agent header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPVia
        On enabling this option, the Citrix ADC will Via header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPXforwardedforHeader
        On enabling this option, the Citrix ADC will log X-Forwarded-For header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Integratedcache
        On enabling this option, the Citrix ADC will log the Integrated Caching appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Managementlog
        This option indicates the whether managementlog should be sent to the REST collector. Default value: DEFAULT_MANAGEMENTLOG Possible values = ALL, SHELL, ACCESS, NSMGMT, NONE
    .PARAMETER Metrics
        This option indicates the whether metrics should be sent to the REST collector. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER MetricsexPortFrequency
        This option is for configuring the metrics export frequency in seconds, frequency value must be in [30,300] seconds range. Default value: 30 Minimum value = 30 Maximum value = 300
    .PARAMETER Name
        Name for the analytics profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow profile" or 'my appflow profile'). Minimum length = 1 Maximum length = 127
    .PARAMETER OutputMode
        This option indicates the format of REST API POST body. It depends on the consumer of the analytics data. Default value: avro, Possible values = avro, prometheus, influx, json
    .PARAMETER SchemaFile
        This option is for configuring json schema file containing a list of counters to be exported by metricscollector. Maximum length = 64
    .PARAMETER ServeMode
        This option is for setting the mode of how data is provided. Default value: Push Possible values = Push, Pull
    .PARAMETER TCPBurstrePortIng
        On enabling this option, the Citrix ADC will log TCP burst parameters. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Topn
        On enabling this topn support, the topn information of the stream identifier this profile is bound to will be exported to the analytics endpoint. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Type
        This option indicates what information needs to be collected and exported. Possible values = global, webinsight, tcpinsight, securityinsight, videoinsight, hdxinsight, gatewayinsight, timeseries, lsninsight, botinsight, CIinsight, udpinsight, ngsinsight, streaminsight
    .PARAMETER URLCategory
        On enabling this option, the Citrix ADC will send the URL category record. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddAnalyticsProfile -Name 'example' -Type 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAnalyticsProfile -Name 'example' -Type 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AllHTTPHeaderS,

        [Parameter()]
        [string] $AnalyticsAuthtoken,

        [Parameter()]
        [string] $AnalyticsEndpointContentType,

        [Parameter()]
        [string] $AnalyticsEndpointmetaData,

        [Parameter()]
        [string] $AnalyticsEndpointURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AuditLogs,

        [Parameter()]
        [string] $Collectors,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $CqarePortIng,

        [Parameter()]
        [string] $DataFormAtFile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Events,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $GrpcStatus,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPAuthentication,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPClientsIdemeasurements,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPContentType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPCookie,

        [Parameter()]
        [string[]] $HTTPCustomHeaderS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPDomainName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPHost,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPLocation,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPPageTracking,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPReferer,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPSEtCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPSEtCookie2,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPURLQuery,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPUserAgent,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPVia,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $HTTPXforwardedforHeader,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Integratedcache,

        [Parameter()]
        [string[]] $Managementlog,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Metrics,

        [Parameter()]
        [int] $MetricsexPortFrequency,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $OutputMode,

        [Parameter()]
        [string] $SchemaFile,

        [Parameter()]
        [ValidateSet('Push', 'Pull')]
        [string] $ServeMode,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $TCPBurstrePortIng,

        [Parameter()]
        [string] $Topn,

        [Parameter(Mandatory)]
        [string] $Type,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLCategory,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    if ($PSBoundParameters.ContainsKey('Managementlog')) {
        Assert-NSParameterValue -ParameterName 'Managementlog' -Value $Managementlog -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'SHELL', 'ACCESS', 'NSMGMT', 'NONE') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('OutputMode')) {
        Assert-NSParameterValue -ParameterName 'OutputMode' -Value $OutputMode -AllowedValuesByVersion @{ '13.1' = @('avro', 'prometheus', 'influx'); '14.1' = @('avro', 'prometheus', 'influx', 'json') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Topn')) {
        Assert-NSParameterValue -ParameterName 'Topn' -Value $Topn -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('Type')) {
        Assert-NSParameterValue -ParameterName 'Type' -Value $Type -AllowedValuesByVersion @{ '13.1' = @('global', 'webinsight', 'tcpinsight', 'securityinsight', 'videoinsight', 'hdxinsight', 'gatewayinsight', 'timeseries', 'lsninsight', 'botinsight', 'CIinsight', 'udpinsight'); '14.1' = @('global', 'webinsight', 'tcpinsight', 'securityinsight', 'videoinsight', 'hdxinsight', 'gatewayinsight', 'timeseries', 'lsninsight', 'botinsight', 'CIinsight', 'udpinsight', 'ngsinsight', 'streaminsight') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AllHTTPHeaderS')) { $properties['allhttpheaders'] = $AllHTTPHeaderS }
    if ($PSBoundParameters.ContainsKey('AnalyticsAuthtoken')) { $properties['analyticsauthtoken'] = $AnalyticsAuthtoken }
    if ($PSBoundParameters.ContainsKey('AnalyticsEndpointContentType')) { $properties['analyticsendpointcontenttype'] = $AnalyticsEndpointContentType }
    if ($PSBoundParameters.ContainsKey('AnalyticsEndpointmetaData')) { $properties['analyticsendpointmetadata'] = $AnalyticsEndpointmetaData }
    if ($PSBoundParameters.ContainsKey('AnalyticsEndpointURL')) { $properties['analyticsendpointurl'] = $AnalyticsEndpointURL }
    if ($PSBoundParameters.ContainsKey('AuditLogs')) { $properties['auditlogs'] = $AuditLogs }
    if ($PSBoundParameters.ContainsKey('Collectors')) { $properties['collectors'] = $Collectors }
    if ($PSBoundParameters.ContainsKey('CqarePortIng')) { $properties['cqareporting'] = $CqarePortIng }
    if ($PSBoundParameters.ContainsKey('DataFormAtFile')) { $properties['dataformatfile'] = $DataFormAtFile }
    if ($PSBoundParameters.ContainsKey('Events')) { $properties['events'] = $Events }
    if ($PSBoundParameters.ContainsKey('GrpcStatus')) { $properties['grpcstatus'] = $GrpcStatus }
    if ($PSBoundParameters.ContainsKey('HTTPAuthentication')) { $properties['httpauthentication'] = $HTTPAuthentication }
    if ($PSBoundParameters.ContainsKey('HTTPClientsIdemeasurements')) { $properties['httpclientsidemeasurements'] = $HTTPClientsIdemeasurements }
    if ($PSBoundParameters.ContainsKey('HTTPContentType')) { $properties['httpcontenttype'] = $HTTPContentType }
    if ($PSBoundParameters.ContainsKey('HTTPCookie')) { $properties['httpcookie'] = $HTTPCookie }
    if ($PSBoundParameters.ContainsKey('HTTPCustomHeaderS')) { $properties['httpcustomheaders'] = $HTTPCustomHeaderS }
    if ($PSBoundParameters.ContainsKey('HTTPDomainName')) { $properties['httpdomainname'] = $HTTPDomainName }
    if ($PSBoundParameters.ContainsKey('HTTPHost')) { $properties['httphost'] = $HTTPHost }
    if ($PSBoundParameters.ContainsKey('HTTPLocation')) { $properties['httplocation'] = $HTTPLocation }
    if ($PSBoundParameters.ContainsKey('HTTPMethod')) { $properties['httpmethod'] = $HTTPMethod }
    if ($PSBoundParameters.ContainsKey('HTTPPageTracking')) { $properties['httppagetracking'] = $HTTPPageTracking }
    if ($PSBoundParameters.ContainsKey('HTTPReferer')) { $properties['httpreferer'] = $HTTPReferer }
    if ($PSBoundParameters.ContainsKey('HTTPSEtCookie')) { $properties['httpsetcookie'] = $HTTPSEtCookie }
    if ($PSBoundParameters.ContainsKey('HTTPSEtCookie2')) { $properties['httpsetcookie2'] = $HTTPSEtCookie2 }
    if ($PSBoundParameters.ContainsKey('HTTPURL')) { $properties['httpurl'] = $HTTPURL }
    if ($PSBoundParameters.ContainsKey('HTTPURLQuery')) { $properties['httpurlquery'] = $HTTPURLQuery }
    if ($PSBoundParameters.ContainsKey('HTTPUserAgent')) { $properties['httpuseragent'] = $HTTPUserAgent }
    if ($PSBoundParameters.ContainsKey('HTTPVia')) { $properties['httpvia'] = $HTTPVia }
    if ($PSBoundParameters.ContainsKey('HTTPXforwardedforHeader')) { $properties['httpxforwardedforheader'] = $HTTPXforwardedforHeader }
    if ($PSBoundParameters.ContainsKey('Integratedcache')) { $properties['integratedcache'] = $Integratedcache }
    if ($PSBoundParameters.ContainsKey('Managementlog')) { $properties['managementlog'] = $Managementlog }
    if ($PSBoundParameters.ContainsKey('Metrics')) { $properties['metrics'] = $Metrics }
    if ($PSBoundParameters.ContainsKey('MetricsexPortFrequency')) { $properties['metricsexportfrequency'] = $MetricsexPortFrequency }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('OutputMode')) { $properties['outputmode'] = $OutputMode }
    if ($PSBoundParameters.ContainsKey('SchemaFile')) { $properties['schemafile'] = $SchemaFile }
    if ($PSBoundParameters.ContainsKey('ServeMode')) { $properties['servemode'] = $ServeMode }
    if ($PSBoundParameters.ContainsKey('TCPBurstrePortIng')) { $properties['tcpburstreporting'] = $TCPBurstrePortIng }
    if ($PSBoundParameters.ContainsKey('Topn')) { $properties['topn'] = $Topn }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }
    if ($PSBoundParameters.ContainsKey('URLCategory')) { $properties['urlcategory'] = $URLCategory }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create analyticsprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type analyticsprofile -Payload @{ analyticsprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAnalyticsProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAnalyticsProfile

# region Invoke-NSDeleteAnalyticsGlobalAnalyticsProfileBinding
function Invoke-NSDeleteAnalyticsGlobalAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler analyticsglobal_analyticsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to analyticsglobal.
    .PARAMETER AnalyticsProfile
        Name of the analytics profile bound.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAnalyticsGlobalAnalyticsProfileBinding -AnalyticsProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAnalyticsGlobalAnalyticsProfileBinding  | Invoke-NSDeleteAnalyticsGlobalAnalyticsProfileBinding -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory)]
        [string] $AnalyticsProfile,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('AnalyticsProfile')) {
            $argumentParts += 'analyticsprofile:' + $AnalyticsProfile
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('analyticsglobal_analyticsprofile_binding', 'Delete analyticsglobal_analyticsprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type analyticsglobal_analyticsprofile_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAnalyticsGlobalAnalyticsProfileBinding

# region Invoke-NSDeleteAnalyticsProfile
function Invoke-NSDeleteAnalyticsProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler analyticsprofile resource.
    .DESCRIPTION
        Configuration for Analytics profile resource.
    .PARAMETER Name
        Name for the analytics profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow profile" or 'my appflow profile'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAnalyticsProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAnalyticsProfile -Name 'analyticsprofile_example' | Invoke-NSDeleteAnalyticsProfile -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete analyticsprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type analyticsprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAnalyticsProfile

# region Invoke-NSGetAnalyticsGlobalAnalyticsProfileBinding
function Invoke-NSGetAnalyticsGlobalAnalyticsProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler analyticsglobal_analyticsprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the analyticsprofile that can be bound to analyticsglobal.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetAnalyticsGlobalAnalyticsProfileBinding
    .EXAMPLE
        Invoke-NSGetAnalyticsGlobalAnalyticsProfileBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'analyticsglobal_analyticsprofile_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAnalyticsGlobalAnalyticsProfileBinding

# region Invoke-NSGetAnalyticsGlobalBinding
function Invoke-NSGetAnalyticsGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler analyticsglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to analyticsglobal.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetAnalyticsGlobalBinding
    .EXAMPLE
        Invoke-NSGetAnalyticsGlobalBinding -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'analyticsglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAnalyticsGlobalBinding

# region Invoke-NSGetAnalyticsProfile
function Invoke-NSGetAnalyticsProfile {
    <#
    .SYNOPSIS
        Gets NetScaler analyticsprofile configuration.
    .DESCRIPTION
        Configuration for Analytics profile resource.
    .PARAMETER Name
        Name for the analytics profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow profile" or 'my appflow profile'). Minimum length = 1 Maximum length = 127
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetAnalyticsProfile
    .EXAMPLE
        Invoke-NSGetAnalyticsProfile -Name 'analyticsprofile_example'
    .EXAMPLE
        Invoke-NSGetAnalyticsProfile -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'analyticsprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Name
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAnalyticsProfile

# region Invoke-NSUnsetAnalyticsProfile
function Invoke-NSUnsetAnalyticsProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler analyticsprofile resource properties.
    .DESCRIPTION
        Configuration for Analytics profile resource.
    .PARAMETER Name
        Name for the analytics profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow profile" or 'my appflow profile'). Minimum length = 1 Maximum length = 127
    .PARAMETER AllHTTPHeaderS
        On enabling this option, the Citrix ADC will log all the request and response headers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER AnalyticsAuthtoken
        Token for authenticating with the endpoint. If the endpoint requires the Authorization header in a particular format, specify the complete format as the value to this parameter. For eg., in case of splunk, the Authorizaiton header is required to be of the form - Splunk <auth-token>. Maximum length = 256
    .PARAMETER AnalyticsEndpointContentType
        By default, application/json content-type is used. If this needs to be overridden, specify the value. Maximum length = 128
    .PARAMETER AnalyticsEndpointmetaData
        If the endpoint requires some metadata to be present before the actual json data, specify the same. Maximum length = 128
    .PARAMETER AnalyticsEndpointURL
        The URL at which to upload the analytics data on the endpoint. Maximum length = 256
    .PARAMETER AuditLogs
        This option indicates the whether auditlog should be sent to the REST collector. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Collectors
        The collector can be an IP, an appflow collector name, a service or a vserver. If IP is specified, the transport is considered as logstream and default port of 5557 is taken. If collector name is specified, the collector properties are taken from the configured collector. If service is specified, the configured service is assumed as the collector. If vserver is specified, the services bound to it are considered as collectors and the records are load balanced. Minimum length = 1
    .PARAMETER CqarePortIng
        On enabling this option, the Citrix ADC will log TCP CQA parameters. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER DataFormAtFile
        This option is for configuring the file containing the data format and metadata required by the analytics endpoint. Maximum length = 64
    .PARAMETER Events
        This option indicates the whether events should be sent to the REST collector. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GrpcStatus
        On enabling this option, the Citrix ADC will log the gRPC status headers. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPAuthentication
        On enabling this option, the Citrix ADC will log Authentication header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPClientsIdemeasurements
        On enabling this option, the Citrix ADC will insert a javascript into the HTTP response to collect the client side page-timings and will send the same to the configured collectors. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPContentType
        On enabling this option, the Citrix ADC will log content-length header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPCookie
        On enabling this option, the Citrix ADC will log cookie header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPCustomHeaderS
        Specify the list of custom headers to be exported in web transaction records. Minimum length = 1
    .PARAMETER HTTPDomainName
        On enabling this option, the Citrix ADC will log domain name. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPHost
        On enabling this option, the Citrix ADC will log the Host header in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPLocation
        On enabling this option, the Citrix ADC will log location header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPMethod
        On enabling this option, the Citrix ADC will log the method header in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPPageTracking
        On enabling this option, the Citrix ADC will link the embedded objects of a page together. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPReferer
        On enabling this option, the Citrix ADC will log the referer header in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie
        On enabling this option, the Citrix ADC will log set-cookie header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPSEtCookie2
        On enabling this option, the Citrix ADC will log set-cookie2 header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPURL
        On enabling this option, the Citrix ADC will log the URL in appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPURLQuery
        On enabling this option, the Citrix ADC will log URL Query. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPUserAgent
        On enabling this option, the Citrix ADC will log User-Agent header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPVia
        On enabling this option, the Citrix ADC will Via header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER HTTPXforwardedforHeader
        On enabling this option, the Citrix ADC will log X-Forwarded-For header. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Integratedcache
        On enabling this option, the Citrix ADC will log the Integrated Caching appflow records. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Managementlog
        This option indicates the whether managementlog should be sent to the REST collector. Default value: DEFAULT_MANAGEMENTLOG Possible values = ALL, SHELL, ACCESS, NSMGMT, NONE
    .PARAMETER Metrics
        This option indicates the whether metrics should be sent to the REST collector. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER MetricsexPortFrequency
        This option is for configuring the metrics export frequency in seconds, frequency value must be in [30,300] seconds range. Default value: 30 Minimum value = 30 Maximum value = 300
    .PARAMETER OutputMode
        This option indicates the format of REST API POST body. It depends on the consumer of the analytics data. Default value: avro, Possible values = avro, prometheus, influx, json
    .PARAMETER SchemaFile
        This option is for configuring json schema file containing a list of counters to be exported by metricscollector. Maximum length = 64
    .PARAMETER ServeMode
        This option is for setting the mode of how data is provided. Default value: Push Possible values = Push, Pull
    .PARAMETER TCPBurstrePortIng
        On enabling this option, the Citrix ADC will log TCP burst parameters. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Topn
        On enabling this topn support, the topn information of the stream identifier this profile is bound to will be exported to the analytics endpoint. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Type
        This option indicates what information needs to be collected and exported. Possible values = global, webinsight, tcpinsight, securityinsight, videoinsight, hdxinsight, gatewayinsight, timeseries, lsninsight, botinsight, CIinsight, udpinsight, ngsinsight, streaminsight
    .PARAMETER URLCategory
        On enabling this option, the Citrix ADC will send the URL category record. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetAnalyticsProfile -Name 'example' -AllHTTPHeaderS ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetAnalyticsProfile -Name 'example' -AllHTTPHeaderS ENABLED -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AllHTTPHeaderS,

        [Parameter()]
        [switch] $AnalyticsAuthtoken,

        [Parameter()]
        [switch] $AnalyticsEndpointContentType,

        [Parameter()]
        [switch] $AnalyticsEndpointmetaData,

        [Parameter()]
        [switch] $AnalyticsEndpointURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AuditLogs,

        [Parameter()]
        [switch] $Collectors,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $CqarePortIng,

        [Parameter()]
        [switch] $DataFormAtFile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Events,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $GrpcStatus,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPAuthentication,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPClientsIdemeasurements,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPContentType,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPCookie,

        [Parameter()]
        [switch] $HTTPCustomHeaderS,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPDomainName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPHost,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPLocation,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPPageTracking,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPReferer,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPSEtCookie,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPSEtCookie2,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPURLQuery,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPUserAgent,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPVia,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $HTTPXforwardedforHeader,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Integratedcache,

        [Parameter()]
        [ValidateSet('ALL', 'SHELL', 'ACCESS', 'NSMGMT', 'NONE')]
        [switch] $Managementlog,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Metrics,

        [Parameter()]
        [switch] $MetricsexPortFrequency,

        [Parameter()]
        [ValidateSet('avro', 'prometheus', 'influx', 'json')]
        [switch] $OutputMode,

        [Parameter()]
        [switch] $SchemaFile,

        [Parameter()]
        [ValidateSet('Push', 'Pull')]
        [switch] $ServeMode,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $TCPBurstrePortIng,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Topn,

        [Parameter()]
        [ValidateSet('global', 'webinsight', 'tcpinsight', 'securityinsight', 'videoinsight', 'hdxinsight', 'gatewayinsight', 'timeseries', 'lsninsight', 'botinsight', 'CIinsight', 'udpinsight', 'ngsinsight', 'streaminsight')]
        [switch] $Type,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $URLCategory,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = @{ name = $Name }
        if ($PSBoundParameters.ContainsKey('AllHTTPHeaderS')) { $body['allhttpheaders'] = $true }
        if ($PSBoundParameters.ContainsKey('AnalyticsAuthtoken')) { $body['analyticsauthtoken'] = $true }
        if ($PSBoundParameters.ContainsKey('AnalyticsEndpointContentType')) { $body['analyticsendpointcontenttype'] = $true }
        if ($PSBoundParameters.ContainsKey('AnalyticsEndpointmetaData')) { $body['analyticsendpointmetadata'] = $true }
        if ($PSBoundParameters.ContainsKey('AnalyticsEndpointURL')) { $body['analyticsendpointurl'] = $true }
        if ($PSBoundParameters.ContainsKey('AuditLogs')) { $body['auditlogs'] = $true }
        if ($PSBoundParameters.ContainsKey('Collectors')) { $body['collectors'] = $true }
        if ($PSBoundParameters.ContainsKey('CqarePortIng')) { $body['cqareporting'] = $true }
        if ($PSBoundParameters.ContainsKey('DataFormAtFile')) { $body['dataformatfile'] = $true }
        if ($PSBoundParameters.ContainsKey('Events')) { $body['events'] = $true }
        if ($PSBoundParameters.ContainsKey('GrpcStatus')) { $body['grpcstatus'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPAuthentication')) { $body['httpauthentication'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPClientsIdemeasurements')) { $body['httpclientsidemeasurements'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPContentType')) { $body['httpcontenttype'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPCookie')) { $body['httpcookie'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPCustomHeaderS')) { $body['httpcustomheaders'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPDomainName')) { $body['httpdomainname'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPHost')) { $body['httphost'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPLocation')) { $body['httplocation'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPMethod')) { $body['httpmethod'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPPageTracking')) { $body['httppagetracking'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPReferer')) { $body['httpreferer'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPSEtCookie')) { $body['httpsetcookie'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPSEtCookie2')) { $body['httpsetcookie2'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPURL')) { $body['httpurl'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPURLQuery')) { $body['httpurlquery'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPUserAgent')) { $body['httpuseragent'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPVia')) { $body['httpvia'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPXforwardedforHeader')) { $body['httpxforwardedforheader'] = $true }
        if ($PSBoundParameters.ContainsKey('Integratedcache')) { $body['integratedcache'] = $true }
        if ($PSBoundParameters.ContainsKey('Managementlog')) { $body['managementlog'] = $true }
        if ($PSBoundParameters.ContainsKey('Metrics')) { $body['metrics'] = $true }
        if ($PSBoundParameters.ContainsKey('MetricsexPortFrequency')) { $body['metricsexportfrequency'] = $true }
        if ($PSBoundParameters.ContainsKey('OutputMode')) { $body['outputmode'] = $true }
        if ($PSBoundParameters.ContainsKey('SchemaFile')) { $body['schemafile'] = $true }
        if ($PSBoundParameters.ContainsKey('ServeMode')) { $body['servemode'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPBurstrePortIng')) { $body['tcpburstreporting'] = $true }
        if ($PSBoundParameters.ContainsKey('Topn')) { $body['topn'] = $true }
        if ($PSBoundParameters.ContainsKey('Type')) { $body['type'] = $true }
        if ($PSBoundParameters.ContainsKey('URLCategory')) { $body['urlcategory'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear analyticsprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type analyticsprofile -Action unset -Payload @{ analyticsprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAnalyticsProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAnalyticsProfile

# region Invoke-NSUpdateAnalyticsProfile
function Invoke-NSUpdateAnalyticsProfile {
    <#
    .SYNOPSIS
        Invokes the change operation for a NetScaler analyticsprofile resource.
    .DESCRIPTION
        Configuration for Analytics profile resource.
    .PARAMETER DataFormAtFile
        This option is for configuring the file containing the data format and metadata required by the analytics endpoint. Maximum length = 64
    .PARAMETER Name
        Name for the analytics profile. Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow profile" or 'my appflow profile'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSUpdateAnalyticsProfile -Name 'example'
    .EXAMPLE
        Invoke-NSUpdateAnalyticsProfile -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $DataFormAtFile,

        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('DataFormAtFile')) { $body['dataformatfile'] = $DataFormAtFile }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $Name }

        if ($PSCmdlet.ShouldProcess('analyticsprofile', 'Change analyticsprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type analyticsprofile -Action update -Payload @{ analyticsprofile = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSUpdateAnalyticsProfile

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC/SSnW1WIgLO96
# oaV5foDYMMz8PmXF1FO3D5Lffhv4r6CCIAowggYUMIID/KADAgECAhB6I67aU2mW
# D5HIPlz0x+M/MA0GCSqGSIb3DQEBDAUAMFcxCzAJBgNVBAYTAkdCMRgwFgYDVQQK
# Ew9TZWN0aWdvIExpbWl0ZWQxLjAsBgNVBAMTJVNlY3RpZ28gUHVibGljIFRpbWUg
# U3RhbXBpbmcgUm9vdCBSNDYwHhcNMjEwMzIyMDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSwwKgYD
# VQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNjCCAaIwDQYJ
# KoZIhvcNAQEBBQADggGPADCCAYoCggGBAM2Y2ENBq26CK+z2M34mNOSJjNPvIhKA
# VD7vJq+MDoGD46IiM+b83+3ecLvBhStSVjeYXIjfa3ajoW3cS3ElcJzkyZlBnwDE
# JuHlzpbN4kMH2qRBVrjrGJgSlzzUqcGQBaCxpectRGhhnOSwcjPMI3G0hedv2eNm
# GiUbD12OeORN0ADzdpsQ4dDi6M4YhoGE9cbY11XxM2AVZn0GiOUC9+XE0wI7CQKf
# OUfigLDn7i/WeyxZ43XLj5GVo7LDBExSLnh+va8WxTlA+uBvq1KO8RSHUQLgzb1g
# bL9Ihgzxmkdp2ZWNuLc+XyEmJNbD2OIIq/fWlwBp6KNL19zpHsODLIsgZ+WZ1AzC
# s1HEK6VWrxmnKyJJg2Lv23DlEdZlQSGdF+z+Gyn9/CRezKe7WNyxRf4e4bwUtrYE
# 2F5Q+05yDD68clwnweckKtxRaF0VzN/w76kOLIaFVhf5sMM/caEZLtOYqYadtn03
# 4ykSFaZuIBU9uCSrKRKTPJhWvXk4CllgrwIDAQABo4IBXDCCAVgwHwYDVR0jBBgw
# FoAU9ndq3T/9ARP/FqFsggIv0Ao9FCUwHQYDVR0OBBYEFF9Y7UwxeqJhQo1SgLqz
# YZcZojKbMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGg
# P6A9hjtodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNUaW1lU3Rh
# bXBpbmdSb290UjQ2LmNybDB8BggrBgEFBQcBAQRwMG4wRwYIKwYBBQUHMAKGO2h0
# dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY1RpbWVTdGFtcGluZ1Jv
# b3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAN
# BgkqhkiG9w0BAQwFAAOCAgEAEtd7IK0ONVgMnoEdJVj9TC1ndK/HYiYh9lVUacah
# RoZ2W2hfiEOyQExnHk1jkvpIJzAMxmEc6ZvIyHI5UkPCbXKspioYMdbOnBWQUn73
# 3qMooBfIghpR/klUqNxx6/fDXqY0hSU1OSkkSivt51UlmJElUICZYBodzD3M/SFj
# eCP59anwxs6hwj1mfvzG+b1coYGnqsSz2wSKr+nDO+Db8qNcTbJZRAiSazr7KyUJ
# Go1c+MScGfG5QHV+bps8BX5Oyv9Ct36Y4Il6ajTqV2ifikkVtB3RNBUgwu/mSiSU
# ice/Jp/q8BMk/gN8+0rNIE+QqU63JoVMCMPY2752LmESsRVVoypJVt8/N3qQ1c6F
# ibbcRabo3azZkcIdWGVSAdoLgAIxEKBeNh9AQO1gQrnh1TA8ldXuJzPSuALOz1Uj
# b0PCyNVkWk7hkhVHfcvBfI8NtgWQupiaAeNHe0pWSGH2opXZYKYG4Lbukg7HpNi/
# KqJhue2Keak6qH9A8CeEOB7Eob0Zf+fU+CCQaL0cJqlmnx9HCDxF+3BLbUufrV64
# EbTI40zqegPZdA+sXCmbcZy6okx/SjwsusWRItFA3DE8MORZeFb6BmzBtqKJ7l93
# 9bbKBy2jvxcJI98Va95Q5JnlKor3m0E7xpMeYRriWklUPsetMSf2NvUQa/E5vVye
# fQIwggZFMIIELaADAgECAhAIMk+dt9qRb2Pk8qM8Xl1RMA0GCSqGSIb3DQEBCwUA
# MFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMu
# QS4xJDAiBgNVBAMTG0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQTAeFw0yNDA0
# MDQxNDA0MjRaFw0yNzA0MDQxNDA0MjNaMGsxCzAJBgNVBAYTAk5MMRIwEAYDVQQH
# DAlTY2hpam5kZWwxIzAhBgNVBAoMGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5
# MSMwIQYDVQQDDBpKb2huIEJpbGxla2VucyBDb25zdWx0YW5jeTCCAaIwDQYJKoZI
# hvcNAQEBBQADggGPADCCAYoCggGBAMslntDbSQwHZXwFhmibivbnd0Qfn6sqe/6f
# os3pKzKxEsR907RkDMet2x6RRg3eJkiIr3TFPwqBooyXXgK3zxxpyhGOcuIqyM9J
# 28DVf4kUyZHsjGO/8HFjrr3K1hABNUszP0o7H3o6J31eqV1UmCXYhQlNoW9FOmRC
# 1amlquBmh7w4EKYEytqdmdOBavAD5Xq4vLPxNP6kyA+B2YTtk/xM27TghtbwFGKn
# u9Vwnm7dFcpLxans4ONt2OxDQOMA5NwgcUv/YTpjhq9qoz6ivG55NRJGNvUXsM3w
# 2o7dR6Xh4MuEGrTSrOWGg2A5EcLH1XqQtkF5cZnAPM8W/9HUp8ggornWnFVQ9/6M
# ga+ermy5wy5XrmQpN+x3u6tit7xlHk1Hc+4XY4a4ie3BPXG2PhJhmZAn4ebNSBwN
# Hh8z7WTT9X9OFERepGSytZVeEP7hgyptSLcuhpwWeR4QdBb7dV++4p3PsAUQVHFp
# wkSbrRTv4EiJ0Lcz9P1HPGFoHiFAQQIDAQABo4IBeDCCAXQwDAYDVR0TAQH/BAIw
# ADA9BgNVHR8ENjA0MDKgMKAuhixodHRwOi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0u
# cGwvY2NzY2EyMDIxLmNybDBzBggrBgEFBQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0
# dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0dW0uY29tMDUGCCsGAQUFBzAChilodHRw
# Oi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAW
# gBTddF1MANt7n6B0yrFu9zzAMsBwzTAdBgNVHQ4EFgQUO6KtBpOBgmrlANVAnyiQ
# C6W6lJwwSwYDVR0gBEQwQjAIBgZngQwBBAEwNgYLKoRoAYb2dwIFAQQwJzAlBggr
# BgEFBQcCARYZaHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzATBgNVHSUEDDAKBggr
# BgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAEQsN8wg
# PMdWVkwHPPTN+jKpdns5AKVFjcn00psf2NGVVgWWNQBIQc9lEuTBWb54IK6Ga3hx
# QRZfnPNo5HGl73YLmFgdFQrFzZ1lnaMdIcyh8LTWv6+XNWfoyCM9wCp4zMIDPOs8
# LKSMQqA/wRgqiACWnOS4a6fyd5GUIAm4CuaptpFYr90l4Dn/wAdXOdY32UhgzmSu
# xpUbhD8gVJUaBNVmQaRqeU8y49MxiVrUKJXde1BCrtR9awXbqembc7Nqvmi60tYK
# lD27hlpKtj6eGPjkht0hHEsgzU0Fxw7ZJghYG2wXfpF2ziN893ak9Mi/1dmCNmor
# GOnybKYfT6ff6YTCDDNkod4egcMZdOSv+/Qv+HAeIgEvrxE9QsGlzTwbRtbm6gwY
# YcVBs/SsVUdBn/TSB35MMxRhHE5iC3aUTkDbceo/XP3uFhVL4g2JZHpFfCSu2TQr
# rzRn2sn07jfMvzeHArCOJgBW1gPqR3WrJ4hUxL06Rbg1gs9tU5HGGz9KNQMfQFQ7
# 0Wz7UIhezGcFcRfkIfSkMmQYYpsc7rfzj+z0ThfDVzzJr2dMOFsMlfj1T6l22GBq
# 9XQx0A4lcc5Fl9pRxbOuHHWFqIBD/BCEhwniOCySzqENd2N+oz8znKooSISStnkN
# aYXt6xblJF2dx9Dn89FK7d1IquNxOwt0tI5dMIIGYjCCBMqgAwIBAgIRAKQpO24e
# 3denNAiHrXpOtyQwDQYJKoZIhvcNAQEMBQAwVTELMAkGA1UEBhMCR0IxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEsMCoGA1UEAxMjU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBDQSBSMzYwHhcNMjUwMzI3MDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjByMQswCQYDVQQGEwJHQjEXMBUGA1UECBMOV2VzdCBZb3Jrc2hpcmUxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEwMC4GA1UEAxMnU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBTaWduZXIgUjM2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEA04SV9G6kU3jyPRBLeBIHPNyUgVNnYayfsGOyYEXrn3+SkDYTLs1crcw/
# ol2swE1TzB2aR/5JIjKNf75QBha2Ddj+4NEPKDxHEd4dEn7RTWMcTIfm492TW22I
# 8LfH+A7Ehz0/safc6BbsNBzjHTt7FngNfhfJoYOrkugSaT8F0IzUh6VUwoHdYDpi
# ln9dh0n0m545d5A5tJD92iFAIbKHQWGbCQNYplqpAFasHBn77OqW37P9BhOASdmj
# p3IijYiFdcA0WQIe60vzvrk0HG+iVcwVZjz+t5OcXGTcxqOAzk1frDNZ1aw8nFhG
# EvG0ktJQknnJZE3D40GofV7O8WzgaAnZmoUn4PCpvH36vD4XaAF2CjiPsJWiY/j2
# xLsJuqx3JtuI4akH0MmGzlBUylhXvdNVXcjAuIEcEQKtOBR9lU4wXQpISrbOT8ux
# +96GzBq8TdbhoFcmYaOBZKlwPP7pOp5Mzx/UMhyBA93PQhiCdPfIVOCINsUY4U23
# p4KJ3F1HqP3H6Slw3lHACnLilGETXRg5X/Fp8G8qlG5Y+M49ZEGUp2bneRLZoyHT
# yynHvFISpefhBCV0KdRZHPcuSL5OAGWnBjAlRtHvsMBrI3AAA0Tu1oGvPa/4yeei
# Ayu+9y3SLC98gDVbySnXnkujjhIh+oaatsk/oyf5R2vcxHahajMCAwEAAaOCAY4w
# ggGKMB8GA1UdIwQYMBaAFF9Y7UwxeqJhQo1SgLqzYZcZojKbMB0GA1UdDgQWBBSI
# YYyhKjdkgShgoZsx0Iz9LALOTzAOBgNVHQ8BAf8EBAMCBsAwDAYDVR0TAQH/BAIw
# ADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBKBgNVHSAEQzBBMDUGDCsGAQQBsjEB
# AgEDCDAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzAIBgZn
# gQwBBAIwSgYDVR0fBEMwQTA/oD2gO4Y5aHR0cDovL2NybC5zZWN0aWdvLmNvbS9T
# ZWN0aWdvUHVibGljVGltZVN0YW1waW5nQ0FSMzYuY3JsMHoGCCsGAQUFBwEBBG4w
# bDBFBggrBgEFBQcwAoY5aHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUHVi
# bGljVGltZVN0YW1waW5nQ0FSMzYuY3J0MCMGCCsGAQUFBzABhhdodHRwOi8vb2Nz
# cC5zZWN0aWdvLmNvbTANBgkqhkiG9w0BAQwFAAOCAYEAAoE+pIZyUSH5ZakuPVKK
# 4eWbzEsTRJOEjbIu6r7vmzXXLpJx4FyGmcqnFZoa1dzx3JrUCrdG5b//LfAxOGy9
# Ph9JtrYChJaVHrusDh9NgYwiGDOhyyJ2zRy3+kdqhwtUlLCdNjFjakTSE+hkC9F5
# ty1uxOoQ2ZkfI5WM4WXA3ZHcNHB4V42zi7Jk3ktEnkSdViVxM6rduXW0jmmiu71Z
# pBFZDh7Kdens+PQXPgMqvzodgQJEkxaION5XRCoBxAwWwiMm2thPDuZTzWp/gUFz
# i7izCmEt4pE3Kf0MOt3ccgwn4Kl2FIcQaV55nkjv1gODcHcD9+ZVjYZoyKTVWb4V
# qMQy/j8Q3aaYd/jOQ66Fhk3NWbg2tYl5jhQCuIsE55Vg4N0DUbEWvXJxtxQQaVR5
# xzhEI+BjJKzh3TQ026JxHhr2fuJ0mV68AluFr9qshgwS5SpN5FFtaSEnAwqZv3IS
# +mlG50rK7W3qXbWwi4hmpylUfygtYLEdLQukNEX1jiOKMIIGgjCCBGqgAwIBAgIQ
# NsKwvXwbOuejs902y8l1aDANBgkqhkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYD
# VQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBS
# U0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMjEwMzIyMDAwMDAwWhcNMzgw
# MTE4MjM1OTU5WjBXMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1p
# dGVkMS4wLAYDVQQDEyVTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIFJvb3Qg
# UjQ2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAiJ3YuUVnnR3d6Lkm
# gZpUVMB8SQWbzFoVD9mUEES0QUCBdxSZqdTkdizICFNeINCSJS+lV1ipnW5ihkQy
# C0cRLWXUJzodqpnMRs46npiJPHrfLBOifjfhpdXJ2aHHsPHggGsCi7uE0awqKggE
# /LkYw3sqaBia67h/3awoqNvGqiFRJ+OTWYmUCO2GAXsePHi+/JUNAax3kpqstbl3
# vcTdOGhtKShvZIvjwulRH87rbukNyHGWX5tNK/WABKf+Gnoi4cmisS7oSimgHUI0
# Wn/4elNd40BFdSZ1EwpuddZ+Wr7+Dfo0lcHflm/FDDrOJ3rWqauUP8hsokDoI7D/
# yUVI9DAE/WK3Jl3C4LKwIpn1mNzMyptRwsXKrop06m7NUNHdlTDEMovXAIDGAvYy
# nPt5lutv8lZeI5w3MOlCybAZDpK3Dy1MKo+6aEtE9vtiTMzz/o2dYfdP0KWZwZIX
# bYsTIlg1YIetCpi5s14qiXOpRsKqFKqav9R1R5vj3NgevsAsvxsAnI8Oa5s2oy25
# qhsoBIGo/zi6GpxFj+mOdh35Xn91y72J4RGOJEoqzEIbW3q0b2iPuWLA911cRxgY
# 5SJYubvjay3nSMbBPPFsyl6mY4/WYucmyS9lo3l7jk27MAe145GWxK4O3m3gEFEI
# kv7kRmefDR7Oe2T1HxAnICQvr9sCAwEAAaOCARYwggESMB8GA1UdIwQYMBaAFFN5
# v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBT2d2rdP/0BE/8WoWyCAi/QCj0U
# JTAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zATBgNVHSUEDDAKBggr
# BgEFBQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0
# cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25B
# dXRob3JpdHkuY3JsMDUGCCsGAQUFBwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDov
# L29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEADr5lQe1oRLjl
# ocXUEYfktzsljOt+2sgXke3Y8UPEooU5y39rAARaAdAxUeiX1ktLJ3+lgxtoLQhn
# 5cFb3GF2SSZRX8ptQ6IvuD3wz/LNHKpQ5nX8hjsDLRhsyeIiJsms9yAWnvdYOdEM
# q1W61KE9JlBkB20XBee6JaXx4UBErc+YuoSb1SxVf7nkNtUjPfcxuFtrQdRMRi/f
# InV/AobE8Gw/8yBMQKKaHt5eia8ybT8Y/Ffa6HAJyz9gvEOcF1VWXG8OMeM7Vy7B
# s6mSIkYeYtddU1ux1dQLbEGur18ut97wgGwDiGinCwKPyFO7ApcmVJOtlw9FVJxw
# /mL1TbyBns4zOgkaXFnnfzg4qbSvnrwyj1NiurMp4pmAWjR+Pb/SIduPnmFzbSN/
# G8reZCL4fvGlvPFk4Uab/JVCSmj59+/mB2Gn6G/UYOy8k60mKcmaAZsEVkhOFuoj
# 4we8CYyaR9vd9PGZKSinaZIkvVjbH/3nlLb0a7SBIkiRzfPfS9T+JesylbHa1LtR
# V9U/7m0q7Ma2CQ/t392ioOssXW7oKLdOmMBl14suVFBmbzrt5V5cQPnwtd3UOTpS
# 9oCG+ZZheiIvPgkDmA8FzPsnfXW5qHELB43ET7HHFHeRPRYrMBKjkb8/IN7Po0d0
# hQoF4TeMM+zYAJzoKQnVKOLg8pZVPT8wgga5MIIEoaADAgECAhEAmaOACiZVO2Wr
# 3G6EprPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAgBgNVBAoT
# GVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1bSBDZXJ0
# aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0ZWQgTmV0
# d29yayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIxOFowVjELMAkG
# A1UEBhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIG
# A1UEAxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5cTbq96y34vuTm
# flN4mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7VS5+djSoMcbv
# IKck6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1PH9ud0IF+njvM
# k2xqbNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOouu9Tj1yHIohzu
# C8KNqfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv8aGUsRdaCtVD
# 2bSlbfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtMLK+Wo837Q4QO
# ZgYqVWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9lDV2nT8mFSkc
# SkAExzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/JHuurfTI5XDY
# O962WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkKbWpQ5boufUnq
# 1UiYPIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADaCi2JSplKShBS
# ND36E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAWd18Jx5n858JS
# qPECAwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFN10XUwA
# 23ufoHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4HKbROg79
# MA4GA1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAwBgNVHR8EKTAn
# MCWgI6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwGCCsGAQUF
# BwEBBGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2VydHVtLmNv
# bTAyBggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBsL2N0bmNh
# Mi5jZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0dHA6Ly93
# d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhYD+WPUCiaU58Q
# 7EP89DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUStJl490L94C9L
# GF3vjzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChDUyuQy6rGDxLU
# UAsO0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiRsWrhWM2f8pXd
# d3x2mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7bWRLDm0CdY9rN
# LqyA3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mATwZWwSD+B7eMc
# ZNhpn8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3/bFAEloMU+vU
# BfSouCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESYkOh1/w1tVxTp
# V2Na3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR+x+zPF/2DaGg
# K2W1eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C+xN4YaNjt2yw
# zOr+tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qwt4HOUBCrW602
# NCmvO1nm+/80nLy5r0AZvCQxaQ4xggXDMIIFvwIBATBqMFYxCzAJBgNVBAYTAlBM
# MSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0Nl
# cnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQQIQCDJPnbfakW9j5PKjPF5dUTANBglg
# hkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3
# DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
# MC8GCSqGSIb3DQEJBDEiBCCykBsOf4l0lic8MC/HEZnR405MLtS00TiCGrJbdxhC
# 7DANBgkqhkiG9w0BAQEFAASCAYBauRLVvJSlxf6m+A58hi9XbqbPD2O3aYgS82VJ
# 3OqoxfexgWkd3s8mC4LR8Pdt0Y0H7/9nWkbzPL1zj6A0NHd1PE9uTq1XIvRRKcOy
# rJWmgkzS6uVV89USJFtnn7UuKGrrupQ2Bi6VX8j1rtgMdxBLIs9jCl99my1zvnv4
# S8RKacrTWb8h+9zdmOBwflrvAQaODG9qLwB5tEpV7S7cgcgKIKlfh+pkdt4Oreek
# 1XGKvNzl6FA7QWpjOe+ZBQXYshtjNIpVWLKguqWKmvk8XZhULmwoOJ2ppyng1Nzj
# pZWRCXfnNcOsDjKX3fH56t+j8yqj1E4jjXwS0DnBRCg20SZ34mvDThEltaQrWxM+
# oe+usMLKSFtxt0xuHvsd0BXww8FYTz7StrR2mdAHQRCF88KrNk+0r+SMpYXJceZi
# FRsXs9KWDHH1DlR90OGRPDvSUPUwBp58UOQ1qfV3znTx93jGaPZvY02nWbCUGqfb
# /LFukAx7ckh+IKAyMdNC8Wr3uPShggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU0MDJaMD8GCSqGSIb3
# DQEJBDEyBDCO5PEAuA6Ucx/bM6G65wVTJoUQBdMlyxY0thtlZHoS7d74tBag969k
# ke1BXHmwHqUwDQYJKoZIhvcNAQEBBQAEggIAbHJ0sH04Ibzy4c+c4OCaMiLau/Pa
# Oe5LRAUJ8pCuPcOj6gdi2uJUdDE1xEmL6VDTh4w3ya7OtX9QJ05kX+RnOYvGRZkI
# Cnh46p4fM0F8WzjrjbEGP0IxuKk3P08hwPZgojlLpaZNKUnifAZmFAFT87hNoXOT
# /v7mWkpgXQkSOi6Mt9UUtSUkqCvMY3BTsEDylxrUQRi5vgRMIig/lcDt0uOq4Q0b
# 3J3Ju3ofp+Hd1EyvKAXJ2ZHToeNl52VzoDMg6GH8kUON5v8W3zgGBiGgWAlwQh3G
# aCHdRLup7EzR9/FStKxhmn5HKeX23B/ISaZWV7g6Es89kM27Z9ugoPJPRGPXo25l
# exPRL0ww0qDtikbgQYZ8TSWkwqivxwgeVAYEw61cep5Pbr9nDT5QKZMNLCxR2Pft
# jJm+mVzDIE5Z/fg45UHFI780oVOOl5KcuCnrXrgKZWm5zLVrONba0YVTS63ynpbe
# xLJlz03qOedNCkK2vuoRtmNjLiAGo9iMRX2GCQlfyomIRyX9A5eoXN50wu7z15EE
# 8qNnJA7UwqPGU6ef5jN6P9nQ08RqqsiEmJcUiZaCdPVFIYKqZxePv14SBh5RgwWR
# M/JsIkH3ILoz9goaIdPMD082mCwOCwUQZRR3z+9MkBuUWK0XJ6fdakveLF8n63Mu
# MQbNtqgBhd5WzFo=
# SIG # End signature block
