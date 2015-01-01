#!/bin/bash

#Status: Testing

if [ ! hash hadoop 2>/dev/null ]; then
    
    sudo yum install hadoop

fi

if [ ! hash hadoop-hdfs 2>/dev/null ]; then

    sudo yum install hadoop-hdfs
    
fi

if [ ! hash hadoop-libhdfs 2>/dev/null ]; then

    sudo yum install hadoop-libhdfs

fi

if [ ! hash hadoop-yarn 2>/dev/null ]; then

    sudo yum install hadoop-yarn

fi

if [ ! hash hadoop-mapreduce 2>/dev/null ]; then

    sudo yum install hadoop-mapreduce

fi

if [ ! hash hadoop-client 2>/dev/null ]; then

    sudo yum install hadoop-client

fi

if [ ! hash openssl 2>/dev/null ]; then

    sudo yum install openssl

fi
