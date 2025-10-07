# plp2_datatypes.ps1
# Demonstrates PowerShell data types, naming conventions, operations, and conversions.

Write-Output "=== Basic Data Types ==="

# integer
[int]$intVar = 7

# string
[string]$strVar = "5"

# floating-point number
[double]$floatVar = 3.14

# boolean
[bool]$boolVar = $true

Write-Output "intVar    = $intVar   (type: $($intVar.GetType().Name))"
Write-Output "strVar    = $strVar   (type: $($strVar.GetType().Name))"
Write-Output "floatVar  = $floatVar (type: $($floatVar.GetType().Name))"
Write-Output "boolVar   = $boolVar  (type: $($boolVar.GetType().Name))"

Write-Output "`n=== Arrays and Hashtables ==="

# Array (can hold mixed types)
$arrayVar = @(1, "two", 3.0)
Write-Output "Array elements: $($arrayVar -join ', ')"
Write-Output "Array element types: $($arrayVar | ForEach-Object { $_.GetType().Name } -join ', ')"

# Hashtable (dictionary)
$dict = @{ Name = "Daniella"; Age = 21; Scores = @(90,85,95) }
Write-Output "Hashtable keys: $($dict.Keys -join ', ')"
Write-Output "Name = $($dict['Name']) (type: $($dict['Name'].GetType().Name))"

Write-Output "`n=== Operations and Conversions ==="

# int + float → float result
$sum1 = $intVar + $floatVar
Write-Output "int + float = $sum1 (type: $($sum1.GetType().Name))"

# string + int → string concatenation
$sum2 = $strVar + 6
Write-Output "'5' + 6 = $sum2 (type: $($sum2.GetType().Name))"

# explicit conversion to int before addition
$sum3 = [int]$strVar + 6
Write-Output "[int]'5' + 6 = $sum3 (type: $($sum3.GetType().Name))"

# division examples
$a = 5
$b = 2
$div = $a / $b
Write-Output "5 / 2 = $div (type: $($div.GetType().Name))"

# integer truncation
$intDiv = [int]($a / $b)
Write-Output "[int](5/2) = $intDiv (type: $($intDiv.GetType().Name))"

# boolean arithmetic (True converts to 1)
$boolNum = [int]$boolVar + 2
Write-Output "true + 2 (after cast) = $boolNum"

Write-Output "`n=== Conversions and Mixed Types ==="

[string]$s = "15"
[int]$iFromString = [int]$s
Write-Output "[int]'15' = $iFromString (type: $($iFromString.GetType().Name))"

$x = "5" + 6
Write-Output "'5' + 6  => $x (type: $($x.GetType().Name))"

Write-Output "`n=== Script complete ==="
