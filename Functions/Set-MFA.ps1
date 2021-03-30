function Set-MFA {
    param(
        $UserProfileName,
        $State
    )

    Connect-O365

    switch ($State) {
        "Enabled" {
            $User = Get-MsolUser -UserPrincipalName $UserProfileName
            $User.StrongAuthenticationRequirements
            $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
            $st.RelyingParty = "*"
            $st.State = "Enforced"
            $sta = @($st)
            Set-MsolUSer -UserPrincipalName $User.UserPrincipalName -StrongAuthenticationRequirements $sta
        }
        "Enforced" {
            $User = Get-MsolUser -UserPrincipalName $UserProfileName
            $User.StrongAuthenticationRequirements
            $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
            $st.RelyingParty = "*"
            $st.State = "Enforced"
            $sta = @($st)
            Set-MsolUSer -UserPrincipalName $User.UserPrincipalName -StrongAuthenticationRequirements $sta
        }
        "Disabled" {
            $User = Get-MsolUser -UserPrincipalName $UserProfileName
            $User.StrongAuthenticationRequirements
            $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
            $st.RelyingParty = "*"
            $st.State = "Disabled"
            $sta = @()
            Set-MsolUSer -UserPrincipalName $User.UserPrincipalName -StrongAuthenticationRequirements $sta
        }
        Default {
            Write-Host("Unrecognized State. Use Enabled, Enforced or Disabled")
        }
    }
}