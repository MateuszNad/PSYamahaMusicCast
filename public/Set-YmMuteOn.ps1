<#
.Synopsis
     The function deactivates mute.

.DESCRIPTION
    The function deactivates mute.

.EXAMPLE
    Set-YmMuteOn -DeviceAddress 10.10.0.30

.EXAMPLE
    Set-YmMuteOn -DeviceAddress 10.10.0.30 -PassThru

    response_code responde_message
    ------------- ----------------
                0 Successful request

.EXAMPLE
    muteon-ym -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: mute on
    Notes:
    Changelog:
#>
function Set-YmMuteOn
{
    [cmdletbinding(SupportsShouldProcess)]
    [Alias('muteon-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress,
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
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setMute?enable=false"
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
