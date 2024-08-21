#!/bin/bash

# Verifica que el script se está ejecutando como root
if [ "$(id -u)" != "0" ]; then
   echo "Este script debe ejecutarse como root" 1>&2
   exit 1
fi

# Cambia los repositorios de APT a 'Trixie'
echo "Actualizando los repositorios a 'Trixie'..."

sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
sed -i 's/stable/trixie/g' /etc/apt/sources.list

# Actualiza el índice de paquetes
echo "Actualizando el índice de paquetes..."
apt-get update

# Realiza una actualización mínima
echo "Realizando una actualización mínima..."
apt-get upgrade -y

# Realiza la actualización completa de la distribución
echo "Actualizando la distribución completa..."
apt-get dist-upgrade -y

# Limpiar paquetes obsoletos
echo "Limpiando paquetes obsoletos..."
apt-get autoremove -y
apt-get autoclean

echo "Actualización a Debian Trixie completada. Es recomendable reiniciar el sistema."
