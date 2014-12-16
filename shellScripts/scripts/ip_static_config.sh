#!bin/bash

repet(DOCUMENT){

    cat $DOCUMENT

    echo This correct? S/N
    read AN

    if [ $AN = S]; then
       ./$0
       exit 0
    fi
    
}

#Read ip, netmask, gateway, network and Dns

echo "Ip Adress: "
read IPADRESS

echo "NetMask: "
read NETMASK

echo "GateWay: "
read GATEWAY

echo "NetWork: "
read NETWORK

echo "Dns 1: "
read DNS_1

echo "Dns 2: "
read DNS_2

#set ONBOOT to yes

sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0 -c ':s/ONBOOT=no/ONBOOT=yes/'

#set BOOTPROTO to static

sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0 -c ':s/BOOTPROTO=dhcp/BOOTPROTO=static'

#add the netmask

sudo echo "NETMASK=$NETMASK" >> /etc/sysconfig/network-scripts/ifcfg-eth0

#add the ip adress

sudo echo "IPADDR=$IPADRESS" >> /etc/sysconfig/network-scripts/ifcfg-eth0

#add the network

sudo echo "NETWORK=$NETWORK" >> /etc/sysconfig/network-scripts/ifcfg-eth0


repet(/etc/sysconfig/network-scripts/ifcfg-eth0)


#Configure the network file

sudo echo "GATEWAY=$GATEWAY" >> /etc/sysconfig/network

repet(/etc/sysconfig/network)

#Restart Network Interface

sudo /etc/init.d/network restart

#Configure dns server

sudo echo "nameserver $DNS_1" > /etc/resolv.conf
sudo echo "nameserver $DNS_2" >> /etc/resolv.conf

repet(/etc/resolv.conf)
