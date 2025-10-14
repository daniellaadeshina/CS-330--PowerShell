**Boolean values**: PowerShell uses $true and $false. Many other values can be implicitly converted to Boolean following PowerShell rules (empty collections, 0, "", and $null convert to $false in many contexts). 

**Conditional statement types available:**

if (condition) { ... }

if (cond) { } elseif (cond2) { } else { } (PowerShell uses elseif as one word). 

PowerShell does not have an unless keyword like Perl, but you can invert conditions with -not or ! and use if (-not $cond) { }.

**Block delimiters:** Code blocks use curly braces { ... }. The condition expression sits inside parentheses: if ( $x -eq 1 ) { ... }. 

**Short-circuit evaluation:**

The logical operators -and and -or are language operators and historically evaluate both operands (they do not short-circuit in the same way other languages’ &&/|| do).

PowerShell 7 added the pipeline chain operators && and || which short-circuit command execution (they run the right-hand command only if the left-hand command succeeds/fails as appropriate). Use the &&/|| pipeline chain operators when you want command chaining with short-circuit semantics. 


**Dangling else:** PowerShell follows the usual rule: an else pairs with the nearest unmatched if. Using braces {} consistently prevents ambiguity. (Best practice: always include braces to avoid dangling-else confusion.) 

**Switch/case behavior:** PowerShell has a switch statement. By default, if multiple cases match, PowerShell executes every matching case block. Use break to exit the switch immediately, and continue to skip the current value (useful when switching over arrays). 

**1. One-condition if/else (if x == true)**

PowerShell example:

if ($isReady) {
  "Ready"
} else {
  "Not ready"
}


A condition is anything that converts to Boolean; typical Boolean values are $true/$false. 


**2. Multi-condition (if x>0 && y<10)**

PowerShell logical comparisons (non-short-circuit):

if ( ($x -gt 0) -and ($y -lt 10) ) {
  "x>0 and y<10"
}


If you need short-circuit behavior for commands (PowerShell 7+), you can chain commands:

Test-Command1 && Test-Command2


(Use &&/|| when you want the second command only to run depending on the first command's success/failure.) 


**3. if / elseif / else**

PowerShell uses elseif (one word):

if ($score -ge 90) {
  "A"
} elseif ($score -ge 80) {
  "B"
} else {
  "C or lower"
}


Each elseif is only evaluated if all previous tests were false. 

**4. Short-circuit logic (example)**

-and and -or evaluate both operands (so side effects in either operand will run).

&&/|| (PowerShell 7+) are pipeline chain operators and only run the right side depending on the left side’s success.


**5. switch / case**

PowerShell switch supports value matches, wildcard, regex, and scriptblock tests. By default multiple case blocks can run for one input; use break to stop after the first match. 


**Sources**

PowerShell Booleans & conversion rules. 
Microsoft Learn

Deep dive — if statement in PowerShell. 
Microsoft Learn


Operators overview (including notes about &&/|| added in PS7). 
Microsoft Learn


switch behavior and use of break / continue. 
Microsoft Learn

