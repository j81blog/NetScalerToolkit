# Generated NetScalerToolkit Configuration bundle for category 'audit'.

# region Invoke-NSAddAuditMessageAction
function Invoke-NSAddAuditMessageAction {
    <#
    .SYNOPSIS
        Creates a NetScaler auditmessageaction resource.
    .DESCRIPTION
        Configuration for message action resource.
    .PARAMETER BypassSafetycheck
        Bypass the safety check and allow unsafe expressions. Default value: NO Possible values = YES, NO
    .PARAMETER Loglevel
        Audit log level, which specifies the severity level of the log message being generated.. The following loglevels are valid: * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
    .PARAMETER Logtonewnslog
        Send the message to the new nslog. Possible values = YES, NO
    .PARAMETER Name
        Name of the audit message action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the message action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my message action" or 'my message action'). Minimum length = 1
    .PARAMETER Stringbuilderexpr
        Default-syntax expression that defines the format and content of the log message.
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
        Invoke-NSAddAuditMessageAction -Name 'example' -Loglevel EMERGENCY -Stringbuilderexpr 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAuditMessageAction -Name 'example' -Loglevel EMERGENCY -Stringbuilderexpr 'example' -WhatIf
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
        [ValidateSet('YES', 'NO')]
        [string] $BypassSafetycheck,

        [Parameter(Mandatory)]
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [string] $Loglevel,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Logtonewnslog,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Stringbuilderexpr,

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
    if ($PSBoundParameters.ContainsKey('BypassSafetycheck')) { $properties['bypasssafetycheck'] = $BypassSafetycheck }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Logtonewnslog')) { $properties['logtonewnslog'] = $Logtonewnslog }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Stringbuilderexpr')) { $properties['stringbuilderexpr'] = $Stringbuilderexpr }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create auditmessageaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditmessageaction -Payload @{ auditmessageaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditMessageAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAuditMessageAction

# region Invoke-NSAddAuditNSLogAction
function Invoke-NSAddAuditNSLogAction {
    <#
    .SYNOPSIS
        Creates a NetScaler auditnslogaction resource.
    .DESCRIPTION
        Configuration for ns log action resource.
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log the ALG messages. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY - U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER Domainresolveretry
        Time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the audit server if the last query failed. Default value: 5 Minimum value = 5 Maximum value = 20939
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Audit log level, which specifies the types of events to log. Available settings function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log the LSN messages. Possible values = ENABLED, DISABLED
    .PARAMETER Name
        Name of the nslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog action" or 'my nslog action'). Minimum length = 1
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerDomainName
        Auditserver name as a FQDN. Mutually exclusive with serverIP. Minimum length = 1 Maximum length = 255
    .PARAMETER ServerIp
        IP address of the nslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the nslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Available settings function as follows: * GMT_TIME. Coordinated Universal Time. * LOCAL_TIME. The server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to nslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSAddAuditNSLogAction -Name 'example' -Loglevel ALL -PassThru
    .EXAMPLE
        Invoke-NSAddAuditNSLogAction -Name 'example' -Loglevel ALL -WhatIf
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
        [string] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [string] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Denylistviolations,

        [Parameter()]
        [int] $Domainresolveretry,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [string] $Logfacility,

        [Parameter(Mandatory)]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [string[]] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Lsn,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $ProtocolViolations,

        [Parameter()]
        [string] $ServerDomainName,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SSLInterception,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberlog,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [string] $TCP,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [string] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UserDefinedAuditLog,

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

    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) {
        Assert-NSParameterValue -ParameterName 'ProtocolViolations' -Value $ProtocolViolations -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'NONE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Acl')) { $properties['acl'] = $Acl }
    if ($PSBoundParameters.ContainsKey('Alg')) { $properties['alg'] = $Alg }
    if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $properties['appflowexport'] = $AppFlowExPort }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $properties['contentinspectionlog'] = $ContentInSpecTionlog }
    if ($PSBoundParameters.ContainsKey('DateFormAt')) { $properties['dateformat'] = $DateFormAt }
    if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $properties['denylistviolations'] = $Denylistviolations }
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('Logfacility')) { $properties['logfacility'] = $Logfacility }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Lsn')) { $properties['lsn'] = $Lsn }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $properties['protocolviolations'] = $ProtocolViolations }
    if ($PSBoundParameters.ContainsKey('ServerDomainName')) { $properties['serverdomainname'] = $ServerDomainName }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('SSLInterception')) { $properties['sslinterception'] = $SSLInterception }
    if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $properties['subscriberlog'] = $Subscriberlog }
    if ($PSBoundParameters.ContainsKey('TCP')) { $properties['tcp'] = $TCP }
    if ($PSBoundParameters.ContainsKey('Timezone')) { $properties['timezone'] = $Timezone }
    if ($PSBoundParameters.ContainsKey('URLFiltering')) { $properties['urlfiltering'] = $URLFiltering }
    if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $properties['userdefinedauditlog'] = $UserDefinedAuditLog }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create auditnslogaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditnslogaction -Payload @{ auditnslogaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditNSLogAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAuditNSLogAction

# region Invoke-NSAddAuditNslogglobalAuditNSLogPolicyBinding
function Invoke-NSAddAuditNslogglobalAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler auditnslogglobal_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to auditnslogglobal.
    .PARAMETER GlobalbindType
        . Default value: SYSTEM_GLOBAL Possible values = SYSTEM_GLOBAL, VPN_GLOBAL, RNAT_GLOBAL, APPFW_GLOBAL, TM_GLOBAL
    .PARAMETER PolicyName
        Name of the audit nslog policy.
    .PARAMETER Priority
        Specifies the priority of the policy. Minimum value = 1 Maximum value = 2147483647
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
        Invoke-NSAddAuditNslogglobalAuditNSLogPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddAuditNslogglobalAuditNSLogPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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
        [string] $GlobalbindType,

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

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

    if ($PSBoundParameters.ContainsKey('GlobalbindType')) {
        Assert-NSParameterValue -ParameterName 'GlobalbindType' -Value $GlobalbindType -AllowedValuesByVersion @{ '13.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL'); '14.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL', 'TM_GLOBAL') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('GlobalbindType')) { $properties['globalbindtype'] = $GlobalbindType }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('auditnslogglobal_auditnslogpolicy_binding', 'Create auditnslogglobal_auditnslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditnslogglobal_auditnslogpolicy_binding -Payload @{ auditnslogglobal_auditnslogpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddAuditNslogglobalAuditNSLogPolicyBinding

# region Invoke-NSAddAuditNSLogPolicy
function Invoke-NSAddAuditNSLogPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler auditnslogpolicy resource.
    .DESCRIPTION
        Configuration for ns log policy resource.
    .PARAMETER Action
        Nslog server action that is performed when this policy matches. NOTE: An nslog server action must be associated with an nslog audit policy. Minimum length = 1
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog policy" or 'my nslog policy'). Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, that defines the messages to be logged to the nslog server. Minimum length = 1
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
        Invoke-NSAddAuditNSLogPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAuditNSLogPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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
        [string] $Action,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Rule,

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
    if ($PSBoundParameters.ContainsKey('Action')) { $properties['action'] = $Action }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create auditnslogpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditnslogpolicy -Payload @{ auditnslogpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditNSLogPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAuditNSLogPolicy

# region Invoke-NSAddAuditSyslogAction
function Invoke-NSAddAuditSyslogAction {
    <#
    .SYNOPSIS
        Creates a NetScaler auditsyslogaction resource.
    .DESCRIPTION
        Configuration for system log action resource.
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log alg info. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY. -U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER DNS
        Log DNS related syslog messages. Possible values = ENABLED, DISABLED
    .PARAMETER Domainresolveretry
        Time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the syslog server if the last query failed. Default value: 5 Minimum value = 5 Maximum value = 20939
    .PARAMETER HTTPAuthtoken
        Token for authenticating with the endpoint. If the endpoint requires the Authorization header in a particular format, specify the complete format as the value to this parameter. For eg., in case of splunk, the Authorization header is required to be of the form - Splunk <auth-token>. Maximum length = 256
    .PARAMETER HTTPEndpointURL
        The URL at which to upload the logs messages on the endpoint. Maximum length = 256
    .PARAMETER HTTPSChemaFile
        HTTP Schema file to input tokens to be sent in log message to log server. Maximum length = 256
    .PARAMETER LbVServerName
        Name of the LB vserver. Mutually exclusive with syslog serverIP/serverName. Minimum length = 1 Maximum length = 127
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Audit log level, which specifies the types of events to log. Available values function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log lsn info. Possible values = ENABLED, DISABLED
    .PARAMETER Managementlog
        Management log specifies the categories of log files to be exported. It use destination and transport from PE params. Available values function as follows: * ALL - All categories (SHELL, NSMGMT and ACCESS). * SHELL - bash.log, and sh.log. * ACCESS - auth.log, nsvpn.log, httpaccess.log, httperror.log, httpaccess-vpn.log and httperror-vpn.log. * NSMGMT - notice.log and ns.log. * NONE - No logs. Possible values = ALL, SHELL, ACCESS, NSMGMT, NONE
    .PARAMETER MaxLogDataSizetohold
        Max size of log data that can be held in NSB chain of server info. Default value: 500 Minimum value = 50 Maximum value = 25600
    .PARAMETER Mgmtloglevel
        Management log level, which specifies the types of events to log. Available values function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Name
        Name of the syslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog action" or 'my syslog action'). Minimum length = 1
    .PARAMETER NetProfile
        Name of the network profile. The SNIP configured in the network profile will be used as source IP while sending log messages. Minimum length = 1 Maximum length = 127
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerDomainName
        SYSLOG server name as a FQDN. Mutually exclusive with serverIP/lbVserverName. Minimum length = 1 Maximum length = 255
    .PARAMETER ServerIp
        IP address of the syslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the syslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER StreamAnalytics
        Export log stream analytics statistics to syslog server. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER SyslogCompliance
        Setting this parameter ensures that all the Audit Logs generated for this Syslog Action comply with an RFC. For example, set it to RFC5424 to ensure RFC 5424 compliance. Possible values = RFC5424
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER TCPProfileName
        Name of the TCP profile whose settings are to be applied to the audit server info to tune the TCP connection parameters. Minimum length = 1 Maximum length = 127
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Supported settings are: * GMT_TIME. Coordinated Universal time. * LOCAL_TIME. Use the server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER TransPort
        Transport type used to send auditlogs to syslog server. Default type is UDP. Possible values = TCP, UDP, HTTP
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to syslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSAddAuditSyslogAction -Name 'example' -Loglevel ALL -PassThru
    .EXAMPLE
        Invoke-NSAddAuditSyslogAction -Name 'example' -Loglevel ALL -WhatIf
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
        [string] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [string] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Denylistviolations,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNS,

        [Parameter()]
        [int] $Domainresolveretry,

        [Parameter()]
        [string] $HTTPAuthtoken,

        [Parameter()]
        [string] $HTTPEndpointURL,

        [Parameter()]
        [string] $HTTPSChemaFile,

        [Parameter()]
        [string] $LbVServerName,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [string] $Logfacility,

        [Parameter(Mandatory)]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [string[]] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Lsn,

        [Parameter()]
        [string[]] $Managementlog,

        [Parameter()]
        [int] $MaxLogDataSizetohold,

        [Parameter()]
        [string[]] $Mgmtloglevel,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [string] $ProtocolViolations,

        [Parameter()]
        [string] $ServerDomainName,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SSLInterception,

        [Parameter()]
        [string] $StreamAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberlog,

        [Parameter()]
        [string] $SyslogCompliance,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [string] $TCP,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [string] $Timezone,

        [Parameter()]
        [string] $TransPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UserDefinedAuditLog,

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

    if ($PSBoundParameters.ContainsKey('Mgmtloglevel')) {
        Assert-NSParameterValue -ParameterName 'Mgmtloglevel' -Value $Mgmtloglevel -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) {
        Assert-NSParameterValue -ParameterName 'ProtocolViolations' -Value $ProtocolViolations -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'NONE') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('StreamAnalytics')) {
        Assert-NSParameterValue -ParameterName 'StreamAnalytics' -Value $StreamAnalytics -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('SyslogCompliance')) {
        Assert-NSParameterValue -ParameterName 'SyslogCompliance' -Value $SyslogCompliance -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('RFC5424') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('TransPort')) {
        Assert-NSParameterValue -ParameterName 'TransPort' -Value $TransPort -AllowedValuesByVersion @{ '13.1' = @('TCP', 'UDP'); '14.1' = @('TCP', 'UDP', 'HTTP') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Acl')) { $properties['acl'] = $Acl }
    if ($PSBoundParameters.ContainsKey('Alg')) { $properties['alg'] = $Alg }
    if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $properties['appflowexport'] = $AppFlowExPort }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $properties['contentinspectionlog'] = $ContentInSpecTionlog }
    if ($PSBoundParameters.ContainsKey('DateFormAt')) { $properties['dateformat'] = $DateFormAt }
    if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $properties['denylistviolations'] = $Denylistviolations }
    if ($PSBoundParameters.ContainsKey('DNS')) { $properties['dns'] = $DNS }
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('HTTPAuthtoken')) { $properties['httpauthtoken'] = $HTTPAuthtoken }
    if ($PSBoundParameters.ContainsKey('HTTPEndpointURL')) { $properties['httpendpointurl'] = $HTTPEndpointURL }
    if ($PSBoundParameters.ContainsKey('HTTPSChemaFile')) { $properties['httpschemafile'] = $HTTPSChemaFile }
    if ($PSBoundParameters.ContainsKey('LbVServerName')) { $properties['lbvservername'] = $LbVServerName }
    if ($PSBoundParameters.ContainsKey('Logfacility')) { $properties['logfacility'] = $Logfacility }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Lsn')) { $properties['lsn'] = $Lsn }
    if ($PSBoundParameters.ContainsKey('Managementlog')) { $properties['managementlog'] = $Managementlog }
    if ($PSBoundParameters.ContainsKey('MaxLogDataSizetohold')) { $properties['maxlogdatasizetohold'] = $MaxLogDataSizetohold }
    if ($PSBoundParameters.ContainsKey('Mgmtloglevel')) { $properties['mgmtloglevel'] = $Mgmtloglevel }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $properties['protocolviolations'] = $ProtocolViolations }
    if ($PSBoundParameters.ContainsKey('ServerDomainName')) { $properties['serverdomainname'] = $ServerDomainName }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('SSLInterception')) { $properties['sslinterception'] = $SSLInterception }
    if ($PSBoundParameters.ContainsKey('StreamAnalytics')) { $properties['streamanalytics'] = $StreamAnalytics }
    if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $properties['subscriberlog'] = $Subscriberlog }
    if ($PSBoundParameters.ContainsKey('SyslogCompliance')) { $properties['syslogcompliance'] = $SyslogCompliance }
    if ($PSBoundParameters.ContainsKey('TCP')) { $properties['tcp'] = $TCP }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('Timezone')) { $properties['timezone'] = $Timezone }
    if ($PSBoundParameters.ContainsKey('TransPort')) { $properties['transport'] = $TransPort }
    if ($PSBoundParameters.ContainsKey('URLFiltering')) { $properties['urlfiltering'] = $URLFiltering }
    if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $properties['userdefinedauditlog'] = $UserDefinedAuditLog }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create auditsyslogaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditsyslogaction -Payload @{ auditsyslogaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditSyslogAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAuditSyslogAction

# region Invoke-NSAddAuditSyslogGlobalAuditSyslogPolicyBinding
function Invoke-NSAddAuditSyslogGlobalAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler auditsyslogglobal_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to auditsyslogglobal.
    .PARAMETER GlobalbindType
        . Default value: SYSTEM_GLOBAL Possible values = SYSTEM_GLOBAL, VPN_GLOBAL, RNAT_GLOBAL, APPFW_GLOBAL, TM_GLOBAL
    .PARAMETER PolicyName
        Name of the audit syslog policy.
    .PARAMETER Priority
        Specifies the priority of the policy. Minimum value = 1 Maximum value = 2147483647
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
        Invoke-NSAddAuditSyslogGlobalAuditSyslogPolicyBinding -PolicyName 'example' -Priority 1 -PassThru
    .EXAMPLE
        Invoke-NSAddAuditSyslogGlobalAuditSyslogPolicyBinding -PolicyName 'example' -Priority 1 -WhatIf
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
        [string] $GlobalbindType,

        [Parameter(Mandatory)]
        [string] $PolicyName,

        [Parameter(Mandatory)]
        [int] $Priority,

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

    if ($PSBoundParameters.ContainsKey('GlobalbindType')) {
        Assert-NSParameterValue -ParameterName 'GlobalbindType' -Value $GlobalbindType -AllowedValuesByVersion @{ '13.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL'); '14.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL', 'TM_GLOBAL') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('GlobalbindType')) { $properties['globalbindtype'] = $GlobalbindType }
    if ($PSBoundParameters.ContainsKey('PolicyName')) { $properties['policyname'] = $PolicyName }
    if ($PSBoundParameters.ContainsKey('Priority')) { $properties['priority'] = $Priority }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('auditsyslogglobal_auditsyslogpolicy_binding', 'Create auditsyslogglobal_auditsyslogpolicy_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditsyslogglobal_auditsyslogpolicy_binding -Payload @{ auditsyslogglobal_auditsyslogpolicy_binding = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSAddAuditSyslogGlobalAuditSyslogPolicyBinding

# region Invoke-NSAddAuditSyslogPolicy
function Invoke-NSAddAuditSyslogPolicy {
    <#
    .SYNOPSIS
        Creates a NetScaler auditsyslogpolicy resource.
    .DESCRIPTION
        Configuration for system log policy resource.
    .PARAMETER Action
        Syslog server action to perform when this policy matches traffic. NOTE: A syslog server action must be associated with a syslog audit policy. Minimum length = 1
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog policy" or 'my syslog policy'). Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, that defines the messages to be logged to the syslog server. Minimum length = 1
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
        Invoke-NSAddAuditSyslogPolicy -Name 'example' -Action 'example' -Rule 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddAuditSyslogPolicy -Name 'example' -Action 'example' -Rule 'example' -WhatIf
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
        [string] $Action,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Rule,

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
    if ($PSBoundParameters.ContainsKey('Action')) { $properties['action'] = $Action }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create auditsyslogpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditsyslogpolicy -Payload @{ auditsyslogpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditSyslogPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddAuditSyslogPolicy

# region Invoke-NSDeleteAuditMessageAction
function Invoke-NSDeleteAuditMessageAction {
    <#
    .SYNOPSIS
        Removes a NetScaler auditmessageaction resource.
    .DESCRIPTION
        Configuration for message action resource.
    .PARAMETER Name
        Name of the audit message action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the message action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my message action" or 'my message action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAuditMessageAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAuditMessageAction -Name 'auditmessageaction_example' | Invoke-NSDeleteAuditMessageAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete auditmessageaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type auditmessageaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAuditMessageAction

# region Invoke-NSDeleteAuditNSLogAction
function Invoke-NSDeleteAuditNSLogAction {
    <#
    .SYNOPSIS
        Removes a NetScaler auditnslogaction resource.
    .DESCRIPTION
        Configuration for ns log action resource.
    .PARAMETER Name
        Name of the nslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog action" or 'my nslog action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAuditNSLogAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAuditNSLogAction -Name 'auditnslogaction_example' | Invoke-NSDeleteAuditNSLogAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete auditnslogaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type auditnslogaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAuditNSLogAction

# region Invoke-NSDeleteAuditNslogglobalAuditNSLogPolicyBinding
function Invoke-NSDeleteAuditNslogglobalAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler auditnslogglobal_auditnslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to auditnslogglobal.
    .PARAMETER PolicyName
        Name of the audit nslog policy.
    .PARAMETER GlobalbindType
        . Default value: SYSTEM_GLOBAL Possible values = SYSTEM_GLOBAL, VPN_GLOBAL, RNAT_GLOBAL, APPFW_GLOBAL, TM_GLOBAL
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAuditNslogglobalAuditNSLogPolicyBinding -PolicyName 'example' -GlobalbindType 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAuditNslogglobalAuditNSLogPolicyBinding  | Invoke-NSDeleteAuditNslogglobalAuditNSLogPolicyBinding -Confirm:$false
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
        [string] $PolicyName,

        [Parameter()]
        [string] $GlobalbindType,

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

        if ($PSBoundParameters.ContainsKey('GlobalbindType')) {
            Assert-NSParameterValue -ParameterName 'GlobalbindType' -Value $GlobalbindType -AllowedValuesByVersion @{ '13.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL'); '14.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL', 'TM_GLOBAL') } -MetadataVersion $metadataVersion
        }

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('PolicyName')) {
            $argumentParts += 'policyname:' + $PolicyName
        }
        if ($PSBoundParameters.ContainsKey('GlobalbindType')) {
            $argumentParts += 'globalbindtype:' + $GlobalbindType
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('auditnslogglobal_auditnslogpolicy_binding', 'Delete auditnslogglobal_auditnslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type auditnslogglobal_auditnslogpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAuditNslogglobalAuditNSLogPolicyBinding

# region Invoke-NSDeleteAuditNSLogPolicy
function Invoke-NSDeleteAuditNSLogPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler auditnslogpolicy resource.
    .DESCRIPTION
        Configuration for ns log policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog policy" or 'my nslog policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAuditNSLogPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicy -Name 'auditnslogpolicy_example' | Invoke-NSDeleteAuditNSLogPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete auditnslogpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type auditnslogpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAuditNSLogPolicy

# region Invoke-NSDeleteAuditSyslogAction
function Invoke-NSDeleteAuditSyslogAction {
    <#
    .SYNOPSIS
        Removes a NetScaler auditsyslogaction resource.
    .DESCRIPTION
        Configuration for system log action resource.
    .PARAMETER Name
        Name of the syslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog action" or 'my syslog action'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAuditSyslogAction -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAuditSyslogAction -Name 'auditsyslogaction_example' | Invoke-NSDeleteAuditSyslogAction -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete auditsyslogaction')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type auditsyslogaction -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAuditSyslogAction

# region Invoke-NSDeleteAuditSyslogGlobalAuditSyslogPolicyBinding
function Invoke-NSDeleteAuditSyslogGlobalAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler auditsyslogglobal_auditsyslogpolicy_binding resource.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to auditsyslogglobal.
    .PARAMETER PolicyName
        Name of the audit syslog policy.
    .PARAMETER GlobalbindType
        . Default value: SYSTEM_GLOBAL Possible values = SYSTEM_GLOBAL, VPN_GLOBAL, RNAT_GLOBAL, APPFW_GLOBAL, TM_GLOBAL
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAuditSyslogGlobalAuditSyslogPolicyBinding -PolicyName 'example' -GlobalbindType 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAuditSyslogGlobalAuditSyslogPolicyBinding  | Invoke-NSDeleteAuditSyslogGlobalAuditSyslogPolicyBinding -Confirm:$false
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
        [string] $PolicyName,

        [Parameter()]
        [string] $GlobalbindType,

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

        if ($PSBoundParameters.ContainsKey('GlobalbindType')) {
            Assert-NSParameterValue -ParameterName 'GlobalbindType' -Value $GlobalbindType -AllowedValuesByVersion @{ '13.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL'); '14.1' = @('SYSTEM_GLOBAL', 'VPN_GLOBAL', 'RNAT_GLOBAL', 'APPFW_GLOBAL', 'TM_GLOBAL') } -MetadataVersion $metadataVersion
        }

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('PolicyName')) {
            $argumentParts += 'policyname:' + $PolicyName
        }
        if ($PSBoundParameters.ContainsKey('GlobalbindType')) {
            $argumentParts += 'globalbindtype:' + $GlobalbindType
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess('auditsyslogglobal_auditsyslogpolicy_binding', 'Delete auditsyslogglobal_auditsyslogpolicy_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type auditsyslogglobal_auditsyslogpolicy_binding -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAuditSyslogGlobalAuditSyslogPolicyBinding

# region Invoke-NSDeleteAuditSyslogPolicy
function Invoke-NSDeleteAuditSyslogPolicy {
    <#
    .SYNOPSIS
        Removes a NetScaler auditsyslogpolicy resource.
    .DESCRIPTION
        Configuration for system log policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog policy" or 'my syslog policy'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteAuditSyslogPolicy -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicy -Name 'auditsyslogpolicy_example' | Invoke-NSDeleteAuditSyslogPolicy -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete auditsyslogpolicy')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type auditsyslogpolicy -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteAuditSyslogPolicy

# region Invoke-NSGetAuditMessageAction
function Invoke-NSGetAuditMessageAction {
    <#
    .SYNOPSIS
        Gets NetScaler auditmessageaction configuration.
    .DESCRIPTION
        Configuration for message action resource.
    .PARAMETER Name
        Name of the audit message action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the message action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my message action" or 'my message action'). Minimum length = 1
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
        Invoke-NSGetAuditMessageAction
    .EXAMPLE
        Invoke-NSGetAuditMessageAction -Name 'auditmessageaction_example'
    .EXAMPLE
        Invoke-NSGetAuditMessageAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditmessageaction'
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
# endregion Invoke-NSGetAuditMessageAction

# region Invoke-NSGetAuditMessageS
function Invoke-NSGetAuditMessageS {
    <#
    .SYNOPSIS
        Gets NetScaler auditmessages configuration.
    .DESCRIPTION
        Configuration for audit message resource.
    .PARAMETER Loglevel
        Audit log level filter, which specifies the types of events to display. The following loglevels are valid: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
    .PARAMETER Numofmesgs
        Number of log messages to be displayed. Default value: 20 Minimum value = 1 Maximum value = 256
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
        Invoke-NSGetAuditMessageS
    .EXAMPLE
        Invoke-NSGetAuditMessageS -Filter @{ servicetype = 'HTTP' }
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

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [string[]] $Loglevel,

        [Parameter(ParameterSetName = 'All')]
        [int] $Numofmesgs,

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

        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('Loglevel')) {
            $argumentValue = $Loglevel
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'loglevel:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Numofmesgs')) {
            $argumentValue = $Numofmesgs
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'numofmesgs:' + $argumentValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
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
            Type = 'auditmessages'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAuditMessageS

# region Invoke-NSGetAuditNSLogAction
function Invoke-NSGetAuditNSLogAction {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogaction configuration.
    .DESCRIPTION
        Configuration for ns log action resource.
    .PARAMETER Name
        Name of the nslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog action" or 'my nslog action'). Minimum length = 1
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
        Invoke-NSGetAuditNSLogAction
    .EXAMPLE
        Invoke-NSGetAuditNSLogAction -Name 'auditnslogaction_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogaction'
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
# endregion Invoke-NSGetAuditNSLogAction

# region Invoke-NSGetAuditNslogglobalAuditNSLogPolicyBinding
function Invoke-NSGetAuditNslogglobalAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogglobal_auditnslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditnslogpolicy that can be bound to auditnslogglobal.
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
        Invoke-NSGetAuditNslogglobalAuditNSLogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAuditNslogglobalAuditNSLogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogglobal_auditnslogpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAuditNslogglobalAuditNSLogPolicyBinding

# region Invoke-NSGetAuditNslogglobalBinding
function Invoke-NSGetAuditNslogglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to auditnslogglobal.
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
        Invoke-NSGetAuditNslogglobalBinding
    .EXAMPLE
        Invoke-NSGetAuditNslogglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAuditNslogglobalBinding

# region Invoke-NSGetAuditNslogparams
function Invoke-NSGetAuditNslogparams {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogparams configuration.
    .DESCRIPTION
        Configuration for ns log parameters resource.
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
        Invoke-NSGetAuditNslogparams
    .EXAMPLE
        Invoke-NSGetAuditNslogparams -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogparams'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAuditNslogparams

# region Invoke-NSGetAuditNSLogPolicy
function Invoke-NSGetAuditNSLogPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy configuration.
    .DESCRIPTION
        Configuration for ns log policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog policy" or 'my nslog policy'). Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicy
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicy -Name 'auditnslogpolicy_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy'
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
# endregion Invoke-NSGetAuditNSLogPolicy

# region Invoke-NSGetAuditNSLogPolicyAAAGroupBinding
function Invoke-NSGetAuditNSLogPolicyAAAGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_aaagroup_binding configuration.
    .DESCRIPTION
        Binding object showing the aaagroup that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyAAAGroupBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAAAGroupBinding -Name 'auditnslogpolicy_aaagroup_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAAAGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_aaagroup_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyAAAGroupBinding

# region Invoke-NSGetAuditNSLogPolicyAAAUserBinding
function Invoke-NSGetAuditNSLogPolicyAAAUserBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_aaauser_binding configuration.
    .DESCRIPTION
        Binding object showing the aaauser that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyAAAUserBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAAAUserBinding -Name 'auditnslogpolicy_aaauser_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAAAUserBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_aaauser_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyAAAUserBinding

# region Invoke-NSGetAuditNSLogPolicyAppFwGlobalBinding
function Invoke-NSGetAuditNSLogPolicyAppFwGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_appfwglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the appfwglobal that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyAppFwGlobalBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAppFwGlobalBinding -Name 'auditnslogpolicy_appfwglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAppFwGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_appfwglobal_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyAppFwGlobalBinding

# region Invoke-NSGetAuditNSLogPolicyAuditNslogglobalBinding
function Invoke-NSGetAuditNSLogPolicyAuditNslogglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_auditnslogglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the auditnslogglobal that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyAuditNslogglobalBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAuditNslogglobalBinding -Name 'auditnslogpolicy_auditnslogglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAuditNslogglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_auditnslogglobal_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyAuditNslogglobalBinding

# region Invoke-NSGetAuditNSLogPolicyAuthenticationVServerBinding
function Invoke-NSGetAuditNSLogPolicyAuthenticationVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_authenticationvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the authenticationvserver that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyAuthenticationVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAuthenticationVServerBinding -Name 'auditnslogpolicy_authenticationvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyAuthenticationVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_authenticationvserver_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyAuthenticationVServerBinding

# region Invoke-NSGetAuditNSLogPolicyBinding
function Invoke-NSGetAuditNSLogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
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
        Invoke-NSGetAuditNSLogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyBinding -Name 'auditnslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyBinding

# region Invoke-NSGetAuditNSLogPolicyCSVServerBinding
function Invoke-NSGetAuditNSLogPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyCSVServerBinding -Name 'auditnslogpolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_csvserver_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyCSVServerBinding

# region Invoke-NSGetAuditNSLogPolicyLBVServerBinding
function Invoke-NSGetAuditNSLogPolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyLBVServerBinding -Name 'auditnslogpolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_lbvserver_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyLBVServerBinding

# region Invoke-NSGetAuditNSLogPolicySystemGlobalBinding
function Invoke-NSGetAuditNSLogPolicySystemGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_systemglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the systemglobal that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicySystemGlobalBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicySystemGlobalBinding -Name 'auditnslogpolicy_systemglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicySystemGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_systemglobal_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicySystemGlobalBinding

# region Invoke-NSGetAuditNSLogPolicyTmglobalBinding
function Invoke-NSGetAuditNSLogPolicyTmglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_tmglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the tmglobal that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyTmglobalBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyTmglobalBinding -Name 'auditnslogpolicy_tmglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyTmglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_tmglobal_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyTmglobalBinding

# region Invoke-NSGetAuditNSLogPolicyVPNGlobalBinding
function Invoke-NSGetAuditNSLogPolicyVPNGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_vpnglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnglobal that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyVPNGlobalBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyVPNGlobalBinding -Name 'auditnslogpolicy_vpnglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyVPNGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_vpnglobal_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyVPNGlobalBinding

# region Invoke-NSGetAuditNSLogPolicyVPNVServerBinding
function Invoke-NSGetAuditNSLogPolicyVPNVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditnslogpolicy_vpnvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to auditnslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditNSLogPolicyVPNVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyVPNVServerBinding -Name 'auditnslogpolicy_vpnvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditNSLogPolicyVPNVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditnslogpolicy_vpnvserver_binding'
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
# endregion Invoke-NSGetAuditNSLogPolicyVPNVServerBinding

# region Invoke-NSGetAuditSyslogAction
function Invoke-NSGetAuditSyslogAction {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogaction configuration.
    .DESCRIPTION
        Configuration for system log action resource.
    .PARAMETER Name
        Name of the syslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog action" or 'my syslog action'). Minimum length = 1
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
        Invoke-NSGetAuditSyslogAction
    .EXAMPLE
        Invoke-NSGetAuditSyslogAction -Name 'auditsyslogaction_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogAction -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogaction'
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
# endregion Invoke-NSGetAuditSyslogAction

# region Invoke-NSGetAuditSyslogGlobalAuditSyslogPolicyBinding
function Invoke-NSGetAuditSyslogGlobalAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogglobal_auditsyslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object showing the auditsyslogpolicy that can be bound to auditsyslogglobal.
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
        Invoke-NSGetAuditSyslogGlobalAuditSyslogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogGlobalAuditSyslogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogglobal_auditsyslogpolicy_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAuditSyslogGlobalAuditSyslogPolicyBinding

# region Invoke-NSGetAuditSyslogGlobalBinding
function Invoke-NSGetAuditSyslogGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogglobal_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to auditsyslogglobal.
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
        Invoke-NSGetAuditSyslogGlobalBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogglobal_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAuditSyslogGlobalBinding

# region Invoke-NSGetAuditSyslogParams
function Invoke-NSGetAuditSyslogParams {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogparams configuration.
    .DESCRIPTION
        Configuration for system log parameters resource.
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
        Invoke-NSGetAuditSyslogParams
    .EXAMPLE
        Invoke-NSGetAuditSyslogParams -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogparams'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetAuditSyslogParams

# region Invoke-NSGetAuditSyslogPolicy
function Invoke-NSGetAuditSyslogPolicy {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy configuration.
    .DESCRIPTION
        Configuration for system log policy resource.
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog policy" or 'my syslog policy'). Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicy
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicy -Name 'auditsyslogpolicy_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicy -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy'
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
# endregion Invoke-NSGetAuditSyslogPolicy

# region Invoke-NSGetAuditSyslogPolicyAAAGroupBinding
function Invoke-NSGetAuditSyslogPolicyAAAGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_aaagroup_binding configuration.
    .DESCRIPTION
        Binding object showing the aaagroup that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyAAAGroupBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAAAGroupBinding -Name 'auditsyslogpolicy_aaagroup_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAAAGroupBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_aaagroup_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyAAAGroupBinding

# region Invoke-NSGetAuditSyslogPolicyAAAUserBinding
function Invoke-NSGetAuditSyslogPolicyAAAUserBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_aaauser_binding configuration.
    .DESCRIPTION
        Binding object showing the aaauser that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyAAAUserBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAAAUserBinding -Name 'auditsyslogpolicy_aaauser_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAAAUserBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_aaauser_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyAAAUserBinding

# region Invoke-NSGetAuditSyslogPolicyAuditSyslogGlobalBinding
function Invoke-NSGetAuditSyslogPolicyAuditSyslogGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_auditsyslogglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the auditsyslogglobal that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyAuditSyslogGlobalBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAuditSyslogGlobalBinding -Name 'auditsyslogpolicy_auditsyslogglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAuditSyslogGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_auditsyslogglobal_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyAuditSyslogGlobalBinding

# region Invoke-NSGetAuditSyslogPolicyAuthenticationVServerBinding
function Invoke-NSGetAuditSyslogPolicyAuthenticationVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_authenticationvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the authenticationvserver that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyAuthenticationVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAuthenticationVServerBinding -Name 'auditsyslogpolicy_authenticationvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyAuthenticationVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_authenticationvserver_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyAuthenticationVServerBinding

# region Invoke-NSGetAuditSyslogPolicyBinding
function Invoke-NSGetAuditSyslogPolicyBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
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
        Invoke-NSGetAuditSyslogPolicyBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyBinding -Name 'auditsyslogpolicy_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyBinding

# region Invoke-NSGetAuditSyslogPolicyCSVServerBinding
function Invoke-NSGetAuditSyslogPolicyCSVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_csvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the csvserver that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyCSVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyCSVServerBinding -Name 'auditsyslogpolicy_csvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyCSVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_csvserver_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyCSVServerBinding

# region Invoke-NSGetAuditSyslogPolicyLBVServerBinding
function Invoke-NSGetAuditSyslogPolicyLBVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_lbvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the lbvserver that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyLBVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyLBVServerBinding -Name 'auditsyslogpolicy_lbvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyLBVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_lbvserver_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyLBVServerBinding

# region Invoke-NSGetAuditSyslogPolicyRnatglobalBinding
function Invoke-NSGetAuditSyslogPolicyRnatglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_rnatglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the rnatglobal that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyRnatglobalBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyRnatglobalBinding -Name 'auditsyslogpolicy_rnatglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyRnatglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_rnatglobal_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyRnatglobalBinding

# region Invoke-NSGetAuditSyslogPolicySystemGlobalBinding
function Invoke-NSGetAuditSyslogPolicySystemGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_systemglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the systemglobal that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicySystemGlobalBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicySystemGlobalBinding -Name 'auditsyslogpolicy_systemglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicySystemGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_systemglobal_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicySystemGlobalBinding

# region Invoke-NSGetAuditSyslogPolicyTmglobalBinding
function Invoke-NSGetAuditSyslogPolicyTmglobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_tmglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the tmglobal that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyTmglobalBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyTmglobalBinding -Name 'auditsyslogpolicy_tmglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyTmglobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_tmglobal_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyTmglobalBinding

# region Invoke-NSGetAuditSyslogPolicyVPNGlobalBinding
function Invoke-NSGetAuditSyslogPolicyVPNGlobalBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_vpnglobal_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnglobal that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyVPNGlobalBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyVPNGlobalBinding -Name 'auditsyslogpolicy_vpnglobal_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyVPNGlobalBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_vpnglobal_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyVPNGlobalBinding

# region Invoke-NSGetAuditSyslogPolicyVPNVServerBinding
function Invoke-NSGetAuditSyslogPolicyVPNVServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler auditsyslogpolicy_vpnvserver_binding configuration.
    .DESCRIPTION
        Binding object showing the vpnvserver that can be bound to auditsyslogpolicy.
    .PARAMETER Name
        Name of the policy. Minimum length = 1
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
        Invoke-NSGetAuditSyslogPolicyVPNVServerBinding
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyVPNVServerBinding -Name 'auditsyslogpolicy_vpnvserver_binding_example'
    .EXAMPLE
        Invoke-NSGetAuditSyslogPolicyVPNVServerBinding -Filter @{ servicetype = 'HTTP' }
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
            Type = 'auditsyslogpolicy_vpnvserver_binding'
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
# endregion Invoke-NSGetAuditSyslogPolicyVPNVServerBinding

# region Invoke-NSUnsetAuditMessageAction
function Invoke-NSUnsetAuditMessageAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler auditmessageaction resource properties.
    .DESCRIPTION
        Configuration for message action resource.
    .PARAMETER Name
        Name of the audit message action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the message action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my message action" or 'my message action'). Minimum length = 1
    .PARAMETER BypassSafetycheck
        Bypass the safety check and allow unsafe expressions. Default value: NO Possible values = YES, NO
    .PARAMETER Logtonewnslog
        Send the message to the new nslog. Possible values = YES, NO
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
        Invoke-NSUnsetAuditMessageAction -Name 'example' -BypassSafetycheck YES -PassThru
    .EXAMPLE
        Invoke-NSUnsetAuditMessageAction -Name 'example' -BypassSafetycheck YES -WhatIf
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
        [ValidateSet('YES', 'NO')]
        [switch] $BypassSafetycheck,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $Logtonewnslog,

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
        if ($PSBoundParameters.ContainsKey('BypassSafetycheck')) { $body['bypasssafetycheck'] = $true }
        if ($PSBoundParameters.ContainsKey('Logtonewnslog')) { $body['logtonewnslog'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear auditmessageaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditmessageaction -Action unset -Payload @{ auditmessageaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAuditMessageAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAuditMessageAction

# region Invoke-NSUnsetAuditNSLogAction
function Invoke-NSUnsetAuditNSLogAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler auditnslogaction resource properties.
    .DESCRIPTION
        Configuration for ns log action resource.
    .PARAMETER Name
        Name of the nslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog action" or 'my nslog action'). Minimum length = 1
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log the ALG messages. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY - U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Audit log level, which specifies the types of events to log. Available settings function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log the LSN messages. Possible values = ENABLED, DISABLED
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerPort
        Port on which the nslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Available settings function as follows: * GMT_TIME. Coordinated Universal Time. * LOCAL_TIME. The server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to nslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUnsetAuditNSLogAction -Name 'example' -Acl ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetAuditNSLogAction -Name 'example' -Acl ENABLED -WhatIf
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
        [switch] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [switch] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Denylistviolations,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [switch] $Logfacility,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [switch] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Lsn,

        [Parameter()]
        [ValidateSet('ALL', 'NONE')]
        [switch] $ProtocolViolations,

        [Parameter()]
        [switch] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SSLInterception,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Subscriberlog,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [switch] $TCP,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [switch] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $UserDefinedAuditLog,

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
        if ($PSBoundParameters.ContainsKey('Acl')) { $body['acl'] = $true }
        if ($PSBoundParameters.ContainsKey('Alg')) { $body['alg'] = $true }
        if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $body['appflowexport'] = $true }
        if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $body['contentinspectionlog'] = $true }
        if ($PSBoundParameters.ContainsKey('DateFormAt')) { $body['dateformat'] = $true }
        if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $body['denylistviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('Logfacility')) { $body['logfacility'] = $true }
        if ($PSBoundParameters.ContainsKey('Loglevel')) { $body['loglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('Lsn')) { $body['lsn'] = $true }
        if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $body['protocolviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerPort')) { $body['serverport'] = $true }
        if ($PSBoundParameters.ContainsKey('SSLInterception')) { $body['sslinterception'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $body['subscriberlog'] = $true }
        if ($PSBoundParameters.ContainsKey('TCP')) { $body['tcp'] = $true }
        if ($PSBoundParameters.ContainsKey('Timezone')) { $body['timezone'] = $true }
        if ($PSBoundParameters.ContainsKey('URLFiltering')) { $body['urlfiltering'] = $true }
        if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $body['userdefinedauditlog'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear auditnslogaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditnslogaction -Action unset -Payload @{ auditnslogaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAuditNSLogAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAuditNSLogAction

# region Invoke-NSUnsetAuditNslogparams
function Invoke-NSUnsetAuditNslogparams {
    <#
    .SYNOPSIS
        Clears one or more NetScaler auditnslogparams resource properties.
    .DESCRIPTION
        Configuration for ns log parameters resource.
    .PARAMETER Acl
        Configure auditing to log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log the ALG messages. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY - U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Types of information to be logged. Available settings function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log the LSN messages. Possible values = ENABLED, DISABLED
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerIp
        IP address of the nslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the nslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER TCP
        Configure auditing to log TCP messages. Possible values = NONE, ALL
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Supported settings are: * GMT_TIME - Coordinated Universal Time. * LOCAL_TIME - Use the server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to nslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUnsetAuditNslogparams -Acl ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetAuditNslogparams -Acl ENABLED -WhatIf
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
        [switch] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [switch] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Denylistviolations,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [switch] $Logfacility,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [switch] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Lsn,

        [Parameter()]
        [ValidateSet('ALL', 'NONE')]
        [switch] $ProtocolViolations,

        [Parameter()]
        [switch] $ServerIp,

        [Parameter()]
        [switch] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SSLInterception,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Subscriberlog,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [switch] $TCP,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [switch] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $UserDefinedAuditLog,

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

        $body = @{}
        if ($PSBoundParameters.ContainsKey('Acl')) { $body['acl'] = $true }
        if ($PSBoundParameters.ContainsKey('Alg')) { $body['alg'] = $true }
        if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $body['appflowexport'] = $true }
        if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $body['contentinspectionlog'] = $true }
        if ($PSBoundParameters.ContainsKey('DateFormAt')) { $body['dateformat'] = $true }
        if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $body['denylistviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('Logfacility')) { $body['logfacility'] = $true }
        if ($PSBoundParameters.ContainsKey('Loglevel')) { $body['loglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('Lsn')) { $body['lsn'] = $true }
        if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $body['protocolviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerIp')) { $body['serverip'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerPort')) { $body['serverport'] = $true }
        if ($PSBoundParameters.ContainsKey('SSLInterception')) { $body['sslinterception'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $body['subscriberlog'] = $true }
        if ($PSBoundParameters.ContainsKey('TCP')) { $body['tcp'] = $true }
        if ($PSBoundParameters.ContainsKey('Timezone')) { $body['timezone'] = $true }
        if ($PSBoundParameters.ContainsKey('URLFiltering')) { $body['urlfiltering'] = $true }
        if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $body['userdefinedauditlog'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('auditnslogparams', 'Clear auditnslogparams properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditnslogparams -Action unset -Payload @{ auditnslogparams = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAuditNslogparams

# region Invoke-NSUnsetAuditSyslogAction
function Invoke-NSUnsetAuditSyslogAction {
    <#
    .SYNOPSIS
        Clears one or more NetScaler auditsyslogaction resource properties.
    .DESCRIPTION
        Configuration for system log action resource.
    .PARAMETER Name
        Name of the syslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog action" or 'my syslog action'). Minimum length = 1
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log alg info. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY. -U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER DNS
        Log DNS related syslog messages. Possible values = ENABLED, DISABLED
    .PARAMETER HTTPAuthtoken
        Token for authenticating with the endpoint. If the endpoint requires the Authorization header in a particular format, specify the complete format as the value to this parameter. For eg., in case of splunk, the Authorization header is required to be of the form - Splunk <auth-token>. Maximum length = 256
    .PARAMETER HTTPEndpointURL
        The URL at which to upload the logs messages on the endpoint. Maximum length = 256
    .PARAMETER HTTPSChemaFile
        HTTP Schema file to input tokens to be sent in log message to log server. Maximum length = 256
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Audit log level, which specifies the types of events to log. Available values function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log lsn info. Possible values = ENABLED, DISABLED
    .PARAMETER Managementlog
        Management log specifies the categories of log files to be exported. It use destination and transport from PE params. Available values function as follows: * ALL - All categories (SHELL, NSMGMT and ACCESS). * SHELL - bash.log, and sh.log. * ACCESS - auth.log, nsvpn.log, httpaccess.log, httperror.log, httpaccess-vpn.log and httperror-vpn.log. * NSMGMT - notice.log and ns.log. * NONE - No logs. Possible values = ALL, SHELL, ACCESS, NSMGMT, NONE
    .PARAMETER MaxLogDataSizetohold
        Max size of log data that can be held in NSB chain of server info. Default value: 500 Minimum value = 50 Maximum value = 25600
    .PARAMETER Mgmtloglevel
        Management log level, which specifies the types of events to log. Available values function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER NetProfile
        Name of the network profile. The SNIP configured in the network profile will be used as source IP while sending log messages. Minimum length = 1 Maximum length = 127
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerPort
        Port on which the syslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER StreamAnalytics
        Export log stream analytics statistics to syslog server. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER SyslogCompliance
        Setting this parameter ensures that all the Audit Logs generated for this Syslog Action comply with an RFC. For example, set it to RFC5424 to ensure RFC 5424 compliance. Possible values = RFC5424
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER TCPProfileName
        Name of the TCP profile whose settings are to be applied to the audit server info to tune the TCP connection parameters. Minimum length = 1 Maximum length = 127
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Supported settings are: * GMT_TIME. Coordinated Universal time. * LOCAL_TIME. Use the server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to syslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUnsetAuditSyslogAction -Name 'example' -Acl ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetAuditSyslogAction -Name 'example' -Acl ENABLED -WhatIf
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
        [switch] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [switch] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Denylistviolations,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNS,

        [Parameter()]
        [switch] $HTTPAuthtoken,

        [Parameter()]
        [switch] $HTTPEndpointURL,

        [Parameter()]
        [switch] $HTTPSChemaFile,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [switch] $Logfacility,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [switch] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Lsn,

        [Parameter()]
        [ValidateSet('ALL', 'SHELL', 'ACCESS', 'NSMGMT', 'NONE')]
        [switch] $Managementlog,

        [Parameter()]
        [switch] $MaxLogDataSizetohold,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [switch] $Mgmtloglevel,

        [Parameter()]
        [switch] $NetProfile,

        [Parameter()]
        [ValidateSet('ALL', 'NONE')]
        [switch] $ProtocolViolations,

        [Parameter()]
        [switch] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SSLInterception,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $StreamAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Subscriberlog,

        [Parameter()]
        [ValidateSet('RFC5424')]
        [switch] $SyslogCompliance,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [switch] $TCP,

        [Parameter()]
        [switch] $TCPProfileName,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [switch] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $UserDefinedAuditLog,

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
        if ($PSBoundParameters.ContainsKey('Acl')) { $body['acl'] = $true }
        if ($PSBoundParameters.ContainsKey('Alg')) { $body['alg'] = $true }
        if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $body['appflowexport'] = $true }
        if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $body['contentinspectionlog'] = $true }
        if ($PSBoundParameters.ContainsKey('DateFormAt')) { $body['dateformat'] = $true }
        if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $body['denylistviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('DNS')) { $body['dns'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPAuthtoken')) { $body['httpauthtoken'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPEndpointURL')) { $body['httpendpointurl'] = $true }
        if ($PSBoundParameters.ContainsKey('HTTPSChemaFile')) { $body['httpschemafile'] = $true }
        if ($PSBoundParameters.ContainsKey('Logfacility')) { $body['logfacility'] = $true }
        if ($PSBoundParameters.ContainsKey('Loglevel')) { $body['loglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('Lsn')) { $body['lsn'] = $true }
        if ($PSBoundParameters.ContainsKey('Managementlog')) { $body['managementlog'] = $true }
        if ($PSBoundParameters.ContainsKey('MaxLogDataSizetohold')) { $body['maxlogdatasizetohold'] = $true }
        if ($PSBoundParameters.ContainsKey('Mgmtloglevel')) { $body['mgmtloglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('NetProfile')) { $body['netprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $body['protocolviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerPort')) { $body['serverport'] = $true }
        if ($PSBoundParameters.ContainsKey('SSLInterception')) { $body['sslinterception'] = $true }
        if ($PSBoundParameters.ContainsKey('StreamAnalytics')) { $body['streamanalytics'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $body['subscriberlog'] = $true }
        if ($PSBoundParameters.ContainsKey('SyslogCompliance')) { $body['syslogcompliance'] = $true }
        if ($PSBoundParameters.ContainsKey('TCP')) { $body['tcp'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $body['tcpprofilename'] = $true }
        if ($PSBoundParameters.ContainsKey('Timezone')) { $body['timezone'] = $true }
        if ($PSBoundParameters.ContainsKey('URLFiltering')) { $body['urlfiltering'] = $true }
        if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $body['userdefinedauditlog'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear auditsyslogaction properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditsyslogaction -Action unset -Payload @{ auditsyslogaction = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetAuditSyslogAction -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAuditSyslogAction

# region Invoke-NSUnsetAuditSyslogParams
function Invoke-NSUnsetAuditSyslogParams {
    <#
    .SYNOPSIS
        Clears one or more NetScaler auditsyslogparams resource properties.
    .DESCRIPTION
        Configuration for system log parameters resource.
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log the ALG messages. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event ifnormation. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY - U.S. style month/date/year format. * DDMMYYYY. European style -date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER DNS
        Log DNS related syslog messages. Possible values = ENABLED, DISABLED
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Types of information to be logged. Available settings function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, NONE
    .PARAMETER Lsn
        Log the LSN messages. Possible values = ENABLED, DISABLED
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerIp
        IP address of the syslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the syslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interceptionn event information. Possible values = ENABLED, DISABLED
    .PARAMETER StreamAnalytics
        Export log stream analytics statistics to syslog server. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Available settings function as follows: * GMT_TIME - Coordinated Universal Time. * LOCAL_TIME Use the server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to syslog. Setting this parameter to NO causes audit to ignore all user-configured message actions. Setting this parameter to YES causes audit to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUnsetAuditSyslogParams -Acl ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetAuditSyslogParams -Acl ENABLED -WhatIf
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
        [switch] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [switch] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Denylistviolations,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $DNS,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [switch] $Logfacility,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'NONE')]
        [switch] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Lsn,

        [Parameter()]
        [ValidateSet('ALL', 'NONE')]
        [switch] $ProtocolViolations,

        [Parameter()]
        [switch] $ServerIp,

        [Parameter()]
        [switch] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SSLInterception,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $StreamAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Subscriberlog,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [switch] $TCP,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [switch] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $UserDefinedAuditLog,

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

        $body = @{}
        if ($PSBoundParameters.ContainsKey('Acl')) { $body['acl'] = $true }
        if ($PSBoundParameters.ContainsKey('Alg')) { $body['alg'] = $true }
        if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $body['appflowexport'] = $true }
        if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $body['contentinspectionlog'] = $true }
        if ($PSBoundParameters.ContainsKey('DateFormAt')) { $body['dateformat'] = $true }
        if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $body['denylistviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('DNS')) { $body['dns'] = $true }
        if ($PSBoundParameters.ContainsKey('Logfacility')) { $body['logfacility'] = $true }
        if ($PSBoundParameters.ContainsKey('Loglevel')) { $body['loglevel'] = $true }
        if ($PSBoundParameters.ContainsKey('Lsn')) { $body['lsn'] = $true }
        if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $body['protocolviolations'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerIp')) { $body['serverip'] = $true }
        if ($PSBoundParameters.ContainsKey('ServerPort')) { $body['serverport'] = $true }
        if ($PSBoundParameters.ContainsKey('SSLInterception')) { $body['sslinterception'] = $true }
        if ($PSBoundParameters.ContainsKey('StreamAnalytics')) { $body['streamanalytics'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $body['subscriberlog'] = $true }
        if ($PSBoundParameters.ContainsKey('TCP')) { $body['tcp'] = $true }
        if ($PSBoundParameters.ContainsKey('Timezone')) { $body['timezone'] = $true }
        if ($PSBoundParameters.ContainsKey('URLFiltering')) { $body['urlfiltering'] = $true }
        if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $body['userdefinedauditlog'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('auditsyslogparams', 'Clear auditsyslogparams properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type auditsyslogparams -Action unset -Payload @{ auditsyslogparams = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetAuditSyslogParams

# region Invoke-NSUpdateAuditMessageAction
function Invoke-NSUpdateAuditMessageAction {
    <#
    .SYNOPSIS
        Updates a NetScaler auditmessageaction resource.
    .DESCRIPTION
        Configuration for message action resource.
    .PARAMETER BypassSafetycheck
        Bypass the safety check and allow unsafe expressions. Default value: NO Possible values = YES, NO
    .PARAMETER Loglevel
        Audit log level, which specifies the severity level of the log message being generated.. The following loglevels are valid: * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
    .PARAMETER Logtonewnslog
        Send the message to the new nslog. Possible values = YES, NO
    .PARAMETER Name
        Name of the audit message action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the message action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my message action" or 'my message action'). Minimum length = 1
    .PARAMETER Stringbuilderexpr
        Default-syntax expression that defines the format and content of the log message.
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
        Invoke-NSUpdateAuditMessageAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAuditMessageAction -Name 'example' -WhatIf
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
        [ValidateSet('YES', 'NO')]
        [string] $BypassSafetycheck,

        [Parameter()]
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [string] $Loglevel,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $Logtonewnslog,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Stringbuilderexpr,

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
    if ($PSBoundParameters.ContainsKey('BypassSafetycheck')) { $properties['bypasssafetycheck'] = $BypassSafetycheck }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Logtonewnslog')) { $properties['logtonewnslog'] = $Logtonewnslog }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Stringbuilderexpr')) { $properties['stringbuilderexpr'] = $Stringbuilderexpr }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update auditmessageaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type auditmessageaction -Payload @{ auditmessageaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditMessageAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAuditMessageAction

# region Invoke-NSUpdateAuditNSLogAction
function Invoke-NSUpdateAuditNSLogAction {
    <#
    .SYNOPSIS
        Updates a NetScaler auditnslogaction resource.
    .DESCRIPTION
        Configuration for ns log action resource.
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log the ALG messages. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY - U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER Domainresolvenow
        Immediately send a DNS query to resolve the server's domain name.
    .PARAMETER Domainresolveretry
        Time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the audit server if the last query failed. Default value: 5 Minimum value = 5 Maximum value = 20939
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Audit log level, which specifies the types of events to log. Available settings function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log the LSN messages. Possible values = ENABLED, DISABLED
    .PARAMETER Name
        Name of the nslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog action" or 'my nslog action'). Minimum length = 1
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerDomainName
        Auditserver name as a FQDN. Mutually exclusive with serverIP. Minimum length = 1 Maximum length = 255
    .PARAMETER ServerIp
        IP address of the nslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the nslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Available settings function as follows: * GMT_TIME. Coordinated Universal Time. * LOCAL_TIME. The server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to nslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUpdateAuditNSLogAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAuditNSLogAction -Name 'example' -WhatIf
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
        [string] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [string] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Denylistviolations,

        [Parameter()]
        [bool] $Domainresolvenow,

        [Parameter()]
        [int] $Domainresolveretry,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [string] $Logfacility,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [string[]] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Lsn,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $ProtocolViolations,

        [Parameter()]
        [string] $ServerDomainName,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SSLInterception,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberlog,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [string] $TCP,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [string] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UserDefinedAuditLog,

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

    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) {
        Assert-NSParameterValue -ParameterName 'ProtocolViolations' -Value $ProtocolViolations -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'NONE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Acl')) { $properties['acl'] = $Acl }
    if ($PSBoundParameters.ContainsKey('Alg')) { $properties['alg'] = $Alg }
    if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $properties['appflowexport'] = $AppFlowExPort }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $properties['contentinspectionlog'] = $ContentInSpecTionlog }
    if ($PSBoundParameters.ContainsKey('DateFormAt')) { $properties['dateformat'] = $DateFormAt }
    if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $properties['denylistviolations'] = $Denylistviolations }
    if ($PSBoundParameters.ContainsKey('Domainresolvenow')) { $properties['domainresolvenow'] = $Domainresolvenow }
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('Logfacility')) { $properties['logfacility'] = $Logfacility }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Lsn')) { $properties['lsn'] = $Lsn }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $properties['protocolviolations'] = $ProtocolViolations }
    if ($PSBoundParameters.ContainsKey('ServerDomainName')) { $properties['serverdomainname'] = $ServerDomainName }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('SSLInterception')) { $properties['sslinterception'] = $SSLInterception }
    if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $properties['subscriberlog'] = $Subscriberlog }
    if ($PSBoundParameters.ContainsKey('TCP')) { $properties['tcp'] = $TCP }
    if ($PSBoundParameters.ContainsKey('Timezone')) { $properties['timezone'] = $Timezone }
    if ($PSBoundParameters.ContainsKey('URLFiltering')) { $properties['urlfiltering'] = $URLFiltering }
    if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $properties['userdefinedauditlog'] = $UserDefinedAuditLog }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update auditnslogaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type auditnslogaction -Payload @{ auditnslogaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditNSLogAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAuditNSLogAction

# region Invoke-NSUpdateAuditNslogparams
function Invoke-NSUpdateAuditNslogparams {
    <#
    .SYNOPSIS
        Updates a NetScaler auditnslogparams resource.
    .DESCRIPTION
        Configuration for ns log parameters resource.
    .PARAMETER Acl
        Configure auditing to log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log the ALG messages. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY - U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Types of information to be logged. Available settings function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log the LSN messages. Possible values = ENABLED, DISABLED
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerIp
        IP address of the nslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the nslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER TCP
        Configure auditing to log TCP messages. Possible values = NONE, ALL
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Supported settings are: * GMT_TIME - Coordinated Universal Time. * LOCAL_TIME - Use the server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to nslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUpdateAuditNslogparams  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAuditNslogparams  -WhatIf
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
        [string] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [string] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Denylistviolations,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [string] $Logfacility,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [string[]] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Lsn,

        [Parameter()]
        [string] $ProtocolViolations,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SSLInterception,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberlog,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [string] $TCP,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [string] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UserDefinedAuditLog,

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

    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) {
        Assert-NSParameterValue -ParameterName 'ProtocolViolations' -Value $ProtocolViolations -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'NONE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Acl')) { $properties['acl'] = $Acl }
    if ($PSBoundParameters.ContainsKey('Alg')) { $properties['alg'] = $Alg }
    if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $properties['appflowexport'] = $AppFlowExPort }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $properties['contentinspectionlog'] = $ContentInSpecTionlog }
    if ($PSBoundParameters.ContainsKey('DateFormAt')) { $properties['dateformat'] = $DateFormAt }
    if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $properties['denylistviolations'] = $Denylistviolations }
    if ($PSBoundParameters.ContainsKey('Logfacility')) { $properties['logfacility'] = $Logfacility }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Lsn')) { $properties['lsn'] = $Lsn }
    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $properties['protocolviolations'] = $ProtocolViolations }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('SSLInterception')) { $properties['sslinterception'] = $SSLInterception }
    if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $properties['subscriberlog'] = $Subscriberlog }
    if ($PSBoundParameters.ContainsKey('TCP')) { $properties['tcp'] = $TCP }
    if ($PSBoundParameters.ContainsKey('Timezone')) { $properties['timezone'] = $Timezone }
    if ($PSBoundParameters.ContainsKey('URLFiltering')) { $properties['urlfiltering'] = $URLFiltering }
    if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $properties['userdefinedauditlog'] = $UserDefinedAuditLog }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('auditnslogparams', 'Update auditnslogparams')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type auditnslogparams -Payload @{ auditnslogparams = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAuditNslogparams

# region Invoke-NSUpdateAuditNSLogPolicy
function Invoke-NSUpdateAuditNSLogPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler auditnslogpolicy resource.
    .DESCRIPTION
        Configuration for ns log policy resource.
    .PARAMETER Action
        Nslog server action that is performed when this policy matches. NOTE: An nslog server action must be associated with an nslog audit policy. Minimum length = 1
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the nslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my nslog policy" or 'my nslog policy'). Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, that defines the messages to be logged to the nslog server. Minimum length = 1
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
        Invoke-NSUpdateAuditNSLogPolicy -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAuditNSLogPolicy -Name 'example' -WhatIf
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
        [string] $Action,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Rule,

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
    if ($PSBoundParameters.ContainsKey('Action')) { $properties['action'] = $Action }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update auditnslogpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type auditnslogpolicy -Payload @{ auditnslogpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditNSLogPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAuditNSLogPolicy

# region Invoke-NSUpdateAuditSyslogAction
function Invoke-NSUpdateAuditSyslogAction {
    <#
    .SYNOPSIS
        Updates a NetScaler auditsyslogaction resource.
    .DESCRIPTION
        Configuration for system log action resource.
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log alg info. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event information. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY. -U.S. style month/date/year format. * DDMMYYYY - European style date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER DNS
        Log DNS related syslog messages. Possible values = ENABLED, DISABLED
    .PARAMETER Domainresolvenow
        Immediately send a DNS query to resolve the server's domain name.
    .PARAMETER Domainresolveretry
        Time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the syslog server if the last query failed. Default value: 5 Minimum value = 5 Maximum value = 20939
    .PARAMETER HTTPAuthtoken
        Token for authenticating with the endpoint. If the endpoint requires the Authorization header in a particular format, specify the complete format as the value to this parameter. For eg., in case of splunk, the Authorization header is required to be of the form - Splunk <auth-token>. Maximum length = 256
    .PARAMETER HTTPEndpointURL
        The URL at which to upload the logs messages on the endpoint. Maximum length = 256
    .PARAMETER HTTPSChemaFile
        HTTP Schema file to input tokens to be sent in log message to log server. Maximum length = 256
    .PARAMETER LbVServerName
        Name of the LB vserver. Mutually exclusive with syslog serverIP/serverName. Minimum length = 1 Maximum length = 127
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Audit log level, which specifies the types of events to log. Available values function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Lsn
        Log lsn info. Possible values = ENABLED, DISABLED
    .PARAMETER Managementlog
        Management log specifies the categories of log files to be exported. It use destination and transport from PE params. Available values function as follows: * ALL - All categories (SHELL, NSMGMT and ACCESS). * SHELL - bash.log, and sh.log. * ACCESS - auth.log, nsvpn.log, httpaccess.log, httperror.log, httpaccess-vpn.log and httperror-vpn.log. * NSMGMT - notice.log and ns.log. * NONE - No logs. Possible values = ALL, SHELL, ACCESS, NSMGMT, NONE
    .PARAMETER MaxLogDataSizetohold
        Max size of log data that can be held in NSB chain of server info. Default value: 500 Minimum value = 50 Maximum value = 25600
    .PARAMETER Mgmtloglevel
        Management log level, which specifies the types of events to log. Available values function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * DEBUG - All events, in extreme detail. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE
    .PARAMETER Name
        Name of the syslog action. Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog action is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog action" or 'my syslog action'). Minimum length = 1
    .PARAMETER NetProfile
        Name of the network profile. The SNIP configured in the network profile will be used as source IP while sending log messages. Minimum length = 1 Maximum length = 127
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerDomainName
        SYSLOG server name as a FQDN. Mutually exclusive with serverIP/lbVserverName. Minimum length = 1 Maximum length = 255
    .PARAMETER ServerIp
        IP address of the syslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the syslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interception event information. Possible values = ENABLED, DISABLED
    .PARAMETER StreamAnalytics
        Export log stream analytics statistics to syslog server. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER SyslogCompliance
        Setting this parameter ensures that all the Audit Logs generated for this Syslog Action comply with an RFC. For example, set it to RFC5424 to ensure RFC 5424 compliance. Possible values = RFC5424
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER TCPProfileName
        Name of the TCP profile whose settings are to be applied to the audit server info to tune the TCP connection parameters. Minimum length = 1 Maximum length = 127
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Supported settings are: * GMT_TIME. Coordinated Universal time. * LOCAL_TIME. Use the server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to syslog. Setting this parameter to NO causes auditing to ignore all user-configured message actions. Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUpdateAuditSyslogAction -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAuditSyslogAction -Name 'example' -WhatIf
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
        [string] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [string] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Denylistviolations,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNS,

        [Parameter()]
        [bool] $Domainresolvenow,

        [Parameter()]
        [int] $Domainresolveretry,

        [Parameter()]
        [string] $HTTPAuthtoken,

        [Parameter()]
        [string] $HTTPEndpointURL,

        [Parameter()]
        [string] $HTTPSChemaFile,

        [Parameter()]
        [string] $LbVServerName,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [string] $Logfacility,

        [Parameter()]
        [ValidateSet('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE')]
        [string[]] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Lsn,

        [Parameter()]
        [string[]] $Managementlog,

        [Parameter()]
        [int] $MaxLogDataSizetohold,

        [Parameter()]
        [string[]] $Mgmtloglevel,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $NetProfile,

        [Parameter()]
        [string] $ProtocolViolations,

        [Parameter()]
        [string] $ServerDomainName,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SSLInterception,

        [Parameter()]
        [string] $StreamAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberlog,

        [Parameter()]
        [string] $SyslogCompliance,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [string] $TCP,

        [Parameter()]
        [string] $TCPProfileName,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [string] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UserDefinedAuditLog,

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

    if ($PSBoundParameters.ContainsKey('Mgmtloglevel')) {
        Assert-NSParameterValue -ParameterName 'Mgmtloglevel' -Value $Mgmtloglevel -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) {
        Assert-NSParameterValue -ParameterName 'ProtocolViolations' -Value $ProtocolViolations -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'NONE') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('StreamAnalytics')) {
        Assert-NSParameterValue -ParameterName 'StreamAnalytics' -Value $StreamAnalytics -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('SyslogCompliance')) {
        Assert-NSParameterValue -ParameterName 'SyslogCompliance' -Value $SyslogCompliance -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('RFC5424') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Acl')) { $properties['acl'] = $Acl }
    if ($PSBoundParameters.ContainsKey('Alg')) { $properties['alg'] = $Alg }
    if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $properties['appflowexport'] = $AppFlowExPort }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $properties['contentinspectionlog'] = $ContentInSpecTionlog }
    if ($PSBoundParameters.ContainsKey('DateFormAt')) { $properties['dateformat'] = $DateFormAt }
    if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $properties['denylistviolations'] = $Denylistviolations }
    if ($PSBoundParameters.ContainsKey('DNS')) { $properties['dns'] = $DNS }
    if ($PSBoundParameters.ContainsKey('Domainresolvenow')) { $properties['domainresolvenow'] = $Domainresolvenow }
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('HTTPAuthtoken')) { $properties['httpauthtoken'] = $HTTPAuthtoken }
    if ($PSBoundParameters.ContainsKey('HTTPEndpointURL')) { $properties['httpendpointurl'] = $HTTPEndpointURL }
    if ($PSBoundParameters.ContainsKey('HTTPSChemaFile')) { $properties['httpschemafile'] = $HTTPSChemaFile }
    if ($PSBoundParameters.ContainsKey('LbVServerName')) { $properties['lbvservername'] = $LbVServerName }
    if ($PSBoundParameters.ContainsKey('Logfacility')) { $properties['logfacility'] = $Logfacility }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Lsn')) { $properties['lsn'] = $Lsn }
    if ($PSBoundParameters.ContainsKey('Managementlog')) { $properties['managementlog'] = $Managementlog }
    if ($PSBoundParameters.ContainsKey('MaxLogDataSizetohold')) { $properties['maxlogdatasizetohold'] = $MaxLogDataSizetohold }
    if ($PSBoundParameters.ContainsKey('Mgmtloglevel')) { $properties['mgmtloglevel'] = $Mgmtloglevel }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('NetProfile')) { $properties['netprofile'] = $NetProfile }
    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $properties['protocolviolations'] = $ProtocolViolations }
    if ($PSBoundParameters.ContainsKey('ServerDomainName')) { $properties['serverdomainname'] = $ServerDomainName }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('SSLInterception')) { $properties['sslinterception'] = $SSLInterception }
    if ($PSBoundParameters.ContainsKey('StreamAnalytics')) { $properties['streamanalytics'] = $StreamAnalytics }
    if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $properties['subscriberlog'] = $Subscriberlog }
    if ($PSBoundParameters.ContainsKey('SyslogCompliance')) { $properties['syslogcompliance'] = $SyslogCompliance }
    if ($PSBoundParameters.ContainsKey('TCP')) { $properties['tcp'] = $TCP }
    if ($PSBoundParameters.ContainsKey('TCPProfileName')) { $properties['tcpprofilename'] = $TCPProfileName }
    if ($PSBoundParameters.ContainsKey('Timezone')) { $properties['timezone'] = $Timezone }
    if ($PSBoundParameters.ContainsKey('URLFiltering')) { $properties['urlfiltering'] = $URLFiltering }
    if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $properties['userdefinedauditlog'] = $UserDefinedAuditLog }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update auditsyslogaction')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type auditsyslogaction -Payload @{ auditsyslogaction = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditSyslogAction -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAuditSyslogAction

# region Invoke-NSUpdateAuditSyslogParams
function Invoke-NSUpdateAuditSyslogParams {
    <#
    .SYNOPSIS
        Updates a NetScaler auditsyslogparams resource.
    .DESCRIPTION
        Configuration for system log parameters resource.
    .PARAMETER Acl
        Log access control list (ACL) messages. Possible values = ENABLED, DISABLED
    .PARAMETER Alg
        Log the ALG messages. Possible values = ENABLED, DISABLED
    .PARAMETER AppFlowExPort
        Export log messages to AppFlow collectors. Appflow collectors are entities to which log messages can be sent so that some action can be performed on them. Possible values = ENABLED, DISABLED
    .PARAMETER ContentInSpecTionlog
        Log Content Inspection event ifnormation. Possible values = ENABLED, DISABLED
    .PARAMETER DateFormAt
        Format of dates in the logs. Supported formats are: * MMDDYYYY - U.S. style month/date/year format. * DDMMYYYY. European style -date/month/year format. * YYYYMMDD - ISO style year/month/date format. Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD
    .PARAMETER Denylistviolations
        Log denylist violations. Possible values = ENABLED, DISABLED
    .PARAMETER DNS
        Log DNS related syslog messages. Possible values = ENABLED, DISABLED
    .PARAMETER Logfacility
        Facility value, as defined in RFC 3164, assigned to the log message. Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7). Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external. Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7
    .PARAMETER Loglevel
        Types of information to be logged. Available settings function as follows: * ALL - All events. * EMERGENCY - Events that indicate an immediate crisis on the server. * ALERT - Events that might require action. * CRITICAL - Events that indicate an imminent server crisis. * ERROR - Events that indicate some type of error. * WARNING - Events that require action in the near future. * NOTICE - Events that the administrator should know about. * INFORMATIONAL - All but low-level events. * NONE - No events. Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, NONE
    .PARAMETER Lsn
        Log the LSN messages. Possible values = ENABLED, DISABLED
    .PARAMETER ProtocolViolations
        Log protocol violations. Possible values = ALL, NONE
    .PARAMETER ServerIp
        IP address of the syslog server. Minimum length = 1
    .PARAMETER ServerPort
        Port on which the syslog server accepts connections. Minimum value = 1
    .PARAMETER SSLInterception
        Log SSL Interceptionn event information. Possible values = ENABLED, DISABLED
    .PARAMETER StreamAnalytics
        Export log stream analytics statistics to syslog server. Possible values = ENABLED, DISABLED
    .PARAMETER Subscriberlog
        Log subscriber session event information. Possible values = ENABLED, DISABLED
    .PARAMETER TCP
        Log TCP messages. Possible values = NONE, ALL
    .PARAMETER Timezone
        Time zone used for date and timestamps in the logs. Available settings function as follows: * GMT_TIME - Coordinated Universal Time. * LOCAL_TIME Use the server's timezone setting. Possible values = GMT_TIME, LOCAL_TIME
    .PARAMETER URLFiltering
        Log URL filtering event information. Possible values = ENABLED, DISABLED
    .PARAMETER UserDefinedAuditLog
        Log user-configurable log messages to syslog. Setting this parameter to NO causes audit to ignore all user-configured message actions. Setting this parameter to YES causes audit to log user-configured message actions that meet the other logging criteria. Possible values = YES, NO
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
        Invoke-NSUpdateAuditSyslogParams  -PassThru
    .EXAMPLE
        Invoke-NSUpdateAuditSyslogParams  -WhatIf
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
        [string] $Acl,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Alg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $AppFlowExPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $ContentInSpecTionlog,

        [Parameter()]
        [ValidateSet('MMDDYYYY', 'DDMMYYYY', 'YYYYMMDD')]
        [string] $DateFormAt,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Denylistviolations,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $DNS,

        [Parameter()]
        [ValidateSet('LOCAL0', 'LOCAL1', 'LOCAL2', 'LOCAL3', 'LOCAL4', 'LOCAL5', 'LOCAL6', 'LOCAL7')]
        [string] $Logfacility,

        [Parameter()]
        [string[]] $Loglevel,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Lsn,

        [Parameter()]
        [string] $ProtocolViolations,

        [Parameter()]
        [string] $ServerIp,

        [Parameter()]
        [int] $ServerPort,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SSLInterception,

        [Parameter()]
        [string] $StreamAnalytics,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscriberlog,

        [Parameter()]
        [ValidateSet('NONE', 'ALL')]
        [string] $TCP,

        [Parameter()]
        [ValidateSet('GMT_TIME', 'LOCAL_TIME')]
        [string] $Timezone,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $URLFiltering,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $UserDefinedAuditLog,

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

    if ($PSBoundParameters.ContainsKey('Loglevel')) {
        Assert-NSParameterValue -ParameterName 'Loglevel' -Value $Loglevel -AllowedValuesByVersion @{ '13.1' = @('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG', 'NONE'); '14.1' = @('ALL', 'EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'NONE') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) {
        Assert-NSParameterValue -ParameterName 'ProtocolViolations' -Value $ProtocolViolations -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ALL', 'NONE') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('StreamAnalytics')) {
        Assert-NSParameterValue -ParameterName 'StreamAnalytics' -Value $StreamAnalytics -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Acl')) { $properties['acl'] = $Acl }
    if ($PSBoundParameters.ContainsKey('Alg')) { $properties['alg'] = $Alg }
    if ($PSBoundParameters.ContainsKey('AppFlowExPort')) { $properties['appflowexport'] = $AppFlowExPort }
    if ($PSBoundParameters.ContainsKey('ContentInSpecTionlog')) { $properties['contentinspectionlog'] = $ContentInSpecTionlog }
    if ($PSBoundParameters.ContainsKey('DateFormAt')) { $properties['dateformat'] = $DateFormAt }
    if ($PSBoundParameters.ContainsKey('Denylistviolations')) { $properties['denylistviolations'] = $Denylistviolations }
    if ($PSBoundParameters.ContainsKey('DNS')) { $properties['dns'] = $DNS }
    if ($PSBoundParameters.ContainsKey('Logfacility')) { $properties['logfacility'] = $Logfacility }
    if ($PSBoundParameters.ContainsKey('Loglevel')) { $properties['loglevel'] = $Loglevel }
    if ($PSBoundParameters.ContainsKey('Lsn')) { $properties['lsn'] = $Lsn }
    if ($PSBoundParameters.ContainsKey('ProtocolViolations')) { $properties['protocolviolations'] = $ProtocolViolations }
    if ($PSBoundParameters.ContainsKey('ServerIp')) { $properties['serverip'] = $ServerIp }
    if ($PSBoundParameters.ContainsKey('ServerPort')) { $properties['serverport'] = $ServerPort }
    if ($PSBoundParameters.ContainsKey('SSLInterception')) { $properties['sslinterception'] = $SSLInterception }
    if ($PSBoundParameters.ContainsKey('StreamAnalytics')) { $properties['streamanalytics'] = $StreamAnalytics }
    if ($PSBoundParameters.ContainsKey('Subscriberlog')) { $properties['subscriberlog'] = $Subscriberlog }
    if ($PSBoundParameters.ContainsKey('TCP')) { $properties['tcp'] = $TCP }
    if ($PSBoundParameters.ContainsKey('Timezone')) { $properties['timezone'] = $Timezone }
    if ($PSBoundParameters.ContainsKey('URLFiltering')) { $properties['urlfiltering'] = $URLFiltering }
    if ($PSBoundParameters.ContainsKey('UserDefinedAuditLog')) { $properties['userdefinedauditlog'] = $UserDefinedAuditLog }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('auditsyslogparams', 'Update auditsyslogparams')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type auditsyslogparams -Payload @{ auditsyslogparams = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateAuditSyslogParams

# region Invoke-NSUpdateAuditSyslogPolicy
function Invoke-NSUpdateAuditSyslogPolicy {
    <#
    .SYNOPSIS
        Updates a NetScaler auditsyslogpolicy resource.
    .DESCRIPTION
        Configuration for system log policy resource.
    .PARAMETER Action
        Syslog server action to perform when this policy matches traffic. NOTE: A syslog server action must be associated with a syslog audit policy. Minimum length = 1
    .PARAMETER Name
        Name for the policy. Must begin with a letter, number, or the underscore character (_), and must consist only of letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore characters. Cannot be changed after the syslog policy is added. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog policy" or 'my syslog policy'). Minimum length = 1
    .PARAMETER Rule
        Name of the Citrix ADC named rule, or an expression, that defines the messages to be logged to the syslog server. Minimum length = 1
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
        Invoke-NSUpdateAuditSyslogPolicy -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateAuditSyslogPolicy -Name 'example' -WhatIf
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
        [string] $Action,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Rule,

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
    if ($PSBoundParameters.ContainsKey('Action')) { $properties['action'] = $Action }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Rule')) { $properties['rule'] = $Rule }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update auditsyslogpolicy')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type auditsyslogpolicy -Payload @{ auditsyslogpolicy = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetAuditSyslogPolicy -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateAuditSyslogPolicy

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAxoUFwXZdLD2bd
# Rqhco0bllWmkz7R1QEYnfXdiNq5l4aCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCDKbLOcmKSxjTgQxczY52PoKuqr7SiCmZdRZW0Xf9//
# PTANBgkqhkiG9w0BAQEFAASCAYAKts6/kbnw9iwSGwD86gTHC07K1hnPTupWa2cc
# ylKaEmEBXh+0uc4OE88+xm0biutjL6UTcW1SrnadXDqir+5RRdQbRPEvDHMKT55C
# 4eKFrBE5clAMjQPvun397WBQnCp4uH69wSTeNNxf/cccS8HxElvJDtPqLFykneYc
# nLNDgjMix3NOK1BZ1QT0afWYTxE0ThBwwPRW7SyU++s0EMpKuDJYrq4wtU73KCfy
# HmyRdeRiMA8dwLKD5RzqfUi1uEElA6AwdQyofmGASMhs4vAn7aYXLJvPuOYiHfyp
# u8rF7bJM9jcJjh5HvnIkNDTmIi2GuaynAGFd8gSwgeqrREuQfRtMnyNFdwrLkY6Y
# nylHvAI9xjk/A1B3J24N3fciQrBoUxmRJWOyFxBabB74Niz8ygyPa8n7YTU+Emr7
# vHCx4eP2IqEFqx6HLIYDfcSUimQWTbRcNlVn4bZpPkSXAzc/uJPOyEhbJohTxkrs
# HfYDiJifzkYwbdErPiiuRcZ0wkOhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU0MTdaMD8GCSqGSIb3
# DQEJBDEyBDDeH+5ZSRFdf9nXDZZUEu2qekuI2a4sxiqjGVxr/1wYDlpevE3JfoAr
# LXhADaG8rrIwDQYJKoZIhvcNAQEBBQAEggIADTIYNqdXzPeUqyzRXXXiT7uh+4sY
# NdrabRCVn94L+G2B6Gn9xpHnOSGVuWJxdd0rtHNfkDRduGRD0h6J2KQsoUa5SDi3
# UyqvCMaplXuHVaKOuHo2rd/Br8CLKj8ClCp3RRr97Dv1Me5JZ2C0gXT2pFkxfI37
# 1SPgD6hORwvvITfACfgUEt5kLE/GOK6w5dzjIeVy4jo0SeFQ1h67iCeL1LkP03Ca
# 94eXGILTRe0BqWcAnFQ6krgSXGtwAhRzWk/7U8W8URM6WBmaO1nxricYO4m5/975
# 8NrGt2Mi3EEQtESk+vorgbUFq+LvS2WuL34+WdykwBf24QHKe6xuLoyKqVPMIAau
# 6Rs5nB9g3sP5OS8DGyId/ZSBijFbMww4Nw/ovedJ1y/Y4ZyxzfL/qR/kKlvxTL6V
# 04SFJsZZhv8bNysV4oLcwy7y+Gvmhh46xw+0b1WHV1jV+PbQ13gx1aoxI50X19ge
# X+e2E8hxpluMIuloPgbhw8DFvj0HrBkncGh+WOS+c9N1/Fc3IPd/r16QffK+a7Z2
# dPP/DRZnJR18hi5tEtYoKOHm9UTwgZLJ4ZO6Yf3i+3W4LeXLmGWXr6q44HF5s6Jz
# qISh/Yl48TLdKBBm4Itzjj4J/j0qy2dfGCQZzGQck5YP3LtMqwA2CRxh664jw3VE
# i4O+Q8ELbJcCPuM=
# SIG # End signature block
