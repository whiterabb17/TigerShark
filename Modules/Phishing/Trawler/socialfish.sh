#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
android(){
	echo -e "${LP}Would you like to download the SocialFish Android App?(y/n)${NC}"
	read SFA
	if [[ ${SFA} == "y" ]]; then
		echo -e "${ORNG}Please download the APK from this link and install on your android\n${W}https://github.com/UndeadSec/SocialFishMobile/releases/download/v1.0/app-release.apk ${NC}"
	fi
}

cd tools/SocialFish
echo -e "${ORNG}"
figlet -f mini "SocialFish"
echo -e "${NC}"
echo -e "${W}Please enter a login name for SocialFish Server${NC}"
read USER
echo -e "${W}Please enter a password for SocialFish Server${NC}"
read PASS
android
OUT='android'
IN='#android'
sed -i "s/${OUT}/${IN}/g" /opt/TigerShark/Modules/Phishing/Trawler/socialfish.sh
xterm -e sudo python3 SocialFish.py ${USER} ${PASS} 

