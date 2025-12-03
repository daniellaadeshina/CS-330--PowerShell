class Person {
    [string]$FirstName
    [string]$LastName
    [int]$Age

    Person([string]$firstName, [string]$lastName, [int]$age) {
        $this.FirstName = $firstName
        $this.LastName = $lastName
        $this.Age = $age
    }

    [string] GetFullName() {
        return "$($this.FirstName) $($this.LastName)"
    }

    [void] HaveBirthday() {
        $this.Age++
    }

    [string] GetSummary() {
        return "$($this.GetFullName()) is $($this.Age) years old."
    }

    # this lets us print the object directly
    [string] ToString() {
        return $this.GetSummary()
    }
}

class Student : Person {
    [string]$Major
    [double]$Gpa

    Student(
        [string]$firstName,
        [string]$lastName,
        [int]$age,
        [string]$major,
        [double]$gpa
    ) : base($firstName, $lastName, $age) {
        $this.Major = $major
        $this.Gpa = $gpa
    }

    [void] UpdateGpa([double]$newGpa) {
        $this.Gpa = $newGpa
    }

    [void] ChangeMajor([string]$newMajor) {
        $this.Major = $newMajor
    }

    # override the summary with student specific info
    [string] GetSummary() {
        $baseSummary = ([Person]$this).GetSummary()
        return "$baseSummary They are a student studying $($this.Major) with GPA $($this.Gpa)."
    }

    # ToString uses the new student summary
    [string] ToString() {
        return $this.GetSummary()
    }
}

Write-Output "=== Person object test ==="
$person1 = [Person]::new("Treasure", "Afolayan", 21)

Write-Output "Full name:"
Write-Output $person1.GetFullName()

Write-Output "Summary:"
Write-Output $person1.GetSummary()

Write-Output "Having a birthday..."
$person1.HaveBirthday()
Write-Output "After birthday:"
Write-Output $person1   # this calls ToString()

Write-Output ""
Write-Output "=== Student object test ==="
$student1 = [Student]::new("Treasure", "Afolayan", 21, "Computer Science", 3.7)

Write-Output "Student summary:"
Write-Output $student1.GetSummary()

Write-Output "Updating GPA and major..."
$student1.UpdateGpa(3.9)
$student1.ChangeMajor("Data Science")

Write-Output "New summary:"
Write-Output $student1   # uses overridden ToString

Write-Output ""
Write-Output "Modifying variables directly:"
$student1.Age = 22
Write-Output "Age changed to $($student1.Age)"
Write-Output $student1.GetSummary()
