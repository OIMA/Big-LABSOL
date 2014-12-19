#!/bin/sh

#Status: Development

#
# Directories Script
#
# 1. To use this script, you must edit the TODO variables below for your environment.
#
# 2. Warning: Leave the other parameters as the default values. Changing these default values will require you to
#    change values in other configuration files.
#

#
# Hadoop Service - HDFS
#

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

# Space separated list of directories where DataNodes will store the blocks. For example, /grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn
DFS_DATA_DIR="";

echo "How many directories will DataNodes use to store the blocks? "
read N

LAST=0

while [ ! $LAST = $N ]
do
    if [ $LAST = 0 ]; then
	DFS_DATA_DIR=/grid/hadoop/hdfs/dn;
    else
	DFS_DATA_DIR="$DFS_DATA_DIR /grid$LAST/hadoop/hdfs/dn";
    fi
    LAST=$(( $LAST + 1 ))
done


# Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, /grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn
FS_CHECKPOINT_DIR="";

echo "How many directories will the SecondaryNameNode use to store the checkpoints images? "
read N

LAST=0

while [ ! $LAST = $N ]
do
    if [ $LAST = 0 ]; then
	FS_CHECKPOINT_DIR=/grid/hadoop/hdfs/snn;
    else
	FS_CHECKPOINT_DIR="$FS_CHECKPOINT_DIR /grid$LAST/hadoop/hdfs/snn";
    fi
    LAST=$(( $LAST + 1 ))
done



# Directory to store the HDFS logs.
HDFS_LOG_DIR="/var/log/hadoop/hdfs";

# Directory to store the HDFS process ID.
HDFS_PID_DIR="/var/run/hadoop/hdfs";

# Directory to store the Hadoop configuration files.
HADOOP_CONF_DIR="/etc/hadoop/conf";

#
# Hadoop Service - YARN 
#

# Space separated list of directories where YARN will store temporary data. For example, /grid/hadoop/yarn/local /grid1/hadoop/yarn/local /grid2/hadoop/yarn/local
YARN_LOCAL_DIR="";

echo "How many directories will YARN use to store temporary data? "
read N

LAST=0

while [ ! $LAST = $N ]
do
    if [ $LAST = 0 ]; then
	YARN_LOCAL_DIR=/grid/hadoop/yarn/local;
    else
	YARN_LOCAL_DIR="$YARN_LOCAL_DIR /grid$LAST/hadoop/yarn/local";
    fi
    LAST=$(( $LAST + 1 ))
done

# Directory to store the YARN logs.
YARN_LOG_DIR="/var/log/hadoop/yarn"; 

# Space separated list of directories where YARN will store container log data. For example, /grid/hadoop/yarn/logs /grid1/hadoop/yarn/logs /grid2/hadoop/yarn/logs
YARN_LOCAL_LOG_DIR="";

echo "How many directories will YARN use to store container log data? "
read N

LAST=0

while [ ! $LAST = $N ]
do
    if [ $LAST = 0 ]; then
	YARN_LOCAL_LOG_DIR=/grid/hadoop/yarn/logs;
    else
	YARN_LOCAL_LOG_DIR="$YARN_LOCAL_LOG_DIR /grid$LAST/hadoop/yarn/logs";
    fi
    LAST=$(( $LAST + 1 ))
done

# Directory to store the YARN process ID.
YARN_PID_DIR="/var/run/hadoop/yarn";

#
# Hadoop Service - MAPREDUCE
#

# Directory to store the MapReduce daemon logs.
MAPRED_LOG_DIR="/var/log/hadoop/mapred";

# Directory to store the mapreduce jobhistory process ID.
MAPRED_PID_DIR="/var/run/hadoop/mapred";

#
# Hadoop Service - Hive
#

# Directory to store the Hive configuration files.
HIVE_CONF_DIR="/etc/hive/conf";

# Directory to store the Hive logs.
HIVE_LOG_DIR="/var/log/hive";

# Directory to store the Hive process ID.
HIVE_PID_DIR="/var/run/hive";

#
# Hadoop Service - WebHCat (Templeton)
#

# Directory to store the WebHCat (Templeton) configuration files.
WEBHCAT_CONF_DIR="/etc/hcatalog/conf/webhcat";

# Directory to store the WebHCat (Templeton) logs.
WEBHCAT_LOG_DIR="var/log/webhcat";

# Directory to store the WebHCat (Templeton) process ID.
WEBHCAT_PID_DIR="/var/run/webhcat";

#
# Hadoop Service - HBase
#

# Directory to store the HBase configuration files.
HBASE_CONF_DIR="/etc/hbase/conf";

# Directory to store the HBase logs.
HBASE_LOG_DIR="/var/log/hbase";

# Directory to store the HBase logs.
HBASE_PID_DIR="/var/run/hbase";

#
# Hadoop Service - ZooKeeper
#

# Directory where ZooKeeper will store data. For example, /grid1/hadoop/zookeeper/data
ZOOKEEPER_DATA_DIR="";

echo "How many directories will ZooKeeper use to store data? "
read N

LAST=0

while [ ! $LAST = $N ]
do
    if [ $LAST = 0 ]; then
	ZOOKEEPER_DATA_DIR=/grid/hadoop/zookeeper/data;
    else
	ZOOKEEPER_DATA_DIR="$ZOOKEEPER_DATA_DIR /grid$LAST/hadoop/zookeeper/data";
    fi
    LAST=$(( $LAST + 1 ))
done


# Directory to store the ZooKeeper configuration files.
ZOOKEEPER_CONF_DIR="/etc/zookeeper/conf";

# Directory to store the ZooKeeper logs.
ZOOKEEPER_LOG_DIR="/var/log/zookeeper";

# Directory to store the ZooKeeper process ID.
ZOOKEEPER_PID_DIR="/var/run/zookeeper";

#
# Hadoop Service - Pig
#

# Directory to store the Pig configuration files.
PIG_CONF_DIR="/etc/pig/conf";

# Directory to store the Pig logs.
PIG_LOG_DIR="/var/log/pig";

# Directory to store the Pig process ID.
PIG_PID_DIR="/var/run/pig";


#
# Hadoop Service - Oozie
#

# Directory to store the Oozie configuration files.
OOZIE_CONF_DIR="/etc/oozie/conf"

# Directory to store the Oozie data.
OOZIE_DATA="/var/db/oozie"

# Directory to store the Oozie logs.
OOZIE_LOG_DIR="/var/log/oozie"

# Directory to store the Oozie process ID.
OOZIE_PID_DIR="/var/run/oozie"

# Directory to store the Oozie temporary files.
OOZIE_TMP_DIR="/var/tmp/oozie"

#
# Hadoop Service - Sqoop
#
SQOOP_CONF_DIR="/etc/sqoop/conf"

export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec
