#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "SpookFlare"
echo -e "${NC}"
cd tools/SpookFlare
python spookflare.py
sleep 1
cd /opt/TigerShark
./tigershark