Function Get-RedirectedUrl
{
    <#
    .LINK
        https://powershellmagazine.com/2013/01/29/pstip-retrieve-a-redirected-url
    #>
    Param
    (
        [Parameter(Mandatory = $true)]
        [String]$url
    )
    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect = $true
    Try
    {
        $response = $request.GetResponse()
        $response.ResponseUri.AbsoluteUri
        $response.Close()
    }
    Catch
    {
        "ERROR: $_"
    }
}

$URL32Exe = Get-RedirectedUrl -URL 'https://zoom.us/client/latest/ZoomInstallerFull.exe'
$Version32Exe = ($URL32Exe | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URL64Exe = Get-RedirectedUrl -URL 'https://zoom.us/client/latest/ZoomInstaller.exe?archType=x64'
$Version64Exe = ($URL64Exe | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URL32Msi = Get-RedirectedUrl -URL 'http://zoom.us/client/latest/ZoomInstallerFull.msi'
$Version32Msi = ($URL32Msi | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URL64Msi = Get-RedirectedUrl -URL 'http://zoom.us/client/latest/ZoomInstallerFull.msi?archType=x64'
$Version64Msi = ($URL64Msi | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URLOutlook = Get-RedirectedUrl -URL 'http://zoom.us/client/latest/ZoomOutlookPluginSetup.msi'
$VersionOutlook = ($URLOutlook | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URLNotes = Get-RedirectedUrl -URL 'https://zoom.us/client/latest/ZoomNotesPluginSetup.msi'
$VersionNotes = ($URLNotes | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URLNotesAdmin = Get-RedirectedUrl -URL 'https://zoom.us/client/latest/ZoomNotesPluginAdminTool.msi'
$VersionNotesAdmin = ($URLNotesAdmin | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URLSkype = Get-RedirectedUrl -URL 'http://zoom.us/client/latest/ZoomLyncPluginSetup.msi'
$VersionSkype = ($URLSkype | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URLRoomsExe = Get-RedirectedUrl -URL 'http://zoom.us/client/latest/ZoomRooms.exe'
$VersionRoomsExe = ($URLRoomsExe | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$URLRoomsMsi = Get-RedirectedUrl -URL 'https://zoom.us/client/latest/ZoomRoomsInstaller.msi'
$VersionRoomsMsi = ($URLRoomsMsi | Select-String -Pattern '((?:\d+\.)+(?:\d+))').Matches.Groups[1].Value

$DownloadPageURL = 'https://support.zoom.us'+((Invoke-WebRequest -Uri 'https://support.zoom.us/hc/en-us/articles/360041602711' -UseBasicParsing).Content | Select-String -Pattern '(\/hc\/en-us\/articles\/\d+)" target="_self" r').Matches.Groups[1].Value
$DownloadPage = (Invoke-WebRequest -Uri $DownloadPageURL -UseBasicParsing).Content

$VersionVDI = ((Invoke-WebRequest -Uri 'https://support.zoom.us/hc/en-us/articles/360041602711' -UseBasicParsing).Content | Select-String -Pattern '\(((?:\d+\.)+(?:\d+))\)').Matches.Groups[1].Value
$URLVDI = 'https://zoom.us/download/vdi/ZoomInstallerVDI.msi'

$VersionCitrix = ($DownloadPage | Select-String -Pattern '(https.+Citrix.+msi).+\>((?:\d+\.)+(?:\d+))\<').Matches.Groups[2].Value
$URLCitrix = 'https://zoom.us/download/vdi/ZoomCitrixHDXMediaPlugin.msi'

$VersionVMware = ($DownloadPage | Select-String -Pattern '(https.+VMware.+msi).+\>((?:\d+\.)+(?:\d+))\<').Matches.Groups[2].Value
$URLVMware = 'https://zoom.us/download/vdi/ZoomVmwareMediaPlugin.msi'

$VersionWVD = ($DownloadPage | Select-String -Pattern '(https.+WVD.+msi).+\>((?:\d+\.)+(?:\d+))\<').Matches.Groups[2].Value
$URLWVD = 'https://zoom.us/download/vdi/ZoomWVDMediaPlugin.msi'

$VersionVDITool = ($DownloadPage | Select-String -Pattern '(https.+VDITool.+exe).+\>((?:\d+\.)+(?:\d+))\<').Matches.Groups[2].Value
$URLVDITool = 'https://zoom.us/download/vdi/ZoomVDITool.exe'

$VersionUninstaller = '6.5.64722.907'
$URLUninstaller = 'https://support.zoom.us/hc/en-us/article_attachments/360084068792/CleanZoom.zip'

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
        Type         = 'Host'
        URI          = $URLVDI
    }
}

if ($VersionCitrix -and $URLCitrix)
{
    [PSCustomObject]@{
        Version      = $VersionCitrix
        Platform     = 'Citrix'
        Type         = 'Client'
        URI          = $URLCitrix
    }
}

if ($VersionVMware -and $URLVMware)
{
    [PSCustomObject]@{
        Version      = $VersionVMware
        Platform     = 'VMware'
        Type         = 'Client'
        URI          = $URLVMware
    }
}

if ($VersionWVD -and $URLWVD)
{
    [PSCustomObject]@{
        Version      = $VersionWVD
        Platform     = 'Windows Virtual Desktop'
        Type         = 'Client'
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

if ($VersionUninstaller -and $URLUninstaller)
{
    [PSCustomObject]@{
        Version  = $VersionUninstaller
        Platform = 'Cleanup Tool'
        Type     = 'Zip'
        URI      = $URLUninstaller
    }
}