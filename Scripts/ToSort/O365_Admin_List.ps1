#Connect to O365 Online
#& '.\Utility\ConnectToMsolService.ps1'

#Get the Object Guid and a store it as $RoleID
$RoleID = Get-MsolRole -RoleName "Company Administrator" | Select -ExpandProperty ObjectID
$admins
#Get the list of Administrators
Get-MsolRoleMember -RoleObjectId $RoleID -OutVariable admins | Out-Printer

#Write-Host $admins