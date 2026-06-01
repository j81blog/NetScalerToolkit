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
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCiv16zmcOnaark
# xBGItf6/k/svnBv0ybknbDIDDgJ5RKCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCAmEPfsYiaM+ie938GNjnpeRBXzaOhqoBhIwEhRuTw6
# AjANBgkqhkiG9w0BAQEFAASCAYCmeAzax3UZaxOWEssm9IX4YAL2z8/D/nETzlLD
# KoD9fAArwocx3nEPUHab+KMpImuIhxNchluYOVRNT8gNXfl9spN+elFlpzVFc3WK
# QSK6rs0rReQgGxc2/aAUoo9/SiOjCcAkaD3O63SSAHIEy3t2aYRbRS689C/6n9Eq
# Yf3D52yGiSzJZPOEuid7EaQ4Jvvxi09XsJUulxAOZyr8EbrWapEqzYY/sMa5EOrC
# 39GNpc0etb3+MLcEfmWHXXwkOqpnG9djdsoFOoXO6PFENkRT5eZ4344JUYd7xHoU
# 3vyGDjX65IlvMNwUm/KcvIi3vwEyZ6L5LfQyhHoG1z9bP9JZEOSEUmJKgWiKn2Ia
# dVPZJnDz49OfuOCeoHwwFg2JJ8kJKAURlcBlBueE+DscqHznfSXPxiazluK7bkCI
# nvOIbLNVoJ+TZSqmUVm3B8ROuIWaEdDOC2381+OJ4BsdG/JF6LYaS0OtamXBGypk
# 5UwpwQEs6likO2fFW3mkHhkD8u2hggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU2MzVaMD8GCSqGSIb3
# DQEJBDEyBDAk2EJ8gR/kGJsdfo5edzI/N7y6cXCBzehfoqHpDsfwd+8Hs6Y3HQ6W
# CfP+mTM4fuIwDQYJKoZIhvcNAQEBBQAEggIAze1JnTyBwlZXZshr7SI65ue3XTuK
# RRgPlrA+YCGl8X5aLoKA3SihEK+4W7nUxXHDBEsTlQDQllJSwUL1H4b/GmKbZ018
# 44Nwyk+FKgDml7WqrnpGrD40090OWxV8osxLFEGLGY8VGDjPRFQy9VBvzCKz/T9e
# PRJfAfX9Dtqn6z13vuJghtQxE0FhKVJYYwGxav0um6eTojZCh6psZo/WN2WaZk6G
# tbDGAc6c/0aGuJp2QL6pBA99vZnUc1+23rj83CXS98YvwuuMfGqnng88kRkLi++O
# Wcb4jBQrKctt2nCYNz16mbNmu9zsM72e4fFl7VnXUQ7GRicMXTTaih9epkBIiC0f
# ZRN4VDiofBDyA2xrCT25fBwpmY890ERc7+RpfjNE8SvBz6sYsUcIYXnZy4YZKJmq
# CQO0xcPbbaL1jBUemxSzVVpIhX6Y1Xsbk075JezJmoj41qZ+M20Ku360EMiF5hHV
# JEA8ieXA6lKBSweh+LHrIWtA2q8ftx3gaiC79GRkOUpz/Tme8XoNpQrrgbv8/8Hr
# nsENqyqQBMpQxvBrya/xFiYQ84/hlX+B22ZHGGNTZPLvpCX4tWMscFcCbcQ/eXVJ
# sGcLoe+HbPZyItlYIO3iICd8RE8KLQ22Uf6OHMZKxr6OmIA+sZW8xe5sHOUCF73u
# 1+w7DbBuM4rq9fw=
# SIG # End signature block
