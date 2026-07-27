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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAOxfsGE
# dAui3IWtAAAAA7F+MA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYwNzI1MTkyNjEwWhcNMjYwNzI4
# MTkyNjEwWjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAoVDcAOz6TalWG9vfNlA6qVCD
# mLVli6Uc0fGG8EYUEtFVVtMWj2XauPbRgJ5oJxZpyvJb7jIWhZOjLHB8u/nDaJ77
# HsqfjiBgteEkOqZaMd2Lc7bn/cJU51jf0/folLa7iEfwlIukDrNBgpwTVJuPLbTQ
# 4hZDA+xFCZN8RikowtnrlQjN9gNn5Oh6jgPou7cz5AkfdWpj5Rp4NGV0cctYt6da
# uE/Wa5B1Q/NB8Zz2C2o3bmJ/fYeBwnuMVrhaeff6lBykWH6fixbw/FHECpGxgxBe
# jU0yFvhoO+SpDlIaejRq4IIxyeUHJNrTE8Mk8nU+T7x4i27MNHwsVvPn5vdozRhB
# JNR9eg1j/RzwhqZ3SoRuV2ne26xhG9UJw/2bv9rDdaBf2GP6nyKf+FmdFyCb1Y2D
# yygS3t/5FptjNcceOUIQZSpcjXJ/HJnnfdbCURshMzHhQ4mUzFuJLZtNiBFQ3uop
# E80PvLmNSA9sEyjXd4nyUm2SKfqpwyq7H+TMQs4DAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# rDk4FlKL6gGHF9FRtMEug2P8gT0wHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAMA0
# 8eOioaqDx9G96lr+ahHtFnpfHg0df91iir8LIKh7IguajVeIgFiOWOjYLWpFpRe+
# fMzvj5duooOeZChlHXFJVouSI0n3ooqmSakikUoVL8NJ4QHmppscUO7KaPzcVyyS
# Anq1LL7sfC3Z4sk2a0iFriXc90EcJ+StLU96tUUeJps15d0m5HRe+VQ0WmjepIrH
# H8kPYNDMtpxyMu5LvJdKDS02RdK4ZM0yvoMx70LdRuRAuNCUze3JovLjv4jprp/A
# BgEfMvE5Au7PMQEgAL50FM8jREQRtHWl9xaQFJwEgo62XQ1SVC3MKTc2SGb3Qke+
# re5a1KCRa6QOEof6F0fX6IDP1Mc9iRzdUdnZZ9Lu6OBsG/3j8LC6GVXePMcbogM9
# /oVizBQXwrAMCZEhwoGCQmxM18pRW1/Dq68I0dWCiIptqZE/fz2XrrvJktn/evdN
# EvlUk7cbsw0Aeeoy+8ju5N5jY98R4v44oUAkAhT7HvrU0k5dISUhNVHJbmjSEPWk
# 2K/sEYAEZAMfuK4KqTN3pSFNQttSdZs/3pqOtK+UW/tOWYO8hGskOwoo9MhxvYIK
# 9UaUyDcO0Fz7QBzO3DIZJMEY5jllHy1YH5ZZ8/Kmy7l0v2xuTMsVi1JN1laH8/R6
# TCSMIjo+8TJhm2VpA+PzG/wjcBbgSPYMLBiVSKH+MIIGwDCCBKigAwIBAgITMwAD
# sX7BhHQLotyFrQAAAAOxfjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MDcyNTE5MjYxMFoXDTI2
# MDcyODE5MjYxMFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAKFQ3ADs+k2pVhvb3zZQ
# OqlQg5i1ZYulHNHxhvBGFBLRVVbTFo9l2rj20YCeaCcWacryW+4yFoWToyxwfLv5
# w2ie+x7Kn44gYLXhJDqmWjHdi3O25/3CVOdY39P36JS2u4hH8JSLpA6zQYKcE1Sb
# jy200OIWQwPsRQmTfEYpKMLZ65UIzfYDZ+Toeo4D6Lu3M+QJH3VqY+UaeDRldHHL
# WLenWrhP1muQdUPzQfGc9gtqN25if32HgcJ7jFa4Wnn3+pQcpFh+n4sW8PxRxAqR
# sYMQXo1NMhb4aDvkqQ5SGno0auCCMcnlByTa0xPDJPJ1Pk+8eItuzDR8LFbz5+b3
# aM0YQSTUfXoNY/0c8Iamd0qEbldp3tusYRvVCcP9m7/aw3WgX9hj+p8in/hZnRcg
# m9WNg8soEt7f+RabYzXHHjlCEGUqXI1yfxyZ533WwlEbITMx4UOJlMxbiS2bTYgR
# UN7qKRPND7y5jUgPbBMo13eJ8lJtkin6qcMqux/kzELOAwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFKw5OBZSi+oBhxfRUbTBLoNj/IE9MB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQDANPHjoqGqg8fRvepa/moR7RZ6Xx4NHX/dYoq/CyCoeyILmo1XiIBYjljo2C1q
# RaUXvnzM74+XbqKDnmQoZR1xSVaLkiNJ96KKpkmpIpFKFS/DSeEB5qabHFDuymj8
# 3FcskgJ6tSy+7Hwt2eLJNmtIha4l3PdBHCfkrS1PerVFHiabNeXdJuR0XvlUNFpo
# 3qSKxx/JD2DQzLaccjLuS7yXSg0tNkXSuGTNMr6DMe9C3UbkQLjQlM3tyaLy47+I
# 6a6fwAYBHzLxOQLuzzEBIAC+dBTPI0REEbR1pfcWkBScBIKOtl0NUlQtzCk3Nkhm
# 90JHvq3uWtSgkWukDhKH+hdH1+iAz9THPYkc3VHZ2WfS7ujgbBv94/CwuhlV3jzH
# G6IDPf6FYswUF8KwDAmRIcKBgkJsTNfKUVtfw6uvCNHVgoiKbamRP389l667yZLZ
# /3r3TRL5VJO3G7MNAHnqMvvI7uTeY2PfEeL+OKFAJAIU+x761NJOXSElITVRyW5o
# 0hD1pNiv7BGABGQDH7iuCqkzd6UhTULbUnWbP96ajrSvlFv7TlmDvIRrJDsKKPTI
# cb2CCvVGlMg3DtBc+0AcztwyGSTBGOY5ZR8tWB+WWfPypsu5dL9sbkzLFYtSTdZW
# h/P0ekwkjCI6PvEyYZtlaQPj8xv8I3AW4Ej2DCwYlUih/jCCBygwggUQoAMCAQIC
# EzMAAAAYDeuRVamKAJgAAAAAABgwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMzJaFw0zMTAzMjYxODExMzJaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDIgNpgNFaiif2VWeWP5I6PnFXxJ/lB37fJR55GCvR7GLZBMkBijbiKVwgp
# BI3xM5nf484znH/qncJ+OCq6y3jgnQW+R8Zd7U+7LjlrmcskalzSQ0ghMxEpnBW8
# /HHs2V8ZJzQk6HP+SDsbvsL7LdlH/eO2l4mknhDBwr0Z/Q966TvEth5b8kCxj1vq
# iV4YNthLGRqZR9u2fK/yBMWu83p6O4uo2Edg++gEew5IL7vnnnKFqmSh/R9vPJy3
# WF1YcZewAUx8sXZNUnx3ZhVg59l2LpitPiwzE6FMqIsqaEvVe3MzuFd2a/uWDZH6
# VbDyUiRK78mIg1DQYA9zDEyyBFcNI+nxVSzglvL6u7PRuNqgcV3sf6ELxw89ysQM
# /Z4R1hRFWXRpyOWKKAKtfBHTk0UnNiPcxmLMMYs8jeUjOidfVPjTIry/UVwnwxdl
# kK85cZfBEMYZ/DBNOwdomP459Y1n8izKkbhsa+p4lw+cQVxATBFx9ggR79HhryT7
# HDmpPLvkJvBZ4wW4CW32UT2SMyDe28nIOU3m+hfHlVeKcLBQcym5VoRDjIcCVI7u
# qgGW2PNME0cfei8zCwCy6HCsssJWFS7eg/YbFhnATJcyWfMrkNuAbMfMN8Npg8cr
# S6jVVowyD0GG5zdgi+uQVcSK/638mA1xEYK3pnIoQgO09uuDBwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBSk
# Qwx/dlqlhec+jSgPDBeiRWlwxjBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQBxxyBW+X6mhdRiSwD9PMMWcGUAnx5/QUwnNvZdFGEX+4DR
# DIr9WCh4C87wHtw+lg1D3uzK10DstPX0LFLBFAC3vWMYX4ImXwoLhoR0xlN8mUdo
# rJ3bgnpCJWuI1531Z1rCwPuUrSkBxfOIGDk3p2ECb3Ho/xHi5PRSR/OUrWuQHwXi
# aXMTuXu3IRLezwVkZpFmNwYRD57R9Nx2F/yM7tzOY0Hh0hGCaYEK38/6FrS0SXad
# XWyDUCfn5XOGACRjUCnHx+JQUG0f4SHD+iblpAI0gl+ZHnVmdXXxHTZeTa0CYCIh
# FxKP2922s0g6zLmeiV13LWUmtt/UF7TrWXpMi2/0UNniaDoH7rnPGRV5xVX8uXy4
# sZii4aswzqPM7Y7+mzcranqZ8EjZk5gjLhQ3A2sZaprlOu8CaRmyfcIiVH7zVfgA
# vm81MWXFziAf7my7QOvnyEFPGddq8MSfPtfRyw/Uq3uH6KpoaJNIfPYH6fceZSi5
# 3Rat1A9grExq3ROjhhSpTcchuBItAMNVPxoKNbUm+iR/X3XkL+9WQginjyHe+hXL
# clY8vAGXFD1p40PqMIpAYsmEJBFKW9df4//1N5oQDr/FY9IBJl/oSS979i5rtT7N
# Zz9KvYraCPRBGs0QCy+sWvgQa0coM70QJVLeVwmSxUO/0od0w9Qry7bSLrxGoDCC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAA7F+
# wYR0C6Lcha0AAAADsX4wDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgspAb
# Dn+JdJYnPDAvxxGZ0eNOTC7UtNE4ghqyW3cYQuwwDQYJKoZIhvcNAQEBBQAEggGA
# nBiMq3MDM4k0qspKCvOTO6Fn0zK9NGgmKi0nmgAaf6IggrSc4kB2R/p7BlPRfjmi
# NDdrXWX00/+ELQ5O4ZHIR3Vz0ehLMaHPruaIfLNj/16rKghiZTEejBr249GdQKKS
# qgcYNBbSpb7tECaCfXpaOzZwGrNtLr0Uadrl9q3WQE4T34bF/zp1LKUekFkodXMV
# 6ey5GzHIDK4ZUoaXfGOiczrdB4RQIWL1nNRSItuMovuXAuTxGCgDX4mNQzWS1Qvz
# H3K/UMFebAgWoYMVtx/8EwCF/JUgqYVP3eHIxYYbX6d5u2jJw+7HA7Ll6M/BQDdJ
# iMVsBGGpHuzHFZhRbIPIAnsm2xNx8+URFZKZ7uOQM/qOHE4ZGEu1Z8o0/jTxenov
# DnY7I4aXj4QbvGK+RPq03opUKaOb5uN0IhzJf/zSpMkAMexP7W27h8FeGhJOsScr
# 7lWq6CQ36boZEjCpR8Ujz8QnnKmxMUevQTALE0CLOz+RnPem0LhF2/x3PtNMatX5
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEINiZF7IPx6Qoy3N26TV3
# fE5GAfLnD2bRqhXLNlofkMo2AgZqY0xd99QYEzIwMjYwNzI3MTMxMDI0Ljk3Nlow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjdCMUEtMDVFMC1EOTQ3MTUwMwYD
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
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAWXzacemNXvXAAAAAAABZMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwMVoXDTI3MDEwNzE4NTkwMVow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjdCMUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAKYu5/40eEX+hT+5jFa146bid3dA4LnXYntv
# kP3CGw4LGARFhnvLMSJ/VtsubzDaeFnm7yb2KSM70WmHQprdCVqpvUH7l0uB4jNw
# 7urLoAR9kKHLE0VlMlDStDSxUBI3qwsdrjvdmvV0k+9/njuDEiSlzJTf7Dowd1K3
# bO4beRyaFhR+Y8tymECOqlOAffYrG2wZdVM51+QSBSe+PEykr8C6OnnqSipuF8fZ
# vCb6/huk0Zm6ZwsaixSHIAT2IEGvS7c63Im8jV3a8R0K6i2yiw0NNlnTSpwy/Zfv
# 7iwsLBwhfbjBTn+XOl6mPzDXQQ3V+SRP9xXbGKOsBTxzGid7aKAHw3o4Ahl9UGWL
# H9kNP3VUokE6JYkjlfpuUGZ6gQyqDewfxD4VoYIlopt4HZ0xQvqajuJx+cr8LR/I
# Z56gLLmwyMzde5+vtjBoilry/gSZwVGwgkvkIgpKPBQHGsSB0y3szr7Y7wEb6v0y
# Zal1XUvWnnz3inTaSWsCFrLPVwVmXy3ncY5/d25VpOkht+m697GWNbvsNOhAOHRa
# ftE9j/hhkoM6RsyJfBLnhqMcA/wcavf5oj5NeyRQdGZeLKcls9csKS3sBUzPidxx
# 2iiNH9CPaDq/bLJEOXasYohXMnRinu+fUk81s8VO7DQSF6ffn5oqSHoV8lf1Ax6u
# +kdShb8BAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQUj5bnC18D0vlnSRhCOiODGGuX
# NnYwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQBEMhzC/ZcjpG/zURE7z2Yp5vrUxUjsE5Xa3t/2RGvESwvb
# msk3bLHhSFAajgo2XQ8xoGDP3sUhKCLPeICSbkVv6V8sSp8fJ8Jos6yrawf2YVis
# 8tcV+OO7U9S6JGPQzpmPncfzQc4ne1fqZ4+HiKabIDEoFdddQT2Egkk9fzxCY/EZ
# 52avJ27dSfrI/IDmyn9V10O3iQpg2F+C9vNTrk7nVgoDoHa9+Q3pYr0IHGnSmt5i
# rgGT436zo5WnXP8FxMhswH1aiyiSZiVzhor10C9C52cP3C8/PEoMKUXstLjoPO0T
# MkeW/1Fr186KXD45QRgBo0xImgtWTdzWFnlD+p7+iDBIuSrNcRXDRYuq/aYZaDhW
# SI0SYdPIWVh5XvXuWA31a8oQ0SO+oPa3Nk80k0864wiiyJ1KsbSnaaefg9vspegh
# rpY8ljCwxfCUtx5HQRNgAJOI8IKACK4d014Mk0hlRO0lQVRHegqIg29K6Xqkc360
# W2ZJGUcstlKokkVj6KAHjGyrLRPzepYfiZUJq4gXyxbpvKb1XJ2FN2682aUoNXo9
# RyRK1ch0f66k6+yj88kzvuC7+vJWtNDs/UpIM6Hhm0kU64JUJ7MMEQcAc7kpft7G
# m7YeRK+oKgqUgYXCfmzbX8nJXJZnPa8ADWVsIqsuNAxCI0CZXkULofqo5Be6zzGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABZfNpx6Y1e9cAAAAAAAFkwDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQg5aOMGbdNi8XHkIiQTZVNEi/ztyRCl2qtzvEwHJUAX2owgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCDCIbzA/sTJ9lK41E2E
# e3HD+l/k7kSAMB0qHDpqQwel0DANBgkqhkiG9w0BAQsFAASCAgBsNS5uK9dkc9Mx
# HS3r0NnbybXSEpQfARsFiBDbPsOmyWe3mxzP5n91dCMERFVUkUj+EAVomu1kMD40
# mAv2MEB7z+y6RhcRkMiQw9d8696fRraBEgSGs5ZxazIFqh07f6IAqSY2jGGPTh22
# 0WFi6pvyWSwn/Dc7mQ/iv3Z4h6FgGas7XsRRneN4MYJuokAIr/4Vqet+bZG0t2sO
# hdLEFk66gHUbJxDGQKKXUCiizrJse4J1C8N4PmR9cByVFtmIq2pHsFM9ML5IKPHK
# VySgxnYvix2xdDTPFC4+uYiY0DYBcKcW4WqVimahu5YJDthjV2m7Q8CTLweaJTik
# prl6V5VoO0NRfd7uIBqfKpUZYKuhG7BfhmNxBHOgi0ubsFlvVROA6vKuG5ra++vZ
# FV4qZK5W+CRHICK1WfyOcDbBcFupnibXL5vFTajT6LD1WFluxebt4XBVZStK4+Lz
# 7p4OBhAJ5Kfh13M0GbJiQJyBMuPgGN0WxzSavYH48JsajVm+zDGYgOW9u7G3NKdB
# +Av0UDd42Nhi/6oDPlVJv2O8//YNxU1FpPoSKgnq5EPTT3fhrhj45aOHLoYzplSP
# 6KhsCylBzTaMbBZE01xal51FkdZkvz5SHRT+FpPkbKpgl7ttzp4Kr01PC1QZA6o5
# x0075qTip9s7V4QnBtijUhm8Fy4BKQ==
# SIG # End signature block
