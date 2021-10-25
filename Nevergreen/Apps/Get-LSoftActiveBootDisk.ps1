try {
    $URL = Get-Link -Uri 'https://www.lsoft.net/bootdisk' -MatchProperty href -Pattern 'BootDisk\S+\.exe$' -PrefixDomain
    $Version = Get-Version -Uri 'https://www.boot-disk.com/history.htm' -Pattern '((?:\d+\.?)+\d+)<\/strong>'

    New-NevergreenApp -Name 'LSoft Active@ Boot Disk' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}