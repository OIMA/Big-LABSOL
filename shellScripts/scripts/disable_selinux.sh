#!/bin/bash

#Status: Ok

#Check the status of the Selinux

export DIRECTORY=$(pwd)

cd $DIRECTORY

cd ..



STATE=$(getenforce)

if [ $STATE = Enforcing ]; then

   #Descativate Selinux for this session
   sudo setenforce 0

   #Desactivate Selinux permantly

   sudo cp /etc/sysconfig/selinux /etc/sysconfig/selinux.bak
   sudo cat resources/selinux > /etc/sysconfig/selinux

   echo $(getenforce)
   
fi
