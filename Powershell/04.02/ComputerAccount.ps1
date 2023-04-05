function Add-ComputerAccount {
        param(
            [ValidateNotNullOrEmpty()]
            [string]$Name,
            [string]$Password="",
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
                net user $Name /add
                 Disable-ADAccount -Identity $Name
                    }
#            
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
             net group $Group /add
             Add-ADGroupMember "$Group"  "$Name" 

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
#    net user $Name /add $Password
#    Add-ADGroupMember "$Group"  "$Name"     
#    net localgroup  $Group $Name /add
    
#    dsadd user cn=$Name,ou=GTP,DC=skills,DC=cn  -disabled $State -tel $Phone -company $Company -title $Posts -memberof cn=$Group,CN=Users,DC=skills,DC=cn
#    Add-LocalGroupMember -Group "$Group" -Member "$Name" #,CN=Users,DC=skills,DC=cn

#    Set-ADUser -Identity $Name -city $City -Country $Country
#    Write-Host -NoNewline  "Username:$Name"    "  "
#   Write-Host -NoNewline "Password:$Password" "  "
#    Write-Host -NoNewline "State:$State"       "  "
#    Write-Host -NoNewline "Group:$Group "      "  "

}
