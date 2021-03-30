function Connect-O365 {
    try
    {
        Get-MsolDomain -ErrorAction Stop > $null
    }
    catch 
    {
        if ($cred -eq $null){
            Write-Output "Connecting to Office 365..."
            Connect-MsolService
        }       
    }
}

