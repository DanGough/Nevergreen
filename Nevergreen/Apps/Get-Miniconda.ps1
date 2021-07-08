try {

    #Some downloads on homepage have 'latest' instead of the real version in the filename. Get the base location for all files then build up the URLs from the page hosting all of the file hashes
    $DownloadBaseURL = (Get-Link -Uri 'https://docs.conda.io/en/latest/miniconda.html' -MatchProperty href -Pattern '\.exe$') -replace '(.+/)[^/]+\.exe','$1'

    #Empty array to track variants to that we only return one of each, i.e. the latest version
    $Variants = @()

    ((Invoke-Webrequest -Uri 'https://raw.githubusercontent.com/conda/conda-docs/master/docs/source/miniconda_hashes.rst' -DisableKeepAlive -UseBasicParsing).Content |
    Select-String -Pattern '((Miniconda\d)-py(\d+)_(?:\d+\.)+\d+-Windows-(x86(?:_64)?)\.exe).+(\w{64})' -AllMatches).Matches | ForEach-Object {
        $FileName = $_.Groups[1].Value
        $Name = $_.Groups[2].Value
        $Channel  = "Python " + $_.Groups[3].Value.Insert(1,'.')
        $Architecture = $_.Groups[4].Value
        if ($Architecture -eq 'x86_64') {
            $Architecture = 'x64'
        }
        $SHA256 = $_.Groups[5].Value
        $Version = $FileName | Get-Version
        $URL = "$DownloadBaseURL$FileName"

        $Variant = "$Name $Channel $Architecture"

        try {
            if ($Variant -notin $Variants -and (Resolve-Uri -Uri $URL)) {
                New-NevergreenApp -Name $Name -Channel $Channel -Architecture $Architecture -Type 'Exe' -Version $Version -Uri $URL -SHA256 $SHA256
                $Variants += $Variant
            }
        }
        catch {
            Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
        }

    }
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}