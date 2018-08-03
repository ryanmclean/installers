#!/bin/bash

#Install prerequisites
#for Kali there is something weird with Python3 pip not being installed correctly..
#in this case let's uninstall if it's already there, then reinstall to gain pip3 functionality.
apt-get remove python3-pip; apt-get install python3-pip
#impacket is required as well
pip install impacket


#Install CrackMapExec 
# https://github.com/byt3bl33d3r/CrackMapExec/
cd ~
apt-get install -y libssl-dev libffi-dev python-dev build-essential
pip install --user pipenv
git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec

cd CrackMapExec

#If we choose to use pipenv.
#Update profile path to include /root/local/bin
echo "# pipenv customizations to the default shell environment" > /etc/profile.d/pipenv.sh
echo "" >> /etc/profile.d/pipenv.sh
echo "# Add /root/.local/bin to the PATH for all users" >> /etc/profile.d/pipenv.sh
echo "if ! echo \"\$PATH\" | tr : '\n' | grep -q \"^/root/.local/bin\"; then" >> /etc/profile.d/pipenv.sh
echo "     PATH=\"/root/.local/bin:\$PATH\"" >> /etc/profile.d/pipenv.sh
echo "fi" >> /etc/profile.d/pipenv.sh
source /etc/profile.d/pipenv.sh
#pipenv install
#pipenv shell
python setup.py install

#Install empire
cd ~
git clone https://github.com/EmpireProject/Empire
cd Empire/setup && ./install.sh && cd ..
# Start the Empire console and RESTful API
# python empire --rest --username empireadmin --password Password123

#Install DeathStar
cd ~
git clone https://github.com/byt3bl33d3r/DeathStar
# Death Star is written in Python3
pip3 install -r requirements.txt
cd DeathStar
#./DeathStar.py


