$Response = Invoke-WebRequest 'https://www.autoitscript.com/site/autoit/downloads' -UseBasicParsing

$URL32 = $Response.Links | Where-Object href -like '*autoit-v*-setup.exe' | Select-Object -ExpandProperty href -First 1

if ($URL32 -match '.exe$' -and $URL32 -notmatch '^http') {
    $URL32 = 'https://www.autoitscript.com' + $URL32
}

if ($URL32 -and $Response.Content -match 'v((?:\d+\.)+\d+)') {
    [PSCustomObject]@{
        Version      = $matches[1]
        Architecture = 'x86'
        URI          = $URL32
    }
}