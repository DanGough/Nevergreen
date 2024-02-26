$Releases = @(
  @{VSVersion = 'vs2015-2022'; Architecture = 'x64'; Type = 'exe'; Pattern = 'vc_redist\.x64\.exe$'}
  @{VSVersion = 'vs2015-2022'; Architecture = 'x86'; Type = 'exe'; Pattern = 'vc_redist\.x86\.exe$'}
  @{VSVersion = 'vs2013'; Architecture = 'x64'; Type = 'exe'; Pattern = 'vcredist_x64\.exe$'}
  @{VSVersion = 'vs2013'; Architecture = 'x86'; Type = 'exe'; Pattern = 'vcredist_x86\.exe$'}
)

ForEach($Release in $Releases) {
  try {
    $URL = Get-Link -Uri 'https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist' -MatchProperty href -Pattern $Release.Pattern
    If($Release.VSVersion -eq 'vs2015-2022') {
      $Version = Get-Version -Uri 'https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist' -Pattern '<code>((?:\d+\.)+\d+)<\/code>'
      New-NevergreenApp -Name 'Visual C++ 2015-2022 Redistributable' -Version $Version -Uri $URL -Architecture $Release.Architecture -Type $Release.Type
    }
    ElseIf($Release.VSVersion -eq 'vs2013) {
      $Version = Get-Version -Uri 'https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist' -Pattern '(12\.(?:\d+\.)+\d+)'
      New-NevergreenApp -Name 'Visual C++ 2013 Redistributable' -Version $Version -Uri $URL -Architecture $Release.Architecture -Type $Release.Type
    }
  }
  catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
  }
}
