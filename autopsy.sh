#!/bin/bash
echo "Installing Autopsy, this may take a few minutes" 
# Creating forder to installation of Autopsy
mkdir -p ~/configuration/autopsy/

wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.21.0/autopsy-4.21.0.zip

sudo apt remove -y sleuthkit
sudo apt remove -y libtsk19

wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.12.1/sleuthkit-java_4.12.1-1_amd64.deb
sudo dpkg -i ~/configuration/autopsy/sleuthkit-java_4.12.1-1_amd64.deb

wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/autopsy/blob/develop/linux_macos_install_scripts/install_prereqs_ubuntu.sh

sudo chmod +x ~/configuration/autopsy/install_prereqs_ubuntu.sh

sudo ~/configuration/autopsy/install_prereqs_ubuntu.sh

wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/autopsy/blob/develop/linux_macos_install_scripts/install_application.sh

sudo chmod +x ~/configuration/autopsy/install_application.sh

sudo ~/configuration/autopsy/install_application.sh

install_application.sh -z ~/configuration/autopsy-4.19.2.zip -i ~/autopsy -j /usr/lib/jvm/java-1.17.0-openjdk-amd64

#Autopsy installed
echo "Autopsy installed"

