try {

    #Get hashes of all releases
    $FileNames = @{}
    ((Invoke-Webrequest -Uri 'https://raw.githubusercontent.com/conda/conda-docs/master/docs/source/miniconda_hashes.rst' -DisableKeepAlive -UseBasicParsing).Content |
    Select-String -Pattern '(Miniconda\S+\.exe).+(\w{64})' -AllMatches).Matches | ForEach-Object {
        $FileNames.Add($_.Groups[2].Value, $_.Groups[1].Value)
    }

    #Get all links from main download page, swap URLs with 'latest' in filename for the proper versioned name via hash matching and extract properties from filename
    ((Invoke-Webrequest -Uri 'https://raw.githubusercontent.com/conda/conda-docs/master/docs/source/miniconda.rst' -DisableKeepAlive -UseBasicParsing).Content |
    Select-String -Pattern '(http\S+(Miniconda\d)-\S+-Windows-(x86(?:_64)?)\.exe).+(\w{64})' -AllMatches).Matches | ForEach-Object {

        $URL = $_.Groups[1].Value
        $Name = $_.Groups[2].Value

        $Architecture = $_.Groups[3].Value
        if ($Architecture -eq 'x86_64') {
            $Architecture = 'x64'
        }

        $Hash = $_.Groups[4].Value

        if ($URL -match 'latest' -and $Hash -in $FileNames.Keys) {
            $URL = $URL -replace '[^/]+$',$FileNames[$Hash]
        }

        $Version = $URL | Get-Version

        if ($URL -match 'py(\d+)') {
            $Channel = "Python $($matches[1].Insert(1,'.'))"
        }

        if (Resolve-Uri $URL) {
            New-NevergreenApp -Name $Name -Channel $Channel -Architecture $Architecture -Type 'Exe' -Version $Version -Uri $URL -SHA256 $Hash
        }

    }
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}