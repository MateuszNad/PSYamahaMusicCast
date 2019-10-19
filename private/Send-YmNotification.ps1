<#
.Synopsis
     krotki_opis

.DESCRIPTION
    dlugi_opis

.EXAMPLE
    przyklad_1

.EXAMPLE
    przyklad_2

.NOTES
    Author: autor
    Link: akademiapowershell.pl

    Date: 17-10-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Send-YmNotification
{
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [psobject]$InputObject
    )
    begin
    {
        # Sprawdzenie wersji systemu
        switch ([System.Environment]::OSVersion.Platform)
        {
            'Win32NT'
            {
                $TypeNotification = 1
            }
            Default
            {
                $TypeNotification = 2
            }
        }
    }
    process
    {
        if ($null -ne $InputObject.track)
        {
            switch ($TypeNotification)
            {
                1 # BurntToast
                {
                    $Title = "{0} - {1}" -f $InputObject.track, $InputObject.artist
                    $TypeInput = $InputObject.input
                    New-BalloonTip -Title $Title -Text $TypeInput
                }
                2
                {
                    $InputObject | Select-Object Track, Artist, Input
                }
            }
        }
    }
    end
    {

    }
}
