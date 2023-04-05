function Remove-ComputerAccount{
#    [CmdletBinding(SupportsShouldProcess)]
    param(
        [ValidateNotNullOrEmpty()]
        [string]$Name="",
        [string]$Confirm
        )
        foreach($User in $Name){
              if($Name){
                        Remove-LocalUser -Name $Name
                        Write-Output "The deletion was successful"
                        Get-LocalUser 
                     }
               if($Name -eq ""){
                        Write-Warning -Message "The user does not exist"
               }
               
        }
}


#    $Name = Read-Host "Please enter the user you want to delete."
#    $Confirm = Read-Host "Are you sure you want to delete it.[yes/no]"
#    foreach ()
#    if ($Confirm -eq "yes"){
#        net user $Name /delete
#        Write-Output "The deletion was successful."
