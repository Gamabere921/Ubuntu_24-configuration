#!/bin/bash

# Verificar si el script se ejecuta con privilegios de superusuario
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root o con sudo." 
   exit 1
fi

# Eliminar la versión de Firefox instalada como Snap
echo "Eliminando la versión de Firefox instalada como Snap (si existe)..."
snap remove firefox || echo "Firefox no estaba instalado como Snap."

# Crear el directorio para las llaves del repositorio si no existe
echo "Creando el directorio para las llaves de APT..."
install -d -m 0755 /etc/apt/keyrings

# Descargar e importar la llave de firma del repositorio de Mozilla
echo "Descargando e importando la llave de firma de Mozilla..."
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

# Verificar la huella digital de la llave
echo "Verificando la huella digital de la llave..."
FINGERPRINT=$(gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); print $0}')

EXPECTED_FINGERPRINT="35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3"
if [ "$FINGERPRINT" == "$EXPECTED_FINGERPRINT" ]; then
    echo "La huella digital coincide: $FINGERPRINT"
else
    echo "Error: La huella digital no coincide."
    exit 1
fi

# Agregar el repositorio de Mozilla a la lista de fuentes APT
echo "Agregando el repositorio de Mozilla a la lista de fuentes APT..."
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | tee /etc/apt/sources.list.d/mozilla.list > /dev/null

# Configurar APT para priorizar los paquetes del repositorio de Mozilla
echo "Configurando APT para priorizar los paquetes de Mozilla..."
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | tee /etc/apt/preferences.d/mozilla

sudo apt install --fix-broken install

# Actualizar la lista de paquetes e instalar Firefox
echo "Actualizando la lista de paquetes e instalando Firefox..."
sudo apt update 
sudo apt install --fix-broken install
sudo install -y firefox

# Finalización
if [ $? -eq 0 ]; then
    echo "Firefox se ha instalado correctamente."
else
    echo "Hubo un problema durante la instalación de Firefox."
    exit 1
fi
