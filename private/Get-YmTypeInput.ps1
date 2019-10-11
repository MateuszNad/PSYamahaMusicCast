<#
    .Synopsis
    The function returns current type of input

    .DESCRIPTION
    The function returns current type of input

    .EXAMPLE
    Get-YmTypeInput  -DeviceAddress 10.10.0.30

    type
    ----
    netusb

    .LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 11-10-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
    #>
function Get-YmTypeInput
{
    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
    )
    begin
    {

    }
    process
    {
        foreach ($Address in $DeviceAddress)
        {
            try
            {

                $Response = Get-YmStatus -DeviceAddress $Address
                switch ($Response.input)
                {
                    cd { $type = 'cd' }
                    tuner { $type = 'tuner' }
                    Default { $type = 'netusb' }
                }

                $Object = [PSCustomObject]@{
                    type = $type
                }

                Write-Output $Object
            }
            catch
            {
                Write-Warning $PSItem
            }
        }
    }
    end
    {

    }
}
