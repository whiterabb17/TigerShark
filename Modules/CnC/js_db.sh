#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

cd tools/Ironsquirrel
echo -e "${RED}"
figlet JS_DriveBy
echo -e "${NC}"
echo -e "${W}This is a DriveBy Modules powered by a JS exploit of your choice"
echo -e "By default a JS Downloader is used, if a custom exploit is not provided${NC}"
echo ""
echo -e "${W}Would you like to use the (${YLW}d${W})efault downloader or provide your (${YLW}c${W})ustom JS script? (${YLW}d/c${W})"
read CHOICE
if [[ ${CHOICE} == "d" ]]; then
    echo -e "${W}Please edit the script to your needs${NC}"
    sleep 2
    nano Downloader.js
    ruby IRONSQUIRREL.rb --exploit Downloader.js 
else
    echo -e "${W}Please enter the full path/to/exploit.js${NC}"
    read CUSTOM
    ruby IRONSQUIRREL.rb --exploit ${CUSTOM}
fi
cd /opt/TigerShark
./tigershark 