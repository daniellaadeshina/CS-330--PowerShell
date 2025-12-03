PLP 5: Classes and Inheritance in PowerShell

This tutorial explains how classes and inheritance work in PowerShell using simple examples. The purpose is to show how objects are created, how parent and child classes work, and how constructors and methods function. This guide is written for someone who is new to PowerShell and wants to understand object oriented programming in it.

All code for this assignment is in plp5-classes.ps1.

1. What a Class Is in PowerShell

A class in PowerShell is a template for creating objects.
A class includes:

attributes (data stored in the object)

methods (actions the object can take)

a constructor (runs when a new object is created)

PowerShell class structure:

class ClassName {
    # attributes
    # constructor
    # methods
}

2. Creating a Person Class

The first class in this project is Person, which represents a basic person with a first name, last name, and age.

Attributes
[string]$FirstName
[string]$LastName
[int]$Age

Constructor
Person([string]$firstName, [string]$lastName, [int]$age) {
    $this.FirstName = $firstName
    $this.LastName = $lastName
    $this.Age = $age
}


$this refers to the object being created.

Methods

Example method that returns the full name:

[string] GetFullName() {
    return "$($this.FirstName) $($this.LastName)"
}


The Person class also includes a summary method and a method that increases the age.

3. Creating a Student Class (Inheritance)

PowerShell supports inheritance, which allows one class to build on another.

The Student class inherits from Person:

class Student : Person


This means Student has everything Person has, plus new features.

Student Attributes
[string]$Major
[double]$Gpa

Student Constructor
Student([string]$first, [string]$last, [int]$age, [string]$major, [double]$gpa)
    : base($first, $last, $age) {

    $this.Major = $major
    $this.Gpa = $gpa
}


The base(...) call passes information to the parent constructor.

Overriding a Method

The Student class overrides the Person class’s GetSummary() method:

[string] GetSummary() {
    $baseSummary = ([Person]$this).GetSummary()
    return "$baseSummary They are a student studying $($this.Major) with GPA $($this.Gpa)."
}


This shows polymorphism, where the same method name behaves differently in the child class.

4. Creating Objects (Instantiation)

To create new objects:

$person1 = [Person]::new("Treasure", "Afolayan", 21)
$student1 = [Student]::new("Treasure", "Afolayan", 21, "Computer Science", 3.7)

Accessing Attributes
$student1.Major
$person1.Age

Calling Methods
$student1.UpdateGpa(3.9)
$person1.HaveBirthday()

5. Variable Accessibility and Scope

Class attributes stay alive as long as the object exists.

Variables inside methods only exist while the method runs.

Attributes are public unless marked private, so they can be changed directly:

$student1.Age = 22

6. Why Use Classes in PowerShell

Classes are helpful for organizing larger scripts. They allow you to:

structure code more clearly

reuse attributes and methods

model real-world objects

use inheritance

override methods

build more advanced tools

PowerShell is known for automation, but it also handles object oriented programming well.

7. What This Tutorial Demonstrates

This guide explains how to:

define classes in PowerShell

add attributes and methods

build constructors

create a child class

use inheritance

override methods

create and work with objects

understand basic scope rules

All examples are implemented in plp5-classes.ps1.

Sources

Microsoft Learn. “about_Classes: Defining Classes in PowerShell.”

Microsoft Learn. “about_Methods: Using Methods in PowerShell Classes.”

Microsoft Learn. “PowerShell Inheritance and Object-Oriented Features.”

PowerShell 5.0 Class Syntax Documentation.

PowerShell GitHub Documentation on class behavior.

