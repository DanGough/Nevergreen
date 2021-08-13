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
        Mandatory. The name of the application.

    .PARAMETER Uri
        Mandatory. The download URI for the application.

    .PARAMETER Version
        Mandatory. The application version.

    .PARAMETER Architecture
        Mandatory. Must match x86, x64, ARM32, ARM64 or Multi.

    .PARAMETER Type
        Mandatory. Must match Msi, Msp, Exe, Zip, MSIX, AppX, AppV if supplied.

    .PARAMETER Language
        Optional. The language of the application installer, e.g. 'en'.

    .PARAMETER Ring
        Optional. The deployment ring, e.g. 'General', 'Preview'.

    .PARAMETER Channel
        Optional. The channel, e.g. 'Enterprise'.

    .PARAMETER Platform
        Optional. The platform, e.g. 'Windows Server'.

    .PARAMETER MD5
        Optional. The MD5 hash of the file.

    .PARAMETER SHA256
        Optional. The SHA256 hash of the file.

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
            Mandatory = $true)]
        [ValidateSet('Msi', 'Msp', 'Exe', 'Zip', 'MSIX', 'AppX', 'AppV')]
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
        [String] $Platform,
        [Parameter(
            Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [String] $MD5,
        [Parameter(
            Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [String] $SHA256
    )

    $Output = [PSCustomObject]@{
        Name    = $Name
    }

    if ($Ring) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Ring' -Value $Ring
    }

    if ($Channel) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Channel' -Value $Channel
    }

    if ($Language) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Language' -Value $Language
    }

    if ($Platform) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Platform' -Value $Platform
    }

    if ($Architecture) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Architecture' -Value $Architecture
    }

    if ($Type) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Type' -Value $Type
    }

    Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Version' -Value $Version
    Add-Member -InputObject $Output -MemberType NoteProperty -Name 'Uri' -Value $Uri

    if ($MD5) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'MD5' -Value $MD5
    }

    if ($SHA256) {
        Add-Member -InputObject $Output -MemberType NoteProperty -Name 'SHA256' -Value $SHA256
    }

    $Output
}