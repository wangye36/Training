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