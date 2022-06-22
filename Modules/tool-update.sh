#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${RED}"
figlet -f mini "Checking For External Tool Updates"
echo -e "${NC}"
cd /opt/TigerShark/tools
cd catphish
git fetch && git pull &>/dev/null
cd ../gophish
git fetch && git pull &>/dev/null
go get -u github.com/gophish/gophish 
cd ../PhishX
git fetch && git pull &>/dev/null
cd ../weeman
git fetch && git pull &>/dev/null
cd ../SocialFish
git fetch && git pull &>/dev/null
python3 -m pip install -r requirements.txt
cd ../Artemis
git fetch && git pull &>/dev/null
python2 -m pip install -r requirements.txt
cd ../PhishBait
git fetch && git pull &>/dev/null
cd ../STP
git fetch && git pull &>/dev/null
cd ../HiddenEye-DarkSecDevelopers
git fetch && git pull &>/dev/null
python3 -m pip install -r requirements.txt
cd ../PhEmail
git fetch && git pull &>/dev/null
cd ../domainhunter
git fetch && git pull &>/dev/null
python3 -m pip install -r requirements.txt
cd ../CredSniper
git fetch && git pull &>/dev/null
python3 -m pip install -r requirements.txt
cd ../Enigma
git fetch && git pull &>/dev/null
cd ../pupy
git fetch && git pull &>/dev/null
cd ../EmailGen
git fetch && git pull &>/dev/null
bundle install
cd ../Phantom-Evasion
git fetch && git pull &>/dev/null
python3 phantom-evasion.py --setup
cd ../Cr3d0v3r
git fetch && git pull &>/dev/null
python3 -m pip install -r requirements.txt
cd ../SpookFlare
git fetch && git pull &>/dev/null
python2 -m pip install -r requirements.txt
cd ../ThunderShell
git fetch && git pull &>/dev/null
cd ../AdvPhishing
git fetch && git pull &>/dev/null
cd ../Graffiti
git fetch && git pull &>/dev/null
cd ../getdroid
git fetch && git pull &>/dev/null
cd ../apkinfector
git fetch && git pull &>/dev/null
cd ../DNS-Persist
git fetch && git pull &>/dev/null
cd ../ghost
git fetch && git pull &>/dev/null
cd ../mouse
git fetch && git pull &>/dev/null
cd ../WBRUTER
git fetch && git pull &>/dev/null
cd ../SPF
git fetch && git pull &>/dev/null
python3 -m pip install -r requirements.txt
cd ../DKMC
git fetch && git pull &>/dev/null
cd ../URLCADIZ
git fetch && git pull
python3 -m pip install -r requirements.txt
cd ../shark
git fetch && git pull
bash kali-setup

sleep 5
echo -e "${ORNG}================================+${NC}"
cd /opt/TigerShark
./tigershark
