#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
sudo apt-get install golang-1.* golang golang-1.*-go golang-1.*-src git python2 python3 python3-pip python3-dev python3 virtualenv gnupg certbot wine wine64
echo -e "${YLW}This script will download and install all the tools needed for TigerShark to run."
echo -e "If this is okay, hit ${LP}enter${YLW} - otherwise ${RED}Ctrl${W} + ${RED}c ${YLW}to cancel${NC}"
read ACCEPT
if [[ ! -d '/opt/TigerShark' ]]; then
	pwd
	cd .. 
	sudo mv TigerShark -t /opt
	sudo chown $USER:$USER -R /opt/TigerShark
	chmod +x /opt/TigerShark --recursive
fi
echo -e "${LP}==========================================================================${NC}"
cd /opt/TigerShark
chmod +x tigershark
# Toolinstallations
if [[ -d 'tools' ]]; then
	sleep 1
else
	mkdir tools
fi
cd /opt/TigerShark/tools

#Catphish (done)
if [[ -d 'catphish' ]]; then
	sleep 1
else
	git clone https://github.com/ring0lab/catphish
	cd catphish
	bundle install
	echo -e "${W}CatPhish Installed${NC}"
	cd ..
fi

cd /opt/TigerShark/tools
#Gophish (done)
if [[ -d 'gophish' ]]; then
	sleep 1
else
	git clone https://github.com/gophish/gophish.git
	cd gophish
	go get github.com/gophish/gophish
	go build
	sudo cp gophish -t /usr/sbin
	sudo chown $USER:$USER /usr/sbin/gophish
	echo -e "${W}GoPhish Installed${NC}"
	cd ..
fi

cd /opt/TigerShark/tools
#PhishX - Phishing generator with multiple tools (*useful*) (done)
if [[ -d 'PhishX' ]]; then
	sleep 1
else
	git clone https://github.com/rezaaksa/PhishX.git
	cd PhishX
	chmod +x installer.sh
	bash installer.sh
	python3 PhishX.py
	echo -e "${W}PhishX Installed${NC}"
	cd ..
fi

cd /opt/TigerShark/tools
#WeeMan
if [[ -d 'weeman' ]]; then
	sleep 1
else
	git clone https://github.com/evait-security/weeman.git
fi

cd /opt/TigerShark/tools
#SocialFish - Phishing server, can be used with mobile. (done)
if [[ -d 'SocialFish' ]]; then
	sleep 1
else
	git clone https://github.com/UndeadSec/SocialFish.git
	cd SocialFish
	python3 -m pip install -r requirements.txt
	echo -e "${W}SocialPhish Installed${NC}"
	cd ..
fi

cd /opt/TigerShark/tools
#Artemis - Phishing page generator (clones a page, and allows your choice of selecter parameters.) (done)
if [[ -d 'Artemis' ]]; then
	sleep 1
else
	git clone https://github.com/sweetsoftware/Artemis.git
	cd Artemis
	python2 -m pip install -r requirements.txt
	echo -e "${W}Artemis Installed${NC}"
	cd ..
fi

cd /opt/TigerShark/tools
#PhishBait - Email harvester for attacks. (done)
if [[ -d 'PhishBait' ]]; then
	sleep 1
else
	git clone https://github.com/pan0pt1c0n/PhishBait.git
	echo -e "${W}PhishBait Installed${NC}"
fi

cd /opt/TigerShark/tools
#STP - Node based phishing server (done)
if [[ -d 'STP' ]]; then
	sleep 1
else
	git clone https://github.com/PowerScript/STP.git
	echo -e "${W}STP Installed${NC}"
fi

cd /opt/TigerShark/tools
#HiddenEye (done)
if [[ -d 'HiddenEye' ]]; then
	rm -rf HiddenEye
	git clone https://github.com/Soldie/HiddenEye-DarkSecDevelopers
	cd HiddenEye-DarkSecDevelopers
	pip3 install -r requirements.txt
fi
if [[ -d 'HiddenEye-DarkSecDevelopers' ]]; then
	sleep 1
else
	git clone https://github.com/Soldie/HiddenEye-DarkSecDevelopers
	cd HiddenEye-DarkSecDevelopers
	sudo pip3 install -r requirements.txt
	sudo pip3 install requests
	echo -e "${W}HiddenEye Installed${NC}"
	cd ..
fi

cd /opt/TigerShark/tools
# PhEmail
if [[ -d 'PhEmail' ]]; then
	sleep 1
else
	git clone https://github.com/Dionach/PhEmail
fi

cd /opt/TigerShark/tools
# DomainHunter
if [[ -d 'domainhunter' ]]; then
	sleep 1
else
	git clone https://github.com/threatexpress/domainhunter
	cd domainhunter
	sudo python3 -m pip install -r requirements.txt
	sudo apt-get install python3-pil
	cd ..
fi

cd /opt/TigerShark/tools
# CredSniper
if [[ -d 'CredSniper' ]]; then
	sleep 1
	sudo rm -rf CredSniper
	git clone https://github.com/ustayready/CredSniper.git
	cd CredSniper
	sudo python3 -m pip install -r requirements.txt
	chmod +x install.sh
	./install.sh
	cd ..
else
	git clone https://github.com/ustayready/CredSniper.git
	cd CredSniper
	sudo python3 -m pip install -r requirements.txt
	chmod +x install.sh
	./install.sh
	cd ..
fi

cd /opt/TigerShark/tools
# Enigma
if [[ -d 'Enigma' ]]; then
	sleep 1
else 
	git clone https://github.com/UndeadSec/Enigma.git
fi

cd /opt/TigerShark/tools
# Pupy
if [[ ! -d 'pupy' ]]; then
	git clone --recursive https://github.com/n1nj4sec/pupy.git
	cd pupy
	sudo python2 -m pip install virtualenv
	sudo python create-workspace.py -BG pupyw
	echo "export PATH=/opt/TigerShark/tools/pupy/G:$PATH" >> ~/.bashrc
	sleep 5
	mv /opt/TigerShark/.vs/pupy.conf.default -t /opt/TigerShark/tools/pupy/pupy
fi

cd /opt/TigerShark/tools
# ie11 VB Exploit
if [[ -d 'ie11_vbscript_exploit' ]]; then
	sleep 1
else
	git clone https://github.com/ruthlezs/ie11_vbscript_exploit.git
fi

cd /opt/TigerShark/tools
# EmailGen
if [[ -d 'EmailGen' ]]; then
	sleep 1
else
	git clone https://github.com/navisecdelta/EmailGen
	cd EmailGen
	sudo gem install bundler:1.16.6
	bundle install
fi

cd /opt/TigerShark/tools
# Neos-Mail Spoofer
if [[ -d 'Neos_Spoofer' ]]; then
	sleep 1
else 
	mv /opt/TigerShark/.vs/Neos_Spoofer.zip -t .
	unzip Neos_Spoofer.zip
	rm Neos_Spoofer.zip
fi

cd /opt/TigerShark/tools
# CVE-2018-8174
if [[ -d 'CVE-2018-8174_EXP' ]]; then
	sleep 2
else
	git clone https://github.com/Yt1g3r/CVE-2018-8174_EXP.git
fi

cd /opt/TigerShark/tools
# Phantom-Evasion
if [[ -d 'Phantom-Evasion' ]]; then
	sleep 1
else 
	git clone https://github.com/oddcod3/Phantom-Evasion.git
	cd Phantom-Evasion
	python3 phantom-evasion.py --setup
fi

cd /opt/TigerShark/tools
# EvilURL
if [[ -d 'EvilURL' ]]; then
	sleep 1
else 
	git clone https://github.com/UndeadSec/EvilURL.git
fi

cd /opt/TigerShark/tools
# Cr3d0v3r
if [[ -d 'Cr3dOv3r' ]]; then
	sleep 1
else
	git clone https://github.com/D4Vinci/Cr3dOv3r.git
	cd Cr3dOv3r
	python3 -m pip install -r requirements.txt
	python3 Cr3d0v3r.py -h
fi

cd /opt/TigerShark/tools
# SpookFlare
if [[ -d 'SpookFlare' ]]; then
	sleep 1
else
	git clone https://github.com/hlldz/SpookFlare.git
	cd SpookFlare
	pip install -r requirements.txt
fi

cd /opt/TigerShark/tools
# ThunderShell
if [[ -d 'ThunderShell' ]]; then
	sleep 1
else
	git clone https://github.com/Mr-Un1k0d3r/ThunderShell.git
fi

cd /opt/TigerShark/tools
# AdvPhishing
if [[ -d 'AdvPhishing' ]]; then
	sleep 1
else
	git clone https://github.com/Ignitetch/AdvPhishing.git
	cd AdvPhishing
	chmod 777 setup.sh
	sudo ./setup.sh
fi

# CuteIt
cd /opt/TigerShark/tools
if [[ -d 'Cuteit' ]]; then
	sleep 1
else
	git clone https://github.com/D4Vinci/Cuteit.git
fi

cd /opt/TigerShark/tools
#Macro_Pack
if [[ -d 'macro_pack' ]]; then
	sleep 1
else 
	git clone https://github.com/sevagas/macro_pack.git
	cd macro_pack
	python3 -m pip install -r requirements.txt
	python3 -m pip install pyinstaller
	mkdir bin
	cd bin
	wget https://github.com/sevagas/macro_pack/releases/download/v1.7/macro_pack.exe
fi

cd /opt/TigerShark/tools
# Graffiti
if [[ -d 'Graffiti' ]]; then
	sleep 1
else 
	git clone https://github.com/Ekultek/Graffiti.git
	cd Graffiti
	chmod +x install.sh
	sudo ./install.sh
fi

cd /opt/TigerShark/tools
# Merlin
if [[ -d 'merlin' ]]; then
	sleep 1
else
	mkdir merlin
	cd merlin
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinServer-Linux-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-Windows-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-Linux-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-Darwin-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-DLL-v0.8.0.BETA.7z
	mkdir zips && mv *.7z -t zips
	echo -e "${RED}Will unzip necessary files for merlin."
	echo -e "when prompted for a password, enter ${LP}merlin${NC}"
	7z x zips/merlinServer-Linux-x64-v0.8.0.BETA.7z -y
	7z x zips/merlinAgent-Windows-x64-v0.8.0.BETA.7z -y
	7z x zips/merlinAgent-Linux-x64-v0.8.0.BETA.7z -y
	7z x zips/merlinAgent-Darwin-x64-v0.8.0.BETA.7z -y
fi

cd /opt/TigerShark/tools
# JS_DriveBy
if [[ -d 'JS_DriveBy' ]]; then
	sleep 1
else
	git clone https://github.com/MRGEffitas/Ironsquirrel.git JS_DriveBy
	cd JS_DriveBy
	wget https://raw.githubusercontent.com/NYAN-x-CAT/JS-Downloader/master/Downloader.js
	sudo apt-get install ruby-dev
	bundle install
fi
	
#EvilReg
cd /opt/TigerShark/tools
if [[ ! -d 'evilreg' ]]; then
	git clone https://github.com/8L4NK/evilreg.git
fi

#FakeMailer
cd /opt/TigerShark/tools
if [[ ! -d 'fakemailer' ]]; then
	git clone https://github.com/Technowlogy-Pushpender/fakemailer.git
fi

#GetDroid
cd /opt/TigerShark/tools
if [[ ! -d 'getdroid' ]]; then
	git clone https://github.com/khawabkashyap/getdroid.git
	sudo apt-get install openjdk-11-source
	chmod +x getdroid.sh
fi

#apkinfector
cd /opt/TigerShark/tools
if [[ ! -d 'apkinfector' ]]; then
	git clone https://github.com/Technowlogy-Pushpender/apkinfector.git
fi

#PhishMailer
cd /opt/TigerShark/tools
if [[ ! -d 'PhishMailer' ]]; then
	git clone https://www.github.com/BiZken/PhishMailer.git
	chmod +x PhishMailer.py
fi

#apkWash
cd /opt/TigerShark/tools
if [[ ! -d 'apkwash' ]]; then
	git clone https://github.com/jbreed/apkwash.git
	chmod +x apkwash
fi

# CVE-2018-15982 ShockWave Exploit
cd /opt/TigerShark/tools
if [[ ! -d 'adobe-flash-cve2018-15982' ]]; then
	git clone https://github.com/kphongagsorn/adobe-flash-cve2018-15982.git
fi

# DNS-Persist
cd /opt/TigerShark/tools
if [[ ! -d 'DNS-Persist' ]]; then
	pip install dnslib
	git clone https://github.com/0x09AL/DNS-Persist
fi

# GhostFramework
cd /opt/TigerShark/tools
if [[ ! -d 'ghost' ]]; then
	git clone https://github.com/entynetproject/ghost.git
	chmod +x ghost install.sh
	./install.sh
fi

# Mouse
cd /opt/TigerShark/tools
if [[ ! -d 'mouse' ]]; then
	git clone https://github.com/entynetproject/mouse
	cd mouse
	chmod +x install.sh
	./install.sh
fi

# LockPhish
cd /opt/TigerShark/tools
if [[ ! -d 'lockphish' ]]; then
	git clone https://github.com/JasonJerry/lockphish
fi

# WhatPhish
cd /opt/TigerShark/tools
if [[ ! -d 'whatsapp-phishing' ]]; then
	git clone https://github.com/Ignitetch/whatsapp-phishing.git
	cd whatsapp-phishing
	chmod 777 Whatsapp.sh
fi

#WBRUTER
cd /opt/TigerShark/tools
if [[ ! -d 'WBRUTER' ]]; then
	git clone https://github.com/wuseman/WBRUTER.git
	cd WBRUTER
	sudo chmod +x wbruter
fi

# SPF
cd /opt/TigerShark/tools
if [[ ! -d 'SPF' ]]; then
	git clone --recursive https://github.com/tatanus/SPF
	cd SPF
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get install git build-essential python-dev python-pip phantomjs -y
	sudo apt install python3-twisted
	sudo apt install python3-dnspython
	python3 -m pip install -r requirements.txt
fi

# DKMC
cd /opt/TigerShark/tools
if [[ ! -d 'DKMC' ]]; then
	git clone https://github.com/Mr-Un1k0d3r/DKMC.git
	cd DKMC
	mkdir output
fi

# MaskPhish
cd /opt/TigerShark/tools
if [[ ! -d 'maskphish' ]]; then
	git clone https://github.com/jaykali/maskphish
fi

# URLCADIZ
cd /opt/TigerShark/tools
if [[ ! -d "URLCADIZ" ]]; then
	git clone https://github.com/PerezMascato/URLCADIZ.git
	python3 -m pip install -r requirements.txt
fi

# Shark
cd /opt/TigerShark/tools
if [[ ! -d 'shark' ]]; then
	git clone https://github.com/Bhaviktutorials/shark
	cd shark
	bash kali-setup
fi

# Shikata Gai Ni
cd /opt/TigerShark/tools
if [[ ! -d 'sgn' ]]; then
	sudo docker pull egee/sgn
fi

cd /opt/TigerShark/tools
# FAQUE
if [[ ! -d 'FAQUE' ]]; then
	git clone https://github.com/ByDog3r/FAQUE
fi

cd /opt/TigerShark/tools
# Blackeye
if [[ ! -d 'Blackeye-2.0' ]]; then
	git clone https://github.com/j-dogcoder/Blackeye-2.0
fi

###################################################################################################################################################
###############################
##  Final TigerShark Setup   ##
###############################
reset
echo -e "${ORNG}Is this the first time ${RED}i${ORNG}nstall tigershark or are you ${RED}u${ORNG}pdating?(${RED}i${ORNG}/${RED}u${ORNG})${NC}"
read UPQ
if [[ $UPQ == "i" ]]; then 
	cd /opt
	sudo chown $USER:$USER -R /opt/TigerShark
	echo -e "${YLW}Would you like tigershark to be able to be run from anywhere?(${RED}y${YLW}/${RED}n${YLW})${NC}"
	read ANY
	if [[ ${ANY} == "y" ]]; then
		cd /opt/TigerShark
		chmod +x tigershark
		sudo cp tigershark -t /usr/sbin
		sudo chown $USER:$USER /usr/sbin/tigershark
	else
		sleep 1
	fi
	echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"
	echo -e "${W}GoPhish default login is ${RED}will be generated upon first use${NC}"
else
	if [[ -f /usr/sbin/tigershark ]]; then
		cd /opt/TigerShark
		sudo chown $USER:$USER -R /opt/TigerShark
		chmod +x /opt/TigerShark --recursive
		sudo cp tigershark -t /usr/sbin
		sudo chown $USER:$USER /usr/sbin/tigershark
	fi
	echo -e "${RED}Would you like to update tools as well?(y/n)${NC}"
	read TOOLUP
	if [[ ${TOOLUP} == "y" ]]; then
		chmod +x Modules/tool-update.sh
		bash Modules/tool-update.sh
	fi
fi
sudo chown $USER:$USER -R /opt/TigerShark

