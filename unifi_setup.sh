#!/bin/bash
#install script for unifi controller
#Tested on Ubuntu Server 20.04
#Brian Murray
#v1
sudo apt update && sudo apt upgrade -y
sudo apt install -y net-tools
#helps with entropy issues for vm and headless servers
sudo apt-get install -y haveged
sudo update-rc.d haveged defaults
#Unifi requires java 8 (newer versions may break controller)
sudo apt install openjdk-8-jre-headless -y
#stops java 11 from being installed automatically (newer versions may break controller)
sudo apt-mark hold openjdk-11-*
sudo apt install -y ca-certificates apt-transport-https
#add Unifi software repo requirements
sudo wget -qO /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
#add mongo database software repo requirements
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
#dependacy for mongo 3.*
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
sudo apt install -y ./libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
sudo apt update
sudo apt install -y mongodb-org
sudo apt install -y unifi
echo " "
echo "Unifi controller installation is completed"
echo " "
echo "Controller access:  https://youripaddress:8434"
echo " "
echo "Use: sudo service unifi start/stop/restart/status"
