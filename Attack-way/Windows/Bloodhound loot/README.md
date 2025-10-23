# Bloodhound loot Using Rusthound , bloodhound-python , Sharphound.exe and NetExec.
Using this tool you can load the data into the bloodhound to see the visual attack path.
# BloodHound Step up 
```language
# Make a directory
cd /opt
mkdir bloodhound

# Download the docker-compose
sudo apt install docker.io && sudo apt install docker-compose

# Add user to Run the Bloodhound
sudo usermod -aG docker  $USER

# Run and wait for 1 min
curl -L https://ghst.ly/getbhce > docker-compose.yml
sudo docker-compose pull && docker-compose up

# Grab the password
Random password was created : Please scroll up and copy the password

# Open the firefox
https://localhost:8080

#Login it
username : admin
password : < paste the password here >

# Reset the password  and login it 
```
# Your are know Ready to Start and Stop the Bloodhound
```language
docker-compose up -d

docker-compose down
```
# NetExec loot
```language
nxc ldap $target -u $username -p $password --bloodhound --collection All --dns-server $target
```
# RustHound loot
```language
rusthound-ce --domain $domain -u $user -p $pass --zip -c All

rusthound-ce -d $domain -f $full_domain -u $user -p $pass -k  --old-bloodhound  --adcs --zip -c All
```
# Bloodhound-Python
```language
bloodhound-python -d $domain -u $user -p $pass -ns $ip -dc $full_domain -c All --zip

faketime  "$(ntpdate -q $full_domain | cut -d ' ' -f 1,2)" bloodhound-python -d $domain -u $user -p $pass -ns $ip -dc $full_domain -c All --zip
```
# SharpHound.exe
```language.exe
.\sharpHound.exe -s -c all
```
