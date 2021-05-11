$Version = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/azure/information-protection/rms-client/unifiedlabelingclient-version-release-history' -UseBasicParsing).Content | Select-String -Pattern '>Version\s(.+)</h2>').Matches.Groups[1].Value
$URL = ((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=53018' -UseBasicParsing).Links | Where-Object href -like '*_UL.msi')[0].href

if ($Version -and $URL) {
  [PSCustomObject]@{
    Version      = $Version
    URI          = $URL
  }
}