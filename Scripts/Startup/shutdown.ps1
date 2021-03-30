# Get the server name
$toAddress = "alerts@lionel.com"
$hostName = [System.Net.DNS]::GetHostByName($Null).HostName
$addresses = [System.Net.DNS]::GetHostByName($Null).AddressList
$time = Get-Date
$subject = "$hostName - Rebooting"
$messagebody =  "The server $hostName is being rebooted at $time. " +
                "`n" + "`n" +
                "IP addresses affected: $addresses"

Send-MailMessage -To $toAddress -From "alert@lionel.com" -SmtpServer 192.168.66.32 -Subject "$subject" -Body "$messagebody"