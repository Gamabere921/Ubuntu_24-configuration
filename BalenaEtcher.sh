#!/bin/bash
echo "Installing BalenaEtcher"

# Creating folder for installation of BalenaEtcher
echo "Creating folder for installation of BalenaEtcher"
mkdir -p ~/configuration/balenaetcher

# Downloading BalenaEtcher .deb package
echo "Downloading BalenaEtcher..."
wget -P ~/configuration/balenaetcher/ https://github.com/balena-io/etcher/releases/download/v1.7.9/balenaEtcher-1.7.9-ia32.AppImage

# Installing BalenaEtcher
mkdir -p /home/$SUDO_USER/apps
sudo cp ~/configuration/balenaetcher/balenaEtcher-1.7.9-ia32.AppImage /home/$SUDO_USER/apps/
# Fixing missing dependencies, if any

echo "BalenaEtcher installed"
