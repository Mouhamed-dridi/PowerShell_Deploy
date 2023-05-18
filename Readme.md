## File Deployment Script

This script allows you to copy a specific file to multiple remote computers simultaneously. It utilizes PowerShell to streamline and automate the deployment process, ensuring efficient file distribution across your network.

### Prerequisites

Before running the script, ensure that you have the following:

- PowerShell installed on your local machine.
- Administrative privileges to access the remote computers.
- The file you want to copy to the remote computers.

### Usage

1. Open PowerShell on your local machine.
2. Set the values for the following variables at the beginning of the script:

   - `$fileToCopy`: Specify the full path of the file you want to copy.
   - `$destinationDir`: Specify the destination directory on the remote host.

3. Specify the list of computers you want to copy the file to by updating the `$computerNames` array variable. Uncomment the appropriate line based on your target group of computers.

4. Save the script with a `.ps1` extension (e.g., `deploy_files.ps1`).

5. Run the script by executing the following command in PowerShell:

   ```
   .\deploy_files.ps1
   ```

6. The script will iterate through the list of specified computers and attempt to copy the file to each one.

   - If a computer is online and accessible, the script will copy the file to the remote host and write a success log message.
   - If a computer is offline or inaccessible, the script will write a failure log message indicating the host's status.

7. Once the script completes, it will write a log message indicating the overall completion time.

### Example

```powershell
# Specify the path to the file you want to copy
$fileToCopy = "C:\Users\mohamed dridi\Desktop\bosh deploy\etiquette_bosch.url"

# Specify the destination directory on the remote host
$destinationDir = "C$\Users\Consult\Desktop"

# Specify the list of computers to copy the file to
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
```

Please ensure that you have the necessary permissions and adjust the variables accordingly before running the script.

**Note:** Make sure to exercise caution while deploying files to multiple computers, and always validate the
