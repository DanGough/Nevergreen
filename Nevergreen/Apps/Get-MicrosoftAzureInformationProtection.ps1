$Version = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/azure/information-protection/rms-client/unifiedlabelingclient-version-release-history' -UseBasicParsing).Content | Select-String -Pattern '>Version\s((?:\d+\.)+(?:\d+))</h2>').Matches.Groups[1].Value
$URL32 = ((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=53018' -UseBasicParsing).Links | Where-Object href -Like '*_UL.msi')[0].href

if ($Version -and $URL32) {
  [PSCustomObject]@{
    Version      = $Version
    Architecture = 'x86'
    URI          = $URL32
  }
}