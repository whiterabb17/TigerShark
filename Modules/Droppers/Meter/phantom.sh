#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "Phantom-Evasion"
echo -e "${NC}"
cd tools/Phantom-Evasion
sudo python3 phantom-evasion.py
mv *.exe -t /opt/TigerShark/Payloads
echo -e "${RED}Payload moved to /opt/TigerShark/Payloads${NC}"
cd ../..
./tigershark