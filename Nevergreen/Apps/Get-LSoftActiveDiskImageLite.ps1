try {
    $URL = Get-Link -Uri 'https://www.disk-image.com/download.htm' -MatchProperty href -Pattern 'Free\S+\.exe$' -PrefixDomain
    $Version = Get-Version -Uri 'https://www.disk-image.com/history.htm' -Pattern '((?:\d+\.)+\d+)</b>'

    New-NevergreenApp -Name 'LSoft Active@ Disk Image Lite' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}