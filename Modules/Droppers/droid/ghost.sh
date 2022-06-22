#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd tools/ghost
echo -e "${ORNG}"
figlet -f mini "Ghost"
echo -e "${NC}"
./ghost
cd /opt/TigerShark
./tigershark