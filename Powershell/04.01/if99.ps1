for ($a=1;$a -le 6;$a++){
    for($b=5;$b -ge $a;$b--){
    Write-Host -NoNewline " "
    }
    for ($c=1;$c -le $a;$c++){
    Write-Host -NoNewline "*" 
    }
    Write-Output " "
}
Write-Output " "

for ($d=1;$d -le 6;$d++){
    for($e=2;$e -le $d;$e++){
    Write-Host -NoNewline " "
    }
    for ($f=6;$f -ge $d ;$f--){
    Write-Host -NoNewline "*"  
    }
    Write-Output " "
}