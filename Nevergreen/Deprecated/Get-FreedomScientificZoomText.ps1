$MajorVersion = 12

do {
    try {

        $Releases = Invoke-RestMethod -Uri "https://support.freedomscientific.com/Downloads/OfflineInstallers/GetInstallers?product=ZoomText&version=$MajorVersion&language=enu&releaseType=Offline" -DisableKeepAlive

        foreach ($Release in $Releases) {

            $Version = $Release.FileName | Get-Version
            $Type = (Get-Culture).TextInfo.ToTitleCase([System.IO.Path]::GetExtension($Release.InstallerLocationHTTP).Replace('.',''))
            New-NevergreenApp -Name 'ZoomText' -Version $Version -Uri $Release.InstallerLocationHTTP -Architecture 'Multi' -Type $Type

        }

    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }

    $MajorVersion++

}
until ($MajorVersion -ge ([int](Get-Date -Format 'yy') - 6) -and $Releases.Count -eq 0)