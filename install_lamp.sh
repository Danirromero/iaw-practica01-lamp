#!/bin/bash

# Actualizamos la lista de paquetes.
apt update

# Actualizamos los paquetes.
apt upgrade -y

# Instalamos el servidor web Aparche.
apt install apache2 -y

# Instalamos los módulos PHP.
apt install php libapache2-mod-php php-mysql -y

# Instalamos MySQL Server.
apt install mysql-server -y

# Instalamos las debconf-utils.
apt install debconf-utils -y

# Configuramos la contraseña de root para MySQL.
DB_ROOT_PASSWORD=root
debconf-set-selections <<< "mysql-server mysql-server/root_password $DB_ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWORD"
