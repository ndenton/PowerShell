#Get a grouping of events & count
Get-EventLog -LogName System -EntryType Error | Group InstanceID

#get details of the newest event of a specific evnet ID
Get-EventLog -LogName System -EntryType Error -Newest 1 -InstanceId

#Get Event Details
Get-EventLog -LogName System -EntryType Error -Newest 1 -InstanceId <<ID>> | fl *


Connect-ExchangeOnline -UserPrincipalName ndenton@lionel.com -ShowProgress $true [-ExchangeEnvironmentName <Value>] [-DelegatedOrganization <String>] [-PSSessionOption $ProxyOptions]