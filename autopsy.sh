#!/bin/bash
echo "Installing Autopsy, this may take a few minutes" 
# Creating forder to installation of Autopsy
mkdir -p ~/configuration/autopsy/

wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.21.0/autopsy-4.21.0.zip

sudo apt remove -y sleuthkit
sudo apt remove -y libtsk19
sudo apt --fix-broken install -y
wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.12.1/sleuthkit-java_4.12.1-1_amd64.deb
sudo dpkg -i ~/configuration/autopsy/sleuthkit-java_4.12.1-1_amd64.deb
sudo apt --fix-broken install -y 
wget -P ~/configuration/autopsy/ https://raw.githubusercontent.com/sleuthkit/autopsy/refs/heads/develop/linux_macos_install_scripts/install_prereqs_ubuntu.sh

sudo chmod +x ~/configuration/autopsy/install_prereqs_ubuntu.sh

sudo ~/configuration/autopsy/install_prereqs_ubuntu.sh
sudo apt --fix-broken install -y 
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module -y 
wget -P ~/configuration/autopsy/ https://raw.githubusercontent.com/sleuthkit/autopsy/refs/heads/develop/linux_macos_install_scripts/install_application.sh

sudo chmod +x ~/configuration/autopsy/install_application.sh

sudo ~/configuration/autopsy/install_application.sh -z ~/configuration/autopsy/autopsy-4.21.0.zip -i ~/autopsy -j /usr/lib/jvm/java-1.17.0-openjdk-amd64

#Creando enlace simbolico y app en desktop
sudo cp -r ~/autopsy/autopsy-4.21.0 /opt/
sudo ln -s /opt/autopsy-4.21.0/bin/autopsy /usr/local/bin/autopsy
# wget -P ~/configuration/autopsy/ https://raw.githubusercontent.com/Gamabere921/Ubuntu_24-configuration/refs/heads/main/autopsy.desktop
# sudo cp ~/configuration/autopsy/autopsy.desktop /home/$SUDO_USER/.local/share/applications/
# sudo cp ~/configuration/autopsy/autopsy.desktop ~/.local/share/applications/
#Autopsy installed
echo "Autopsy installed"

