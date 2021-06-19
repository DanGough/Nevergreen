$Response = Invoke-WebRequest 'https://www.autoitscript.com/site/autoit/downloads' -DisableKeepAlive -UseBasicParsing

$URL32 = $Response.Links | Where-Object href -Like '*autoit-v*-setup.exe' | Select-Object -ExpandProperty href -First 1

if ($URL32) {

    $URL32 = Set-UriPrefix -Uri $URL32 -Prefix 'https://www.autoitscript.com'

    if ($Response.Content -match 'v((?:\d+\.)+\d+)') {
        [PSCustomObject]@{
            Version      = $matches[1]
            Architecture = 'x86'
            URI          = $URL32
        }
    }
}