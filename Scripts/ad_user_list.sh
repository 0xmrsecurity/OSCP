#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow ! Users list loot ---<${RESET}"

echo "Username: "
read username

echo "Password: "
read password

echo "IP Address: "
read target

netexec smb $target -u '$username'  -p '$password' --rid-brute  | grep -i 'sidtypeusers' | awk '{print $6}' |  cut -d '\' -f '2' > Users_list
ehco -e "${BOLD}${RED}Result finised see the file name --> Users_list${RESET}"
