$MajorVersion = 13

do {
    try {

        $Releases = Invoke-RestMethod -Uri "https://support.freedomscientific.com/Downloads/OfflineInstallers/GetInstallers?product=Fusion&version=$MajorVersion&language=mul&releaseType=Offline" -DisableKeepAlive

        foreach ($Release in $Releases) {

            $Version = $Release.FileName | Get-Version
            $Type = (Get-Culture).TextInfo.ToTitleCase([System.IO.Path]::GetExtension($Release.InstallerLocationHTTP).Replace('.',''))
            New-NevergreenApp -Name 'Fusion' -Version $Version -Uri $Release.InstallerLocationHTTP -Architecture 'Multi' -Type $Type

        }

    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }

    $MajorVersion++

}
until ($MajorVersion -ge ([int](Get-Date -Format 'yy') - 6) -and $Releases.Count -eq 0)