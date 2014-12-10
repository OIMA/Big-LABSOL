#!/bin/bash

if [ -f /etc/init.d/mysqld ]; then
    
    #Start the Intance of my MySQL
    /etc/init.d/mysqld start

    #Set the root user and the corresponding PassWord
    echo "Starting mySql, type a password for root, then [ENTER]: "
    read -s PASSWORD
    sudo mysqladmin -u root password $PASSWORD
    #Remove the log and the contents of STDOUT
    sudo mysqladmin -u root 2>&1 >/dev/null

    #Create the 'dbuser' to grant acces to the Hive metastore
    
    echo "Insert the name of the dbuser and press [ENTER]: "
    read dbuser

    echo "Insert his password and press [ENTER]: "
    read dbuserpass

    echo "Insert local Host, the press [ENTER]: "
    read localhost
    
    sudo mysql -u root < MySqlCommands

    #Reconnect the database using the dbuser
    sudo mysql -u $dbuser -p$dbuser

    #Install  MySQl conector to JAR
    sudo yum install mysql-connector-java*

else
    sudo yum install mysql-server
    ./$0
fi
