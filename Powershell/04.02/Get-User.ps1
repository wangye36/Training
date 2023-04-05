<#
function Get-ComputerAccount{
    
    param(
        [ValidateNotNul1OrEmpty()]
        [string]$Identity="",
        [string]$Group
      )
      foreach($User in $Identity){
      if ($Identity -eq ""){
      Get-LocalUser | select *
      }
      if($Identity){
        Get-LocalUser $Identity | select *
        }
        if($Group){
        Get-ADPrincipalGroupMembership $Group
        }
        }
#        Get-ADPrincipalGroupMembership    
}
#>
 function Get-ComputerAccount{
    param(
        [ValidateNotNullOrEmpty()]
        [string]$Identity="",
        [string]$Group
    )
    foreach($User in $Identity){
        if($Identity -eq ""){
        Get-LocalUser 
    }
    if($Identity){
        Get-LocalUser $Identity | select *
    } 
    if($Group){
        Get-ADPrincipalGroupMembership $Group

    }
    }
}