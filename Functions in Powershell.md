PLP 4 Functions in PowerShell

Overview

In this lab, I explored how to create and use functions in PowerShell, including recursion, multiple parameters, multiple return values, and testing pass-by-reference behavior.

1. Function Declaration Syntax

Functions in PowerShell are declared with the keyword function, followed by the function name and a code block in braces {}.
Parameters are declared inside a param() block.

function Say-Hello {
    param($name)
    Write-Output "Hello, $name!"
}


PowerShell reads the entire script before execution, so a function can appear anywhere in the file — above or below where it’s called.

2. Example Functions

See plp4_functions.ps1 for the runnable examples below:

# Multiply two numbers and return the product
function Multiply-Numbers {
    param($a, $b)
    return $a * $b
}

# Recursive factorial function
function Get-Factorial {
    param($n)
    if ($n -le 1) { return 1 }
    else { return $n * (Get-Factorial ($n - 1)) }
}

# Split a string into two halves and return both
function Split-String {
    param($text)
    $mid = [math]::Floor($text.Length / 2)
    $firstHalf  = $text.Substring(0, $mid)
    $secondHalf = $text.Substring($mid)
    return ,$firstHalf, $secondHalf
}

# Test pass-by-reference
function Test-PassBehavior {
    param([ref]$num)
    $num.Value += 5
}

3. Calling the Functions
$result1 = Multiply-Numbers 4 5
Write-Output "Multiply-Numbers(4,5) = $result1"

$result2 = Get-Factorial 5
Write-Output "Factorial of 5 = $result2"

$splitResult = Split-String "PowerShell"
Write-Output "Split result: $($splitResult[0]) | $($splitResult[1])"

$value = 10
Write-Output "Before calling function: $value"
Test-PassBehavior ([ref]$value)
Write-Output "After calling function: $value"

4. Recursion Support

✅ PowerShell supports recursive functions, as shown in Get-Factorial.
Each call adds a new frame to the call stack until the base case is met.

5. Multiple Parameters & Data Types

PowerShell functions can accept any number of parameters.
They can even be typed explicitly:

function Add-Numbers {
    param([int]$x, [int]$y)
    return $x + $y
}

6. Returning Multiple Values

PowerShell doesn’t have a special tuple type, but functions can return arrays:

return ,$firstHalf, $secondHalf


The comma before the first variable forces PowerShell to treat the output as an array even if there’s only one item.

7. Pass-by-Value vs Pass-by-Reference

Default: PowerShell is pass-by-value — the function receives a copy.

By reference: Use [ref] to pass the actual variable reference.

Example:

$value = 10
Test-PassBehavior ([ref]$value)


Inside the function, access the value as $num.Value.

8. Variable Storage & Scoping

Local variables → stored on the stack during execution.

Reference variables → store a pointer to the heap.

PowerShell uses static (lexical) scoping — local variables are visible only inside their function unless explicitly declared as $global: or $script:.

9. Side Effects

Functions can modify global variables or output data without return.
Good practice: return results instead of changing global state.

10. Summary Table
Concept	Supported?	Example
Function Declaration	✅	function Name { }
Recursion	✅	Get-Factorial
Multiple Parameters	✅	param($a,$b)
Multiple Returns	✅ (array)	return ,$x,$y
Pass-by-Reference	✅ ([ref])	Test-PassBehavior
Pass-by-Value	✅ (default)	standard parameters
11. Key Takeaways

PowerShell functions are flexible and can:

Handle multiple parameter types.

Return single or multiple values.

Support recursion and references.

Use simple syntax similar to high-level scripting languages.

References

Microsoft Docs — about_Functions

Microsoft Docs — about_Scopes

Microsoft Docs — about_Ref

Microsoft Docs — about_Return
