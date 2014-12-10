#!/bin/bash

if [[ -d /etc/init.d/mysqld]];then
    
    #Start the Intance of my MySQL
    cd /etc/init.d/mysqld start

    #Set the root user and the corresponding PassWord
    echo "Starting mySql, type a password for root, then [ENTER]: "
    read -s PASSWORD
    mysqladmin -u root password $PASSWORD
    #Remove the log and the contents of STDOUT
    mysqladmin -u root 2>&1 >/dev/null

    #Create the 'dbuser' to grant acces to the Hive metastore
    
    echo "Insert the name of the dbuser and press [ENTER]: "
    read dbuser

    echo "Insert his password and press [ENTER]: "
    read dbuserpass
    
    mysql -u root < MySqlCommand

    #Reconnect the database using the dbuser
    mysql -u $dbuser -p$dbuser

    #Install  MySQl conector to JAR
    sudo yum install mysql-connector-java*

else
    sudo install mysql-server
    ./$0
fi
