#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow !  mssclient connect ---<${RESET}"

 
echo "Domain:-"
read domain

echo "username:-"
read username

echo "Password:-"
read password

impacket-mssqlclient  -windows-auth $domain/$user:'$password'@$domain
