<#
###First question

foreach($i in 1..9){
    foreach($j in 1..$i){
        Write-Host  -NoNewline $j"*"$i=$($i*$j) "  "
    }
     
    echo " "
   } 


###Second question

$r=1
while($r -le 9){
    $i=1
    while($i -le $r){    
        Write-Host -NoNewline $i"*"$r=$($i*$r) "  "
        $i=$i+1
        
    }
    echo "  "
    
    $r=$r+1
}


###Third  question

$r=1
do{  
$i=1
    do{
     Write-Host -NoNewline $i"*"$r=$($i*$r) "  "
    $i=$i+1
    }while($i -le $r)
    echo "  "  
    $r=$r+1
}while($r -le 9)


###Fourth question

$r=1
do
{
$i=1
    do{
    Write-Host -NoNewline $i"*"$r=$($i*$r) "  "
    $i=$i+1
    }until($i -ge ($r+1))
    echo "  "
    $r=$r+1
}until($r -ge 10)


###The first graphic

for ($i=1;$i -lt 7;$i++){
    for ($r=1;$r -lt $i;$r++){
        Write-Host -NoNewline "*" 
    }
    Write-Output "  "
}
Write-Output  "     "
for ($a=5;$a -ge 1;$a--){
    for ($b=1;$b -le $a;$b++){
        Write-Host -NoNewline "*" 
    }
    Write-Output  "    "
}

###Second graphic

for ($a=1;$a -le 5;$a++){
    for($b=5;$b -ge $a;$b--){
        Write-Host -NoNewline "  "
    }
    for ($c=1;$c -le $a;$c++){
        Write-Host -NoNewline "*" 
    }
    Write-Output "   "
}
Write-Output "    "

for ($d=1;$d -le 5;$d++){
    for($e=1;$e -le $d;$e++){
        Write-Host -NoNewline "  "
    }
    for ($f=5;$f -ge $d ;$f--){
        Write-Host -NoNewline "*"  
    }
    Write-Output "   "
}


###正反居中三角形
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



for ($i=1;$i -le 5;$i++){
    for($q=5;$q -ge $i;$q--){
        Write-Host -NoNewline " "
    }
    for($r=1;$r -le $i;$r++){
        Write-Host -NoNewline " *"
    }
        Write-Output "   "

    
    }
    Write-Output "   "


for ($a=1;$a -le 5;$a++){
    for($d=4;$d -ge $a;$d--){
        Write-Host -NoNewline " "
    }
#    for($q=2;$q -ge $a;$q--){
#        Write-Host -NoNewline " "
#    }
    for($c=1;$c -le $a;$c++){
        Write-Host -NoNewline " *" 
        
    }
    Write-Output "   "


}
for ($f=1;$f -le 5;$f++){
    for($g=0;$g -lt $f;$g++){
        Write-Host -NoNewline " "
    }
    for($e=4;$e -ge $f;$e--){
        Write-Host -NoNewline " *" 
        
    } 
    Write-Output " "
}



for($i=1;$i -lt 7;$i++){
        if ($i%2 -eq 1){
        Continue
    }
    for($b=5;$b -ge $i;$b--){
        Write-Host -NoNewline " "
        }
    for($a=1;$a -lt $i;$a++){

    Write-Host -NoNewline "*"  ""
    }
    Write-Output "  "
}
foreach( $j in 1..4 ){
    Write-Host -NoNewline " * * * *"
    Write-Output "   "
    }
#>
