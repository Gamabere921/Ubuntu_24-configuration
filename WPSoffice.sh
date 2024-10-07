#!/bin/bash
echo "installing WPSoffice"

# Creating forder to installation of WPSoffice
echo "Creating forder to installation of WPSoffice"

mkdir -p ~/configuration/WPSoffice/
wget -P ~/configuration/WPSoffice/ https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11723/wps-office_11.1.0.11723.XA_amd64.deb
sudo dpkg -i ~/configuration/WPSoffice/wps-office_11.1.0.11723.XA_amd64.deb
echo " WPSoffice installed"
