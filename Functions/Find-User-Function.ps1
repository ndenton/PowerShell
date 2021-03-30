function Find-User
    {
        <#
            .SYNOPSIS
            Finds user from the username or a portion of the username.
            .DESCRIPTION
            Connects to the fileserver and runs Net session to collect the
            user names that have open connections. Strips the IP and Username
            from the string.
            Uses System.net.dns to get the computer name.
            .EXAMPLE
            Find-User smith
            If it is only a portion of a username it could find multiple results
 
            CSmith is logged into PC1 with IP address 192.168.20.1
 
            CSmith is logged into PC2 with IP address 192.168.20.2
 
            psmith is logged into PC3 with IP address 192.168.20.3
 
            ssmith is logged into PC4 with IP address 192.168.20.4
 
            .EXAMPLE
            Find-User -username csmith
 
            If using the exact username it will find all connections for that one user.
 
            CSmith is logged into pc1 with IP address 192.168.20.1
 
            CSmith is logged into pc2 with IP address 192.168.20.2
        #>
   
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory=$true, Position=0)]
            [Object]
            $Username,
            $FILESERVER
        )
        # Connect Remotely to Server, Run Session, get a list of everybody logged in there
   
        $S=NEW-PSSESSION –computername $FILESERVER
        $Results=(INVOKE-COMMAND –Session $s –scriptblock { (NET SESSION) }) | Select-string $Username
        REMOVE-PSSESSION $S
        # Let’s parse through the data and pull out what we need  
        Foreach ( $Part in $RESULTS ) {
            $ComputerIP=$Part.Line.substring(2,21).trim()
            $User=$Part.Line.substring(21,44).trim()
            # Use nslookup to identify the computer, grab the line with the “Name:” field in it
            $Computername=([System.Net.dns]::GetHostbyAddress("$ComputerIP"))
            $computername =  $ComputerName.HostName
            If ($NULL -eq $Computername) { $Computername=”Unknown”}
            #Else { $Computername=$Computername.substring(9).trim()}
            write-host
            # Show me where the silly fool is hiding
            "" + $User + "est logged into $Computername with the IP address $ComputerIP”
        }
    }