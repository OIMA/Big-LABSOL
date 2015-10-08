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

export usableMemory
export coresNumber
export disksNumber
export isHbaseInstalled=False
export cpuInfoDirectory=/proc/cpuinfo
export memInfoDirectory=/proc/meminfo
export KBTOGB=1048576
export disksStatsDirectory=/proc/diskstats

export FileDirLevelPerm=022
export hadoopPackages=hadoop hadoop-hdfs hadoop-libhdfs hadoop-yarn hadoop-mapreduce hadoop-client openssl snappy snappy-devel lzo lzo-devel hadooplzo hadooplzo-native
export ZOO_DATA_DIR_NUMBER=/grid/hadoop/zookeeper/data
export ZOOKEEPER_CONF_DIR=/etc/zookeeper/conf

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
    echo '' >> directories.sh
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

    echo '' >> directories.sh
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

    echo '' >> directories.sh
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
    
    echo '' >> directories.sh
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

    echo '' >> directories.sh
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

    echo '' >> directories.sh
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

getProcessorCores(){
    #Status: Ok
    $coresNumber=$(cat /proc/cpuinfo | grep -m 1 '\<cpu cores' | awk '{ print $4 }' )
}

getUsableMemory(){
    #Status: Ok
    memoryKB=$(cat $memInfoDirectory | grep MemTotal | awk '{ print $2 }')
    $usableMemory=$(( $memoryKB / $KBTOGB ))
}

getDisks(){
    #Status: Ok
    $disksNumber=$(cat $disksStatsDirectory | grep  -c "sd[a-z] ")
}

calculateHadoopCoreVariables(){
    #Status: Testing
    python yarn-utils.py -c $coresNumber -m $usableMemory -d $disksNumber -k $isHbaseInstalled > yarn-utils.log
}

setFileAndDirectoryPermissions(){
    #Status: Testing
    umask $FileDirLevelPerm
}

installingZookeeper(){
    #Status: Testing
    sudo yum install zookeeper
}

createZookeeperDirectories(){
    #Status: Testing
    echo '' >> ~/.bash_profile
    cat zookeeper-env.sh >> ~/.bash_profile
    
    sudo mkdir -p $ZOO_LOG_DIR
    sudo chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOO_LOG_DIR
    sudo chmod -R 755 $ZOO_LOG_DIR
    sudo mkdir -p $ZOOPIDFILE
    sudo chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOPIDFILE
    sudo chmod -R 755 $ZOOPIDFILE
    sudo mkdir -p $ZOO_DATA_DIR
    sudo chmod -R 755 $ZOOKEEPER_DATA_DIR
    sudo chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_DATA_DIR
}

setNumberOfResourceManager(){
    #Status: Testing
    #Notes: The current version of this script only install zookeper on the resource manager server. So the culster will only have one server whit zookeper by default
    echo "1" > $ZOO_DATA_DIR_NUMBER/myid 
    
}

setZooCfg(){
    #Status: Testing
    #Note: Execute only on the resource manager
    vi -c ":%s/TODO-ZOOKEEPER-DATA-DIR/$ZOOKEEPER_DATA_DIR/g" -c ":wq" zoo.cfg
    vi -c ":%s/TODO-ZKSERVER-HOSTNAME/$localhost/g" -c ":wq" zoo.cfg
}

setHBaseZoo(){
    #Status: Testing
    #Note: Execute only on the resource manager
    vi -c ":%s/TODO-ZOOKEEPER-HOST_NAME/$localhost/g" -c ":wq" configuration_files/hbase/hbase-site.xml

}

setConfigurationFiles(){
    #Status: Testing
    #Note: Needs script to send all configuration files to another servers
    rm -r $ZOOKEEPER_CONF_DIR ;
    mkdir -p $ZOOKEEPER_CONF_DIR ;
##################################No terminado
    chmod a+x $ZOOKEEPER_CONF_DIR/;
    chown -R $ZOOKEEPER_USER: $HADOOP_GROUP $ZOOKEEPER_CONF_DIR/../;
    chmod -R 755 $ZOOKEEPER_CONF_DIR/../
}

startZookeeper(){
    #Status: Testing
    su - zookeeper -c "export ZOOCFGDIR=/usr/hdp/current/zookeeper-server/conf ; export ZOOCFG=zoo.cfg; source /usr/hdp/current/zookeeper-server/conf/zookeeper-env.sh ; /usr/hdp/current/zookeeper-server/bin/zkServer.sh start"
    /usr/hdp/current/hadoop-client/sbin/hadoop-daemon.sh start zkfc    
}

installHadoopPackages(){
    #Status: Testing
    sudo yum install $hadoopPackages
}

createNameNodeDirectories(){
    #Status: Testing
    #Note: Execute only over the name node

    sudo mkdir -p $DFS_NAME_DIR;
    sudo chown -R $HDFS_USER:$HADOOP_GROUP $DFS_NAME_DIR;
    chmod -R 755 $DFS_NAME_DIR;
}

createSecundaryNameNodeDirectories(){
    #Status: Testing
    #Note: Execute only on the Secundary NameNode
    sudo mkdir -p $FS_CHECKPOINT_DIR;
    sudo chown -R $HDFS_USER:$HADOOP_GROUP $FS_CHECKPOINT_DIR;
    chmod -R 755 $FS_CHECKPOINT_DIR;
}

createDataNodeDirectories(){
    #Status: Testing
    #Note: Execute only on the DataNode

    sudo mkdir -p $DFS_DATA_DIR;
    sudo chown -R $HDFS_USER:$HADOOP_GROUP $DFS_DATA_DIR;
    chmod -R 750 $DFS_DATA_DIR;
}

createYarnDirectories(){
    #Status: Testing
    #Note: Execute only on DataNodes and NodeManager

    sudo mkdir -p $YARN_LOCAL_DIR;
    sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_DIR;
    chmod -R 755 $YARN_LOCAL_DIR;
    #For log directories
    sudo mkdir -p $YARN_LOCAL_LOG_DIR;
    sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_LOG_DIR;
    chmod -R 755 $YARN_LOCAL_LOG_DIR;
}

createLogPidDirectories() {
    #Status: Testing
    #Note: Executo on all nodes
    sudo mkdir -p $HDFS_LOG_DIR;
    sudo chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_LOG_DIR;
    chmod -R 755 $HDFS_LOG_DIR;

    #Yarn
    sudo mkdir -p $YARN_LOG_DIR;
    sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOG_DIR;
    chmod -R 755 $YARN_LOG_DIR;

    #HDFS
    sudo mkdir -p $HDFS_PID_DIR;
    sudo chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_PID_DIR;
    chmod -R 755 $HDFS_PID_DIR

    #Yarn PID
    sudo mkdir -p $YARN_PID_DIR;
    sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_PID_DIR;
    chmod -R 755 $YARN_PID_DIR;

    #Mapred
    sudo mkdir -p $MAPRED_LOG_DIR;
    sudo chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_LOG_DIR;
    chmod -R 755 $MAPRED_LOG_DIR;

    #Mapred PID
    sudo mkdir -p $MAPRED_PID_DIR;
    sudo chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_PID_DIR;
    chmod -R 755 $MAPRED_PID_DIR;
}

setHadoopYarnEnvVariables(){
    #Status: Testing
    . configuration_files/core_hadoop/hadoop-env.sh
    echo '' >> ~/.bash_profile
    cat configuration_files/core_hadoop/hadoop-env.sh >> ~/.bash_profile

    . configuration_files/core_hadoop/yarn-env.sh
    echo '' >> ~/.bash_profile
    cat configuration_files/core_hadoop/yarn-env.sh >> ~/.bash_profile
    
}

modifieCoreSite(){
    #Status: Testing
    #Notes: Run only on the NameNode

    vi -c ":%s/TODO-NAMENODE-HOSTNAME:PORT/$localhost:8020/g" -c ":wq" configuration_files/core_hadoop/core-site.xml
    
}

modifieHdfsSite(){
    #Status: Testing
    #Notes: Run only on the NameNode

    DFS_DATA_DIR="file://$(echo "$DFS_DATA_DIR" | sed -r 's/ /, file/////g')"
    
    vi -c ":%s/TODO-DFS-DATA-DIR/$DFS_DATA_DIR/g" -c ":wq" configuration_files/core_hadoop/hdfs-site.xml

    vi -c ":%s/TODO-NAMENODE-HOSTNAME/$localhost/g" -c ":wq" configuration_files/core_hadoop/hdfs-site.xml

    DFS_NAME_DIR=$(echo "$DFS_NAME_DIR" | sed -r 's/ /,/g')

    vi -c ":%s/TODO-DFS-NAME-DIR/$DFS_NAME_DIR/g" -c ":wq" configuration_files/core_hadoop/hdfs-site.xml

    vi -c ":%s/TODO-FS-CHECKPOINT-DIR/$FS_CHECKPOINT_DIR/g" -c ":wq" configuration_files/core_hadoop/hdfs-site.xml

    echo "Type the Host Name of your Secondary NameNode"
    read secondaryName

    vi -c ":%s/TODO-SECONDARYNAMENODE-HOSTNAME/$secondaryName/g" -c "-wq" configuration_files/core_hadoop/hdfs-site.xml

    
}

modifieYarnSite(){
    #Status: Testing
    #Note: Execute only on the NameNode Host

    vi -c ":%s/TODO-YARN-LOCAL-DIR/$YARN_LOCAL_DIR/g" -c ":wq" configuration_files/core_hadoop/yarn-site.xml

    echo "Type the Host Name of your Resource Manager"
    read resourceManager
    
    vi -c ":%s/TODO-RMNODE-HOSTNAME/$resourceManager/g" -c ":wq" configuration_files/core_hadoop/yarn-site.xml

    vi -c ":%s/TODO-YARN-LOCAL-LOG-DIR/$YARN-LOCAL-LOG-DIR/g" -c ":wq" configuration_files/core_hadoop/yarn-site.xml
    
}

modifieMapredSite(){
    #Status: Testing
    #Note: Execute only on the NameNode Host 'Optional'

    echo "Type the Host Name of your JobHistory Server"
    read jobHistory
    
    vi -c ":%s/c6401.ambari.apache.org/$jobHistory/g" -c ":wq" configuration_files/core_hadoop/yarn-site.xml
}

setSpecialConfigurations(){
    #Status: Testing
    #Note: Execute on all servers, The function takes the yarn-utils.log to set the  resources each server can use for the function of yarn and hadoop

    vi -c ":%s/=/ /g" -c ":wq" yarn-utils.log
}

# =============================================================================
# Script Main
# =============================================================================
# End of File
