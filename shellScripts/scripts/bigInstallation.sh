#!/bin/bash

set -x

# =============================================================================
# Scripts Variables
# =============================================================================
export localhost

export javaVersion="1.7"
export javaFile=jdk-7u71-linux-x64.tar.gz
export javaFolder=jdk1.7.0_71
export decompressCode=-xzvf
export javaDirectory=/usr/java

export sqlDatabaseCommands="CREATE USER 'dbuser'@'$localhost' IDENTYFIED BY '$dbuserPass';GRANT ALL PRIVILEGES ON *.* TO 'dbuser'@'$localhost';CREATE USER 'dbuser'@'%' IDENTIFIED BY '$dbuserpass';GRANT ALL PRIVILEGES ON *.* TO 'dbuser'@'%';FLUSH PRIVILEGES;GRANT ALL PRIVILEGES ON *.* TO '$dbuser'@'$localhost' WITH GRANT OPTION;GRANT ALL PRIVILEGES ON *.* TO 'dbuser'@'%' WITH GRANT OPTION;"

export hortonWorksRepository=http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.2.6.0/hdp.repo
export hortonWorksRepoDirectory=/etc/yum.repos.d/hdp.repo
# =============================================================================
# Scripts Functions
# =============================================================================


installJava(){

    #Status: Testing
    
    #Needs to be runned whit source
    
    #This will check if any JDK is installed
    
    if hash java 2>/dev/null; then
	echo found java executable in PATH
	_java=java
	
	
    elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
	echo found java executable in JAVA_HOME
	_java="$JAVA_HOME/bin/java"
	
    else
	echo No Java version founded
	if [ -d $javaDirectory ]; then
	    
	    echo Found directory
	    
	else
	    sudo mkdir $javaDirectory
	fi
	
	export RESUORCES=$(pwd)
	cd $RESUORCES
	cd ..
	sudo cp -v resources/$javaFile $javaDirectory
	sudo tar -xzvf /usr/java/$javaFile
	sudo mv $javaFolder $javaDirectory
	sudo ln -s /usr/java/$javaFolder $javaDirectory/default
	export JAVA_HOME=$javaDirectory/default
	echo $JAVA_HOME
	export PATH=$JAVA_HOME/bin:$PATH
	echo "export PATH=$PATH" >> ~/.bash_profile
	echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bash_profile
		
    fi
    
    if [[ "$_java" ]]; then
	version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
	echo version "$version"
	if [[ "$version" > $javaVersion ]]; then
	    echo Done
	else
	    
	    yum remove {java-1.*}
	    
	    sudo find / -name java -exec rm -rf {} \;
	    
	    sudo mkdir $javaDirectory
	    
	    export RESUORCES=$(pwd)
    	    cd $RESUORCES
    	    cd ..
    	    sudo cp -v resources/$javaFile /usr/java
    	    sudo tar -xzvf $javaDirectory/$javaFile
    	    sudo mv jdk1.7.0_71 $javaDirectory
    	    sudo ln -s $javaDirectory/$javaFolder $javaDirectory/default
    	    export JAVA_HOME=$javaDirectory/default
    	    echo $JAVA_HOME
    	    export PATH=$JAVA_HOME/bin:$PATH
            echo "export PATH=$PATH" >> ~/.bash_profile
            echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bash_profile
	    
	fi
	
    fi
    
}

getHostName(){
    $localhost=$(hostname -f)
}

installSql() {
    
    #Status: Testing
    sudo yum install mysql-server
    
    if [ $? -eq 1 ]; then
	wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
	sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
    fi
    #Start the Intance of my MySQL
    sudo /etc/init.d/mysqld start
    
    if [ !$? ];then
	echo "Someting went wrong"
	exit 0
    fi
    
    #Set the root user and the corresponding PassWord
    echo "Starting mySql, type a password for root, then [ENTER]: "
    read -s PASSWORD
    sudo mysqladmin -u root password $PASSWORD
    #Remove the log and the contents of STDOUT
    sudo mysqladmin -u root 2>&1 >/dev/null
    #Create the 'dbuser' to grant acces to the Hive metastore
    test=0
    
    while [ $test ]
    do
	echo "Insert the password for the 'dbuser' and press [ENTER]: "
	read -s dbuserPass
	
	echo "Insert the password again"
	read -s dbuserPassAgain
	
	if [ dbuserPass == dbuserPassAgain ]; then
	    $test=1
	fi
    done
    
    getHostName
    sudo mysql -u root -p$PASSWORD -Bse $sqlDatabaseCommands 
    #Reconnect the database using the dbuser
    sudo mysql -u dbuser
    #Install  MySQl conector to JAR
    sudo yum install mysql-connector-java*
    
}

configRepo(){
    #Status: Ok

    #Download the yum configuration file hdp.repo on /etc/yum.repos
    sudo wget -nv $hortonWorksRepository -O $hortonWorksRepoDirectory
    
    #verify if the repos were correctly installed
    sudo yum repolist
}

ntpInstall(){

    #Status: Testing
    
    sudo yum install ntp
    #Enable the service
    sudo chkconfig ntpd on
    #Start the NTP
    sudo /etc/init.d/ntpd start
    #Configure the firewall on the local NTP server to enable UDP input traffic on port 123   
    sudo iptables -A RH-Firewall-1-INPUT -s $localhost/24 -m state --state NEW -p udp --dport 123 -j ACCEPT
    #Restart iptables
    sudo service iptables restart
    #Configure clients to use the local NTP server
    sudo echo "server $localhost" >> /etc/ntp.conf
}

disableSElinux(){
    #Status: Testing
    
    #Check the status of the Selinux
    
    export DIRECTORY=$(pwd)
    
    cd $DIRECTORY
    
    cd ..
    
    
    
    STATE=$(getenforce)
    
    if [ $STATE = Enforcing ]; then
	
	#Descativate Selinux for this session
	sudo setenforce 0
	
	echo $(getenforce)
	
    fi
}

disableIPTables(){
    #Status: Ok
    
    #Disable iptables
    
    sudo chkconfig iptables off
    sudo /etc/init.d/iptables stop
}

setDfsNameDir(){
    #Status: Testing
    
    # Space separated list of directories where NameNode will store file system image. For example, /grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn  
    echo "How many directories to store files you want? "
    read N
    
    DFS_NAME_DIR="";
    declare -i LAST=0
    
    while [ ! $LAST = $N ]
    do
	if [ $LAST = 0 ]; then
	    DFS_NAME_DIR=/grid/hadoop/hdfs/nn;
	else
	    DFS_NAME_DIR="$DFS_NAME_DIR /grid$LAST/hadoop/hdfs/nn";
	fi
	LAST=$(( $LAST + 1 ))
    done
    echo "DFS_NAME_DIR=$DFS_NAME_DIR" >> directories.sh
}

setDfsDataDir(){
    #Status: Testing
    
    #Space separated list of directories where DataNodes will store the blocks. For example, /grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn
    DFS_DATA_DIR="";

    echo "How many directories will DataNodes use to store the blocks of data? "
    read N
    
    declare -i LAST=0
    
    while [ ! $LAST = $N ]
    do
	if [ $LAST = 0 ]; then
	    DFS_DATA_DIR=/grid/hadoop/hdfs/dn;
	else
	    DFS_DATA_DIR="$DFS_DATA_DIR /grid$LAST/hadoop/hdfs/dn";
	fi
	LAST=$(( $LAST + 1 ))
    done

    echo "DFS_DATA_DIR=$DFS_DATA_DIR" >> directories.sh
}

setFsCheckpointDir(){
    #Status: testing
    
    # Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, /grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn
    FS_CHECKPOINT_DIR="";
    
    echo "How many directories will the SecondaryNameNode use to store the checkpoints images? "
    read N
    
    declare -i LAST=0
    
    while [ ! $LAST = $N ]
    do
	if [ $LAST = 0 ]; then
	    FS_CHECKPOINT_DIR=/grid/hadoop/hdfs/snn;
	else
	    FS_CHECKPOINT_DIR="$FS_CHECKPOINT_DIR /grid$LAST/hadoop/hdfs/snn";
	fi
	LAST=$(( $LAST + 1 ))
    done

    echo "FS_CHECKPOINT_DIR=$FS_CHECKPOINT_DIR" >> directories.sh
}

setYarnLocalDir(){
    #Status: Testing
    # Space separated list of directories where YARN will store temporary data. For example, /grid/hadoop/yarn/local /grid1/hadoop/yarn/local /grid2/hadoop/yarn/local
    YARN_LOCAL_DIR="";
    
    echo "How many directories will YARN use to store temporary data? "
    read N
    
    declare -i LAST=0
    
    while [ ! $LAST = $N ]
    do
	if [ $LAST = 0 ]; then
	    YARN_LOCAL_DIR=/grid/hadoop/yarn/local;
	else
	    YARN_LOCAL_DIR="$YARN_LOCAL_DIR /grid$LAST/hadoop/yarn/local";
	fi
	LAST=$(( $LAST + 1 ))
    done

    echo "YARN_LOCAL_DIR=$YARN_LOCAL_DIR" >> directories.sh
}

setYarnLocalLogDir(){
    # Status: Testing
    # Space separated list of directories where YARN will store container log data. For example, /grid/hadoop/yarn/logs /grid1/hadoop/yarn/logs /grid2/hadoop/yarn/logs
    YARN_LOCAL_LOG_DIR="";
    
    echo "How many directories will YARN use to store container log data? "
    read N
    
    declare -i LAST=0
    
    while [ ! $LAST = $N ]
    do
	if [ $LAST = 0 ]; then
	    YARN_LOCAL_LOG_DIR=/grid/hadoop/yarn/logs;
	else
	    YARN_LOCAL_LOG_DIR="$YARN_LOCAL_LOG_DIR /grid$LAST/hadoop/yarn/logs";
	fi
	LAST=$(( $LAST + 1 ))
    done

    echo "YARN_LOCAL_LOG_DIR=$YARN_LOCAL_LOG_DIR" >> directories.sh
}

setZookeperDataDir(){
    # Status: Testing
    # Directory where ZooKeeper will store data. For example, /grid1/hadoop/zookeeper/data
    ZOOKEEPER_DATA_DIR="";

    echo "How many directories will ZooKeeper use to store data? "
    read N

    declare -i LAST=0

    while [ ! $LAST = $N ]
    do
	if [ $LAST = 0 ]; then
	    ZOOKEEPER_DATA_DIR=/grid/hadoop/zookeeper/data;
	else
	    ZOOKEEPER_DATA_DIR="$ZOOKEEPER_DATA_DIR /grid$LAST/hadoop/zookeeper/data";
	fi
	LAST=$(( $LAST + 1 ))
    done

    echo "ZOOKEEPER_DATA_DIR=$ZOOKEEPER_DATA_DIR" >> directories.sh
}

setDirectoriesVariables(){
    #Status: Testing
    . directories.sh
    echo '' >> ~/.bash_profile
    cat directories.sh >> ~/.bash_profile
}

setUsersVariables(){
    . usersAndGroups.sh
    echo '' >> ~/.bash_profile
    cat usersAndGroups.sh >> ~/.bash_profile
}

createUsersAndGroups(){
    #Status: Testing
    
    for var in $HDFS_USER $YARN_USER $MAPRED_USER $PIG_USER $HIVE_USER $WEBHCAT_USER $HBASE_USER $ZOOKEEPER_USER $OOZIE_USER $BIGDATA_USER
    do
	#Add user to the group
	sudo useradd -G $HADOOP_GROUP $var
	
	#Set a password for each user
	passwd $var
    done
}

# =============================================================================
# Script Main
# =============================================================================
# End of File
