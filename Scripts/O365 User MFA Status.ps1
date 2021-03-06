function Get-MFAList {
    param(
        $ReportName
    )

    if($ReportName){
        $path = Get-ReportPath $ReportName
        Get-MsolUser -all | Where-Object {$_.isLicensed -eq "False"} |
        select DisplayName,UserPrincipalName,Department,@{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){$_.StrongAuthenticationRequirements.State} else { "Disabled"}}}, isLicensed | 
        Export-Excel -Path $path
    } else {
        $path = Get-ReportPath "MFA_User_List.csv"
        Get-MsolUser -all | Where-Object {$_.isLicensed -eq "False"} |
        select DisplayName,UserPrincipalName,Department,@{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){$_.StrongAuthenticationRequirements.State} else { "Disabled"}}}, isLicensed | 
        Export-Excel -Path $path
    }
}
