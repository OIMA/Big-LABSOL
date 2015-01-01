#!/bin/bash

#Status: Ok

if [ -f /etc/init.d/ntpd ]; then
   
   #Enable the service
   sudo chkconfig ntpd on
   #Start the NTP
   sudo /etc/init.d/ntpd start
   #Configure the firewall on the local NTP server to enable UDP input traffic on port 123

   export LOCAL_SERVER_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
   
   sudo iptables -A RH-Firewall-1-INPUT -s $LOCAL_SERVER_IP/24 -m state --state NEW -p udp --dport 123 -j ACCEPT

   #Restart iptables

   sudo service iptables restart

   #Configure clients to use the local NTP server

   sudo echo "server $LOCAL_SERVER_IP" >> /etc/ntp.conf

   else

       yum install ntp
       ./$0

fi
