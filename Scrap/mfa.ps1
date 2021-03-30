$User = Get-MsolUser -UserPrincipalName gtrenck@lionel.com 
$User.StrongAuthenticationRequirements
$st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
$st.RelyingParty = "*"
$st.State = "Enforced"
$sta = @($st)

Set-MsolUSer -UserPrincipalName $User.UserPrincipalName -StrongAuthenticationRequirements $sta

<#
    
    Set-MsolUser -UserPrincipalName $User.UserPrincipalName -StrongAuthenticationRequirements @()

#>
