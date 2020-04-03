function Get-ComputerInformation {
    
    [CmdletBinding()]
    param (
        $ComputerName
    )

    #Computer System

    $ComputerSystem = Get-CimInstance -Class Win32_ComputerSystem -ComputerName $ComputerName
    #Operating System

    $OperatingSystem = Get-CimInstance -class win32_OperatingSystem -ComputerName $ComputerName
    #BIOS

    $Bios = Get-CimInstance -class win32_BIOS -ComputerName $ComputerName
    
    #Prepare Output
    $Properties = @{
        ComputerName = $ComputerName
        Manufacturer = $ComputerSystem.Manufacturer
        Model = $ComputerSystem.Model
        OperatingSystem = $OperatingSystem.Caption
        OperatingSystemVersion = $OperatingSystem.Version
        SerialNumber = $Bios.SerialNumber
    }
    
    #Output Information
    New-Object -TypeName PSobject -Property $Properties    
}