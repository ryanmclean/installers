#!/bin/bash
cd ~
#Install SIFT Workstation
#uncomment the packages-only command if you want to run the light version.
wget https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux
wget https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux.sha256.asc
chmod +x ./sift-cli-linux
gpg --keyserver pgp.mit.edu --recv-keys 22598A94
gpg --verify sift-cli-linux.sha256.asc
sha256sum -c sift-cli-linux.sha256.asc
sudo mv sift-cli-linux /usr/local/bin/sift
sudo sift install
#sudo sift install --mode=packages-only

#Install remnux
# ignore this since it currently only works on Ubuntu 14.04
#wget --quiet -O - https://remnux.org/get-remnux.sh | sudo bash

#Install JSDetox Docker
#http://www.relentless-coding.com/projects/jsdetox/
sudo apt-get install docker -y
sudo docker run --rm -p 3000:3000 remnux/jsdetox
#To stop JSDetox --> use "sudo docker ps -l" to obtain the container ID, then use the "sudo docker stop container-id" and wait about a minute.

#Install SecurityOnion Client 
sudo add-apt-repository ppa:securityonion/stable -y
sudo apt-get update
sudo apt-get install securityonion-client -y

#Yara Rules
sudo apt install yara -y
#https://github.com/Yara-Rules/rules
sudo git clone https://github.com/Yara-Rules/rules.git /usr/share/yara-rules

#Install vmware tools
sudo apt-get install open-vm-tools-desktop -y

sudo apt-get autoremove --purge -y
