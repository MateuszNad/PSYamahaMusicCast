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
function New-BalloonTip
{
    param(
        [Parameter(Mandatory)]
        [string]$Title,
        [Parameter(Mandatory)]
        [string]$Text
    )
    begin
    {
        Add-Type -AssemblyName System.Windows.Forms | Out-Null
    }
    process
    {
        try
        {
            if ($null -eq $BalloonTip)
            {
                $BalloonTip = New-Object System.Windows.Forms.NotifyIcon
            }

            $path = Get-Process -id $pid | Select-Object -ExpandProperty Path
            $BalloonTip.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)

            $BalloonTip.BalloonTipIcon = 'Info'
            $BalloonTip.BalloonTipText = $Text
            $BalloonTip.BalloonTipTitle = $Title
            $BalloonTip.Visible = $true
            $BalloonTip.ShowBalloonTip(10000)
        }
        catch
        {
            $Obj = [PSCustomObject]@{
                Title = $Title
                Text  = $Text
            }
            Write-Output $Obj

            Write-Output $PSItem
        }
    }
}