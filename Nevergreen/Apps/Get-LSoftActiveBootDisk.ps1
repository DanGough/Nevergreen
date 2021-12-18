try {
    $URL = Get-Link -Uri 'https://www.boot-disk.com/index.html' -MatchProperty href -Pattern 'BootDisk.+\.exe$'
    $Version = Get-Version -Uri 'https://www.boot-disk.com/history.htm' -Pattern '<strong>((?:\d+\.?)+\d+)</strong>'

    New-NevergreenApp -Name 'LSoft Active@ Boot Disk' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}