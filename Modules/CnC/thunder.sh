#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "ThunderShell"
echo -e "${NC}"
cd tools/ThunderShell
echo -e "${W}Please enter the user name for the server${NC}"
read USER
sudo python3 ThunderShell.py default.json ${USER}
sleep 2
reset 
cd /opt/TigerShark
./tigershark