#!bin/bash

#Library description
#

REQUIRED_PACKAGES=
gcc gcc-c++
make cmake automake
fuse
wget scp
openssh openssh-server openssh-clients
mysql mysql-server
yum-utils createrepo
yum-priorities yum-plugin-priorities
;

yum search $REQUIRED_PACKAGES
rpm -qa | grep $REQUIRED_PACKAGES 
