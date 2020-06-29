# Ubiquiti Unifi Controller Install Script
Very simple bash script to install Unifi Controller software on Ubuntu Server 20.04. The script installs all required software identified by Ubiquiti. This was only tested on Ubuntu Server 20.04 LTS. This script will install the latest stable version (5.13.29) of the Unifi Controller software. Once the script is finished you can access the Unifi Controller at:
```
https://serveripaddress:8443
```
### Prerequisites
* Tested using Ubuntu Server 20.04 LTS on Virtualbox
* May require use of sudo
### Installing
Make the script executable.
```
chmod +x unifi_setup.sh
```
Execute the installer script
```
sudo ./unifi_setup.sh
```
### Helpful Commands
Start unifi service
```
service unifi start
```
Stop unifi services
```
service unifi stop
```
Restart unifi service
```
service unifi restart
```
## Helpful Resources
* [Unifi Controller Requirements](https://help.ui.com/hc/en-us/articles/360012192813#unifi-requirements)
* [Unifi release notes for 5.13.29](https://community.ui.com/releases/UniFi-Network-Controller-5-13-29/d7647910-77a2-4e61-bbfe-389206f2d6ad)

