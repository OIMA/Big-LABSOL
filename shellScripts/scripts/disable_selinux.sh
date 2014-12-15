#!bin/bash

#Check the status of the Selinux

STATE=$(getenforce)

if [ $STATE = enforcing  ]; then

   #Descativate Selinux for this session
   sudo setenforce 0

   #Desactivate Selinux permantly

   sudo vi /etc/sysconfig/selinux -c ':s/SELINUX=enforcing/SELINUX=disable/'

fi
