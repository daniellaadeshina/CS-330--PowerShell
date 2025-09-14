# CS-330--PowerShell
History and Getting Started: PowerShell

**1. What is the name of your language?**
The programming language I chose is PowerShell.

**2. When/where was it created, and by whom? Was it written to address a particular problem or need?**
   PowerShell was created by Microsoft in 2006. It was originally developed under the code name Monad by Jeffrey Snover, who was the lead architect. The main goal was to provide a more powerful and flexible command-line shell and scripting language for Windows systems. Before PowerShell, Windows administrators relied heavily on GUIs (graphical interfaces) or limited tools like Command Prompt. PowerShell solved this by letting administrators automate tasks, manage configurations, and control large numbers of computers efficiently.

**4. What types of programming is your language primarily used for?**
PowerShell is mainly used for:
System administration (managing Windows and, more recently, Linux/macOS systems).
Cybersecurity tasks (incident response, detecting suspicious processes, checking logs).
Automation (scheduling updates, monitoring servers, deploying software).
Cloud management (controlling Microsoft Azure environments).

**Examples of projects:**
Writing scripts that detect failed login attempts to identify possible brute force attacks.
Automating network configuration across hundreds of computers.
Managing Active Directory users and groups in corporate environments.

**4. Where will you get information about this language when it’s time to start programming in it?**
I will use official documentation, online tutorials, and reference books. Here are some resources specific to PowerShell:

**Books:**
Learn Windows PowerShell in a Month of Lunches by Don Jones and Jeffrey Hicks

Windows PowerShell Cookbook by Lee Holmes

**Websites:**

Microsoft PowerShell Documentation: https://learn.microsoft.com/powershell/

PowerShell GitHub Page: https://github.com/PowerShell/PowerShell

TutorialsPoint PowerShell Guide: https://www.tutorialspoint.com/powershell/index.htm



**# GETTING STARTED**

**What I needed to do to install PowerShell**

Which edition to use:
Use PowerShell 7 (pwsh), it’s the cross-platform, actively maintained edition from Microsoft (recommended for new work).

**Quick install options (pick one for your OS):**

**Windows (GUI / MSI):**

Download the MSI installer from the PowerShell docs/github and run it **(be sure to download the windows arm64 msi)**. Follow the prompts to install. After install, you’ll have the pwsh app available.

**MacOS:**

Download the PKG installer from the PowerShell docs/github and run it **(be sure to download the osx arm64 pkg)**. Follow the prompts to install. After install, you can run PowerShell from Terminal with: pwsh


**Recommended programming environment and why**

Use Visual Studio Code + PowerShell extension.
Microsoft recommends VS Code with the official PowerShell extension because it gives syntax highlighting, IntelliSense, integrated debugging, and a smooth script-running experience. Since I already have VS Code, I’ll use that.

**How to set it up in VS Code**

Open VS Code, go to Extensions and search PowerShell, then install the official Microsoft extension.

Open the integrated terminal and make sure the shell is PowerShell.


**Hello world: the program you will write**

Create a file named **hello.ps1** (or **hello-world.ps1**) and paste: start the line with #


 **hello.ps1 - simple Hello World**
 
**Write-Output "Hello, world!"**

**Why Write-Output?**
Write-Output writes objects to the pipeline and is good for scripts. Write-Host prints to the host directly; either works for a simple display but Write-Output is more "script friendly."

**How to run the program**

In VS Code (recommended):

Open the folder containing **hello.ps1** in VS Code.

Open the integrated terminal (make sure it’s a PowerShell terminal).

Run:
**.\hello.ps1**

You should see:
**Hello, world!**

Alternatively, you can press **F5** to debug/run the script (PowerShell extension provides debugging).


**How to write comments in PowerShell**

Single-line comment: start the line with #

**This is a single-line comment**

**Write-Output "hi"**

Block comment (multi-line): use <# to start and #> to end

**<#
  This is a block comment.**
  
  **It can span multiple lines.
#>**



**Resources / references**

Microsoft — Install PowerShell on Windows / Linux / macOS (official install docs). 
Microsoft Learn:https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.5&utm_source=chatgpt.com

Microsoft — Using Visual Studio Code for PowerShell Development (recommended editor & extension). 
Microsoft Learn:https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/vscode/using-vscode?view=powershell-7.5&utm_source=chatgpt.com


Microsoft — Comments & comment-based help (how to write comments). 
Microsoft Learn:https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comments?view=powershell-7.5&utm_source=chatgpt.com


Visual Studio Code — PowerShell language support / debugging. 
Visual Studio Code:https://code.visualstudio.com/docs/languages/powershell?utm_source=chatgpt.com



