#!/bin/bash
echo "Installing BalenaEtcher"

# Creating folder for installation of BalenaEtcher
echo "Creating folder for installation of BalenaEtcher"
mkdir -p ~/configuration/balenaetcher

# Downloading BalenaEtcher .deb package
echo "Downloading BalenaEtcher..."
wget -P ~/configuration/balenaetcher/ https://github.com/balena-io/etcher/releases/download/v1.19.22/balena-etcher_1.19.22_amd64.deb

# Installing BalenaEtcher
echo "Installing BalenaEtcher..."
sudo dpkg -i ~/configuration/balenaetcher/balena-etcher_1.19.22_amd64.deb

# Fixing missing dependencies, if any
sudo apt-get install -f

echo "BalenaEtcher installed"
