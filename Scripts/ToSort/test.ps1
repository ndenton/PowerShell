$cred = Get-Credential
Connect-MsolService -Credential $cred 
Get-MsolUser -SearchString 'The Other Test Room'