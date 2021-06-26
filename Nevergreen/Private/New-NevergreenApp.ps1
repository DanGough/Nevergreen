function New-NevergreenApp {
    <#
    .SYNOPSIS
        Returns a PSCustomObject to output.

    .DESCRIPTION
        Returns a PSCustomObject to output.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER Name
        The name of the application.

    .PARAMETER Uri
        The download URI for the application.

    .PARAMETER Version
        The application version.

    .PARAMETER Architecture
        Optional. Must match x86, x64. ARM32 or ARM64 if supplied.

    .PARAMETER Type
        Optional. Must match Msi, Exe, Zip, MSIX, AppX if supplied.

    .PARAMETER Language
        Optional. The language of the application installer, e.g. 'en'.

    .PARAMETER Ring
        Optional. The deployment ring, e.g. 'General', 'Preview'.

    .PARAMETER Channel
        Optional. The channel, e.g. 'Enterprise'.

    .PARAMETER Platform
        Optional. The platform, e.g. 'Citrix'.

    .EXAMPLE
        New-NevergreenApp -Uri 'http://somewhere.com/something.exe' -Version '1.0' -Architecture 'x64' -Type 'Exe'

        Description:
        Outputs a PSCustomObject with the chosen properties.
    #>
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(
            Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Name,
        [Parameter(
            Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Version,
        [Parameter(
            Mandatory = $true)]
        [ValidatePattern('^(http|https)://')]
        [Alias('Url')]
        [String] $Uri,
        [Parameter(
            Mandatory = $true)]
        [ValidateSet('x86', 'x64', 'ARM32', 'ARM64', 'Multi')]
        [String] $Architecture,
        [Parameter(
            Mandatory = $false)]
        [ValidateSet('Msi', 'Exe', 'Zip', 'MSIX', 'AppX')]
        [String] $Type,
        [Parameter(
            Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [String] $Language,
        [Parameter(
            Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [String] $Ring,
        [Parameter(
            Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [String] $Channel,
        [Parameter(
            Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [String] $Platform
    )

    $Output = [PSCustomObject]@{
        Name    = $Name
        Version = $Version
        Uri     = $Uri
    }

    if ($Architecture) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Architecture' -Value $Architecture
    }

    if ($Type) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Type' -Value $Type
    }

    if ($Language) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Language' -Value $Language
    }

    if ($Ring) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Ring' -Value $Ring
    }

    if ($Channel) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Channel' -Value $Channel
    }

    if ($Platform) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Platform' -Value $Platform
    }

    $Output
}