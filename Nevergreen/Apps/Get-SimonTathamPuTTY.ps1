$Resp = Invoke-WebRequest -Uri 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html' -UseBasicParsing

$Version = ($Resp.Content | Select-String -Pattern 'latest\srelease\s\((.+)\)').Matches.Groups[1].Value

$URLx64 = $Resp.Links | Where-Object href -Like '*putty-64bit*.msi' | Select-Object -First 1 -ExpandProperty href
$URLx86 = $Resp.Links | Where-Object href -Like '*w32/putty*.msi' | Select-Object -First 1 -ExpandProperty href
$URLARM64 = $Resp.Links | Where-Object href -Like '*putty-arm64*.msi' | Select-Object -First 1 -ExpandProperty href
$URLARM32 = $Resp.Links | Where-Object href -Like '*putty-arm32*.msi' | Select-Object -First 1 -ExpandProperty href

if ($Version -and $URLx64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URLx64
    }
}

if ($Version -and $URLx86) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URLx64
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
