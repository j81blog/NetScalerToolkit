# Generated NetScalerToolkit Configuration bundle for category 'lsn'.

# region Invoke-NSAddLSNAppsAttributes
function Invoke-NSAddLSNAppsAttributes {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnappsattributes resource.
    .DESCRIPTION
        Configuration for LSN Application Attributes resource.
    .PARAMETER Name
        Name for the LSN Application Port ATTRIBUTES. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Port
        This is used for Displaying Port/Port range in CLI/Nitro.Lowport, Highport values are populated and used for displaying.Port numbers or range of port numbers to match against the destination port of the incoming packet from a subscriber. When the destination port is matched, the LSN application profile is applied for the LSN session. Separate a range of ports with a hyphen. For example, 40-90. Minimum length = 1
    .PARAMETER SessionTimeout
        Timeout, in seconds, for an idle LSN session. If an LSN session is idle for a time that exceeds this value, the Citrix ADC removes the session.This timeout does not apply for a TCP LSN session when a FIN or RST message is received from either of the endpoints. Default value: 30 Minimum value = 5 Maximum value = 600
    .PARAMETER TransPortProtocol
        Name of the protocol(TCP,UDP) for which the parameters of this LSN application port ATTRIBUTES applies. Possible values = TCP, UDP, ICMP
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
        Invoke-NSAddLSNAppsAttributes -Name 'example' -TransPortProtocol TCP -Port 80 -PassThru
    .EXAMPLE
        Invoke-NSAddLSNAppsAttributes -Name 'example' -TransPortProtocol TCP -Port 80 -WhatIf
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

        [Parameter()]
        [string] $Port,

        [Parameter()]
        [int] $SessionTimeout,

        [Parameter(Mandatory)]
        [ValidateSet('TCP', 'UDP', 'ICMP')]
        [string] $TransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $properties['sessiontimeout'] = $SessionTimeout }
    if ($PSBoundParameters.ContainsKey('TransPortProtocol')) { $properties['transportprotocol'] = $TransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create lsnappsattributes')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnappsattributes -Payload @{ lsnappsattributes = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNAppsAttributes -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNAppsAttributes

# region Invoke-NSAddLSNAppsProfile
function Invoke-NSAddLSNAppsProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnappsprofile resource.
    .DESCRIPTION
        Configuration for LSN Application Profile resource.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Filtering
        Type of filter to apply to packets originating from external hosts. Consider an example of an LSN mapping that includes the mapping of subscriber IP:port (X:x), NAT IP:port (N:n), and external host IP:port (Y:y). Available options function as follows: * ENDPOINT INDEPENDENT - Filters out only packets not destined to the subscriber IP address and port X:x, regardless of the external host IP address and port source (Z:z). The Citrix ADC forwards any packets destined to X:x. In other words, sending packets from the subscriber to any external IP address is sufficient to allow packets from any external hosts to the subscriber. * ADDRESS DEPENDENT - Filters out packets not destined to subscriber IP address and port X:x. In addition, the ADC filters out packets from Y:y destined for the subscriber (X:x) if the client has not previously sent packets to Y:anyport (external port independent). In other words, receiving packets from a specific external host requires that the subscriber first send packets to that specific external host's IP address. * ADDRESS PORT DEPENDENT (the default) - Filters out packets not destined to subscriber IP address and port (X:x). In addition, the Citrix ADC filters out packets from Y:y destined for the subscriber (X:x) if the subscriber has not previously sent packets to Y:y. In other words, receiving packets from a specific external host requires that the subscriber first send packets first to that external IP address and port. Default value: ADDRESS-PORT-DEPENDENT Possible values = ENDPOINT-INDEPENDENT, ADDRESS-DEPENDENT, ADDRESS-PORT-DEPENDENT
    .PARAMETER Ippooling
        NAT IP address allocation options for sessions associated with the same subscriber. Available options function as follows: * Paired - The Citrix ADC allocates the same NAT IP address for all sessions associated with the same subscriber. When all the ports of a NAT IP address are used in LSN sessions (for same or multiple subscribers), the Citrix ADC ADC drops any new connection from the subscriber. * Random - The Citrix ADC allocates random NAT IP addresses, from the pool, for different sessions associated with the same subscriber. This parameter is applicable to dynamic NAT allocation only. Default value: RANDOM Possible values = PAIRED, RANDOM
    .PARAMETER L2info
        Enable l2info by creating natpcbs for LSN, which enables the Citrix ADC to use L2CONN/MBF with LSN. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Mapping
        Type of LSN mapping to apply to subsequent packets originating from the same subscriber IP address and port. Consider an example of an LSN mapping that includes the mapping of the subscriber IP:port (X:x), NAT IP:port (N:n), and external host IP:port (Y:y). Available options function as follows: * ENDPOINT-INDEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same subscriber IP address and port (X:x) to any external IP address and port. * ADDRESS-DEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same subscriber IP address and port (X:x) to the same external IP address (Y), regardless of the external port. * ADDRESS-PORT-DEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same internal IP address and port (X:x) to the same external IP address and port (Y:y) while the mapping is still active. Default value: ADDRESS-PORT-DEPENDENT Possible values = ENDPOINT-INDEPENDENT, ADDRESS-DEPENDENT, ADDRESS-PORT-DEPENDENT
    .PARAMETER TCPProxy
        Enable TCP proxy, which enables the Citrix ADC to optimize the TCP traffic by using Layer 4 features. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER TrafficDomain
        ID of the traffic domain through which the Citrix ADC sends the outbound traffic after performing LSN. If you do not specify an ID, the ADC sends the outbound traffic through the default traffic domain, which has an ID of 0. Default value: 4095
    .PARAMETER TransPortProtocol
        Name of the protocol for which the parameters of this LSN application profile applies. Possible values = TCP, UDP, ICMP
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
        Invoke-NSAddLSNAppsProfile -AppsProfileName 'example' -TransPortProtocol TCP -PassThru
    .EXAMPLE
        Invoke-NSAddLSNAppsProfile -AppsProfileName 'example' -TransPortProtocol TCP -WhatIf
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
        [string] $AppsProfileName,

        [Parameter()]
        [ValidateSet('ENDPOINT-INDEPENDENT', 'ADDRESS-DEPENDENT', 'ADDRESS-PORT-DEPENDENT')]
        [string] $Filtering,

        [Parameter()]
        [ValidateSet('PAIRED', 'RANDOM')]
        [string] $Ippooling,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $L2info,

        [Parameter()]
        [ValidateSet('ENDPOINT-INDEPENDENT', 'ADDRESS-DEPENDENT', 'ADDRESS-PORT-DEPENDENT')]
        [string] $Mapping,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $TCPProxy,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter(Mandatory)]
        [ValidateSet('TCP', 'UDP', 'ICMP')]
        [string] $TransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('AppsProfileName')) { $properties['appsprofilename'] = $AppsProfileName }
    if ($PSBoundParameters.ContainsKey('Filtering')) { $properties['filtering'] = $Filtering }
    if ($PSBoundParameters.ContainsKey('Ippooling')) { $properties['ippooling'] = $Ippooling }
    if ($PSBoundParameters.ContainsKey('L2info')) { $properties['l2info'] = $L2info }
    if ($PSBoundParameters.ContainsKey('Mapping')) { $properties['mapping'] = $Mapping }
    if ($PSBoundParameters.ContainsKey('TCPProxy')) { $properties['tcpproxy'] = $TCPProxy }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('TransPortProtocol')) { $properties['transportprotocol'] = $TransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Create lsnappsprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnappsprofile -Payload @{ lsnappsprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNAppsProfile -AppsProfileName $AppsProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNAppsProfile

# region Invoke-NSAddLSNAppsProfileLSNAppsAttributesBinding
function Invoke-NSAddLSNAppsProfileLSNAppsAttributesBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnappsprofile_lsnappsattributes_binding resource.
    .DESCRIPTION
        Binding object showing the lsnappsattributes that can be bound to lsnappsprofile.
    .PARAMETER AppsattributesName
        Name of the LSN application port ATTRIBUTES command to bind to the specified LSN Appsprofile. Properties of the Appsprofile will be applicable to this APPSATTRIBUTES.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSAddLSNAppsProfileLSNAppsAttributesBinding -AppsProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNAppsProfileLSNAppsAttributesBinding -AppsProfileName 'example' -WhatIf
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
        [string] $AppsattributesName,

        [Parameter(Mandatory, Position = 0)]
        [string] $AppsProfileName,

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
    if ($PSBoundParameters.ContainsKey('AppsattributesName')) { $properties['appsattributesname'] = $AppsattributesName }
    if ($PSBoundParameters.ContainsKey('AppsProfileName')) { $properties['appsprofilename'] = $AppsProfileName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Create lsnappsprofile_lsnappsattributes_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnappsprofile_lsnappsattributes_binding -Payload @{ lsnappsprofile_lsnappsattributes_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding -AppsProfileName $AppsProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNAppsProfileLSNAppsAttributesBinding

# region Invoke-NSAddLSNAppsProfilePortBinding
function Invoke-NSAddLSNAppsProfilePortBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnappsprofile_port_binding resource.
    .DESCRIPTION
        Binding object showing the port that can be bound to lsnappsprofile.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER LsnPort
        Port numbers or range of port numbers to match against the destination port of the incoming packet from a subscriber. When the destination port is matched, the LSN application profile is applied for the LSN session. Separate a range of ports with a hyphen. For example, 40-90. Minimum length = 1
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
        Invoke-NSAddLSNAppsProfilePortBinding -AppsProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNAppsProfilePortBinding -AppsProfileName 'example' -WhatIf
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
        [string] $AppsProfileName,

        [Parameter()]
        [string] $LsnPort,

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
    if ($PSBoundParameters.ContainsKey('AppsProfileName')) { $properties['appsprofilename'] = $AppsProfileName }
    if ($PSBoundParameters.ContainsKey('LsnPort')) { $properties['lsnport'] = $LsnPort }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Create lsnappsprofile_port_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnappsprofile_port_binding -Payload @{ lsnappsprofile_port_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNAppsProfilePortBinding -AppsProfileName $AppsProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNAppsProfilePortBinding

# region Invoke-NSAddLSNClient
function Invoke-NSAddLSNClient {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnclient resource.
    .DESCRIPTION
        Configuration for lsn client resource.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
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
        Invoke-NSAddLSNClient -ClientName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNClient -ClientName 'example' -WhatIf
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
        [string] $ClientName,

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
    if ($PSBoundParameters.ContainsKey('ClientName')) { $properties['clientname'] = $ClientName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ClientName", 'Create lsnclient')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnclient -Payload @{ lsnclient = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNClient -ClientName $ClientName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNClient

# region Invoke-NSAddLSNClientACL6Binding
function Invoke-NSAddLSNClientACL6Binding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnclient_nsacl6_binding resource.
    .DESCRIPTION
        Binding object showing the nsacl6 that can be bound to lsnclient.
    .PARAMETER Acl6Name
        Name of any configured extended ACL6 whose action is ALLOW. The condition specified in the extended ACL6 rule is used as the condition for the LSN client. Minimum length = 1
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
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
        Invoke-NSAddLSNClientACL6Binding -ClientName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNClientACL6Binding -ClientName 'example' -WhatIf
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
        [string] $Acl6Name,

        [Parameter(Mandatory, Position = 0)]
        [string] $ClientName,

        [Parameter()]
        [int] $TrafficDomain,

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
    if ($PSBoundParameters.ContainsKey('Acl6Name')) { $properties['acl6name'] = $Acl6Name }
    if ($PSBoundParameters.ContainsKey('ClientName')) { $properties['clientname'] = $ClientName }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ClientName", 'Create lsnclient_nsacl6_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnclient_nsacl6_binding -Payload @{ lsnclient_nsacl6_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNClientACL6Binding -ClientName $ClientName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNClientACL6Binding

# region Invoke-NSAddLSNClientACLBinding
function Invoke-NSAddLSNClientACLBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnclient_nsacl_binding resource.
    .DESCRIPTION
        Binding object showing the nsacl that can be bound to lsnclient.
    .PARAMETER AclName
        Name(s) of any configured extended ACL(s) whose action is ALLOW. The condition specified in the extended ACL rule identifies the traffic from an LSN subscriber for which the Citrix ADC is to perform large scale NAT. . Minimum length = 1
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
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
        Invoke-NSAddLSNClientACLBinding -ClientName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNClientACLBinding -ClientName 'example' -WhatIf
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
        [string] $AclName,

        [Parameter(Mandatory, Position = 0)]
        [string] $ClientName,

        [Parameter()]
        [int] $TrafficDomain,

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
    if ($PSBoundParameters.ContainsKey('AclName')) { $properties['aclname'] = $AclName }
    if ($PSBoundParameters.ContainsKey('ClientName')) { $properties['clientname'] = $ClientName }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ClientName", 'Create lsnclient_nsacl_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnclient_nsacl_binding -Payload @{ lsnclient_nsacl_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNClientACLBinding -ClientName $ClientName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNClientACLBinding

# region Invoke-NSAddLSNClientNetwork6Binding
function Invoke-NSAddLSNClientNetwork6Binding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnclient_network6_binding resource.
    .DESCRIPTION
        Binding object showing the network6 that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER NetMask
        Subnet mask for the IPv4 address specified in the Network parameter.
    .PARAMETER Network
        IPv4 address(es) of the LSN subscriber(s) or subscriber network(s) on whose traffic you want the Citrix ADC to perform Large Scale NAT. Minimum length = 1
    .PARAMETER Network6
        IPv6 address(es) of the LSN subscriber(s) or subscriber network(s) on whose traffic you want the Citrix ADC to perform Large Scale NAT. Minimum length = 1
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
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
        Invoke-NSAddLSNClientNetwork6Binding -ClientName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNClientNetwork6Binding -ClientName 'example' -WhatIf
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
        [string] $ClientName,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [string] $Network,

        [Parameter()]
        [string] $Network6,

        [Parameter()]
        [int] $TrafficDomain,

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
    if ($PSBoundParameters.ContainsKey('ClientName')) { $properties['clientname'] = $ClientName }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }
    if ($PSBoundParameters.ContainsKey('Network')) { $properties['network'] = $Network }
    if ($PSBoundParameters.ContainsKey('Network6')) { $properties['network6'] = $Network6 }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ClientName", 'Create lsnclient_network6_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnclient_network6_binding -Payload @{ lsnclient_network6_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNClientNetwork6Binding -ClientName $ClientName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNClientNetwork6Binding

# region Invoke-NSAddLSNClientNetworkBinding
function Invoke-NSAddLSNClientNetworkBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnclient_network_binding resource.
    .DESCRIPTION
        Binding object showing the network that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER NetMask
        Subnet mask for the IPv4 address specified in the Network parameter.
    .PARAMETER Network
        IPv4 address(es) of the LSN subscriber(s) or subscriber network(s) on whose traffic you want the Citrix ADC to perform Large Scale NAT. Minimum length = 1
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
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
        Invoke-NSAddLSNClientNetworkBinding -ClientName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNClientNetworkBinding -ClientName 'example' -WhatIf
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
        [string] $ClientName,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [string] $Network,

        [Parameter()]
        [int] $TrafficDomain,

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
    if ($PSBoundParameters.ContainsKey('ClientName')) { $properties['clientname'] = $ClientName }
    if ($PSBoundParameters.ContainsKey('NetMask')) { $properties['netmask'] = $NetMask }
    if ($PSBoundParameters.ContainsKey('Network')) { $properties['network'] = $Network }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$ClientName", 'Create lsnclient_network_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnclient_network_binding -Payload @{ lsnclient_network_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNClientNetworkBinding -ClientName $ClientName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNClientNetworkBinding

# region Invoke-NSAddLSNGroup
function Invoke-NSAddLSNGroup {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup resource.
    .DESCRIPTION
        Configuration for LSN group resource.
    .PARAMETER AllocPolicy
        NAT IP and PORT block allocation policy for Deterministic NAT. Supported Policies are, 1: PORTS: Port blocks from single NATIP will be allocated to LSN subscribers sequentially. After all blocks are exhausted, port blocks from next NATIP will be allocated and so on. 2: IPADDRS(Default): One port block from each NATIP will be allocated and once all the NATIPs are over second port block from each NATIP will be allocated and so on. To understand better if we assume port blocks of all NAT IPs as two dimensional array, PORTS policy follows "row major order" and IPADDRS policy follows "column major order" while allocating port blocks. Example: Client IPs: 2.2.2.1, 2.2.2.2 and 2.2.2.3 NAT IPs and PORT Blocks: 4.4.4.1:PB1, PB2, PB3,., PBn 4.4.4.2: PB1, PB2, PB3,., PBn PORTS Policy: 2.2.2.1 => 4.4.4.1:PB1 2.2.2.2 => 4.4.4.1:PB2 2.2.2.3 => 4.4.4.1:PB3 IPADDRS Policy: 2.2.2.1 => 4.4.4.1:PB1 2.2.2.2 => 4.4.4.2:PB1 2.2.2.3 => 4.4.4.1:PB2. Default value: PORTS Possible values = PORTS, IPADDRS
    .PARAMETER ClientName
        Name of the LSN client entity to be associated with the LSN group. You can associate only one LSN client entity with an LSN group.You cannot remove this association or replace with another LSN client entity once the LSN group is created.
    .PARAMETER Ftp
        Enable Application Layer Gateway (ALG) for the FTP protocol. For some application-layer protocols, the IP addresses and protocol port numbers are usually communicated in the packet's payload. When acting as an ALG, the Citrix ADC changes the packet's payload to ensure that the protocol continues to work over LSN. Note: The Citrix ADC also includes ALG for ICMP and TFTP protocols. ALG for the ICMP protocol is enabled by default, and there is no provision to disable it. ALG for the TFTP protocol is disabled by default. ALG is enabled automatically for an LSN group when you bind a UDP LSN application profile, with endpoint-independent-mapping, endpoint-independent filtering, and destination port as 69 (well-known port for TFTP), to the LSN group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ftpcm
        Enable the FTP connection mirroring for specified LSN group. Connection mirroring (CM or connection failover) refers to keeping active an established TCP or UDP connection when a failover occurs. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Ip6Profile
        Name of the LSN ip6 profile to associate with the specified LSN group. An ip6 profile can be associated with a group only during group creation. By default, no LSN ip6 profile is associated with an LSN group during its creation. Only one ip6profile can be associated with a group. Minimum length = 1 Maximum length = 127
    .PARAMETER Logging
        Log mapping entries and sessions created or deleted for this LSN group. The Citrix ADC logs LSN sessions for this LSN group only when both logging and session logging parameters are enabled. The ADC uses its existing syslog and audit log framework to log LSN information. You must enable global level LSN logging by enabling the LSN parameter in the related NSLOG action and SYLOG action entities. When the Logging parameter is enabled, the Citrix ADC generates log messages related to LSN mappings and LSN sessions of this LSN group. The ADC then sends these log messages to servers associated with the NSLOG action and SYSLOG actions entities. A log message for an LSN mapping entry consists of the following information: * NSIP address of the Citrix ADC * Time stamp * Entry type (MAPPING or SESSION) * Whether the LSN mapping entry is created or deleted * Subscriber's IP address, port, and traffic domain ID * NAT IP address and port * Protocol name * Destination IP address, port, and traffic domain ID might be present, depending on the following conditions: ** Destination IP address and port are not logged for Endpoint-Independent mapping ** Only Destination IP address (and not port) is logged for Address-Dependent mapping ** Destination IP address and port are logged for Address-Port-Dependent mapping. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER NatType
        Type of NAT IP address and port allocation (from the bound LSN pools) for subscribers: Available options function as follows: * Deterministic - Allocate a NAT IP address and a block of ports to each subscriber (of the LSN client bound to the LSN group). The Citrix ADC sequentially allocates NAT resources to these subscribers. The Citrix ADC ADC assigns the first block of ports (block size determined by the port block size parameter of the LSN group) on the beginning NAT IP address to the beginning subscriber IP address. The next range of ports is assigned to the next subscriber, and so on, until the NAT address does not have enough ports for the next subscriber. In this case, the first port block on the next NAT address is used for the subscriber, and so on. Because each subscriber now receives a deterministic NAT IP address and a block of ports, a subscriber can be identified without any need for logging. For a connection, a subscriber can be identified based only on the NAT IP address and port, and the destination IP address and port. The maximum number of LSN subscribers allowed, globally, is 1 million. * Dynamic - Allocate a random NAT IP address and a port from the LSN NAT pool for a subscriber's connection. If port block allocation is enabled (in LSN pool) and a port block size is specified (in the LSN group), the Citrix ADC allocates a random NAT IP address and a block of ports for a subscriber when it initiates a connection for the first time. The ADC allocates this NAT IP address and a port (from the allocated block of ports) for different connections from this subscriber. If all the ports are allocated (for different subscriber's connections) from the subscriber's allocated port block, the ADC allocates a new random port block for the subscriber. Default value: DYNAMIC Possible values = DYNAMIC, DETERMINISTIC
    .PARAMETER PortBlocksize
        Size of the NAT port block to be allocated for each subscriber. To set this parameter for Dynamic NAT, you must enable the port block allocation parameter in the bound LSN pool. For Deterministic NAT, the port block allocation parameter is always enabled, and you cannot disable it. In Dynamic NAT, the Citrix ADC allocates a random NAT port block, from the available NAT port pool of an NAT IP address, for each subscriber. For a subscriber, if all the ports are allocated from the subscriber's allocated port block, the ADC allocates a new random port block for the subscriber. The default port block size is 256 for Deterministic NAT, and 0 for Dynamic NAT. Default value: 0 Minimum value = 256 Maximum value = 65536
    .PARAMETER Pptp
        Enable the PPTP Application Layer Gateway. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Rtspalg
        Enable the RTSP ALG. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Sessionlogging
        Log sessions created or deleted for the LSN group. The Citrix ADC logs LSN sessions for this LSN group only when both logging and session logging parameters are enabled. A log message for an LSN session consists of the following information: * NSIP address of the Citrix ADC * Time stamp * Entry type (MAPPING or SESSION) * Whether the LSN session is created or removed * Subscriber's IP address, port, and traffic domain ID * NAT IP address and port * Protocol name * Destination IP address, port, and traffic domain ID. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Sessionsync
        In a high availability (HA) deployment, synchronize information of all LSN sessions related to this LSN group with the secondary node. After a failover, established TCP connections and UDP packet flows are kept active and resumed on the secondary node (new primary). For this setting to work, you must enable the global session synchronization parameter. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SIPAlg
        Enable the SIP ALG. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPTrapLimit
        Maximum number of SNMP Trap messages that can be generated for the LSN group in one minute. Default value: 100 Minimum value = 0 Maximum value = 10000
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
        Invoke-NSAddLSNGroup -GroupName 'example' -ClientName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroup -GroupName 'example' -ClientName 'example' -WhatIf
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
        [ValidateSet('PORTS', 'IPADDRS')]
        [string] $AllocPolicy,

        [Parameter(Mandatory)]
        [string] $ClientName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ftp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ftpcm,

        [Parameter(Mandatory, Position = 0)]
        [string] $GroupName,

        [Parameter()]
        [string] $Ip6Profile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logging,

        [Parameter()]
        [ValidateSet('DYNAMIC', 'DETERMINISTIC')]
        [string] $NatType,

        [Parameter()]
        [int] $PortBlocksize,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Pptp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Rtspalg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Sessionlogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Sessionsync,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SIPAlg,

        [Parameter()]
        [int] $SNMPTrapLimit,

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
    if ($PSBoundParameters.ContainsKey('AllocPolicy')) { $properties['allocpolicy'] = $AllocPolicy }
    if ($PSBoundParameters.ContainsKey('ClientName')) { $properties['clientname'] = $ClientName }
    if ($PSBoundParameters.ContainsKey('Ftp')) { $properties['ftp'] = $Ftp }
    if ($PSBoundParameters.ContainsKey('Ftpcm')) { $properties['ftpcm'] = $Ftpcm }
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Ip6Profile')) { $properties['ip6profile'] = $Ip6Profile }
    if ($PSBoundParameters.ContainsKey('Logging')) { $properties['logging'] = $Logging }
    if ($PSBoundParameters.ContainsKey('NatType')) { $properties['nattype'] = $NatType }
    if ($PSBoundParameters.ContainsKey('PortBlocksize')) { $properties['portblocksize'] = $PortBlocksize }
    if ($PSBoundParameters.ContainsKey('Pptp')) { $properties['pptp'] = $Pptp }
    if ($PSBoundParameters.ContainsKey('Rtspalg')) { $properties['rtspalg'] = $Rtspalg }
    if ($PSBoundParameters.ContainsKey('Sessionlogging')) { $properties['sessionlogging'] = $Sessionlogging }
    if ($PSBoundParameters.ContainsKey('Sessionsync')) { $properties['sessionsync'] = $Sessionsync }
    if ($PSBoundParameters.ContainsKey('SIPAlg')) { $properties['sipalg'] = $SIPAlg }
    if ($PSBoundParameters.ContainsKey('SNMPTrapLimit')) { $properties['snmptraplimit'] = $SNMPTrapLimit }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup -Payload @{ lsngroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroup -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroup

# region Invoke-NSAddLSNGroupIPsecALGProfileBinding
function Invoke-NSAddLSNGroupIPsecALGProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_ipsecalgprofile_binding resource.
    .DESCRIPTION
        Binding object showing the ipsecalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER IPsecALGProfile
        Name of the IPSec ALG profile to bind to the specified LSN group.
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
        Invoke-NSAddLSNGroupIPsecALGProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupIPsecALGProfileBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $IPsecALGProfile,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('IPsecALGProfile')) { $properties['ipsecalgprofile'] = $IPsecALGProfile }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_ipsecalgprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_ipsecalgprofile_binding -Payload @{ lsngroup_ipsecalgprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupIPsecALGProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupIPsecALGProfileBinding

# region Invoke-NSAddLSNGroupLSNAppsProfileBinding
function Invoke-NSAddLSNGroupLSNAppsProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_lsnappsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnappsprofile that can be bound to lsngroup.
    .PARAMETER AppsProfileName
        Name of the LSN application profile to bind to the specified LSN group. For each set of destination ports, bind a profile for each protocol for which you want to specify settings. By default, one LSN application profile with default settings for TCP, UDP, and ICMP protocols for all destination ports is bound to an LSN group during its creation. This profile is called a default application profile. When you bind an LSN application profile, with a specified set of destination ports, to an LSN group, the bound profile overrides the default LSN application profile for that protocol at that set of destination ports.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSAddLSNGroupLSNAppsProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupLSNAppsProfileBinding -GroupName 'example' -WhatIf
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
        [string] $AppsProfileName,

        [Parameter(Mandatory, Position = 0)]
        [string] $GroupName,

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
    if ($PSBoundParameters.ContainsKey('AppsProfileName')) { $properties['appsprofilename'] = $AppsProfileName }
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_lsnappsprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_lsnappsprofile_binding -Payload @{ lsngroup_lsnappsprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupLSNAppsProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupLSNAppsProfileBinding

# region Invoke-NSAddLSNGroupLSNHTTPHeaderLogProfileBinding
function Invoke-NSAddLSNGroupLSNHTTPHeaderLogProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_lsnhttphdrlogprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnhttphdrlogprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER HTTPHdrlogProfileName
        The name of the LSN HTTP header logging Profile.
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
        Invoke-NSAddLSNGroupLSNHTTPHeaderLogProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupLSNHTTPHeaderLogProfileBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $HTTPHdrlogProfileName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('HTTPHdrlogProfileName')) { $properties['httphdrlogprofilename'] = $HTTPHdrlogProfileName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_lsnhttphdrlogprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_lsnhttphdrlogprofile_binding -Payload @{ lsngroup_lsnhttphdrlogprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupLSNHTTPHeaderLogProfileBinding

# region Invoke-NSAddLSNGroupLSNLogProfileBinding
function Invoke-NSAddLSNGroupLSNLogProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_lsnlogprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnlogprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER LogProfileName
        The name of the LSN logging Profile.
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
        Invoke-NSAddLSNGroupLSNLogProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupLSNLogProfileBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $LogProfileName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('LogProfileName')) { $properties['logprofilename'] = $LogProfileName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_lsnlogprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_lsnlogprofile_binding -Payload @{ lsngroup_lsnlogprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupLSNLogProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupLSNLogProfileBinding

# region Invoke-NSAddLSNGroupLSNPoolBinding
function Invoke-NSAddLSNGroupLSNPoolBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_lsnpool_binding resource.
    .DESCRIPTION
        Binding object showing the lsnpool that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER PoolName
        Name of the LSN pool to bind to the specified LSN group. Only LSN Pools and LSN groups with the same NAT type settings can be bound together. Multiples LSN pools can be bound to an LSN group. For Deterministic NAT, pools bound to an LSN group cannot be bound to other LSN groups. For Dynamic NAT, pools bound to an LSN group can be bound to multiple LSN groups.
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
        Invoke-NSAddLSNGroupLSNPoolBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupLSNPoolBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $PoolName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('PoolName')) { $properties['poolname'] = $PoolName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_lsnpool_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_lsnpool_binding -Payload @{ lsngroup_lsnpool_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupLSNPoolBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupLSNPoolBinding

# region Invoke-NSAddLSNGroupLSNRTSPALGProfileBinding
function Invoke-NSAddLSNGroupLSNRTSPALGProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_lsnrtspalgprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnrtspalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER RtspalgProfileName
        The name of the LSN RTSP ALG Profile.
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
        Invoke-NSAddLSNGroupLSNRTSPALGProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupLSNRTSPALGProfileBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $RtspalgProfileName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('RtspalgProfileName')) { $properties['rtspalgprofilename'] = $RtspalgProfileName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_lsnrtspalgprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_lsnrtspalgprofile_binding -Payload @{ lsngroup_lsnrtspalgprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupLSNRTSPALGProfileBinding

# region Invoke-NSAddLSNGroupLSNSIPALGProfileBinding
function Invoke-NSAddLSNGroupLSNSIPALGProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_lsnsipalgprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnsipalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER SIPAlgProfileName
        The name of the LSN SIP ALG Profile.
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
        Invoke-NSAddLSNGroupLSNSIPALGProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupLSNSIPALGProfileBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $SIPAlgProfileName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('SIPAlgProfileName')) { $properties['sipalgprofilename'] = $SIPAlgProfileName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_lsnsipalgprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_lsnsipalgprofile_binding -Payload @{ lsngroup_lsnsipalgprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupLSNSIPALGProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupLSNSIPALGProfileBinding

# region Invoke-NSAddLSNGroupLSNTransportProfileBinding
function Invoke-NSAddLSNGroupLSNTransportProfileBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_lsntransportprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsntransportprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER TransPortProfileName
        Name of the LSN transport profile to bind to the specified LSN group. Bind a profile for each protocol for which you want to specify settings. By default, one LSN transport profile with default settings for TCP, UDP, and ICMP protocols is bound to an LSN group during its creation. This profile is called a default transport. An LSN transport profile that you bind to an LSN group overrides the default LSN transport profile for that protocol.
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
        Invoke-NSAddLSNGroupLSNTransportProfileBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupLSNTransportProfileBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $TransPortProfileName,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('TransPortProfileName')) { $properties['transportprofilename'] = $TransPortProfileName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_lsntransportprofile_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_lsntransportprofile_binding -Payload @{ lsngroup_lsntransportprofile_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupLSNTransportProfileBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupLSNTransportProfileBinding

# region Invoke-NSAddLSNGroupPCPServerBinding
function Invoke-NSAddLSNGroupPCPServerBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsngroup_pcpserver_binding resource.
    .DESCRIPTION
        Binding object showing the pcpserver that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER PCPServer
        Name of the PCP server to be associated with lsn group.
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
        Invoke-NSAddLSNGroupPCPServerBinding -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNGroupPCPServerBinding -GroupName 'example' -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [string] $PCPServer,

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
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('PCPServer')) { $properties['pcpserver'] = $PCPServer }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Create lsngroup_pcpserver_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup_pcpserver_binding -Payload @{ lsngroup_pcpserver_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroupPCPServerBinding -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNGroupPCPServerBinding

# region Invoke-NSAddLSNHTTPHeaderLogProfile
function Invoke-NSAddLSNHTTPHeaderLogProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnhttphdrlogprofile resource.
    .DESCRIPTION
        Configuration for LSN HTTP header logging Profile resource.
    .PARAMETER HTTPHdrlogProfileName
        The name of the HTTP header logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER LogHost
        Host information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogMethod
        HTTP method information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogURL
        URL information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logversion
        Version information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSAddLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'example' -WhatIf
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
        [string] $HTTPHdrlogProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LogHost,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LogMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LogURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logversion,

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
    if ($PSBoundParameters.ContainsKey('HTTPHdrlogProfileName')) { $properties['httphdrlogprofilename'] = $HTTPHdrlogProfileName }
    if ($PSBoundParameters.ContainsKey('LogHost')) { $properties['loghost'] = $LogHost }
    if ($PSBoundParameters.ContainsKey('LogMethod')) { $properties['logmethod'] = $LogMethod }
    if ($PSBoundParameters.ContainsKey('LogURL')) { $properties['logurl'] = $LogURL }
    if ($PSBoundParameters.ContainsKey('Logversion')) { $properties['logversion'] = $Logversion }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$HTTPHdrlogProfileName", 'Create lsnhttphdrlogprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnhttphdrlogprofile -Payload @{ lsnhttphdrlogprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName $HTTPHdrlogProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNHTTPHeaderLogProfile

# region Invoke-NSAddLSNIP6Profile
function Invoke-NSAddLSNIP6Profile {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnip6profile resource.
    .DESCRIPTION
        Configuration for LSN ip6 Profile resource.
    .PARAMETER Name
        Name for the LSN ip6 profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN ip6 profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn ip6 profile1" or 'lsn ip6 profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Natprefix
        IPv6 address(es) of the LSN subscriber(s) or subscriber network(s) on whose traffic you want the Citrix ADC to perform Large Scale NAT.
    .PARAMETER Network6
        IPv6 address of the Citrix ADC AFTR device.
    .PARAMETER Type
        IPv6 translation type for which to set the LSN IP6 profile parameters. Possible values = DS-Lite, NAT64
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
        Invoke-NSAddLSNIP6Profile -Name 'example' -Type DS-Lite -PassThru
    .EXAMPLE
        Invoke-NSAddLSNIP6Profile -Name 'example' -Type DS-Lite -WhatIf
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

        [Parameter()]
        [string] $Natprefix,

        [Parameter()]
        [string] $Network6,

        [Parameter(Mandatory)]
        [ValidateSet('DS-Lite', 'NAT64')]
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
    if ($PSBoundParameters.ContainsKey('Natprefix')) { $properties['natprefix'] = $Natprefix }
    if ($PSBoundParameters.ContainsKey('Network6')) { $properties['network6'] = $Network6 }
    if ($PSBoundParameters.ContainsKey('Type')) { $properties['type'] = $Type }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create lsnip6profile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnip6profile -Payload @{ lsnip6profile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNIP6Profile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNIP6Profile

# region Invoke-NSAddLSNLogProfile
function Invoke-NSAddLSNLogProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnlogprofile resource.
    .DESCRIPTION
        Configuration for LSN logging Profile resource.
    .PARAMETER AnalyticsProfile
        Name of the Analytics Profile attached to this lsn profile.
    .PARAMETER Logcompact
        Logs in Compact Logging format if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logipfix
        Logs in IPFIX format if option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogProfileName
        The name of the logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER Logsessdeletion
        LSN Session deletion will not be logged if disabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logsubscrinfo
        Subscriber ID information is logged if option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSAddLSNLogProfile -LogProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNLogProfile -LogProfileName 'example' -WhatIf
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
        [string] $AnalyticsProfile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logcompact,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logipfix,

        [Parameter(Mandatory, Position = 0)]
        [string] $LogProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logsessdeletion,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logsubscrinfo,

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
    if ($PSBoundParameters.ContainsKey('Logcompact')) { $properties['logcompact'] = $Logcompact }
    if ($PSBoundParameters.ContainsKey('Logipfix')) { $properties['logipfix'] = $Logipfix }
    if ($PSBoundParameters.ContainsKey('LogProfileName')) { $properties['logprofilename'] = $LogProfileName }
    if ($PSBoundParameters.ContainsKey('Logsessdeletion')) { $properties['logsessdeletion'] = $Logsessdeletion }
    if ($PSBoundParameters.ContainsKey('Logsubscrinfo')) { $properties['logsubscrinfo'] = $Logsubscrinfo }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LogProfileName", 'Create lsnlogprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnlogprofile -Payload @{ lsnlogprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNLogProfile -LogProfileName $LogProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNLogProfile

# region Invoke-NSAddLSNPool
function Invoke-NSAddLSNPool {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnpool resource.
    .DESCRIPTION
        Configuration for LSN pool resource.
    .PARAMETER MaxPortRealloctmq
        Maximum number of ports for which the port reallocation timeout applies for each NAT IP address. In other words, the maximum deallocated-port queue size for which the reallocation timeout applies for each NAT IP address. When the queue size is full, the next port deallocated is reallocated immediately for a new LSN session. Default value: 65536 Minimum value = 0 Maximum value = 65536
    .PARAMETER NatType
        Type of NAT IP address and port allocation (from the LSN pools bound to an LSN group) for subscribers (of the LSN client entity bound to the LSN group): Available options function as follows: * Deterministic - Allocate a NAT IP address and a block of ports to each subscriber (of the LSN client bound to the LSN group). The Citrix ADC sequentially allocates NAT resources to these subscribers. The Citrix ADC ADC assigns the first block of ports (block size determined by the port block size parameter of the LSN group) on the beginning NAT IP address to the beginning subscriber IP address. The next range of ports is assigned to the next subscriber, and so on, until the NAT address does not have enough ports for the next subscriber. In this case, the first port block on the next NAT address is used for the subscriber, and so on. Because each subscriber now receives a deterministic NAT IP address and a block of ports, a subscriber can be identified without any need for logging. For a connection, a subscriber can be identified based only on the NAT IP address and port, and the destination IP address and port. * Dynamic - Allocate a random NAT IP address and a port from the LSN NAT pool for a subscriber's connection. If port block allocation is enabled (in LSN pool) and a port block size is specified (in the LSN group), the Citrix ADC allocates a random NAT IP address and a block of ports for a subscriber when it initiates a connection for the first time. The ADC allocates this NAT IP address and a port (from the allocated block of ports) for different connections from this subscriber. If all the ports are allocated (for different subscriber's connections) from the subscriber's allocated port block, the ADC allocates a new random port block for the subscriber. Only LSN Pools and LSN groups with the same NAT type settings can be bound together. Multiples LSN pools can be bound to an LSN group. A maximum of 16 LSN pools can be bound to an LSN group. . Default value: DYNAMIC Possible values = DYNAMIC, DETERMINISTIC
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
    .PARAMETER PortBlockallocation
        Allocate a random NAT port block, from the available NAT port pool of an NAT IP address, for each subscriber when the NAT allocation is set as Dynamic NAT. For any connection initiated from a subscriber, the Citrix ADC allocates a NAT port from the subscriber's allocated NAT port block to create the LSN session. You must set the port block size in the bound LSN group. For a subscriber, if all the ports are allocated from the subscriber's allocated port block, the Citrix ADC allocates a new random port block for the subscriber. For Deterministic NAT, this parameter is enabled by default, and you cannot disable it. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortReallocTimeout
        The waiting time, in seconds, between deallocating LSN NAT ports (when an LSN mapping is removed) and reallocating them for a new LSN session. This parameter is necessary in order to prevent collisions between old and new mappings and sessions. It ensures that all established sessions are broken instead of redirected to a different subscriber. This is not applicable for ports used in: * Deterministic NAT * Address-Dependent filtering and Address-Port-Dependent filtering * Dynamic NAT with port block allocation In these cases, ports are immediately reallocated. Default value: 0 Minimum value = 0 Maximum value = 600
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
        Invoke-NSAddLSNPool -PoolName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNPool -PoolName 'example' -WhatIf
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
        [int] $MaxPortRealloctmq,

        [Parameter()]
        [ValidateSet('DYNAMIC', 'DETERMINISTIC')]
        [string] $NatType,

        [Parameter(Mandatory, Position = 0)]
        [string] $PoolName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PortBlockallocation,

        [Parameter()]
        [int] $PortReallocTimeout,

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
    if ($PSBoundParameters.ContainsKey('MaxPortRealloctmq')) { $properties['maxportrealloctmq'] = $MaxPortRealloctmq }
    if ($PSBoundParameters.ContainsKey('NatType')) { $properties['nattype'] = $NatType }
    if ($PSBoundParameters.ContainsKey('PoolName')) { $properties['poolname'] = $PoolName }
    if ($PSBoundParameters.ContainsKey('PortBlockallocation')) { $properties['portblockallocation'] = $PortBlockallocation }
    if ($PSBoundParameters.ContainsKey('PortReallocTimeout')) { $properties['portrealloctimeout'] = $PortReallocTimeout }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$PoolName", 'Create lsnpool')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnpool -Payload @{ lsnpool = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNPool -PoolName $PoolName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNPool

# region Invoke-NSAddLSNPoolLsnipBinding
function Invoke-NSAddLSNPoolLsnipBinding {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnpool_lsnip_binding resource.
    .DESCRIPTION
        Binding object showing the lsnip that can be bound to lsnpool.
    .PARAMETER Lsnip
        IPv4 address or a range of IPv4 addresses to be used as NAT IP address(es) for LSN. After the pool is created, these IPv4 addresses are added to the Citrix ADC as Citrix ADC owned IP address of type LSN. A maximum of 4096 IP addresses can be bound to an LSN pool. An LSN IP address associated with an LSN pool cannot be shared with other LSN pools. IP addresses specified for this parameter must not already exist on the Citrix ADC as any Citrix ADC owned IP addresses. In the command line interface, separate the range with a hyphen. For example: 10.102.29.30-10.102.29.189. You can later remove some or all the LSN IP addresses from the pool, and add IP addresses to the LSN pool. By default , arp is enabled on LSN IP address but, you can disable it using command - "set ns ip" . Minimum length = 1
    .PARAMETER Ownernode
        ID(s) of cluster node(s) on which command is to be executed. Minimum value = 0 Maximum value = 31
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSAddLSNPoolLsnipBinding -PoolName 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNPoolLsnipBinding -PoolName 'example' -WhatIf
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
        [string] $Lsnip,

        [Parameter()]
        [int] $Ownernode,

        [Parameter(Mandatory, Position = 0)]
        [string] $PoolName,

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
    if ($PSBoundParameters.ContainsKey('Lsnip')) { $properties['lsnip'] = $Lsnip }
    if ($PSBoundParameters.ContainsKey('Ownernode')) { $properties['ownernode'] = $Ownernode }
    if ($PSBoundParameters.ContainsKey('PoolName')) { $properties['poolname'] = $PoolName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$PoolName", 'Create lsnpool_lsnip_binding')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnpool_lsnip_binding -Payload @{ lsnpool_lsnip_binding = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNPoolLsnipBinding -PoolName $PoolName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNPoolLsnipBinding

# region Invoke-NSAddLSNRTSPALGProfile
function Invoke-NSAddLSNRTSPALGProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnrtspalgprofile resource.
    .DESCRIPTION
        Configuration for LSN RTSPALG Profile resource.
    .PARAMETER RtspalgProfileName
        The name of the RTSPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER RtspidleTimeout
        Idle timeout for the rtsp sessions in seconds. Default value: 120
    .PARAMETER RtspPortRange
        port for the RTSP.
    .PARAMETER RtsptransPortProtocol
        RTSP ALG Profile transport protocol type. Default value: TCP Possible values = TCP, UDP
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
        Invoke-NSAddLSNRTSPALGProfile -RtspalgProfileName 'example' -RtspPortRange 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddLSNRTSPALGProfile -RtspalgProfileName 'example' -RtspPortRange 'example' -WhatIf
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
        [string] $RtspalgProfileName,

        [Parameter()]
        [int] $RtspidleTimeout,

        [Parameter(Mandatory)]
        [string] $RtspPortRange,

        [Parameter()]
        [ValidateSet('TCP', 'UDP')]
        [string] $RtsptransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('RtspalgProfileName')) { $properties['rtspalgprofilename'] = $RtspalgProfileName }
    if ($PSBoundParameters.ContainsKey('RtspidleTimeout')) { $properties['rtspidletimeout'] = $RtspidleTimeout }
    if ($PSBoundParameters.ContainsKey('RtspPortRange')) { $properties['rtspportrange'] = $RtspPortRange }
    if ($PSBoundParameters.ContainsKey('RtsptransPortProtocol')) { $properties['rtsptransportprotocol'] = $RtsptransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$RtspalgProfileName", 'Create lsnrtspalgprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnrtspalgprofile -Payload @{ lsnrtspalgprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNRTSPALGProfile -RtspalgProfileName $RtspalgProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNRTSPALGProfile

# region Invoke-NSAddLSNSIPALGProfile
function Invoke-NSAddLSNSIPALGProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnsipalgprofile resource.
    .DESCRIPTION
        Configuration for LSN SIPALG Profile resource.
    .PARAMETER DataSessionidleTimeout
        Idle timeout for the data channel sessions in seconds. Default value: 120
    .PARAMETER Opencontactpinhole
        ENABLE/DISABLE ContactPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER OpenRecordRoutepinhole
        ENABLE/DISABLE RecordRoutePinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Openregisterpinhole
        ENABLE/DISABLE RegisterPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Openroutepinhole
        ENABLE/DISABLE RoutePinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER OpenviAPINhole
        ENABLE/DISABLE ViaPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER RegistrationTimeout
        SIP registration timeout in seconds. Default value: 60
    .PARAMETER RPort
        ENABLE/DISABLE rport. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SIPAlgProfileName
        The name of the SIPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER SIPDstPortRange
        Destination port range for SIP_UDP and SIP_TCP.
    .PARAMETER SIPSessionTimeout
        SIP control channel session timeout in seconds. Default value: 600
    .PARAMETER SIPSrcPortRange
        Source port range for SIP_UDP and SIP_TCP.
    .PARAMETER SIPTransPortProtocol
        SIP ALG Profile transport protocol type. Possible values = TCP, UDP
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
        Invoke-NSAddLSNSIPALGProfile -SIPAlgProfileName 'example' -SIPTransPortProtocol TCP -PassThru
    .EXAMPLE
        Invoke-NSAddLSNSIPALGProfile -SIPAlgProfileName 'example' -SIPTransPortProtocol TCP -WhatIf
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
        [int] $DataSessionidleTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Opencontactpinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $OpenRecordRoutepinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Openregisterpinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Openroutepinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $OpenviAPINhole,

        [Parameter()]
        [int] $RegistrationTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $RPort,

        [Parameter(Mandatory, Position = 0)]
        [string] $SIPAlgProfileName,

        [Parameter()]
        [string] $SIPDstPortRange,

        [Parameter()]
        [int] $SIPSessionTimeout,

        [Parameter()]
        [string] $SIPSrcPortRange,

        [Parameter(Mandatory)]
        [ValidateSet('TCP', 'UDP')]
        [string] $SIPTransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('DataSessionidleTimeout')) { $properties['datasessionidletimeout'] = $DataSessionidleTimeout }
    if ($PSBoundParameters.ContainsKey('Opencontactpinhole')) { $properties['opencontactpinhole'] = $Opencontactpinhole }
    if ($PSBoundParameters.ContainsKey('OpenRecordRoutepinhole')) { $properties['openrecordroutepinhole'] = $OpenRecordRoutepinhole }
    if ($PSBoundParameters.ContainsKey('Openregisterpinhole')) { $properties['openregisterpinhole'] = $Openregisterpinhole }
    if ($PSBoundParameters.ContainsKey('Openroutepinhole')) { $properties['openroutepinhole'] = $Openroutepinhole }
    if ($PSBoundParameters.ContainsKey('OpenviAPINhole')) { $properties['openviapinhole'] = $OpenviAPINhole }
    if ($PSBoundParameters.ContainsKey('RegistrationTimeout')) { $properties['registrationtimeout'] = $RegistrationTimeout }
    if ($PSBoundParameters.ContainsKey('RPort')) { $properties['rport'] = $RPort }
    if ($PSBoundParameters.ContainsKey('SIPAlgProfileName')) { $properties['sipalgprofilename'] = $SIPAlgProfileName }
    if ($PSBoundParameters.ContainsKey('SIPDstPortRange')) { $properties['sipdstportrange'] = $SIPDstPortRange }
    if ($PSBoundParameters.ContainsKey('SIPSessionTimeout')) { $properties['sipsessiontimeout'] = $SIPSessionTimeout }
    if ($PSBoundParameters.ContainsKey('SIPSrcPortRange')) { $properties['sipsrcportrange'] = $SIPSrcPortRange }
    if ($PSBoundParameters.ContainsKey('SIPTransPortProtocol')) { $properties['siptransportprotocol'] = $SIPTransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$SIPAlgProfileName", 'Create lsnsipalgprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnsipalgprofile -Payload @{ lsnsipalgprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNSIPALGProfile -SIPAlgProfileName $SIPAlgProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNSIPALGProfile

# region Invoke-NSAddLSNStatic
function Invoke-NSAddLSNStatic {
    <#
    .SYNOPSIS
        Creates a NetScaler lsnstatic resource.
    .DESCRIPTION
        Configuration for static mapping resource.
    .PARAMETER Destip
        Destination IP address for the LSN mapping entry.
    .PARAMETER Dsttd
        ID of the traffic domain through which the destination IP address for this LSN mapping entry is reachable from the Citrix ADC. If you do not specify an ID, the destination IP address is assumed to be reachable through the default traffic domain, which has an ID of 0. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Name
        Name for the LSN static mapping entry. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn static1" or 'lsn static1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Natip
        IPv4 address, already existing on the Citrix ADC as type LSN, to be used as NAT IP address for this mapping entry.
    .PARAMETER NatPort
        NAT port for this LSN mapping entry. * represents all ports being used. Used in case of static wildcard. Minimum value = 0 Maximum value = 65535 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER Network6
        B4 address in DS-Lite setup. Minimum length = 1
    .PARAMETER Subscrip
        IPv4(NAT44 & DS-Lite)/IPv6(NAT64) address of an LSN subscriber for the LSN static mapping entry.
    .PARAMETER SubscrPort
        Port of the LSN subscriber for the LSN mapping entry. * represents all ports being used. Used in case of static wildcard. Minimum value = 0 Maximum value = 65535 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER TrafficDomain
        ID of the traffic domain to which the subscriber belongs. If you do not specify an ID, the subscriber is assumed to be a part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER TransPortProtocol
        Protocol for the LSN mapping entry. Possible values = TCP, UDP, ICMP, ALL
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
        Invoke-NSAddLSNStatic -Name 'example' -Subscrip 'example' -SubscrPort 1 -TransPortProtocol TCP -PassThru
    .EXAMPLE
        Invoke-NSAddLSNStatic -Name 'example' -Subscrip 'example' -SubscrPort 1 -TransPortProtocol TCP -WhatIf
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
        [string] $Destip,

        [Parameter()]
        [int] $Dsttd,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Natip,

        [Parameter()]
        [int] $NatPort,

        [Parameter()]
        [string] $Network6,

        [Parameter(Mandatory)]
        [string] $Subscrip,

        [Parameter(Mandatory)]
        [int] $SubscrPort,

        [Parameter()]
        [int] $TrafficDomain,

        [Parameter(Mandatory)]
        [ValidateSet('TCP', 'UDP', 'ICMP', 'ALL')]
        [string] $TransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('Destip')) { $properties['destip'] = $Destip }
    if ($PSBoundParameters.ContainsKey('Dsttd')) { $properties['dsttd'] = $Dsttd }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Natip')) { $properties['natip'] = $Natip }
    if ($PSBoundParameters.ContainsKey('NatPort')) { $properties['natport'] = $NatPort }
    if ($PSBoundParameters.ContainsKey('Network6')) { $properties['network6'] = $Network6 }
    if ($PSBoundParameters.ContainsKey('Subscrip')) { $properties['subscrip'] = $Subscrip }
    if ($PSBoundParameters.ContainsKey('SubscrPort')) { $properties['subscrport'] = $SubscrPort }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }
    if ($PSBoundParameters.ContainsKey('TransPortProtocol')) { $properties['transportprotocol'] = $TransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create lsnstatic')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnstatic -Payload @{ lsnstatic = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNStatic -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNStatic

# region Invoke-NSAddLSNTransportProfile
function Invoke-NSAddLSNTransportProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler lsntransportprofile resource.
    .DESCRIPTION
        Configuration for LSN Transport Profile resource.
    .PARAMETER FinrstTimeout
        Timeout, in seconds, for a TCP LSN session after a FIN or RST message is received from one of the endpoints. If a TCP LSN session is idle (after the Citrix ADC receives a FIN or RST message) for a time that exceeds this value, the Citrix ADC ADC removes the session. Since the LSN feature of the Citrix ADC does not maintain state information of any TCP LSN sessions, this timeout accommodates the transmission of the FIN or RST, and ACK messages from the other endpoint so that both endpoints can properly close the connection. Default value: 30
    .PARAMETER GroupSessionlimit
        Maximum number of concurrent LSN sessions(for the specified protocol) allowed for all subscriber of a group to which this profile has bound. This limit will get split across the Citrix ADCs packet engines and rounded down. When the number of LSN sessions reaches the limit for a group in packet engine, the Citrix ADC does not allow the subscriber of that group to open additional sessions through that packet engine. Default value: 0
    .PARAMETER PortPreserveparity
        Enable port parity between a subscriber port and its mapped LSN NAT port. For example, if a subscriber initiates a connection from an odd numbered port, the Citrix ADC allocates an odd numbered LSN NAT port for this connection. You must set this parameter for proper functioning of protocols that require the source port to be even or odd numbered, for example, in peer-to-peer applications that use RTP or RTCP protocol. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortPreServerAnge
        If a subscriber initiates a connection from a well-known port (0-1023), allocate a NAT port from the well-known port range (0-1023) for this connection. For example, if a subscriber initiates a connection from port 80, the Citrix ADC can allocate port 100 as the NAT port for this connection. This parameter applies to dynamic NAT without port block allocation. It also applies to Deterministic NAT if the range of ports allocated includes well-known ports. When all the well-known ports of all the available NAT IP addresses are used in different subscriber's connections (LSN sessions), and a subscriber initiates a connection from a well-known port, the Citrix ADC drops this connection. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortQuota
        Maximum number of LSN NAT ports to be used at a time by each subscriber for the specified protocol. For example, each subscriber can be limited to a maximum of 500 TCP NAT ports. When the LSN NAT mappings for a subscriber reach the limit, the Citrix ADC does not allocate additional NAT ports for that subscriber. Default value: 0 Minimum value = 0 Maximum value = 65535
    .PARAMETER Sessionquota
        Maximum number of concurrent LSN sessions allowed for each subscriber for the specified protocol. When the number of LSN sessions reaches the limit for a subscriber, the Citrix ADC does not allow the subscriber to open additional sessions. Default value: 0 Minimum value = 0 Maximum value = 65535
    .PARAMETER SessionTimeout
        Timeout, in seconds, for an idle LSN session. If an LSN session is idle for a time that exceeds this value, the Citrix ADC removes the session. This timeout does not apply for a TCP LSN session when a FIN or RST message is received from either of the endpoints. . Default value: 120 Minimum value = 60
    .PARAMETER StunTimeout
        STUN protocol timeout. Default value: 600 Minimum value = 120 Maximum value = 1200
    .PARAMETER Syncheck
        Silently drop any non-SYN packets for connections for which there is no LSN-NAT session present on the Citrix ADC. If you disable this parameter, the Citrix ADC accepts any non-SYN packets and creates a new LSN session entry for this connection. Following are some reasons for the Citrix ADC to receive such packets: * LSN session for a connection existed but the Citrix ADC removed this session because the LSN session was idle for a time that exceeded the configured session timeout. * Such packets can be a part of a DoS attack. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SynidleTimeout
        SYN Idle timeout. Default value: 60 Minimum value = 30 Maximum value = 120
    .PARAMETER TransPortProfileName
        Name for the LSN transport profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN transport profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn transport profile1" or 'lsn transport profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER TransPortProtocol
        Protocol for which to set the LSN transport profile parameters. Possible values = TCP, UDP, ICMP
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
        Invoke-NSAddLSNTransportProfile -TransPortProfileName 'example' -TransPortProtocol TCP -PassThru
    .EXAMPLE
        Invoke-NSAddLSNTransportProfile -TransPortProfileName 'example' -TransPortProtocol TCP -WhatIf
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
        [int] $FinrstTimeout,

        [Parameter()]
        [int] $GroupSessionlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PortPreserveparity,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PortPreServerAnge,

        [Parameter()]
        [int] $PortQuota,

        [Parameter()]
        [int] $Sessionquota,

        [Parameter()]
        [int] $SessionTimeout,

        [Parameter()]
        [int] $StunTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Syncheck,

        [Parameter()]
        [int] $SynidleTimeout,

        [Parameter(Mandatory, Position = 0)]
        [string] $TransPortProfileName,

        [Parameter(Mandatory)]
        [ValidateSet('TCP', 'UDP', 'ICMP')]
        [string] $TransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('FinrstTimeout')) { $properties['finrsttimeout'] = $FinrstTimeout }
    if ($PSBoundParameters.ContainsKey('GroupSessionlimit')) { $properties['groupsessionlimit'] = $GroupSessionlimit }
    if ($PSBoundParameters.ContainsKey('PortPreserveparity')) { $properties['portpreserveparity'] = $PortPreserveparity }
    if ($PSBoundParameters.ContainsKey('PortPreServerAnge')) { $properties['portpreserverange'] = $PortPreServerAnge }
    if ($PSBoundParameters.ContainsKey('PortQuota')) { $properties['portquota'] = $PortQuota }
    if ($PSBoundParameters.ContainsKey('Sessionquota')) { $properties['sessionquota'] = $Sessionquota }
    if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $properties['sessiontimeout'] = $SessionTimeout }
    if ($PSBoundParameters.ContainsKey('StunTimeout')) { $properties['stuntimeout'] = $StunTimeout }
    if ($PSBoundParameters.ContainsKey('Syncheck')) { $properties['syncheck'] = $Syncheck }
    if ($PSBoundParameters.ContainsKey('SynidleTimeout')) { $properties['synidletimeout'] = $SynidleTimeout }
    if ($PSBoundParameters.ContainsKey('TransPortProfileName')) { $properties['transportprofilename'] = $TransPortProfileName }
    if ($PSBoundParameters.ContainsKey('TransPortProtocol')) { $properties['transportprotocol'] = $TransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$TransPortProfileName", 'Create lsntransportprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsntransportprofile -Payload @{ lsntransportprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNTransportProfile -TransPortProfileName $TransPortProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddLSNTransportProfile

# region Invoke-NSDeleteLSNAppsAttributes
function Invoke-NSDeleteLSNAppsAttributes {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnappsattributes resource.
    .DESCRIPTION
        Configuration for LSN Application Attributes resource.
    .PARAMETER Name
        Name for the LSN Application Port ATTRIBUTES. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNAppsAttributes -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNAppsAttributes -Name 'lsnappsattributes_example' | Invoke-NSDeleteLSNAppsAttributes -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete lsnappsattributes')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnappsattributes -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNAppsAttributes

# region Invoke-NSDeleteLSNAppsProfile
function Invoke-NSDeleteLSNAppsProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnappsprofile resource.
    .DESCRIPTION
        Configuration for LSN Application Profile resource.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNAppsProfile -AppsProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNAppsProfile -AppsProfileName 'lsnappsprofile_example' | Invoke-NSDeleteLSNAppsProfile -Confirm:$false
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
        [string] $AppsProfileName,

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

        if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Delete lsnappsprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnappsprofile -Resource $AppsProfileName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNAppsProfile

# region Invoke-NSDeleteLSNAppsProfileLSNAppsAttributesBinding
function Invoke-NSDeleteLSNAppsProfileLSNAppsAttributesBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnappsprofile_lsnappsattributes_binding resource.
    .DESCRIPTION
        Binding object showing the lsnappsattributes that can be bound to lsnappsprofile.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER AppsattributesName
        Name of the LSN application port ATTRIBUTES command to bind to the specified LSN Appsprofile. Properties of the Appsprofile will be applicable to this APPSATTRIBUTES.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNAppsProfileLSNAppsAttributesBinding -AppsProfileName 'example' -AppsattributesName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding -AppsProfileName 'lsnappsprofile_lsnappsattributes_binding_example' | Invoke-NSDeleteLSNAppsProfileLSNAppsAttributesBinding -Confirm:$false
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
        [string] $AppsProfileName,

        [Parameter()]
        [string] $AppsattributesName,

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
        if ($PSBoundParameters.ContainsKey('AppsattributesName')) {
            $argumentParts += 'appsattributesname:' + $AppsattributesName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Delete lsnappsprofile_lsnappsattributes_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnappsprofile_lsnappsattributes_binding -Resource $AppsProfileName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNAppsProfileLSNAppsAttributesBinding

# region Invoke-NSDeleteLSNAppsProfilePortBinding
function Invoke-NSDeleteLSNAppsProfilePortBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnappsprofile_port_binding resource.
    .DESCRIPTION
        Binding object showing the port that can be bound to lsnappsprofile.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER LsnPort
        Port numbers or range of port numbers to match against the destination port of the incoming packet from a subscriber. When the destination port is matched, the LSN application profile is applied for the LSN session. Separate a range of ports with a hyphen. For example, 40-90. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNAppsProfilePortBinding -AppsProfileName 'example' -LsnPort 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNAppsProfilePortBinding -AppsProfileName 'lsnappsprofile_port_binding_example' | Invoke-NSDeleteLSNAppsProfilePortBinding -Confirm:$false
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
        [string] $AppsProfileName,

        [Parameter()]
        [string] $LsnPort,

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
        if ($PSBoundParameters.ContainsKey('LsnPort')) {
            $argumentParts += 'lsnport:' + $LsnPort
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Delete lsnappsprofile_port_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnappsprofile_port_binding -Resource $AppsProfileName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNAppsProfilePortBinding

# region Invoke-NSDeleteLSNClient
function Invoke-NSDeleteLSNClient {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnclient resource.
    .DESCRIPTION
        Configuration for lsn client resource.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNClient -ClientName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNClient -ClientName 'lsnclient_example' | Invoke-NSDeleteLSNClient -Confirm:$false
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
        [string] $ClientName,

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

        if ($PSCmdlet.ShouldProcess("$ClientName", 'Delete lsnclient')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnclient -Resource $ClientName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNClient

# region Invoke-NSDeleteLSNClientACL6Binding
function Invoke-NSDeleteLSNClientACL6Binding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnclient_nsacl6_binding resource.
    .DESCRIPTION
        Binding object showing the nsacl6 that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER Acl6Name
        Name of any configured extended ACL6 whose action is ALLOW. The condition specified in the extended ACL6 rule is used as the condition for the LSN client. Minimum length = 1
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNClientACL6Binding -ClientName 'example' -Acl6Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNClientACL6Binding -ClientName 'lsnclient_nsacl6_binding_example' | Invoke-NSDeleteLSNClientACL6Binding -Confirm:$false
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
        [string] $ClientName,

        [Parameter()]
        [string] $Acl6Name,

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
        if ($PSBoundParameters.ContainsKey('Acl6Name')) {
            $argumentParts += 'acl6name:' + $Acl6Name
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentParts += 'td:' + $TrafficDomain
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$ClientName", 'Delete lsnclient_nsacl6_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnclient_nsacl6_binding -Resource $ClientName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNClientACL6Binding

# region Invoke-NSDeleteLSNClientACLBinding
function Invoke-NSDeleteLSNClientACLBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnclient_nsacl_binding resource.
    .DESCRIPTION
        Binding object showing the nsacl that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER AclName
        Name(s) of any configured extended ACL(s) whose action is ALLOW. The condition specified in the extended ACL rule identifies the traffic from an LSN subscriber for which the Citrix ADC is to perform large scale NAT. . Minimum length = 1
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNClientACLBinding -ClientName 'example' -AclName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNClientACLBinding -ClientName 'lsnclient_nsacl_binding_example' | Invoke-NSDeleteLSNClientACLBinding -Confirm:$false
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
        [string] $ClientName,

        [Parameter()]
        [string] $AclName,

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
        if ($PSBoundParameters.ContainsKey('AclName')) {
            $argumentParts += 'aclname:' + $AclName
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentParts += 'td:' + $TrafficDomain
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$ClientName", 'Delete lsnclient_nsacl_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnclient_nsacl_binding -Resource $ClientName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNClientACLBinding

# region Invoke-NSDeleteLSNClientNetwork6Binding
function Invoke-NSDeleteLSNClientNetwork6Binding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnclient_network6_binding resource.
    .DESCRIPTION
        Binding object showing the network6 that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER Network
        IPv4 address(es) of the LSN subscriber(s) or subscriber network(s) on whose traffic you want the Citrix ADC to perform Large Scale NAT. Minimum length = 1
    .PARAMETER NetMask
        Subnet mask for the IPv4 address specified in the Network parameter.
    .PARAMETER Network6
        IPv6 address(es) of the LSN subscriber(s) or subscriber network(s) on whose traffic you want the Citrix ADC to perform Large Scale NAT. Minimum length = 1
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNClientNetwork6Binding -ClientName 'example' -Network 'example' -NetMask '255.255.255.255' -Network6 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNClientNetwork6Binding -ClientName 'lsnclient_network6_binding_example' | Invoke-NSDeleteLSNClientNetwork6Binding -Confirm:$false
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
        [string] $ClientName,

        [Parameter()]
        [string] $Network,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [string] $Network6,

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
        if ($PSBoundParameters.ContainsKey('Network')) {
            $argumentParts += 'network:' + $Network
        }
        if ($PSBoundParameters.ContainsKey('NetMask')) {
            $argumentParts += 'netmask:' + $NetMask
        }
        if ($PSBoundParameters.ContainsKey('Network6')) {
            $argumentParts += 'network6:' + $Network6
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentParts += 'td:' + $TrafficDomain
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$ClientName", 'Delete lsnclient_network6_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnclient_network6_binding -Resource $ClientName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNClientNetwork6Binding

# region Invoke-NSDeleteLSNClientNetworkBinding
function Invoke-NSDeleteLSNClientNetworkBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnclient_network_binding resource.
    .DESCRIPTION
        Binding object showing the network that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
    .PARAMETER Network
        IPv4 address(es) of the LSN subscriber(s) or subscriber network(s) on whose traffic you want the Citrix ADC to perform Large Scale NAT. Minimum length = 1
    .PARAMETER NetMask
        Subnet mask for the IPv4 address specified in the Network parameter.
    .PARAMETER TrafficDomain
        ID of the traffic domain on which this subscriber or the subscriber network (as specified by the network parameter) belongs. If you do not specify an ID, the subscriber or the subscriber network becomes part of the default traffic domain. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNClientNetworkBinding -ClientName 'example' -Network 'example' -NetMask '255.255.255.255' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNClientNetworkBinding -ClientName 'lsnclient_network_binding_example' | Invoke-NSDeleteLSNClientNetworkBinding -Confirm:$false
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
        [string] $ClientName,

        [Parameter()]
        [string] $Network,

        [Parameter()]
        [string] $NetMask,

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
        if ($PSBoundParameters.ContainsKey('Network')) {
            $argumentParts += 'network:' + $Network
        }
        if ($PSBoundParameters.ContainsKey('NetMask')) {
            $argumentParts += 'netmask:' + $NetMask
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentParts += 'td:' + $TrafficDomain
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$ClientName", 'Delete lsnclient_network_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnclient_network_binding -Resource $ClientName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNClientNetworkBinding

# region Invoke-NSDeleteLSNGroup
function Invoke-NSDeleteLSNGroup {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup resource.
    .DESCRIPTION
        Configuration for LSN group resource.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroup -GroupName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroup -GroupName 'lsngroup_example' | Invoke-NSDeleteLSNGroup -Confirm:$false
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
        [string] $GroupName,

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

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup -Resource $GroupName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroup

# region Invoke-NSDeleteLSNGroupIPsecALGProfileBinding
function Invoke-NSDeleteLSNGroupIPsecALGProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_ipsecalgprofile_binding resource.
    .DESCRIPTION
        Binding object showing the ipsecalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER IPsecALGProfile
        Name of the IPSec ALG profile to bind to the specified LSN group.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupIPsecALGProfileBinding -GroupName 'example' -IPsecALGProfile 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupIPsecALGProfileBinding -GroupName 'lsngroup_ipsecalgprofile_binding_example' | Invoke-NSDeleteLSNGroupIPsecALGProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $IPsecALGProfile,

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
        if ($PSBoundParameters.ContainsKey('IPsecALGProfile')) {
            $argumentParts += 'ipsecalgprofile:' + $IPsecALGProfile
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_ipsecalgprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_ipsecalgprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupIPsecALGProfileBinding

# region Invoke-NSDeleteLSNGroupLSNAppsProfileBinding
function Invoke-NSDeleteLSNGroupLSNAppsProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_lsnappsprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnappsprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER AppsProfileName
        Name of the LSN application profile to bind to the specified LSN group. For each set of destination ports, bind a profile for each protocol for which you want to specify settings. By default, one LSN application profile with default settings for TCP, UDP, and ICMP protocols for all destination ports is bound to an LSN group during its creation. This profile is called a default application profile. When you bind an LSN application profile, with a specified set of destination ports, to an LSN group, the bound profile overrides the default LSN application profile for that protocol at that set of destination ports.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupLSNAppsProfileBinding -GroupName 'example' -AppsProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNAppsProfileBinding -GroupName 'lsngroup_lsnappsprofile_binding_example' | Invoke-NSDeleteLSNGroupLSNAppsProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $AppsProfileName,

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
        if ($PSBoundParameters.ContainsKey('AppsProfileName')) {
            $argumentParts += 'appsprofilename:' + $AppsProfileName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_lsnappsprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_lsnappsprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupLSNAppsProfileBinding

# region Invoke-NSDeleteLSNGroupLSNHTTPHeaderLogProfileBinding
function Invoke-NSDeleteLSNGroupLSNHTTPHeaderLogProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_lsnhttphdrlogprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnhttphdrlogprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER HTTPHdrlogProfileName
        The name of the LSN HTTP header logging Profile.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupLSNHTTPHeaderLogProfileBinding -GroupName 'example' -HTTPHdrlogProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding -GroupName 'lsngroup_lsnhttphdrlogprofile_binding_example' | Invoke-NSDeleteLSNGroupLSNHTTPHeaderLogProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $HTTPHdrlogProfileName,

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
        if ($PSBoundParameters.ContainsKey('HTTPHdrlogProfileName')) {
            $argumentParts += 'httphdrlogprofilename:' + $HTTPHdrlogProfileName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_lsnhttphdrlogprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_lsnhttphdrlogprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupLSNHTTPHeaderLogProfileBinding

# region Invoke-NSDeleteLSNGroupLSNLogProfileBinding
function Invoke-NSDeleteLSNGroupLSNLogProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_lsnlogprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnlogprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER LogProfileName
        The name of the LSN logging Profile.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupLSNLogProfileBinding -GroupName 'example' -LogProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNLogProfileBinding -GroupName 'lsngroup_lsnlogprofile_binding_example' | Invoke-NSDeleteLSNGroupLSNLogProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $LogProfileName,

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
        if ($PSBoundParameters.ContainsKey('LogProfileName')) {
            $argumentParts += 'logprofilename:' + $LogProfileName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_lsnlogprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_lsnlogprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupLSNLogProfileBinding

# region Invoke-NSDeleteLSNGroupLSNPoolBinding
function Invoke-NSDeleteLSNGroupLSNPoolBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_lsnpool_binding resource.
    .DESCRIPTION
        Binding object showing the lsnpool that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER PoolName
        Name of the LSN pool to bind to the specified LSN group. Only LSN Pools and LSN groups with the same NAT type settings can be bound together. Multiples LSN pools can be bound to an LSN group. For Deterministic NAT, pools bound to an LSN group cannot be bound to other LSN groups. For Dynamic NAT, pools bound to an LSN group can be bound to multiple LSN groups.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupLSNPoolBinding -GroupName 'example' -PoolName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNPoolBinding -GroupName 'lsngroup_lsnpool_binding_example' | Invoke-NSDeleteLSNGroupLSNPoolBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $PoolName,

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
        if ($PSBoundParameters.ContainsKey('PoolName')) {
            $argumentParts += 'poolname:' + $PoolName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_lsnpool_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_lsnpool_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupLSNPoolBinding

# region Invoke-NSDeleteLSNGroupLSNRTSPALGProfileBinding
function Invoke-NSDeleteLSNGroupLSNRTSPALGProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_lsnrtspalgprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnrtspalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER RtspalgProfileName
        The name of the LSN RTSP ALG Profile.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupLSNRTSPALGProfileBinding -GroupName 'example' -RtspalgProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding -GroupName 'lsngroup_lsnrtspalgprofile_binding_example' | Invoke-NSDeleteLSNGroupLSNRTSPALGProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $RtspalgProfileName,

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
        if ($PSBoundParameters.ContainsKey('RtspalgProfileName')) {
            $argumentParts += 'rtspalgprofilename:' + $RtspalgProfileName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_lsnrtspalgprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_lsnrtspalgprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupLSNRTSPALGProfileBinding

# region Invoke-NSDeleteLSNGroupLSNSIPALGProfileBinding
function Invoke-NSDeleteLSNGroupLSNSIPALGProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_lsnsipalgprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsnsipalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER SIPAlgProfileName
        The name of the LSN SIP ALG Profile.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupLSNSIPALGProfileBinding -GroupName 'example' -SIPAlgProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNSIPALGProfileBinding -GroupName 'lsngroup_lsnsipalgprofile_binding_example' | Invoke-NSDeleteLSNGroupLSNSIPALGProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $SIPAlgProfileName,

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
        if ($PSBoundParameters.ContainsKey('SIPAlgProfileName')) {
            $argumentParts += 'sipalgprofilename:' + $SIPAlgProfileName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_lsnsipalgprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_lsnsipalgprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupLSNSIPALGProfileBinding

# region Invoke-NSDeleteLSNGroupLSNTransportProfileBinding
function Invoke-NSDeleteLSNGroupLSNTransportProfileBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_lsntransportprofile_binding resource.
    .DESCRIPTION
        Binding object showing the lsntransportprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER TransPortProfileName
        Name of the LSN transport profile to bind to the specified LSN group. Bind a profile for each protocol for which you want to specify settings. By default, one LSN transport profile with default settings for TCP, UDP, and ICMP protocols is bound to an LSN group during its creation. This profile is called a default transport. An LSN transport profile that you bind to an LSN group overrides the default LSN transport profile for that protocol.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupLSNTransportProfileBinding -GroupName 'example' -TransPortProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNTransportProfileBinding -GroupName 'lsngroup_lsntransportprofile_binding_example' | Invoke-NSDeleteLSNGroupLSNTransportProfileBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $TransPortProfileName,

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
        if ($PSBoundParameters.ContainsKey('TransPortProfileName')) {
            $argumentParts += 'transportprofilename:' + $TransPortProfileName
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_lsntransportprofile_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_lsntransportprofile_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupLSNTransportProfileBinding

# region Invoke-NSDeleteLSNGroupPCPServerBinding
function Invoke-NSDeleteLSNGroupPCPServerBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsngroup_pcpserver_binding resource.
    .DESCRIPTION
        Binding object showing the pcpserver that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER PCPServer
        Name of the PCP server to be associated with lsn group.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNGroupPCPServerBinding -GroupName 'example' -PCPServer 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNGroupPCPServerBinding -GroupName 'lsngroup_pcpserver_binding_example' | Invoke-NSDeleteLSNGroupPCPServerBinding -Confirm:$false
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
        [string] $GroupName,

        [Parameter()]
        [string] $PCPServer,

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
        if ($PSBoundParameters.ContainsKey('PCPServer')) {
            $argumentParts += 'pcpserver:' + $PCPServer
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Delete lsngroup_pcpserver_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsngroup_pcpserver_binding -Resource $GroupName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNGroupPCPServerBinding

# region Invoke-NSDeleteLSNHTTPHeaderLogProfile
function Invoke-NSDeleteLSNHTTPHeaderLogProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnhttphdrlogprofile resource.
    .DESCRIPTION
        Configuration for LSN HTTP header logging Profile resource.
    .PARAMETER HTTPHdrlogProfileName
        The name of the HTTP header logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'lsnhttphdrlogprofile_example' | Invoke-NSDeleteLSNHTTPHeaderLogProfile -Confirm:$false
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
        [string] $HTTPHdrlogProfileName,

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

        if ($PSCmdlet.ShouldProcess("$HTTPHdrlogProfileName", 'Delete lsnhttphdrlogprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnhttphdrlogprofile -Resource $HTTPHdrlogProfileName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNHTTPHeaderLogProfile

# region Invoke-NSDeleteLSNIP6Profile
function Invoke-NSDeleteLSNIP6Profile {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnip6profile resource.
    .DESCRIPTION
        Configuration for LSN ip6 Profile resource.
    .PARAMETER Name
        Name for the LSN ip6 profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN ip6 profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn ip6 profile1" or 'lsn ip6 profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNIP6Profile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNIP6Profile -Name 'lsnip6profile_example' | Invoke-NSDeleteLSNIP6Profile -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete lsnip6profile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnip6profile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNIP6Profile

# region Invoke-NSDeleteLSNLogProfile
function Invoke-NSDeleteLSNLogProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnlogprofile resource.
    .DESCRIPTION
        Configuration for LSN logging Profile resource.
    .PARAMETER LogProfileName
        The name of the logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNLogProfile -LogProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNLogProfile -LogProfileName 'lsnlogprofile_example' | Invoke-NSDeleteLSNLogProfile -Confirm:$false
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
        [string] $LogProfileName,

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

        if ($PSCmdlet.ShouldProcess("$LogProfileName", 'Delete lsnlogprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnlogprofile -Resource $LogProfileName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNLogProfile

# region Invoke-NSDeleteLSNPool
function Invoke-NSDeleteLSNPool {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnpool resource.
    .DESCRIPTION
        Configuration for LSN pool resource.
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNPool -PoolName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNPool -PoolName 'lsnpool_example' | Invoke-NSDeleteLSNPool -Confirm:$false
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
        [string] $PoolName,

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

        if ($PSCmdlet.ShouldProcess("$PoolName", 'Delete lsnpool')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnpool -Resource $PoolName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNPool

# region Invoke-NSDeleteLSNPoolLsnipBinding
function Invoke-NSDeleteLSNPoolLsnipBinding {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnpool_lsnip_binding resource.
    .DESCRIPTION
        Binding object showing the lsnip that can be bound to lsnpool.
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Ownernode
        ID(s) of cluster node(s) on which command is to be executed. Minimum value = 0 Maximum value = 31
    .PARAMETER Lsnip
        IPv4 address or a range of IPv4 addresses to be used as NAT IP address(es) for LSN. After the pool is created, these IPv4 addresses are added to the Citrix ADC as Citrix ADC owned IP address of type LSN. A maximum of 4096 IP addresses can be bound to an LSN pool. An LSN IP address associated with an LSN pool cannot be shared with other LSN pools. IP addresses specified for this parameter must not already exist on the Citrix ADC as any Citrix ADC owned IP addresses. In the command line interface, separate the range with a hyphen. For example: 10.102.29.30-10.102.29.189. You can later remove some or all the LSN IP addresses from the pool, and add IP addresses to the LSN pool. By default , arp is enabled on LSN IP address but, you can disable it using command - "set ns ip" . Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNPoolLsnipBinding -PoolName 'example' -Ownernode 1 -Lsnip 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNPoolLsnipBinding -PoolName 'lsnpool_lsnip_binding_example' | Invoke-NSDeleteLSNPoolLsnipBinding -Confirm:$false
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
        [string] $PoolName,

        [Parameter()]
        [int] $Ownernode,

        [Parameter()]
        [string] $Lsnip,

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
        if ($PSBoundParameters.ContainsKey('Ownernode')) {
            $argumentParts += 'ownernode:' + $Ownernode
        }
        if ($PSBoundParameters.ContainsKey('Lsnip')) {
            $argumentParts += 'lsnip:' + $Lsnip
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($PSCmdlet.ShouldProcess("$PoolName", 'Delete lsnpool_lsnip_binding')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnpool_lsnip_binding -Resource $PoolName -Query $query -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNPoolLsnipBinding

# region Invoke-NSDeleteLSNRTSPALGProfile
function Invoke-NSDeleteLSNRTSPALGProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnrtspalgprofile resource.
    .DESCRIPTION
        Configuration for LSN RTSPALG Profile resource.
    .PARAMETER RtspalgProfileName
        The name of the RTSPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNRTSPALGProfile -RtspalgProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGProfile -RtspalgProfileName 'lsnrtspalgprofile_example' | Invoke-NSDeleteLSNRTSPALGProfile -Confirm:$false
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
        [string] $RtspalgProfileName,

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

        if ($PSCmdlet.ShouldProcess("$RtspalgProfileName", 'Delete lsnrtspalgprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnrtspalgprofile -Resource $RtspalgProfileName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNRTSPALGProfile

# region Invoke-NSDeleteLSNSIPALGProfile
function Invoke-NSDeleteLSNSIPALGProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnsipalgprofile resource.
    .DESCRIPTION
        Configuration for LSN SIPALG Profile resource.
    .PARAMETER SIPAlgProfileName
        The name of the SIPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNSIPALGProfile -SIPAlgProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNSIPALGProfile -SIPAlgProfileName 'lsnsipalgprofile_example' | Invoke-NSDeleteLSNSIPALGProfile -Confirm:$false
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
        [string] $SIPAlgProfileName,

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

        if ($PSCmdlet.ShouldProcess("$SIPAlgProfileName", 'Delete lsnsipalgprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnsipalgprofile -Resource $SIPAlgProfileName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNSIPALGProfile

# region Invoke-NSDeleteLSNStatic
function Invoke-NSDeleteLSNStatic {
    <#
    .SYNOPSIS
        Removes a NetScaler lsnstatic resource.
    .DESCRIPTION
        Configuration for static mapping resource.
    .PARAMETER Name
        Name for the LSN static mapping entry. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn static1" or 'lsn static1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNStatic -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNStatic -Name 'lsnstatic_example' | Invoke-NSDeleteLSNStatic -Confirm:$false
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

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete lsnstatic')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsnstatic -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNStatic

# region Invoke-NSDeleteLSNTransportProfile
function Invoke-NSDeleteLSNTransportProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler lsntransportprofile resource.
    .DESCRIPTION
        Configuration for LSN Transport Profile resource.
    .PARAMETER TransPortProfileName
        Name for the LSN transport profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN transport profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn transport profile1" or 'lsn transport profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteLSNTransportProfile -TransPortProfileName 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetLSNTransportProfile -TransPortProfileName 'lsntransportprofile_example' | Invoke-NSDeleteLSNTransportProfile -Confirm:$false
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
        [string] $TransPortProfileName,

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

        if ($PSCmdlet.ShouldProcess("$TransPortProfileName", 'Delete lsntransportprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type lsntransportprofile -Resource $TransPortProfileName -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteLSNTransportProfile

# region Invoke-NSFlushLSNRTSPALGSession
function Invoke-NSFlushLSNRTSPALGSession {
    <#
    .SYNOPSIS
        Clears NetScaler lsnrtspalgsession cache data.
    .DESCRIPTION
        Configuration for LSN RTSPALG session resource.
    .PARAMETER Sessionid
        Session ID for the RTSP call.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSFlushLSNRTSPALGSession -Sessionid 'example'
    .EXAMPLE
        Invoke-NSFlushLSNRTSPALGSession -Sessionid 'example' -WhatIf
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
        [string] $Sessionid,

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
        if ($PSBoundParameters.ContainsKey('Sessionid')) { $body['sessionid'] = $Sessionid }

        if ($PSCmdlet.ShouldProcess('lsnrtspalgsession', 'Clear lsnrtspalgsession')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnrtspalgsession -Action flush -Payload @{ lsnrtspalgsession = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSFlushLSNRTSPALGSession

# region Invoke-NSFlushLsnsession
function Invoke-NSFlushLsnsession {
    <#
    .SYNOPSIS
        Clears NetScaler lsnsession cache data.
    .DESCRIPTION
        Configuration for lsn session resource.
    .PARAMETER ClientName
        Name of the LSN Client entity.
    .PARAMETER Natip
        Mapped NAT IP address used in LSN sessions.
    .PARAMETER NatPort2
        Mapped NAT port used in the LSN sessions.
    .PARAMETER NatType
        Type of sessions to be displayed. Default value: NAT44 Possible values = NAT44, DS-Lite, NAT64
    .PARAMETER NetMask
        Subnet mask for the IP address specified by the network parameter.
    .PARAMETER Network
        IP address or network address of subscriber(s).
    .PARAMETER Network6
        IPv6 address of the LSN subscriber or B4 device.
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
    .PARAMETER TrafficDomain
        Traffic domain ID of the LSN client entity. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSFlushLsnsession 
    .EXAMPLE
        Invoke-NSFlushLsnsession  -WhatIf
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
        [string] $ClientName,

        [Parameter()]
        [string] $Natip,

        [Parameter()]
        [int] $NatPort2,

        [Parameter()]
        [ValidateSet('NAT44', 'DS-Lite', 'NAT64')]
        [string] $NatType,

        [Parameter()]
        [string] $NetMask,

        [Parameter()]
        [string] $Network,

        [Parameter()]
        [string] $Network6,

        [Parameter()]
        [int] $Nodeid,

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

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('ClientName')) { $body['clientname'] = $ClientName }
        if ($PSBoundParameters.ContainsKey('Natip')) { $body['natip'] = $Natip }
        if ($PSBoundParameters.ContainsKey('NatPort2')) { $body['natport2'] = $NatPort2 }
        if ($PSBoundParameters.ContainsKey('NatType')) { $body['nattype'] = $NatType }
        if ($PSBoundParameters.ContainsKey('NetMask')) { $body['netmask'] = $NetMask }
        if ($PSBoundParameters.ContainsKey('Network')) { $body['network'] = $Network }
        if ($PSBoundParameters.ContainsKey('Network6')) { $body['network6'] = $Network6 }
        if ($PSBoundParameters.ContainsKey('Nodeid')) { $body['nodeid'] = $Nodeid }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $body['td'] = $TrafficDomain }

        if ($PSCmdlet.ShouldProcess('lsnsession', 'Clear lsnsession')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnsession -Action flush -Payload @{ lsnsession = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSFlushLsnsession

# region Invoke-NSFlushLSNSIPALGCall
function Invoke-NSFlushLSNSIPALGCall {
    <#
    .SYNOPSIS
        Clears NetScaler lsnsipalgcall cache data.
    .DESCRIPTION
        Configuration for LSN SIPALG call resource.
    .PARAMETER Callid
        Call ID for the SIP call.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSFlushLSNSIPALGCall -Callid 'example'
    .EXAMPLE
        Invoke-NSFlushLSNSIPALGCall -Callid 'example' -WhatIf
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
        [string] $Callid,

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
        if ($PSBoundParameters.ContainsKey('Callid')) { $body['callid'] = $Callid }

        if ($PSCmdlet.ShouldProcess('lsnsipalgcall', 'Clear lsnsipalgcall')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnsipalgcall -Action flush -Payload @{ lsnsipalgcall = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSFlushLSNSIPALGCall

# region Invoke-NSGetLSNAppsAttributes
function Invoke-NSGetLSNAppsAttributes {
    <#
    .SYNOPSIS
        Gets NetScaler lsnappsattributes configuration.
    .DESCRIPTION
        Configuration for LSN Application Attributes resource.
    .PARAMETER Name
        Name for the LSN Application Port ATTRIBUTES. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNAppsAttributes
    .EXAMPLE
        Invoke-NSGetLSNAppsAttributes -Name 'lsnappsattributes_example'
    .EXAMPLE
        Invoke-NSGetLSNAppsAttributes -Filter @{ servicetype = 'HTTP' }
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
            Type = 'lsnappsattributes'
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
# endregion Invoke-NSGetLSNAppsAttributes

# region Invoke-NSGetLSNAppsProfile
function Invoke-NSGetLSNAppsProfile {
    <#
    .SYNOPSIS
        Gets NetScaler lsnappsprofile configuration.
    .DESCRIPTION
        Configuration for LSN Application Profile resource.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNAppsProfile
    .EXAMPLE
        Invoke-NSGetLSNAppsProfile -AppsProfileName 'lsnappsprofile_example'
    .EXAMPLE
        Invoke-NSGetLSNAppsProfile -Filter @{ servicetype = 'HTTP' }
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
        [string] $AppsProfileName,

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
            Type = 'lsnappsprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $AppsProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNAppsProfile

# region Invoke-NSGetLSNAppsProfileBinding
function Invoke-NSGetLSNAppsProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnappsprofile_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to lsnappsprofile.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNAppsProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNAppsProfileBinding -AppsProfileName 'lsnappsprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNAppsProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $AppsProfileName,

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
            Type = 'lsnappsprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $AppsProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNAppsProfileBinding

# region Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding
function Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnappsprofile_lsnappsattributes_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnappsattributes that can be bound to lsnappsprofile.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding
    .EXAMPLE
        Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding -AppsProfileName 'lsnappsprofile_lsnappsattributes_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $AppsProfileName,

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
            Type = 'lsnappsprofile_lsnappsattributes_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $AppsProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNAppsProfileLSNAppsAttributesBinding

# region Invoke-NSGetLSNAppsProfilePortBinding
function Invoke-NSGetLSNAppsProfilePortBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnappsprofile_port_binding configuration.
    .DESCRIPTION
        Binding object showing the port that can be bound to lsnappsprofile.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNAppsProfilePortBinding
    .EXAMPLE
        Invoke-NSGetLSNAppsProfilePortBinding -AppsProfileName 'lsnappsprofile_port_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNAppsProfilePortBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $AppsProfileName,

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
            Type = 'lsnappsprofile_port_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $AppsProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNAppsProfilePortBinding

# region Invoke-NSGetLSNClient
function Invoke-NSGetLSNClient {
    <#
    .SYNOPSIS
        Gets NetScaler lsnclient configuration.
    .DESCRIPTION
        Configuration for lsn client resource.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNClient
    .EXAMPLE
        Invoke-NSGetLSNClient -ClientName 'lsnclient_example'
    .EXAMPLE
        Invoke-NSGetLSNClient -Filter @{ servicetype = 'HTTP' }
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
        [string] $ClientName,

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
            Type = 'lsnclient'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ClientName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNClient

# region Invoke-NSGetLSNClientACL6Binding
function Invoke-NSGetLSNClientACL6Binding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnclient_nsacl6_binding configuration.
    .DESCRIPTION
        Binding object showing the nsacl6 that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNClientACL6Binding
    .EXAMPLE
        Invoke-NSGetLSNClientACL6Binding -ClientName 'lsnclient_nsacl6_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNClientACL6Binding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ClientName,

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
            Type = 'lsnclient_nsacl6_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ClientName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNClientACL6Binding

# region Invoke-NSGetLSNClientACLBinding
function Invoke-NSGetLSNClientACLBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnclient_nsacl_binding configuration.
    .DESCRIPTION
        Binding object showing the nsacl that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNClientACLBinding
    .EXAMPLE
        Invoke-NSGetLSNClientACLBinding -ClientName 'lsnclient_nsacl_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNClientACLBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ClientName,

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
            Type = 'lsnclient_nsacl_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ClientName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNClientACLBinding

# region Invoke-NSGetLSNClientBinding
function Invoke-NSGetLSNClientBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnclient_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNClientBinding
    .EXAMPLE
        Invoke-NSGetLSNClientBinding -ClientName 'lsnclient_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNClientBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ClientName,

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
            Type = 'lsnclient_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ClientName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNClientBinding

# region Invoke-NSGetLSNClientNetwork6Binding
function Invoke-NSGetLSNClientNetwork6Binding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnclient_network6_binding configuration.
    .DESCRIPTION
        Binding object showing the network6 that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNClientNetwork6Binding
    .EXAMPLE
        Invoke-NSGetLSNClientNetwork6Binding -ClientName 'lsnclient_network6_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNClientNetwork6Binding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ClientName,

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
            Type = 'lsnclient_network6_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ClientName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNClientNetwork6Binding

# region Invoke-NSGetLSNClientNetworkBinding
function Invoke-NSGetLSNClientNetworkBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnclient_network_binding configuration.
    .DESCRIPTION
        Binding object showing the network that can be bound to lsnclient.
    .PARAMETER ClientName
        Name for the LSN client entity. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN client is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn client1" or 'lsn client1'). . Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNClientNetworkBinding
    .EXAMPLE
        Invoke-NSGetLSNClientNetworkBinding -ClientName 'lsnclient_network_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNClientNetworkBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $ClientName,

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
            Type = 'lsnclient_network_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $ClientName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNClientNetworkBinding

# region Invoke-NSGetLsndeterMinIsticnat
function Invoke-NSGetLsndeterMinIsticnat {
    <#
    .SYNOPSIS
        Gets NetScaler lsndeterministicnat configuration.
    .DESCRIPTION
        Configuration for deterministic NAT resource.
    .PARAMETER ClientName
        The name of the LSN Client.
    .PARAMETER Network6
        IPv6 address of the LSN subscriber or B4 device.
    .PARAMETER Subscrip
        The Client IP address.
    .PARAMETER TrafficDomain
        The LSN client TD. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Natip
        The NAT IP address. Minimum length = 1
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
        Invoke-NSGetLsndeterMinIsticnat
    .EXAMPLE
        Invoke-NSGetLsndeterMinIsticnat -Filter @{ servicetype = 'HTTP' }
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
        [string] $ClientName,

        [Parameter(ParameterSetName = 'All')]
        [string] $Network6,

        [Parameter(ParameterSetName = 'All')]
        [string] $Subscrip,

        [Parameter(ParameterSetName = 'All')]
        [int] $TrafficDomain,

        [Parameter(ParameterSetName = 'All')]
        [string] $Natip,

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
        if ($PSBoundParameters.ContainsKey('ClientName')) {
            $argumentValue = $ClientName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'clientname:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Network6')) {
            $argumentValue = $Network6
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'network6:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Subscrip')) {
            $argumentValue = $Subscrip
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'subscrip:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentValue = $TrafficDomain
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'td:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Natip')) {
            $argumentValue = $Natip
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'natip:' + $argumentValue
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
            Type = 'lsndeterministicnat'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLsndeterMinIsticnat

# region Invoke-NSGetLSNGroup
function Invoke-NSGetLSNGroup {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup configuration.
    .DESCRIPTION
        Configuration for LSN group resource.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroup
    .EXAMPLE
        Invoke-NSGetLSNGroup -GroupName 'lsngroup_example'
    .EXAMPLE
        Invoke-NSGetLSNGroup -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroup

# region Invoke-NSGetLSNGroupBinding
function Invoke-NSGetLSNGroupBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupBinding -GroupName 'lsngroup_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupBinding

# region Invoke-NSGetLSNGroupIPsecALGProfileBinding
function Invoke-NSGetLSNGroupIPsecALGProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_ipsecalgprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the ipsecalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupIPsecALGProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupIPsecALGProfileBinding -GroupName 'lsngroup_ipsecalgprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupIPsecALGProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_ipsecalgprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupIPsecALGProfileBinding

# region Invoke-NSGetLSNGroupLSNAppsProfileBinding
function Invoke-NSGetLSNGroupLSNAppsProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_lsnappsprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnappsprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupLSNAppsProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNAppsProfileBinding -GroupName 'lsngroup_lsnappsprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNAppsProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_lsnappsprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupLSNAppsProfileBinding

# region Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding
function Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_lsnhttphdrlogprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnhttphdrlogprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding -GroupName 'lsngroup_lsnhttphdrlogprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_lsnhttphdrlogprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupLSNHTTPHeaderLogProfileBinding

# region Invoke-NSGetLSNGroupLSNLogProfileBinding
function Invoke-NSGetLSNGroupLSNLogProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_lsnlogprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnlogprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupLSNLogProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNLogProfileBinding -GroupName 'lsngroup_lsnlogprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNLogProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_lsnlogprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupLSNLogProfileBinding

# region Invoke-NSGetLSNGroupLSNPoolBinding
function Invoke-NSGetLSNGroupLSNPoolBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_lsnpool_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnpool that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupLSNPoolBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNPoolBinding -GroupName 'lsngroup_lsnpool_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNPoolBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_lsnpool_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupLSNPoolBinding

# region Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding
function Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_lsnrtspalgprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnrtspalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding -GroupName 'lsngroup_lsnrtspalgprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_lsnrtspalgprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupLSNRTSPALGProfileBinding

# region Invoke-NSGetLSNGroupLSNSIPALGProfileBinding
function Invoke-NSGetLSNGroupLSNSIPALGProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_lsnsipalgprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnsipalgprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupLSNSIPALGProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNSIPALGProfileBinding -GroupName 'lsngroup_lsnsipalgprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNSIPALGProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_lsnsipalgprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupLSNSIPALGProfileBinding

# region Invoke-NSGetLSNGroupLSNTransportProfileBinding
function Invoke-NSGetLSNGroupLSNTransportProfileBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_lsntransportprofile_binding configuration.
    .DESCRIPTION
        Binding object showing the lsntransportprofile that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupLSNTransportProfileBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNTransportProfileBinding -GroupName 'lsngroup_lsntransportprofile_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupLSNTransportProfileBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_lsntransportprofile_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupLSNTransportProfileBinding

# region Invoke-NSGetLSNGroupPCPServerBinding
function Invoke-NSGetLSNGroupPCPServerBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsngroup_pcpserver_binding configuration.
    .DESCRIPTION
        Binding object showing the pcpserver that can be bound to lsngroup.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNGroupPCPServerBinding
    .EXAMPLE
        Invoke-NSGetLSNGroupPCPServerBinding -GroupName 'lsngroup_pcpserver_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNGroupPCPServerBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $GroupName,

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
            Type = 'lsngroup_pcpserver_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $GroupName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNGroupPCPServerBinding

# region Invoke-NSGetLSNHTTPHeaderLogProfile
function Invoke-NSGetLSNHTTPHeaderLogProfile {
    <#
    .SYNOPSIS
        Gets NetScaler lsnhttphdrlogprofile configuration.
    .DESCRIPTION
        Configuration for LSN HTTP header logging Profile resource.
    .PARAMETER HTTPHdrlogProfileName
        The name of the HTTP header logging Profile. Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNHTTPHeaderLogProfile
    .EXAMPLE
        Invoke-NSGetLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'lsnhttphdrlogprofile_example'
    .EXAMPLE
        Invoke-NSGetLSNHTTPHeaderLogProfile -Filter @{ servicetype = 'HTTP' }
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
        [string] $HTTPHdrlogProfileName,

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
            Type = 'lsnhttphdrlogprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $HTTPHdrlogProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNHTTPHeaderLogProfile

# region Invoke-NSGetLSNIP6Profile
function Invoke-NSGetLSNIP6Profile {
    <#
    .SYNOPSIS
        Gets NetScaler lsnip6profile configuration.
    .DESCRIPTION
        Configuration for LSN ip6 Profile resource.
    .PARAMETER Name
        Name for the LSN ip6 profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN ip6 profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn ip6 profile1" or 'lsn ip6 profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNIP6Profile
    .EXAMPLE
        Invoke-NSGetLSNIP6Profile -Name 'lsnip6profile_example'
    .EXAMPLE
        Invoke-NSGetLSNIP6Profile -Filter @{ servicetype = 'HTTP' }
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
            Type = 'lsnip6profile'
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
# endregion Invoke-NSGetLSNIP6Profile

# region Invoke-NSGetLSNLogProfile
function Invoke-NSGetLSNLogProfile {
    <#
    .SYNOPSIS
        Gets NetScaler lsnlogprofile configuration.
    .DESCRIPTION
        Configuration for LSN logging Profile resource.
    .PARAMETER LogProfileName
        The name of the logging Profile. Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNLogProfile
    .EXAMPLE
        Invoke-NSGetLSNLogProfile -LogProfileName 'lsnlogprofile_example'
    .EXAMPLE
        Invoke-NSGetLSNLogProfile -Filter @{ servicetype = 'HTTP' }
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
        [string] $LogProfileName,

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
            Type = 'lsnlogprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $LogProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNLogProfile

# region Invoke-NSGetLsnparameter
function Invoke-NSGetLsnparameter {
    <#
    .SYNOPSIS
        Gets NetScaler lsnparameter configuration.
    .DESCRIPTION
        Configuration for LSN parameter resource.
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
        Invoke-NSGetLsnparameter
    .EXAMPLE
        Invoke-NSGetLsnparameter -Filter @{ servicetype = 'HTTP' }
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
            Type = 'lsnparameter'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLsnparameter

# region Invoke-NSGetLSNPool
function Invoke-NSGetLSNPool {
    <#
    .SYNOPSIS
        Gets NetScaler lsnpool configuration.
    .DESCRIPTION
        Configuration for LSN pool resource.
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNPool
    .EXAMPLE
        Invoke-NSGetLSNPool -PoolName 'lsnpool_example'
    .EXAMPLE
        Invoke-NSGetLSNPool -Filter @{ servicetype = 'HTTP' }
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
        [string] $PoolName,

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
            Type = 'lsnpool'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PoolName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNPool

# region Invoke-NSGetLSNPoolBinding
function Invoke-NSGetLSNPoolBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnpool_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to lsnpool.
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNPoolBinding
    .EXAMPLE
        Invoke-NSGetLSNPoolBinding -PoolName 'lsnpool_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNPoolBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $PoolName,

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
            Type = 'lsnpool_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PoolName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNPoolBinding

# region Invoke-NSGetLSNPoolLsnipBinding
function Invoke-NSGetLSNPoolLsnipBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnpool_lsnip_binding configuration.
    .DESCRIPTION
        Binding object showing the lsnip that can be bound to lsnpool.
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNPoolLsnipBinding
    .EXAMPLE
        Invoke-NSGetLSNPoolLsnipBinding -PoolName 'lsnpool_lsnip_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNPoolLsnipBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $PoolName,

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
            Type = 'lsnpool_lsnip_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $PoolName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNPoolLsnipBinding

# region Invoke-NSGetLSNRTSPALGProfile
function Invoke-NSGetLSNRTSPALGProfile {
    <#
    .SYNOPSIS
        Gets NetScaler lsnrtspalgprofile configuration.
    .DESCRIPTION
        Configuration for LSN RTSPALG Profile resource.
    .PARAMETER RtspalgProfileName
        The name of the RTSPALG Profile. Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNRTSPALGProfile
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGProfile -RtspalgProfileName 'lsnrtspalgprofile_example'
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGProfile -Filter @{ servicetype = 'HTTP' }
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
        [string] $RtspalgProfileName,

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
            Type = 'lsnrtspalgprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $RtspalgProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNRTSPALGProfile

# region Invoke-NSGetLSNRTSPALGSession
function Invoke-NSGetLSNRTSPALGSession {
    <#
    .SYNOPSIS
        Gets NetScaler lsnrtspalgsession configuration.
    .DESCRIPTION
        Configuration for LSN RTSPALG session resource.
    .PARAMETER Sessionid
        Session ID for the RTSP call.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetLSNRTSPALGSession
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGSession -Sessionid 'lsnrtspalgsession_example'
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGSession -Filter @{ servicetype = 'HTTP' }
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
        [string] $Sessionid,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [int] $Nodeid,

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
        if ($PSBoundParameters.ContainsKey('Nodeid')) {
            $argumentValue = $Nodeid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nodeid:' + $argumentValue
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
            Type = 'lsnrtspalgsession'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Sessionid
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNRTSPALGSession

# region Invoke-NSGetLSNRTSPALGSessionBinding
function Invoke-NSGetLSNRTSPALGSessionBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnrtspalgsession_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to lsnrtspalgsession.
    .PARAMETER Sessionid
        Session ID for the RTSP call.
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
        Invoke-NSGetLSNRTSPALGSessionBinding
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGSessionBinding -Sessionid 'lsnrtspalgsession_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGSessionBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $Sessionid,

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
            Type = 'lsnrtspalgsession_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Sessionid
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNRTSPALGSessionBinding

# region Invoke-NSGetLSNRTSPALGSessionDataChannelBinding
function Invoke-NSGetLSNRTSPALGSessionDataChannelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnrtspalgsession_datachannel_binding configuration.
    .DESCRIPTION
        Binding object showing the datachannel that can be bound to lsnrtspalgsession.
    .PARAMETER Sessionid
        Session ID for the RTSP call.
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
        Invoke-NSGetLSNRTSPALGSessionDataChannelBinding
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGSessionDataChannelBinding -Sessionid 'lsnrtspalgsession_datachannel_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNRTSPALGSessionDataChannelBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $Sessionid,

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
            Type = 'lsnrtspalgsession_datachannel_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Sessionid
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNRTSPALGSessionDataChannelBinding

# region Invoke-NSGetLsnsession
function Invoke-NSGetLsnsession {
    <#
    .SYNOPSIS
        Gets NetScaler lsnsession configuration.
    .DESCRIPTION
        Configuration for lsn session resource.
    .PARAMETER NatType
        Type of sessions to be displayed. Default value: NAT44 Possible values = NAT44, DS-Lite, NAT64
    .PARAMETER ClientName
        Name of the LSN Client entity.
    .PARAMETER Network
        IP address or network address of subscriber(s).
    .PARAMETER NetMask
        Subnet mask for the IP address specified by the network parameter.
    .PARAMETER Network6
        IPv6 address of the LSN subscriber or B4 device.
    .PARAMETER TrafficDomain
        Traffic domain ID of the LSN client entity. Default value: 0 Minimum value = 0 Maximum value = 4094
    .PARAMETER Natip
        Mapped NAT IP address used in LSN sessions.
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetLsnsession
    .EXAMPLE
        Invoke-NSGetLsnsession -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('NAT44', 'DS-Lite', 'NAT64')]
        [string] $NatType,

        [Parameter(ParameterSetName = 'All')]
        [string] $ClientName,

        [Parameter(ParameterSetName = 'All')]
        [string] $Network,

        [Parameter(ParameterSetName = 'All')]
        [string] $NetMask,

        [Parameter(ParameterSetName = 'All')]
        [string] $Network6,

        [Parameter(ParameterSetName = 'All')]
        [int] $TrafficDomain,

        [Parameter(ParameterSetName = 'All')]
        [string] $Natip,

        [Parameter(ParameterSetName = 'All')]
        [int] $Nodeid,

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
        if ($PSBoundParameters.ContainsKey('NatType')) {
            $argumentValue = $NatType
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nattype:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('ClientName')) {
            $argumentValue = $ClientName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'clientname:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Network')) {
            $argumentValue = $Network
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'network:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('NetMask')) {
            $argumentValue = $NetMask
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'netmask:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Network6')) {
            $argumentValue = $Network6
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'network6:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) {
            $argumentValue = $TrafficDomain
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'td:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Natip')) {
            $argumentValue = $Natip
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'natip:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Nodeid')) {
            $argumentValue = $Nodeid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nodeid:' + $argumentValue
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
            Type = 'lsnsession'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLsnsession

# region Invoke-NSGetLSNSIPALGCall
function Invoke-NSGetLSNSIPALGCall {
    <#
    .SYNOPSIS
        Gets NetScaler lsnsipalgcall configuration.
    .DESCRIPTION
        Configuration for LSN SIPALG call resource.
    .PARAMETER Callid
        Call ID for the SIP call.
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetLSNSIPALGCall
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCall -Callid 'lsnsipalgcall_example'
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCall -Filter @{ servicetype = 'HTTP' }
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
        [string] $Callid,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [int] $Nodeid,

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
        if ($PSBoundParameters.ContainsKey('Nodeid')) {
            $argumentValue = $Nodeid
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nodeid:' + $argumentValue
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
            Type = 'lsnsipalgcall'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Callid
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNSIPALGCall

# region Invoke-NSGetLSNSIPALGCallBinding
function Invoke-NSGetLSNSIPALGCallBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnsipalgcall_binding configuration.
    .DESCRIPTION
        Binding object which returns the resources bound to lsnsipalgcall.
    .PARAMETER Callid
        Call ID for the SIP call.
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
        Invoke-NSGetLSNSIPALGCallBinding
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCallBinding -Callid 'lsnsipalgcall_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCallBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $Callid,

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
            Type = 'lsnsipalgcall_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Callid
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNSIPALGCallBinding

# region Invoke-NSGetLSNSIPALGCallControlchannelBinding
function Invoke-NSGetLSNSIPALGCallControlchannelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnsipalgcall_controlchannel_binding configuration.
    .DESCRIPTION
        Binding object showing the controlchannel that can be bound to lsnsipalgcall.
    .PARAMETER Callid
        Call ID for the SIP call.
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
        Invoke-NSGetLSNSIPALGCallControlchannelBinding
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCallControlchannelBinding -Callid 'lsnsipalgcall_controlchannel_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCallControlchannelBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $Callid,

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
            Type = 'lsnsipalgcall_controlchannel_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Callid
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNSIPALGCallControlchannelBinding

# region Invoke-NSGetLSNSIPALGCallDataChannelBinding
function Invoke-NSGetLSNSIPALGCallDataChannelBinding {
    <#
    .SYNOPSIS
        Gets NetScaler lsnsipalgcall_datachannel_binding configuration.
    .DESCRIPTION
        Binding object showing the datachannel that can be bound to lsnsipalgcall.
    .PARAMETER Callid
        Call ID for the SIP call.
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
        Invoke-NSGetLSNSIPALGCallDataChannelBinding
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCallDataChannelBinding -Callid 'lsnsipalgcall_datachannel_binding_example'
    .EXAMPLE
        Invoke-NSGetLSNSIPALGCallDataChannelBinding -Filter @{ servicetype = 'HTTP' }
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
        [string] $Callid,

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
            Type = 'lsnsipalgcall_datachannel_binding'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Callid
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNSIPALGCallDataChannelBinding

# region Invoke-NSGetLSNSIPALGProfile
function Invoke-NSGetLSNSIPALGProfile {
    <#
    .SYNOPSIS
        Gets NetScaler lsnsipalgprofile configuration.
    .DESCRIPTION
        Configuration for LSN SIPALG Profile resource.
    .PARAMETER SIPAlgProfileName
        The name of the SIPALG Profile. Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNSIPALGProfile
    .EXAMPLE
        Invoke-NSGetLSNSIPALGProfile -SIPAlgProfileName 'lsnsipalgprofile_example'
    .EXAMPLE
        Invoke-NSGetLSNSIPALGProfile -Filter @{ servicetype = 'HTTP' }
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
        [string] $SIPAlgProfileName,

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
            Type = 'lsnsipalgprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $SIPAlgProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNSIPALGProfile

# region Invoke-NSGetLSNStatic
function Invoke-NSGetLSNStatic {
    <#
    .SYNOPSIS
        Gets NetScaler lsnstatic configuration.
    .DESCRIPTION
        Configuration for static mapping resource.
    .PARAMETER Name
        Name for the LSN static mapping entry. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn static1" or 'lsn static1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER NatType
        Type of sessions to be displayed. Possible values = NAT44, DS-Lite, NAT64
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
        Invoke-NSGetLSNStatic
    .EXAMPLE
        Invoke-NSGetLSNStatic -Name 'lsnstatic_example'
    .EXAMPLE
        Invoke-NSGetLSNStatic -Filter @{ servicetype = 'HTTP' }
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

        [Parameter(ParameterSetName = 'All')]
        [ValidateSet('NAT44', 'DS-Lite', 'NAT64')]
        [string] $NatType,

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
        if ($PSBoundParameters.ContainsKey('NatType')) {
            $argumentValue = $NatType
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nattype:' + $argumentValue
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
            Type = 'lsnstatic'
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
# endregion Invoke-NSGetLSNStatic

# region Invoke-NSGetLSNTransportProfile
function Invoke-NSGetLSNTransportProfile {
    <#
    .SYNOPSIS
        Gets NetScaler lsntransportprofile configuration.
    .DESCRIPTION
        Configuration for LSN Transport Profile resource.
    .PARAMETER TransPortProfileName
        Name for the LSN transport profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN transport profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn transport profile1" or 'lsn transport profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSGetLSNTransportProfile
    .EXAMPLE
        Invoke-NSGetLSNTransportProfile -TransPortProfileName 'lsntransportprofile_example'
    .EXAMPLE
        Invoke-NSGetLSNTransportProfile -Filter @{ servicetype = 'HTTP' }
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
        [string] $TransPortProfileName,

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
            Type = 'lsntransportprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $TransPortProfileName
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetLSNTransportProfile

# region Invoke-NSUnsetLSNAppsAttributes
function Invoke-NSUnsetLSNAppsAttributes {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnappsattributes resource properties.
    .DESCRIPTION
        Configuration for LSN Application Attributes resource.
    .PARAMETER Name
        Name for the LSN Application Port ATTRIBUTES. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER SessionTimeout
        Timeout, in seconds, for an idle LSN session. If an LSN session is idle for a time that exceeds this value, the Citrix ADC removes the session.This timeout does not apply for a TCP LSN session when a FIN or RST message is received from either of the endpoints. Default value: 30 Minimum value = 5 Maximum value = 600
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
        Invoke-NSUnsetLSNAppsAttributes -Name 'example' -SessionTimeout  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNAppsAttributes -Name 'example' -SessionTimeout  -WhatIf
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
        [switch] $SessionTimeout,

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
        if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $body['sessiontimeout'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear lsnappsattributes properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnappsattributes -Action unset -Payload @{ lsnappsattributes = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNAppsAttributes -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNAppsAttributes

# region Invoke-NSUnsetLSNAppsProfile
function Invoke-NSUnsetLSNAppsProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnappsprofile resource properties.
    .DESCRIPTION
        Configuration for LSN Application Profile resource.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Filtering
        Type of filter to apply to packets originating from external hosts. Consider an example of an LSN mapping that includes the mapping of subscriber IP:port (X:x), NAT IP:port (N:n), and external host IP:port (Y:y). Available options function as follows: * ENDPOINT INDEPENDENT - Filters out only packets not destined to the subscriber IP address and port X:x, regardless of the external host IP address and port source (Z:z). The Citrix ADC forwards any packets destined to X:x. In other words, sending packets from the subscriber to any external IP address is sufficient to allow packets from any external hosts to the subscriber. * ADDRESS DEPENDENT - Filters out packets not destined to subscriber IP address and port X:x. In addition, the ADC filters out packets from Y:y destined for the subscriber (X:x) if the client has not previously sent packets to Y:anyport (external port independent). In other words, receiving packets from a specific external host requires that the subscriber first send packets to that specific external host's IP address. * ADDRESS PORT DEPENDENT (the default) - Filters out packets not destined to subscriber IP address and port (X:x). In addition, the Citrix ADC filters out packets from Y:y destined for the subscriber (X:x) if the subscriber has not previously sent packets to Y:y. In other words, receiving packets from a specific external host requires that the subscriber first send packets first to that external IP address and port. Default value: ADDRESS-PORT-DEPENDENT Possible values = ENDPOINT-INDEPENDENT, ADDRESS-DEPENDENT, ADDRESS-PORT-DEPENDENT
    .PARAMETER Ippooling
        NAT IP address allocation options for sessions associated with the same subscriber. Available options function as follows: * Paired - The Citrix ADC allocates the same NAT IP address for all sessions associated with the same subscriber. When all the ports of a NAT IP address are used in LSN sessions (for same or multiple subscribers), the Citrix ADC ADC drops any new connection from the subscriber. * Random - The Citrix ADC allocates random NAT IP addresses, from the pool, for different sessions associated with the same subscriber. This parameter is applicable to dynamic NAT allocation only. Default value: RANDOM Possible values = PAIRED, RANDOM
    .PARAMETER L2info
        Enable l2info by creating natpcbs for LSN, which enables the Citrix ADC to use L2CONN/MBF with LSN. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Mapping
        Type of LSN mapping to apply to subsequent packets originating from the same subscriber IP address and port. Consider an example of an LSN mapping that includes the mapping of the subscriber IP:port (X:x), NAT IP:port (N:n), and external host IP:port (Y:y). Available options function as follows: * ENDPOINT-INDEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same subscriber IP address and port (X:x) to any external IP address and port. * ADDRESS-DEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same subscriber IP address and port (X:x) to the same external IP address (Y), regardless of the external port. * ADDRESS-PORT-DEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same internal IP address and port (X:x) to the same external IP address and port (Y:y) while the mapping is still active. Default value: ADDRESS-PORT-DEPENDENT Possible values = ENDPOINT-INDEPENDENT, ADDRESS-DEPENDENT, ADDRESS-PORT-DEPENDENT
    .PARAMETER TCPProxy
        Enable TCP proxy, which enables the Citrix ADC to optimize the TCP traffic by using Layer 4 features. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER TrafficDomain
        ID of the traffic domain through which the Citrix ADC sends the outbound traffic after performing LSN. If you do not specify an ID, the ADC sends the outbound traffic through the default traffic domain, which has an ID of 0. Default value: 4095
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
        Invoke-NSUnsetLSNAppsProfile -AppsProfileName 'example' -Filtering ENDPOINT-INDEPENDENT -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNAppsProfile -AppsProfileName 'example' -Filtering ENDPOINT-INDEPENDENT -WhatIf
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
        [string] $AppsProfileName,

        [Parameter()]
        [ValidateSet('ENDPOINT-INDEPENDENT', 'ADDRESS-DEPENDENT', 'ADDRESS-PORT-DEPENDENT')]
        [switch] $Filtering,

        [Parameter()]
        [ValidateSet('PAIRED', 'RANDOM')]
        [switch] $Ippooling,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $L2info,

        [Parameter()]
        [ValidateSet('ENDPOINT-INDEPENDENT', 'ADDRESS-DEPENDENT', 'ADDRESS-PORT-DEPENDENT')]
        [switch] $Mapping,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $TCPProxy,

        [Parameter()]
        [switch] $TrafficDomain,

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

        $body = @{ appsprofilename = $AppsProfileName }
        if ($PSBoundParameters.ContainsKey('Filtering')) { $body['filtering'] = $true }
        if ($PSBoundParameters.ContainsKey('Ippooling')) { $body['ippooling'] = $true }
        if ($PSBoundParameters.ContainsKey('L2info')) { $body['l2info'] = $true }
        if ($PSBoundParameters.ContainsKey('Mapping')) { $body['mapping'] = $true }
        if ($PSBoundParameters.ContainsKey('TCPProxy')) { $body['tcpproxy'] = $true }
        if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $body['td'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Clear lsnappsprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnappsprofile -Action unset -Payload @{ lsnappsprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNAppsProfile -AppsProfileName $AppsProfileName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNAppsProfile

# region Invoke-NSUnsetLSNGroup
function Invoke-NSUnsetLSNGroup {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsngroup resource properties.
    .DESCRIPTION
        Configuration for LSN group resource.
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Ftp
        Enable Application Layer Gateway (ALG) for the FTP protocol. For some application-layer protocols, the IP addresses and protocol port numbers are usually communicated in the packet's payload. When acting as an ALG, the Citrix ADC changes the packet's payload to ensure that the protocol continues to work over LSN. Note: The Citrix ADC also includes ALG for ICMP and TFTP protocols. ALG for the ICMP protocol is enabled by default, and there is no provision to disable it. ALG for the TFTP protocol is disabled by default. ALG is enabled automatically for an LSN group when you bind a UDP LSN application profile, with endpoint-independent-mapping, endpoint-independent filtering, and destination port as 69 (well-known port for TFTP), to the LSN group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ftpcm
        Enable the FTP connection mirroring for specified LSN group. Connection mirroring (CM or connection failover) refers to keeping active an established TCP or UDP connection when a failover occurs. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logging
        Log mapping entries and sessions created or deleted for this LSN group. The Citrix ADC logs LSN sessions for this LSN group only when both logging and session logging parameters are enabled. The ADC uses its existing syslog and audit log framework to log LSN information. You must enable global level LSN logging by enabling the LSN parameter in the related NSLOG action and SYLOG action entities. When the Logging parameter is enabled, the Citrix ADC generates log messages related to LSN mappings and LSN sessions of this LSN group. The ADC then sends these log messages to servers associated with the NSLOG action and SYSLOG actions entities. A log message for an LSN mapping entry consists of the following information: * NSIP address of the Citrix ADC * Time stamp * Entry type (MAPPING or SESSION) * Whether the LSN mapping entry is created or deleted * Subscriber's IP address, port, and traffic domain ID * NAT IP address and port * Protocol name * Destination IP address, port, and traffic domain ID might be present, depending on the following conditions: ** Destination IP address and port are not logged for Endpoint-Independent mapping ** Only Destination IP address (and not port) is logged for Address-Dependent mapping ** Destination IP address and port are logged for Address-Port-Dependent mapping. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortBlocksize
        Size of the NAT port block to be allocated for each subscriber. To set this parameter for Dynamic NAT, you must enable the port block allocation parameter in the bound LSN pool. For Deterministic NAT, the port block allocation parameter is always enabled, and you cannot disable it. In Dynamic NAT, the Citrix ADC allocates a random NAT port block, from the available NAT port pool of an NAT IP address, for each subscriber. For a subscriber, if all the ports are allocated from the subscriber's allocated port block, the ADC allocates a new random port block for the subscriber. The default port block size is 256 for Deterministic NAT, and 0 for Dynamic NAT. Default value: 0 Minimum value = 256 Maximum value = 65536
    .PARAMETER Pptp
        Enable the PPTP Application Layer Gateway. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Rtspalg
        Enable the RTSP ALG. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Sessionlogging
        Log sessions created or deleted for the LSN group. The Citrix ADC logs LSN sessions for this LSN group only when both logging and session logging parameters are enabled. A log message for an LSN session consists of the following information: * NSIP address of the Citrix ADC * Time stamp * Entry type (MAPPING or SESSION) * Whether the LSN session is created or removed * Subscriber's IP address, port, and traffic domain ID * NAT IP address and port * Protocol name * Destination IP address, port, and traffic domain ID. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Sessionsync
        In a high availability (HA) deployment, synchronize information of all LSN sessions related to this LSN group with the secondary node. After a failover, established TCP connections and UDP packet flows are kept active and resumed on the secondary node (new primary). For this setting to work, you must enable the global session synchronization parameter. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SIPAlg
        Enable the SIP ALG. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPTrapLimit
        Maximum number of SNMP Trap messages that can be generated for the LSN group in one minute. Default value: 100 Minimum value = 0 Maximum value = 10000
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
        Invoke-NSUnsetLSNGroup -GroupName 'example' -Ftp ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNGroup -GroupName 'example' -Ftp ENABLED -WhatIf
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
        [string] $GroupName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Ftp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Ftpcm,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Logging,

        [Parameter()]
        [switch] $PortBlocksize,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Pptp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Rtspalg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Sessionlogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Sessionsync,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $SIPAlg,

        [Parameter()]
        [switch] $SNMPTrapLimit,

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

        $body = @{ groupname = $GroupName }
        if ($PSBoundParameters.ContainsKey('Ftp')) { $body['ftp'] = $true }
        if ($PSBoundParameters.ContainsKey('Ftpcm')) { $body['ftpcm'] = $true }
        if ($PSBoundParameters.ContainsKey('Logging')) { $body['logging'] = $true }
        if ($PSBoundParameters.ContainsKey('PortBlocksize')) { $body['portblocksize'] = $true }
        if ($PSBoundParameters.ContainsKey('Pptp')) { $body['pptp'] = $true }
        if ($PSBoundParameters.ContainsKey('Rtspalg')) { $body['rtspalg'] = $true }
        if ($PSBoundParameters.ContainsKey('Sessionlogging')) { $body['sessionlogging'] = $true }
        if ($PSBoundParameters.ContainsKey('Sessionsync')) { $body['sessionsync'] = $true }
        if ($PSBoundParameters.ContainsKey('SIPAlg')) { $body['sipalg'] = $true }
        if ($PSBoundParameters.ContainsKey('SNMPTrapLimit')) { $body['snmptraplimit'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$GroupName", 'Clear lsngroup properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsngroup -Action unset -Payload @{ lsngroup = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNGroup -GroupName $GroupName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNGroup

# region Invoke-NSUnsetLSNHTTPHeaderLogProfile
function Invoke-NSUnsetLSNHTTPHeaderLogProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnhttphdrlogprofile resource properties.
    .DESCRIPTION
        Configuration for LSN HTTP header logging Profile resource.
    .PARAMETER HTTPHdrlogProfileName
        The name of the HTTP header logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER LogHost
        Host information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogMethod
        HTTP method information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogURL
        URL information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logversion
        Version information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'example' -LogHost ENABLED -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'example' -LogHost ENABLED -WhatIf
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
        [string] $HTTPHdrlogProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $LogHost,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $LogMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $LogURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Logversion,

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

        $body = @{ httphdrlogprofilename = $HTTPHdrlogProfileName }
        if ($PSBoundParameters.ContainsKey('LogHost')) { $body['loghost'] = $true }
        if ($PSBoundParameters.ContainsKey('LogMethod')) { $body['logmethod'] = $true }
        if ($PSBoundParameters.ContainsKey('LogURL')) { $body['logurl'] = $true }
        if ($PSBoundParameters.ContainsKey('Logversion')) { $body['logversion'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$HTTPHdrlogProfileName", 'Clear lsnhttphdrlogprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnhttphdrlogprofile -Action unset -Payload @{ lsnhttphdrlogprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName $HTTPHdrlogProfileName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNHTTPHeaderLogProfile

# region Invoke-NSUnsetLSNLogProfile
function Invoke-NSUnsetLSNLogProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnlogprofile resource properties.
    .DESCRIPTION
        Configuration for LSN logging Profile resource.
    .PARAMETER LogProfileName
        The name of the logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER AnalyticsProfile
        Name of the Analytics Profile attached to this lsn profile.
    .PARAMETER Logcompact
        Logs in Compact Logging format if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logipfix
        Logs in IPFIX format if option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logsessdeletion
        LSN Session deletion will not be logged if disabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logsubscrinfo
        Subscriber ID information is logged if option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetLSNLogProfile -LogProfileName 'example' -AnalyticsProfile  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNLogProfile -LogProfileName 'example' -AnalyticsProfile  -WhatIf
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
        [string] $LogProfileName,

        [Parameter()]
        [switch] $AnalyticsProfile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Logcompact,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Logipfix,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Logsessdeletion,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Logsubscrinfo,

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

        $body = @{ logprofilename = $LogProfileName }
        if ($PSBoundParameters.ContainsKey('AnalyticsProfile')) { $body['analyticsprofile'] = $true }
        if ($PSBoundParameters.ContainsKey('Logcompact')) { $body['logcompact'] = $true }
        if ($PSBoundParameters.ContainsKey('Logipfix')) { $body['logipfix'] = $true }
        if ($PSBoundParameters.ContainsKey('Logsessdeletion')) { $body['logsessdeletion'] = $true }
        if ($PSBoundParameters.ContainsKey('Logsubscrinfo')) { $body['logsubscrinfo'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$LogProfileName", 'Clear lsnlogprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnlogprofile -Action unset -Payload @{ lsnlogprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNLogProfile -LogProfileName $LogProfileName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNLogProfile

# region Invoke-NSUnsetLsnparameter
function Invoke-NSUnsetLsnparameter {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnparameter resource properties.
    .DESCRIPTION
        Configuration for LSN parameter resource.
    .PARAMETER Memlimit
        Amount of Citrix ADC memory to reserve for the LSN feature, in multiples of 2MB. Note: If you later reduce the value of this parameter, the amount of active memory is not reduced. Changing the configured memory limit can only increase the amount of active memory. This command is deprecated, use 'set extendedmemoryparam -memlimit' instead.
    .PARAMETER Sessionsync
        Synchronize all LSN sessions with the secondary node in a high availability (HA) deployment (global synchronization). After a failover, established TCP connections and UDP packet flows are kept active and resumed on the secondary node (new primary). The global session synchronization parameter and session synchronization parameters (group level) of all LSN groups are enabled by default. For a group, when both the global level and the group level LSN session synchronization parameters are enabled, the primary node synchronizes information of all LSN sessions related to this LSN group with the secondary node. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscrsessionremoval
        LSN global setting for controlling subscriber aware session removal, when this is enabled, when ever the subscriber info is deleted from subscriber database, sessions corresponding to that subscriber will be removed. if this setting is disabled, subscriber sessions will be timed out as per the idle time out settings. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUnsetLsnparameter -Memlimit  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLsnparameter -Memlimit  -WhatIf
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
        [switch] $Memlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Sessionsync,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Subscrsessionremoval,

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
        if ($PSBoundParameters.ContainsKey('Memlimit')) { $body['memlimit'] = $true }
        if ($PSBoundParameters.ContainsKey('Sessionsync')) { $body['sessionsync'] = $true }
        if ($PSBoundParameters.ContainsKey('Subscrsessionremoval')) { $body['subscrsessionremoval'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('lsnparameter', 'Clear lsnparameter properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnparameter -Action unset -Payload @{ lsnparameter = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLsnparameter

# region Invoke-NSUnsetLSNPool
function Invoke-NSUnsetLSNPool {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnpool resource properties.
    .DESCRIPTION
        Configuration for LSN pool resource.
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
    .PARAMETER MaxPortRealloctmq
        Maximum number of ports for which the port reallocation timeout applies for each NAT IP address. In other words, the maximum deallocated-port queue size for which the reallocation timeout applies for each NAT IP address. When the queue size is full, the next port deallocated is reallocated immediately for a new LSN session. Default value: 65536 Minimum value = 0 Maximum value = 65536
    .PARAMETER PortReallocTimeout
        The waiting time, in seconds, between deallocating LSN NAT ports (when an LSN mapping is removed) and reallocating them for a new LSN session. This parameter is necessary in order to prevent collisions between old and new mappings and sessions. It ensures that all established sessions are broken instead of redirected to a different subscriber. This is not applicable for ports used in: * Deterministic NAT * Address-Dependent filtering and Address-Port-Dependent filtering * Dynamic NAT with port block allocation In these cases, ports are immediately reallocated. Default value: 0 Minimum value = 0 Maximum value = 600
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
        Invoke-NSUnsetLSNPool -PoolName 'example' -MaxPortRealloctmq  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNPool -PoolName 'example' -MaxPortRealloctmq  -WhatIf
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
        [string] $PoolName,

        [Parameter()]
        [switch] $MaxPortRealloctmq,

        [Parameter()]
        [switch] $PortReallocTimeout,

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

        $body = @{ poolname = $PoolName }
        if ($PSBoundParameters.ContainsKey('MaxPortRealloctmq')) { $body['maxportrealloctmq'] = $true }
        if ($PSBoundParameters.ContainsKey('PortReallocTimeout')) { $body['portrealloctimeout'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$PoolName", 'Clear lsnpool properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnpool -Action unset -Payload @{ lsnpool = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNPool -PoolName $PoolName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNPool

# region Invoke-NSUnsetLSNRTSPALGProfile
function Invoke-NSUnsetLSNRTSPALGProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnrtspalgprofile resource properties.
    .DESCRIPTION
        Configuration for LSN RTSPALG Profile resource.
    .PARAMETER RtspalgProfileName
        The name of the RTSPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER RtspidleTimeout
        Idle timeout for the rtsp sessions in seconds. Default value: 120
    .PARAMETER RtspPortRange
        port for the RTSP.
    .PARAMETER RtsptransPortProtocol
        RTSP ALG Profile transport protocol type. Default value: TCP Possible values = TCP, UDP
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
        Invoke-NSUnsetLSNRTSPALGProfile -RtspalgProfileName 'example' -RtspidleTimeout  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNRTSPALGProfile -RtspalgProfileName 'example' -RtspidleTimeout  -WhatIf
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
        [string] $RtspalgProfileName,

        [Parameter()]
        [switch] $RtspidleTimeout,

        [Parameter()]
        [switch] $RtspPortRange,

        [Parameter()]
        [ValidateSet('TCP', 'UDP')]
        [switch] $RtsptransPortProtocol,

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

        $body = @{ rtspalgprofilename = $RtspalgProfileName }
        if ($PSBoundParameters.ContainsKey('RtspidleTimeout')) { $body['rtspidletimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('RtspPortRange')) { $body['rtspportrange'] = $true }
        if ($PSBoundParameters.ContainsKey('RtsptransPortProtocol')) { $body['rtsptransportprotocol'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$RtspalgProfileName", 'Clear lsnrtspalgprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnrtspalgprofile -Action unset -Payload @{ lsnrtspalgprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNRTSPALGProfile -RtspalgProfileName $RtspalgProfileName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNRTSPALGProfile

# region Invoke-NSUnsetLSNSIPALGProfile
function Invoke-NSUnsetLSNSIPALGProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsnsipalgprofile resource properties.
    .DESCRIPTION
        Configuration for LSN SIPALG Profile resource.
    .PARAMETER SIPAlgProfileName
        The name of the SIPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER DataSessionidleTimeout
        Idle timeout for the data channel sessions in seconds. Default value: 120
    .PARAMETER Opencontactpinhole
        ENABLE/DISABLE ContactPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER OpenRecordRoutepinhole
        ENABLE/DISABLE RecordRoutePinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Openregisterpinhole
        ENABLE/DISABLE RegisterPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Openroutepinhole
        ENABLE/DISABLE RoutePinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER OpenviAPINhole
        ENABLE/DISABLE ViaPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER RegistrationTimeout
        SIP registration timeout in seconds. Default value: 60
    .PARAMETER RPort
        ENABLE/DISABLE rport. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SIPDstPortRange
        Destination port range for SIP_UDP and SIP_TCP.
    .PARAMETER SIPSessionTimeout
        SIP control channel session timeout in seconds. Default value: 600
    .PARAMETER SIPSrcPortRange
        Source port range for SIP_UDP and SIP_TCP.
    .PARAMETER SIPTransPortProtocol
        SIP ALG Profile transport protocol type. Possible values = TCP, UDP
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
        Invoke-NSUnsetLSNSIPALGProfile -SIPAlgProfileName 'example' -DataSessionidleTimeout  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNSIPALGProfile -SIPAlgProfileName 'example' -DataSessionidleTimeout  -WhatIf
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
        [string] $SIPAlgProfileName,

        [Parameter()]
        [switch] $DataSessionidleTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Opencontactpinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $OpenRecordRoutepinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Openregisterpinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Openroutepinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $OpenviAPINhole,

        [Parameter()]
        [switch] $RegistrationTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $RPort,

        [Parameter()]
        [switch] $SIPDstPortRange,

        [Parameter()]
        [switch] $SIPSessionTimeout,

        [Parameter()]
        [switch] $SIPSrcPortRange,

        [Parameter()]
        [ValidateSet('TCP', 'UDP')]
        [switch] $SIPTransPortProtocol,

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

        $body = @{ sipalgprofilename = $SIPAlgProfileName }
        if ($PSBoundParameters.ContainsKey('DataSessionidleTimeout')) { $body['datasessionidletimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Opencontactpinhole')) { $body['opencontactpinhole'] = $true }
        if ($PSBoundParameters.ContainsKey('OpenRecordRoutepinhole')) { $body['openrecordroutepinhole'] = $true }
        if ($PSBoundParameters.ContainsKey('Openregisterpinhole')) { $body['openregisterpinhole'] = $true }
        if ($PSBoundParameters.ContainsKey('Openroutepinhole')) { $body['openroutepinhole'] = $true }
        if ($PSBoundParameters.ContainsKey('OpenviAPINhole')) { $body['openviapinhole'] = $true }
        if ($PSBoundParameters.ContainsKey('RegistrationTimeout')) { $body['registrationtimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('RPort')) { $body['rport'] = $true }
        if ($PSBoundParameters.ContainsKey('SIPDstPortRange')) { $body['sipdstportrange'] = $true }
        if ($PSBoundParameters.ContainsKey('SIPSessionTimeout')) { $body['sipsessiontimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('SIPSrcPortRange')) { $body['sipsrcportrange'] = $true }
        if ($PSBoundParameters.ContainsKey('SIPTransPortProtocol')) { $body['siptransportprotocol'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$SIPAlgProfileName", 'Clear lsnsipalgprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsnsipalgprofile -Action unset -Payload @{ lsnsipalgprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNSIPALGProfile -SIPAlgProfileName $SIPAlgProfileName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNSIPALGProfile

# region Invoke-NSUnsetLSNTransportProfile
function Invoke-NSUnsetLSNTransportProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler lsntransportprofile resource properties.
    .DESCRIPTION
        Configuration for LSN Transport Profile resource.
    .PARAMETER TransPortProfileName
        Name for the LSN transport profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN transport profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn transport profile1" or 'lsn transport profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER FinrstTimeout
        Timeout, in seconds, for a TCP LSN session after a FIN or RST message is received from one of the endpoints. If a TCP LSN session is idle (after the Citrix ADC receives a FIN or RST message) for a time that exceeds this value, the Citrix ADC ADC removes the session. Since the LSN feature of the Citrix ADC does not maintain state information of any TCP LSN sessions, this timeout accommodates the transmission of the FIN or RST, and ACK messages from the other endpoint so that both endpoints can properly close the connection. Default value: 30
    .PARAMETER GroupSessionlimit
        Maximum number of concurrent LSN sessions(for the specified protocol) allowed for all subscriber of a group to which this profile has bound. This limit will get split across the Citrix ADCs packet engines and rounded down. When the number of LSN sessions reaches the limit for a group in packet engine, the Citrix ADC does not allow the subscriber of that group to open additional sessions through that packet engine. Default value: 0
    .PARAMETER PortPreserveparity
        Enable port parity between a subscriber port and its mapped LSN NAT port. For example, if a subscriber initiates a connection from an odd numbered port, the Citrix ADC allocates an odd numbered LSN NAT port for this connection. You must set this parameter for proper functioning of protocols that require the source port to be even or odd numbered, for example, in peer-to-peer applications that use RTP or RTCP protocol. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortPreServerAnge
        If a subscriber initiates a connection from a well-known port (0-1023), allocate a NAT port from the well-known port range (0-1023) for this connection. For example, if a subscriber initiates a connection from port 80, the Citrix ADC can allocate port 100 as the NAT port for this connection. This parameter applies to dynamic NAT without port block allocation. It also applies to Deterministic NAT if the range of ports allocated includes well-known ports. When all the well-known ports of all the available NAT IP addresses are used in different subscriber's connections (LSN sessions), and a subscriber initiates a connection from a well-known port, the Citrix ADC drops this connection. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortQuota
        Maximum number of LSN NAT ports to be used at a time by each subscriber for the specified protocol. For example, each subscriber can be limited to a maximum of 500 TCP NAT ports. When the LSN NAT mappings for a subscriber reach the limit, the Citrix ADC does not allocate additional NAT ports for that subscriber. Default value: 0 Minimum value = 0 Maximum value = 65535
    .PARAMETER Sessionquota
        Maximum number of concurrent LSN sessions allowed for each subscriber for the specified protocol. When the number of LSN sessions reaches the limit for a subscriber, the Citrix ADC does not allow the subscriber to open additional sessions. Default value: 0 Minimum value = 0 Maximum value = 65535
    .PARAMETER SessionTimeout
        Timeout, in seconds, for an idle LSN session. If an LSN session is idle for a time that exceeds this value, the Citrix ADC removes the session. This timeout does not apply for a TCP LSN session when a FIN or RST message is received from either of the endpoints. . Default value: 120 Minimum value = 60
    .PARAMETER StunTimeout
        STUN protocol timeout. Default value: 600 Minimum value = 120 Maximum value = 1200
    .PARAMETER Syncheck
        Silently drop any non-SYN packets for connections for which there is no LSN-NAT session present on the Citrix ADC. If you disable this parameter, the Citrix ADC accepts any non-SYN packets and creates a new LSN session entry for this connection. Following are some reasons for the Citrix ADC to receive such packets: * LSN session for a connection existed but the Citrix ADC removed this session because the LSN session was idle for a time that exceeded the configured session timeout. * Such packets can be a part of a DoS attack. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SynidleTimeout
        SYN Idle timeout. Default value: 60 Minimum value = 30 Maximum value = 120
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
        Invoke-NSUnsetLSNTransportProfile -TransPortProfileName 'example' -FinrstTimeout  -PassThru
    .EXAMPLE
        Invoke-NSUnsetLSNTransportProfile -TransPortProfileName 'example' -FinrstTimeout  -WhatIf
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
        [string] $TransPortProfileName,

        [Parameter()]
        [switch] $FinrstTimeout,

        [Parameter()]
        [switch] $GroupSessionlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $PortPreserveparity,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $PortPreServerAnge,

        [Parameter()]
        [switch] $PortQuota,

        [Parameter()]
        [switch] $Sessionquota,

        [Parameter()]
        [switch] $SessionTimeout,

        [Parameter()]
        [switch] $StunTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [switch] $Syncheck,

        [Parameter()]
        [switch] $SynidleTimeout,

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

        $body = @{ transportprofilename = $TransPortProfileName }
        if ($PSBoundParameters.ContainsKey('FinrstTimeout')) { $body['finrsttimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('GroupSessionlimit')) { $body['groupsessionlimit'] = $true }
        if ($PSBoundParameters.ContainsKey('PortPreserveparity')) { $body['portpreserveparity'] = $true }
        if ($PSBoundParameters.ContainsKey('PortPreServerAnge')) { $body['portpreserverange'] = $true }
        if ($PSBoundParameters.ContainsKey('PortQuota')) { $body['portquota'] = $true }
        if ($PSBoundParameters.ContainsKey('Sessionquota')) { $body['sessionquota'] = $true }
        if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $body['sessiontimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('StunTimeout')) { $body['stuntimeout'] = $true }
        if ($PSBoundParameters.ContainsKey('Syncheck')) { $body['syncheck'] = $true }
        if ($PSBoundParameters.ContainsKey('SynidleTimeout')) { $body['synidletimeout'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$TransPortProfileName", 'Clear lsntransportprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type lsntransportprofile -Action unset -Payload @{ lsntransportprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetLSNTransportProfile -TransPortProfileName $TransPortProfileName -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetLSNTransportProfile

# region Invoke-NSUpdateLSNAppsAttributes
function Invoke-NSUpdateLSNAppsAttributes {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnappsattributes resource.
    .DESCRIPTION
        Configuration for LSN Application Attributes resource.
    .PARAMETER Name
        Name for the LSN Application Port ATTRIBUTES. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER SessionTimeout
        Timeout, in seconds, for an idle LSN session. If an LSN session is idle for a time that exceeds this value, the Citrix ADC removes the session.This timeout does not apply for a TCP LSN session when a FIN or RST message is received from either of the endpoints. Default value: 30 Minimum value = 5 Maximum value = 600
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
        Invoke-NSUpdateLSNAppsAttributes -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNAppsAttributes -Name 'example' -WhatIf
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

        [Parameter()]
        [int] $SessionTimeout,

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
    if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $properties['sessiontimeout'] = $SessionTimeout }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update lsnappsattributes')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnappsattributes -Payload @{ lsnappsattributes = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNAppsAttributes -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNAppsAttributes

# region Invoke-NSUpdateLSNAppsProfile
function Invoke-NSUpdateLSNAppsProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnappsprofile resource.
    .DESCRIPTION
        Configuration for LSN Application Profile resource.
    .PARAMETER AppsProfileName
        Name for the LSN application profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN application profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn application profile1" or 'lsn application profile1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Filtering
        Type of filter to apply to packets originating from external hosts. Consider an example of an LSN mapping that includes the mapping of subscriber IP:port (X:x), NAT IP:port (N:n), and external host IP:port (Y:y). Available options function as follows: * ENDPOINT INDEPENDENT - Filters out only packets not destined to the subscriber IP address and port X:x, regardless of the external host IP address and port source (Z:z). The Citrix ADC forwards any packets destined to X:x. In other words, sending packets from the subscriber to any external IP address is sufficient to allow packets from any external hosts to the subscriber. * ADDRESS DEPENDENT - Filters out packets not destined to subscriber IP address and port X:x. In addition, the ADC filters out packets from Y:y destined for the subscriber (X:x) if the client has not previously sent packets to Y:anyport (external port independent). In other words, receiving packets from a specific external host requires that the subscriber first send packets to that specific external host's IP address. * ADDRESS PORT DEPENDENT (the default) - Filters out packets not destined to subscriber IP address and port (X:x). In addition, the Citrix ADC filters out packets from Y:y destined for the subscriber (X:x) if the subscriber has not previously sent packets to Y:y. In other words, receiving packets from a specific external host requires that the subscriber first send packets first to that external IP address and port. Default value: ADDRESS-PORT-DEPENDENT Possible values = ENDPOINT-INDEPENDENT, ADDRESS-DEPENDENT, ADDRESS-PORT-DEPENDENT
    .PARAMETER Ippooling
        NAT IP address allocation options for sessions associated with the same subscriber. Available options function as follows: * Paired - The Citrix ADC allocates the same NAT IP address for all sessions associated with the same subscriber. When all the ports of a NAT IP address are used in LSN sessions (for same or multiple subscribers), the Citrix ADC ADC drops any new connection from the subscriber. * Random - The Citrix ADC allocates random NAT IP addresses, from the pool, for different sessions associated with the same subscriber. This parameter is applicable to dynamic NAT allocation only. Default value: RANDOM Possible values = PAIRED, RANDOM
    .PARAMETER L2info
        Enable l2info by creating natpcbs for LSN, which enables the Citrix ADC to use L2CONN/MBF with LSN. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Mapping
        Type of LSN mapping to apply to subsequent packets originating from the same subscriber IP address and port. Consider an example of an LSN mapping that includes the mapping of the subscriber IP:port (X:x), NAT IP:port (N:n), and external host IP:port (Y:y). Available options function as follows: * ENDPOINT-INDEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same subscriber IP address and port (X:x) to any external IP address and port. * ADDRESS-DEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same subscriber IP address and port (X:x) to the same external IP address (Y), regardless of the external port. * ADDRESS-PORT-DEPENDENT - Reuse the LSN mapping for subsequent packets sent from the same internal IP address and port (X:x) to the same external IP address and port (Y:y) while the mapping is still active. Default value: ADDRESS-PORT-DEPENDENT Possible values = ENDPOINT-INDEPENDENT, ADDRESS-DEPENDENT, ADDRESS-PORT-DEPENDENT
    .PARAMETER TCPProxy
        Enable TCP proxy, which enables the Citrix ADC to optimize the TCP traffic by using Layer 4 features. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER TrafficDomain
        ID of the traffic domain through which the Citrix ADC sends the outbound traffic after performing LSN. If you do not specify an ID, the ADC sends the outbound traffic through the default traffic domain, which has an ID of 0. Default value: 4095
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
        Invoke-NSUpdateLSNAppsProfile -AppsProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNAppsProfile -AppsProfileName 'example' -WhatIf
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
        [string] $AppsProfileName,

        [Parameter()]
        [ValidateSet('ENDPOINT-INDEPENDENT', 'ADDRESS-DEPENDENT', 'ADDRESS-PORT-DEPENDENT')]
        [string] $Filtering,

        [Parameter()]
        [ValidateSet('PAIRED', 'RANDOM')]
        [string] $Ippooling,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $L2info,

        [Parameter()]
        [ValidateSet('ENDPOINT-INDEPENDENT', 'ADDRESS-DEPENDENT', 'ADDRESS-PORT-DEPENDENT')]
        [string] $Mapping,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $TCPProxy,

        [Parameter()]
        [int] $TrafficDomain,

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
    if ($PSBoundParameters.ContainsKey('AppsProfileName')) { $properties['appsprofilename'] = $AppsProfileName }
    if ($PSBoundParameters.ContainsKey('Filtering')) { $properties['filtering'] = $Filtering }
    if ($PSBoundParameters.ContainsKey('Ippooling')) { $properties['ippooling'] = $Ippooling }
    if ($PSBoundParameters.ContainsKey('L2info')) { $properties['l2info'] = $L2info }
    if ($PSBoundParameters.ContainsKey('Mapping')) { $properties['mapping'] = $Mapping }
    if ($PSBoundParameters.ContainsKey('TCPProxy')) { $properties['tcpproxy'] = $TCPProxy }
    if ($PSBoundParameters.ContainsKey('TrafficDomain')) { $properties['td'] = $TrafficDomain }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$AppsProfileName", 'Update lsnappsprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnappsprofile -Payload @{ lsnappsprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNAppsProfile -AppsProfileName $AppsProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNAppsProfile

# region Invoke-NSUpdateLSNGroup
function Invoke-NSUpdateLSNGroup {
    <#
    .SYNOPSIS
        Updates a NetScaler lsngroup resource.
    .DESCRIPTION
        Configuration for LSN group resource.
    .PARAMETER Ftp
        Enable Application Layer Gateway (ALG) for the FTP protocol. For some application-layer protocols, the IP addresses and protocol port numbers are usually communicated in the packet's payload. When acting as an ALG, the Citrix ADC changes the packet's payload to ensure that the protocol continues to work over LSN. Note: The Citrix ADC also includes ALG for ICMP and TFTP protocols. ALG for the ICMP protocol is enabled by default, and there is no provision to disable it. ALG for the TFTP protocol is disabled by default. ALG is enabled automatically for an LSN group when you bind a UDP LSN application profile, with endpoint-independent-mapping, endpoint-independent filtering, and destination port as 69 (well-known port for TFTP), to the LSN group. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Ftpcm
        Enable the FTP connection mirroring for specified LSN group. Connection mirroring (CM or connection failover) refers to keeping active an established TCP or UDP connection when a failover occurs. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER GroupName
        Name for the LSN group. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN group is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn group1" or 'lsn group1'). Minimum length = 1 Maximum length = 127
    .PARAMETER Logging
        Log mapping entries and sessions created or deleted for this LSN group. The Citrix ADC logs LSN sessions for this LSN group only when both logging and session logging parameters are enabled. The ADC uses its existing syslog and audit log framework to log LSN information. You must enable global level LSN logging by enabling the LSN parameter in the related NSLOG action and SYLOG action entities. When the Logging parameter is enabled, the Citrix ADC generates log messages related to LSN mappings and LSN sessions of this LSN group. The ADC then sends these log messages to servers associated with the NSLOG action and SYSLOG actions entities. A log message for an LSN mapping entry consists of the following information: * NSIP address of the Citrix ADC * Time stamp * Entry type (MAPPING or SESSION) * Whether the LSN mapping entry is created or deleted * Subscriber's IP address, port, and traffic domain ID * NAT IP address and port * Protocol name * Destination IP address, port, and traffic domain ID might be present, depending on the following conditions: ** Destination IP address and port are not logged for Endpoint-Independent mapping ** Only Destination IP address (and not port) is logged for Address-Dependent mapping ** Destination IP address and port are logged for Address-Port-Dependent mapping. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortBlocksize
        Size of the NAT port block to be allocated for each subscriber. To set this parameter for Dynamic NAT, you must enable the port block allocation parameter in the bound LSN pool. For Deterministic NAT, the port block allocation parameter is always enabled, and you cannot disable it. In Dynamic NAT, the Citrix ADC allocates a random NAT port block, from the available NAT port pool of an NAT IP address, for each subscriber. For a subscriber, if all the ports are allocated from the subscriber's allocated port block, the ADC allocates a new random port block for the subscriber. The default port block size is 256 for Deterministic NAT, and 0 for Dynamic NAT. Default value: 0 Minimum value = 256 Maximum value = 65536
    .PARAMETER Pptp
        Enable the PPTP Application Layer Gateway. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Rtspalg
        Enable the RTSP ALG. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Sessionlogging
        Log sessions created or deleted for the LSN group. The Citrix ADC logs LSN sessions for this LSN group only when both logging and session logging parameters are enabled. A log message for an LSN session consists of the following information: * NSIP address of the Citrix ADC * Time stamp * Entry type (MAPPING or SESSION) * Whether the LSN session is created or removed * Subscriber's IP address, port, and traffic domain ID * NAT IP address and port * Protocol name * Destination IP address, port, and traffic domain ID. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER Sessionsync
        In a high availability (HA) deployment, synchronize information of all LSN sessions related to this LSN group with the secondary node. After a failover, established TCP connections and UDP packet flows are kept active and resumed on the secondary node (new primary). For this setting to work, you must enable the global session synchronization parameter. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SIPAlg
        Enable the SIP ALG. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER SNMPTrapLimit
        Maximum number of SNMP Trap messages that can be generated for the LSN group in one minute. Default value: 100 Minimum value = 0 Maximum value = 10000
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
        Invoke-NSUpdateLSNGroup -GroupName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNGroup -GroupName 'example' -WhatIf
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
        [string] $Ftp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Ftpcm,

        [Parameter(Mandatory, Position = 0)]
        [string] $GroupName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logging,

        [Parameter()]
        [int] $PortBlocksize,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Pptp,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Rtspalg,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Sessionlogging,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Sessionsync,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $SIPAlg,

        [Parameter()]
        [int] $SNMPTrapLimit,

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
    if ($PSBoundParameters.ContainsKey('Ftp')) { $properties['ftp'] = $Ftp }
    if ($PSBoundParameters.ContainsKey('Ftpcm')) { $properties['ftpcm'] = $Ftpcm }
    if ($PSBoundParameters.ContainsKey('GroupName')) { $properties['groupname'] = $GroupName }
    if ($PSBoundParameters.ContainsKey('Logging')) { $properties['logging'] = $Logging }
    if ($PSBoundParameters.ContainsKey('PortBlocksize')) { $properties['portblocksize'] = $PortBlocksize }
    if ($PSBoundParameters.ContainsKey('Pptp')) { $properties['pptp'] = $Pptp }
    if ($PSBoundParameters.ContainsKey('Rtspalg')) { $properties['rtspalg'] = $Rtspalg }
    if ($PSBoundParameters.ContainsKey('Sessionlogging')) { $properties['sessionlogging'] = $Sessionlogging }
    if ($PSBoundParameters.ContainsKey('Sessionsync')) { $properties['sessionsync'] = $Sessionsync }
    if ($PSBoundParameters.ContainsKey('SIPAlg')) { $properties['sipalg'] = $SIPAlg }
    if ($PSBoundParameters.ContainsKey('SNMPTrapLimit')) { $properties['snmptraplimit'] = $SNMPTrapLimit }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$GroupName", 'Update lsngroup')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsngroup -Payload @{ lsngroup = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNGroup -GroupName $GroupName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNGroup

# region Invoke-NSUpdateLSNHTTPHeaderLogProfile
function Invoke-NSUpdateLSNHTTPHeaderLogProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnhttphdrlogprofile resource.
    .DESCRIPTION
        Configuration for LSN HTTP header logging Profile resource.
    .PARAMETER HTTPHdrlogProfileName
        The name of the HTTP header logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER LogHost
        Host information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogMethod
        HTTP method information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogURL
        URL information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logversion
        Version information is logged if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName 'example' -WhatIf
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
        [string] $HTTPHdrlogProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LogHost,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LogMethod,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $LogURL,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logversion,

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
    if ($PSBoundParameters.ContainsKey('HTTPHdrlogProfileName')) { $properties['httphdrlogprofilename'] = $HTTPHdrlogProfileName }
    if ($PSBoundParameters.ContainsKey('LogHost')) { $properties['loghost'] = $LogHost }
    if ($PSBoundParameters.ContainsKey('LogMethod')) { $properties['logmethod'] = $LogMethod }
    if ($PSBoundParameters.ContainsKey('LogURL')) { $properties['logurl'] = $LogURL }
    if ($PSBoundParameters.ContainsKey('Logversion')) { $properties['logversion'] = $Logversion }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$HTTPHdrlogProfileName", 'Update lsnhttphdrlogprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnhttphdrlogprofile -Payload @{ lsnhttphdrlogprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNHTTPHeaderLogProfile -HTTPHdrlogProfileName $HTTPHdrlogProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNHTTPHeaderLogProfile

# region Invoke-NSUpdateLSNLogProfile
function Invoke-NSUpdateLSNLogProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnlogprofile resource.
    .DESCRIPTION
        Configuration for LSN logging Profile resource.
    .PARAMETER AnalyticsProfile
        Name of the Analytics Profile attached to this lsn profile.
    .PARAMETER Logcompact
        Logs in Compact Logging format if option is enabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logipfix
        Logs in IPFIX format if option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER LogProfileName
        The name of the logging Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER Logsessdeletion
        LSN Session deletion will not be logged if disabled. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Logsubscrinfo
        Subscriber ID information is logged if option is enabled. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateLSNLogProfile -LogProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNLogProfile -LogProfileName 'example' -WhatIf
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
        [string] $AnalyticsProfile,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logcompact,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logipfix,

        [Parameter(Mandatory, Position = 0)]
        [string] $LogProfileName,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logsessdeletion,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Logsubscrinfo,

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
    if ($PSBoundParameters.ContainsKey('Logcompact')) { $properties['logcompact'] = $Logcompact }
    if ($PSBoundParameters.ContainsKey('Logipfix')) { $properties['logipfix'] = $Logipfix }
    if ($PSBoundParameters.ContainsKey('LogProfileName')) { $properties['logprofilename'] = $LogProfileName }
    if ($PSBoundParameters.ContainsKey('Logsessdeletion')) { $properties['logsessdeletion'] = $Logsessdeletion }
    if ($PSBoundParameters.ContainsKey('Logsubscrinfo')) { $properties['logsubscrinfo'] = $Logsubscrinfo }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$LogProfileName", 'Update lsnlogprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnlogprofile -Payload @{ lsnlogprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNLogProfile -LogProfileName $LogProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNLogProfile

# region Invoke-NSUpdateLsnparameter
function Invoke-NSUpdateLsnparameter {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnparameter resource.
    .DESCRIPTION
        Configuration for LSN parameter resource.
    .PARAMETER Memlimit
        Amount of Citrix ADC memory to reserve for the LSN feature, in multiples of 2MB. Note: If you later reduce the value of this parameter, the amount of active memory is not reduced. Changing the configured memory limit can only increase the amount of active memory. This command is deprecated, use 'set extendedmemoryparam -memlimit' instead.
    .PARAMETER Sessionsync
        Synchronize all LSN sessions with the secondary node in a high availability (HA) deployment (global synchronization). After a failover, established TCP connections and UDP packet flows are kept active and resumed on the secondary node (new primary). The global session synchronization parameter and session synchronization parameters (group level) of all LSN groups are enabled by default. For a group, when both the global level and the group level LSN session synchronization parameters are enabled, the primary node synchronizes information of all LSN sessions related to this LSN group with the secondary node. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Subscrsessionremoval
        LSN global setting for controlling subscriber aware session removal, when this is enabled, when ever the subscriber info is deleted from subscriber database, sessions corresponding to that subscriber will be removed. if this setting is disabled, subscriber sessions will be timed out as per the idle time out settings. Default value: DISABLED Possible values = ENABLED, DISABLED
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
        Invoke-NSUpdateLsnparameter  -PassThru
    .EXAMPLE
        Invoke-NSUpdateLsnparameter  -WhatIf
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
        [int] $Memlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Sessionsync,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Subscrsessionremoval,

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
    if ($PSBoundParameters.ContainsKey('Memlimit')) { $properties['memlimit'] = $Memlimit }
    if ($PSBoundParameters.ContainsKey('Sessionsync')) { $properties['sessionsync'] = $Sessionsync }
    if ($PSBoundParameters.ContainsKey('Subscrsessionremoval')) { $properties['subscrsessionremoval'] = $Subscrsessionremoval }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('lsnparameter', 'Update lsnparameter')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnparameter -Payload @{ lsnparameter = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateLsnparameter

# region Invoke-NSUpdateLSNPool
function Invoke-NSUpdateLSNPool {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnpool resource.
    .DESCRIPTION
        Configuration for LSN pool resource.
    .PARAMETER MaxPortRealloctmq
        Maximum number of ports for which the port reallocation timeout applies for each NAT IP address. In other words, the maximum deallocated-port queue size for which the reallocation timeout applies for each NAT IP address. When the queue size is full, the next port deallocated is reallocated immediately for a new LSN session. Default value: 65536 Minimum value = 0 Maximum value = 65536
    .PARAMETER PoolName
        Name for the LSN pool. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN pool is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn pool1" or 'lsn pool1'). Minimum length = 1 Maximum length = 127
    .PARAMETER PortReallocTimeout
        The waiting time, in seconds, between deallocating LSN NAT ports (when an LSN mapping is removed) and reallocating them for a new LSN session. This parameter is necessary in order to prevent collisions between old and new mappings and sessions. It ensures that all established sessions are broken instead of redirected to a different subscriber. This is not applicable for ports used in: * Deterministic NAT * Address-Dependent filtering and Address-Port-Dependent filtering * Dynamic NAT with port block allocation In these cases, ports are immediately reallocated. Default value: 0 Minimum value = 0 Maximum value = 600
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
        Invoke-NSUpdateLSNPool -PoolName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNPool -PoolName 'example' -WhatIf
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
        [int] $MaxPortRealloctmq,

        [Parameter(Mandatory, Position = 0)]
        [string] $PoolName,

        [Parameter()]
        [int] $PortReallocTimeout,

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
    if ($PSBoundParameters.ContainsKey('MaxPortRealloctmq')) { $properties['maxportrealloctmq'] = $MaxPortRealloctmq }
    if ($PSBoundParameters.ContainsKey('PoolName')) { $properties['poolname'] = $PoolName }
    if ($PSBoundParameters.ContainsKey('PortReallocTimeout')) { $properties['portrealloctimeout'] = $PortReallocTimeout }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$PoolName", 'Update lsnpool')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnpool -Payload @{ lsnpool = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNPool -PoolName $PoolName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNPool

# region Invoke-NSUpdateLSNRTSPALGProfile
function Invoke-NSUpdateLSNRTSPALGProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnrtspalgprofile resource.
    .DESCRIPTION
        Configuration for LSN RTSPALG Profile resource.
    .PARAMETER RtspalgProfileName
        The name of the RTSPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER RtspidleTimeout
        Idle timeout for the rtsp sessions in seconds. Default value: 120
    .PARAMETER RtspPortRange
        port for the RTSP.
    .PARAMETER RtsptransPortProtocol
        RTSP ALG Profile transport protocol type. Default value: TCP Possible values = TCP, UDP
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
        Invoke-NSUpdateLSNRTSPALGProfile -RtspalgProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNRTSPALGProfile -RtspalgProfileName 'example' -WhatIf
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
        [string] $RtspalgProfileName,

        [Parameter()]
        [int] $RtspidleTimeout,

        [Parameter()]
        [string] $RtspPortRange,

        [Parameter()]
        [ValidateSet('TCP', 'UDP')]
        [string] $RtsptransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('RtspalgProfileName')) { $properties['rtspalgprofilename'] = $RtspalgProfileName }
    if ($PSBoundParameters.ContainsKey('RtspidleTimeout')) { $properties['rtspidletimeout'] = $RtspidleTimeout }
    if ($PSBoundParameters.ContainsKey('RtspPortRange')) { $properties['rtspportrange'] = $RtspPortRange }
    if ($PSBoundParameters.ContainsKey('RtsptransPortProtocol')) { $properties['rtsptransportprotocol'] = $RtsptransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$RtspalgProfileName", 'Update lsnrtspalgprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnrtspalgprofile -Payload @{ lsnrtspalgprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNRTSPALGProfile -RtspalgProfileName $RtspalgProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNRTSPALGProfile

# region Invoke-NSUpdateLSNSIPALGProfile
function Invoke-NSUpdateLSNSIPALGProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler lsnsipalgprofile resource.
    .DESCRIPTION
        Configuration for LSN SIPALG Profile resource.
    .PARAMETER DataSessionidleTimeout
        Idle timeout for the data channel sessions in seconds. Default value: 120
    .PARAMETER Opencontactpinhole
        ENABLE/DISABLE ContactPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER OpenRecordRoutepinhole
        ENABLE/DISABLE RecordRoutePinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Openregisterpinhole
        ENABLE/DISABLE RegisterPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER Openroutepinhole
        ENABLE/DISABLE RoutePinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER OpenviAPINhole
        ENABLE/DISABLE ViaPinhole creation. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER RegistrationTimeout
        SIP registration timeout in seconds. Default value: 60
    .PARAMETER RPort
        ENABLE/DISABLE rport. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SIPAlgProfileName
        The name of the SIPALG Profile. Minimum length = 1 Maximum length = 127
    .PARAMETER SIPDstPortRange
        Destination port range for SIP_UDP and SIP_TCP.
    .PARAMETER SIPSessionTimeout
        SIP control channel session timeout in seconds. Default value: 600
    .PARAMETER SIPSrcPortRange
        Source port range for SIP_UDP and SIP_TCP.
    .PARAMETER SIPTransPortProtocol
        SIP ALG Profile transport protocol type. Possible values = TCP, UDP
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
        Invoke-NSUpdateLSNSIPALGProfile -SIPAlgProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNSIPALGProfile -SIPAlgProfileName 'example' -WhatIf
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
        [int] $DataSessionidleTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Opencontactpinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $OpenRecordRoutepinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Openregisterpinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Openroutepinhole,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $OpenviAPINhole,

        [Parameter()]
        [int] $RegistrationTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $RPort,

        [Parameter(Mandatory, Position = 0)]
        [string] $SIPAlgProfileName,

        [Parameter()]
        [string] $SIPDstPortRange,

        [Parameter()]
        [int] $SIPSessionTimeout,

        [Parameter()]
        [string] $SIPSrcPortRange,

        [Parameter()]
        [ValidateSet('TCP', 'UDP')]
        [string] $SIPTransPortProtocol,

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
    if ($PSBoundParameters.ContainsKey('DataSessionidleTimeout')) { $properties['datasessionidletimeout'] = $DataSessionidleTimeout }
    if ($PSBoundParameters.ContainsKey('Opencontactpinhole')) { $properties['opencontactpinhole'] = $Opencontactpinhole }
    if ($PSBoundParameters.ContainsKey('OpenRecordRoutepinhole')) { $properties['openrecordroutepinhole'] = $OpenRecordRoutepinhole }
    if ($PSBoundParameters.ContainsKey('Openregisterpinhole')) { $properties['openregisterpinhole'] = $Openregisterpinhole }
    if ($PSBoundParameters.ContainsKey('Openroutepinhole')) { $properties['openroutepinhole'] = $Openroutepinhole }
    if ($PSBoundParameters.ContainsKey('OpenviAPINhole')) { $properties['openviapinhole'] = $OpenviAPINhole }
    if ($PSBoundParameters.ContainsKey('RegistrationTimeout')) { $properties['registrationtimeout'] = $RegistrationTimeout }
    if ($PSBoundParameters.ContainsKey('RPort')) { $properties['rport'] = $RPort }
    if ($PSBoundParameters.ContainsKey('SIPAlgProfileName')) { $properties['sipalgprofilename'] = $SIPAlgProfileName }
    if ($PSBoundParameters.ContainsKey('SIPDstPortRange')) { $properties['sipdstportrange'] = $SIPDstPortRange }
    if ($PSBoundParameters.ContainsKey('SIPSessionTimeout')) { $properties['sipsessiontimeout'] = $SIPSessionTimeout }
    if ($PSBoundParameters.ContainsKey('SIPSrcPortRange')) { $properties['sipsrcportrange'] = $SIPSrcPortRange }
    if ($PSBoundParameters.ContainsKey('SIPTransPortProtocol')) { $properties['siptransportprotocol'] = $SIPTransPortProtocol }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$SIPAlgProfileName", 'Update lsnsipalgprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsnsipalgprofile -Payload @{ lsnsipalgprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNSIPALGProfile -SIPAlgProfileName $SIPAlgProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNSIPALGProfile

# region Invoke-NSUpdateLSNTransportProfile
function Invoke-NSUpdateLSNTransportProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler lsntransportprofile resource.
    .DESCRIPTION
        Configuration for LSN Transport Profile resource.
    .PARAMETER FinrstTimeout
        Timeout, in seconds, for a TCP LSN session after a FIN or RST message is received from one of the endpoints. If a TCP LSN session is idle (after the Citrix ADC receives a FIN or RST message) for a time that exceeds this value, the Citrix ADC ADC removes the session. Since the LSN feature of the Citrix ADC does not maintain state information of any TCP LSN sessions, this timeout accommodates the transmission of the FIN or RST, and ACK messages from the other endpoint so that both endpoints can properly close the connection. Default value: 30
    .PARAMETER GroupSessionlimit
        Maximum number of concurrent LSN sessions(for the specified protocol) allowed for all subscriber of a group to which this profile has bound. This limit will get split across the Citrix ADCs packet engines and rounded down. When the number of LSN sessions reaches the limit for a group in packet engine, the Citrix ADC does not allow the subscriber of that group to open additional sessions through that packet engine. Default value: 0
    .PARAMETER PortPreserveparity
        Enable port parity between a subscriber port and its mapped LSN NAT port. For example, if a subscriber initiates a connection from an odd numbered port, the Citrix ADC allocates an odd numbered LSN NAT port for this connection. You must set this parameter for proper functioning of protocols that require the source port to be even or odd numbered, for example, in peer-to-peer applications that use RTP or RTCP protocol. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortPreServerAnge
        If a subscriber initiates a connection from a well-known port (0-1023), allocate a NAT port from the well-known port range (0-1023) for this connection. For example, if a subscriber initiates a connection from port 80, the Citrix ADC can allocate port 100 as the NAT port for this connection. This parameter applies to dynamic NAT without port block allocation. It also applies to Deterministic NAT if the range of ports allocated includes well-known ports. When all the well-known ports of all the available NAT IP addresses are used in different subscriber's connections (LSN sessions), and a subscriber initiates a connection from a well-known port, the Citrix ADC drops this connection. Default value: DISABLED Possible values = ENABLED, DISABLED
    .PARAMETER PortQuota
        Maximum number of LSN NAT ports to be used at a time by each subscriber for the specified protocol. For example, each subscriber can be limited to a maximum of 500 TCP NAT ports. When the LSN NAT mappings for a subscriber reach the limit, the Citrix ADC does not allocate additional NAT ports for that subscriber. Default value: 0 Minimum value = 0 Maximum value = 65535
    .PARAMETER Sessionquota
        Maximum number of concurrent LSN sessions allowed for each subscriber for the specified protocol. When the number of LSN sessions reaches the limit for a subscriber, the Citrix ADC does not allow the subscriber to open additional sessions. Default value: 0 Minimum value = 0 Maximum value = 65535
    .PARAMETER SessionTimeout
        Timeout, in seconds, for an idle LSN session. If an LSN session is idle for a time that exceeds this value, the Citrix ADC removes the session. This timeout does not apply for a TCP LSN session when a FIN or RST message is received from either of the endpoints. . Default value: 120 Minimum value = 60
    .PARAMETER StunTimeout
        STUN protocol timeout. Default value: 600 Minimum value = 120 Maximum value = 1200
    .PARAMETER Syncheck
        Silently drop any non-SYN packets for connections for which there is no LSN-NAT session present on the Citrix ADC. If you disable this parameter, the Citrix ADC accepts any non-SYN packets and creates a new LSN session entry for this connection. Following are some reasons for the Citrix ADC to receive such packets: * LSN session for a connection existed but the Citrix ADC removed this session because the LSN session was idle for a time that exceeded the configured session timeout. * Such packets can be a part of a DoS attack. Default value: ENABLED Possible values = ENABLED, DISABLED
    .PARAMETER SynidleTimeout
        SYN Idle timeout. Default value: 60 Minimum value = 30 Maximum value = 120
    .PARAMETER TransPortProfileName
        Name for the LSN transport profile. Must begin with an ASCII alphanumeric or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters. Cannot be changed after the LSN transport profile is created. The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "lsn transport profile1" or 'lsn transport profile1'). Minimum length = 1 Maximum length = 127
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
        Invoke-NSUpdateLSNTransportProfile -TransPortProfileName 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateLSNTransportProfile -TransPortProfileName 'example' -WhatIf
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
        [int] $FinrstTimeout,

        [Parameter()]
        [int] $GroupSessionlimit,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PortPreserveparity,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $PortPreServerAnge,

        [Parameter()]
        [int] $PortQuota,

        [Parameter()]
        [int] $Sessionquota,

        [Parameter()]
        [int] $SessionTimeout,

        [Parameter()]
        [int] $StunTimeout,

        [Parameter()]
        [ValidateSet('ENABLED', 'DISABLED')]
        [string] $Syncheck,

        [Parameter()]
        [int] $SynidleTimeout,

        [Parameter(Mandatory, Position = 0)]
        [string] $TransPortProfileName,

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
    if ($PSBoundParameters.ContainsKey('FinrstTimeout')) { $properties['finrsttimeout'] = $FinrstTimeout }
    if ($PSBoundParameters.ContainsKey('GroupSessionlimit')) { $properties['groupsessionlimit'] = $GroupSessionlimit }
    if ($PSBoundParameters.ContainsKey('PortPreserveparity')) { $properties['portpreserveparity'] = $PortPreserveparity }
    if ($PSBoundParameters.ContainsKey('PortPreServerAnge')) { $properties['portpreserverange'] = $PortPreServerAnge }
    if ($PSBoundParameters.ContainsKey('PortQuota')) { $properties['portquota'] = $PortQuota }
    if ($PSBoundParameters.ContainsKey('Sessionquota')) { $properties['sessionquota'] = $Sessionquota }
    if ($PSBoundParameters.ContainsKey('SessionTimeout')) { $properties['sessiontimeout'] = $SessionTimeout }
    if ($PSBoundParameters.ContainsKey('StunTimeout')) { $properties['stuntimeout'] = $StunTimeout }
    if ($PSBoundParameters.ContainsKey('Syncheck')) { $properties['syncheck'] = $Syncheck }
    if ($PSBoundParameters.ContainsKey('SynidleTimeout')) { $properties['synidletimeout'] = $SynidleTimeout }
    if ($PSBoundParameters.ContainsKey('TransPortProfileName')) { $properties['transportprofilename'] = $TransPortProfileName }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$TransPortProfileName", 'Update lsntransportprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type lsntransportprofile -Payload @{ lsntransportprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetLSNTransportProfile -TransPortProfileName $TransPortProfileName -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateLSNTransportProfile

# SIG # Begin signature block
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCQhJwajI6WnhJJ
# T/dXa7Fu8JpBrLDGn6F+JA2KqNqqO6CCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgvxfD
# WswzG+e0ln1HV6SZqGG/BZJVoyqSun+Z3EMiAs8wDQYJKoZIhvcNAQEBBQAEggGA
# EKqomOsQV7Xam+GtRQeu1wNGU0HsCleTreA6+hAwoX61Mo1tP9tVF0Vtkex9PgZs
# XLLyz6fs9HhsbdUrquCvpsZFXXuENttXHEo/SinkNxFoREeGBEtv6qfP7RBtKVqy
# +FXwN2ooP8JJbZUUtFyD+Os3rH6la+NMfggVD/FcQHbkMgbdm4GUPnZ0Z6ty4vQE
# sHZj97MG9KgqepTcn0RP25hbEaC3DTpC8H2LSb/YEener+AUvSwPKfGYQP1yZxrH
# PwfEA/m4ZvxlEU9LchpBwwZgh/qx5MjcSIaHCgKJtWFJv1dhJ0CRMGViCYLdvaiz
# m4eI/G6naCUj8tzZE0EbYrtwSMpHBKOYrVPdT2Je9zlt8sFaxrab76D6mZDPV56d
# aCPzYhTkenrXDzTXH3CKpqu+Pl0fePJ+IzDXul0phw/5Wmlk2B+ZV5dLZG6+6k6F
# jDpTDfV0M55EKU0PLWGDpyXrf1MawYG9WZYTa6OrIu4AQ4mkWhNZQmM3RzAUg4w0
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIG5+WAYxoBpUXL1kHcs3
# 9cVvqlN8K7G5JKdh2DbLQHwIAgZqY0xd+kMYEzIwMjYwNzI3MTMxMTUwLjE5M1ow
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
# IgQgzUiCWzEhfhQ/Q+5bpkWroedAkWuTAGzxEutxtBS2dhgwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCDCIbzA/sTJ9lK41E2E
# e3HD+l/k7kSAMB0qHDpqQwel0DANBgkqhkiG9w0BAQsFAASCAgBXvyw0Vo6hHGoD
# Kgzz6ranflc3S4zxBVo8G/81Mnq+xbEPAzjYD7cDbFhGrUvGPw7+lyRyhkqEgaZE
# 3HZ9nen4U6bU8ucRvXxjyq9OjUa8KdSmPlEYjCsaJtqAdrtzxHk89xmNUX7Jnull
# 2cLRB5myaK5HT16r9T0cJNWeItNCGin+OqxjInuyB+Z51orNCtvtMrUDyYcZPgtA
# DOIIVatFxTAE5Pf2cVdPQFa6lF6zkfiHr4dEkmrd9CCp7Zz6yqEwmZ8Dsrm1I+Dm
# j3G7stEaRLV6P3HSTMOQFUHr6c5lp7FwFrtT3bFMeIRL5+uh5IdGughQwyLvumCC
# vg6cXXTpsIsxss2y5GG3fdjz5huT/cGac3futMSdJj6GhIqUh5hbZpDfIPtozzYE
# RRMDJs4N7VQHJdNfApRvRjpWyTtTdyuJHhf8BGBllKBJTNc+rZbfAEMPJLoOAC4J
# QY5uzFnOn3J853D5CRFvyu+OLV92EfTEzR65EkIvqj5R+hRIEdjbnm+/IdX3kwaR
# yRV8VzfH1PWBg0BZFyEMu8i0rFmmW/t3aPTEFIH8vl/Gba8cSOtZD7HOzKUqjq+o
# VcPKyU8YQ7/Yojd+J1Gsn2yyCq7wY5e0TojGNEu8e7Tg50cLWXlqBJaXHFahmh+d
# UMWzfJrP67oNStXB0qM8+/MSzdfzzg==
# SIG # End signature block
