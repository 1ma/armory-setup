#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0m'

AESCRYPT_SOURCE='aescrypt-3.0.9-linux.tgz'
ARMORY_DEB='armory_0.92.3_ubuntu-64bit.deb'

if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}You need root privileges to run this script${WHITE}"
    exit 1
fi

echo -e "${GREEN}cd'ing to script directory...${WHITE}"
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ ! -f ${AESCRYPT_SOURCE} ]]; then
    echo -e "${RED}AESCrypt source archive not found. Check the path set in AESCRYPT_SOURCE variable: ${AESCRYPT_SOURCE}${WHITE}"
    exit 1
else
    echo -e "${GREEN}AESCrypt source found: ./${AESCRYPT_SOURCE}${WHITE}"
fi

if [[ ! -f ${ARMORY_DEB} ]]; then
    echo -e "${RED}Armory DEB package not found. Check the path set in ARMORY_DEB variable: ${ARMORY_DEB}${WHITE}"
    exit 1
else
    echo -e "${GREEN}Armory DEB package found: ./${ARMORY_DEB}${WHITE}"
fi

echo -e "${GREEN}ALL CHECKS PASSED, moving on...${WHITE}"

echo
echo -e "${GREEN}Refreshing sources...${WHITE}"
apt-get update
echo -e "${GREEN}Installing KeePass2...${WHITE}"
apt-get install -y keepass2

echo -e "${GREEN}Installing AEScrypt...${WHITE}"
tar zxvf $AESCRYPT_SOURCE
cd aescrypt-3.0.9/src
make
make install
cd ../..

echo -e "${GREEN}Installing Armory...${WHITE}"
dpkg -i $ARMORY_DEB
apt-get install -y -f

echo -e "${GREEN}Disabling all network interfaces...${WHITE}"
nmcli nm enable false

echo
echo -e "${GREEN}GREAT SUCCESS. YOU CAN NOW START USING ARMORY${WHITE}"

exit 0
