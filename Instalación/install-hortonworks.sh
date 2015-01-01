#!bin/bash

#Library description
#

REQUIRED_PACKAGES=
gcc gcc-c++
make cmake automake
fuse
wget scp
openssh openssh-server openssh-clients
yum-utils createrepo
yum-priorities yum-plugin-priorities
;

yum search $REQUIRED_PACKAGES
rpm -qa | grep $REQUIRED_PACKAGES 

#Instalación R
#
# wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# yum localinstall epel-release-6-8.noarch.rpm
# yum install R

echo "********************************************************************";
echo "* Para la instalación de los servicios de Big Data en el clúster,  *";
echo "* es necesario llevar a cabo los siguientes pasos, seleccione      *";
echo "* una de las siguientes opciones.                                  *";
echo "*                                                                  *";
echo "* 0.- Configurar ip estática en cada nodo del clúster              *";
echo "* 1.- Configurar archivos de hosts en cada nodo del clúster        *";
echo "* 2.- Instalación automática de java                               *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*                                                                  *";
echo "*********************************************************************";

#Install and configure mysql database

#Configure NTP

#Disable 

