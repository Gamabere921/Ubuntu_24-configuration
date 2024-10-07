#!/bin/bash

# Uninstalling LibreOffice
echo "====================="
echo "Uninstalling LibreOffice"
echo "====================="
sudo apt purge -y libreoffice*
echo "LibreOffice uninstalled"
echo ""

# Installing Nmap
echo "====================="
echo "Installing nmap"
echo "====================="
sudo apt install nmap -y 
echo "Nmap installed"
echo ""

# Installing WPS Office
echo "====================="
echo "Installing WPS Office"
echo "====================="
mkdir -p ~/configuration/WPSoffice/
wget -P ~/configuration/WPSoffice/ https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11723/wps-office_11.1.0.11723.XA_amd64.deb
sudo dpkg -i ~/configuration/WPSoffice/wps-office_11.1.0.11723.XA_amd64.deb
echo "WPS Office installed"
echo ""

# Installing Keepass
echo "====================="
echo "Installing Keepass"
echo "====================="
sudo apt install keepass2 -y
echo "Keepass installed"
echo ""

# Installing Visual Studio Code
echo "====================="
echo "Installing Visual Studio Code"
echo "====================="
sudo apt install wget gpg apt-transport-https -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm packages.microsoft.gpg
sudo apt update
sudo apt install code -y
echo "Visual Studio Code installed"
echo ""

# Installing Maltego
echo "====================="
echo "Installing Maltego"
echo "====================="
mkdir -p ~/configuration/maltego/
wget -P ~/configuration/maltego/ https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.8.0.deb
sudo dpkg -i ~/configuration/maltego/Maltego.v4.8.0.deb
echo "Maltego installed"
echo ""

# Installing Obsidian
echo "====================="
echo "Installing Obsidian"
echo "====================="
mkdir -p ~/configuration/obsidian/
wget -P ~/configuration/obsidian/ https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.AppImage
chmod +x ~/configuration/obsidian/Obsidian-1.6.7.AppImage
sudo -u $SUDO_USER ~/configuration/obsidian/Obsidian-1.6.7.AppImage
echo "Obsidian installed"
echo ""

# Installing Autopsy
echo "====================="
echo "Installing Autopsy"
echo "====================="
echo "Installing Autopsy, this may take a few minutes" 
# Creating forder to installation of Autopsy
mkdir -p ~/configuration/autopsy/

wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.21.0/autopsy-4.21.0.zip

sudo apt remove -y sleuthkit
sudo apt remove -y libtsk19

wget -P ~/configuration/autopsy/ https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.12.1/sleuthkit-java_4.12.1-1_amd64.deb
sudo dpkg -i ~/configuration/autopsy/sleuthkit-java_4.12.1-1_amd64.deb

wget -P ~/configuration/autopsy/ https://raw.githubusercontent.com/sleuthkit/autopsy/refs/heads/develop/linux_macos_install_scripts/install_prereqs_ubuntu.sh

sudo chmod +x ~/configuration/autopsy/install_prereqs_ubuntu.sh

sudo ~/configuration/autopsy/install_prereqs_ubuntu.sh

wget -P ~/configuration/autopsy/ https://raw.githubusercontent.com/sleuthkit/autopsy/refs/heads/develop/linux_macos_install_scripts/install_application.sh

sudo chmod +x ~/configuration/autopsy/install_application.sh

sudo ~/configuration/autopsy/install_application.sh -z ~/configuration/autopsy/autopsy-4.21.0.zip -i ~/autopsy -j /usr/lib/jvm/java-1.17.0-openjdk-amd64
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module -y 

sudo mkdir -p /opt/autopsy
sudo cp -r ~/autopsy/autopsy-4.21.0 /opt/autopsy/
echo 'symbolic code of autopsy' >> ~/.bashrc
echo 'export PATH=$PATH:/opt/autopsy/autopsy-4.21.0/bin/' >> ~/.bashrc
echo 'symbolic code of autopsy' >> $HOME/.bashrc
echo 'export PATH=$PATH:/opt/autopsy/autopsy-4.21.0/bin/' >> $HOME/.bashrc

#Autopsy installed
echo "Autopsy installed"


# Installing Docker and Docker Compose
echo "====================="
echo "Installing Docker and Docker Compose"
echo "====================="
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#post-install docer
echo "try post instalation"
sudo groupadd docker
sudo usermod -aG docker $SUDO_USER
echo "Docker installed"
exec su - $SUDO_USER
