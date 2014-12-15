#!/bin/bash

#Disable iptables

sudo chkconfig iptables off
sudo /etc/init.d/iptables stop
