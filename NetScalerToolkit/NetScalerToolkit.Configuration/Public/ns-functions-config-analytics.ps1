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
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC/SSnW1WIgLO96
# oaV5foDYMMz8PmXF1FO3D5Lffhv4r6CCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
# lUgTecgRwIeZMA0GCSqGSIb3DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVu
# dGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAy
# MDAeFw0yMDA0MTYxODM2MTZaFw00NTA0MTYxODQ0NDBaMHcxCzAJBgNVBAYTAlVT
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jv
# c29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRo
# b3JpdHkgMjAyMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALORKgeD
# Bmf9np3gx8C3pOZCBH8Ppttf+9Va10Wg+3cL8IDzpm1aTXlT2KCGhFdFIMeiVPvH
# or+Kx24186IVxC9O40qFlkkN/76Z2BT2vCcH7kKbK/ULkgbk/WkTZaiRcvKYhOuD
# PQ7k13ESSCHLDe32R0m3m/nJxxe2hE//uKya13NnSYXjhr03QNAlhtTetcJtYmrV
# qXi8LW9J+eVsFBT9FMfTZRY33stuvF4pjf1imxUs1gXmuYkyM6Nix9fWUmcIxC70
# ViueC4fM7Ke0pqrrBc0ZV6U6CwQnHJFnni1iLS8evtrAIMsEGcoz+4m+mOJyoHI1
# vnnhnINv5G0Xb5DzPQCGdTiO0OBJmrvb0/gwytVXiGhNctO/bX9x2P29Da6SZEi3
# W295JrXNm5UhhNHvDzI9e1eM80UHTHzgXhgONXaLbZ7LNnSrBfjgc10yVpRnlyUK
# xjU9lJfnwUSLgP3B+PR0GeUw9gb7IVc+BhyLaxWGJ0l7gpPKWeh1R+g/OPTHU3mg
# trTiXFHvvV84wRPmeAyVWi7FQFkozA8kwOy6CXcjmTimthzax7ogttc32H83rwjj
# O3HbbnMbfZlysOSGM1l0tRYAe1BtxoYT2v3EOYI9JACaYNq6lMAFUSw0rFCZE4e7
# swWAsk0wAly4JoNdtGNz764jlU9gKL431VulAgMBAAGjVDBSMA4GA1UdDwEB/wQE
# AwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTIftJqhSobyhmYBAcnz1AQ
# T2ioojAQBgkrBgEEAYI3FQEEAwIBADANBgkqhkiG9w0BAQwFAAOCAgEAr2rd5hnn
# LZRDGU7L6VCVZKUDkQKL4jaAOxWiUsIWGbZqWl10QzD0m/9gdAmxIR6QFm3FJI9c
# Zohj9E/MffISTEAQiwGf2qnIrvKVG8+dBetJPnSgaFvlVixlHIJ+U9pW2UYXeZJF
# xBA2CFIpF8svpvJ+1Gkkih6PsHMNzBxKq7Kq7aeRYwFkIqgyuH4yKLNncy2RtNwx
# AQv3Rwqm8ddK7VZgxCwIo3tAsLx0J1KH1r6I3TeKiW5niB31yV2g/rarOoDXGpc8
# FzYiQR6sTdWD5jw4vU8w6VSp07YEwzJ2YbuwGMUrGLPAgNW3lbBeUU0i/OxYqujY
# lLSlLu2S3ucYfCFX3VVj979tzR/SpncocMfiWzpbCNJbTsgAlrPhgzavhgplXHT2
# 6ux6anSg8Evu75SjrFDyh+3XOjCDyft9V77l4/hByuVkrrOj7FjshZrM77nq81YY
# uVxzmq/FdxeDWds3GhhyVKVB0rYjdaNDmuV3fJZ5t0GNv+zcgKCf0Xd1WF81E+Al
# GmcLfc4l+gcK5GEh2NQc5QfGNpn0ltDGFf5Ozdeui53bFv0ExpK91IjmqaOqu/dk
# ODtfzAzQNb50GQOmxapMomE2gj4d8yu8l13bS3g7LfU772Aj6PXsCyM2la+YZr9T
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAQqYjg2
# C/C7UthEAAAABCpiMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQwHhcNMjYwODAxMTk0NTU5WhcNMjYwODA0
# MTk0NTU5WjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAzJVfDiyD7X5wjaVAbNcWusQ1
# m3nZDHQpCr9Tac4NJB+RO2I778PjqBIVN5CyAGRYbP/nK+yy2tOAjaC/Fo5hatz0
# 5EFprl6CuV28E2OulBZ6fZm1NByGMHdctNVVoQDnZp0H32GVlavYJKwiLzESO01m
# 5DV2mQxEyxWGQlPyNUZousEvBi0LyvtQ/MnekqzqSqRnoT1HNul8Em4CoEMqUsLe
# nyYSQJ/YBj5ZiLbPdvEdSSZfHBnKFyJSzU1LoXYpgH1BLsS24pIlF3kHUxN8LcKd
# yBkqISEUElx7O4+fi71na+s04CjDI2ffkGt4Uhhcd2kzMsUEATi5YLLW/0m3SX1k
# AaSX4k2SmIGrCIiD7Tg5dxsnoz37mshvEhsGCd91PLsxVlCQrTcz1Pg2lLki9RXv
# ekrOS9B8jAdXbN5cU42szS4Z6olfShAHFBo1TizkYMgjxAOqZPWKCsgAZrT4R9SH
# auKCkCkTqGV3XoIKQ22FozT/NMfxKcmo4kh0MCaNAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# SNqcq9sa54tVhaeGFcwQwietz+UwHwYDVR0jBBgwFoAUayVB3vtrfP0YgAotf492
# XapzPbgwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwNC5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDQuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBADop
# 8VvsB0PCl6Oomj6RIkJs5sJADvWluNDY8wf4eidt0AX2JpTTLzXVWcZTE+78wYhe
# 2sBmufBXIw6PRhOcTSOfReICWaUTSKLTWX0Z1x9YN1HugpMpvMatentzINPYpP+q
# ao91Rsn9lT91MES6CnrhhB/sBZEK4KHf2yNQ3MJ+kRAf1qre1j9S9DWuBiprg+2C
# sOex2VKs2+rHbuT6CFdw67T9k+bleKiktjFInfVlJ0dfMTa6D/mv5ED/az9xccjQ
# cses9dSiGIXg2stIc49dvfZZK16/zFfn4JXZOHcenYvg1HXNaywh8htkOz2ylbQB
# XB8JtDmY5sLCT8oYxILmhgmZ8FWrRaW7yOnGUSAxRYaiGj7tiDcIhwI86tuxEKFu
# vkGoFTOh5fch0g/pNqAxDnUlDyrlkaZ3w6c2cC6lEeOEnX9wMNbpgdE0kX/vNB6Y
# p2IqGZ9e01rKS0T1yHYy2jvY761YirKkewV/xWqjj9OQktKA9ri+LRcizKD1PqkH
# uVyjsUs5LDdZbkjJTCkr07LEda/cGG9SFxd4nFuUWW+IcU7QwCMLpCUaoUmpVNJF
# 93lLntphbR4lQjJqcO68JXvJ8zE2yCjQ/07fk+BqJDe9/ha1pJpqizxeqkCsdJcg
# Fc3dv1gLb4r3GwBWsVpvKE+gTpVk/1z1SK7OjMKRMIIGwDCCBKigAwIBAgITMwAE
# KmI4Ngvwu1LYRAAAAAQqYjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDA0MB4XDTI2MDgwMTE5NDU1OVoXDTI2
# MDgwNDE5NDU1OVowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAMyVXw4sg+1+cI2lQGzX
# FrrENZt52Qx0KQq/U2nODSQfkTtiO+/D46gSFTeQsgBkWGz/5yvsstrTgI2gvxaO
# YWrc9ORBaa5egrldvBNjrpQWen2ZtTQchjB3XLTVVaEA52adB99hlZWr2CSsIi8x
# EjtNZuQ1dpkMRMsVhkJT8jVGaLrBLwYtC8r7UPzJ3pKs6kqkZ6E9RzbpfBJuAqBD
# KlLC3p8mEkCf2AY+WYi2z3bxHUkmXxwZyhciUs1NS6F2KYB9QS7EtuKSJRd5B1MT
# fC3CncgZKiEhFBJcezuPn4u9Z2vrNOAowyNn35BreFIYXHdpMzLFBAE4uWCy1v9J
# t0l9ZAGkl+JNkpiBqwiIg+04OXcbJ6M9+5rIbxIbBgnfdTy7MVZQkK03M9T4NpS5
# IvUV73pKzkvQfIwHV2zeXFONrM0uGeqJX0oQBxQaNU4s5GDII8QDqmT1igrIAGa0
# +EfUh2rigpApE6hld16CCkNthaM0/zTH8SnJqOJIdDAmjQIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFEjanKvbGueLVYWnhhXMEMInrc/lMB8GA1UdIwQYMBaAFGslQd77a3z9GIAK
# LX+Pdl2qcz24MGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDQuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDA0LmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQA6KfFb7AdDwpejqJo+kSJCbObCQA71pbjQ2PMH+HonbdAF9iaU0y811VnGUxPu
# /MGIXtrAZrnwVyMOj0YTnE0jn0XiAlmlE0ii01l9GdcfWDdR7oKTKbzGrXp7cyDT
# 2KT/qmqPdUbJ/ZU/dTBEugp64YQf7AWRCuCh39sjUNzCfpEQH9aq3tY/UvQ1rgYq
# a4PtgrDnsdlSrNvqx27k+ghXcOu0/ZPm5XiopLYxSJ31ZSdHXzE2ug/5r+RA/2s/
# cXHI0HLHrPXUohiF4NrLSHOPXb32WStev8xX5+CV2Th3Hp2L4NR1zWssIfIbZDs9
# spW0AVwfCbQ5mObCwk/KGMSC5oYJmfBVq0Wlu8jpxlEgMUWGoho+7Yg3CIcCPOrb
# sRChbr5BqBUzoeX3IdIP6TagMQ51JQ8q5ZGmd8OnNnAupRHjhJ1/cDDW6YHRNJF/
# 7zQemKdiKhmfXtNayktE9ch2Mto72O+tWIqypHsFf8Vqo4/TkJLSgPa4vi0XIsyg
# 9T6pB7lco7FLOSw3WW5IyUwpK9OyxHWv3BhvUhcXeJxblFlviHFO0MAjC6QlGqFJ
# qVTSRfd5S57aYW0eJUIyanDuvCV7yfMxNsgo0P9O35PgaiQ3vf4WtaSaaos8XqpA
# rHSXIBXN3b9YC2+K9xsAVrFabyhPoE6VZP9c9UiuzozCkTCCBygwggUQoAMCAQIC
# EzMAAAAWMZKNkgJle5oAAAAAABYwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMjlaFw0zMTAzMjYxODExMjlaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDKVfrI2+gJMM/0bQ5OVKNdvOASzLbUUMvXuf+Vl7YGuofPaZHVo3gMHF5i
# nT+GMSpIcfIZ9qtXU1UG68ry8vNbQtOL4Nm30ifXpqI1+ByiAWLO1YT0WnzG7XPO
# uoTeeWsNZv5FmjxCsReBZvyzyzCyXZbu1EQfJxWTH4ebUwtAiW9rqMf9eDj/wYhi
# EfNteJV3ZFeibD2ztCHr9JhFdd97XbnCHgQoTIqc02X5xlRKtUGBa++OtHBBjiJ/
# uwBnzTkqu4FjpZjQeJtrmda+ur1CT2jflWIB/ypn7u7V9tvW9wJbJYt/H2EtJ0GO
# NWxJZ7TEu8jWPindOO3lzPP7UtzS/mVDV94HucWaltmsra6zSG8BoEJ87IM8QSb7
# vfm/O41FhYkUv89WIj5ES2O4kxyiMSfe95CMivCuYrRP2hKvx7egPMrWgDDBkxML
# grKZO9hRNUMm8vk3w5b9SogHOyJVhxyFm8aFXfIxgqDF4S0g4bhbhnzljmSlCLlu
# mMZcXFGDjpF2tNoAu3VGFGYtHtTSNVKvZpgB3b4ynaoDkbPf+Wg4523jt4VneasB
# gZhC1srZI2NCnCBBfgjLq04pqEKAWEohyW2K29KSkkHvt5VaE1ac3Yt+oyiOzMS5
# 7tXwQDJLGvLg/OXFO0VNvczDndfIfXYExB/ab2PuMSwd5VIBOwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRr
# JUHe+2t8/RiACi1/j3ZdqnM9uDBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQAG1VBeVHTVRBljlcZD3IiMxwPyMjQyLNaEnVu5mODm2hRB
# JfH8GsBLATmrHAc8F47jmk5CnpUPiIguCbw6Z/KVj4Dsoiq228NSLMLewFfGMri7
# uwNGLISC5ccp8vUdADDEIsS2dE+QI9OwkDpv3XuUD7d+hAgcLVcMOl1AsfEZtsZe
# nhGvSYUrm/FuLq0BqEGL9GXM5c+Ho9q8o+Vn/S+GWQN2y+gkRO15s0kI05nUpq/d
# OD4ri9rgVs6tipEd0YZqGgD+CZNiaZWrDTOQbNPncd2F9qOsUa20miYruoT5PwJA
# aI+QQiTE2ZJeMJOkOpzhTUgqVMZwZidEUZKCqudaeQA08WwnkQMfKyHzaU8j48UL
# cU4hUwvMsv7fSurOe9GAdRQCPvF8WcSK5oDHe8VVJM4tv6KKCm91HqLx9JamBgRI
# 6R2SfY3nu26EGznu0rCg/769z8xWm4PVcC2ZaL6VlKVqFp1NsN8YqMyf5t+bbGVb
# 09noFKcJG/UwyGlxRmQBlfeBUQx5/ytlzZzsEnhrJF9fTAfje8j3OdX5lEnePTFQ
# LRlvzZFBqUXnIeQKv3fHQjC9m2fo/Z01DII/qp3d8LhGVUW0BCG04fRwHJNH8iqq
# CG/qofMv+kym2AxBDnHzNgRjL60JOFiBgiurvLhYQNhB95KWojFA6shQnggkMTCC
# B54wggWGoAMCAQICEzMAAAAHh6M0o3uljhwAAAAAAAcwDQYJKoZIhvcNAQEMBQAw
# dzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjFI
# MEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBSb290IENl
# cnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIxMDQwMTIwMDUyMFoXDTM2MDQw
# MTIwMTUyMFowYzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjE0MDIGA1UEAxMrTWljcm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2ln
# bmluZyBQQ0EgMjAyMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALLw
# wK8ZiCji3VR6TElsaQhVCbRS/3pK+MHrJSj3Zxd3KU3rlfL3qrZilYKJNqztA9OQ
# acr1AwoNcHbKBLbsQAhBnIB34zxf52bDpIO3NJlfIaTE/xrweLoQ71lzCHkD7A4A
# s1Bs076Iu+mA6cQzsYYH/Cbl1icwQ6C65rU4V9NQhNUwgrx9rGQ//h890Q8JdjLL
# w0nV+ayQ2Fbkd242o9kH82RZsH3HEyqjAB5a8+Ae2nPIPc8sZU6ZE7iRrRZywRmr
# KDp5+TcmJX9MRff241UaOBs4NmHOyke8oU1TYrkxh+YeHgfWo5tTgkoSMoayqoDp
# HOLJs+qG8Tvh8SnifW2Jj3+ii11TS8/FGngEaNAWrbyfNrC69oKpRQXY9bGH6jn9
# NEJv9weFxhTwyvx9OJLXmRGbAUXN1U9nf4lXezky6Uh/cgjkVd6CGUAf0K+Jw+GE
# /5VpIVbcNr9rNE50Sbmy/4RTCEGvOq3GhjITbCa4crCzTTHgYYjHs1NbOc6brH+e
# KpWLtr+bGecy9CrwQyx7S/BfYJ+ozst7+yZtG2wR461uckFu0t+gCwLdN0A6cFtS
# RtR8bvxVFyWwTtgMMFRuBa3vmUOTnfKLsLefRaQcVTgRnzeLzdpt32cdYKp+dhr2
# ogc+qM6K4CBI5/j4VFyC4QFeUP2YAidLtvpXRRo3AgMBAAGjggI1MIICMTAOBgNV
# HQ8BAf8EBAMCAYYwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFNlBKbAPD2Ns
# 72nX9c0pnqRIajDmMFQGA1UdIARNMEswSQYEVR0gADBBMD8GCCsGAQUFBwIBFjNo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5o
# dG0wGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBTIftJqhSobyhmYBAcnz1AQT2ioojCBhAYDVR0fBH0wezB5oHeg
# dYZzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0
# JTIwSWRlbnRpdHklMjBWZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUl
# MjBBdXRob3JpdHklMjAyMDIwLmNybDCBwwYIKwYBBQUHAQEEgbYwgbMwgYEGCCsG
# AQUFBzAChnVodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01p
# Y3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0aW9uJTIwUm9vdCUyMENlcnRp
# ZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcnQwLQYIKwYBBQUHMAGGIWh0dHA6
# Ly9vbmVvY3NwLm1pY3Jvc29mdC5jb20vb2NzcDANBgkqhkiG9w0BAQwFAAOCAgEA
# fyUqnv7Uq+rdZgrbVyNMul5skONbhls5fccPlmIbzi+OwVdPQ4H55v7VOInnmezQ
# EeW4LqK0wja+fBznANbXLB0KrdMCbHQpbLvG6UA/Xv2pfpVIE1CRFfNF4XKO8XYE
# a3oW8oVH+KZHgIQRIwAbyFKQ9iyj4aOWeAzwk+f9E5StNp5T8FG7/VEURIVWArbA
# zPt9ThVN3w1fAZkF7+YU9kbq1bCR2YD+MtunSQ1Rft6XG7b4e0ejRA7mB2IoX5hN
# h3UEauY0byxNRG+fT2MCEhQl9g2i2fs6VOG19CNep7SquKaBjhWmirYyANb0RJSL
# WjinMLXNOAga10n8i9jqeprzSMU5ODmrMCJE12xS/NWShg/tuLjAsKP6SzYZ+1Ry
# 358ZTFcx0FS/mx2vSoU8s8HRvy+rnXqyUJ9HBqS0DErVLjQwK8VtsBdekBmdTbQV
# oCgPCqr+PDPB3xajYnzevs7eidBsM71PINK2BoE2UfMwxCCX3mccFgx6UsQeRSdV
# VVNSyALQe6PT12418xon2iDGE81OGCreLzDcMAZnrUAx4XQLUz6ZTl65yPUiOh3k
# 7Yww94lDf+8oG2oZmDh5O1Qe38E+M3vhKwmzIeoB1dVLlz4i3IpaDcR+iuGjH2Td
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcyMIIXLgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDQCEzMABCpi
# ODYL8LtS2EQAAAAEKmIwDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgspAb
# Dn+JdJYnPDAvxxGZ0eNOTC7UtNE4ghqyW3cYQuwwDQYJKoZIhvcNAQEBBQAEggGA
# wrfOv97VA24Jdexd388bJqp784o33+C4mx1suz3WSod4+uf8K6l/4vy8uN/34Wdu
# c5LO6w9KgoeyFeBIyrypirPEyLdQ4Pd3yP/2U5ejuMj819OZkxjEksYmjG2CGnGZ
# 8MNXK+yAq3PcFe+1pYLbQqvRlaP7DpWUxF4IJP6515EcrJ5ogOdkWREH4oB5utE5
# fpOdwlphdupOyckUyfQxCUPFEGf1GWeUxRV6GktrLcIvDP4DBffRay7lLwkPt2kM
# xvxGZFjBJnOmSAa3a4ztM1elLoAUhKc3ZQ9L4ZDk9G5XXIf92mbDWJTiTIOkq8gS
# WIJjau7Ra1M/KEVtuovKtVRfdQVm7CGmFeDFsIn7bc6RrmjHZpcR6whf8yj9Dck/
# HdFmiENWsRTRLxDl6NoioNmLWDvW1u/X8BkDO3as+X1Yus2w+bhUuyYOgEVxpo3h
# /4mdiRilbwlO/Utj9cf4NT1qeAqAmtg8s+quWtMvyXvgKoD7g7CEp25XP3O+0dEx
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIFnwwbGRhYblyPEQoXvS
# raiRVQJlLPi6wNOTupD/5qSoAgZqNWdtwygYEzIwMjYwODAzMTI1MDU1LjMzM1ow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYD
# VQQDEyxNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0
# eaCCDykwggeCMIIFaqADAgECAhMzAAAABeXPD/9mLsmHAAAAAAAFMA0GCSqGSIb3
# DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24g
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAyMDAeFw0yMDExMTkyMDMyMzFa
# Fw0zNTExMTkyMDQyMzFaMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRp
# bWVzdGFtcGluZyBDQSAyMDIwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEAnnznUmP94MWfBX1jtQYioxwe1+eXM9ETBb1lRkd3kcFdcG9/sqtDlwxKoVIc
# aqDb+omFio5DHC4RBcbyQHjXCwMk/l3TOYtgoBjxnG/eViS4sOx8y4gSq8Zg49RE
# Af5huXhIkQRKe3Qxs8Sgp02KHAznEa/Ssah8nWo5hJM1xznkRsFPu6rfDHeZeG1W
# a1wISvlkpOQooTULFm809Z0ZYlQ8Lp7i5F9YciFlyAKwn6yjN/kR4fkquUWfGmMo
# pNq/B8U/pdoZkZZQbxNlqJOiBGgCWpx69uKqKhTPVi3gVErnc/qi+dR8A2MiAz0k
# N0nh7SqINGbmw5OIRC0EsZ31WF3Uxp3GgZwetEKxLms73KG/Z+MkeuaVDQQheang
# OEMGJ4pQZH55ngI0Tdy1bi69INBV5Kn2HVJo9XxRYR/JPGAaM6xGl57Ei95HUw9N
# V/uC3yFjrhc087qLJQawSC3xzY/EXzsT4I7sDbxOmM2rl4uKK6eEpurRduOQ2hTk
# mG1hSuWYBunFGNv21Kt4N20AKmbeuSnGnsBCd2cjRKG79+TX+sTehawOoxfeOO/j
# R7wo3liwkGdzPJYHgnJ54UxbckF914AqHOiEV7xTnD1a69w/UTxwjEugpIPMIIE6
# 7SFZ2PMo27xjlLAHWW3l1CEAFjLNHd3EQ79PUr8FUXetXr0CAwEAAaOCAhswggIX
# MA4GA1UdDwEB/wQEAwIBhjAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQUa2ko
# OjUvSGNAz3vYr0npPtk92yEwVAYDVR0gBE0wSzBJBgRVHSAAMEEwPwYIKwYBBQUH
# AgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0
# b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMA
# dQBiAEMAQTAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFMh+0mqFKhvKGZgE
# ByfPUBBPaKiiMIGEBgNVHR8EfTB7MHmgd6B1hnNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZlcmlmaWNh
# dGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIwMjAuY3Js
# MIGUBggrBgEFBQcBAQSBhzCBhDCBgQYIKwYBBQUHMAKGdWh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwSWRlbnRpdHklMjBW
# ZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUlMjBBdXRob3JpdHklMjAy
# MDIwLmNydDANBgkqhkiG9w0BAQwFAAOCAgEAX4h2x35ttVoVdedMeGj6TuHYRJkl
# FaW4sTQ5r+k77iB79cSLNe+GzRjv4pVjJviceW6AF6ycWoEYR0LYhaa0ozJLU5Yi
# +LCmcrdovkl53DNt4EXs87KDogYb9eGEndSpZ5ZM74LNvVzY0/nPISHz0Xva71Qj
# D4h+8z2XMOZzY7YQ0Psw+etyNZ1CesufU211rLslLKsO8F2aBs2cIo1k+aHOhrw9
# xw6JCWONNboZ497mwYW5EfN0W3zL5s3ad4Xtm7yFM7Ujrhc0aqy3xL7D5FR2J7x9
# cLWMq7eb0oYioXhqV2tgFqbKHeDick+P8tHYIFovIP7YG4ZkJWag1H91KlELGWi3
# SLv10o4KGag42pswjybTi4toQcC/irAodDW8HNtX+cbz0sMptFJK+KObAnDFHEsu
# kxD+7jFfEV9Hh/+CSxKRsmnuiovCWIOb+H7DRon9TlxydiFhvu88o0w35JkNbJxT
# k4MhF/KgaXn0GxdH8elEa2Imq45gaa8D+mTm8LWVydt4ytxYP/bqjN49D9NZ81co
# E6aQWm88TwIf4R4YZbOpMKN0CyejaPNN41LGXHeCUMYmBx3PkP8ADHD1J2Cr/6tj
# uOOCztfp+o9Nc+ZoIAkpUcA/X2gSMkgHAPUvIdtoSAHEUKiBhI6JQivRepyvWcl+
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAW0q1jUEybdx0AAAAAABbMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwNVoXDTI3MDEwNzE4NTkwNVow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAJBUzBbbnlDXee0B0KD5G4/475thFyfctCyu
# ESTWQXvlLi4Wx/td2qUdeq4ideeg6VWhiOHfu3wJV4TUGSRtqh9Ccr1BmiBKv9iu
# FpgHyIBu5Qx38ZsxwlFeXVS+ZqJJKnXRbDNQdcYSoC/6c0hQJ/PH50DBRDQkPXVw
# yFizLrRH9AlrJeUg7BKeT23zftS8/KOJLvEEbHOF6pSOY3ZVprZUWbWjWwRTmoHa
# Q/E8vrWtLNyEJ+b089VW1Ikra3t4GTB5Wby3CL1K2zYnAxBIvafsKMFyj9OuXHcT
# PKMDoFSMeamG9MKOMb6uoG1PjdnDgsLP6EOMRSzrLL7jED1mbB9RSd9fhty+HQr6
# vZgsBn6oUy+YTpNVLskwdtUM82WYAkPztlOt3AiL0qyV7/U3j/uq3vHMjPM0w034
# 0M57Nei0g4BCcMt0dbqoc91VgCb3/36sHQANontn1HOF2oLk8190QRS43isHVra8
# H8sf5+GlqIYsYiCKX04HZiOzZW826nVI6d++8lyTeWmpj90Ua9uPbJhVjwE3oh6t
# O510ySqmSMSLEN07p3Ibe3E6BAb2w93rWzb26+dpSthbKF4kApofqBsWPX4MEtHK
# SOftPmVTCQ47tghrVuHia9jY+Hsj01m4KW4WtkmVm3L6hMZECMa4sjMxAXz+bX/A
# JhWTe6TZAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQU7/LqUlWWYhXJdXwgYKx4b8Gv
# 0rYwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQAAH+zd+XKh4OxXYMWFmtgilXAQGctOjCUB1w/uBiC/OXcH
# 3Ia4/XbdUhKzFbaiTbIE6vYZKd1p4u7nKOLkawymAMVyuO7LSl6rLKttZIyLhWjT
# K0zXOz0u4xLq9+bRtBEKJvA6sD5nJwH1IO6z1YizyuIRoalMCnbrUixfWxQn4TAm
# N7t9uk+X2FUThEa3ewzRwhtG+xwaAbLMkxRmR24JnfXd1VxKo90+m7Wzuov96Uug
# x5wZdewiIIm1ZWTj4lCJHup679LcOa7tAxJMipVaSltQH9fm9TOKczlfxtWuBcLU
# 4duZfqwgsILsH7PMkcX1zwQzQD0yAtPhnYz9KNG125bX+iilOe1S8RHqv2bbBpMp
# ao4kcUvQI6dMgKRvFmm1eLbhSNOQplDMTGD1tNVdNGkI96jUu+troUjWMMi46TQf
# BAHxtDTpRhIu/87vAVQ8Z6RHhFxesz4Ed5JThaIQRAy6GcO/Jk+QzDzoZ0arRIkI
# sGJ7rZgOVAjx9ctfw8lH9RfjcwB3wdGBYNMNVJqQpUai2Taddf5pXzTZEHIqLEF5
# 3SrBjIeInoQrP7U5VlXiMQsxewLdINrAE2l2TR3KBikb+RQRygbTp8jj2yiC0NCU
# wG+K+ndglN5RMbXjFW6aKa59Xq+b8XzK/DK+AJtgOpHgJv8Qrk62A+twOVLOpjGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABbSrWNQTJt3HQAAAAAAFswDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgCiDOp79ol+qUIz5GpxJOveP7Co4AZAu4bA2Py98LJB4wgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCAvMQNVXZ0b0xxlGw8X/3IEybObuT6a5W1d61CW+cGD
# 7zB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzAiBCAbqG4YmPPZjXQMdTxD
# kTahOynpFQpsK7T7qt7engOZRjANBgkqhkiG9w0BAQsFAASCAgAKSPa9drSZCbR+
# 1mwMXURhIBtXOvSw2iDqGCtdDmFFDrZKl3v8f+Dx/siEDZ6yu8lmix9l6EDts5VC
# LfXrlCP1qacrsuNf+ctPWInvBB+p2I6kn1KxHrEfcPSxQ6BEQonTXri7VfWYgxK4
# YDPEb8JTQypsnO+3knA2GlgxHUxr+fWbDQFYKoIrDEPHIJEsTlmDWasD8OxLWpB3
# 9brwF9BKFe7uLkdl2kf89e57VxxgnhIDSITWR0F12PEFx+Vn0r8cgnGM0/kMA01K
# TSXd45sG5JcUQ5Cr7lEPlhticxE36v/Ja+mHwABITTf0JL4qMNJJSetkXFgvN6ed
# PlUwnQPA8VkxLJ7kGZ1bQaHp9AKqbP3v87i5g8DVkMZxD/dKGi1WneHHPVQtQaea
# s2P1jt+doRABBCdOMGrBXn9Y5C98ieY2L+QpIbHUj/+AShCllHA2aZ3ABinwd1sH
# hMvLGKsvQLJLgDekFl41DROSiSrri3hP+LMs9S/rSGaBXE0MRJ9JpZqK7x6OoIkt
# hMIfYBoeyO+RJgo9bc4PNKS1cnwpgf0KZXB363z9UE71RFjS0XSuSXxp8m//07pm
# +a2wJ9Kj/keKIahqlB3uIPFWQdj3KQ5hY8TcL1dsLaZqKQx4I3e7BmUA0SVE0JF7
# oqSbB4l/m9wTFQKgRlBC8DT99kQ6iw==
# SIG # End signature block
