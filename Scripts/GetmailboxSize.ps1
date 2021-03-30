Import-Module $((Get-ChildItem -Path $($env:LOCALAPPDATA+"\Apps\2.0\") -Filter CreateExoPSSession.ps1 -Recurse ).FullName | Select-Object -Last 1)

Connect-EXOPSSession -UserPrincipalName 'ndenton@lionel.com'

Get-Mailbox | 
Get-MailboxStatistics | 
Select-Object DisplayName, @{name=”TotalItemSize (GB)”;expression={[math]::Round((($_.TotalItemSize.Value.ToString()).Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}},ItemCount | 
Sort-Object “TotalItemSize (GB)” -Descending | 
Export-CSV d:\Office365-MailboxSize-Report.csv