# Script attaches Bluetooth USB
# Author: Martin Keung
# Date: June 13, 2024

# Plug in portable GVS 1.0 Bluetooth dongle, run this script in the terminal and it should connect
# This will open up the serial port and you can then access the dongle via the port and give it commands in Ubuntu

$usbDeviceName = "USBIP Shared Device"

# Inf loop to check and attach the USB Device
while ($true){

    $usbDevice = Get-PnpDevice | Where-Object { $_.FriendlyName -eq $usbDeviceName}

    $id = ($usbDevice.PNPDeviceID -split "\\")[1] # id via PnP device function

    if ($usbDevice) {
    usbipd attach --wsl --busid 2-1 # don't change the bus ID. Found using usbipd list in Powershell
    }

    Write-Host "Successfully attached USBIP Shared Device with BusId $id to WSL."

    # Break
    break

# Wait for 10 seconds before checking again
Start-Sleep -Seconds 10

}