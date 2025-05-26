{
		# Ask for username
		$usermail = Read-Host "Please enter the username"
		# Ask for shared mailbox name
		$mailbox = Read-Host "Please enter the shared mailbox name"
		# Add user to shared mailbox
		Add-MailboxPermission -Identity $mailbox -User $usermail -InheritanceType all -AccessRights FullAccess
		Write-Host "||| Attempting to add user to mailbox. |||"
		Start-Sleep -seconds 3	  
		# Verify if user has been added correctly
		$result = Get-MailboxPermission -Identity $mailbox | Where-Object {$_.User -eq $username -and $_.AccessRights -eq "FullAccess"}
		Write-Host "|||Verifying...||"
		Start-Sleep -Seconds 3
		# Print result
		if ($result -ne $null) {
			Write-Host "User added successfully!"
			} else {
			Write-Host "Unsuccessful. Please try again."
		break
			}
		}
