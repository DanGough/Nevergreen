try {
    $Response = Invoke-WebRequest -Uri 'https://docs.conda.io/projects/miniconda/en/latest/miniconda-other-installer-links.html' -UseBasicParsing -DisableKeepAlive

    $URIs = $Response.Links.href | Where-Object {$_ -like '*.exe'}

    foreach ($URI in $URIs) {
        if ($Response.Content -match "$URI[\s\S]+?(\w{64})") {
            $Hash = $matches[1]
        }
        else {
            $Hash = $null
        }

        if ($URI -like '*86.exe') {
            $Architecture = 'x86'
        }
        else {
            $Architecture = 'x64'
        }

        $Version = Get-Version -String $URI.Replace('-','.')
        $Platform = $URI -replace '.+py(\d)(\d+).+','Python $1.$2'

        New-NeverGreenApp -Name 'Miniconda' -Platform $Platform -Uri $URI -Version $Version -Architecture $Architecture -Type 'Exe' -SHA256 $Hash
    }
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}