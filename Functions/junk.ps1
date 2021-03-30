function isingroup {
	param{
        $name
        $list
	}
	if($list -cmatch $list) {
        return "True"
    } else {
        return "False"
    }
}

$nomfa = Get-MsolGroupMember -GroupObjectId ade9e497-3618-4245-955f-dcc1eb0e6a0b

Get-MsolUser -all | Where-Object {$_.isLicensed -eq "False" -and !($_.DisplayName -in $nomfa.DisplayName)} |
select DisplayName,UserPrincipalName,Department,@{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){$_.StrongAuthenticationRequirements.State} else { "Disabled"}}}, isLicensed | 
Export-Excel -Path $path