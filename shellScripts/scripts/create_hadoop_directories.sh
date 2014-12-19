#!/bin/bash

#Status: Testing

source ./usersAndGroups.sh
source ./directories.sh

echo "Create the NameNode Directories"
sudo mkdir -p $DFS_NAME_DIR;
sudo chown -R $HDFS_USER:$HADOOP_GROUP $DFS_NAME_DIR;
sudo chmod -R 755 $DFS_NAME_DIR;

echo "Create the SecondaryNameNode Directories"
sudo mkdir -p $FS_CHECKPOINT_DIR;
sudo chown -R $HDFS_USER:$HADOOP_GROUP $FS_CHECKPOINT_DIR;
sudo chmod -R 755 $FS_CHECKPOINT_DIR;

echo "Create datanode local dir"
sudo mkdir -p $DFS_DATA_DIR;
sudo chown -R $HDFS_USER:$HADOOP_GROUP $DFS_DATA_DIR;
sudo chmod -R 750 $DFS_DATA_DIR;

echo "Create yarn local dir"
sudo mkdir -p $YARN_LOCAL_DIR;
sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_DIR;
sudo chmod -R 755 $YARN_LOCAL_DIR;

echo "Create yarn local log dir"
sudo mkdir -p $YARN_LOCAL_LOG_DIR;
sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_LOG_DIR;
sudo chmod -R 755 $YARN_LOCAL_LOG_DIR;

echo "Create the log and PID Directories"
sudo mkdir -p $HDFS_LOG_DIR;
sudo chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_LOG_DIR;
sudo chmod -R 755 $HDFS_LOG_DIR;
sudo mkdir -p $YARN_LOG_DIR;
sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOG_DIR;
sudo chmod -R 755 $YARN_LOG_DIR;
sudo mkdir -p $HDFS_PID_DIR;
sudo chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_PID_DIR;
sudo chmod -R 755 $HDFS_PID_DIR
sudo mkdir -p $YARN_PID_DIR;
sudo chown -R $YARN_USER:$HADOOP_GROUP $YARN_PID_DIR;
sudo chmod -R 755 $YARN_PID_DIR;
sudo mkdir -p $MAPRED_LOG_DIR;
sudo chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_LOG_DIR;
sudo chmod -R 755 $MAPRED_LOG_DIR;
sudo mkdir -p $MAPRED_PID_DIR;
sudo chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_PID_DIR;
sudo chmod -R 755 $MAPRED_PID_DIR;

