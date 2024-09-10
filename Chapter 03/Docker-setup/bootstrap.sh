#!/bin/bash

eg='\033[0;32m'
enc='\033[0m'
echoe () {
	OIFS=${IFS}
	IFS='%'
	echo -e $@
	IFS=${OIFS}
}

gprn() {
	echoe "${eg} >> ${1}${enc}"
}


## Setup ENV variables

export JAVA_HOME="/usr/lib/jvm/java-1.8.0"

export HDFS_NAMENODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"

export HADOOP_HOME="/hadoop"
export HADOOP_ROOT_LOGGER=DEBUG
export HADOOP_COMMON_LIB_NATIVE_DIR="/hadoop/lib/native"
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH


## Add it to bashrc for starting hadoop
echo 'export JAVA_HOME="/usr/lib/jvm/java-1.8.0"' >> ~/.bashrc
echo 'export HADOOP_HOME="/hadoop"' >> ~/.bashrc
echo 'export HADOOP_CLASSPATH="$HADOOP_CLASSPATH"' >> ~/.bashrc


rm /hadoop
ln -sf /hadoop-3.3.6 /hadoop

# Copy the config files
cp /conf/core-site.xml /hadoop/etc/hadoop
cp /conf/hdfs-site.xml /hadoop/etc/hadoop
cp /conf/hadoop-env.sh /hadoop/etc/hadoop


service ssh start

gprn "start yarn"
hadoop/sbin/start-yarn.sh &
sleep 5

gprn "Formatting name node"
hadoop/bin/hdfs namenode -format

gprn "Start hdfs"
hadoop/sbin/start-dfs.sh

jps

sleep 20000