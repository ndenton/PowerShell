function Update-WSUS {
    param (
        $ComputerName,
        $UserName
    )
    
    $WSUSStatus = Invoke-Command -ComputerName $ComputerName -ScriptBlock {(Get-WsusServer).GetSubscription().GetSynchronizationStatus()} -Credential $UserName | Select-Object -ExpandProperty Value;

    If($WSUSStatus -eq 'Running') {
        While($WSUSStatus -eq 'Running') {
            $Script:WSUSStatus = Invoke-Command -ComputerName $ComputerName -ScriptBlock {(Get-WsusServer).GetSubscription().GetSynchronizationStatus()} | Select-Object -ExpandProperty Value;
            Write-Host "Sync is still " + $WSUSStatus;
        }   
        Write-Host "Sync is " + $WSUSStatus;             
    } elseif ($WSUSStatus -eq 'Complete') {
        Invoke-Command -ComputerName $ComputerName -ScriptBlock {(Get-WsusServer).GetSubscription().StartSynchronization()}
        Write-Host "WSUS Started Sync"
        $Script:WSUSStatus = 'Running'
        While($WSUSStatus -eq 'Running') {
            $Script:WSUSStatus = Invoke-Command -ComputerName $ComputerName -ScriptBlock {(Get-WsusServer).GetSubscription().GetSynchronizationStatus()} | Select-Object -ExpandProperty Value;
            Write-Host "Sync is still " + $WSUSStatus;
        }
        Write-Host "Sync is " + $WSUSStatus;
    } 
}