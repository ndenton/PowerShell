#Import Common Modules
Import-Module ActiveDirectory
Import-Module $((Get-ChildItem -Path $($env:LOCALAPPDATA+"\Apps\2.0\") -Filter CreateExoPSSession.ps1 -Recurse ).FullName | Select-Object -Last 1)
Import-Module MSOnline

#Load Functions
Get-ChildItem $HOME\Documents\PowerShell\Functions\*Function.ps1 | %{. $_ }