# PLP 3 - Control Statements in PowerShell

# 1. One-condition if/else
$ready = $true
if ($ready) {
    Write-Output "System is ready."
} else {
    Write-Output "System is not ready."
}

# 2. Multi-condition if/else
$x = 5
$y = 8
if (($x -gt 0) -and ($y -lt 10)) {
    Write-Output "x is greater than 0 and y is less than 10."
} else {
    Write-Output "Condition not met."
}

# 3. if / elseif / else
$score = 75
if ($score -ge 90) {
    Write-Output "Grade: A"
} elseif ($score -ge 80) {
    Write-Output "Grade: B"
} else {
    Write-Output "Grade: C or lower"
}

# 4. Short-circuit logic example
# Note: PowerShell evaluates both sides of -and/-or,
# but it short-circuits for commands using && or || (PowerShell 7+)
$trueValue = $true
$falseValue = $false

# Example with -and
if ($trueValue -and $falseValue) {
    Write-Output "Both are true."
} else {
    Write-Output "Short-circuit: One or both are false."
}

# Example with command chaining (PowerShell 7+)
Write-Output "First command succeeds" && Write-Output "So this runs too"

# 5. Switch-case statement
$fruit = "banana"
switch ($fruit) {
    "apple" { Write-Output "You chose apple." }
    "banana" { Write-Output "You chose banana." }
    default { Write-Output "Unknown fruit." }
}
