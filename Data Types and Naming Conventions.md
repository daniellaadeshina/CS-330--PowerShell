# PLP 2 — PowerShell: Data types & naming conventions


* **Language:** PowerShell (variables begin with `$`) — variables are created when first assigned and are case-insensitive (PowerShell preserves case but does not treat `$Var` and `$var` as different names).
* **Typing:** PowerShell is **dynamically typed by default** (a variable’s value has a type at runtime), but it supports explicit/static typing and casting when you want it. Implicit and explicit conversions are both supported.
* **Collections / complex types:** PowerShell has arrays (lists), hashtables (dictionaries), PSCustomObject and other .NET types available.
* **Naming conventions (community / best practice):** Functions/cmdlets use `Verb-Noun` and **PascalCase**; parameters use PascalCase; local variables are commonly camelCase or PascalCase depending on team style (these are style guidelines, enforced by linters/tools — not by the interpreter).


##answers to the assignment questions

### 1) Keywords / reserved words

PowerShell has language keywords and a list of reserved words that have special meanings and should not be used as identifiers unless escaped/quoted. See Microsoft’s `about_Reserved_Words` and `about_Language_Keywords` documentation for the full lists.

### 2) Naming requirements for variables

* Variable names **begin with `$`** (the variable *name* starts after the `$`). Example: `$userName`.
* Best practice: use only letters, digits and underscore (`_`) for readability. You *can* use spaces/special characters by using the `{}` form (e.g. `${my var}`) but this is awkward and discouraged.
* Variable names are **not case-sensitive** (PowerShell is case-insensitive by default) but PowerShell *preserves* the case you typed (useful for readability).

### 3) Naming conventions and enforcement

* Conventions (PascalCase for public items, Verb-Noun for functions, camelCase or PascalCase for local variables) are **community / project conventions** (PowerShellPracticeAndStyle, PSScriptAnalyzer etc.) — they are *not* enforced by the interpreter, but linters and style checkers can enforce them for your repo.

### 4) Static vs dynamic, strong vs weak typing

* **Dynamically typed** by default: variables are created when assigned and the *value* carries the type. You can, however, declare types explicitly with type accelerators (e.g. `[int]`, `[string]`) or use typed parameters and class definitions.
* **Strong vs weak:** PowerShell has a robust .NET-backed type system (types matter), but it performs **implicit conversions** when needed. That means it’s dynamically typed with flexible conversion rules; many authors call it *dynamically typed with a strong type system*. Use explicit casts when you need exact control.

### 5) Mutability

* Variables are **mutable** by default. You *can* create read-only or constant variables (variable options) if you need immutability for some names (PowerShell supports ReadOnly and Constant options). These are supported by the variable provider and can be managed with `Set-Variable`/`New-Variable` or via `Variable:` provider.

### 6) Operators available (summary)

* **Arithmetic:** `+ - * / %` (note: `+` does numeric add *or* concatenates strings/arrays/hashtables).
* **Comparison:** `-eq -ne -gt -lt` and case-sensitive variants `-ceq -cne` etc.
* **Logical:** `-and -or -not`, and many more (PowerShell includes many operator categories). See `about_Operators`.

### 7) Mixed-type operations and binding time

* Mixed-type operations **are allowed**; PowerShell will perform implicit conversions where reasonable (e.g., adding an `int` and a `double` yields a `double`). If it cannot convert implicitly, you must cast explicitly (e.g., `[int]` or `[double]`).
* **Binding time:** Names (variables, functions) and operator tokens are parsed and resolved at runtime in PowerShell’s dynamic model. Types are associated with *values* at runtime; operators are parsed and then executed using runtime types and conversion rules. (This is why you can change a variable’s value/type during execution.)


## Short answers to the example given in the assignment

> If you put this line in a program and try to print `x = "5" + 6`, what does it do?

* In **PowerShell** that expression **concatenates** because `+` concatenates strings and arrays when one operand is a string. The result is the string `"56"`. To perform numeric addition, cast the string: `[int]"5" + 6` ⇒ `11`. (Demonstrated in the script above.)


## Limitations, pitfalls, and other notes

* **Implicit conversions are convenient but can surprise you.** Always explicitly cast when you need exact numeric behavior (especially for rounding). PowerShell’s implicit conversions try to preserve the "sense" of the value but you should not rely on them for critical numeric correctness.
* **Integer rounding / casting:** casting to `[int]` truncates/rounds according to .NET rules (beware midpoint rounding behavior — use `[Math]::Truncate()` or `[Math]::Round()` for explicit control).
* **Arrays are heterogenous by default** — you may put mixed types in the same array because arrays are object arrays (`object[]`). That’s powerful but may cause runtime errors if you expect all elements to be numbers and one element is a string.
* **Naming style vs enforcement:** style rules (PascalCase, Verb-Noun) help readability and fit the PowerShell ecosystem. Use linters like **PSScriptAnalyzer** and the community style guide to enforce them in shared code.


## Built-in complex data types (common)

* **PSCustomObject** — used for structured records (like small objects).
* **Hashtable** (`[System.Collections.Hashtable]`) — dictionaries / maps.
* **Arrays / generic lists / .NET objects** — nearly any .NET type is available (DateTime, XML, Byte arrays, Streams, etc.).


## Sources / further reading (these are the references I used)

* Microsoft docs — Variables & lexical rules.
* Microsoft docs — PowerShell types and language spec.
* Microsoft docs — Type conversion (implicit & explicit).
* Microsoft docs — Hashtables (dictionaries).
* Microsoft docs — Function naming and Verb-Noun guidance.
* PowerShell Practice & Style (community style guide).



