#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd tools/sgn
echo -e "${RED}"
figlet -f mini "Shikata Gai Ni"
echo -e "${NC}"
echo -e "${ORNG}Please copy your payload to ${LP}/tmp ${ORNG}dir\n${W}When ready please enter the name of your payload${NC}"
read PAY
echo -e "${ORNG}Is your payload a 32-bit or 64-bit binary? (${YLW}3/6${ORNG})${NC}"
read ARCH
if [[ ${ARCH} == "3" ]]; then
	ARC='32'
else
	ARC='64'
fi
echo -e "${ORNG}Would you like to generate a full ascii printable payload? (${YLW}y/n${ORNG})\n${YLW}This takes a long time to bruteforce (useful for evasion)${NC}"
read ASC
if [[ ${ASC} == "y" ]]; then
	ASO='yes'
	ASCII='-asci'
else
	ASCII=''
	ASO='no'
fi
echo -e "${ORNG}Would you like to remove bad characters? (${YLW}y/n${ORNG})\n${RED}NOTE: ${YLW}You will need to specify the bad characters to remove${NC}"
read BAD
if [[ ${BAD} == "y" ]]; then
	echo -e "${ORNG}Please specify the characters to remove${NC}"
	read CHARS
	BADC="-badchars ${CHARS}"
else
	BADC=''
fi
echo -e "${ORNG}Please enter the amount of times to encode the binary${NC}"
read ENC
echo -e "${ORNG}Please enter the max number of bytes for obfuscation ${YLW}(15+)${NC}"
read OBF
echo -e "${ORNG}Please enter the name for output file${NC}"
read OUT
echo -e "\n${RED}Selected Variables:${NC}"
echo -e "============================================"
echo -e "${LP}Original Payload Name : ${W}${PAY} ${NC}"
echo -e "${LP}Architecture Type     : ${W}x${ARC}"
echo -e "${LP}Using Ascii Payload   : ${W}${ASO} ${NC}"
echo -e "${LP}BadChars To Remove    : ${W}${CHARS} ${NC}"
echo -e "${LP}Encoding Loop Amount  : ${W}${ENC} ${NC}"
echo -e "${LP}Max Obfuscation Bytes : ${W}${OBF} ${NC}"
echo -e "${LP}Name of Output Payload: ${W}${OUT} ${NC}"
echo -e "============================================"
sudo docker run -it --name building -v /tmp/:/tmp/ egee/sgn -a ${ARC} ${ASCII} ${BADC} -c ${ENC} -max ${OBF} -o /tmp/${OUT} /tmp/${PAY}
sleep 3
sudo docker cp building:/tmp/${OUT} ~/Desktop
echo -e "${W}${OUT} has been encoded and copied to your Desktop${NC}"
cd /opt/TigerShark
./tigershark