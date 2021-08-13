try {

    $Version = Get-Version -Uri 'https://www.citrix.com/downloads/sharefile/clients-and-plug-ins/citrix-files-for-windows.html' -Pattern 'Citrix Files for Windows v((?:\d+\.)+\d+)'

    $URLMsi = Get-Link -Uri 'https://www.citrix.com/downloads/sharefile/clients-and-plug-ins/citrix-files-for-windows.html' -MatchProperty outerHTML -Pattern '\.msi' -ReturnProperty outerHTML
    if ($URLMsi -match 'rel="(//.+\.msi[^"]+)') {
        $URLMsi = "https:" + $Matches[1]
        New-NevergreenApp -Name 'Citrix Files' -Version $Version -Uri $URLMsi -Architecture 'x64' -Type 'Msi'
    }

    $URLExe = Get-Link -Uri 'https://www.citrix.com/downloads/sharefile/clients-and-plug-ins/citrix-files-for-windows.html' -MatchProperty outerHTML -Pattern '\.exe' -ReturnProperty outerHTML
    if ($URLExe -match 'rel="(//.+\.exe[^"]+)') {
        $URLExe = "https:" + $Matches[1]
        New-NevergreenApp -Name 'Citrix Files' -Version $Version -Uri $URLExe -Architecture 'Multi' -Type 'Exe'
    }

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}
