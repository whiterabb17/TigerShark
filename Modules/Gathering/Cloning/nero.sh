#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

cd tools/nero-phishing-server
echo -e "${RED}"
figlet -f mini Nero
echo -e "${NC}"
sudo python3 nero.py