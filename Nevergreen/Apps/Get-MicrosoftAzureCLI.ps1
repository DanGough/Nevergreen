$Version = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/cli/azure/release-notes-azure-cli?tabs=azure-cli' -UseBasicParsing).Content | Select-String -Pattern '<p>Version\s((?:\d+\.)+(?:\d+))</p>').Matches.Groups[1].Value
$URL32 = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli' -UseBasicParsing).Links | Where-Object outerHTML -Like '*Current release of the Azure CLI*')[0].href

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}