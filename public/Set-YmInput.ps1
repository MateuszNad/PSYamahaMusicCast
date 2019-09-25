<#
.Synopsis
    The function changes input

.DESCRIPTION
    The function changes input

.EXAMPLE
    Set-YmInput -DeviceAddress 10.10.0.30 -Input spotify

.EXAMPLE
    Set-YmInput -DeviceAddress 10.10.0.30 -Input tuner -PassThru

    response_code responde_message
    ------------- ----------------
                0 Successful request

.EXAMPLE
    input-ym -DeviceAddress 10.10.0.30 -Input cd

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmInput
{

    [cmdletbinding(SupportsShouldProcess)]
    [Alias('input-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$DeviceAddress,
        [switch]$PassThru
    )
    DynamicParam
    {
        # Set the dynamic parameters' name
        $ParameterName = 'Input'

        # Create the dictionary
        $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

        # Create the collection of attributes
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]

        # Create and set the parameters' attributes
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $true
        $ParameterAttribute.Position = 1

        # Add the attributes to the attributes collection
        $AttributeCollection.Add($ParameterAttribute)

        # Generate and set the ValidateSet
        $arrSet = (Get-YmInputList -DeviceAddress $DeviceAddress | Select-Object -ExpandProperty Id)
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)

        # Add the ValidateSet to the attributes collection
        $AttributeCollection.Add($ValidateSetAttribute)

        # Create and return the dynamic parameter
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
        return $RuntimeParameterDictionary
    }

    begin
    {

    }
    process
    {
        $Input = $PSBoundParameters[$ParameterName]
        if ($PSCmdlet.ShouldProcess($Input))
        {
            foreach ($Address in $DeviceAddress)
            {
                try
                {
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setInput?input=$Input"
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
