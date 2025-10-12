#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow ! Bloodhound loot --<${RESET}"


#bloodhound-python -d domain -u username -p password -ns ip -dc domain -c All --zip
echo "Domain: "
read domain

echo "Username: "
read username

echo "Password: "
read password

echo "IP Address: "
read ip_address

echo "Have you installed  faketime ?"

bloodhound-python -d $domain -u $username -p '$password' -ns $ip_address -dc $domain -c All --zip
