#!/bin/sh

##############
############## IMPORTANT STEPS FOR RUNNING VAGRANT ON WINDOWS 7
############## Start up virtualbox in admin mode by right clicking on virtualbox and clicking "run as administrator" and then open up cygwin terminal as an administrator as well. Both programs must be run as admin for symlinking to work correctly on windows 7.
##############

SITE_DIR="/var/www/html" # The path to the web application on the server (default: /var/www/html)
SITE_PUB_DIR="/var/www/html/geophalcon.local/public" # The path to the application public web folder.
VAGRANT_DATA_DIR="/vagrant/vagrant"
DB_NAME="nursearmy" #name of mysql DB.

# Install Applications
yum install -y git
yum install -y vim
yum install -y unzip.x86_64


# Install LAMP stack

# Apache
yum install -y httpd
service httpd start
chkconfig httpd on

# MySql / MariaDB
yum install -y mysql mysql-server
service mysqld start
chkconfig mysqld on


# PHP
yum install -y php php-mysql php-pdo

# Create GeoPhalcon MySql user and database via install script
php $VAGRANT_DATA_DIR/mysql/install.php


# Setting up Xdebug
yum install -y php-devel
yum install -y php-pear
yum install -y gcc gcc-c++ autoconf automake
pecl install Xdebug

# Install xdebug.ini file.
ln -s $VAGRANT_DATA_DIR/php/xdebug.ini /etc/php.d/xdebug.ini

# Install configured php.ini
cp /etc/php.ini /etc/php.ini.orig
rm -f /etc/php.ini
ln -s $VAGRANT_DATA_DIR/php/php.ini /etc/php.ini

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

#echo "Symlinking site ..."
rm -rf /var/www/html #delete html folder so the symlink will recreate it correctly (folder recreated as link).
ln -s /vagrant $SITE_DIR

#echo "Updating session folder permissions"
chown -R vagrant:vagrant /var/lib/php/session


# Install configured httpd.conf
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.orig
rm -f /etc/httpd/conf/httpd.conf
ln -s $VAGRANT_DATA_DIR/apache/httpd.conf /etc/httpd/conf/httpd.conf

echo "Downloading GeoNames data and importing into MySql"
# Run GeoNames import script

# Restart services
service httpd restart
service mysqld restart

# Disabling the development firewall
systemctl stop firewalld.service

echo "Server provisioning complete!"