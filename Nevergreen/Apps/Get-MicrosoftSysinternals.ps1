$BaseURL = 'https://docs.microsoft.com/en-us/sysinternals/downloads'
$Links = (Invoke-WebRequest -Uri $BaseURL -DisableKeepAlive -UseBasicParsing).Links | Where-Object outerHTML -Match 'data-linktype'

foreach ($Link in $Links) {

    if ($Link.href -match 'SysinternalsSuite.+zip$') {

        $LastModified = (Resolve-Uri -Uri $Link.href).LastModified
        $Version = @($LastModified.Year,$LastModified.Month,$LastModified.Day) -join '.'

        if ($Link.href -match 'SysinternalsSuite\.zip$') {
            New-NevergreenApp -Name 'Microsoft Sysinternals Suite' -Version $Version -Uri $Link.href -Type 'Zip' -Architecture 'Multi' -Platform 'Windows'
        }
        elseif ($Link.href -match 'SysinternalsSuite-Nano\.zip$') {
            New-NevergreenApp -Name 'Microsoft Sysinternals Suite' -Version $Version -Uri $Link.href -Type 'Zip' -Architecture 'x64' -Platform 'Nano Server'
        }
        elseif ($Link.href -match 'SysinternalsSuite-ARM64\.zip$') {
            New-NevergreenApp -Name 'Microsoft Sysinternals Suite' -Version $Version -Uri $Link.href -Type 'Zip' -Architecture 'ARM64' -Platform 'Windows'
        }

    }
    elseif ($Link.href -match 'pstools') {

        $DownloadPageURL = $Link.href | Set-UriPrefix -Prefix $BaseURL
        $URL = Get-Link -Uri $DownloadPageURL -MatchProperty href -Pattern '\.zip$'
        $LastModified = (Resolve-Uri -Uri $URL).LastModified
        $Version = @($LastModified.Year,$LastModified.Month,$LastModified.Day) -join '.'

        New-NevergreenApp -Name 'Microsoft Sysinternals PsTools Suite' -Version $Version -Uri $URL -Type 'Zip' -Architecture 'Multi' -Platform 'Windows'

    }
    elseif ($Link.outerHTML -match '<a href="(.+)" data-linktype="relative-path">(.+)</a>') {

        $Name = "Microsoft Sysinternals $($Matches[2])"
        $DownloadPageURL = $Matches[1] | Set-UriPrefix -Prefix $BaseURL
        $URL = Get-Link -Uri $DownloadPageURL -MatchProperty href -Pattern '\.zip$'
        $Version = Get-Version -Uri $DownloadPageURL -Pattern ' v((?:\d+\.)+\d+)'

        New-NevergreenApp -Name $Name -Version $Version -Uri $URL -Type 'Zip' -Architecture 'Multi' -Platform 'Windows'

    }
}