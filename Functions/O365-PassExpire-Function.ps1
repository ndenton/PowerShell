function Get-EmailPassExpire {
    param (
        $username
    )

    try
        {
            Get-MsolDomain -ErrorAction Stop > $null
        }
    catch 
    {
        if ($cred -eq $null) {$cred = Get-Credential $O365Adminuser}
        Write-Output "Connecting to Office 365..."
        Connect-MsolService -Credential $cred
    }
    $expire = Get-MsolUser | Select-Object UserPrincipalName, LastPasswordChangeTimestamp
    #write-host $expire.AddDays(90)
    foreach ($name in $expire) {
        #do something
    }
}