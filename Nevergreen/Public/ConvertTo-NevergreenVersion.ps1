function ConvertTo-NevergreenVersion {
    <#
    .SYNOPSIS
    This function takes a version string, sanitises it and converts it to a version object.

    .DESCRIPTION
    The VersionString parameter will be sanitised to remove unwanted characters, and a version object will be output.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER VersionString
    Specifies version string to be converted.

    .PARAMETER Pad
    If this switch is present, the version number will be padded out to contain 4 parts before casting to [version]. This is necessary for sorting and comparisons if you want 1.0 to equal 1.0.0.

    .EXAMPLE
    ConvertTo-NevergreenVersion -VersionString '1.0'
    #>
    param (
        [Parameter(ValueFromPipeline = $true, Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String]$VersionString,

        [Parameter()]
        [Switch]$Pad
    )

    #Delete any backslashes
    $FormattedVersion = $VersionString.Replace('\','')

    #Replace build or _build with a .
    $FormattedVersion = $FormattedVersion -replace '(_|\s)build', '.'

    #Replace any underscore, dash. plus, or open bracket surrounded by digits with a .
    $FormattedVersion = $FormattedVersion -replace '(?<=\d)(_|-|\+|\()(?=\d)', '.'

    # If Version ends in a trailing ., delete it
    $FormattedVersion = $FormattedVersion -replace '\.$', ''

    # Delete anything that isn't a decimal or a dot
    $FormattedVersion = $FormattedVersion -replace '[^\d.]', ''

    # Delete any random instances of a-z followed by digits, such as b1, ac3, beta5
    $FormattedVersion = $FormattedVersion -replace '[a-z]+\d+', ''

    # Trim any version numbers with 5 or more parts down to 4
    $FormattedVersion = $FormattedVersion -replace '^((\d+\.){3}\d+).*', '$1'

    # Add a .0 to any single integers
    $FormattedVersion = $FormattedVersion -replace '^(\d+)$','$1.0'

    if ($FormattedVersion -ne $VersionString) {
        Write-Warning "The version number $VersionString will be interpreted as $FormattedVersion"
    }

    # Pad the version number out to contain 4 parts before casting to [version]
    if ($Pad) {
        $PeriodCount = $FormattedVersion.ToCharArray().Where{$_ -eq '.'}.Count
        $FormattedVersion = switch($PeriodCount) {
            1 { $FormattedVersion + '.0.0'; break }    # One period, so it's a two-part version number
            2 { $FormattedVersion + '.0'; break }      # Two periods, so it's a three-part version number
            default { $FormattedVersion }
        }
    }

    try {
        [System.Version]::Parse($FormattedVersion)
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}