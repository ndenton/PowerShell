Get-MsolUser -UserPrincipalName ndenton@lionel.com | Where-Object {$_.isLicensed -eq "False"} |
Select DisplayName, UserPrincipalName, Department, @{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){$_.StrongAuthenticationRequirements.State} else { "Disabled"}}},
isLicensed

$users = Get-MsolUser -UserPrincipalName ketheiss@lionel.com | Where-Object {$_.isLicensed -eq "False"}
foreach ($user in $users) {
    $user.StrongAuthenticationRequirements.State
    $user.StrongAuthenticationMethods
}
