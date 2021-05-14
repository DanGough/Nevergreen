$Version = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/cli/azure/release-notes-azure-cli?tabs=azure-cli' -UseBasicParsing).Content | Select-String -Pattern '<p>Version\s(.+)</p>').Matches.Groups[1].Value
$URL = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli' -UseBasicParsing).Links | Where-Object outerHTML -like '*Current release of the Azure CLI*')[0].href

if ($Version -and $URL) {
  [PSCustomObject]@{
    Version      = $Version
    URI          = $URL
  }
}