function Set-ComputerAccount {
        param(
            [ValidateNotNullOrEmpty()]
            [string]$Name,
            [string]$Password,
            [string]$Group,
            [string]$City,
            [string]$Phone,
            [string]$State,
            [string]$Country,
            [string]$Lname,
            [string]$Fname,
            [string]$Company,
            [string]$Posts
            )
        foreach($User in $Name){
           if($User -ne ""){
               try{
                Get-ADUser -Identity $Name -ErrorAction Stop
               }
               catch{
                 New-LocalUser -Name $Name -NoPassword
               }
           
         if ($PassWord){
            net user $Name $Password
            }
         if($Password -eq ""){
         Set-ADUser -Identity $User -ChangePasswordAtLogon $false
         }
      
        if($State -eq "yes"){
            Unlock-ADAccount -Identity $Name
            }
        if($State -eq "no"){
            Disable-ADAccount -Identity $Name
            }
        
            if($Group -ne ""){
                try{
                    Get-ADGroup -Identity $Group -ErrorAction Stop
                    }
                catch{
                        net group $Group /add
                        Add-ADGroupMember "$Group"  "$Name" 
                    }

            if($Phone){
                Set-ADUser -Identity $Name -OfficePhone $Phone
            }  
           
            if($City){
                Set-ADUser -Identity $Name -City $City
            }
           
            if($Country){
                Set-ADUser -Identity $Name -Country $Country
            }
           
            if($Lname){
                 Set-ADUser -Identity $Name -Surname $Lname
            }
           
            if($Fname){
                  Set-ADUser -Identity $Name -GivenName $Fname
            }
            
            if($Company){
                  Set-ADUser -Identity $Name -Company $Company
            }
            
            if($Posts){
                  Set-ADUser -Identity $Name -Title $Posts
            }
        }
    }
    }
}
