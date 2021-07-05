try {

    $Version = Get-Version -Uri 'https://s.mzstatic.com/version' -Pattern '<key>iTunesWindowsVersion</key>\s+<string>((?:\d+\.)+\d+)</string>'

    $URL64 = 'https://www.apple.com/itunes/download/win64'
    $URL32 = 'https://www.apple.com/itunes/download/win32'

    New-NevergreenApp -Name 'Apple iTunes' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Exe'
    New-NevergreenApp -Name 'Apple iTunes' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}
