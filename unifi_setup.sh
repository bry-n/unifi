#!/bin/bash
#install script for unifi controller
#Tested on Ubuntu Server 20.04
#Brian Murray
#v1
apt update && sudo apt upgrade -y
apt install -y net-tools
#helps with entropy issues for vm and headless servers
apt-get install -y haveged
update-rc.d haveged defaults
#Unifi requires java 8 (newer versions may break controller)
apt install -y openjdk-8-jre-headless
#stops java 11 from being installed automatically (newer versions may break controller)
apt-mark hold openjdk-11-*
apt install -y ca-certificates apt-transport-https
#add Unifi software repo requirements
wget -qO /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
#add mongo database software repo requirements
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
#dependacy for mongo 3.*
curl -O http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
apt install -y ./libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
apt update
apt install -y mongodb-org
apt install -y unifi
