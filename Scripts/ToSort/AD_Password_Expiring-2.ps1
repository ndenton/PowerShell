$StartWeek = Get-Date -Hour 0 -Minute 0 -Second 0
$StartWeek = $StartWeek.AddDays(-($StartWeek).DayOfWeek.value__)
#$StartWeek

$EndOfWeek = $StartWeek.AddDays(7).AddHours(23).AddMinutes(59).AddSeconds(59)
$EndOfWeek

Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} –Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" |
Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} |
Where-Object $.ExpiryDate -GT $StartWeek
#Export-Csv -Path "E:\password.csv"
