#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "EmailGen"
echo -e "${NC}"
if [[ -d '/opt/TigerShark/Results/EmailGen' ]]; then
	sleep 1
else
	mkdir /opt/TigerShark/Results/EmailGen
fi
echo -e "${YLW}This tool scrapes LinkedIn in order to generate a target mailing list${NC}"
sleep 5
cd tools/EmailGen
echo -e "${W}Please enter the target domain${NC}"
read DOMAIN
echo -e "${W}Please enter the target companies' linkedIn name${NC}"
read LNAME
echo -e "${W}Please enter the email format to search for${NC}"
echo -e "${LP}eg. {f}{last}@{domain}"
echo -e "{first}{last}@{domain}"
echo -e "{last}.{f}@{domain}${NC}"
read FORMAT
sleep 1
echo -e "${RED}Srarting EmailGen${NC}"
sleep 2
ruby EmailGen.rb -c "${LNAME}" -d "${DOMAIN}" -f "${FORMAT}" -o /opt/TigerShark/Results/EmailGen/${LNAME}.txt
cd /opt/TigerShark
./tigershark
