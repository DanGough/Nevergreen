$URL32Exe = (Resolve-Uri -Uri 'https://zoom.us/client/latest/ZoomInstallerFull.exe').Uri
$Version32Exe = $URL32Exe | Get-Version

$URL64Exe = (Resolve-Uri -Uri 'https://zoom.us/client/latest/ZoomInstaller.exe?archType=x64').Uri
$Version64Exe = $URL64Exe | Get-Version

$URL32Msi = (Resolve-Uri -Uri 'http://zoom.us/client/latest/ZoomInstallerFull.msi').Uri
$Version32Msi = $URL32Msi | Get-Version

$URL64Msi = (Resolve-Uri -Uri 'http://zoom.us/client/latest/ZoomInstallerFull.msi?archType=x64').Uri
$Version64Msi = $URL64Msi | Get-Version

$URLOutlook = (Resolve-Uri -Uri 'http://zoom.us/client/latest/ZoomOutlookPluginSetup.msi').Uri
$VersionOutlook = $URLOutlook | Get-Version

$URLNotes = (Resolve-Uri -Uri 'https://zoom.us/client/latest/ZoomNotesPluginSetup.msi').Uri
$VersionNotes = $URLNotes | Get-Version

$URLNotesAdmin = (Resolve-Uri -Uri 'https://zoom.us/client/latest/ZoomNotesPluginAdminTool.msi').Uri
$VersionNotesAdmin = $URLNotesAdmin | Get-Version

$URLSkype = (Resolve-Uri -Uri 'http://zoom.us/client/latest/ZoomLyncPluginSetup.msi').Uri
$VersionSkype = $URLSkype | Get-Version

$URLRoomsExe = (Resolve-Uri -Uri 'http://zoom.us/client/latest/ZoomRooms.exe').Uri
$VersionRoomsExe = $URLRoomsExe | Get-Version

$URLRoomsMsi = (Resolve-Uri -Uri 'https://zoom.us/client/latest/ZoomRoomsInstaller.msi').Uri
$VersionRoomsMsi = $URLRoomsMsi | Get-Version

$VDIDownloadURL = Get-Link -Uri 'https://support.zoom.us/hc/en-us/sections/360011509631-VDI-Downloads' -MatchProperty href -Pattern 'VDI-Release-Version' | Set-UriPrefix -Prefix 'https://support.zoom.us'
$VDILinks = (Invoke-WebRequest -Uri $VDIDownloadURL -UseBasicParsing).Links

$URLVDI = $VDILinks | Where-Object href -like '*ZoomInstallerVDI.msi' | Select-Object -ExpandProperty href -First 1
$VersionVDI = $VDILinks | Where-Object href -like '*ZoomInstallerVDI.msi' | Select-Object -ExpandProperty outerHTML -First 1 | Get-Version -Pattern '((?:\d+\.)+\d+)<'

$URLCitrix = $VDILinks | Where-Object href -like '*ZoomCitrixHDXMediaPlugin.msi' | Select-Object -ExpandProperty href -First 1
$VersionCitrix = $VDILinks | Where-Object href -like '*ZoomCitrixHDXMediaPlugin.msi' | Select-Object -ExpandProperty outerHTML -First 1 | Get-Version -Pattern '>((?:\d+\.)+\d+)<'

$URLVMware = $VDILinks | Where-Object href -like '*ZoomVmwareMediaPlugin.msi' | Select-Object -ExpandProperty href -First 1
$VersionVMware = $VDILinks | Where-Object href -like '*ZoomVmwareMediaPlugin.msi' | Select-Object -ExpandProperty outerHTML -First 1 | Get-Version -Pattern '>((?:\d+\.)+\d+)<'

$URLWVD = $VDILinks | Where-Object href -like '*ZoomWVDMediaPlugin.msi' | Select-Object -ExpandProperty href -First 1
$VersionWVD = $VDILinks | Where-Object href -like '*ZoomWVDMediaPlugin.msi' | Select-Object -ExpandProperty outerHTML -First 1 | Get-Version -Pattern '>((?:\d+\.)+\d+)<'

$URLVDITool = $VDILinks | Where-Object href -like '*ZoomVDITool.exe' | Select-Object -ExpandProperty href -First 1
$VersionVDITool = $VDILinks | Where-Object href -like '*ZoomVDITool.exe' | Select-Object -ExpandProperty outerHTML -First 1 | Get-Version -Pattern '>((?:\d+\.)+\d+)<'

if ($Version32Exe -and $URL32Exe)
{
    [PSCustomObject]@{
        Version  = $Version32Exe
        Platform = 'x86'
        Type     = 'Exe'
        URI      = $URL32Exe
    }
}

if ($Version64Exe -and $URL64Exe)
{
    [PSCustomObject]@{
        Version  = $Version64Exe
        Platform = 'x64'
        Type     = 'Exe'
        URI      = $URL64Exe
    }
}

if ($Version32Msi -and $URL32Msi)
{
    [PSCustomObject]@{
        Version  = $Version32Msi
        Platform = 'x86'
        Type     = 'Msi'
        URI      = $URL32Msi
    }
}

if ($Version64Msi -and $URL64Msi)
{
    [PSCustomObject]@{
        Version  = $Version64Msi
        Platform = 'x64'
        Type     = 'Msi'
        URI      = $URL64Msi
    }
}

if ($VersionOutlook -and $URLOutlook)
{
    [PSCustomObject]@{
        Version  = $VersionOutlook
        Platform = 'Outlook'
        Type     = 'Msi'
        URI      = $URLOutlook
    }
}

if ($VersionNotes -and $URLNotes)
{
    [PSCustomObject]@{
        Version  = $VersionNotes
        Platform = 'Notes'
        Type     = 'Msi'
        URI      = $URLNotes
    }
}

if ($VersionNotesAdmin -and $URLNotesAdmin)
{
    [PSCustomObject]@{
        Version  = $VersionNotesAdmin
        Platform = 'Notes Admin Tool'
        Type     = 'Msi'
        URI      = $URLNotesAdmin
    }
}

if ($VersionSkype -and $URLSkype)
{
    [PSCustomObject]@{
        Version  = $VersionSkype
        Platform = 'Skype'
        Type     = 'Msi'
        URI      = $URLSkype
    }
}

if ($VersionRoomsExe -and $URLRoomsExe)
{
    [PSCustomObject]@{
        Version  = $VersionRoomsExe
        Platform = 'Rooms'
        Type     = 'Exe'
        URI      = $URLRoomsExe
    }
}

if ($VersionRoomsMsi -and $URLRoomsMsi)
{
    [PSCustomObject]@{
        Version  = $VersionRoomsMsi
        Platform = 'Rooms'
        Type     = 'Msi'
        URI      = $URLRoomsMsi
    }
}

if ($VersionVDI -and $URLVDI)
{
    [PSCustomObject]@{
        Version      = $VersionVDI
        Platform     = 'VDI'
        Type         = 'Msi'
        URI          = $URLVDI
    }
}

if ($VersionCitrix -and $URLCitrix)
{
    [PSCustomObject]@{
        Version      = $VersionCitrix
        Platform     = 'Citrix'
        Type         = 'Msi'
        URI          = $URLCitrix
    }
}

if ($VersionVMware -and $URLVMware)
{
    [PSCustomObject]@{
        Version      = $VersionVMware
        Platform     = 'VMware'
        Type         = 'Msi'
        URI          = $URLVMware
    }
}

if ($VersionWVD -and $URLWVD)
{
    [PSCustomObject]@{
        Version      = $VersionWVD
        Platform     = 'Windows Virtual Desktop'
        Type         = 'Msi'
        URI          = $URLWVD
    }
}

if ($VersionVDITool -and $URLVDITool)
{
    [PSCustomObject]@{
        Version      = $VersionVDITool
        Platform     = 'VDI Log Tool'
        Type         = 'Exe'
        URI          = $URLVDITool
    }
}