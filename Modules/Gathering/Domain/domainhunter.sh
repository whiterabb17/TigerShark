#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
# Single Target
single_target(){
	echo -e "${W}Please enter your target: ${NC}"
	read TARGET
}
target_list(){
	echo -e "${W}Please enter the full path/to/target/list.txt"
	read TARGET
}

# DomainHunter Script (Start)
cd tools/DomainHunter
echo -e "${ORNG}"
figlet -f mini "DomainHunter"
echo -e "${W}Would you like to use DomainHunter against a single target or a target list?(s/l)${NC}"
read ANS
if [[ ${ANS} == "s" ]]; then
	TARG='--single'
	single_target		
else
	TARG='--filename'
	target_list
fi
echo -e "${W}Please enter a keyword to refine your search results${NC}"
read KEYWORD 
echo -e "${W}Please enter the maxresults you would like to query: ${NC}"
read MAXRES
echo -e "${W}Would you like to modify requesting timing to avoid CAPTCHAs?(y/n)${NC}"
read MOD_CAPQ
if [[ ${MOD_CAPQ} == "y" ]]; then
	echo -e "${W}Please enter number from 0-5, to us default just hit enter"
	echo -e "${RED}Slowest(0) = 90s-120s ; Default(3) = 10s-20s ; Fastest(5) = No delay${NC}"
	read MOD_CAPD
else
	MOD_CAPD='3'
fi
echo -e "${LP}====================================================${NC}"
./domainhunter.py ${TARG} ${TARGET} --check --ocr -k ${KEYWORD} -r MAXRES -t${MOD_CAPD}
echo -e "${LP}====================================================${NC}"
cd ../..
./tigershark