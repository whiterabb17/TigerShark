#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
SSERVER='smtp.gmail.com'
#Target Options
sender_opts(){
	echo -e "${W}Are you sending from a google email address or a custom mail server?(g/c)${NC}"
	echo -e "${RED}NOTE: ${W}If you use a custom mail server you can change"
	echo -e "the FROM name of the email but not the FROM address"
	echo -e "which will show the target the address of sender${NC}"
	read MSERVER
	if [[ ${MSERVER} == "g" ]]; then
		echo -e "${W}Please enter the email address: ${NC}"
		read GMAILA
		echo -e "${W}Please enter the password: ${NC}"
		read GMAILP
	else
		echo -e "${W}Please enter the mail server of the attacker email address: ${NC}"
		read SSERVER
		echo -e "${W}Please enter the email address to send the mail from: ${NC}"
		read FROM_ADDR
		echo -e "${W}Please enter the Name that will be displayed to the target in the FROM field${NC}"
		read FROM_NAME
	fi
}
# Email Options
email_opts(){
	echo -e "${W}Please enter the subject of the email, default is 'Newsletter'${NC}"
	read SUBJECT
	echo -e "${W}Body of the email should be stored in 'body.txt'"
	echo -e "When you are ready, please hit enter"
	read MILO
	echo -e "Please enter the full path/to/body.txt${NC}"
	read BODY
	echo -e "${W}Please enter the website that the phishing mail links to${NC}"
	read LPAGE
}
# From/Reply Addresses
gsender_addr(){
	echo -e "${W}Please enter the From Address displayed in the FROM field in the email${NC}"
	echo -e "${RED}NOTE:${W}This is not the address the emails are sent from${NC}"
	read FROM_ADDR
	echo -e "${W}Please enter the Name that will be displayed to the target${NC}"
	read FROM_NAME
}
# Option Check
check_options(){
	echo -e "${W}Target list	: ${YLW}${ELIST}${NC}"
	echo -e "${W}From Name	: ${YLW}${FROM_NAME}${NC}"
	echo -e "${W}From Address	: ${YLW}${FROM_ADDR}${NC}"
	echo -e "${W}Mail Server	: ${YLW}${SSERVER}${NC}"
	if [[ ${MSERVER} == "g" ]]; then
		echo -e "${W}Attacker Address	: ${YLW}${GMAILA}:${GMAILP}${NC}"
	else
		echo ""
	fi
	echo -e "${W}Subject	: ${YLW}${SUBJECT}${NC}"
	echo -e "${W}Body	: ${YLW}${BODY}${NC}"
	echo -e "${W}Link Site	: ${YLW}${LPAGE}${NC}"
}
# Runtime Selections
runtime_opts(){
	sender_opts
	if [[ ${MSERVER} == "g" ]]; then
		gsender_addr
	else
		echo ""
	fi
	email_opts
	check_options
}

cd tools/PhEmail
echo -e "${ORNG}"
figlet -f mini "PhEmail"
echo -e "${NC}"
echo -e "${W}Target addresses should be in a file called emails.txt"
echo -e "If your mail list is ready, hit enter to continue${NC}"
read MILO
echo -e "${W}Please enter the full path/to/emails.txt"
read ELIST
runtime_opts
echo -e "${LP}===============================================================================================${NC}"
echo -e "${W}Is everything above correct?(y/n)${NC}"
read CHECK
if [[ ${CHECK} == "n" ]]; then
	runtime_opts
else
	echo -e "${YLW}Great! Lets Start Fishing!${NC}"
fi
echo -e "${LP}===============================================================================================${NC}"
if [[ ${MSERVER} == "g" ]]; then
	python phemail.py -e ${ELIST} -f "${FROM_NAME} ${FROM_ADDR}" -r "${FROM_NAME} ${FROM_ADDR}" -g ${GMAILA}:${GMAILP} -m SSERVER -s "${SUBJECT}" -b ${BODY} -w ${LPAGE}
else 
	python phemail.py -e ${ELIST} -f "${FROM_NAME} ${FROM_ADDR}" -r "${FROM_NAME} ${FROM_ADDR}" -m SSERVER -s "${SUBJECT}" -b ${BODY} -w ${LPAGE}
fi
echo -e "${YLW}Now just wait for this phish to bite${NC}"
cd ../..
./tigershark