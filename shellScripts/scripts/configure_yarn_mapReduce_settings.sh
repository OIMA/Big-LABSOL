#!bin/bash

#Status: Development

echo "How many cores the server have? "
read CORES

echo "How many memory the server have? "
read MEMORY

echo "How many disks the server have? "
read DISK

python hdp-configuration-utils.py -c $CORES -m $MEMORY -d $DISK -k True > recommended_configuration
