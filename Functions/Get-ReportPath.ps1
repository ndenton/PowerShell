function Get-ReportPath {
    param (
        $name
    )
    $live = Test-Connection -BufferSize 32 -Count 2 -ComputerName CLTLNDFS -Quiet
    if($live){
        if($name){
            $drive = "\\CLTLNDFS\Shared\IT\Private\Ops\Reports\" + $name
            return $drive
        } else {
            $drive = "\\CLTLNDFS\Shared\IT\Private\Ops\Reports\"
            return $drive
        }
    } else {
        if($name){
            Write-Host("Share Server Offline or You Are Off Network. Please Select a New Path:")
            $path = Get-Folder + "\" $name
            return $path
        } else {
            Write-Host("Share Server Offline or You Are Off Network. Please Select a New Path:")
            $path = Get-Folder
            return $path
        }
    }
}