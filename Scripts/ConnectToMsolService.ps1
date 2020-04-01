try
{
    Get-MsolDomain -ErrorAction Stop > $null
}
catch 
{
    Write-Output "Connecting to Office 365..."
    Connect-MsolService
}
