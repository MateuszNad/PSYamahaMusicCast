function Get-ResponseCode {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        $InputObject
    )

    $message = switch ($InputObject.response_code) {
        0 { "Successful request" }
        1 { "Initializing " }
        2 { "Internal Error " }
        3 { "Invalid Request (A method did not exist, a method wasn’t appropriate etc.)" }
        4 { "Invalid Parameter (Out of range, invalid characters etc.)" }
        5 { "Guarded (Unable to setup in current status etc.)" }
        6 { "Time Out" }
        99 { "Firmware Updating" }
        100 { "Access Error" }
        101 { "Other Errors" }
        102 { "Wrong User Name" }
        103 { "Wrong Password" }
        104 { "Account Expired" }
        105 { "Account Disconnected/Gone Off/Shut Down" }
        106 { "Account Number Reached to the Limit" }
        107 { "Server Maintenance" }
        108 { "Invalid Account" }
        109 { "License Error" }
        110 { "Read Only Mode" }
        111 { "Max Stations" }
        112 { "Access Denied" }
    }
    $InputObject | Add-Member -MemberType NoteProperty -Name responde_message -Value $message
    Write-Output $InputObject
}
