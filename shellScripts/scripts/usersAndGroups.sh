#!/bin/sh

#Status: Testing

#
# Users and Groups
#

# User which will own the HDFS services.
HDFS_USER=hdfs ;

# User which will own the YARN services.
YARN_USER=yarn ;

# User which will own the MapReduce services.
MAPRED_USER=mapred ;

# User which will own the Pig services.
PIG_USER=pig ;

# User which will own the Hive services.
HIVE_USER=hive ;

# User which will own the Templeton services.
WEBHCAT_USER=hcat ;

# User which will own the HBase services.
HBASE_USER=hbase ;

# User which will own the ZooKeeper services.
ZOOKEEPER_USER=zookeeper ;

# User which will own the Oozie services.
OOZIE_USER=oozie

BIGDATA_USER=hadoop

# A common group shared by services.
HADOOP_GROUP=hadoop ;
