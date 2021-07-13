$MajorVersion = 20

do {
    try {

        $Releases = Invoke-RestMethod -Uri "https://support.freedomscientific.com/Downloads/OfflineInstallers/GetInstallers?product=JAWS&version=$MajorVersion&language=mul&releaseType=Offline" -DisableKeepAlive

        foreach ($Release in $Releases) {

            if ($Release.InstallerPlatform -eq '32-bit') {
                $Architecture = 'x86'
            }
            elseif ($Release.InstallerPlatform -eq '64-bit') {
                $Architecture = 'x64'
            }
            else{
                Write-Warning "Unrecognised platform: $($Release.InstallerPlatform)"
                break
            }

            $Version = $Release.FileName | Get-Version
            $Type = (Get-Culture).TextInfo.ToTitleCase([System.IO.Path]::GetExtension($Release.InstallerLocationHTTP).Replace('.',''))
            New-NevergreenApp -Name 'JAWS' -Version $Version -Uri $Release.InstallerLocationHTTP -Architecture $Architecture -Type $Type
        }

    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }

    $MajorVersion++

}
until ($MajorVersion -ge ([int](Get-Date -Format 'yy') + 1) -and $Releases.Count -eq 0)