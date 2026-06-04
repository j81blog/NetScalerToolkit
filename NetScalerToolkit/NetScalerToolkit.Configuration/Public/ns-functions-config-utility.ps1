# Generated NetScalerToolkit Configuration bundle for category 'utility'.

# region Invoke-NSGetCallhome
function Invoke-NSGetCallhome {
    <#
    .SYNOPSIS
        Gets NetScaler callhome configuration.
    .DESCRIPTION
        Configuration for callhome resource.
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetCallhome
    .EXAMPLE
        Invoke-NSGetCallhome -Filter @{ servicetype = 'HTTP' }
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
        [int] $Nodeid,

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

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'callhome'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetCallhome

# region Invoke-NSGetFileSystemEncryption
function Invoke-NSGetFileSystemEncryption {
    <#
    .SYNOPSIS
        Gets NetScaler filesystemencryption configuration.
    .DESCRIPTION
        Configuration for File System Encryption Information resource.
    .PARAMETER Nodeid
        Unique number that identifies the cluster node. Minimum value = 0 Maximum value = 31
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
        Invoke-NSGetFileSystemEncryption
    .EXAMPLE
        Invoke-NSGetFileSystemEncryption -Filter @{ servicetype = 'HTTP' }
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
        [int] $Nodeid,

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

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'filesystemencryption'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetFileSystemEncryption

# region Invoke-NSGetRaid
function Invoke-NSGetRaid {
    <#
    .SYNOPSIS
        Gets NetScaler raid configuration.
    .DESCRIPTION
        Configuration for raid support resource.
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
        Invoke-NSGetRaid
    .EXAMPLE
        Invoke-NSGetRaid -Filter @{ servicetype = 'HTTP' }
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
            Type = 'raid'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetRaid

# region Invoke-NSGetTechsupPort
function Invoke-NSGetTechsupPort {
    <#
    .SYNOPSIS
        Gets NetScaler techsupport configuration.
    .DESCRIPTION
        Configuration for tech support resource.
    .PARAMETER Scope
        Use this option to gather data on the present node, all cluster nodes, or for the specified partitions. The CLUSTER scope generates smaller abbreviated archives for all nodes. The PARTITION scope collects the admin partition in addition to those specified. The partitionName option is only required for the PARTITION scope. Default value: NODE Possible values = NODE, CLUSTER, PARTITION
    .PARAMETER PartitionName
        Name of the partition. Minimum length = 1
    .PARAMETER Upload
        Securely upload the collector archive to Citrix Technical Support using SSL. MyCitrix credentials will be required. If used with the -file option, no new collector archive is generated. Instead, the specified archive is uploaded. Note that the upload operation time depends on the size of the archive file, and the connection bandwidth.
    .PARAMETER Proxy
        Specifies the proxy server to be used when uploading a collector archive. Use this parameter if the Citrix ADC does not have direct internet connectivity. The basic format of the proxy string is: "proxy_IP:<proxy_port>" (without quotes). If the proxy requires authentication the format is: "username:password@proxy_IP:<proxy_port>".
    .PARAMETER Casenumber
        Specifies the associated case or service request number if it has already been opened with Citrix Technical Support.
    .PARAMETER File
        Specifies the name (with full path) of the collector archive file to be uploaded. If this is specified, no new collector archive is generated.
    .PARAMETER Description
        Provides a text description for the the upload, and can be used for logging purposes.
    .PARAMETER Authtoken
        Specifies the Authentication Token, which is used to login to Citrix upload server. Please copy/paste the URL https://cis.citrix.com/auth/api/create_identity_v2/?expiration=3600 in a browser to complete the two factor authentication and generate it. The token is valid for 3600 seconds (1 hour).
    .PARAMETER Time
        Specifies the time in common log format, ie. DD/MMM/YYYY:HH:MM:SS, to be used for locating the newnslog file. With this option at most four newnslog log files are collected. First is the newnslog file, spanning the given time. Second is the one, created just prior to the first (if it exists). Third is the one, created just later than the first (if it exists). And the fourth is the latest newnslog directory. In case, the scope is cluster, then second and third type is skipped on all nodes. Minimum length = 20 Maximum length = 20
    .PARAMETER Adss
        Option for collecting showtechsupport bundle on ADSS cluster/node.
    .PARAMETER Notruncate
        Option for collecting showtechsupport bundle without truncating log files.
    .PARAMETER Nopecore
        Option for collecting showtechsupport bundle without PE core files.
    .PARAMETER Nodes
        Use this option to collect showtechsupport bundle only from the nodes given as a list to this option. If -file option is used, it will collect the files from the given nodes back to the cco and will upload the compressed folder containing the files from there. Minimum value = 0 Maximum value = 255
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
        Invoke-NSGetTechsupPort
    .EXAMPLE
        Invoke-NSGetTechsupPort -Filter @{ servicetype = 'HTTP' }
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
        [ValidateSet('NODE', 'CLUSTER', 'PARTITION')]
        [string] $Scope,

        [Parameter(ParameterSetName = 'All')]
        [string] $PartitionName,

        [Parameter(ParameterSetName = 'All')]
        [switch] $Upload,

        [Parameter(ParameterSetName = 'All')]
        [string] $Proxy,

        [Parameter(ParameterSetName = 'All')]
        [string] $Casenumber,

        [Parameter(ParameterSetName = 'All')]
        [string] $File,

        [Parameter(ParameterSetName = 'All')]
        [string] $Description,

        [Parameter(ParameterSetName = 'All')]
        [string] $Authtoken,

        [Parameter(ParameterSetName = 'All')]
        [string] $Time,

        [Parameter(ParameterSetName = 'All')]
        [switch] $Adss,

        [Parameter(ParameterSetName = 'All')]
        [switch] $Notruncate,

        [Parameter(ParameterSetName = 'All')]
        [switch] $Nopecore,

        [Parameter(ParameterSetName = 'All')]
        [string] $Nodes,

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
        if ($PSBoundParameters.ContainsKey('Scope')) {
            $argumentValue = $Scope
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'scope:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('PartitionName')) {
            $argumentValue = $PartitionName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'partitionname:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Upload')) {
            $argumentValue = $Upload
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'upload:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Proxy')) {
            $argumentValue = $Proxy
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'proxy:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Casenumber')) {
            $argumentValue = $Casenumber
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'casenumber:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('File')) {
            $argumentValue = $File
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'file:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Description')) {
            $argumentValue = $Description
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'description:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Authtoken')) {
            $argumentValue = $Authtoken
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'authtoken:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Time')) {
            $argumentValue = $Time
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'time:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Adss')) {
            $argumentValue = $Adss
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'adss:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Notruncate')) {
            $argumentValue = $Notruncate
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'notruncate:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Nopecore')) {
            $argumentValue = $Nopecore
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nopecore:' + $argumentValue
        }
        if ($PSBoundParameters.ContainsKey('Nodes')) {
            $argumentValue = $Nodes
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'nodes:' + $argumentValue
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
            Type = 'techsupport'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetTechsupPort

# region Invoke-NSPing
function Invoke-NSPing {
    <#
    .SYNOPSIS
        Sends a NetScaler ping request.
    .DESCRIPTION
        Configuration for 0 resource.
    .PARAMETER HostName
        Address of host to ping. Minimum length = 1 Maximum length = 256
    .PARAMETER C
        Number of packets to send. The default value is infinite. For Nitro API, defalut value is taken as 5. Minimum value = 1 Maximum value = 65535
    .PARAMETER I
        Waiting time, in seconds. The default value is 1 second. Minimum value = 0 Maximum value = 65535
    .PARAMETER N
        Numeric output only. No name resolution.
    .PARAMETER P
        Pattern to fill in packets. Can be up to 16 bytes, useful for diagnosing data-dependent problems. Minimum length = 1 Maximum length = 32
    .PARAMETER Q
        Quiet output. Only the summary is printed. For Nitro API, this flag is set by default.
    .PARAMETER S
        Data size, in bytes. The default value is 56. Minimum value = 0 Maximum value = 65507
    .PARAMETER T
        Traffic Domain Id. Minimum value = 1 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSPing -HostName '192.0.2.10' -C 1 -I 'example' -S 'example'
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $HostName,

        [Parameter()]
        [int] $C,

        [Parameter()]
        [string] $I,

        [Parameter()]
        [bool] $N,

        [Parameter()]
        [string] $P,

        [Parameter()]
        [bool] $Q,

        [Parameter()]
        [string] $S,

        [Parameter()]
        [int] $T,

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

        $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('HostName')) { $properties['hostName'] = $HostName }
        if ($PSBoundParameters.ContainsKey('C')) { $properties['c'] = $C }
        if ($PSBoundParameters.ContainsKey('I')) { $properties['I'] = $I }
        if ($PSBoundParameters.ContainsKey('N')) { $properties['n'] = $N }
        if ($PSBoundParameters.ContainsKey('P')) { $properties['p'] = $P }
        if ($PSBoundParameters.ContainsKey('Q')) { $properties['q'] = $Q }
        if ($PSBoundParameters.ContainsKey('S')) { $properties['S'] = $S }
        if ($PSBoundParameters.ContainsKey('T')) { $properties['t'] = $T }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        foreach ($key in $properties.Keys) {
            if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
                $body[$key] = $properties[$key]
            }
        }

        Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ping -Payload @{ ping = $body }
    }
}
# endregion Invoke-NSPing

# region Invoke-NSPing6
function Invoke-NSPing6 {
    <#
    .SYNOPSIS
        Sends a NetScaler ping6 request.
    .DESCRIPTION
        Configuration for 0 resource.
    .PARAMETER HostName
        Address of host to ping. Minimum length = 1 Maximum length = 256
    .PARAMETER B
        Set socket buffer size. If used, should be used with roughly +100 then the datalen (-s option). The default value is 8192. Minimum value = 132 Maximum value = 131071
    .PARAMETER C
        Number of packets to send. The default value is infinite. For Nitro API, defalut value is taken as 5. Minimum value = 1 Maximum value = 65535
    .PARAMETER I
        Waiting time, in seconds. The default value is 1 second. Minimum value = 0 Maximum value = 65535
    .PARAMETER M
        By default, ping6 asks the kernel to fragment packets to fit into the minimum IPv6 MTU.The -m option will suppress the behavior for unicast packets.
    .PARAMETER N
        Numeric output only. No name resolution.
    .PARAMETER P
        Pattern to fill in packets. Can be up to 16 bytes, useful for diagnosing data-dependent problems. Minimum length = 1 Maximum length = 32
    .PARAMETER Q
        Quiet output. Only summary is printed. For Nitro API, this flag is set by default.
    .PARAMETER S
        Data size, in bytes. The default value is 32. Minimum value = 0 Maximum value = 65527
    .PARAMETER T
        Traffic Domain Id. Minimum value = 1 Maximum value = 4094
    .PARAMETER V
        VLAN ID for link local address. Minimum value = 1 Maximum value = 4094
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSPing6 -HostName '192.0.2.10' -C 1 -I 'example' -S 'example'
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $HostName,

        [Parameter()]
        [int] $B,

        [Parameter()]
        [int] $C,

        [Parameter()]
        [string] $I,

        [Parameter()]
        [bool] $M,

        [Parameter()]
        [bool] $N,

        [Parameter()]
        [string] $P,

        [Parameter()]
        [bool] $Q,

        [Parameter()]
        [string] $S,

        [Parameter()]
        [int] $T,

        [Parameter()]
        [int] $V,

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

        $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('HostName')) { $properties['hostName'] = $HostName }
        if ($PSBoundParameters.ContainsKey('B')) { $properties['b'] = $B }
        if ($PSBoundParameters.ContainsKey('C')) { $properties['c'] = $C }
        if ($PSBoundParameters.ContainsKey('I')) { $properties['I'] = $I }
        if ($PSBoundParameters.ContainsKey('M')) { $properties['m'] = $M }
        if ($PSBoundParameters.ContainsKey('N')) { $properties['n'] = $N }
        if ($PSBoundParameters.ContainsKey('P')) { $properties['p'] = $P }
        if ($PSBoundParameters.ContainsKey('Q')) { $properties['q'] = $Q }
        if ($PSBoundParameters.ContainsKey('S')) { $properties['S'] = $S }
        if ($PSBoundParameters.ContainsKey('T')) { $properties['t'] = $T }
        if ($PSBoundParameters.ContainsKey('V')) { $properties['V'] = $V }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        foreach ($key in $properties.Keys) {
            if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
                $body[$key] = $properties[$key]
            }
        }

        Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type ping6 -Payload @{ ping6 = $body }
    }
}
# endregion Invoke-NSPing6

# region Invoke-NSTraceroute
function Invoke-NSTraceroute {
    <#
    .SYNOPSIS
        Sends a NetScaler traceroute request.
    .DESCRIPTION
        Configuration for 0 resource.
    .PARAMETER HostName
        Destination host IP address or name. Minimum length = 1 Maximum length = 64
    .PARAMETER Summary
        Print a summary of how many probes were not answered for each hop.
    .PARAMETER N
        Print hop addresses numerically instead of symbolically and numerically.
    .PARAMETER R
        Bypass normal routing tables and send directly to a host on an attached network. If the host is not on a directly attached network, an error is returned.
    .PARAMETER VerboseOutput
        Verbose output. List received ICMP packets other than TIME_EXCEEDED and UNREACHABLE.
    .PARAMETER MinimumTTL
        Minimum TTL value used in outgoing probe packets. Default value: 1 Minimum value = 1 Maximum value = 255
    .PARAMETER MaximumTTL
        Minimum TTL value used in outgoing probe packets. Default value: 1 Minimum value = 1 Maximum value = 255
    .PARAMETER Protocol
        Send packets of specified IP protocol. The currently supported protocols are UDP and ICMP. Minimum length = 1 Maximum length = 20
    .PARAMETER Port
        Send packets of specified IP protocol. The currently supported protocols are UDP and ICMP. Minimum length = 1 Maximum length = 20
    .PARAMETER QueryCount
        Number of queries per hop. For Nitro API, defalut value is taken as 1. Default value: 3 Minimum value = 1 Maximum value = 65535
    .PARAMETER SourceAddress
        Print a summary of how many probes were not answered for each hop.
    .PARAMETER TrafficDomainId
        Traffic Domain Id. Minimum value = 1 Maximum value = 4094
    .PARAMETER TypeOfService
        Traffic Domain Id. Minimum value = 1 Maximum value = 4094
    .PARAMETER WaitTime
        Time (in seconds) to wait for a response to a query. For Nitro API, defalut value is set to 3. Default value: 5 Minimum value = 2 Maximum value = 86399
    .PARAMETER Packetlen
        Length (in bytes) of the query packets. Default value: 44 Minimum value = 44 Maximum value = 32768
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSTraceroute -HostName '192.0.2.10'
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $HostName,

        [Parameter()]
        [string] $Summary,

        [Parameter()]
        [bool] $N,

        [Parameter()]
        [bool] $R,

        [Parameter()]
        [bool] $VerboseOutput,

        [Parameter()]
        [int] $MinimumTTL,

        [Parameter()]
        [int] $MaximumTTL,

        [Parameter()]
        [int] $Protocol,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [int] $QueryCount,

        [Parameter()]
        [string] $SourceAddress,

        [Parameter()]
        [int] $TrafficDomainId,

        [Parameter()]
        [int] $TypeOfService,

        [Parameter()]
        [int] $WaitTime,

        [Parameter()]
        [int] $Packetlen,

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

        $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('HostName')) { $properties['host'] = $HostName }
        if ($PSBoundParameters.ContainsKey('Summary')) { $properties['S'] = $Summary }
        if ($PSBoundParameters.ContainsKey('N')) { $properties['n'] = $N }
        if ($PSBoundParameters.ContainsKey('R')) { $properties['r'] = $R }
        if ($PSBoundParameters.ContainsKey('VerboseOutput')) { $properties['v'] = $VerboseOutput }
        if ($PSBoundParameters.ContainsKey('MinimumTTL')) { $properties['M'] = $MinimumTTL }
        if ($PSBoundParameters.ContainsKey('MaximumTTL')) { $properties['m'] = $MaximumTTL }
        if ($PSBoundParameters.ContainsKey('Protocol')) { $properties['P'] = $Protocol }
        if ($PSBoundParameters.ContainsKey('Port')) { $properties['p'] = $Port }
        if ($PSBoundParameters.ContainsKey('QueryCount')) { $properties['q'] = $QueryCount }
        if ($PSBoundParameters.ContainsKey('SourceAddress')) { $properties['s'] = $SourceAddress }
        if ($PSBoundParameters.ContainsKey('TrafficDomainId')) { $properties['T'] = $TrafficDomainId }
        if ($PSBoundParameters.ContainsKey('TypeOfService')) { $properties['t'] = $TypeOfService }
        if ($PSBoundParameters.ContainsKey('WaitTime')) { $properties['w'] = $WaitTime }
        if ($PSBoundParameters.ContainsKey('Packetlen')) { $properties['packetlen'] = $Packetlen }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        foreach ($key in $properties.Keys) {
            if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
                $body[$key] = $properties[$key]
            }
        }

        Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type traceroute -Payload @{ traceroute = $body }
    }
}
# endregion Invoke-NSTraceroute

# region Invoke-NSTraceroute6
function Invoke-NSTraceroute6 {
    <#
    .SYNOPSIS
        Sends a NetScaler traceroute6 request.
    .DESCRIPTION
        Configuration for 0 resource.
    .PARAMETER HostName
        Destination host IP address or name. Minimum length = 1 Maximum length = 256
    .PARAMETER N
        Print hop addresses numerically rather than symbolically and numerically.
    .PARAMETER UseICMP
        Use ICMP ECHO for probes.
    .PARAMETER R
        Bypass normal routing tables and send directly to a host on an attached network. If the host is not on a directly attached network, an error is returned.
    .PARAMETER VerboseOutput
        Verbose output. List received ICMP packets other than TIME_EXCEEDED and UNREACHABLE.
    .PARAMETER M
        Maximum hop value for outgoing probe packets. For Nitro API, default value is taken as 10. Default value: 64 Minimum value = 1 Maximum value = 255
    .PARAMETER P
        Base port number used in probes. Default value: 33434 Minimum value = 1 Maximum value = 65535
    .PARAMETER QueryCount
        Number of probes per hop. For Nitro API, default value is taken as 1. Default value: 3 Minimum value = 1 Maximum value = 65535
    .PARAMETER S
        Source IP address to use in the outgoing query packets. If the IP address does not belong to this appliance, an error is returned and nothing is sent. Minimum length = 1
    .PARAMETER TrafficDomainId
        Traffic Domain Id. Minimum value = 1 Maximum value = 4094
    .PARAMETER WaitTime
        Time (in seconds) to wait for a response to a query. For Nitro API, defalut value is set to 3. Default value: 5 Minimum value = 2 Maximum value = 86399
    .PARAMETER Packetlen
        Length (in bytes) of the query packets. Default value: 44 Minimum value = 44 Maximum value = 32768
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSTraceroute6 -HostName '192.0.2.10' -S 'example'
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $HostName,

        [Parameter()]
        [bool] $N,

        [Parameter()]
        [bool] $UseICMP,

        [Parameter()]
        [bool] $R,

        [Parameter()]
        [bool] $VerboseOutput,

        [Parameter()]
        [int] $M,

        [Parameter()]
        [int] $P,

        [Parameter()]
        [int] $QueryCount,

        [Parameter()]
        [string] $S,

        [Parameter()]
        [int] $TrafficDomainId,

        [Parameter()]
        [int] $WaitTime,

        [Parameter()]
        [int] $Packetlen,

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

        $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('HostName')) { $properties['host'] = $HostName }
        if ($PSBoundParameters.ContainsKey('N')) { $properties['n'] = $N }
        if ($PSBoundParameters.ContainsKey('UseICMP')) { $properties['I'] = $UseICMP }
        if ($PSBoundParameters.ContainsKey('R')) { $properties['r'] = $R }
        if ($PSBoundParameters.ContainsKey('VerboseOutput')) { $properties['v'] = $VerboseOutput }
        if ($PSBoundParameters.ContainsKey('M')) { $properties['m'] = $M }
        if ($PSBoundParameters.ContainsKey('P')) { $properties['p'] = $P }
        if ($PSBoundParameters.ContainsKey('QueryCount')) { $properties['q'] = $QueryCount }
        if ($PSBoundParameters.ContainsKey('S')) { $properties['s'] = $S }
        if ($PSBoundParameters.ContainsKey('TrafficDomainId')) { $properties['T'] = $TrafficDomainId }
        if ($PSBoundParameters.ContainsKey('WaitTime')) { $properties['w'] = $WaitTime }
        if ($PSBoundParameters.ContainsKey('Packetlen')) { $properties['packetlen'] = $Packetlen }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        foreach ($key in $properties.Keys) {
            if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
                $body[$key] = $properties[$key]
            }
        }

        Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type traceroute6 -Payload @{ traceroute6 = $body }
    }
}
# endregion Invoke-NSTraceroute6

# region Invoke-NSUnsetCallhome
function Invoke-NSUnsetCallhome {
    <#
    .SYNOPSIS
        Clears one or more NetScaler callhome resource properties.
    .DESCRIPTION
        Configuration for callhome resource.
    .PARAMETER EmailAddress
        Email address of the contact administrator. Maximum length = 78
    .PARAMETER HbCustomInterval
        Interval (in days) between CallHome heartbeats. Default value: 7 Minimum value = 1 Maximum value = 30
    .PARAMETER Ipaddress
        IP address of the proxy server. Minimum length = 1
    .PARAMETER Mode
        CallHome mode of operation. Default value: Default Possible values = Default, CSP, Connector
    .PARAMETER Port
        HTTP port on the Proxy server. This is a mandatory parameter for both IP address and service name based configuration. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProxyAuthService
        Name of the service that represents the proxy server. Maximum length = 128
    .PARAMETER ProxyMode
        Enables or disables the proxy mode. The proxy server can be set by either specifying the IP address of the server or the name of the service representing the proxy server. Default value: NO Possible values = YES, NO
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
        Invoke-NSUnsetCallhome -EmailAddress  -PassThru
    .EXAMPLE
        Invoke-NSUnsetCallhome -EmailAddress  -WhatIf
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
        [switch] $EmailAddress,

        [Parameter()]
        [switch] $HbCustomInterval,

        [Parameter()]
        [switch] $Ipaddress,

        [Parameter()]
        [ValidateSet('Default', 'CSP', 'Connector')]
        [switch] $Mode,

        [Parameter()]
        [switch] $Port,

        [Parameter()]
        [switch] $ProxyAuthService,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $ProxyMode,

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
        if ($PSBoundParameters.ContainsKey('EmailAddress')) { $body['emailaddress'] = $true }
        if ($PSBoundParameters.ContainsKey('HbCustomInterval')) { $body['hbcustominterval'] = $true }
        if ($PSBoundParameters.ContainsKey('Ipaddress')) { $body['ipaddress'] = $true }
        if ($PSBoundParameters.ContainsKey('Mode')) { $body['mode'] = $true }
        if ($PSBoundParameters.ContainsKey('Port')) { $body['port'] = $true }
        if ($PSBoundParameters.ContainsKey('ProxyAuthService')) { $body['proxyauthservice'] = $true }
        if ($PSBoundParameters.ContainsKey('ProxyMode')) { $body['proxymode'] = $true }

        if ($body.Count -le 0) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess('callhome', 'Clear callhome properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type callhome -Action unset -Payload @{ callhome = $body } -RawResponse

            return $response
        }
    }
}
# endregion Invoke-NSUnsetCallhome

# region Invoke-NSUpdateCallhome
function Invoke-NSUpdateCallhome {
    <#
    .SYNOPSIS
        Updates a NetScaler callhome resource.
    .DESCRIPTION
        Configuration for callhome resource.
    .PARAMETER EmailAddress
        Email address of the contact administrator. Maximum length = 78
    .PARAMETER HbCustomInterval
        Interval (in days) between CallHome heartbeats. Default value: 7 Minimum value = 1 Maximum value = 30
    .PARAMETER Ipaddress
        IP address of the proxy server. Minimum length = 1
    .PARAMETER Mode
        CallHome mode of operation. Default value: Default Possible values = Default, CSP, Connector
    .PARAMETER Port
        HTTP port on the Proxy server. This is a mandatory parameter for both IP address and service name based configuration. Minimum value = 1 Range 1 - 65535 * in CLI is represented as 65535 in NITRO API
    .PARAMETER ProxyAuthService
        Name of the service that represents the proxy server. Maximum length = 128
    .PARAMETER ProxyMode
        Enables or disables the proxy mode. The proxy server can be set by either specifying the IP address of the server or the name of the service representing the proxy server. Default value: NO Possible values = YES, NO
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
        Invoke-NSUpdateCallhome  -PassThru
    .EXAMPLE
        Invoke-NSUpdateCallhome  -WhatIf
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
        [string] $EmailAddress,

        [Parameter()]
        [int] $HbCustomInterval,

        [Parameter()]
        [string] $Ipaddress,

        [Parameter()]
        [string] $Mode,

        [Parameter()]
        [int] $Port,

        [Parameter()]
        [string] $ProxyAuthService,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $ProxyMode,

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

    if ($PSBoundParameters.ContainsKey('Mode')) {
        Assert-NSParameterValue -ParameterName 'Mode' -Value $Mode -AllowedValuesByVersion @{ '13.1' = @('Default', 'CSP'); '14.1' = @('Default', 'CSP', 'Connector') } -MetadataVersion $metadataVersion
    }

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('EmailAddress')) { $properties['emailaddress'] = $EmailAddress }
    if ($PSBoundParameters.ContainsKey('HbCustomInterval')) { $properties['hbcustominterval'] = $HbCustomInterval }
    if ($PSBoundParameters.ContainsKey('Ipaddress')) { $properties['ipaddress'] = $Ipaddress }
    if ($PSBoundParameters.ContainsKey('Mode')) { $properties['mode'] = $Mode }
    if ($PSBoundParameters.ContainsKey('Port')) { $properties['port'] = $Port }
    if ($PSBoundParameters.ContainsKey('ProxyAuthService')) { $properties['proxyauthservice'] = $ProxyAuthService }
    if ($PSBoundParameters.ContainsKey('ProxyMode')) { $properties['proxymode'] = $ProxyMode }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess('callhome', 'Update callhome')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type callhome -Payload @{ callhome = $body } -RawResponse

        return $response
    }
}
# endregion Invoke-NSUpdateCallhome

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCANl7H4hafq+1im
# PKaNOcbi9rlJFA5gburC/bcwVkzf0qCCIAowggYUMIID/KADAgECAhB6I67aU2mW
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
# MC8GCSqGSIb3DQEJBDEiBCCu6UsFEK407usw5LynznCUkUJWK8DRk8PB0dvjxL0W
# gDANBgkqhkiG9w0BAQEFAASCAYCkLns+Pvz2mwl7f+ijsOMmq8TXAgCRAVDiAQni
# NCmtt3Nt1ipAyL/ChbQgdXiAcB3cee6XVpwqwcKvO7TIAj0g9weNZkpOfX1FE2ad
# AZ60HheGYKitz3Mo6P4sv8EQoM1pi4hzPkTO3/qeCPE6HYBKBnbGL/7N7GmuwXL8
# ivMiPETOgXuEljjeZObeMxqvZGPpZYbAm+m5Ube5ysEszUbOLargzzcgQK2CWvxe
# 2fpYAMAode7wU/RpiLEcASArcRD7tUIz3hGX+QGaiSDIdT2b/g8GDTGdRGcoH9w6
# KjiXdLQyTOhuNWwZawo/2DqpMo/2Ldx9emMXfXmxU1soMAH4LkSfVNFKFo7uPpQv
# geuxGy7OsUqjfgU0/NXYwSloqMxrrzVAcowul/sdfqOIlXCeTKLgVFt36r1U3bxG
# Z+AY5H+m5+v74U3t+sDPTRnBhTNlp7MUFf+EOrXAev85mC2KDM3tD0YU11rkCy2q
# Y51sxsN8Jb/JI1dHngVwRzg8fCihggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU3MDhaMD8GCSqGSIb3
# DQEJBDEyBDAiOBrIdf+NwXyUlmJb/DGoeNyorUliVXA6+s1Z++BA7xiJL9zG21U9
# nOjuv0sN72MwDQYJKoZIhvcNAQEBBQAEggIAMXE2FUvgPjLaGfnBcQJ0i/EcvzOy
# XT/F9ekddvW6lPK+PNBuz3QX5XYT+gtgXzmgm8mORFbQ3jjndV9KGg9uj8nUUrGD
# HrgaBLHhTqv1bgM38JxN81UwJUiCkarcxZs0E78H1kurWPmA4BRcueI+LXQXks8p
# yEtcBWxr+yEzEVees4FUS/AzSf2ogeQGzzXFlArWrZkfR8JA5nzR+6d9PVB4M9AF
# Fd/i3xXAgDSUPgFlMDrOFYhMVs8SZLjGQETctHRzFHP7qXFbVfb1QqyNooEJLh0y
# S+qX2wUwL0FaRBZZ4PjdZC8EbAfzttPQCyigh3kkC4g+UuAVzovCwuaNyUOo77K7
# YsXxDKPKWD/uP1+X2hyXUZdn4nbnNqm0CFsqlr+dRnS6A1ndouPQNgJ9ZM2js/2i
# IQ7V8rjInanL3hZZflB9cxW4AFYCC0aPq0RyWUGs7muj0MWr69KbJVZlMAqgLcyG
# JhQjU4GXPZK/S9uFoA1zmAlWAmog1XOKyrSTK3kIesuy0zraT8jXgP2HWHF4o6Ui
# /tWFn2k16F06/y6BqGUSNzoR5FfsnHY/RH69rQTw1GNmzWXWsRGtowEJmc/18oaY
# vC+BBjYAI5ta/RtLXKgdyVn7uAPNLLOhMOeWTm1xQlxQ24A8+vDkXMsDqI8HDUsQ
# X3prhYXPrX1X81Y=
# SIG # End signature block
