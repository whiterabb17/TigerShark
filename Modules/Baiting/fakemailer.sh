#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

cd tools/fakemailer
echo -e "${RED}"
figlet FakeMailer
echo -e "${NC}"
echo ""
echo -e "${W}Please upload index.html & mailer.php to your server."
echo -e "${W}You can use Free Hosting such as 000webhost, but there is high chance that email get marked as spam"
echo -e "You can use Free Hosting as well such as 000webhost, but there is high chance that email get marked as spam"
echo -e "Therefore paid hosting is recommended but not a necessity${NC}"
echo -e "${YLW}Then visit http://<yourdomain>/index.html, to send your phishing mail${NC}"
