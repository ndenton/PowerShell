function Get-MailboxData {
    param (
        $UserName
    )

    if(!$UserName){
        Get-Mailbox | 
        Get-MailboxStatistics | 
        Select-Object DisplayName, @{name=”TotalItemSize (GB)”;expression={[math]::Round((($_.TotalItemSize.Value.ToString()).Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}},ItemCount | 
        Sort-Object “TotalItemSize (GB)” -Descending
    } else {
        Get-Mailbox -Identity $UserName | 
        Get-MailboxStatistics | 
        Select-Object DisplayName, @{name=”TotalItemSize (GB)”;expression={[math]::Round((($_.TotalItemSize.Value.ToString()).Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}},ItemCount | 
        Sort-Object “TotalItemSize (GB)” -Descending
    }    
}