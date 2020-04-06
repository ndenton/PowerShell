function Get-DriveSpace {
    param (
        $ComputerName
    )

    if(!$ComputerName){
        Get-CimInstance -ClassName Win32_logicaldisk -Filter "DriveType = '3'" | 
        Select-Object -Property DeviceID, DriveType, VolumeDirty, 
        @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}}, 
        @{L="Capacity";E={"{0:N2}" -f ($_.Size/1GB)}}
    } else {
        Get-CimInstance -ComputerName $ComputerName -ClassName Win32_logicaldisk -Filter "DriveType = '3'" | 
        Select-Object -Property DeviceID, DriveType, VolumeDirty, 
        @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}}, 
        @{L="Capacity";E={"{0:N2}" -f ($_.Size/1GB)}}
    }    
}