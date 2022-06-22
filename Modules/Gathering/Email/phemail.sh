#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd tools/PhEmail
echo -e "${ORNG}"
figlet -f mini "PhEmail"
echo -e "${NC}"
if [[ -d '/opt/TigerShark/Results/PhEmail' ]]; then
	sleep 1
else
	mkdir /opt/TigerShark/Results/PhEmail
fi
echo -e "${W}Please enter term to search on google${NC}"
read SEARCHTERM
echo -e "${W}Would you like to search for emails for a specific domain?(y/n)"
echo -e "${LP}eg. amazon.com${NC}"
read DS_ANS
if [[ ${DS_ANS} == "y" ]]; then
	echo -e "${W}Please enter the domain: ${NC}"
	read DOMAIN
else
	echo ""
fi
echo -e "${W}How many pages would you like to crawl?${NC}"
read PAGES
echo -e "${W}Please enter the name for the output file the addresses will be saved in: ${NC}"
read OUTPUT
echo -e "${W}Please select the email format to search for: ${NC}"
echo -e "${YLW}0- firstname surname"
echo -e "${YLW}1- firstname.surname@example.com"
echo -e "${YLW}2- firstnamesurname@example.com"
echo -e "${YLW}3- f.surname@example.com"
echo -e "${YLW}4- firstname.s@example.com"
echo -e "${YLW}5- surname.firstname@example.com"
echo -e "${YLW}6- s.firstname@example.com"
echo -e "${YLW}7- surname.f@example.com"
echo -e "${YLW}8- surnamefirstname@example.com"
echo -e "${YLW}9- firstname_surname@example.com"
read FORMAT
if [[ ${DS_ANS} == "y" ]]; then
	python phemail.py -S ${SEARCHTERM} -d ${DOMAIN} -F ${FORMAT} -p ${PAGES} -v -o /opt/TigerShark/Results/PhEmail/${OUTPUT}.txt
else
	python phemail.py -S ${SEARCHTERM} -F ${FORMAT} -p ${PAGES} -v -o /opt/TigerShark/Results/PhEmail/${OUTPUT}.txt
fi
echo -e "${W}Results have been save to 'Results/PhEmail' folder${NC}"
cd ../..
./tigershark