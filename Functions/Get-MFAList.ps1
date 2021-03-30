function Get-MFAList {
    param(
        $ReportName
    )

    Connect-O365

    $nomfa = Get-MsolGroupMember -GroupObjectId ade9e497-3618-4245-955f-dcc1eb0e6a0b

    if($ReportName){
        $path = Get-ReportPath $ReportName
        Get-MsolUser -all | Where-Object {$_.isLicensed -eq "True" -and !($_.DisplayName -in $nomfa.DisplayName)} |
        select DisplayName,UserPrincipalName,Department,@{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){$_.StrongAuthenticationRequirements.State} else { "Disabled"}}}, isLicensed | 
        Export-Excel -Path $path
    } else {
        $path = Get-ReportPath "MFA_User_List.xlsx"
        Get-MsolUser -all | Where-Object {$_.isLicensed -eq "True" -and !($_.DisplayName -in $nomfa.DisplayName)} |
        select DisplayName,UserPrincipalName,Department,@{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){$_.StrongAuthenticationRequirements.State} else { "Disabled"}}}, isLicensed | 
        Export-Excel -Path $path
    }
}
