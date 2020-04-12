<# 
    Must run Connect-MsolService before running.
#>
Import-Csv -Path "D:\powershell\1-2-19-PasswordReset.csv" | 
ForEach-Object {
                Write-Host $_.UserPrincipalName
                Set-MsolUserPassword -UserPrincipalName $_.UserPrincipalName -ForceChangePasswordOnly $true -ForceChangePassword $true
                Get-ADUser -Filter "UserPrincipalName -eq '$($_.UserPrincipalName)'" | Set-ADUser -ChangePasswordAtLogon $true
               }