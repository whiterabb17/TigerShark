#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

cd tools/lockphish
echo -e "${RED}"
figlet LockPhish
echo -e "${NC}"
bash lockphish.sh
sleep 5
cd /opt/TigerShark
./tigershark