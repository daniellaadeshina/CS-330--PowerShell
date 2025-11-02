# PLP 4 – Functions in PowerShell

# 1. Function: multiply two numbers
function Multiply-Numbers {
    param($a, $b)
    return $a * $b
}

$result1 = Multiply-Numbers 4 5
Write-Output "Multiply result: $result1"

# 2. Recursive function: factorial
function Get-Factorial {
    param($n)
    if ($n -le 1) { return 1 }
    else { return $n * (Get-Factorial ($n - 1)) }
}

$result2 = Get-Factorial 5
Write-Output "Factorial of 5: $result2"

# 3. Function: split a string in half
function Split-String {
    param($text)
    $mid = [math]::Floor($text.Length / 2)
    $first = $text.Substring(0, $mid)
    $second = $text.Substring($mid)
    return ,$first, $second
}

$split = Split-String "PowerShell"
Write-Output "Split result: $($split[0]) | $($split[1])"

# 4. Test: pass-by-value vs pass-by-reference
function Add-Five-ByValue {
    param($num)
    $num += 5
}

function Add-Five-ByRef {
    param([ref]$num)
    $num.Value += 5
}

$value1 = 10
Add-Five-ByValue $value1
Write-Output "After Add-Five-ByValue: $value1"

$value2 = 10
Add-Five-ByRef ([ref]$value2)
Write-Output "After Add-Five-ByRef: $value2"
