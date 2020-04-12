$oneyear = (Get-Date).AddDays(-365)

Get-ADComputer -Server LNNCDC1 `
-Filter {LastLogonDate -lt $oneyear} `
-Properties LastLogonDate
| Select-Object Name, LastLogonDate