#Script     #运行脚本时创建的范围。脚本中定义的变量仅适用于脚本范围，而不适用于全局或父范围

```
#Global,Private,Local
$global:var123="global"
function test-command{
    $Private:var12 = "Private"
    $local:var11 = "var1"
    $Script:var00 = "Script"

    write-host "$Private:var12"
    write-host "$Local:var11"
    write-host "$Script:var00"
    write-host "$global:var123"
}

test-command
write-host "$Private:var12"
write-host "$Local:var11"
write-host "$Script:var00"
write-host "$global:var123"
```


Local      #默认变量，可以省略修饰符，在当前作用域有效，其它作用域只对它有只读权限

Private    #指定名称为Private且对当前范围可见,私有变量，只会在当前作用域有效，不能贯穿到其他作用域。


using:	#用于在通过和Invoke-Command等Start-Job cmdlet运行脚本时访问在另一个作用域中定义的变量

```
客户端
winrm set winrm/config/client @{TrustedHosts="*"}
winrm quickconfig

服务端：
winrm set winrm/config/client @{TrustedHosts="*"}
$ps = New-PSSession -ComputerName 10.10.10.100 -Credential (Get-Credential)
$a=5 
$b=6 
Invoke-Command -Session $ps -ScriptBlock { 
$result = $Using:a*$Using:b 
Write-Host The result is $result 
}
```

workflow:     #指定名称存在于工作流中,工作流可以将这些命令和操作组合成一个单一的任务，使其更容易管理



变量命名空间PSDrive

Alias:	#在当前作用域中定义的别名

```
function Get-dir{
    [alias("AA")]
    param(
        $Path
        )
        get-childitem -Path $Path
}
```

Env:     #在当前范围内定义的环境变量,环境变量的作用域是整个操作系统。其他应用程序和脚本也可以访问和修改环境变量

```
$ENV:COMPUTER="WSC"
function Test-ENV{
   write-host $ENV:int1
    function Test-Man1{
           $ENV:int1="123"
    }
    Test-Man1
}
Test-ENV
write-host $ENV:int1
```

Function:  #当前作用域中定义的函数

```
function Add-Users1{
    param(
        [parameter(Mandatory)]
        $username
    )
    New-LocalUser -Name $username -NoPassword 
}
${function:Add-Users1}
```


Variable:	#在当前范围内定义的变量

```
function Get-name{
$Variable:name="abc"
write-host $Variable:name

}
Get-name

write-host $Variable:name
```

