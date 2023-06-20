<# The goal of this program is to communicate to people
   in the event of an emergency through their Windows PC's.
   
   Author: David Burg
   Creation date: 6/15/23                                #>

# Imports
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName presentationCore

# Play Warning Sound function
function Play-Warning-Sound {
    $playWav = New-Object system.windows.media.mediaplayer
    $playWav.open("C:\Users\dburg\PS_scripts\eas-alarm-81032.wav")
    $playWav.Play()
}

# Display Options
Write-Host "Welcome to the Town of Islip Emergency Broadcast system"
Write-Host "`n"
Write-Host "Please select the emergency needed to be broadcasted:"
Write-Host "1: Active Shooter"
Write-Host "2: Tornado Watch/Warning"
Write-Host "3: Flood Watch/Warning"
Write-Host "4: Bomb Threat"
Write-Host "5: Gas Leak/Hazardous Material Spill"
Write-Host "6: Nuclear Threat Imminent"
Write-Host "7: Test"
Write-Host "8: Other"
Write-Host "`n"

# User inputs their option
$option = Read-Host "Please enter the alert you would like to send out"

# Idiot Proofing (Loop until user enters valid respnse)
while ($option -lt 1 -Or $option -gt 8) {
    $option = Read-Host "Please enter the alert you would like to send out"
}

# Determining the option that the user selected
if ($option -eq 1) {
    $location = Read-Host "Please enter the location of the threat (if known)"
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show("WARNING: Active Shooting at " + $location + ".`nPlease avoid the area if possible or if at specified location,`n evacuate the area if possible.", "Warning", "OK", "Warning")
} elseif ($option -eq 2) {
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show("WARNING: Tornado Watch/Warning issued in the area.`nSeek Shelter Immediatley!", "Warning", "OK", "Warning")
} elseif ($option -eq 3) {
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show("WARNING: Flood Watch/Warning issued in the area. Please be advised.", "Warning", "OK", "Warning")
} elseif ($option -eq 4) {
    $location = Read-Host "Please enter the location of the threat (if known)"
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show("WARNING: Bomb threat at " + $location + ".`nPlease avoid the area if possible or if at specified location,`n evacuate the area immediatley.", "Warning", "OK", "Warning")
} elseif ($option -eq 5) {
    $location = Read-Host "Please enter the location of the threat (if known)"
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show("WARNING: Gas Leak/Hazardous Material Spill at " + $location + ".`nPlease avoid the area if possible or if at specified location,`n evacuate the area immediatley.", "Warning", "OK", "Warning")
} elseif ($option -eq 6) {
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show("WARNING: Nulcear detenation imminent! Please seek shelter immediatley! THIS IS NOT A DRILL.", "Warning", "OK", "Warning")
} elseif ($option -eq 7) {
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show("ATTENTION: This is a test of this Emergency Broadcast System.`n In the event of an emergency, you will receive a notification just like this one.", "Warning", "OK", "Warning")
} else {
    $other = Read-Host "Please Enter the emergency alert you would like to broadcast: "
    Play-Warning-Sound
    [System.Windows.MessageBox]::Show($other, "Warning", "OK", "Warning")
}