<#
.Synopsis
    The function volumes up.

.DESCRIPTION
    The function volumes up.

.EXAMPLE
    Set-YmVolumeUp -DeviceAddress 10.10.0.30

.EXAMPLE
    up-ym -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmVolumeUp
{
    [cmdletbinding(SupportsShouldProcess)]
    [Alias('up-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory = $false, ParameterSetName = 'InStep', Position = 1)]
        [int]$InStep,
        [switch]$PassThru
    )
    begin
    {
    }
    process
    {
        if ($PSCmdlet.ShouldProcess($DeviceAddress))
        {
            foreach ($Address in $DeviceAddress)
            {
                try
                {
                    if ($InStep)
                    {
                        $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setVolume?volume=up&step=$InStep"
                        $ResponseObj = $Response.Content | ConvertFrom-Json
                    }
                    else
                    {
                        $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setVolume?volume=up"
                        $ResponseObj = $Response.Content | ConvertFrom-Json
                    }

                    if ($ResponseObj.response_code -eq 0)
                    {
                        Get-YmStatus -DeviceAddress $DeviceAddress | Select-Object volume
                    }
                    else
                    {
                        $ResponseObj | Add-YmResponseCode
                    }
                }
                catch
                {
                    Write-Warning $PSItem
                }
            }
        }
    }
    end
    {

    }
}
