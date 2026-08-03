# Generated NetScalerToolkit Configuration bundle for category 'snmp'.

# region Invoke-NSAddSNMPCommUnitY
function Invoke-NSAddSNMPCommUnitY {
    <#
    .SYNOPSIS
        Creates a NetScaler snmpcommunity resource.
    .DESCRIPTION
        Configuration for community resource.
    .PARAMETER CommUnitYName
        The SNMP community string. Can consist of 1 to 32 characters that include uppercase and lowercase letters,numbers and special characters. The following requirement applies only to the Citrix ADC CLI: If the string includes one or more spaces, enclose the name in double or single quotation marks (for example, "my string" or 'my string'). Minimum length = 1
    .PARAMETER Permissions
        The SNMP V1 or V2 query-type privilege that you want to associate with this SNMP community. Possible values = GET, GET_NEXT, GET_BULK, SET, ALL
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
        Invoke-NSAddSNMPCommUnitY -CommUnitYName 'example' -Permissions GET -PassThru
    .EXAMPLE
        Invoke-NSAddSNMPCommUnitY -CommUnitYName 'example' -Permissions GET -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $CommUnitYName,

        [Parameter(Mandatory)]
        [ValidateSet('GET', 'GET_NEXT', 'GET_BULK', 'SET', 'ALL')]
        [string] $Permissions,

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
    if ($PSBoundParameters.ContainsKey('CommUnitYName')) { $properties['communityname'] = $CommUnitYName }
    if ($PSBoundParameters.ContainsKey('Permissions')) { $properties['permissions'] = $Permissions }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$CommUnitYName", 'Create snmpcommunity')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpcommunity -Payload @{ snmpcommunity = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPCommUnitY -CommUnitYName $CommUnitYName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddSNMPCommUnitY

# region Invoke-NSAddSNMPGroup
function Invoke-NSAddSNMPGroup {
    <#
    .SYNOPSIS
        Creates a NetScaler snmpgroup resource.
    .DESCRIPTION
        Configuration for SNMP group resource.
    .PARAMETER Name
        Name for the SNMPv3 group. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the SNMPv3 group. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my name" or 'my name'). Minimum length = 1
    .PARAMETER ReadviewName
        Name of the configured SNMPv3 view that you want to bind to this SNMPv3 group. An SNMPv3 user bound to this group can access the subtrees that are bound to this SNMPv3 view as type INCLUDED, but cannot access the ones that are type EXCLUDED. If the Citrix ADC has multiple SNMPv3 view entries with the same name, all such entries are associated with the SNMPv3 group. Minimum length = 1
    .PARAMETER Securitylevel
        Security level required for communication between the Citrix ADC and the SNMPv3 users who belong to the group. Specify one of the following options: noAuthNoPriv. Require neither authentication nor encryption. authNoPriv. Require authentication but no encryption. authPriv. Require authentication and encryption. Note: If you specify authentication, you must specify an encryption algorithm when you assign an SNMPv3 user to the group. If you also specify encryption, you must assign both an authentication and an encryption algorithm for each group member. Possible values = noAuthNoPriv, authNoPriv, authPriv
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
        Invoke-NSAddSNMPGroup -Name 'example' -ReadviewName 'example' -Securitylevel noAuthNoPriv -PassThru
    .EXAMPLE
        Invoke-NSAddSNMPGroup -Name 'example' -ReadviewName 'example' -Securitylevel noAuthNoPriv -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $ReadviewName,

        [Parameter(Mandatory)]
        [ValidateSet('noAuthNoPriv', 'authNoPriv', 'authPriv')]
        [string] $Securitylevel,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ReadviewName')) { $properties['readviewname'] = $ReadviewName }
    if ($PSBoundParameters.ContainsKey('Securitylevel')) { $properties['securitylevel'] = $Securitylevel }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create snmpgroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpgroup -Payload @{ snmpgroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPGroup -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddSNMPGroup

# region Invoke-NSAddSNMPManager
function Invoke-NSAddSNMPManager {
    <#
    .SYNOPSIS
        Creates a NetScaler snmpmanager resource.
    .DESCRIPTION
        Configuration for manager resource.
    .PARAMETER Domainresolveretry
        Amount of time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the SNMP manager if the last query failed. This parameter is valid for host-name based SNMP managers only. After a query succeeds, the TTL determines the wait time. The minimum and default value is 5. Minimum value = 5 Maximum value = 20939
    .PARAMETER Ipaddress
        IP address of the SNMP manager. Can be an IPv4 or IPv6 address. You can instead specify an IPv4 network address or IPv6 network prefix if you want the Citrix ADC to respond to SNMP queries from any device on the specified network. Alternatively, instead of an IPv4 address, you can specify a host name that has been assigned to an SNMP manager. If you do so, you must add a DNS name server that resolves the host name of the SNMP manager to its IP address. Note: The Citrix ADC does not support host names for SNMP managers that have IPv6 addresses. Minimum length = 1 Maximum length = 255
    .PARAMETER NetMask
        Subnet mask associated with an IPv4 network address. If the IP address specifies the address or host name of a specific host, accept the default value of 255.255.255.255.
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
        Invoke-NSAddSNMPManager -Ipaddress 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddSNMPManager -Ipaddress 'example' -WhatIf
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
        [int] $Domainresolveretry,

        [Parameter(Mandatory, Position = 0)]
        [string] $Ipaddress,

        [Parameter()]
        [string] $NetMask,

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
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ipaddress", 'Create snmpmanager')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpmanager -Payload @{ snmpmanager = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPManager -Ipaddress $Ipaddress -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddSNMPManager

# region Invoke-NSAddSNMPTrap
function Invoke-NSAddSNMPTrap {
    <#
    .SYNOPSIS
        Creates a NetScaler snmptrap resource.
    .DESCRIPTION
        Configuration for snmp trap resource.
    .PARAMETER AllPartitionS
        Send traps of all partitions to this destination. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CommUnitYName
        Password (string) sent with the trap messages, so that the trap listener can authenticate them. Can include 1 to 32 uppercase or lowercase letters, numbers, and hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. You must specify the same community string on the trap listener device. Otherwise, the trap listener drops the trap messages. The following requirement applies only to the Citrix ADC CLI: If the string includes one or more spaces, enclose the name in double or single quotation marks (for example, "my string" or 'my string').
    .PARAMETER DestPort
        UDP port at which the trap listener listens for trap messages. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: 162 Minimum value = 1 Maximum value = 65534
    .PARAMETER Severity
        Severity level at or above which the Citrix ADC sends trap messages to this trap listener. The severity levels, in increasing order of severity, are Informational, Warning, Minor, Major, Critical. This parameter can be set for trap listeners of type SPECIFIC only. The default is to send all levels of trap messages. Important: Trap messages are not assigned severity levels unless you specify severity levels when configuring SNMP alarms. Default value: Unknown Possible values = Critical, Major, Minor, Warning, Informational
    .PARAMETER Srcip
        IPv4 or IPv6 address that the Citrix ADC inserts as the source IP address in all SNMP trap messages that it sends to this trap listener. By default this is the appliance's NSIP or NSIP6 address, but you can specify an IPv4 MIP or SNIP/SNIP6 address. In cluster setup, the default value is the individual node's NSIP, but it can be set to CLIP or Striped SNIP address. In non default partition, this parameter must be set to the SNIP/SNIP6 address. Minimum length = 1
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER TrapClass
        Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file. Possible values = generic, specific
    .PARAMETER TrapDestination
        IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages. Minimum length = 1
    .PARAMETER Version
        SNMP version, which determines the format of trap messages sent to the trap listener. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: V2 Possible values = V1, V2, V3
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
        Invoke-NSAddSNMPTrap -TrapClass generic -TrapDestination 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddSNMPTrap -TrapClass generic -TrapDestination 'example' -WhatIf
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
        [string] $AllPartitionS,

        [Parameter()]
        [string] $CommUnitYName,

        [Parameter()]
        [int] $DestPort,

        [Parameter()]
        [ValidateSet('Critical', 'Major', 'Minor', 'Warning', 'Informational')]
        [string] $Severity,

        [Parameter()]
        [string] $Srcip,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter(Mandatory, Position = 0)]
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

        [Parameter(Mandatory)]
        [string] $TrapDestination,

        [Parameter()]
        [ValidateSet('V1', 'V2', 'V3')]
        [string] $Version,

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
    if ($PSBoundParameters.ContainsKey('AllPartitionS')) { $properties['allpartitions'] = $AllPartitionS }
    if ($PSBoundParameters.ContainsKey('CommUnitYName')) { $properties['communityname'] = $CommUnitYName }
    if ($PSBoundParameters.ContainsKey('DestPort')) { $properties['destport'] = $DestPort }
    if ($PSBoundParameters.ContainsKey('Severity')) { $properties['severity'] = $Severity }
    if ($PSBoundParameters.ContainsKey('Srcip')) { $properties['srcip'] = $Srcip }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('TrapClass')) { $properties['trapclass'] = $TrapClass }
    if ($PSBoundParameters.ContainsKey('TrapDestination')) { $properties['trapdestination'] = $TrapDestination }
    if ($PSBoundParameters.ContainsKey('Version')) { $properties['version'] = $Version }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$TrapClass", 'Create snmptrap')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmptrap -Payload @{ snmptrap = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPTrap -TrapClass $TrapClass -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddSNMPTrap

# region Invoke-NSAddSNMPTrapSNMPUserBinding
function Invoke-NSAddSNMPTrapSNMPUserBinding {
    <#
    .SYNOPSIS
        Invokes the new operation for a NetScaler snmptrap_snmpuser_binding resource.
    .DESCRIPTION
        Binding object showing the snmpuser that can be bound to snmptrap.
    .PARAMETER Securitylevel
        Security level of the SNMPv3 trap. Default value: authNoPriv, Possible values = noAuthNoPriv, authNoPriv, authPriv
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER TrapClass
        Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file. Possible values = generic, specific
    .PARAMETER TrapDestination
        IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages. Minimum length = 1
    .PARAMETER UserName
        Name of the SNMP user that will send the SNMPv3 traps.
    .PARAMETER Version
        SNMP version, which determines the format of trap messages sent to the trap listener. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: V3 Possible values = V1, V2, V3
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
        Invoke-NSAddSNMPTrapSNMPUserBinding -TrapClass generic -TrapDestination 'example' -UserName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddSNMPTrapSNMPUserBinding -TrapClass generic -TrapDestination 'example' -UserName 'example' -WhatIf
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
        [ValidateSet('noAuthNoPriv', 'authNoPriv', 'authPriv')]
        [string] $Securitylevel,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter(Mandatory, Position = 0)]
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

        [Parameter(Mandatory)]
        [string] $TrapDestination,

        [Parameter(Mandatory)]
        [string] $UserName,

        [Parameter()]
        [ValidateSet('V1', 'V2', 'V3')]
        [string] $Version,

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
    if ($PSBoundParameters.ContainsKey('Securitylevel')) { $properties['securitylevel'] = $Securitylevel }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('TrapClass')) { $properties['trapclass'] = $TrapClass }
    if ($PSBoundParameters.ContainsKey('TrapDestination')) { $properties['trapdestination'] = $TrapDestination }
    if ($PSBoundParameters.ContainsKey('UserName')) { $properties['username'] = $UserName }
    if ($PSBoundParameters.ContainsKey('Version')) { $properties['version'] = $Version }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$TrapClass", 'Create snmptrap_snmpuser_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmptrap_snmpuser_binding -Payload @{ snmptrap_snmpuser_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPTrapSNMPUserBinding -TrapClass $TrapClass -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddSNMPTrapSNMPUserBinding

# region Invoke-NSAddSNMPUser
function Invoke-NSAddSNMPUser {
    <#
    .SYNOPSIS
        Creates a NetScaler snmpuser resource.
    .DESCRIPTION
        Configuration for SNMP user resource.
    .PARAMETER Authpasswd
        Plain-text pass phrase to be used by the authentication algorithm specified by the authType (Authentication Type) parameter. Can consist of 8 to 64 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the pass phrase includes one or more spaces, enclose it in double or single quotation marks (for example, "my phrase" or 'my phrase'). Minimum length = 8
    .PARAMETER AuthType
        Authentication algorithm used by the Citrix ADC and the SNMPv3 user for authenticating the communication between them. You must specify the same authentication algorithm when you configure the SNMPv3 user in the SNMP manager. Possible values = MD5, SHA, SHA256, SHA512
    .PARAMETER Group
        Name of the configured SNMPv3 group to which to bind this SNMPv3 user. The access rights (bound SNMPv3 views) and security level set for this group are assigned to this user. Minimum length = 1
    .PARAMETER Name
        Name for the SNMPv3 user. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my user" or 'my user'). Minimum length = 1
    .PARAMETER Privpasswd
        Encryption key to be used by the encryption algorithm specified by the privType (Encryption Type) parameter. Can consist of 8 to 64 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the key includes one or more spaces, enclose it in double or single quotation marks (for example, "my key" or 'my key'). Minimum length = 8
    .PARAMETER PrivType
        Encryption algorithm used by the Citrix ADC and the SNMPv3 user for encrypting the communication between them. You must specify the same encryption algorithm when you configure the SNMPv3 user in the SNMP manager. Possible values = DES, AES, AES192, AES256
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
        Invoke-NSAddSNMPUser -Name 'example' -Group 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddSNMPUser -Name 'example' -Group 'example' -WhatIf
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
        [string] $Authpasswd,

        [Parameter()]
        [string] $AuthType,

        [Parameter(Mandatory)]
        [string] $Group,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Privpasswd,

        [Parameter()]
        [string] $PrivType,

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

    if ($PSBoundParameters.ContainsKey('AuthType')) {
        Assert-NSParameterValue -ParameterName 'AuthType' -Value $AuthType -AllowedValuesByVersion @{ '13.1' = @('MD5', 'SHA'); '14.1' = @('MD5', 'SHA', 'SHA256', 'SHA512') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('PrivType')) {
        Assert-NSParameterValue -ParameterName 'PrivType' -Value $PrivType -AllowedValuesByVersion @{ '13.1' = @('DES', 'AES'); '14.1' = @('DES', 'AES', 'AES192', 'AES256') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Authpasswd')) { $properties['authpasswd'] = $Authpasswd }
    if ($PSBoundParameters.ContainsKey('AuthType')) { $properties['authtype'] = $AuthType }
    if ($PSBoundParameters.ContainsKey('Group')) { $properties['group'] = $Group }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Privpasswd')) { $properties['privpasswd'] = $Privpasswd }
    if ($PSBoundParameters.ContainsKey('PrivType')) { $properties['privtype'] = $PrivType }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create snmpuser')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpuser -Payload @{ snmpuser = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPUser -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddSNMPUser

# region Invoke-NSAddSNMPView
function Invoke-NSAddSNMPView {
    <#
    .SYNOPSIS
        Creates a NetScaler snmpview resource.
    .DESCRIPTION
        Configuration for view resource.
    .PARAMETER Name
        Name for the SNMPv3 view. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the SNMPv3 view. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my view" or 'my view'). Minimum length = 1
    .PARAMETER Subtree
        A particular branch (subtree) of the MIB tree that you want to associate with this SNMPv3 view. You must specify the subtree as an SNMP OID. Minimum length = 1
    .PARAMETER Type
        Include or exclude the subtree, specified by the subtree parameter, in or from this view. This setting can be useful when you have included a subtree, such as A, in an SNMPv3 view and you want to exclude a specific subtree of A, such as B, from the SNMPv3 view. Possible values = included, excluded
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
        Invoke-NSAddSNMPView -Name 'example' -Subtree 'example' -Type included -PassThru
    .EXAMPLE
        Invoke-NSAddSNMPView -Name 'example' -Subtree 'example' -Type included -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Subtree,

        [Parameter(Mandatory)]
        [ValidateSet('included', 'excluded')]
        [string] $Type,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Subtree')) { $properties['subtree'] = $Subtree }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create snmpview')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpview -Payload @{ snmpview = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPView -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddSNMPView

# region Invoke-NSDeleteSNMPCommUnitY
function Invoke-NSDeleteSNMPCommUnitY {
    <#
    .SYNOPSIS
        Removes a NetScaler snmpcommunity resource.
    .DESCRIPTION
        Configuration for community resource.
    .PARAMETER CommUnitYName
        The SNMP community string. Can consist of 1 to 32 characters that include uppercase and lowercase letters,numbers and special characters. The following requirement applies only to the Citrix ADC CLI: If the string includes one or more spaces, enclose the name in double or single quotation marks (for example, "my string" or 'my string'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteSNMPCommUnitY -CommUnitYName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetSNMPCommUnitY -CommUnitYName 'snmpcommunity_example' | Invoke-NSDeleteSNMPCommUnitY -Confirm:$false
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
        [string] $CommUnitYName,

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

        if ($PSCmdlet.ShouldProcess("$CommUnitYName", 'Delete snmpcommunity')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type snmpcommunity -Resource $CommUnitYName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteSNMPCommUnitY

# region Invoke-NSDeleteSNMPGroup
function Invoke-NSDeleteSNMPGroup {
    <#
    .SYNOPSIS
        Removes a NetScaler snmpgroup resource.
    .DESCRIPTION
        Configuration for SNMP group resource.
    .PARAMETER Name
        Name for the SNMPv3 group. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the SNMPv3 group. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my name" or 'my name'). Minimum length = 1
    .PARAMETER Securitylevel
        Security level required for communication between the Citrix ADC and the SNMPv3 users who belong to the group. Specify one of the following options: noAuthNoPriv. Require neither authentication nor encryption. authNoPriv. Require authentication but no encryption. authPriv. Require authentication and encryption. Note: If you specify authentication, you must specify an encryption algorithm when you assign an SNMPv3 user to the group. If you also specify encryption, you must assign both an authentication and an encryption algorithm for each group member. Possible values = noAuthNoPriv, authNoPriv, authPriv
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteSNMPGroup -Name 'example' -Securitylevel noAuthNoPriv -Confirm:$false
    .EXAMPLE
        Invoke-NSGetSNMPGroup -Name 'snmpgroup_example' | Invoke-NSDeleteSNMPGroup -Confirm:$false
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

        [Parameter(Mandatory)]
        [ValidateSet('noAuthNoPriv', 'authNoPriv', 'authPriv')]
        [string] $Securitylevel,

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
        if ($PSBoundParameters.ContainsKey('Securitylevel')) {
            $argumentParts += 'securitylevel:' + $Securitylevel
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete snmpgroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type snmpgroup -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteSNMPGroup

# region Invoke-NSDeleteSNMPManager
function Invoke-NSDeleteSNMPManager {
    <#
    .SYNOPSIS
        Removes a NetScaler snmpmanager resource.
    .DESCRIPTION
        Configuration for manager resource.
    .PARAMETER Ipaddress
        IP address of the SNMP manager. Can be an IPv4 or IPv6 address. You can instead specify an IPv4 network address or IPv6 network prefix if you want the Citrix ADC to respond to SNMP queries from any device on the specified network. Alternatively, instead of an IPv4 address, you can specify a host name that has been assigned to an SNMP manager. If you do so, you must add a DNS name server that resolves the host name of the SNMP manager to its IP address. Note: The Citrix ADC does not support host names for SNMP managers that have IPv6 addresses. Minimum length = 1 Maximum length = 255
    .PARAMETER NetMask
        Subnet mask associated with an IPv4 network address. If the IP address specifies the address or host name of a specific host, accept the default value of 255.255.255.255.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteSNMPManager -Ipaddress 'example' -NetMask '255.255.255.255' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetSNMPManager -Ipaddress 'snmpmanager_example' | Invoke-NSDeleteSNMPManager -Confirm:$false
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
        [string] $Ipaddress,

        [Parameter()]
        [string] $NetMask,

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
        if ($PSBoundParameters.ContainsKey('NetMask')) {
            $argumentParts += 'netmask:' + $NetMask
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Ipaddress", 'Delete snmpmanager')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type snmpmanager -Resource $Ipaddress -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteSNMPManager

# region Invoke-NSDeleteSNMPTrap
function Invoke-NSDeleteSNMPTrap {
    <#
    .SYNOPSIS
        Removes a NetScaler snmptrap resource.
    .DESCRIPTION
        Configuration for snmp trap resource.
    .PARAMETER TrapClass
        Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file. Possible values = generic, specific
    .PARAMETER TrapDestination
        IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages. Minimum length = 1
    .PARAMETER Version
        SNMP version, which determines the format of trap messages sent to the trap listener. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: V2 Possible values = V1, V2, V3
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteSNMPTrap -TrapClass generic -TrapDestination 'example' -Version V1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetSNMPTrap -TrapClass 'snmptrap_example' | Invoke-NSDeleteSNMPTrap -Confirm:$false
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
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

        [Parameter(Mandatory)]
        [string] $TrapDestination,

        [Parameter()]
        [ValidateSet('V1', 'V2', 'V3')]
        [string] $Version,

        [Parameter()]
        [int] $TrafficDomain,

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
        if ($PSBoundParameters.ContainsKey('TrapDestination')) {
            $argumentParts += 'trapdestination:' + $TrapDestination
        }
        if ($PSBoundParameters.ContainsKey('Version')) {
            $argumentParts += 'version:' + $Version
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentParts += 'td:' + $TrafficDomain
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$TrapClass", 'Delete snmptrap')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type snmptrap -Resource $TrapClass -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteSNMPTrap

# region Invoke-NSDeleteSNMPTrapSNMPUserBinding
function Invoke-NSDeleteSNMPTrapSNMPUserBinding {
    <#
    .SYNOPSIS
        Invokes the remove operation for a NetScaler snmptrap_snmpuser_binding resource.
    .DESCRIPTION
        Binding object showing the snmpuser that can be bound to snmptrap.
    .PARAMETER TrapClass
        Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file. Possible values = generic, specific
    .PARAMETER TrapDestination
        IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages. Minimum length = 1
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER Version
        SNMP version, which determines the format of trap messages sent to the trap listener. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: V3 Possible values = V1, V2, V3
    .PARAMETER UserName
        Name of the SNMP user that will send the SNMPv3 traps.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteSNMPTrapSNMPUserBinding -TrapClass generic -TrapDestination 'example' -UserName 'example' -Version V1 -Confirm:$false
    .EXAMPLE
        Invoke-NSGetSNMPTrapSNMPUserBinding -TrapClass 'snmptrap_snmpuser_binding_example' | Invoke-NSDeleteSNMPTrapSNMPUserBinding -Confirm:$false
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
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

        [Parameter(Mandatory)]
        [string] $TrapDestination,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter()]
        [ValidateSet('V1', 'V2', 'V3')]
        [string] $Version,

        [Parameter(Mandatory)]
        [string] $UserName,

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
        if ($PSBoundParameters.ContainsKey('TrapDestination')) {
            $argumentParts += 'trapdestination:' + $TrapDestination
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentParts += 'td:' + $TrafficDomain
        }
        if ($PSBoundParameters.ContainsKey('Version')) {
            $argumentParts += 'version:' + $Version
        }
        if ($PSBoundParameters.ContainsKey('UserName')) {
            $argumentParts += 'username:' + $UserName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$TrapClass", 'Delete snmptrap_snmpuser_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type snmptrap_snmpuser_binding -Resource $TrapClass -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteSNMPTrapSNMPUserBinding

# region Invoke-NSDeleteSNMPUser
function Invoke-NSDeleteSNMPUser {
    <#
    .SYNOPSIS
        Removes a NetScaler snmpuser resource.
    .DESCRIPTION
        Configuration for SNMP user resource.
    .PARAMETER Name
        Name for the SNMPv3 user. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my user" or 'my user'). Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteSNMPUser -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetSNMPUser -Name 'snmpuser_example' | Invoke-NSDeleteSNMPUser -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete snmpuser')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type snmpuser -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteSNMPUser

# region Invoke-NSDeleteSNMPView
function Invoke-NSDeleteSNMPView {
    <#
    .SYNOPSIS
        Removes a NetScaler snmpview resource.
    .DESCRIPTION
        Configuration for view resource.
    .PARAMETER Name
        Name for the SNMPv3 view. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the SNMPv3 view. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my view" or 'my view'). Minimum length = 1
    .PARAMETER Subtree
        A particular branch (subtree) of the MIB tree that you want to associate with this SNMPv3 view. You must specify the subtree as an SNMP OID. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteSNMPView -Name 'example' -Subtree 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetSNMPView -Name 'snmpview_example' | Invoke-NSDeleteSNMPView -Confirm:$false
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

        [Parameter(Mandatory)]
        [string] $Subtree,

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
        if ($PSBoundParameters.ContainsKey('Subtree')) {
            $argumentParts += 'subtree:' + $Subtree
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete snmpview')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type snmpview -Resource $Name -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteSNMPView

# region Invoke-NSDisableSNMPAlarm
function Invoke-NSDisableSNMPAlarm {
    <#
    .SYNOPSIS
        Disables a NetScaler snmpalarm resource.
    .DESCRIPTION
        Configuration for alarm resource.
    .PARAMETER TrapName
        Name of the SNMP alarm. This parameter is required for identifying the SNMP alarm and cannot be modified. Possible values = CPU-USAGE, AVERAGE-CPU, MEMORY, MGMT-CPU-USAGE, SYNFLOOD, TCP-SYNFLOOD, VSERVER-REQRATE, SERVICE-REQRATE, ENTITY-RXRATE, ENTITY-TXRATE, ENTITY-SYNFLOOD, SERVICE-MAXCLIENTS, HA-STATE-CHANGE, ENTITY-STATE, CONFIG-CHANGE, CONFIG-SAVE, SERVICEGROUP-MEMBER-REQRATE, SERVICEGROUP-MEMBER-MAXCLIENTS, MONITOR-RTO-THRESHOLD, LOGIN-FAILURE, SSL-CERT-EXPIRY, FAN-SPEED-LOW, VOLTAGE-LOW, VOLTAGE-HIGH, TEMPERATURE-HIGH, CPU-TEMPERATURE-HIGH, POWER-SUPPLY-FAILURE, DISK-USAGE-HIGH, INTERFACE-THROUGHPUT-LOW, MON_PROBE_FAILED, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS, HA-BAD-SECONDARY-STATE, INTERFACE-BW-USAGE, RATE-LIMIT-THRESHOLD-EXCEEDED, ENTITY-NAME-CHANGE, HA-PROP-FAILURE, IP-CONFLICT, PF-RL-RATE-THRESHOLD, PF-RL-PPS-THRESHOLD, PF-RL-RATE-PKTS-DROPPED, PF-RL-PPS-PKTS-DROPPED, APPFW-START-URL, APPFW-DENY-URL, APPFW-VIOLATIONS-TYPE, APPFW-REFERER-HEADER, APPFW-CSRF-TAG, APPFW-COOKIE, APPFW-FIELD-CONSISTENCY, APPFW-BUFFER-OVERFLOW, APPFW-FIELD-FORMAT, APPFW-FILE-UPLOAD-TYPE, APPFW-GRPC, APPFW-GRPC-WEB-JSON, APPFW-GRPC-WEB-TEXT, APPFW-JSON-DOS, APPFW-JSON-SQL, APPFW-JSON-XSS, APPFW-SAFE-COMMERCE, APPFW-SAFE-OBJECT, APPFW-SESSION-LIMIT, APPFW-SIGNATURE-MATCH, APPFW-POLICY-HIT, APPFW-XSS, APPFW-XML-XSS, APPFW-SQL, APPFW-XML-SQL, APPFW-XML-ATTACHMENT, APPFW-XML-DOS, APPFW-XML-VALIDATION, APPFW-XML-WSI, APPFW-XML-SCHEMA-COMPILE, APPFW-XML-SOAP-FAULT, APPFW-NEW-SIGNATURE-ADDED, APPFW-DEPLOY-RELAXATION-DP, APPFW-LEARNED-RULE-APPLIED-DYN-PROF, APPFW-CMD, APPFW-SCHEMA-ENDPOINT-NOTFOUND, APPFW-SCHEMA-METHOD-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-MISSING, APPFW-SCHEMA-VALUE-INCORRECT, APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-INVALID, APPFW-SCHEMA-OTHER, APPFW-SCHEMA-RELAXATION-RULE, APPFW-POSTBODYLIMIT, APPFW-JSON-CMD, APPFW-SQL-GRAM, APPFW-JSON-SQL-GRAM, APPFW-CMD-GRAM, APPFW-JSON-CMD-GRAM, APPFW-BLOCK-KEYWORD, APPFW-JSON-BLOCKKEYWORD, APPFW-BYPASS-LIST, APPFW-DENY-LIST, DNSKEY-EXPIRY, HA-LICENSE-MISMATCH, SSL-CARD-FAILED, SSL-CARD-NORMAL, WARM-RESTART-EVENT, HARD-DISK-DRIVE-ERRORS, COMPACT-FLASH-ERRORS, CALLHOME-UPLOAD-EVENT, 1024KEY-EXCHANGE-RATE, 2048KEY-EXCHANGE-RATE, 4096KEY-EXCHANGE-RATE, SSL-CUR-SESSION-INUSE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-CCO-CHANGE, CLUSTER-OVS-CHANGE, CLUSTER-SYNC-FAILURE, CLUSTER-SYNC-PARTIAL-SUCCESS, CLUSTER-PROP-FAILURE, CLUSTER-PROP-EXEC-FAILURE, HA-STICKY-PRIMARY, INBAND-PROTOCOL-VERSION-MISMATCH, SSL-CHIP-REINIT, VRID-STATE-CHANGE, PORT-ALLOC-FAILED, LLDP-REMOTE-CHANGE, DUPLICATE-IPV6, PARTITION-CONFIG-EVENT, PARTITION-SWITCHED, LSN-PORTALLOC-FAILED, LSN-PORTQUOTA-EXCEED, LSN-SESSIONQUOTA-EXCEED, LSN-MEM-RECOVERY-KICKEDIN, VSERVER-SPILLOVER, INCONSISTENT-CONFIGURATION-IN-PPES, PARTITION-RATE-LIMIT, POOLED-LICENSE-ONGRACE, POOLED-LICENSE-PARTIAL, CLUSTER-BACKPLANE-HB-MISSING, GSLB-SITE-MEP-FLAP, DNS-MAXNEGCACHE-USAGE, DNS-MAXCACHE-USAGE, NS-LICENSE-EXPIRY, PKT-RATELIMITING-ATTACK, GSLB-SYNC-STATUS-FLIP, URLFILT-DB-UPDATE-STATUS, URLFILT-INIT-SDK, POOLED-LICENSE-CHECKOUT-FAILURE, MIGRATION-STARTED, MIGRATION-COMPLETE, ECDHE-EXCHANGE-RATE, BOT-SIGNATURE-UPDATE, APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH, PORT-ALLOC-EXCEED, KEK_UPDATE_SUCCESS, KEK_UPDATE_FAILURE, ADC-ANOMALY, SYSLOG-CONNECTION-DROPPED, SYSTEM_USER_PASSWORD_EXPIRY_WARNING, DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE, DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS, CLOUD-REST-API-FAILURE, SSL-ASYM-CRYPTO-UTILIZATION, SSL-SYM-CRYPTO-UTILIZATION, INTERFACE-AUTO-RECOVERY, SYS-KERNEL-ERROR, AVG-MGMT-CPU-USE, EXTRA-MGMT-CPU-USE
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
        Invoke-NSDisableSNMPAlarm -TrapName 'snmpalarm_example' -PassThru
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
        [string] $TrapName,

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

        if ($PSBoundParameters.ContainsKey('TrapName')) {
            Assert-NSParameterValue -ParameterName 'TrapName' -Value $TrapName -AllowedValuesByVersion @{ '13.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYS-KERNEL-ERROR'); '14.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-DISK-ENCRYPTION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYSTEM_USER_PASSWORD_EXPIRY_WARNING', 'DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE', 'DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS', 'CLOUD-REST-API-FAILURE', 'SSL-ASYM-CRYPTO-UTILIZATION', 'SSL-SYM-CRYPTO-UTILIZATION', 'INTERFACE-AUTO-RECOVERY', 'SYS-KERNEL-ERROR', 'AVG-MGMT-CPU-USE', 'EXTRA-MGMT-CPU-USE') } -MetadataVersion $metadataVersion
        }

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('TrapName')) { $body['trapname'] = $TrapName }

        if ($PSCmdlet.ShouldProcess("$TrapName", 'Disable snmpalarm')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpalarm -Action disable -Payload @{ snmpalarm = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetSNMPAlarm -TrapName $TrapName -Session $Session
            }
        }
    }
}
# endregion Invoke-NSDisableSNMPAlarm

# region Invoke-NSEnableSNMPAlarm
function Invoke-NSEnableSNMPAlarm {
    <#
    .SYNOPSIS
        Enables a NetScaler snmpalarm resource.
    .DESCRIPTION
        Configuration for alarm resource.
    .PARAMETER TrapName
        Name of the SNMP alarm. This parameter is required for identifying the SNMP alarm and cannot be modified. Possible values = CPU-USAGE, AVERAGE-CPU, MEMORY, MGMT-CPU-USAGE, SYNFLOOD, TCP-SYNFLOOD, VSERVER-REQRATE, SERVICE-REQRATE, ENTITY-RXRATE, ENTITY-TXRATE, ENTITY-SYNFLOOD, SERVICE-MAXCLIENTS, HA-STATE-CHANGE, ENTITY-STATE, CONFIG-CHANGE, CONFIG-SAVE, SERVICEGROUP-MEMBER-REQRATE, SERVICEGROUP-MEMBER-MAXCLIENTS, MONITOR-RTO-THRESHOLD, LOGIN-FAILURE, SSL-CERT-EXPIRY, FAN-SPEED-LOW, VOLTAGE-LOW, VOLTAGE-HIGH, TEMPERATURE-HIGH, CPU-TEMPERATURE-HIGH, POWER-SUPPLY-FAILURE, DISK-USAGE-HIGH, INTERFACE-THROUGHPUT-LOW, MON_PROBE_FAILED, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS, HA-BAD-SECONDARY-STATE, INTERFACE-BW-USAGE, RATE-LIMIT-THRESHOLD-EXCEEDED, ENTITY-NAME-CHANGE, HA-PROP-FAILURE, IP-CONFLICT, PF-RL-RATE-THRESHOLD, PF-RL-PPS-THRESHOLD, PF-RL-RATE-PKTS-DROPPED, PF-RL-PPS-PKTS-DROPPED, APPFW-START-URL, APPFW-DENY-URL, APPFW-VIOLATIONS-TYPE, APPFW-REFERER-HEADER, APPFW-CSRF-TAG, APPFW-COOKIE, APPFW-FIELD-CONSISTENCY, APPFW-BUFFER-OVERFLOW, APPFW-FIELD-FORMAT, APPFW-FILE-UPLOAD-TYPE, APPFW-GRPC, APPFW-GRPC-WEB-JSON, APPFW-GRPC-WEB-TEXT, APPFW-JSON-DOS, APPFW-JSON-SQL, APPFW-JSON-XSS, APPFW-SAFE-COMMERCE, APPFW-SAFE-OBJECT, APPFW-SESSION-LIMIT, APPFW-SIGNATURE-MATCH, APPFW-POLICY-HIT, APPFW-XSS, APPFW-XML-XSS, APPFW-SQL, APPFW-XML-SQL, APPFW-XML-ATTACHMENT, APPFW-XML-DOS, APPFW-XML-VALIDATION, APPFW-XML-WSI, APPFW-XML-SCHEMA-COMPILE, APPFW-XML-SOAP-FAULT, APPFW-NEW-SIGNATURE-ADDED, APPFW-DEPLOY-RELAXATION-DP, APPFW-LEARNED-RULE-APPLIED-DYN-PROF, APPFW-CMD, APPFW-SCHEMA-ENDPOINT-NOTFOUND, APPFW-SCHEMA-METHOD-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-MISSING, APPFW-SCHEMA-VALUE-INCORRECT, APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-INVALID, APPFW-SCHEMA-OTHER, APPFW-SCHEMA-RELAXATION-RULE, APPFW-POSTBODYLIMIT, APPFW-JSON-CMD, APPFW-SQL-GRAM, APPFW-JSON-SQL-GRAM, APPFW-CMD-GRAM, APPFW-JSON-CMD-GRAM, APPFW-BLOCK-KEYWORD, APPFW-JSON-BLOCKKEYWORD, APPFW-BYPASS-LIST, APPFW-DENY-LIST, DNSKEY-EXPIRY, HA-LICENSE-MISMATCH, SSL-CARD-FAILED, SSL-CARD-NORMAL, WARM-RESTART-EVENT, HARD-DISK-DRIVE-ERRORS, COMPACT-FLASH-ERRORS, CALLHOME-UPLOAD-EVENT, 1024KEY-EXCHANGE-RATE, 2048KEY-EXCHANGE-RATE, 4096KEY-EXCHANGE-RATE, SSL-CUR-SESSION-INUSE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-CCO-CHANGE, CLUSTER-OVS-CHANGE, CLUSTER-SYNC-FAILURE, CLUSTER-SYNC-PARTIAL-SUCCESS, CLUSTER-PROP-FAILURE, CLUSTER-PROP-EXEC-FAILURE, HA-STICKY-PRIMARY, INBAND-PROTOCOL-VERSION-MISMATCH, SSL-CHIP-REINIT, VRID-STATE-CHANGE, PORT-ALLOC-FAILED, LLDP-REMOTE-CHANGE, DUPLICATE-IPV6, PARTITION-CONFIG-EVENT, PARTITION-SWITCHED, LSN-PORTALLOC-FAILED, LSN-PORTQUOTA-EXCEED, LSN-SESSIONQUOTA-EXCEED, LSN-MEM-RECOVERY-KICKEDIN, VSERVER-SPILLOVER, INCONSISTENT-CONFIGURATION-IN-PPES, PARTITION-RATE-LIMIT, POOLED-LICENSE-ONGRACE, POOLED-LICENSE-PARTIAL, CLUSTER-BACKPLANE-HB-MISSING, GSLB-SITE-MEP-FLAP, DNS-MAXNEGCACHE-USAGE, DNS-MAXCACHE-USAGE, NS-LICENSE-EXPIRY, PKT-RATELIMITING-ATTACK, GSLB-SYNC-STATUS-FLIP, URLFILT-DB-UPDATE-STATUS, URLFILT-INIT-SDK, POOLED-LICENSE-CHECKOUT-FAILURE, MIGRATION-STARTED, MIGRATION-COMPLETE, ECDHE-EXCHANGE-RATE, BOT-SIGNATURE-UPDATE, APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH, PORT-ALLOC-EXCEED, KEK_UPDATE_SUCCESS, KEK_UPDATE_FAILURE, ADC-ANOMALY, SYSLOG-CONNECTION-DROPPED, SYSTEM_USER_PASSWORD_EXPIRY_WARNING, DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE, DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS, CLOUD-REST-API-FAILURE, SSL-ASYM-CRYPTO-UTILIZATION, SSL-SYM-CRYPTO-UTILIZATION, INTERFACE-AUTO-RECOVERY, SYS-KERNEL-ERROR, AVG-MGMT-CPU-USE, EXTRA-MGMT-CPU-USE
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
        Invoke-NSEnableSNMPAlarm -TrapName 'snmpalarm_example' -PassThru
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
        [string] $TrapName,

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

        if ($PSBoundParameters.ContainsKey('TrapName')) {
            Assert-NSParameterValue -ParameterName 'TrapName' -Value $TrapName -AllowedValuesByVersion @{ '13.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYS-KERNEL-ERROR'); '14.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-DISK-ENCRYPTION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYSTEM_USER_PASSWORD_EXPIRY_WARNING', 'DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE', 'DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS', 'CLOUD-REST-API-FAILURE', 'SSL-ASYM-CRYPTO-UTILIZATION', 'SSL-SYM-CRYPTO-UTILIZATION', 'INTERFACE-AUTO-RECOVERY', 'SYS-KERNEL-ERROR', 'AVG-MGMT-CPU-USE', 'EXTRA-MGMT-CPU-USE') } -MetadataVersion $metadataVersion
        }

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('TrapName')) { $body['trapname'] = $TrapName }

        if ($PSCmdlet.ShouldProcess("$TrapName", 'Enable snmpalarm')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpalarm -Action enable -Payload @{ snmpalarm = $body } -RawResponse | Out-Null

            if ($PassThru) {
                return Invoke-NSGetSNMPAlarm -TrapName $TrapName -Session $Session
            }
        }
    }
}
# endregion Invoke-NSEnableSNMPAlarm

# region Invoke-NSGetSNMPAlarm
function Invoke-NSGetSNMPAlarm {
    <#
    .SYNOPSIS
        Gets NetScaler snmpalarm configuration.
    .DESCRIPTION
        Configuration for alarm resource.
    .PARAMETER TrapName
        Name of the SNMP alarm. This parameter is required for identifying the SNMP alarm and cannot be modified. Possible values = CPU-USAGE, AVERAGE-CPU, MEMORY, MGMT-CPU-USAGE, SYNFLOOD, TCP-SYNFLOOD, VSERVER-REQRATE, SERVICE-REQRATE, ENTITY-RXRATE, ENTITY-TXRATE, ENTITY-SYNFLOOD, SERVICE-MAXCLIENTS, HA-STATE-CHANGE, ENTITY-STATE, CONFIG-CHANGE, CONFIG-SAVE, SERVICEGROUP-MEMBER-REQRATE, SERVICEGROUP-MEMBER-MAXCLIENTS, MONITOR-RTO-THRESHOLD, LOGIN-FAILURE, SSL-CERT-EXPIRY, FAN-SPEED-LOW, VOLTAGE-LOW, VOLTAGE-HIGH, TEMPERATURE-HIGH, CPU-TEMPERATURE-HIGH, POWER-SUPPLY-FAILURE, DISK-USAGE-HIGH, INTERFACE-THROUGHPUT-LOW, MON_PROBE_FAILED, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS, HA-BAD-SECONDARY-STATE, INTERFACE-BW-USAGE, RATE-LIMIT-THRESHOLD-EXCEEDED, ENTITY-NAME-CHANGE, HA-PROP-FAILURE, IP-CONFLICT, PF-RL-RATE-THRESHOLD, PF-RL-PPS-THRESHOLD, PF-RL-RATE-PKTS-DROPPED, PF-RL-PPS-PKTS-DROPPED, APPFW-START-URL, APPFW-DENY-URL, APPFW-VIOLATIONS-TYPE, APPFW-REFERER-HEADER, APPFW-CSRF-TAG, APPFW-COOKIE, APPFW-FIELD-CONSISTENCY, APPFW-BUFFER-OVERFLOW, APPFW-FIELD-FORMAT, APPFW-FILE-UPLOAD-TYPE, APPFW-GRPC, APPFW-GRPC-WEB-JSON, APPFW-GRPC-WEB-TEXT, APPFW-JSON-DOS, APPFW-JSON-SQL, APPFW-JSON-XSS, APPFW-SAFE-COMMERCE, APPFW-SAFE-OBJECT, APPFW-SESSION-LIMIT, APPFW-SIGNATURE-MATCH, APPFW-POLICY-HIT, APPFW-XSS, APPFW-XML-XSS, APPFW-SQL, APPFW-XML-SQL, APPFW-XML-ATTACHMENT, APPFW-XML-DOS, APPFW-XML-VALIDATION, APPFW-XML-WSI, APPFW-XML-SCHEMA-COMPILE, APPFW-XML-SOAP-FAULT, APPFW-NEW-SIGNATURE-ADDED, APPFW-DEPLOY-RELAXATION-DP, APPFW-LEARNED-RULE-APPLIED-DYN-PROF, APPFW-CMD, APPFW-SCHEMA-ENDPOINT-NOTFOUND, APPFW-SCHEMA-METHOD-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-MISSING, APPFW-SCHEMA-VALUE-INCORRECT, APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-INVALID, APPFW-SCHEMA-OTHER, APPFW-SCHEMA-RELAXATION-RULE, APPFW-POSTBODYLIMIT, APPFW-JSON-CMD, APPFW-SQL-GRAM, APPFW-JSON-SQL-GRAM, APPFW-CMD-GRAM, APPFW-JSON-CMD-GRAM, APPFW-BLOCK-KEYWORD, APPFW-JSON-BLOCKKEYWORD, APPFW-BYPASS-LIST, APPFW-DENY-LIST, DNSKEY-EXPIRY, HA-LICENSE-MISMATCH, SSL-CARD-FAILED, SSL-CARD-NORMAL, WARM-RESTART-EVENT, HARD-DISK-DRIVE-ERRORS, COMPACT-FLASH-ERRORS, CALLHOME-UPLOAD-EVENT, 1024KEY-EXCHANGE-RATE, 2048KEY-EXCHANGE-RATE, 4096KEY-EXCHANGE-RATE, SSL-CUR-SESSION-INUSE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-CCO-CHANGE, CLUSTER-OVS-CHANGE, CLUSTER-SYNC-FAILURE, CLUSTER-SYNC-PARTIAL-SUCCESS, CLUSTER-PROP-FAILURE, CLUSTER-PROP-EXEC-FAILURE, HA-STICKY-PRIMARY, INBAND-PROTOCOL-VERSION-MISMATCH, SSL-CHIP-REINIT, VRID-STATE-CHANGE, PORT-ALLOC-FAILED, LLDP-REMOTE-CHANGE, DUPLICATE-IPV6, PARTITION-CONFIG-EVENT, PARTITION-SWITCHED, LSN-PORTALLOC-FAILED, LSN-PORTQUOTA-EXCEED, LSN-SESSIONQUOTA-EXCEED, LSN-MEM-RECOVERY-KICKEDIN, VSERVER-SPILLOVER, INCONSISTENT-CONFIGURATION-IN-PPES, PARTITION-RATE-LIMIT, POOLED-LICENSE-ONGRACE, POOLED-LICENSE-PARTIAL, CLUSTER-BACKPLANE-HB-MISSING, GSLB-SITE-MEP-FLAP, DNS-MAXNEGCACHE-USAGE, DNS-MAXCACHE-USAGE, NS-LICENSE-EXPIRY, PKT-RATELIMITING-ATTACK, GSLB-SYNC-STATUS-FLIP, URLFILT-DB-UPDATE-STATUS, URLFILT-INIT-SDK, POOLED-LICENSE-CHECKOUT-FAILURE, MIGRATION-STARTED, MIGRATION-COMPLETE, ECDHE-EXCHANGE-RATE, BOT-SIGNATURE-UPDATE, APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH, PORT-ALLOC-EXCEED, KEK_UPDATE_SUCCESS, KEK_UPDATE_FAILURE, ADC-ANOMALY, SYSLOG-CONNECTION-DROPPED, SYSTEM_USER_PASSWORD_EXPIRY_WARNING, DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE, DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS, CLOUD-REST-API-FAILURE, SSL-ASYM-CRYPTO-UTILIZATION, SSL-SYM-CRYPTO-UTILIZATION, INTERFACE-AUTO-RECOVERY, SYS-KERNEL-ERROR, AVG-MGMT-CPU-USE, EXTRA-MGMT-CPU-USE
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
        Invoke-NSGetSNMPAlarm
    .EXAMPLE
        Invoke-NSGetSNMPAlarm -TrapName 'snmpalarm_example'
    .EXAMPLE
        Invoke-NSGetSNMPAlarm -Filter @{ servicetype = 'HTTP' }
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
        [string] $TrapName,

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
            Type = 'snmpalarm'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $TrapName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPAlarm

# region Invoke-NSGetSNMPCommUnitY
function Invoke-NSGetSNMPCommUnitY {
    <#
    .SYNOPSIS
        Gets NetScaler snmpcommunity configuration.
    .DESCRIPTION
        Configuration for community resource.
    .PARAMETER CommUnitYName
        The SNMP community string. Can consist of 1 to 32 characters that include uppercase and lowercase letters,numbers and special characters. The following requirement applies only to the Citrix ADC CLI: If the string includes one or more spaces, enclose the name in double or single quotation marks (for example, "my string" or 'my string'). Minimum length = 1
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
        Invoke-NSGetSNMPCommUnitY
    .EXAMPLE
        Invoke-NSGetSNMPCommUnitY -CommUnitYName 'snmpcommunity_example'
    .EXAMPLE
        Invoke-NSGetSNMPCommUnitY -Filter @{ servicetype = 'HTTP' }
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
        [string] $CommUnitYName,

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
            Type = 'snmpcommunity'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $CommUnitYName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPCommUnitY

# region Invoke-NSGetSNMPEngineid
function Invoke-NSGetSNMPEngineid {
    <#
    .SYNOPSIS
        Gets NetScaler snmpengineid configuration.
    .DESCRIPTION
        Configuration for SNMP engine id resource.
    .PARAMETER Ownernode
        ID of the cluster node for which you are setting the engineid. Default value: -1 Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetSNMPEngineid
    .EXAMPLE
        Invoke-NSGetSNMPEngineid -Ownernode 'snmpengineid_example'
    .EXAMPLE
        Invoke-NSGetSNMPEngineid -Filter @{ servicetype = 'HTTP' }
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
        [int] $Ownernode,

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
            Type = 'snmpengineid'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Ownernode
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPEngineid

# region Invoke-NSGetSNMPGroup
function Invoke-NSGetSNMPGroup {
    <#
    .SYNOPSIS
        Gets NetScaler snmpgroup configuration.
    .DESCRIPTION
        Configuration for SNMP group resource.
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
        Invoke-NSGetSNMPGroup
    .EXAMPLE
        Invoke-NSGetSNMPGroup -Filter @{ servicetype = 'HTTP' }
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
            Type = 'snmpgroup'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPGroup

# region Invoke-NSGetSNMPManager
function Invoke-NSGetSNMPManager {
    <#
    .SYNOPSIS
        Gets NetScaler snmpmanager configuration.
    .DESCRIPTION
        Configuration for manager resource.
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
        Invoke-NSGetSNMPManager
    .EXAMPLE
        Invoke-NSGetSNMPManager -Filter @{ servicetype = 'HTTP' }
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
            Type = 'snmpmanager'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPManager

# region Invoke-NSGetSNMPMib
function Invoke-NSGetSNMPMib {
    <#
    .SYNOPSIS
        Gets NetScaler snmpmib configuration.
    .DESCRIPTION
        Configuration for SNMP mib resource.
    .PARAMETER Ownernode
        ID of the cluster node for which we are setting the mib. This is a mandatory argument to set snmp mib on CLIP. Default value: -1 Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetSNMPMib
    .EXAMPLE
        Invoke-NSGetSNMPMib -Ownernode 'snmpmib_example'
    .EXAMPLE
        Invoke-NSGetSNMPMib -Filter @{ servicetype = 'HTTP' }
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
        [int] $Ownernode,

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
            Type = 'snmpmib'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Ownernode
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPMib

# region Invoke-NSGetSNMPOid
function Invoke-NSGetSNMPOid {
    <#
    .SYNOPSIS
        Gets NetScaler snmpoid configuration.
    .DESCRIPTION
        Configuration for SNMP Object Identifier resource.
    .PARAMETER EntityType
        The type of entity whose SNMP OIDs you want to displayType of entity whose SNMP OIDs you want the Citrix ADC to display. Possible values = VSERVER, SERVICE, SERVICEGROUP
    .PARAMETER Name
        Name of the entity whose SNMP OID you want the Citrix ADC to display. Minimum length = 1
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
        Invoke-NSGetSNMPOid
    .EXAMPLE
        Invoke-NSGetSNMPOid -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('VSERVER', 'SERVICE', 'SERVICEGROUP')]
        [string] $EntityType,

        [Parameter(ParameterSetName = 'All')]
        [string] $Name,

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
        if ($PSBoundParameters.ContainsKey('EntityType')) {
            $argumentValue = $EntityType
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'entitytype:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Name')) {
            $argumentValue = $Name
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'name:' + $argumentValue
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
            Type = 'snmpoid'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPOid

# region Invoke-NSGetSNMPOption
function Invoke-NSGetSNMPOption {
    <#
    .SYNOPSIS
        Gets NetScaler snmpoption configuration.
    .DESCRIPTION
        Configuration for SNMP option resource.
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
        Invoke-NSGetSNMPOption
    .EXAMPLE
        Invoke-NSGetSNMPOption -Filter @{ servicetype = 'HTTP' }
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
            Type = 'snmpoption'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPOption

# region Invoke-NSGetSNMPTrap
function Invoke-NSGetSNMPTrap {
    <#
    .SYNOPSIS
        Gets NetScaler snmptrap configuration.
    .DESCRIPTION
        Configuration for snmp trap resource.
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
        Invoke-NSGetSNMPTrap
    .EXAMPLE
        Invoke-NSGetSNMPTrap -Filter @{ servicetype = 'HTTP' }
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
            Type = 'snmptrap'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPTrap

# region Invoke-NSGetSNMPTrapBinding
function Invoke-NSGetSNMPTrapBinding {
    <#
    .SYNOPSIS
        Gets NetScaler SNMP trap bindings.
    .DESCRIPTION
        Binding object which returns the resources bound to snmptrap.
    .PARAMETER Version
        The SNMP version of the trap specified in the trap listener entry. Possible values = V1, V2, V3
    .PARAMETER TrapClass
        Trap type specified in the trap listener entry. Possible values = generic, specific
    .PARAMETER TrapDestination
        IP address specified in the trap listener entry. Minimum length = 1
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
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
        Invoke-NSGetSNMPTrapBinding
    .EXAMPLE
        Invoke-NSGetSNMPTrapBinding -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('V1', 'V2', 'V3')]
        [string] $Version,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

        [Parameter(ParameterSetName = 'All')]
        [string] $TrapDestination,

        [Parameter(ParameterSetName = 'All')]
        [int] $TrafficDomain,

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
        if ($PSBoundParameters.ContainsKey('Version')) {
            $argumentValue = $Version
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'version:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('TrapClass')) {
            $argumentValue = $TrapClass
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'trapclass:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('TrapDestination')) {
            $argumentValue = $TrapDestination
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'trapdestination:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentValue = $TrafficDomain
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'td:' + $argumentValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'snmptrap_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPTrapBinding

# region Invoke-NSGetSNMPTrapSNMPUserBinding
function Invoke-NSGetSNMPTrapSNMPUserBinding {
    <#
    .SYNOPSIS
        Gets NetScaler SNMP trap user bindings.
    .DESCRIPTION
        Binding object showing the snmpuser that can be bound to snmptrap.
    .PARAMETER TrapDestination
        IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages. Minimum length = 1
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER Version
        SNMP version, which determines the format of trap messages sent to the trap listener. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: V3 Possible values = V1, V2, V3
    .PARAMETER TrapClass
        Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file. Possible values = generic, specific
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
        Invoke-NSGetSNMPTrapSNMPUserBinding
    .EXAMPLE
        Invoke-NSGetSNMPTrapSNMPUserBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $TrapDestination,

        [Parameter(ParameterSetName = 'All')]
        [int] $TrafficDomain,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('V1', 'V2', 'V3')]
        [string] $Version,

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

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
        if ($PSBoundParameters.ContainsKey('TrapDestination')) {
            $argumentValue = $TrapDestination
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'trapdestination:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentValue = $TrafficDomain
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'td:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Version')) {
            $argumentValue = $Version
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'version:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('TrapClass')) {
            $argumentValue = $TrapClass
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'trapclass:' + $argumentValue
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
            Type = 'snmptrap_snmpuser_binding'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPTrapSNMPUserBinding

# region Invoke-NSGetSNMPUser
function Invoke-NSGetSNMPUser {
    <#
    .SYNOPSIS
        Gets NetScaler snmpuser configuration.
    .DESCRIPTION
        Configuration for SNMP user resource.
    .PARAMETER Name
        Name for the SNMPv3 user. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my user" or 'my user'). Minimum length = 1
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
        Invoke-NSGetSNMPUser
    .EXAMPLE
        Invoke-NSGetSNMPUser -Name 'snmpuser_example'
    .EXAMPLE
        Invoke-NSGetSNMPUser -Filter @{ servicetype = 'HTTP' }
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
            Type = 'snmpuser'
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
# endregion Invoke-NSGetSNMPUser

# region Invoke-NSGetSNMPView
function Invoke-NSGetSNMPView {
    <#
    .SYNOPSIS
        Gets NetScaler snmpview configuration.
    .DESCRIPTION
        Configuration for view resource.
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
        Invoke-NSGetSNMPView
    .EXAMPLE
        Invoke-NSGetSNMPView -Filter @{ servicetype = 'HTTP' }
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
            Type = 'snmpview'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetSNMPView

# region Invoke-NSUnsetSNMPAlarm
function Invoke-NSUnsetSNMPAlarm {
    <#
    .SYNOPSIS
        Clears one or more NetScaler snmpalarm resource properties.
    .DESCRIPTION
        Configuration for alarm resource.
    .PARAMETER TrapName
        Name of the SNMP alarm. This parameter is required for identifying the SNMP alarm and cannot be modified. Possible values = CPU-USAGE, AVERAGE-CPU, MEMORY, MGMT-CPU-USAGE, SYNFLOOD, TCP-SYNFLOOD, VSERVER-REQRATE, SERVICE-REQRATE, ENTITY-RXRATE, ENTITY-TXRATE, ENTITY-SYNFLOOD, SERVICE-MAXCLIENTS, HA-STATE-CHANGE, ENTITY-STATE, CONFIG-CHANGE, CONFIG-SAVE, SERVICEGROUP-MEMBER-REQRATE, SERVICEGROUP-MEMBER-MAXCLIENTS, MONITOR-RTO-THRESHOLD, LOGIN-FAILURE, SSL-CERT-EXPIRY, FAN-SPEED-LOW, VOLTAGE-LOW, VOLTAGE-HIGH, TEMPERATURE-HIGH, CPU-TEMPERATURE-HIGH, POWER-SUPPLY-FAILURE, DISK-USAGE-HIGH, INTERFACE-THROUGHPUT-LOW, MON_PROBE_FAILED, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS, HA-BAD-SECONDARY-STATE, INTERFACE-BW-USAGE, RATE-LIMIT-THRESHOLD-EXCEEDED, ENTITY-NAME-CHANGE, HA-PROP-FAILURE, IP-CONFLICT, PF-RL-RATE-THRESHOLD, PF-RL-PPS-THRESHOLD, PF-RL-RATE-PKTS-DROPPED, PF-RL-PPS-PKTS-DROPPED, APPFW-START-URL, APPFW-DENY-URL, APPFW-VIOLATIONS-TYPE, APPFW-REFERER-HEADER, APPFW-CSRF-TAG, APPFW-COOKIE, APPFW-FIELD-CONSISTENCY, APPFW-BUFFER-OVERFLOW, APPFW-FIELD-FORMAT, APPFW-FILE-UPLOAD-TYPE, APPFW-GRPC, APPFW-GRPC-WEB-JSON, APPFW-GRPC-WEB-TEXT, APPFW-JSON-DOS, APPFW-JSON-SQL, APPFW-JSON-XSS, APPFW-SAFE-COMMERCE, APPFW-SAFE-OBJECT, APPFW-SESSION-LIMIT, APPFW-SIGNATURE-MATCH, APPFW-POLICY-HIT, APPFW-XSS, APPFW-XML-XSS, APPFW-SQL, APPFW-XML-SQL, APPFW-XML-ATTACHMENT, APPFW-XML-DOS, APPFW-XML-VALIDATION, APPFW-XML-WSI, APPFW-XML-SCHEMA-COMPILE, APPFW-XML-SOAP-FAULT, APPFW-NEW-SIGNATURE-ADDED, APPFW-DEPLOY-RELAXATION-DP, APPFW-LEARNED-RULE-APPLIED-DYN-PROF, APPFW-CMD, APPFW-SCHEMA-ENDPOINT-NOTFOUND, APPFW-SCHEMA-METHOD-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-MISSING, APPFW-SCHEMA-VALUE-INCORRECT, APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-INVALID, APPFW-SCHEMA-OTHER, APPFW-SCHEMA-RELAXATION-RULE, APPFW-POSTBODYLIMIT, APPFW-JSON-CMD, APPFW-SQL-GRAM, APPFW-JSON-SQL-GRAM, APPFW-CMD-GRAM, APPFW-JSON-CMD-GRAM, APPFW-BLOCK-KEYWORD, APPFW-JSON-BLOCKKEYWORD, APPFW-BYPASS-LIST, APPFW-DENY-LIST, DNSKEY-EXPIRY, HA-LICENSE-MISMATCH, SSL-CARD-FAILED, SSL-CARD-NORMAL, WARM-RESTART-EVENT, HARD-DISK-DRIVE-ERRORS, COMPACT-FLASH-ERRORS, CALLHOME-UPLOAD-EVENT, 1024KEY-EXCHANGE-RATE, 2048KEY-EXCHANGE-RATE, 4096KEY-EXCHANGE-RATE, SSL-CUR-SESSION-INUSE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-CCO-CHANGE, CLUSTER-OVS-CHANGE, CLUSTER-SYNC-FAILURE, CLUSTER-SYNC-PARTIAL-SUCCESS, CLUSTER-PROP-FAILURE, CLUSTER-PROP-EXEC-FAILURE, HA-STICKY-PRIMARY, INBAND-PROTOCOL-VERSION-MISMATCH, SSL-CHIP-REINIT, VRID-STATE-CHANGE, PORT-ALLOC-FAILED, LLDP-REMOTE-CHANGE, DUPLICATE-IPV6, PARTITION-CONFIG-EVENT, PARTITION-SWITCHED, LSN-PORTALLOC-FAILED, LSN-PORTQUOTA-EXCEED, LSN-SESSIONQUOTA-EXCEED, LSN-MEM-RECOVERY-KICKEDIN, VSERVER-SPILLOVER, INCONSISTENT-CONFIGURATION-IN-PPES, PARTITION-RATE-LIMIT, POOLED-LICENSE-ONGRACE, POOLED-LICENSE-PARTIAL, CLUSTER-BACKPLANE-HB-MISSING, GSLB-SITE-MEP-FLAP, DNS-MAXNEGCACHE-USAGE, DNS-MAXCACHE-USAGE, NS-LICENSE-EXPIRY, PKT-RATELIMITING-ATTACK, GSLB-SYNC-STATUS-FLIP, URLFILT-DB-UPDATE-STATUS, URLFILT-INIT-SDK, POOLED-LICENSE-CHECKOUT-FAILURE, MIGRATION-STARTED, MIGRATION-COMPLETE, ECDHE-EXCHANGE-RATE, BOT-SIGNATURE-UPDATE, APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH, PORT-ALLOC-EXCEED, KEK_UPDATE_SUCCESS, KEK_UPDATE_FAILURE, ADC-ANOMALY, SYSLOG-CONNECTION-DROPPED, SYSTEM_USER_PASSWORD_EXPIRY_WARNING, DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE, DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS, CLOUD-REST-API-FAILURE, SSL-ASYM-CRYPTO-UTILIZATION, SSL-SYM-CRYPTO-UTILIZATION, INTERFACE-AUTO-RECOVERY, SYS-KERNEL-ERROR, AVG-MGMT-CPU-USE, EXTRA-MGMT-CPU-USE
    .PARAMETER Logging
        Logging status of the alarm. When logging is enabled, the Citrix ADC logs every trap message that is generated for this alarm. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Normalvalue
        Value for the normal threshold. A trap message is generated if the value of the respective attribute falls to or below this value after exceeding the high threshold. Minimum value = 1
    .PARAMETER Severity
        Severity level assigned to trap messages generated by this alarm. The severity levels are, in increasing order of severity, Informational, Warning, Minor, Major, and Critical. This parameter is useful when you want the Citrix ADC to send trap messages to a trap listener on the basis of severity level. Trap messages with a severity level lower than the specified level (in the trap listener entry) are not sent. Default value: Unknown Possible values = Critical, Major, Minor, Warning, Informational
    .PARAMETER State
        Current state of the SNMP alarm. The Citrix ADC generates trap messages only for SNMP alarms that are enabled. Some alarms are enabled by default, but you can disable them. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER ThresholdValue
        Value for the high threshold. The Citrix ADC generates an SNMP trap message when the value of the attribute associated with the alarm is greater than or equal to the specified high threshold value. Minimum value = 1
    .PARAMETER Time
        Interval, in seconds, at which the Citrix ADC generates SNMP trap messages when the conditions specified in the SNMP alarm are met.Can be specified for the following alarms: SYNFLOOD, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS,HA-BAD-SECONDARY-STATE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-BKHB-FAILED, PORT-ALLOC-FAILED, COMPACT-FLASH-ERRORS, HARD-DISK-DRIVE-ERRORS and APPFW traps. Default trap time intervals: SYNFLOOD and APPFW traps = 1sec, PORT-ALLOC-FAILED = 3600sec(1 hour), PORT-ALLOC-EXCEED = 3600sec(1 hour), SYSLOG-CONNECTION-DROPPED = 3600sec(1 hour), Other Traps = 86400sec(1 day). Default value: 1
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
        Invoke-NSUnsetSNMPAlarm -TrapName 'example' -Logging ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetSNMPAlarm -TrapName 'example' -Logging ENABLED -WhatIf
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
        [string] $TrapName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Logging,

        [Parameter()]
        [switch] $Normalvalue,

        [Parameter()]
        [ValidateSet('Critical', 'Major', 'Minor', 'Warning', 'Informational')]
        [switch] $Severity,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $State,

        [Parameter()]
        [switch] $ThresholdValue,

        [Parameter()]
        [switch] $Time,

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

        if ($PSBoundParameters.ContainsKey('TrapName')) {
            Assert-NSParameterValue -ParameterName 'TrapName' -Value $TrapName -AllowedValuesByVersion @{ '13.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYS-KERNEL-ERROR'); '14.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-DISK-ENCRYPTION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYSTEM_USER_PASSWORD_EXPIRY_WARNING', 'DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE', 'DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS', 'CLOUD-REST-API-FAILURE', 'SSL-ASYM-CRYPTO-UTILIZATION', 'SSL-SYM-CRYPTO-UTILIZATION', 'INTERFACE-AUTO-RECOVERY', 'SYS-KERNEL-ERROR', 'AVG-MGMT-CPU-USE', 'EXTRA-MGMT-CPU-USE') } -MetadataVersion $metadataVersion
        }

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = @{ trapname = $TrapName }
        if ($PSBoundParameters.ContainsKey('Logging')) { $body['logging'] = $true }
        if ($PSBoundParameters.ContainsKey('Normalvalue')) { $body['normalvalue'] = $true }
        if ($PSBoundParameters.ContainsKey('Severity')) { $body['severity'] = $true }
        if ($PSBoundParameters.ContainsKey('State')) { $body['state'] = $true }
        if ($PSBoundParameters.ContainsKey('ThresholdValue')) { $body['thresholdvalue'] = $true }
        if ($PSBoundParameters.ContainsKey('Time')) { $body['time'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$TrapName", 'Clear snmpalarm properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpalarm -Action unset -Payload @{ snmpalarm = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetSNMPAlarm -TrapName $TrapName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetSNMPAlarm

# region Invoke-NSUnsetSNMPManager
function Invoke-NSUnsetSNMPManager {
    <#
    .SYNOPSIS
        Clears one or more NetScaler snmpmanager resource properties.
    .DESCRIPTION
        Configuration for manager resource.
    .PARAMETER Ipaddress
        IP address of the SNMP manager. Can be an IPv4 or IPv6 address. You can instead specify an IPv4 network address or IPv6 network prefix if you want the Citrix ADC to respond to SNMP queries from any device on the specified network. Alternatively, instead of an IPv4 address, you can specify a host name that has been assigned to an SNMP manager. If you do so, you must add a DNS name server that resolves the host name of the SNMP manager to its IP address. Note: The Citrix ADC does not support host names for SNMP managers that have IPv6 addresses. Minimum length = 1 Maximum length = 255
    .PARAMETER Domainresolveretry
        Amount of time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the SNMP manager if the last query failed. This parameter is valid for host-name based SNMP managers only. After a query succeeds, the TTL determines the wait time. The minimum and default value is 5. Minimum value = 5 Maximum value = 20939
    .PARAMETER NetMask
        Subnet mask associated with an IPv4 network address. If the IP address specifies the address or host name of a specific host, accept the default value of 255.255.255.255.
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
        Invoke-NSUnsetSNMPManager -Ipaddress 'example' -Domainresolveretry  -PassThru
    .EXAMPLE
        Invoke-NSUnsetSNMPManager -Ipaddress 'example' -Domainresolveretry  -WhatIf
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
        [string] $Ipaddress,

        [Parameter()]
        [switch] $Domainresolveretry,

        [Parameter()]
        [switch] $NetMask,

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

        $body = @{ ipaddress = $Ipaddress }
        if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $body['domainresolveretry'] = $true }
        if ($PSBoundParameters.ContainsKey('NetMask')) { $body['netmask'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Ipaddress", 'Clear snmpmanager properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpmanager -Action unset -Payload @{ snmpmanager = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetSNMPManager -Ipaddress $Ipaddress -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetSNMPManager

# region Invoke-NSUnsetSNMPMib
function Invoke-NSUnsetSNMPMib {
    <#
    .SYNOPSIS
        Clears one or more NetScaler snmpmib resource properties.
    .DESCRIPTION
        Configuration for SNMP mib resource.
    .PARAMETER Ownernode
        ID of the cluster node for which we are setting the mib. This is a mandatory argument to set snmp mib on CLIP. Default value: -1 Minimum value = 0 Maximum value = 31
    .PARAMETER Contact
        Name of the administrator for this Citrix ADC. Along with the name, you can include information on how to contact this person, such as a phone number or an email address. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the information includes one or more spaces, enclose it in double or single quotation marks (for example, "my contact" or 'my contact'). Default value: "WebMaster (default)" Minimum length = 1
    .PARAMETER CustomId
        Custom identification number for the Citrix ADC. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a custom identification that helps identify the Citrix ADC appliance. The following requirement applies only to the Citrix ADC CLI: If the ID includes one or more spaces, enclose it in double or single quotation marks (for example, "my ID" or 'my ID'). Default value: "Default" Minimum length = 1
    .PARAMETER Location
        Physical location of the Citrix ADC. For example, you can specify building name, lab number, and rack number. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the location includes one or more spaces, enclose it in double or single quotation marks (for example, "my location" or 'my location'). Default value: "POP (default)" Minimum length = 1
    .PARAMETER Name
        Name for this Citrix ADC. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the Citrix ADC appliance. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my name" or 'my name'). Default value: "NetScaler" Minimum length = 1
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
        Invoke-NSUnsetSNMPMib -Ownernode 1 -Contact  -PassThru
    .EXAMPLE
        Invoke-NSUnsetSNMPMib -Ownernode 1 -Contact  -WhatIf
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
        [int] $Ownernode,

        [Parameter()]
        [switch] $Contact,

        [Parameter()]
        [switch] $CustomId,

        [Parameter()]
        [switch] $Location,

        [Parameter()]
        [switch] $Name,

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

        $body = @{ ownernode = $Ownernode }
        if ($PSBoundParameters.ContainsKey('Contact')) { $body['contact'] = $true }
        if ($PSBoundParameters.ContainsKey('CustomId')) { $body['customid'] = $true }
        if ($PSBoundParameters.ContainsKey('Location')) { $body['location'] = $true }
        if ($PSBoundParameters.ContainsKey('Name')) { $body['name'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Ownernode", 'Clear snmpmib properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpmib -Action unset -Payload @{ snmpmib = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetSNMPMib -Ownernode $Ownernode -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetSNMPMib

# region Invoke-NSUnsetSNMPOption
function Invoke-NSUnsetSNMPOption {
    <#
    .SYNOPSIS
        Clears one or more NetScaler snmpoption resource properties.
    .DESCRIPTION
        Configuration for SNMP option resource.
    .PARAMETER CustomTrap
        By default, Customtrap will be disabled, set to enabled when using the feature. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PartitionNameInTrap
        Send partition name as a varbind in traps. By default the partition names are not sent as a varbind. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SeverityinfoinTrap
        By default, the severity level info of the trap is not mentioned in the trap message. Enable this option to send severity level of trap as one of the varbind in the trap message. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPSet
        Accept SNMP SET requests sent to the Citrix ADC, and allow SNMP managers to write values to MIB objects that are configured for write access. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPTrapLogging
        Log any SNMP trap events (for SNMP alarms in which logging is enabled) even if no trap listeners are configured. With the default setting, SNMP trap events are logged if at least one trap listener is configured on the appliance. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPTrapLogginglevel
        Audit log level of SNMP trap logs. The default value is INFORMATIONAL. Default value: INFORMATIONAL Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
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
        Invoke-NSUnsetSNMPOption -CustomTrap ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetSNMPOption -CustomTrap ENABLED -WhatIf
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
        [switch] $CustomTrap,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $PartitionNameInTrap,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SeverityinfoinTrap,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SNMPSet,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SNMPTrapLogging,

        [Parameter()]
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [switch] $SNMPTrapLogginglevel,

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
        if ($PSBoundParameters.ContainsKey('CustomTrap')) { $body['customtrap'] = $true }
        if ($PSBoundParameters.ContainsKey('PartitionNameInTrap')) { $body['partitionnameintrap'] = $true }
        if ($PSBoundParameters.ContainsKey('SeverityinfoinTrap')) { $body['severityinfointrap'] = $true }
        if ($PSBoundParameters.ContainsKey('SNMPSet')) { $body['snmpset'] = $true }
        if ($PSBoundParameters.ContainsKey('SNMPTrapLogging')) { $body['snmptraplogging'] = $true }
        if ($PSBoundParameters.ContainsKey('SNMPTrapLogginglevel')) { $body['snmptraplogginglevel'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('snmpoption', 'Clear snmpoption properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpoption -Action unset -Payload @{ snmpoption = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetSNMPOption

# region Invoke-NSUnsetSNMPTrap
function Invoke-NSUnsetSNMPTrap {
    <#
    .SYNOPSIS
        Clears one or more NetScaler snmptrap resource properties.
    .DESCRIPTION
        Configuration for snmp trap resource.
    .PARAMETER TrapClass
        Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file. Possible values = generic, specific
    .PARAMETER AllPartitionS
        Send traps of all partitions to this destination. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CommUnitYName
        Password (string) sent with the trap messages, so that the trap listener can authenticate them. Can include 1 to 32 uppercase or lowercase letters, numbers, and hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. You must specify the same community string on the trap listener device. Otherwise, the trap listener drops the trap messages. The following requirement applies only to the Citrix ADC CLI: If the string includes one or more spaces, enclose the name in double or single quotation marks (for example, "my string" or 'my string').
    .PARAMETER DestPort
        UDP port at which the trap listener listens for trap messages. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: 162 Minimum value = 1 Maximum value = 65534
    .PARAMETER Severity
        Severity level at or above which the Citrix ADC sends trap messages to this trap listener. The severity levels, in increasing order of severity, are Informational, Warning, Minor, Major, Critical. This parameter can be set for trap listeners of type SPECIFIC only. The default is to send all levels of trap messages. Important: Trap messages are not assigned severity levels unless you specify severity levels when configuring SNMP alarms. Default value: Unknown Possible values = Critical, Major, Minor, Warning, Informational
    .PARAMETER Srcip
        IPv4 or IPv6 address that the Citrix ADC inserts as the source IP address in all SNMP trap messages that it sends to this trap listener. By default this is the appliance's NSIP or NSIP6 address, but you can specify an IPv4 MIP or SNIP/SNIP6 address. In cluster setup, the default value is the individual node's NSIP, but it can be set to CLIP or Striped SNIP address. In non default partition, this parameter must be set to the SNIP/SNIP6 address. Minimum length = 1
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER TrapDestination
        IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages. Minimum length = 1
    .PARAMETER Version
        SNMP version, which determines the format of trap messages sent to the trap listener. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: V2 Possible values = V1, V2, V3
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
        Invoke-NSUnsetSNMPTrap -TrapClass generic -AllPartitionS ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetSNMPTrap -TrapClass generic -AllPartitionS ENABLED -WhatIf
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
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $AllPartitionS,

        [Parameter()]
        [switch] $CommUnitYName,

        [Parameter()]
        [switch] $DestPort,

        [Parameter()]
        [ValidateSet('Critical', 'Major', 'Minor', 'Warning', 'Informational')]
        [switch] $Severity,

        [Parameter()]
        [switch] $Srcip,

        [Parameter()]
        [switch] $TrafficDomain,

        [Parameter()]
        [switch] $TrapDestination,

        [Parameter()]
        [ValidateSet('V1', 'V2', 'V3')]
        [switch] $Version,

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

        $body = @{ trapclass = $TrapClass }
        if ($PSBoundParameters.ContainsKey('AllPartitionS')) { $body['allpartitions'] = $true }
        if ($PSBoundParameters.ContainsKey('CommUnitYName')) { $body['communityname'] = $true }
        if ($PSBoundParameters.ContainsKey('DestPort')) { $body['destport'] = $true }
        if ($PSBoundParameters.ContainsKey('Severity')) { $body['severity'] = $true }
        if ($PSBoundParameters.ContainsKey('Srcip')) { $body['srcip'] = $true }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $body['td'] = $true }
        if ($PSBoundParameters.ContainsKey('TrapDestination')) { $body['trapdestination'] = $true }
        if ($PSBoundParameters.ContainsKey('Version')) { $body['version'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$TrapClass", 'Clear snmptrap properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmptrap -Action unset -Payload @{ snmptrap = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetSNMPTrap -TrapClass $TrapClass -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetSNMPTrap

# region Invoke-NSUnsetSNMPUser
function Invoke-NSUnsetSNMPUser {
    <#
    .SYNOPSIS
        Clears one or more NetScaler snmpuser resource properties.
    .DESCRIPTION
        Configuration for SNMP user resource.
    .PARAMETER Name
        Name for the SNMPv3 user. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my user" or 'my user'). Minimum length = 1
    .PARAMETER Authpasswd
        Plain-text pass phrase to be used by the authentication algorithm specified by the authType (Authentication Type) parameter. Can consist of 8 to 64 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the pass phrase includes one or more spaces, enclose it in double or single quotation marks (for example, "my phrase" or 'my phrase'). Minimum length = 8
    .PARAMETER AuthType
        Authentication algorithm used by the Citrix ADC and the SNMPv3 user for authenticating the communication between them. You must specify the same authentication algorithm when you configure the SNMPv3 user in the SNMP manager. Possible values = MD5, SHA, SHA256, SHA512
    .PARAMETER Privpasswd
        Encryption key to be used by the encryption algorithm specified by the privType (Encryption Type) parameter. Can consist of 8 to 64 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the key includes one or more spaces, enclose it in double or single quotation marks (for example, "my key" or 'my key'). Minimum length = 8
    .PARAMETER PrivType
        Encryption algorithm used by the Citrix ADC and the SNMPv3 user for encrypting the communication between them. You must specify the same encryption algorithm when you configure the SNMPv3 user in the SNMP manager. Possible values = DES, AES, AES192, AES256
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
        Invoke-NSUnsetSNMPUser -Name 'example' -Authpasswd  -PassThru
    .EXAMPLE
        Invoke-NSUnsetSNMPUser -Name 'example' -Authpasswd  -WhatIf
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
        [switch] $Authpasswd,

        [Parameter()]
        [ValidateSet('MD5', 'SHA', 'SHA256', 'SHA512')]
        [switch] $AuthType,

        [Parameter()]
        [switch] $Privpasswd,

        [Parameter()]
        [ValidateSet('DES', 'AES', 'AES192', 'AES256')]
        [switch] $PrivType,

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
        if ($PSBoundParameters.ContainsKey('Authpasswd')) { $body['authpasswd'] = $true }
        if ($PSBoundParameters.ContainsKey('AuthType')) { $body['authtype'] = $true }
        if ($PSBoundParameters.ContainsKey('Privpasswd')) { $body['privpasswd'] = $true }
        if ($PSBoundParameters.ContainsKey('PrivType')) { $body['privtype'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear snmpuser properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type snmpuser -Action unset -Payload @{ snmpuser = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetSNMPUser -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetSNMPUser

# region Invoke-NSUpdateSNMPAlarm
function Invoke-NSUpdateSNMPAlarm {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpalarm resource.
    .DESCRIPTION
        Configuration for alarm resource.
    .PARAMETER Logging
        Logging status of the alarm. When logging is enabled, the Citrix ADC logs every trap message that is generated for this alarm. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Normalvalue
        Value for the normal threshold. A trap message is generated if the value of the respective attribute falls to or below this value after exceeding the high threshold. Minimum value = 1
    .PARAMETER Severity
        Severity level assigned to trap messages generated by this alarm. The severity levels are, in increasing order of severity, Informational, Warning, Minor, Major, and Critical. This parameter is useful when you want the Citrix ADC to send trap messages to a trap listener on the basis of severity level. Trap messages with a severity level lower than the specified level (in the trap listener entry) are not sent. Default value: Unknown Possible values = Critical, Major, Minor, Warning, Informational
    .PARAMETER State
        Current state of the SNMP alarm. The Citrix ADC generates trap messages only for SNMP alarms that are enabled. Some alarms are enabled by default, but you can disable them. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER ThresholdValue
        Value for the high threshold. The Citrix ADC generates an SNMP trap message when the value of the attribute associated with the alarm is greater than or equal to the specified high threshold value. Minimum value = 1
    .PARAMETER Time
        Interval, in seconds, at which the Citrix ADC generates SNMP trap messages when the conditions specified in the SNMP alarm are met.Can be specified for the following alarms: SYNFLOOD, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS,HA-BAD-SECONDARY-STATE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-BKHB-FAILED, PORT-ALLOC-FAILED, COMPACT-FLASH-ERRORS, HARD-DISK-DRIVE-ERRORS and APPFW traps. Default trap time intervals: SYNFLOOD and APPFW traps = 1sec, PORT-ALLOC-FAILED = 3600sec(1 hour), PORT-ALLOC-EXCEED = 3600sec(1 hour), SYSLOG-CONNECTION-DROPPED = 3600sec(1 hour), Other Traps = 86400sec(1 day). Default value: 1
    .PARAMETER TrapName
        Name of the SNMP alarm. This parameter is required for identifying the SNMP alarm and cannot be modified. Possible values = CPU-USAGE, AVERAGE-CPU, MEMORY, MGMT-CPU-USAGE, SYNFLOOD, TCP-SYNFLOOD, VSERVER-REQRATE, SERVICE-REQRATE, ENTITY-RXRATE, ENTITY-TXRATE, ENTITY-SYNFLOOD, SERVICE-MAXCLIENTS, HA-STATE-CHANGE, ENTITY-STATE, CONFIG-CHANGE, CONFIG-SAVE, SERVICEGROUP-MEMBER-REQRATE, SERVICEGROUP-MEMBER-MAXCLIENTS, MONITOR-RTO-THRESHOLD, LOGIN-FAILURE, SSL-CERT-EXPIRY, FAN-SPEED-LOW, VOLTAGE-LOW, VOLTAGE-HIGH, TEMPERATURE-HIGH, CPU-TEMPERATURE-HIGH, POWER-SUPPLY-FAILURE, DISK-USAGE-HIGH, INTERFACE-THROUGHPUT-LOW, MON_PROBE_FAILED, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS, HA-BAD-SECONDARY-STATE, INTERFACE-BW-USAGE, RATE-LIMIT-THRESHOLD-EXCEEDED, ENTITY-NAME-CHANGE, HA-PROP-FAILURE, IP-CONFLICT, PF-RL-RATE-THRESHOLD, PF-RL-PPS-THRESHOLD, PF-RL-RATE-PKTS-DROPPED, PF-RL-PPS-PKTS-DROPPED, APPFW-START-URL, APPFW-DENY-URL, APPFW-VIOLATIONS-TYPE, APPFW-REFERER-HEADER, APPFW-CSRF-TAG, APPFW-COOKIE, APPFW-FIELD-CONSISTENCY, APPFW-BUFFER-OVERFLOW, APPFW-FIELD-FORMAT, APPFW-FILE-UPLOAD-TYPE, APPFW-GRPC, APPFW-GRPC-WEB-JSON, APPFW-GRPC-WEB-TEXT, APPFW-JSON-DOS, APPFW-JSON-SQL, APPFW-JSON-XSS, APPFW-SAFE-COMMERCE, APPFW-SAFE-OBJECT, APPFW-SESSION-LIMIT, APPFW-SIGNATURE-MATCH, APPFW-POLICY-HIT, APPFW-XSS, APPFW-XML-XSS, APPFW-SQL, APPFW-XML-SQL, APPFW-XML-ATTACHMENT, APPFW-XML-DOS, APPFW-XML-VALIDATION, APPFW-XML-WSI, APPFW-XML-SCHEMA-COMPILE, APPFW-XML-SOAP-FAULT, APPFW-NEW-SIGNATURE-ADDED, APPFW-DEPLOY-RELAXATION-DP, APPFW-LEARNED-RULE-APPLIED-DYN-PROF, APPFW-CMD, APPFW-SCHEMA-ENDPOINT-NOTFOUND, APPFW-SCHEMA-METHOD-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-MISSING, APPFW-SCHEMA-VALUE-INCORRECT, APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-INVALID, APPFW-SCHEMA-OTHER, APPFW-SCHEMA-RELAXATION-RULE, APPFW-POSTBODYLIMIT, APPFW-JSON-CMD, APPFW-SQL-GRAM, APPFW-JSON-SQL-GRAM, APPFW-CMD-GRAM, APPFW-JSON-CMD-GRAM, APPFW-BLOCK-KEYWORD, APPFW-JSON-BLOCKKEYWORD, APPFW-BYPASS-LIST, APPFW-DENY-LIST, DNSKEY-EXPIRY, HA-LICENSE-MISMATCH, SSL-CARD-FAILED, SSL-CARD-NORMAL, WARM-RESTART-EVENT, HARD-DISK-DRIVE-ERRORS, COMPACT-FLASH-ERRORS, CALLHOME-UPLOAD-EVENT, 1024KEY-EXCHANGE-RATE, 2048KEY-EXCHANGE-RATE, 4096KEY-EXCHANGE-RATE, SSL-CUR-SESSION-INUSE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-CCO-CHANGE, CLUSTER-OVS-CHANGE, CLUSTER-SYNC-FAILURE, CLUSTER-SYNC-PARTIAL-SUCCESS, CLUSTER-PROP-FAILURE, CLUSTER-PROP-EXEC-FAILURE, HA-STICKY-PRIMARY, INBAND-PROTOCOL-VERSION-MISMATCH, SSL-CHIP-REINIT, VRID-STATE-CHANGE, PORT-ALLOC-FAILED, LLDP-REMOTE-CHANGE, DUPLICATE-IPV6, PARTITION-CONFIG-EVENT, PARTITION-SWITCHED, LSN-PORTALLOC-FAILED, LSN-PORTQUOTA-EXCEED, LSN-SESSIONQUOTA-EXCEED, LSN-MEM-RECOVERY-KICKEDIN, VSERVER-SPILLOVER, INCONSISTENT-CONFIGURATION-IN-PPES, PARTITION-RATE-LIMIT, POOLED-LICENSE-ONGRACE, POOLED-LICENSE-PARTIAL, CLUSTER-BACKPLANE-HB-MISSING, GSLB-SITE-MEP-FLAP, DNS-MAXNEGCACHE-USAGE, DNS-MAXCACHE-USAGE, NS-LICENSE-EXPIRY, PKT-RATELIMITING-ATTACK, GSLB-SYNC-STATUS-FLIP, URLFILT-DB-UPDATE-STATUS, URLFILT-INIT-SDK, POOLED-LICENSE-CHECKOUT-FAILURE, MIGRATION-STARTED, MIGRATION-COMPLETE, ECDHE-EXCHANGE-RATE, BOT-SIGNATURE-UPDATE, APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH, PORT-ALLOC-EXCEED, KEK_UPDATE_SUCCESS, KEK_UPDATE_FAILURE, ADC-ANOMALY, SYSLOG-CONNECTION-DROPPED, SYSTEM_USER_PASSWORD_EXPIRY_WARNING, DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE, DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS, CLOUD-REST-API-FAILURE, SSL-ASYM-CRYPTO-UTILIZATION, SSL-SYM-CRYPTO-UTILIZATION, INTERFACE-AUTO-RECOVERY, SYS-KERNEL-ERROR, AVG-MGMT-CPU-USE, EXTRA-MGMT-CPU-USE
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
        Invoke-NSUpdateSNMPAlarm -TrapName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPAlarm -TrapName 'example' -WhatIf
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
        [string] $Logging,

        [Parameter()]
        [int] $Normalvalue,

        [Parameter()]
        [ValidateSet('Critical', 'Major', 'Minor', 'Warning', 'Informational')]
        [string] $Severity,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $State,

        [Parameter()]
        [int] $ThresholdValue,

        [Parameter()]
        [int] $Time,

        [Parameter(Mandatory, Position = 0)]
        [string] $TrapName,

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

    if ($PSBoundParameters.ContainsKey('TrapName')) {
        Assert-NSParameterValue -ParameterName 'TrapName' -Value $TrapName -AllowedValuesByVersion @{ '13.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYS-KERNEL-ERROR'); '14.1' = @('CPU-USAGE', 'AVERAGE-CPU', 'MEMORY', 'MGMT-CPU-USAGE', 'SYNFLOOD', 'TCP-SYNFLOOD', 'VSERVER-REQRATE', 'SERVICE-REQRATE', 'ENTITY-RXRATE', 'ENTITY-TXRATE', 'ENTITY-SYNFLOOD', 'SERVICE-MAXCLIENTS', 'HA-STATE-CHANGE', 'ENTITY-STATE', 'CONFIG-CHANGE', 'CONFIG-SAVE', 'SERVICEGROUP-MEMBER-REQRATE', 'SERVICEGROUP-MEMBER-MAXCLIENTS', 'MONITOR-RTO-THRESHOLD', 'LOGIN-FAILURE', 'SSL-CERT-EXPIRY', 'FAN-SPEED-LOW', 'VOLTAGE-LOW', 'VOLTAGE-HIGH', 'TEMPERATURE-HIGH', 'CPU-TEMPERATURE-HIGH', 'POWER-SUPPLY-FAILURE', 'DISK-USAGE-HIGH', 'INTERFACE-THROUGHPUT-LOW', 'MON_PROBE_FAILED', 'HA-VERSION-MISMATCH', 'HA-DISK-ENCRYPTION-MISMATCH', 'HA-SYNC-FAILURE', 'HA-NO-HEARTBEATS', 'HA-BAD-SECONDARY-STATE', 'INTERFACE-BW-USAGE', 'RATE-LIMIT-THRESHOLD-EXCEEDED', 'ENTITY-NAME-CHANGE', 'HA-PROP-FAILURE', 'IP-CONFLICT', 'PF-RL-RATE-THRESHOLD', 'PF-RL-PPS-THRESHOLD', 'PF-RL-RATE-PKTS-DROPPED', 'PF-RL-PPS-PKTS-DROPPED', 'APPFW-START-URL', 'APPFW-DENY-URL', 'APPFW-VIOLATIONS-TYPE', 'APPFW-REFERER-HEADER', 'APPFW-CSRF-TAG', 'APPFW-COOKIE', 'APPFW-FIELD-CONSISTENCY', 'APPFW-BUFFER-OVERFLOW', 'APPFW-FIELD-FORMAT', 'APPFW-FILE-UPLOAD-TYPE', 'APPFW-GRPC', 'APPFW-GRPC-WEB-JSON', 'APPFW-GRPC-WEB-TEXT', 'APPFW-JSON-DOS', 'APPFW-JSON-SQL', 'APPFW-JSON-XSS', 'APPFW-SAFE-COMMERCE', 'APPFW-SAFE-OBJECT', 'APPFW-SESSION-LIMIT', 'APPFW-SIGNATURE-MATCH', 'APPFW-POLICY-HIT', 'APPFW-XSS', 'APPFW-XML-XSS', 'APPFW-SQL', 'APPFW-XML-SQL', 'APPFW-XML-ATTACHMENT', 'APPFW-XML-DOS', 'APPFW-XML-VALIDATION', 'APPFW-XML-WSI', 'APPFW-XML-SCHEMA-COMPILE', 'APPFW-XML-SOAP-FAULT', 'APPFW-NEW-SIGNATURE-ADDED', 'APPFW-DEPLOY-RELAXATION-DP', 'APPFW-LEARNED-RULE-APPLIED-DYN-PROF', 'APPFW-CMD', 'APPFW-SCHEMA-ENDPOINT-NOTFOUND', 'APPFW-SCHEMA-METHOD-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-MISSING', 'APPFW-SCHEMA-VALUE-INCORRECT', 'APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED', 'APPFW-SCHEMA-PARAMETER-INVALID', 'APPFW-SCHEMA-OTHER', 'APPFW-SCHEMA-RELAXATION-RULE', 'APPFW-POSTBODYLIMIT', 'APPFW-JSON-CMD', 'APPFW-SQL-GRAM', 'APPFW-JSON-SQL-GRAM', 'APPFW-CMD-GRAM', 'APPFW-JSON-CMD-GRAM', 'APPFW-BLOCK-KEYWORD', 'APPFW-JSON-BLOCKKEYWORD', 'APPFW-BYPASS-LIST', 'APPFW-DENY-LIST', 'DNSKEY-EXPIRY', 'HA-LICENSE-MISMATCH', 'SSL-CARD-FAILED', 'SSL-CARD-NORMAL', 'WARM-RESTART-EVENT', 'HARD-DISK-DRIVE-ERRORS', 'COMPACT-FLASH-ERRORS', 'CALLHOME-UPLOAD-EVENT', '1024KEY-EXCHANGE-RATE', '2048KEY-EXCHANGE-RATE', '4096KEY-EXCHANGE-RATE', 'SSL-CUR-SESSION-INUSE', 'CLUSTER-NODE-HEALTH', 'CLUSTER-NODE-QUORUM', 'CLUSTER-VERSION-MISMATCH', 'CLUSTER-CCO-CHANGE', 'CLUSTER-OVS-CHANGE', 'CLUSTER-SYNC-FAILURE', 'CLUSTER-SYNC-PARTIAL-SUCCESS', 'CLUSTER-PROP-FAILURE', 'CLUSTER-PROP-EXEC-FAILURE', 'HA-STICKY-PRIMARY', 'INBAND-PROTOCOL-VERSION-MISMATCH', 'SSL-CHIP-REINIT', 'VRID-STATE-CHANGE', 'PORT-ALLOC-FAILED', 'LLDP-REMOTE-CHANGE', 'DUPLICATE-IPV6', 'PARTITION-CONFIG-EVENT', 'PARTITION-SWITCHED', 'LSN-PORTALLOC-FAILED', 'LSN-PORTQUOTA-EXCEED', 'LSN-SESSIONQUOTA-EXCEED', 'LSN-MEM-RECOVERY-KICKEDIN', 'VSERVER-SPILLOVER', 'INCONSISTENT-CONFIGURATION-IN-PPES', 'PARTITION-RATE-LIMIT', 'POOLED-LICENSE-ONGRACE', 'POOLED-LICENSE-PARTIAL', 'CLUSTER-BACKPLANE-HB-MISSING', 'GSLB-SITE-MEP-FLAP', 'DNS-MAXNEGCACHE-USAGE', 'DNS-MAXCACHE-USAGE', 'NS-LICENSE-EXPIRY', 'PKT-RATELIMITING-ATTACK', 'GSLB-SYNC-STATUS-FLIP', 'URLFILT-DB-UPDATE-STATUS', 'URLFILT-INIT-SDK', 'POOLED-LICENSE-CHECKOUT-FAILURE', 'MIGRATION-STARTED', 'MIGRATION-COMPLETE', 'ECDHE-EXCHANGE-RATE', 'BOT-SIGNATURE-UPDATE', 'APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH', 'PORT-ALLOC-EXCEED', 'KEK_UPDATE_SUCCESS', 'KEK_UPDATE_FAILURE', 'ADC-ANOMALY', 'SYSLOG-CONNECTION-DROPPED', 'SYSTEM_USER_PASSWORD_EXPIRY_WARNING', 'DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE', 'DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS', 'CLOUD-REST-API-FAILURE', 'SSL-ASYM-CRYPTO-UTILIZATION', 'SSL-SYM-CRYPTO-UTILIZATION', 'INTERFACE-AUTO-RECOVERY', 'SYS-KERNEL-ERROR', 'AVG-MGMT-CPU-USE', 'EXTRA-MGMT-CPU-USE') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Logging')) { $properties['logging'] = $Logging }
    if ($PSBoundParameters.ContainsKey('Normalvalue')) { $properties['normalvalue'] = $Normalvalue }
    if ($PSBoundParameters.ContainsKey('Severity')) { $properties['severity'] = $Severity }
    if ($PSBoundParameters.ContainsKey('State')) { $properties['state'] = $State }
    if ($PSBoundParameters.ContainsKey('ThresholdValue')) { $properties['thresholdvalue'] = $ThresholdValue }
    if ($PSBoundParameters.ContainsKey('Time')) { $properties['time'] = $Time }
    if ($PSBoundParameters.ContainsKey('TrapName')) { $properties['trapname'] = $TrapName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$TrapName", 'Update snmpalarm')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpalarm -Payload @{ snmpalarm = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPAlarm -TrapName $TrapName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPAlarm

# region Invoke-NSUpdateSNMPEngineid
function Invoke-NSUpdateSNMPEngineid {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpengineid resource.
    .DESCRIPTION
        Configuration for SNMP engine id resource.
    .PARAMETER Engineid
        A hexadecimal value of at least 10 characters, uniquely identifying the engineid. Minimum length = 10 Maximum length = 31
    .PARAMETER Ownernode
        ID of the cluster node for which you are setting the engineid. Default value: -1 Minimum value = 0 Maximum value = 31
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
        Invoke-NSUpdateSNMPEngineid -Ownernode 1 -Engineid 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPEngineid -Ownernode 1 -Engineid 'example' -WhatIf
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
        [string] $Engineid,

        [Parameter(Position = 0)]
        [int] $Ownernode,

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
    if ($PSBoundParameters.ContainsKey('Engineid')) { $properties['engineid'] = $Engineid }
    if ($PSBoundParameters.ContainsKey('Ownernode')) { $properties['ownernode'] = $Ownernode }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ownernode", 'Update snmpengineid')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpengineid -Payload @{ snmpengineid = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPEngineid -Ownernode $Ownernode -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPEngineid

# region Invoke-NSUpdateSNMPGroup
function Invoke-NSUpdateSNMPGroup {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpgroup resource.
    .DESCRIPTION
        Configuration for SNMP group resource.
    .PARAMETER Name
        Name for the SNMPv3 group. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the SNMPv3 group. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my name" or 'my name'). Minimum length = 1
    .PARAMETER ReadviewName
        Name of the configured SNMPv3 view that you want to bind to this SNMPv3 group. An SNMPv3 user bound to this group can access the subtrees that are bound to this SNMPv3 view as type INCLUDED, but cannot access the ones that are type EXCLUDED. If the Citrix ADC has multiple SNMPv3 view entries with the same name, all such entries are associated with the SNMPv3 group. Minimum length = 1
    .PARAMETER Securitylevel
        Security level required for communication between the Citrix ADC and the SNMPv3 users who belong to the group. Specify one of the following options: noAuthNoPriv. Require neither authentication nor encryption. authNoPriv. Require authentication but no encryption. authPriv. Require authentication and encryption. Note: If you specify authentication, you must specify an encryption algorithm when you assign an SNMPv3 user to the group. If you also specify encryption, you must assign both an authentication and an encryption algorithm for each group member. Possible values = noAuthNoPriv, authNoPriv, authPriv
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
        Invoke-NSUpdateSNMPGroup -Name 'example' -ReadviewName 'example' -Securitylevel noAuthNoPriv -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPGroup -Name 'example' -ReadviewName 'example' -Securitylevel noAuthNoPriv -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $ReadviewName,

        [Parameter(Mandatory)]
        [ValidateSet('noAuthNoPriv', 'authNoPriv', 'authPriv')]
        [string] $Securitylevel,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('ReadviewName')) { $properties['readviewname'] = $ReadviewName }
    if ($PSBoundParameters.ContainsKey('Securitylevel')) { $properties['securitylevel'] = $Securitylevel }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update snmpgroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpgroup -Payload @{ snmpgroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPGroup -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPGroup

# region Invoke-NSUpdateSNMPManager
function Invoke-NSUpdateSNMPManager {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpmanager resource.
    .DESCRIPTION
        Configuration for manager resource.
    .PARAMETER Domainresolveretry
        Amount of time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the SNMP manager if the last query failed. This parameter is valid for host-name based SNMP managers only. After a query succeeds, the TTL determines the wait time. The minimum and default value is 5. Minimum value = 5 Maximum value = 20939
    .PARAMETER Ipaddress
        IP address of the SNMP manager. Can be an IPv4 or IPv6 address. You can instead specify an IPv4 network address or IPv6 network prefix if you want the Citrix ADC to respond to SNMP queries from any device on the specified network. Alternatively, instead of an IPv4 address, you can specify a host name that has been assigned to an SNMP manager. If you do so, you must add a DNS name server that resolves the host name of the SNMP manager to its IP address. Note: The Citrix ADC does not support host names for SNMP managers that have IPv6 addresses. Minimum length = 1 Maximum length = 255
    .PARAMETER NetMask
        Subnet mask associated with an IPv4 network address. If the IP address specifies the address or host name of a specific host, accept the default value of 255.255.255.255.
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
        Invoke-NSUpdateSNMPManager -Ipaddress 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPManager -Ipaddress 'example' -WhatIf
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
        [int] $Domainresolveretry,

        [Parameter(Mandatory, Position = 0)]
        [string] $Ipaddress,

        [Parameter()]
        [string] $NetMask,

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
    if ($PSBoundParameters.ContainsKey('Domainresolveretry')) { $properties['domainresolveretry'] = $Domainresolveretry }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ipaddress", 'Update snmpmanager')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpmanager -Payload @{ snmpmanager = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPManager -Ipaddress $Ipaddress -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPManager

# region Invoke-NSUpdateSNMPMib
function Invoke-NSUpdateSNMPMib {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpmib resource.
    .DESCRIPTION
        Configuration for SNMP mib resource.
    .PARAMETER Contact
        Name of the administrator for this Citrix ADC. Along with the name, you can include information on how to contact this person, such as a phone number or an email address. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the information includes one or more spaces, enclose it in double or single quotation marks (for example, "my contact" or 'my contact'). Default value: "WebMaster (default)" Minimum length = 1
    .PARAMETER CustomId
        Custom identification number for the Citrix ADC. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a custom identification that helps identify the Citrix ADC appliance. The following requirement applies only to the Citrix ADC CLI: If the ID includes one or more spaces, enclose it in double or single quotation marks (for example, "my ID" or 'my ID'). Default value: "Default" Minimum length = 1
    .PARAMETER Location
        Physical location of the Citrix ADC. For example, you can specify building name, lab number, and rack number. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the location includes one or more spaces, enclose it in double or single quotation marks (for example, "my location" or 'my location'). Default value: "POP (default)" Minimum length = 1
    .PARAMETER Name
        Name for this Citrix ADC. Can consist of 1 to 127 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the Citrix ADC appliance. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my name" or 'my name'). Default value: "NetScaler" Minimum length = 1
    .PARAMETER Ownernode
        ID of the cluster node for which we are setting the mib. This is a mandatory argument to set snmp mib on CLIP. Default value: -1 Minimum value = 0 Maximum value = 31
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
        Invoke-NSUpdateSNMPMib -Ownernode 1 -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPMib -Ownernode 1 -WhatIf
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
        [string] $Contact,

        [Parameter()]
        [string] $CustomId,

        [Parameter()]
        [string] $Location,

        [Parameter()]
        [string] $Name,

        [Parameter(Position = 0)]
        [int] $Ownernode,

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
    if ($PSBoundParameters.ContainsKey('Contact')) { $properties['contact'] = $Contact }
    if ($PSBoundParameters.ContainsKey('CustomId')) { $properties['customid'] = $CustomId }
    if ($PSBoundParameters.ContainsKey('Location')) { $properties['location'] = $Location }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Ownernode')) { $properties['ownernode'] = $Ownernode }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Ownernode", 'Update snmpmib')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpmib -Payload @{ snmpmib = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPMib -Ownernode $Ownernode -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPMib

# region Invoke-NSUpdateSNMPOption
function Invoke-NSUpdateSNMPOption {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpoption resource.
    .DESCRIPTION
        Configuration for SNMP option resource.
    .PARAMETER CustomTrap
        By default, Customtrap will be disabled, set to enabled when using the feature. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PartitionNameInTrap
        Send partition name as a varbind in traps. By default the partition names are not sent as a varbind. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SeverityinfoinTrap
        By default, the severity level info of the trap is not mentioned in the trap message. Enable this option to send severity level of trap as one of the varbind in the trap message. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPSet
        Accept SNMP SET requests sent to the Citrix ADC, and allow SNMP managers to write values to MIB objects that are configured for write access. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPTrapLogging
        Log any SNMP trap events (for SNMP alarms in which logging is enabled) even if no trap listeners are configured. With the default setting, SNMP trap events are logged if at least one trap listener is configured on the appliance. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPTrapLogginglevel
        Audit log level of SNMP trap logs. The default value is INFORMATIONAL. Default value: INFORMATIONAL Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG
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
        Invoke-NSUpdateSNMPOption  -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPOption  -WhatIf
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
        [string] $CustomTrap,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PartitionNameInTrap,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SeverityinfoinTrap,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SNMPSet,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SNMPTrapLogging,

        [Parameter()]
        [ValidateSet('EMERGENCY', 'ALERT', 'CRITICAL', 'ERROR', 'WARNING', 'NOTICE', 'INFORMATIONAL', 'DEBUG')]
        [string] $SNMPTrapLogginglevel,

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

    if ($PSBoundParameters.ContainsKey('CustomTrap')) {
        Assert-NSParameterValue -ParameterName 'CustomTrap' -Value $CustomTrap -AllowedValuesByVersion @{ '13.1' = @(); '14.1' = @('ENABLED', 'DISABLED') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('CustomTrap')) { $properties['customtrap'] = $CustomTrap }
    if ($PSBoundParameters.ContainsKey('PartitionNameInTrap')) { $properties['partitionnameintrap'] = $PartitionNameInTrap }
    if ($PSBoundParameters.ContainsKey('SeverityinfoinTrap')) { $properties['severityinfointrap'] = $SeverityinfoinTrap }
    if ($PSBoundParameters.ContainsKey('SNMPSet')) { $properties['snmpset'] = $SNMPSet }
    if ($PSBoundParameters.ContainsKey('SNMPTrapLogging')) { $properties['snmptraplogging'] = $SNMPTrapLogging }
    if ($PSBoundParameters.ContainsKey('SNMPTrapLogginglevel')) { $properties['snmptraplogginglevel'] = $SNMPTrapLogginglevel }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('snmpoption', 'Update snmpoption')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpoption -Payload @{ snmpoption = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPOption

# region Invoke-NSUpdateSNMPTrap
function Invoke-NSUpdateSNMPTrap {
    <#
    .SYNOPSIS
        Updates a NetScaler snmptrap resource.
    .DESCRIPTION
        Configuration for snmp trap resource.
    .PARAMETER AllPartitionS
        Send traps of all partitions to this destination. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER CommUnitYName
        Password (string) sent with the trap messages, so that the trap listener can authenticate them. Can include 1 to 32 uppercase or lowercase letters, numbers, and hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters. You must specify the same community string on the trap listener device. Otherwise, the trap listener drops the trap messages. The following requirement applies only to the Citrix ADC CLI: If the string includes one or more spaces, enclose the name in double or single quotation marks (for example, "my string" or 'my string').
    .PARAMETER DestPort
        UDP port at which the trap listener listens for trap messages. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: 162 Minimum value = 1 Maximum value = 65534
    .PARAMETER Severity
        Severity level at or above which the Citrix ADC sends trap messages to this trap listener. The severity levels, in increasing order of severity, are Informational, Warning, Minor, Major, Critical. This parameter can be set for trap listeners of type SPECIFIC only. The default is to send all levels of trap messages. Important: Trap messages are not assigned severity levels unless you specify severity levels when configuring SNMP alarms. Default value: Unknown Possible values = Critical, Major, Minor, Warning, Informational
    .PARAMETER Srcip
        IPv4 or IPv6 address that the Citrix ADC inserts as the source IP address in all SNMP trap messages that it sends to this trap listener. By default this is the appliance's NSIP or NSIP6 address, but you can specify an IPv4 MIP or SNIP/SNIP6 address. In cluster setup, the default value is the individual node's NSIP, but it can be set to CLIP or Striped SNIP address. In non default partition, this parameter must be set to the SNIP/SNIP6 address. Minimum length = 1
    .PARAMETER TrafficDomain
        Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0. Minimum value = 0 Maximum value = 4094
    .PARAMETER TrapClass
        Type of trap messages that the Citrix ADC sends to the trap listener: Generic or the enterprise-specific messages defined in the MIB file. Possible values = generic, specific
    .PARAMETER TrapDestination
        IPv4 or the IPv6 address of the trap listener to which the Citrix ADC is to send SNMP trap messages. Minimum length = 1
    .PARAMETER Version
        SNMP version, which determines the format of trap messages sent to the trap listener. This setting must match the setting on the trap listener. Otherwise, the listener drops the trap messages. Default value: V2 Possible values = V1, V2, V3
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
        Invoke-NSUpdateSNMPTrap -TrapClass generic -TrapDestination 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPTrap -TrapClass generic -TrapDestination 'example' -WhatIf
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
        [string] $AllPartitionS,

        [Parameter()]
        [string] $CommUnitYName,

        [Parameter()]
        [int] $DestPort,

        [Parameter()]
        [ValidateSet('Critical', 'Major', 'Minor', 'Warning', 'Informational')]
        [string] $Severity,

        [Parameter()]
        [string] $Srcip,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter(Mandatory, Position = 0)]
        [ValidateSet('generic', 'specific')]
        [string] $TrapClass,

        [Parameter(Mandatory)]
        [string] $TrapDestination,

        [Parameter()]
        [ValidateSet('V1', 'V2', 'V3')]
        [string] $Version,

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
    if ($PSBoundParameters.ContainsKey('AllPartitionS')) { $properties['allpartitions'] = $AllPartitionS }
    if ($PSBoundParameters.ContainsKey('CommUnitYName')) { $properties['communityname'] = $CommUnitYName }
    if ($PSBoundParameters.ContainsKey('DestPort')) { $properties['destport'] = $DestPort }
    if ($PSBoundParameters.ContainsKey('Severity')) { $properties['severity'] = $Severity }
    if ($PSBoundParameters.ContainsKey('Srcip')) { $properties['srcip'] = $Srcip }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('TrapClass')) { $properties['trapclass'] = $TrapClass }
    if ($PSBoundParameters.ContainsKey('TrapDestination')) { $properties['trapdestination'] = $TrapDestination }
    if ($PSBoundParameters.ContainsKey('Version')) { $properties['version'] = $Version }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$TrapClass", 'Update snmptrap')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmptrap -Payload @{ snmptrap = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPTrap -TrapClass $TrapClass -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPTrap

# region Invoke-NSUpdateSNMPUser
function Invoke-NSUpdateSNMPUser {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpuser resource.
    .DESCRIPTION
        Configuration for SNMP user resource.
    .PARAMETER Authpasswd
        Plain-text pass phrase to be used by the authentication algorithm specified by the authType (Authentication Type) parameter. Can consist of 8 to 64 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the pass phrase includes one or more spaces, enclose it in double or single quotation marks (for example, "my phrase" or 'my phrase'). Minimum length = 8
    .PARAMETER AuthType
        Authentication algorithm used by the Citrix ADC and the SNMPv3 user for authenticating the communication between them. You must specify the same authentication algorithm when you configure the SNMPv3 user in the SNMP manager. Possible values = MD5, SHA, SHA256, SHA512
    .PARAMETER Group
        Name of the configured SNMPv3 group to which to bind this SNMPv3 user. The access rights (bound SNMPv3 views) and security level set for this group are assigned to this user. Minimum length = 1
    .PARAMETER Name
        Name for the SNMPv3 user. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my user" or 'my user'). Minimum length = 1
    .PARAMETER Privpasswd
        Encryption key to be used by the encryption algorithm specified by the privType (Encryption Type) parameter. Can consist of 8 to 64 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. The following requirement applies only to the Citrix ADC CLI: If the key includes one or more spaces, enclose it in double or single quotation marks (for example, "my key" or 'my key'). Minimum length = 8
    .PARAMETER PrivType
        Encryption algorithm used by the Citrix ADC and the SNMPv3 user for encrypting the communication between them. You must specify the same encryption algorithm when you configure the SNMPv3 user in the SNMP manager. Possible values = DES, AES, AES192, AES256
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
        Invoke-NSUpdateSNMPUser -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPUser -Name 'example' -WhatIf
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
        [string] $Authpasswd,

        [Parameter()]
        [string] $AuthType,

        [Parameter()]
        [string] $Group,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Privpasswd,

        [Parameter()]
        [string] $PrivType,

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

    if ($PSBoundParameters.ContainsKey('AuthType')) {
        Assert-NSParameterValue -ParameterName 'AuthType' -Value $AuthType -AllowedValuesByVersion @{ '13.1' = @('MD5', 'SHA'); '14.1' = @('MD5', 'SHA', 'SHA256', 'SHA512') } -MetadataVersion $metadataVersion
    }

    if ($PSBoundParameters.ContainsKey('PrivType')) {
        Assert-NSParameterValue -ParameterName 'PrivType' -Value $PrivType -AllowedValuesByVersion @{ '13.1' = @('DES', 'AES'); '14.1' = @('DES', 'AES', 'AES192', 'AES256') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Authpasswd')) { $properties['authpasswd'] = $Authpasswd }
    if ($PSBoundParameters.ContainsKey('AuthType')) { $properties['authtype'] = $AuthType }
    if ($PSBoundParameters.ContainsKey('Group')) { $properties['group'] = $Group }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Privpasswd')) { $properties['privpasswd'] = $Privpasswd }
    if ($PSBoundParameters.ContainsKey('PrivType')) { $properties['privtype'] = $PrivType }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update snmpuser')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpuser -Payload @{ snmpuser = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPUser -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPUser

# region Invoke-NSUpdateSNMPView
function Invoke-NSUpdateSNMPView {
    <#
    .SYNOPSIS
        Updates a NetScaler snmpview resource.
    .DESCRIPTION
        Configuration for view resource.
    .PARAMETER Name
        Name for the SNMPv3 view. Can consist of 1 to 31 characters that include uppercase and lowercase letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at sign (@), equals (=), colon (:), and underscore (_) characters. You should choose a name that helps identify the SNMPv3 view. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose it in double or single quotation marks (for example, "my view" or 'my view'). Minimum length = 1
    .PARAMETER Subtree
        A particular branch (subtree) of the MIB tree that you want to associate with this SNMPv3 view. You must specify the subtree as an SNMP OID. Minimum length = 1
    .PARAMETER Type
        Include or exclude the subtree, specified by the subtree parameter, in or from this view. This setting can be useful when you have included a subtree, such as A, in an SNMPv3 view and you want to exclude a specific subtree of A, such as B, from the SNMPv3 view. Possible values = included, excluded
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
        Invoke-NSUpdateSNMPView -Name 'example' -Subtree 'example' -Type included -PassThru
    .EXAMPLE
        Invoke-NSUpdateSNMPView -Name 'example' -Subtree 'example' -Type included -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Subtree,

        [Parameter(Mandatory)]
        [ValidateSet('included', 'excluded')]
        [string] $Type,

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
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Subtree')) { $properties['subtree'] = $Subtree }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update snmpview')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type snmpview -Payload @{ snmpview = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetSNMPView -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateSNMPView

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCiv16zmcOnaark
# xBGItf6/k/svnBv0ybknbDIDDgJ5RKCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgJhD3
# 7GImjPonvd/BjY56XkQV82joaqAYSMBIUbk8OgIwDQYJKoZIhvcNAQEBBQAEggGA
# QNkrc3Hr66GbmkPbvqCx64DmfC4WHmnm9hf1SOkg5XBFo0dXQrjpKHaegkCwAs4O
# 6TSwf4wVDyrBPVXpv8eUrqiuVgs/YkO1fplP90x0QBryBPNuVThCkUCrfRfzAp9F
# TD1KfwtL6bQthHNkupCl9Xo5+LvrL7eT3QEbXJg1MSCfas045V7a42CLv/zRfkWu
# 0Z4l0jckJC108ibt4E6OyzD5hZoJGxXn21tEurADs9e2diZwrcsmUXFGpKrAGwQs
# 7I8j9QWAIEwkr6dxi+G4V3T5ILQrLkBgtqCHeR+ZjRmxcyXuinDPGiDuIgR0vGQe
# iGZ3/MVh3sUhsBMzOqoLkn4taKvN2w6r+mTGqTCrcrekGdL2FaDjqVEjzsAcU9o9
# kjWz8LkRbxcC2HU4hdv++t4DToyErT4hniYFHKWH6ZhG+GLmVnuBJYbCjSchNMcA
# vpi+0MToMkT7ergJGuTDUT+q1G0nTmhOtxxDeZVftYOrIgQ2coWc8rsGticCQnUu
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEINORc6AxmKRzuSmzUP0+
# YH16O5lFurkxn4/TK4+0akF+AgZqNTBfoS4YEzIwMjYwODAzMTI1MjMxLjU1Nlow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYD
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
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAWvYNZ4yF7d0IAAAAAABaMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwM1oXDTI3MDEwNzE4NTkwM1ow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjQ5MUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAO/0O0eWjgUb9rnHcQLRdfWPN4H+91a3Ynla
# P46E1m4uD+JKx6csWMStX79fxLJUAqHJqQWE19UlNMhS9jEB32dAJ4yuWsHyUuM+
# dphjDz4E5jl4gYGZEmaOrKvNt+KqlFayyg/oTg3BlLRu4aBq8668A5qlHcfsuh6D
# dSqFID1ixJFZzHrZFG1iGBG7U1Bn2ONLDo7jbwX5rMcPduTAUw/c7M3WhSxQBuZp
# Qiz8RQGKIqCKfIxgQkKdzpCpU0SWQOE/DgTXbz3c15KMRCdkGlL2zb+lnuSV4sse
# Qm3qflZiZckLyn2xJI8ZXDkq+Ig+b/rsPPIfI8di228WvK1j67JXpyeVCaSUO9Er
# zlLnTrnjQkeXVQIp73xuVBVrmvoTf/v4a7MnrmuKSyIXc5vJUHEGB345+O8omFt1
# w8b+Xg9D9PKIRqDPEv7HRk0C+Yvxu8FvHJvSocSIZK+v/FmKFOipYnpP76yAmJNn
# yheucShOgk8QiU53USn/+AyMb7xW905gZnyNqb29HeVdQ175pDHJGEz8Cx5wiHeV
# liGz5hABucFDylR9z3LSTmB6+3ZuIxeG9BZS46P6ANPkuVuD5m8wgc7GLLzg73Cs
# DF09ukt8Uf8dTcMBX3ro+7/k9M6Xt8WPG7IL9v/4DvyMY03tkb9Y9Ri6HWavXRPY
# RCUePspPAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQUjmOyQ6twMcP1ZbRytJxI4fnX
# mcIwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQCAlM8r+t3hIb2h1lDTAx+iYkQlxFuU7QONeyIFIBZ29xvG
# l8pehKxErDzIniOpIX/eluUAwQKoaI0zwuKAdR0mrSHXCniMoLNko5W+5r7sXNam
# KX7QMV3BfGOX3gi9qVfxyUe7AHXbqQ8KBQHNYCnNFtQQHgARrlYhtyAKol5ctM0C
# Ac/y3oY7bTMsVJvnA5u7DVWPeXoST2KEMDeLBvJYq0IJZ6yMpDOWLZ4UP82bksyS
# hIB/XdawirIGLdseudryRxVMk313mAcjGRb59+Ittt6otVvYQWqH+PGrTUzEcez8
# aQuO3umoNZjKuFoX5VsPP/gSZse+orhG3zfZk9IDyE3DfUFrhvkv6H0tijK1D0uI
# GhwMBWSm9ktQ6oeU+aurZFx3MI+LODnHsbRFZAy11uMvwKq+ZNC1Se4tIM1u9piW
# AhnTPoh6mULKikHOVhHaO953tkzDCtjsse5GUKOx9yg9nqHKWMgnODp62/uPPzC/
# yDEISrXCcU7UB7tATr3zWNEdtM4d009iXWI6dV/SdcIIX44rpoLyCLw+nXjxp+fY
# /dygLO7UdSQaVaUFVj3K2nVyuujPspt5Lunc5FvuYPqmi/z8kASmmwbiF+W0P0UT
# WFaC84MWfU2h6MDg5s0oxmdNFK76jXr3wZfdSoV7FCKfq5GdeGoy5UwDQwMC0DGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABa9g1njIXt3QgAAAAAAFowDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgYp4VX3ysDOj3bZBAQDB7sAKwsP6d03usu5QS8UEvYQQwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCBiuWRAi+p96PRsBt3TwW3jNozgPQS+Qco1CVm/NaU0
# QzB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFr2DWeMhe3dCAAAAAAAWjAiBCBjvs38TkZQ7iGxRP7H
# HHeWregoVp5960ewGO9kUZr6FDANBgkqhkiG9w0BAQsFAASCAgBnZEoBuiQk0mL1
# M3tXvB43i5UJjwYzDP0k+kNUyvwwQY6Fx0lV5131eekc2OcXc1sF1l8MkNqC/ApR
# 3mjDV/QpUQGUuRos+SxahD3jS7HfcWbr/RRDVqhqrBV1XS7/9K4JbESS5n5vCFr5
# bDq+lWlydmFLZOxUmcFCK6CaJrWGG74rYVCy8Wl+JMntMa1byJl+tpIT4t4h8wns
# Qs/uNx2em3fTDqKUG1Ce7boBmbAQ7MRdGg2vdP8O1PUZSquJxvl9fScSmV2fxtuO
# SmBky2Qvfh/x5LhroJuhNLKI7Ac0M+Vn6WC5ec52GUFk4HXPNIStaOorbavXt9E1
# 9gW8ValTkHDB4I2lOMHsRUGTSz9jGJIuf4gyAaRXNP0AXUYJESU5bQRlU7bvD8uv
# FxqbDCCzyRFBeUVtagcW1/J+8hEygULmkfXS5fVfGRYviV5MI01wNPiRWDb8od1J
# yi6NUUNb1dGTF5VBTfGkVuRN3iGY/csA3dG4HUGXdToQXaF/dyNLXu3XnsLmUuDD
# ROwzzFTLaD/or3YihiUPRvS9/iUapvddFaO5qiLm4EOxyp9D3tQBdpXEUY41/nsJ
# VB9pgCtBtNqRY0mEkBiT2UvkYZz5flJUxpdEgpbIva9izQGW1iU34T/OWlb9jV7g
# hh4baWCgah6hgyIA1uwNXOmyGFv+/A==
# SIG # End signature block
