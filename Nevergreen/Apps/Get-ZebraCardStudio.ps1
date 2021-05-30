$URL32 = [System.Net.HttpWebRequest]::Create('https://cardstudio.zebra.com/download').GetResponse().ResponseUri.AbsoluteUri
$Version = ($URL32 | Select-String -Pattern 'CardStudio-Setup_((?:\d+\.)+(?:\d+)).exe').Matches.Groups[1].Value

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}