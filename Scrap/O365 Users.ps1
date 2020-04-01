Import-Module MSOnline

Get-MsolDomain -ErrorAction SilentlyContinue 

if($?)
{
    $fileName = "O365Users"
    $fileDate = Get-Date -UFormat %m-%d-%Y
    $fileExt = ".csv"

    Get-MsolUser -All |
    Select-Object   FirstName, 
                    LastName, 
                    IsLicensed, 
                    DisplayName, 
                    LastPasswordChangeTimeStamp, 
                    Office, 
                    PasswordNeverExpires, 
                    PhoneNumber, 
                    PostalCode, 
                    SignInName, 
                    State, 
                    StreetAddress,
                    UserPrincipalName |
    Export-Csv -Path "T:\pwershell\$fileName$fileDate$fileExt"
}
else
{
    Connect-MsolService

    $fileName = "O365Users"
    $fileDate = Get-Date -UFormat %m-%d-%Y
    $fileExt = ".csv"

    Get-MsolUser -All |
    Select-Object   FirstName, 
                    LastName, 
                    IsLicensed, 
                    DisplayName, 
                    LastPasswordChangeTimeStamp, 
                    Office, 
                    PasswordNeverExpires, 
                    PhoneNumber, 
                    PostalCode, 
                    SignInName, 
                    State, 
                    StreetAddress,
                    UserPrincipalName |
    Export-Csv "$fileName$fileDate$fileExt"
} 



