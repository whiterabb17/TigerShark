#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
RED='\033[0;31m'
LBBLUE='\e[104m'

cd tools/mouse
echo -e "${RED}"
figlet Mouse
echo -e "${NC}"
echo -e "${YLW}Mouse Framework is an iOS and macOS post-exploitation framework that gives you\na command line session with extra functionality between you and a target machine\nusing only a simple Mouse payload. Mouse gives you the power and convenience of\nuploading and downloading files, tab completion, taking pictures, location tracking,\nshell command execution, escalating privileges, password retrieval, and much more.${NC}"
mouse
sleep 5
cd /opt/TigerShark
./tigershark