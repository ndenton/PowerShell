Get-MsolUser -all | Where-Object {$_.isLicensed -eq "False"} |
select DisplayName,UserPrincipalName,Department,@{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){$_.StrongAuthenticationRequirements.State} else { "Disabled"}}}, isLicensed | 
Export-Excel -Path "e:\lionel\reports\O365 User MFA Status.xlsx"