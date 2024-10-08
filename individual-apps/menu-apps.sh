#!/bin/bash

# Verificar si el script está siendo ejecutado como root o con sudo
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ser ejecutado como root o con sudo."
   exit 1
fi

# Dar permisos de ejecución a todos los scripts en la carpeta actual
chmod +x docker.sh firefox.sh packages.sh

# Imprimir el banner
echo -e " ██████╗  █████╗ ███╗   ███╗██████╗  █████╗ ██████╗ ███████╗\n██╔════╝ ██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗██╔════╝\n██║  ███╗███████║██╔████╔██║██████╔╝███████║██████╔╝█████╗  \n██║   ██║██╔══██║██║╚██╔╝██║██╔══██╗██╔══██║██╔══██╗██╔══╝  \n╚██████╔╝██║  ██║██║ ╚═╝ ██║██████╔╝██║  ██║██║  ██║███████╗\n ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝\n                                                            \n████████╗ ██████╗  ██████╗ ██╗     ███████╗                 \n╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝                 \n   ██║   ██║   ██║██║   ██║██║     ███████╗                 \n   ██║   ██║   ██║██║   ██║██║     ╚════██║                 \n   ██║   ╚██████╔╝╚██████╔╝███████╗███████║                 \n   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝                 \n                                                            "

# Función para mostrar el menú
mostrar_menu() {
    echo ""
    echo "Selecciona una opción:"
    echo "1) Ejecutar docker.sh"
    echo "2) Ejecutar firefox.sh"
    echo "3) Ejecutar packages.sh"
    echo "4) Salir"
}

# Leer la opción del usuario
leer_opcion() {
    read -p "Elige una opción [1-4]: " opcion
    case $opcion in
        1)
            echo "Ejecutando docker.sh..."
            ./docker.sh
            ;;
        2)
            echo "Ejecutando firefox.sh..."
            ./firefox.sh
            ;;
        3)
            echo "Ejecutando packages.sh..."
            ./packages.sh
            ;;
        4)
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
