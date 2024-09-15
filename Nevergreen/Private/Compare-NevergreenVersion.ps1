function Compare-NevergreenVersion {
    <#
    .SYNOPSIS
    This function compares versions strings.

    .DESCRIPTION
    ReferenceVersion and DifferenceVersion will be sanitised and parsed as versions. The function will output -1 if the DifferenceVersion is lower, 1 if it is higher, and 0 if they are equal.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER ReferenceVersion
    The base version to compare against.

    .PARAMETER DifferenceVersion
    The version to compare against the base version.

    .EXAMPLE
    Compare-NevergreenVersion -ReferenceVersion '1.0' -DifferenceVersion '1.1'
    #>
    param (
        [Parameter(Position = 0)]
        [String]$ReferenceVersion,
        [Parameter(Position = 1)]
        [String]$DifferenceVersion
    )

    # Versions are allowed to be null or empty
    if ([string]::IsNullOrEmpty($ReferenceVersion)) {
        $ReferenceVersion = '0.0.0.0'
    }
    if ([string]::IsNullOrEmpty($DifferenceVersion)) {
        $DifferenceVersion = '0.0.0.0'
    }

    $ParsedReferenceVersion = ConvertTo-NevergreenVersion -VersionString $ReferenceVersion -Pad
    $ParsedDifferenceVersion = ConvertTo-NevergreenVersion -VersionString $DifferenceVersion -Pad

    if ($ParsedDifferenceVersion -gt $ParsedReferenceVersion) {
        return 1
    }
    elseif ($ParsedDifferenceVersion -lt $ParsedReferenceVersion) {
        return -1
    }
    else {
        return 0
    }

}