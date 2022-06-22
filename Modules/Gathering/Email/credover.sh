#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "Cr3d0v3r"
echo -e "${NC}"
cd Cr3d0v3r
echo -e "${W}Please enter the target email or username${NC}"
read TARGET
python3 Cr3d0v3r.py ${TARGET}
cd /opt/TigerShark
./tigershark