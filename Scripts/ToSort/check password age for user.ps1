Connect-MsolService

$user = 'twhite'

Get-MsolUser -userprincipalname $user@lionel.com | select DisplayName, LastPasswordChangeTimeStamp,@{Name=”PasswordAge”;Expression={(Get-Date)-$_.LastPasswordChangeTimeStamp}}