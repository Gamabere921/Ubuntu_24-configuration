#!/bin/bash
echo "Installing Maltego"
# Creating forder to installation of Maltego
echo "Creating forder to installation of Maltego"
mkdir -p ~/configuration/maltego

wget -P ~/configuration/maltego/ https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.8.0.deb

sudo dpkg -i ~/configuration/maltego/Maltego.v4.8.0.deb

echo "maltego installed" 
