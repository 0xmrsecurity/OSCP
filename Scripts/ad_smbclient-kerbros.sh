#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"
GREEN="\033[32m"

echo -e "${BOLD}${RED}wow !  smbclient connecting with kerbros authentication ---<${RESET}"

if ! command -v faketime &> /dev/null; then
    echo -e "${RED}[!] faketime not found! Install with: pipx install faketime${RESET}"
    exit 1
fi

echo -e "${GREEN}[+] faketime found! Starting...${RESET}"

echo "Full Domain (e.g., dc01.corp.com):"
read full_domain

echo "NetBIOS Domain (e.g., corp.com):"
read domain

echo "Username:"
read username

echo "Password:"
read  password

echo "Target IP:"
read ip


echo -e "${GREEN}[+] Running smbclient.py...${RESET}"
faketime  "$(ntpdate -q  $full_domain  | cut -d ' ' -f 1,2)"  smbclient.py '$domain'/$username:'$password'@'$full_domain' -k -no-pass
