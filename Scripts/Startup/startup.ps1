# Get the server name
$toAddress = "ndenton@lionel.com"
$hostName = [System.Net.DNS]::GetHostByName($Null).HostName
$addresses = [System.Net.DNS]::GetHostByName($Null).AddressList
$time = Get-Date
$reason = Get-WinEvent -FilterHashtable @{logname = 'System'; id = 1074} -MaxEvents 1 | select -Property Message
$lastblue = Get-EventLog -LogName application -Newest 1 -Source 'Windows Error*' | select timewritten, message | where message -match 'bluescreen'
$messageSubject = "$hostName - Computer Startup"
$messageBody =  "The server $hostName has restarted at $time. " +
                "`n" + "`n" +
                "IP addresses affected: $addresses" +
                "`n" + "`n" +
                "The Reason for the Last reboot was: " +
                "`n" + "`n" +
                "$reason" +
                "`n" + "`n" +
                "Last Bluescreen Logged on: " +
                "`n" +
                $lastblue.TimeWritten +
                "`n" +
                "With Message Of: " +
                "`n" +
                $lastblue.Message

Send-MailMessage -To $toAddress -From "alert@lionel.com" -SmtpServer 192.168.66.32 -Subject "$messageSubject" -Body "$messageBody"