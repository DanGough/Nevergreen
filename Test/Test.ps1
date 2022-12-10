. "$PSScriptRoot\ImportFunctions.ps1"
Start-Transcript -Path "$env:temp\Nevergreen.log" -Force
Clear-Host
Write-Host "PowerShell version: $($PSVersionTable.PSVersion)"
Find-NevergreenApp | Get-NevergreenApp
Stop-Transcript