#!/bin/bash
# Unifi Controller Install Script
# Brian Murray
# Version 2

apt update && sudo apt upgrade -y
apt install -y net-tools
apt install gnupg curl
# helps with entropy issues for vm and headless servers
apt-get install -y haveged
update-rc.d haveged defaults

apt install -y ca-certificates apt-transport-https
# add Unifi software repo requirements
wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
echo 'deb [ arch=amd64,arm64 ] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list

# add mongo database software repo requirements
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | >

apt update

# install Mondgodb
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod

# install unifi controller
apt install -y unifi
