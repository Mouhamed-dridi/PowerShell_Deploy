# Specify the path to the file you want to copy
$fileToCopy = "C:\Users\mohamed dridi\Desktop\bosh deploy\etiquette_bosch.url"

# Specify the destination directory on the remote host
$destinationDir = "C$\Users\Consult\Desktop"

# Specify the list of computers to copy the file to
# deploy to misfat 3
#$computerNames = "PQ3-H46", "PQ3-LFEC", "PQ3-LFEC2", "PQ3-LFAH", "PQ3-LFMO2", "PQ3-PAPR2", "PQ3-PAPR3", "PQ3-LFAE2", "PQ3-PAPL3", "PQ3-G39", "PQ3-LSIR", "PQ3-LFH", "PQ3-LFAA4", "PQ3-LFAA2", "PQ3-LFMO", "PQ3-LFAA5", "PQ3-G33", "PQ3-LFH2", "PQ3-LINP", "PQ3-LFFP", "PQ3-LFAA1"

# deploy to misfat 2
$computerNames = "PQ2-PROD02", "PQ2-LFAV2", "PQ2-PROD01", "PQ2-LFAV4", "PQ2-LFAV3", "PQ2-LFGR", "PQ2-LFGR3", "PQ2-LFAI", "PQ2-PAPL2", "PQ2-PAPL", "PQ2-LCAR", "PQ2-LFAV", "PQ2-D30"

# Loop through the list of computers and copy the file to each one
foreach ($computerName in $computerNames)
{
    # Check if the host is online before attempting to copy the file
    if (Test-Connection -ComputerName $computerName -Quiet)
    {
        # Copy the file to the remote host
        Copy-Item -Path $fileToCopy -Destination "\\$($computerName)\$($destinationDir)"

        # Write a log message to indicate success
        Write-Output "$(Get-Date -Format 'yyyy/MM/dd HH:mm:ss') - File copied to $($computerName)."
    }
    else
    {
        # Write a log message to indicate failure
        Write-Output "$(Get-Date -Format 'yyyy/MM/dd HH:mm:ss') - Failed to copy file to $($computerName). Host is offline."
    }
}

# Write a log message to indicate completion of the script
Write-Output "$(Get-Date -Format 'yyyy/MM/dd HH:mm:ss') - Script completed."
