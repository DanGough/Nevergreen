$Apps = @(
    @{Name = 'Zoom'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://zoom.us/client/latest/ZoomInstallerFull.exe' }
    @{Name = 'Zoom'; Architecture = 'x64'; Type = 'Exe'; Uri = 'https://zoom.us/client/latest/ZoomInstallerFull.exe?archType=x64' }
    @{Name = 'Zoom'; Architecture = 'ARM64'; Type = 'Exe'; Uri = 'https://zoom.us/client/latest/ZoomInstallerFull.exe?archType=winarm64' }
    @{Name = 'Zoom'; Architecture = 'x86'; Type = 'Msi'; Uri = 'http://zoom.us/client/latest/ZoomInstallerFull.msi' }
    @{Name = 'Zoom'; Architecture = 'x64'; Type = 'Msi'; Uri = 'http://zoom.us/client/latest/ZoomInstallerFull.msi?archType=x64' }
    @{Name = 'Zoom'; Architecture = 'ARM64'; Type = 'Msi'; Uri = 'http://zoom.us/client/latest/ZoomInstallerFull.msi?archType=winarm64' }
    @{Name = 'Zoom Plugin for Microsoft Outlook'; Architecture = 'x86'; Type = 'Msi'; Uri = 'http://zoom.us/client/latest/ZoomOutlookPluginSetup.msi' }
    @{Name = 'Zoom Plugin for IBM Notes'; Architecture = 'x86'; Type = 'Msi'; Uri = 'https://zoom.us/client/latest/ZoomNotesPluginSetup.msi' }
    @{Name = 'Zoom Notes Admin Tool'; Architecture = 'x86'; Type = 'Msi'; Uri = 'https://zoom.us/client/latest/ZoomNotesPluginAdminTool.msi' }
    @{Name = 'Zoom Plugin for Skype for Business'; Architecture = 'x86'; Type = 'Msi'; Uri = 'http://zoom.us/client/latest/ZoomLyncPluginSetup.msi' }
    @{Name = 'Zoom Rooms'; Architecture = 'x86'; Type = 'Exe'; Uri = (Get-Link 'https://zoom.us/download' -MatchProperty href -Pattern 'rooms\S+exe' -PrefixDomain) }
    @{Name = 'Zoom Rooms'; Architecture = 'x86'; Type = 'Msi'; Uri = (Get-Link 'https://zoom.us/download' -MatchProperty href -Pattern 'rooms\S+msi' -PrefixDomain) }
)

foreach ($App in $Apps) {
    try {
        $URL = (Resolve-Uri -Uri $App.Uri).Uri
        $Version = $URL | Get-Version
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Warning -Message "Unable to get results for $($App.Name): $($_.Exception.Message)"
    }
}

try {

    $VDIDownloadURL = Get-Link -Uri 'https://support.zoom.us/hc/en-us/sections/360011509631-VDI-Downloads' -MatchProperty href -Pattern 'VDI-Release-Version' -PrefixDomain
    $VDILinks = (Invoke-WebRequest -Uri $VDIDownloadURL -UseBasicParsing).Links

    $Apps = @(
        @{Name = 'Zoom VDI Client'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomInstallerVDI\.msi$' }
        @{Name = 'Zoom Citrix HDX Media Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomCitrixHDXMediaPlugin\.msi$' }
        @{Name = 'Zoom VMware Media Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomVmwareMediaPlugin\.msi$' }
        @{Name = 'Zoom WVD Media Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomWVDMediaPlugin\.msi$' }
        @{Name = 'Zoom VDI Log Tool'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomVDITool\.exe$' }
    )

    foreach ($App in $Apps) {
        $URL = $VDILinks | Where-Object href -match $App.Pattern | Select-Object -ExpandProperty href -First 1
        $Version = $VDILinks | Where-Object href -match $App.Pattern | Select-Object -ExpandProperty outerHTML -First 1 | Get-Version -Pattern '((?:\d+\.)+\d+)<'

        if ($URL -and $Version) {
            New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
        }
        else {
            Write-Warning -Message "Unable to find link for $($App.Name)"
        }
    }

}
catch {
    Write-Warning -Message "Unable to get results for Zoom VDI downloads: $($_.Exception.Message)"
}