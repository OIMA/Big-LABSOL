#!bin/bash

#Status: Testing

source ./usersAndGroups

egrep -i "^$HADOOP_GROUP" /etc/group

if [$? -eq 0]; then

else
    sudo groupadd $HADOOP_GROUP
fi
    
for var in $HDFS_USER $YARN_USER $MAPRED_USER $PIG_USER $HIVE_USER $WEBHCAT_USER $HBASE_USER $ZOOKEEPER_USER $OOZIE_USER $BIGDATA_USER
do
    #Add user to the group
    sudo useradd -G $HADOOP_GROUP $var
    #Create the user name directory
    hdfs fs -mkdir /user/$var
    #Give tat account ownership over its directory
    hdfs fs -chown $var:$HADOOP_GROUP /user/$var
    
done
    
