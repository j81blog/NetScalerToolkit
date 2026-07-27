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
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAxoUFwXZdLD2bd
# Rqhco0bllWmkz7R1QEYnfXdiNq5l4aCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgymyz
# nJiksY04EMXM2Odj6Crqq+0ogpmXUWVtF3/f/z0wDQYJKoZIhvcNAQEBBQAEggGA
# UAXHtJqA+UHlvEQcxNibwysJBcjUJ74DAdKlQAw/2Q5b328Es1FUpOoOy1Flvvf7
# OE9yrwLc3C6pDpinSGvK2iNR6yznP7ctKBumwE17Zau5aO7nmMJaBUl3mGtUgkEI
# vf9xXPKhdErDzrxP3KGMvVNB0heV9Zgp7dAg5uMBHvK5ABVenKH3uyKuNHhRphM6
# ovQQ/AMiS6/9IvXwauLYOpe+z2WAlh9+gHV8AsS4pmkoc8KYXpAxCA93PBd8DgIq
# VIfZJRpzaT8Qy3FMwyCTPh8kSL2mSmN4vOJA0BdBtqN7lpQHrO8uQxE2RN9pnU7q
# ydSHQJcULQ3b1ZyplJOMTe0gZF7cAB7yl9zXgAs2jtH+C63U7T34MU+jRQ9/GuP9
# DBNwEgbXKwCLmNho8tfh7DuD2nBxylM+O85///5a1e0hdrjQ1A5+DZca1KNqKnFb
# zUK6aeKlUPlp8WtPREVcM0vhh89HKhn68mMXvbtZMMnlAuht1Hdds4gYYziueFTX
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIJIUoi9g6+SeiPAVZyYg
# x52h5cp1ryP2ptX2ofR7S7UeAgZqY0xd+FYYEzIwMjYwNzI3MTMxMDM2LjMxNVow
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
# IgQgVKqpP5SrJy021yLryOJlerB4trzZoeuNbZNB9NciVYEwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCDCIbzA/sTJ9lK41E2E
# e3HD+l/k7kSAMB0qHDpqQwel0DANBgkqhkiG9w0BAQsFAASCAgAEjakwhwcT9XjW
# bIR9Bi51kmY8E5I/t1X606lUJwdCx77Bi4DYabddYJX+TC4Tmdb/0/l0RTU+le0n
# MaAF1ujSPAYBw9hxcif5547MPA0son0VKw0llrlqEuYadI1nlwfKY4QaLsNPUSmU
# GGV7IlA6Yb8n0NUWIud+2Mo6S4QS5yT02JQ+Ck1m6lldCqFMkuPPXS79CiKbznN9
# PvQbQy3P76a4+K7g54gQd5MplGx7EbdaNEq1CiVuJg9ZWgyNXqXI+xYt4ElFsnWy
# 9AnFe/J2g1ge5hcwZbz7GCDePsLKOi3GfpFjGnHtYUMxxVkB0674g/0MwqgPQhpv
# BfOr3ezj6Ld5/L+HQhhAmItWkKwKYrP/R5WsmlXj8zsV7kuiRK3AfiQz+wg89g6z
# nvL0ON2IbNT6uasEq4QcFbUX1pKEsZpCnaaTbL1uUU4tNO3T7mDtuTf2Uvi8QfOU
# T61jmdzkwjzqRKIU77ztoBCoPcndHrrMQ9o9bD52lAUk60y8gEiQBxh9xeRrRy5z
# eunst1VJ/pjf5QKvYLqNb/wedEqA6H+BPa9xuyy3qJ9vl1o6HOLVnu8kT/0+LVB0
# XOpT5nL6X28ie45bpal73KYJ6VtnHhLOgNRlWCDe8CO4adex6Y40gVEPVXoXkEw+
# VUzb2s7Ve6hv5FjRbG2Am3rTpFA5RQ==
# SIG # End signature block
