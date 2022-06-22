#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd tools/catphish
echo -e "${ORNG}"
figlet -f mini "CatPhish"
echo -e "${NC}"
echo -e "${W}Please enter the domain to analyze${NC}"
read DOMAIN
sleep 1
echo -e "${RED}${DOMAIN}${NC}"
PS3='What would you like to do?'
        options=("Generate All" "Check Available Expired" "Check Specific Domain for Catagorization" "Back")
        select opt in "${options[@]}"
        do
            case $opt in
                "Generate All")
                    ruby catphish.rb -D ${DOMAIN} generate -A
                    ;;

                "Check Available Expired")
                    ruby catphish.rb -D ${DOMAIN} expired
                    ;;

                "Check Specific Domain for Catagorization")
                    ruby catphish.rb -D ${DOMAIN} expired -c
                    ;;

                "Back")
                    cd ../..
                    ./tigershark
                    ;;

            esac
        done
cd ../..
./tigershark
