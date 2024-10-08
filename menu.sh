#!/bin/bash

# Verificar si el script está siendo ejecutado como root o con sudo
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ser ejecutado como root o con sudo."
   exit 1
fi

# Dar permisos de ejecución a todos los scripts en la carpeta actual
chmod +x autopsy.sh docker.sh keepass.sh maltego.sh nmap.sh obsidian.sh todos.sh uninstalling-libreoffice.sh vs-code.sh WPSoffice.sh BalenaEtcher.sh

# Imprimir el banner
echo -e " ██████╗  █████╗ ███╗   ███╗██████╗  █████╗ ██████╗ ███████╗\n██╔════╝ ██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗██╔════╝\n██║  ███╗███████║██╔████╔██║██████╔╝███████║██████╔╝█████╗  \n██║   ██║██╔══██║██║╚██╔╝██║██╔══██╗██╔══██║██╔══██╗██╔══╝  \n╚██████╔╝██║  ██║██║ ╚═╝ ██║██████╔╝██║  ██║██║  ██║███████╗\n ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝\n                                                            \n████████╗ ██████╗  ██████╗ ██╗     ███████╗                 \n╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝                 \n   ██║   ██║   ██║██║   ██║██║     ███████╗                 \n   ██║   ██║   ██║██║   ██║██║     ╚════██║                 \n   ██║   ╚██████╔╝╚██████╔╝███████╗███████║                 \n   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝                 \n                                                            "

# Función para mostrar el menú
mostrar_menu() {
    echo ""
    echo "Selecciona una opción:"
    echo "1) Ejecutar autopsy.sh"
    echo "2) Ejecutar docker.sh"
    echo "3) Ejecutar keepass.sh"
    echo "4) Ejecutar maltego.sh"
    echo "5) Ejecutar nmap.sh"
    echo "6) Ejecutar obsidian.sh"
    echo "7) Ejecutar uninstalling-libreoffice.sh"
    echo "8) Ejecutar vs-code.sh"
    echo "9) Ejecutar WPSoffice.sh"
    echo "10) Ejecutar todos.sh"
    echo "11) Ejecutar BalenaEtcher.sh"  # Nueva opción añadida
    echo "12) Salir"
}

# Leer la opción del usuario
leer_opcion() {
    read -p "Elige una opción [1-12]: " opcion
    case $opcion in
        1)
            echo "Ejecutando autopsy.sh..."
            ./autopsy.sh
            ;;
        2)
            echo "Ejecutando docker.sh..."
            ./docker.sh
            ;;
        3)
            echo "Ejecutando keepass.sh..."
            ./keepass.sh
            ;;
        4)
            echo "Ejecutando maltego.sh..."
            ./maltego.sh
            ;;
        5)
            echo "Ejecutando nmap.sh..."
            ./nmap.sh
            ;;
        6)
            echo "Ejecutando obsidian.sh..."
            ./obsidian.sh
            ;;
        7)
            echo "Ejecutando uninstalling-libreoffice.sh..."
            ./uninstalling-libreoffice.sh
            ;;
        8)
            echo "Ejecutando vs-code.sh..."
            ./vs-code.sh
            ;;
        9)
            echo "Ejecutando WPSoffice.sh..."
            ./WPSoffice.sh
            ;;
        10)
            echo "Ejecutando todos.sh..."
            ./todos.sh
            ;;
        11)
            echo "Ejecutando BalenaEtcher.sh..."  # Nueva opción ejecutada
            ./BalenaEtcher.sh
            ;;
        12)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
}

# Bucle para mantener el menú hasta que el usuario decida salir
while true; do
    mostrar_menu
    leer_opcion
done
