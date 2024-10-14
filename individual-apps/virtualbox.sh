#!/bin/bash
#install virtualbox
echo "Installing Maltego"
# Creating forder to installation of Maltego
echo "Creating forder to installation of Maltego"
mkdir -p ~/configuration/virtualbox

wget -P ~/configuration/virtualbox/ https://download.virtualbox.org/virtualbox/7.1.2/virtualbox-7.1_7.1.2-164945~Ubuntu~noble_amd64.deb
sudo add-apt-repository universe -y 
sudo apt update
sudo apt install liblzf1 libqt5help5 libqt5opengl5 libqt5printsupport5 libqt5xml5 libtpms0 -y 
sudo apt --fix-broken install -y 
sudo dpkg -i ~/configuration/virtualbox/virtualbox-7.1_7.1.2-164945~Ubuntu~noble_amd64.deb
sudo apt --fix-broken install -y 
echo "virtualbox" 

