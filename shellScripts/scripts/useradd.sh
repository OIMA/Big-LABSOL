#!bin/bash
USER=hadoop

#Create user hadoop whit root privilegs
sudo useradd -u 0 -o -g 0 $USER

#Setting his password
echo Insert a password
passwd $USER

