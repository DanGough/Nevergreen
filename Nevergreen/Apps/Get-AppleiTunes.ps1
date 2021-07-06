try {

    #API that iTunes queries is only returning a 3-part version number, other sources below use 4 parts but are not direct from Apple. Monitor next update to see which is best.
    $Version = Get-Version -Uri 'https://s.mzstatic.com/version' -Pattern '<key>iTunesWindowsVersion</key>\s+<string>((?:\d+\.)+\d+)</string>'

    #$Version = ((Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/History_of_iTunes' -DisableKeepAlive -UseBasicParsing).Content | Select-String -Pattern '<p>((?:\d+\.)+\d+)\s</p>\s</th>' -AllMatches)[-1].Matches[-1].Groups[1].Value
    #$Version = (Invoke-RestMethod -Uri 'https://community.chocolatey.org/api/v2/Packages()?$filter=(tolower(Id)%20eq%20''itunes'')%20and%20IsLatestVersion' -DisableKeepAlive).Properties.Version

    $URL64 = 'https://www.apple.com/itunes/download/win64'
    $URL32 = 'https://www.apple.com/itunes/download/win32'

    New-NevergreenApp -Name 'Apple iTunes' -Version $Version -Uri $URL64 -Architecture 'x64' -Type 'Exe'
    New-NevergreenApp -Name 'Apple iTunes' -Version $Version -Uri $URL32 -Architecture 'x86' -Type 'Exe'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}
