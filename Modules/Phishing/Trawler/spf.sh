#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/TigerShark/tools/spf
echo -e "${RED}"
figlet -f mini "SPF"
echo -e "${NC}"
echo -e "${W}Please enter the domain you are attempting to phish${NC}"
read DOMAIN
echo -e "${W}Please enter the name of the company you are attempting to phish${NC}"
read COMPANY
echo -e "${W}Please enter the IP of the Phishing Server${NC}"
read SERVER
echo -e "${W}Please enter the full path/to/target_emails.txt${NC}"
read TARGETS
echo -e "${YLW}Would you like the webserver to persist after closing SPF Framework?(${RED}y${YLW}/${RED}n${YLW})${NC}"
read ANS
if [[ ${ANS} == "y" ]]; then
	PER='-W'
else
	PER=''
fi
sleep 1
python3 spf.py --all -d ${DOMAIN} -c ${COMPANY} --ip ${SERVER} -f ${TARGETS} -v ${PER}
sleep 30 
echo -e "	============================================"


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################