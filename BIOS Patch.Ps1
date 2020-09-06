<#
.Synopsis
  This script is the Installation Template
.DESCRIPTION
   This script is the Installation Template
.PARAMETER List 
   None
.INPUTS
   None
.OUTPUTS
   Log file of each actions result
.NOTES
   Version:        1.0
   Author:         GB
   Creation Date:  6.4.19
   Purpose/Change: Initial script development
   Modification Date: 2.14.20, 7.25.20, 7.28.20
   Purpose/Change: Modified for Ingalls Shipbuilding
.EXAMPLE
   ./BIOS Patch.ps1
.EXAMPLE
   ./BIOS Patch.ps1
#>

# Log file location and name
$ScriptName = "BIOS Patch"
$LogPath = ".\$ScriptName.txt"

'********** Ingalls **********' | Add-Content $LogPath

# Gather system information
$ProductName = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ProductName
$ReleaseID = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ReleaseId
$CurrentVersion = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentVersion
$CompositionEditionID = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CompositionEditionID
$BuildLabEx = `
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').BuildLabEx
$ComputerName = `
(Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName').ComputerName
$CompModel = `
(Get-WmiObject Win32_ComputerSystem).Model
$CompMfr = `
(Get-WmiObject Win32_ComputerSystem).Manufacturer
$BiosVer = `
(Get-WmiObject Win32_BIOS).SMBIOSBIOSVersion
$BiosSerial = `
(Get-WmiObject Win32_BIOS).SerialNumber

# Add system information to log file
$CPU = (Get-WmiObject Win32_OperatingSystem).OSArchitecture
"BIOS Serial Number: $BiosSerial" | Add-Content $LogPath
"BIOS Version: $BiosVer" | Add-Content $LogPath
"Composition Edition: $CompositionEditionID" | Add-Content $LogPath
"Computer Manufacturer: $CompMfr" | Add-Content $LogPath
"Computer Model: $CompModel" | Add-Content $LogPath
"Computer Name: $ComputerName" | Add-Content $LogPath
"CPU: $CPU" | Add-Content $LogPath
"Current Version: $CurrentVersion" | Add-Content $LogPath
"Domain: $env:USERDOMAIN" | Add-Content $LogPath
"Product Name: $ProductName" | Add-Content $LogPath
"ScriptName: $ScriptName" | Add-Content $LogPath
"Release ID: $ReleaseID" | Add-Content $LogPath
"User Name: $env:USERNAME" | Add-Content $LogPath
"Windows BuildLabEx: $BuildLabEx" | Add-Content $LogPath

'==================== End of system information ====================' | Add-Content $LogPath

####################################################################################
# Customization for this script

# Get current date and time
$Time = Get-Date -Format "HH:mm:ss MM/dd/yyyy"
"Start Time . $Time" | Add-Content $LogPath

# Get the model
$PCModel = $((Get-WmiObject Win32_ComputerSystem).model)
"Model is $PCModel" | Add-Content $LogPath

# Select the model to assign command line switches
$BIOSFile = Switch ($PCModel){
	
    'HP ProDesk 600 G3 MT'{
        If ($BiosVer -ne 'P02 Ver. 02.34'){
            "$BiosVer -ne 'P02 Ver. 02.34'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f P02_0234.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f P02_0234.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP Z440 Workstation'{
        If ($BiosVer -ne 'M60 v02.54'){
            "$BiosVer -ne 'M60 v02.54'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f M60_0254.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f M60_0254.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProBook 650 G2'{
        If ($BiosVer -ne 'N76 Ver. 01.47'){
            "$BiosVer -ne 'N76 Ver. 01.47'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f N76_0147.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f N76_0147.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProDesk 600 G4 MT'{
        If ($BiosVer -ne 'Q02 Ver. 02.11.01'){
            "$BiosVer -ne 'Q02 Ver. 02.11.01'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProDesk 600 G1 TWR'{
        If ($BiosVer -ne 'L01 v02.78'){
            "$BiosVer -ne 'L01 v02.78'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f L01_0278.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f L01_0278.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProDesk 600 G2 MT'{
        If ($BiosVer -ne 'N02 Ver. 02.47'){
            "$BiosVer -ne 'N02 Ver. 02.47'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f N02_0247.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f N02_0247.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP Z420 Workstation'{
        If ($BiosVer -ne 'J61 v03.96'){
            "$BiosVer -ne 'J61 v03.96'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f J61_0396.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f J61_0396.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ZBook 17'{
        If ($BiosVer -ne 'L70 Ver. 01.47'){
            "$BiosVer -ne 'L70 Ver. 01.47'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f L70_0147.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f L70_0147.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProBook 650 G5'{
        If ($BiosVer -ne 'R72 Ver. 01.05.03'){
            "$BiosVer -ne 'R72 Ver. 01.05.03'" | Add-Content $LogPath
    	    Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProBook 650 G4'{
        If ($BiosVer -ne 'Q83 Ver. 01.11.01'){
            "$BiosVer -ne 'Q83 Ver. 01.11.01'" | Add-Content $LogPath
    	    Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ZBook 17 G3'{
        If ($BiosVer -ne 'N81 Ver. 01.47'){
            "$BiosVer -ne 'N81 Ver. 01.47'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f N81_0147.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f N81_0147.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProBook 650 G1'{
        If ($BiosVer -ne 'L78 Ver. 01.50'){
            "$BiosVer -ne 'L78 Ver. 01.50'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f L78_0150.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f L78_0150.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP Z4 G4 Workstation'{
        If ($BiosVer -ne 'P61 v02.56'){
            "$BiosVer -ne 'P61 v02.56'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f P61_0256.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f P61_0256.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ProDesk 600 G4 SFF'{
        If ($BiosVer -ne 'Q07 Ver. 02.11.01'){
            "$BiosVer -ne 'Q07 Ver. 02.11.01'" | Add-Content $LogPath
    	    Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP EliteBook 820 G3'{
        If ($BiosVer -ne 'N75 Ver. 01.47'){
            "$BiosVer -ne 'N75 Ver. 01.47'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f N75_0147.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f N75_0147.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ZBook 17 G5'{
        If ($BiosVer -ne 'Q70 Ver. 01.11.02'){
            "$BiosVer -ne 'Q70 Ver. 01.11.02'" | Add-Content $LogPath
    	    Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP EliteBook 830 G5'{
        If ($BiosVer -ne 'Q78 Ver. 01.11.01'){
            "$BiosVer -ne 'Q78 Ver. 01.11.01'" | Add-Content $LogPath
    	    Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ZBook 17 G2'{
        If ($BiosVer -ne 'M70 Ver. 01.26'){
            "$BiosVer -ne 'M70 Ver. 01.26'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f M70_0126.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f M70_0126.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP EliteBook Revolve 810 G2'{
        If ($BiosVer -ne 'L86 Ver. 01.46'){
            "$BiosVer -ne 'L86 Ver. 01.46'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f L86_0146.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f L86_0146.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ZBook 17 G6'{
        If ($BiosVer -ne 'R92 Ver. 01.05.04'){
            "$BiosVer -ne 'R92 Ver. 01.05.04'" | Add-Content $LogPath
    	    Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP EliteBook 820 G1'{
        If ($BiosVer -ne 'L71 Ver. 01.49'){
            "$BiosVer -ne 'L71 Ver. 01.49'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f L71_0149.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f L71_0149.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP EliteBook Revolve 810 G3'{
        If ($BiosVer -ne 'M86 Ver. 01.22'){
            "$BiosVer -ne 'M86 Ver. 01.22'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f M86_0122.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f M86_0122.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP EliteDesk 800 G3 DM 35W'{
        If ($BiosVer -ne 'P21 Ver. 02.34'){
            "$BiosVer -ne 'P21 Ver. 02.34'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f P21_0234.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f P21_0234.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP EliteDesk 800 G5 Desktop Mini'{
        If ($BiosVer -ne 'R21_020501'){
            "$BiosVer -ne 'R21_020501'" | Add-Content $LogPath
    	    Start-Process -FilePath "$PSScriptRoot\HpFirmwareUpdRec64.exe" -ArgumentList " -s -a -r -b"
            "Executing - Start-Process -FilePath $PSScriptRoot\HpFirmwareUpdRec64.exe -ArgumentList -s -a -r -b" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }

    'HP ZBook 17 G3 HP ZBook 17 G3'{
        If ($BiosVer -ne 'N81 Ver. 01.47'){
            "$BiosVer -ne 'N81 Ver. 01.47'" | Add-Content $LogPath
            Start-Process -FilePath "$PSScriptRoot\HPBIOSUPDREC64.exe" -ArgumentList " -s -a -r -b -f N81_0147.bin"
            "Executing - Start-Process -FilePath $PSScriptRoot\HPBIOSUPDREC64.exe -ArgumentList -s -a -r -b -f N81_0147.bin" | Add-Content $LogPath

        } Else {

            $EXE = "No EXE"
        }

    }
	
    'HP Compaq Pro 6300 MT'	
    {$EXE = "No EXE"}

    'HP Compaq 6200 Pro MT PC'          			
    {$EXE = "No EXE"}
	
    'HP EliteBook 8770w'          			
    {$EXE = "No EXE"}
	
    '600 G2'          			
    {$EXE = "No EXE"}
	
    'HP ProBook 6570b'
    {$EXE = "No EXE"}

    Default
    {$EXE = "No EXE"}

}

"ComputerID = $ComputerName" | Add-Content $LogPath

# Update Log file
If ($EXE -ne "No EXE") {
    "HP BIOS update applied will install after next reboot" | Add-Content $LogPath

} Else {

    "No BIOS update required for model $PCModel with BIOS Version $BiosVer" | Add-Content $LogPath
}

# Get current date and time
$Time = Get-Date -Format "HH:mm:ss MM/dd/yyyy"
"End Time ... $Time" | Add-Content $LogPath

# Add file ending to log file
"$ScriptName Install complete" | Add-Content $LogPath
