## Switch

相当于Shell的case

```powershell
$day = 3
switch -CaseSentitive -Wildcard($day){
	0 {$result = "Sunday"}
	1 {$result = "Monday"}
	2 {$result = "Tuesday"}
	3 {$result = "Wednesday"}
	4 {$result = "Thursday"}
	5 {$result = "Friday"}
	6 {$result = "Sturday"}
	default { "Unknown" }
}
$result
```

-CaseSensitive

​	区分大小写

-Wildcard

​	用-wildcard 开关来启用通配符支持

-Regx

​	支持正则表达式匹配

-File

​	可以处理文件

```powershell
$path = "C:\Users\Administrator\Desktop\aaa.txt"
 Switch -Wildcard -Regex -File $path{
        'Error*'
        {
            Write-Error -Message $_
        }
        "Warning*"
        {
            Write-Warning -Message $PSItem
        }
        default
        {
            Write-Information $PSItem
        }
 }
-------------------------------------------
PS C:\Users\Administrator>C:\Users\Administrator\Desktop\4.3PM.ps1
警告: Warningasdasdas
```

#### 高级详细信息

![image-20230404154858181](C:\Users\Yun\AppData\Roaming\Typora\typora-user-images\image-20230404154858181.png)

#### 1.表达式

```powersehll
switch ( ( Get-Service | Where status -eq 'running' ).name ) {...} 		
```

#### 2.continue

continue会继续进行到集合的下一项，如果没有其它项，则会退出switch，第一个项匹配成功后下面的项没有相对应的值的话，switc就会退出

#### 3.break

break直接退出switch，停止switch中的所有处理。

```powershell
$Messages = @( 
 'Downloading update' 
 'Ran into errors downloading file' 
 'Error: out of disk space' 
 'Sending email' 
 '...' 
) 
switch -Wildcard ($Messages) 
{ 
 'Error*' 
 { 
 Write-Error -Message $PSItem 
 break 
 } 
 '*Error*' 
 { 
 Write-Warning -Message $PSItem 
 continue 
 } 
 '*Warning*' 
 { 
 Write-Warning -Message $PSItem 
 continue 
 } 
 default 
 { 
 Write-Output $PSItem 
 } 
} 
# 输出
Downloading update 
WARNING: Ran into errors downloading file 
write-error -message $PSItem : Error: out of disk space 
+ CategoryInfo : NotSpecified: (:) [Write-Error], 
WriteErrorException 
+ FullyQualifiedErrorId : 
Microsoft.PowerShell.Commands.WriteErrorException
```



## 数组

#### 1.创建数组

$date=@()

```
$data = @( 
 'Zero' 
 'One' 
 'Two' 
 'Three' 
) 

$data = 'Zero','One','Two','Three'

$data = Write-Output Zero One Two Three
```

#### 2.访问项

##### 1.Offset

```
PS> $data = 'Zero','One','Two','Three' 
PS> $data[0] 
Zero 
```

#### 2.索引

在powershell中当索引超出范围的时候还是会返回True

```
PS> $data[0,2,3] #[1..3]
Zero 
Two 
Three 
```

##### 1.count

对数组和其他集合有计数属性，

```
PS> $data.count 
4
PS> $date = Get-Date 
PS> $date.count 
1
PS> $null.count 
0
```

取最后一项

```
$data[ $data.count -1] 
或者：
PS> $data[ -1 ] 
Three 
```

```
取最大索引号
PS> $data.GetUpperBound(0) 
3 
```

#### 3.更新项

```
$data[2] = 'dos' 
$data[3] = 'tres'
```

#### 4.迭代

##### 1.管道

```
PS> $data = 'Zero','One','Two','Three' 
PS> $data | ForEach-Object {"Item: [$PSItem]"} 
Item: [Zero] 
Item: [One] 
Item: [Two] 
Item: [Three] 
```

##### 2.ForEach

```
foreach ( $node in $data ) 
{ 
 "Item: [$node]" 
} 
```

##### 3.ForEach方法

```
PS> $data.foreach({"Item [$PSItem]"}) 
Item [Zero] 
Item [One] 
Item [Two] 
Item [Three] 

$data.foreach{"Item [$PSItem]"}
```

##### 4.For循环

Format 运算符 (-f) 用于在输出字符串中插入 的 $data[$index] 值

```
for ( $index = 0; $index -lt $data.count; $index++) 
{ 
 "Item: [{0}]" -f $data[$index] 
} 
```

##### 5.更新值

```
for ( $index = 0; $index -lt $data.count; $index++ ) 
{ 
 $data[$index] = "Item: [{0}]" -f $data[$index] 
}
#此示例通过索引获取一个值，进行一些更改，然后使用同一个索引将其分配回去。
```

#### 5.对象数组

```
$data = @( 
 [pscustomobject]@{FirstName='Kevin';LastName='Marquette'} 
 [pscustomobject]@{FirstName='John'; LastName='Doe'} 
) 
$processList = Get-Process 

```

##### 1.访问属性

```
PS> $data[0].FirstName 
Kevin 
PS> $data[0].FirstName = 'Jay' 
PS> $data[0] 
FirstName LastName 
----- ---- 
Jay Marquette
```

##### 2.数组属性

```
PS> $data | ForEach-Object {$_.LastName} 
Marquette 
Doe 

PS> $data | Select-Object -ExpandProperty LastName 
Marquette 
Doe 

PS> $data.LastName 
Marquette 
Doe
```

#### 6.Where-Object筛选

```
#根据对象属性，从数组中赛选并选择
PS> $data | Where-Object {$_.FirstName -eq 'Kevin'} 
FirstName LastName 
----- ---- 
Kevin Marquette 

$data | Where FirstName -eq Kevin3


foreach($person in $data) 
{ 
 $person = [pscustomobject]@{ 
 FirstName='Kevin' 
 LastName='Marquette' 
 } 
}
```

#### 7.运算符

##### 1.-join

```
PS> $data = @(1,2,3,4) 
PS> $data -join '-' 
1-2-3-4 
PS> $data -join ',' 
1,2,3,4

PS> $data = @(1,2,3,4) 
PS> "Data is $($data -join ',')." 
Data is 1,2,3,4

PS> $data = @(1,2,3,4) 
PS> $data -join $null 
1234 
```

##### 2.-replace和-split

```
PS> $data = @('ATX-SQL-01','ATX-SQL-02','ATX-SQL-03') 
PS> $data -replace 'ATX','LAX' 
LAX-SQL-01 
LAX-SQL-02 
LAX-SQL-03 
```

##### 3.-contains

```
PS> $data = @('red','green','blue') 
PS> $data -contains 'green' 
True
```

##### 4.-in 

```
PS> $data = @('red','green','blue') 
PS> $pattern = "^({0})$" -f ($data -join '|') 
PS> $pattern 
^(red|green|blue)$ 
PS> 'green' -match $pattern 
True
```

##### 5.-eq和-ne

```
PS> $data = @('red','green','blue') 
PS> 'green' -in $data 
True

PS> $data = @('red','green','blue') 
PS> $pattern = "^({0})$" -f ($data -join '|') 
PS> $pattern 
^(red|green|blue)$ 
PS> 'green' -match $pattern 
True
```

##### 6.match

检索

```
PS> $servers = @( 
 'LAX-SQL-01' 
 'LAX-API-01' 
 'ATX-SQL-01' 
 'ATX-API-01' 
) 
PS> $servers -match 'SQL' 
LAX-SQL-01 
ATX-SQL-01
```

#### 8.添加到数组

##### 1.数组加法

```
$first = @( 
 'Zero' 
 'One' 
) 
$second = @( 
 'Two' 
 'Three' 
) 
PS> $first + $second 
Zero 
One 
Two 
Three 
```

##### 2.+=

```
$data = @( 
 'Zero' 
 'One' 
 'Two' 
 'Three' 
) 
$data += 'four'
```

##### 3.管道分配

```
$array = 1..5 | ForEach-Object { 
 "ATX-SQL-$PSItem" 
} 

$array = foreach ( $node in (1..5)) 
{ 
 "ATX-SQL-$node" 
} 
```

#### 9.数组类型

##### 1.强类型数组

创建强类型数组时，它只 能包含指定类型的值或对象

```
PS> [int[]] $numbers = 1,2,3 
PS> [int[]] $numbers2 = 'one','two','three' 
ERROR: Cannot convert value "one" to type "System.Int32". Input string 
was not in a correct format." 
PS> [string[]] $strings = 'one','two','three'
```

##### 2.预调整数组大小

数组一旦创建就不能更改它的大小。 通过使用 new($size) 构造函数调用它， 我们可以创建一个预先确定大小的数组

```
$data = [Object[]]::new(4) 
$data.count 
4 
```

##### 3.数组倍增

数组与整数相乘

```
PS> $data = @('red','green','blue') 
PS> $data * 3 
red 
green 
blue 
red 
green 
blue 
red 
green 
blue
```

##### 4.用0初始化

创建一个全为零的数组。如果只打算包含整数， 则强类型整数数组的默认值均为零。

```
PS> [int[]]::new(4) 
0 
0 
0 
0

PS> $data = @(0) * 4 
PS> $data 
0 
0 
0 
0 
```

5嵌套数组

```
$data = @(@(1,2,3),@(4,5,6),@(7,8,9)) 
$data2 = @( 
 @(1,2,3), 
 @(4,5,6), 
 @(7,8,9) 
)

PS> $outside = 0 
PS> $inside = 2 
PS> $data[$outside][$inside] 
3
```

##### 6. Write-Output -NoEnumerate 

```
PS> $data = @('red','green','blue') 
PS> $data | Get-Member 
TypeName: System.String

PS> ,$data | Get-Member 
TypeName: System.Object[] 
... 
```

##### 7.返回数组

当从函数输出或返回值时，也会发生这种数组展开的情况。 如果将输出分 配给变量，则仍可获取一个数组，所以这通常不是问题。 问题是你有了一个新数组。 如果出现这个问题，可以使用 Write-Output - NoEnumerate $array 或 return ,$array 来解决。