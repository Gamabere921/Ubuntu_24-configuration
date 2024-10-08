#!/bin/bash
echo "Installing Obsidian"
# Creating forder to installation of Obsidian
echo "Creating forder to installation of Obsidian"
mkdir -p ~/configuration/obsidian/
wget -P ~/configuration/obsidian/ https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.AppImage
chmod +x ~/configuration/obsidian/Obsidian-1.6.7.AppImage
sudo chown $SUDO_USER:$SUDO_USER ~/configuration/obsidian/Obsidian-1.6.7.AppImage
sudo cp ~/configuration/obsidian/Obsidian-1.6.7.AppImage /home/$SUDO_USER/Desktop
#sudo -u $SUDO_USER ~/configuration/obsidian/Obsidian-1.6.7.AppImage

echo "Obsidian installed"
