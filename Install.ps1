<#
.Synopsis
    This script is the installation template
.DESCRIPTION
    This script is the installation template
.PARAMETER List 
    None
.INPUTS
    None
.OUTPUTS
    Log file of actions result
.NOTES
    Version:        1.0
    Author:         GB
    Creation Date:  8.27.20
    Purpose/Change: Initial script development
.EXAMPLE
    ./Install.ps1
.EXAMPLE
    ./Install.ps1
#>

# Log file location and name
$ScriptName = "Install"
$LogFile = ".\$ScriptName.txt"
Start-Transcript -Path $Logfile

# Gather system information
$BiosSerial = `
(Get-WmiObject Win32_BIOS).SerialNumber
$BiosVer = `
(Get-WmiObject Win32_BIOS).SMBIOSBIOSVersion
$BuildLabEx = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').BuildLabEx
$CompMfr = `
(Get-WmiObject Win32_ComputerSystem).Manufacturer
$CompModel = `
(Get-WmiObject Win32_ComputerSystem).Model
$CompositionEditionID = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CompositionEditionID
$ComputerName = `
(Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName').ComputerName
$CPU = `
(Get-WmiObject Win32_OperatingSystem).OSArchitecture
$CurrentVersion = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentVersion
$ProductName = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ProductName
$ReleaseID = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ReleaseId

# Add system information to log file
Write-Output "BIOS Serial Number: $BiosSerial"
Write-Output "BIOS Version: $BiosVer"
Write-Output "Composition Edition: $CompositionEditionID"
Write-Output "Computer Manufacturer: $CompMfr"
Write-Output "Computer Model: $CompModel"
Write-Output "Computer Name: $ComputerName"
Write-Output "CPU: $CPU"
Write-Output "Current Version: $CurrentVersion"
Write-Output "Domain: $env:USERDOMAIN"
Write-Output "Product Name: $ProductName"
Write-Output "ScriptName: $ScriptName"
Write-Output "Release ID: $ReleaseID"
Write-Output "User Name: $env:USERNAME"
Write-Output "Windows BuildLabEx: $BuildLabEx"
Write-Output '============================== End of system information =============================='
Write-Output ' '

# Customization for this script
If (Test-Path -Path "C:\Windows\SysWOW64\OneDriveSetup.exe") {
	Write-Output "Located the file C:\Windows\SysWOW64\OneDriveSetup.exe"
	If (Test-Path -Path "C:\Windows\SysWOW64\Taskkill.exe") {
		Write-Output "Start-Process -FilePath C:\Windows\SysWOW64\Taskkill.exe -ArgumentList /f /im OneDrive.exe"
		Start-Process -FilePath "C:\Windows\SysWOW64\Taskkill.exe" -ArgumentList " /f /im OneDrive.exe"
	}
	
	Write-Output "Start-Process -FilePath C:\Windows\SysWOW64\OneDriveSetup.exe -ArgumentList /uninstall"
	Start-Process -FilePath "C:\Windows\SysWOW64\OneDriveSetup.exe" -ArgumentList " /uninstall"
} Else {
	
	Write-Output "Did not locate the file C:\Windows\SysWOW64\OneDriveSetup.exe"
	
}

If (Test-Path -Path "C:\Windows\System32\OneDriveSetup.exe") {
	Write-Output "Located the file C:\Windows\System32\OneDriveSetup.exe"
	If (Test-Path -Path "C:\Windows\System32\Taskkill.exe") {
		Write-Output "Start-Process -FilePath C:\Windows\System32\Taskkill.exe -ArgumentList /f /im OneDrive.exe"
		Start-Process -FilePath "C:\Windows\System32\Taskkill.exe" -ArgumentList " /f /im OneDrive.exe"
	}
	
	Write-Output "Start-Process -FilePath C:\Windows\System32\OneDriveSetup.exe -ArgumentList /uninstall"
	Start-Process -FilePath "C:\Windows\System32\OneDriveSetup.exe" -ArgumentList " /uninstall"
} Else {
	
	Write-Output "Did not locate the file C:\Windows\System32\OneDriveSetup.exe"
	
}

Write-Output " "

# Add file ending to log file
Write-Output "$ScriptName complete"

Stop-Transcript

