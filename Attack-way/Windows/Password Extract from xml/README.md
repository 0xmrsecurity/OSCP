# Decode the Xml password 
PSCredential XML Decryption is the process of extracting and converting securely stored credentials from serialized PowerShell objects in XML format back to plaintext authentication tokens.
```language
If the file contain the binary password, like this :- 0101919310841001837146106741741069169491893010101100101001010010010110100101016471551646101808181838
```
# You can Decrypt it using the Powershell Manuall way and Automate Way:-

# Manuall Way
```language
$pwd = ConvertTo-SecureString  <encoded password>
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList "user_name",$pwd    # Grap the username from the xml file.
$cred.GetNetworkCredential().password
```
# Automate Way
```language
(Import-Clixml "C:\Path\To\Your\connection.xml").GetNetworkCredential().Password
```
