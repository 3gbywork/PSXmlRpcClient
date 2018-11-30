Import-Module .\PSXmlRpcClient.psm1

$int=ConvertTo-XmlRpcType -InputObject 365
$bool=ConvertTo-XmlRpcType -InputObject $true
$str=ConvertTo-XmlRpcType -InputObject "<start>!@#$%^&*()</start>"
$double=ConvertTo-XmlRpcType -InputObject 3.65
$datetime=ConvertTo-XmlRpcType -InputObject $([datetime]::Now)
$base64=ConvertTo-XmlRpcType -InputObject $([System.Text.Encoding]::UTF8.GetBytes("3.1415926"))
$struct=ConvertTo-XmlRpcType -InputObject $(@{"name"="value";"key"="value2";"n2"=3.14;"er"=345})
$array=ConvertTo-XmlRpcType -InputObject $("name","merlin","age",18)

ConvertFrom-XmlRpcType -Xml $int
ConvertFrom-XmlRpcType -Xml $bool
ConvertFrom-XmlRpcType -Xml $str
ConvertFrom-XmlRpcType -Xml $double
ConvertFrom-XmlRpcType -Xml $datetime
ConvertFrom-XmlRpcType -Xml $base64
ConvertFrom-XmlRpcType -Xml $struct
ConvertFrom-XmlRpcType -Xml $array

"================================"
"test pythonchallenge xmlrpc"
"--------------------------------"
$serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"
"-----------listMethods----------"
Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.listMethods"
"----methodSignature of phone----"
Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.methodSignature" -Params "phone"
"------methodHelp of phone-------"
Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.methodHelp" -Params "phone"
"================================"