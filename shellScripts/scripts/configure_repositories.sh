#!/bin/bash

#Download the yum configuration file hdp.repo on /etc/yum.repos
sudo wget -nv http://public-repo-1.hortonworks.com/HDP/centos5/2.x/updates/2.1.7.0/hdp.repo -O /etc/yum.repos.d/hdp.repo

#verify if the repos were correctly installed

yum repolist

exit 0
