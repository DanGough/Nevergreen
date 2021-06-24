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

$VDIDownloadURL = Get-Link -Uri 'https://support.zoom.us/hc/en-us/sections/360011509631-VDI-Downloads' -MatchProperty href -Pattern 'VDI-Release-Version' -PrefixDomain
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

New-NevergreenApp -Version $Version32Exe -Uri $URL32Exe -Architecture 'x86' -Type 'Exe' -Platform 'Desktop'
New-NevergreenApp -Version $Version64Exe -Uri $URL64Exe -Architecture 'x64' -Type 'Exe' -Platform 'Desktop'
New-NevergreenApp -Version $Version32Msi -Uri $URL32Msi -Architecture 'x86' -Type 'MSI' -Platform 'Desktop'
New-NevergreenApp -Version $Version64Msi -Uri $URL64Msi -Architecture 'x64' -Type 'MSI' -Platform 'Desktop'

New-NevergreenApp -Version $VersionOutlook -Uri $URLOutlook -Architecture 'x86' -Type 'MSI' -Platform 'Outlook'
New-NevergreenApp -Version $VersionNotes -Uri $URLNotes -Architecture 'x86' -Type 'MSI' -Platform 'Notes'
New-NevergreenApp -Version $VersionNotesAdmin -Uri $URLNotesAdmin -Architecture 'x86' -Type 'MSI' -Platform 'Notes Admin Tool'
New-NevergreenApp -Version $VersionSkype -Uri $URLSkype -Architecture 'x86' -Type 'MSI' -Platform 'Skype'

New-NevergreenApp -Version $VersionRoomsExe -Uri $URLRoomsExe -Architecture 'x86' -Type 'Exe' -Platform 'Rooms'
New-NevergreenApp -Version $VersionRoomsMsi -Uri $URLRoomsMsi -Architecture 'x86' -Type 'Msi' -Platform 'Rooms'

New-NevergreenApp -Version $VersionVDI -Uri $URLVDI -Architecture 'x86' -Type 'Msi' -Platform 'VDI'
New-NevergreenApp -Version $VersionCitrix -Uri $URLCitrix -Architecture 'x86' -Type 'Msi' -Platform 'Citrix'
New-NevergreenApp -Version $VersionVMware -Uri $URLVMware -Architecture 'x86' -Type 'Msi' -Platform 'VMware'
New-NevergreenApp -Version $VersionWVD -Uri $URLWVD -Architecture 'x86' -Type 'Msi' -Platform 'WVD'
New-NevergreenApp -Version $VersionVDITool -Uri $URLVDITool -Architecture 'x86' -Type 'Exe' -Platform 'VDI Log Tool'