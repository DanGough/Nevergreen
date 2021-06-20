$Version = (Invoke-WebRequest -Uri 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html' -DisableKeepAlive -UseBasicParsing).Content | Get-Version -Pattern 'latest\srelease\s\(((?:\d+\.)+\d+)\)'

$URL64,$URL32,$URLARM64,$URLARM32 = Get-Link -Uri 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html' -MatchProperty href -Pattern 'putty-64bit.+\.msi','putty-\d+\.\d+.+\.msi','putty-arm64.+\.msi','putty-arm32.+\.msi'

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}

if ($Version -and $URLARM64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'ARM64'
        URI          = $URLARM64
    }
}

if ($Version -and $URLARM32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'ARM32'
        URI          = $URLARM32
    }
}
