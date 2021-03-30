function Connect-EOL {
    $getsessions = Get-PSSession | Select-Object -Property State, Name
    $isconnected = (@($getsessions) -like '@{State=Opened; Name=ExchangeOnlineInternalSession*').Count -gt 0
    If ($isconnected -ne "True") {
    Connect-ExchangeOnline
    }
}
