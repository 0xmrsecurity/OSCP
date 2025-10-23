# Bloodhound loot Using Rusthound , bloodhound-python and Sharphound
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
