#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
info(){
	echo -e "${ORNG}Running PhishBait with the following${NC}"
	echo -e "${RED}Option = ${W}${OPTION}${NC}"
	echo -e "${RED}Target Domain = ${W}${TARGET}${NC}"
	echo -e "${RED}Output File = ${W}${OUTPUT}${NC}"
}

cd tools/PhishBait
echo -e "${ORNG}"
figlet -f mini "PhishBait"
echo -e "${NC}"
if [[ -d '/opt/TigerShark/Results/PhishBait' ]]; then
	sleep 1
else
	mkdir /opt/TigerShark/Results/PhishBait
fi
echo -e "${W}Options"
echo -e "1 = [first].[last]@[domain]"
echo -e "2 = [first][last]@[domain]"
echo -e "3 = [first initial][last]@[domain]"
echo -e "4 = [first]_[last]@[domain]"
echo -e "Please select your option: ${NC}"
read OPTION
echo -e "${W}Please enter your target domain${NC}"
read TARGET
echo -e "${W}Please enter output file name${NC}"
read OUTPUT
if [[ OPTION == "4" ]];then
	info
	python Bing_Scraper.py ${OPTION} ${TARGET} ${OUTPUT}.txt
else
	info
	python Bing_Scraper.py ${OPTION} ${TARGET} ${OUTPUT}.txt
	python linkedin_harvest.py ${OUTPUT}.txt ${OPTION} ${TARGET}
fi
mv ${OUTPUT}.txt -t /opt/TigerShark/Results/PhishBait
echo -e "${RED}Output has been saved to 'Results/PhishBait' folder${NC}"
cd ../..
./tigershark

