#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar los paquetes
sudo apt install -y ufw neofetch net-tools htop snapd timeshift tree curl

# Verificar la instalación
if command -v ufw &> /dev/null; then
    echo "ufw instalado correctamente."
else
    echo "Error al instalar ufw."
fi

if command -v neofetch &> /dev/null; then
    echo "neofetch instalado correctamente."
else
    echo "Error al instalar neofetch."
fi

if command -v netstat &> /dev/null; then
    echo "net-tools instalado correctamente."
else
    echo "Error al instalar net-tools."
fi

if command -v htop &> /dev/null; then
    echo "htop instalado correctamente."
else
    echo "Error al instalar htop."
fi

if command -v snap &> /dev/null; then
    echo "snap instalado correctamente."
else
    echo "Error al instalar snap."
fi

if command -v timeshift &> /dev/null; then
    echo "timeshift instalado correctamente."
else
    echo "Error al instalar timeshift."
fi

if command -v tree &> /dev/null; then
    echo "tree instalado correctamente."
else
    echo "Error al instalar tree."
fi

if command -v curl &> /dev/null; then
    echo "curl instalado correctamente."
else
    echo "Error al instalar curl."
fi

# Agregar neofetch al .bashrc
if ! grep -Fxq "neofetch" /home/$SUDO_USER/.bashrc; then
    echo "neofetch" >> /home/$SUDO_USER/.bashrc
    echo "neofetch agregado a .bashrc. Se ejecutará en nuevas terminales."
else
    echo "neofetch ya está en .bashrc."
fi

echo "Instalación completada."
