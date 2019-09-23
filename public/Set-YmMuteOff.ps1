<#
.Synopsis
     The function activates mute.

.DESCRIPTION
    The function activates mute.

.EXAMPLE
    Set-YmMuteOff -DeviceAddress 10.10.0.30

.EXAMPLE
    Set-YmMuteOff -DeviceAddress 10.10.0.30 -PassThru

    response_code responde_message
    ------------- ----------------
                0 Successful request

.EXAMPLE
    muteoff-ym -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: mute off
    Notes:
    Changelog:
#>
function Set-YmMuteOff
{

    [cmdletbinding(SupportsShouldProcess)]
    [Alias('muteoff-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress,
        [switch]$PassThru

    )
    begin
    {

    }
    process
    {
        if ($PSCmdlet.ShouldProcess())
        {
            foreach ($Address in $DeviceAddress)
            {
                try
                {
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setMute?enable=true"
                    if ($PassThru)
                    {
                        $Response.Content | ConvertFrom-Json | Add-YmResponseCode
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
