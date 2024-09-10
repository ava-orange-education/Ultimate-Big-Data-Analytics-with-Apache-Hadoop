# Step 1: Platform Selection

FROM ubuntu:18.04
LABEL key="simhadri-g"

# Step 2: User Configuration
RUN apt-get update && apt-get -y install sudo
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER root

# Step 3: Update APT Repositories
RUN sudo apt-get -y install software-properties-common
RUN sudo add-apt-repository ppa:openjdk-r/ppa
RUN sudo apt-get update

# Step 4: Java Installation
RUN apt-get -y install openjdk-8-jdk 
RUN ln -s /usr/lib/jvm/java-1.8.0-openjdk-amd64/ /usr/lib/jvm/java-1.8.0

# Step 5: Utility Tools
RUN apt -y install vim
RUN apt -y install nano
RUN apt -y install wget tar sudo rsync
RUN sudo apt-get update
RUN sudo apt-get -y install apache2
RUN sudo apt-get -y install tree

# Setup sock proxy
RUN apt-get install -y  openssh-server

# passwordless ssh
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 755 /root && chmod 700 /root/.ssh
RUN passwd --unlock root

# Step 6: Download hadoop-3.3.6, tez 0.10.2 and hive-4.0.0-alpha-2 and extract tar.gz

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz 
RUN tar -xvzf hadoop-3.3.1.tar.gz
RUN ln -sf /hadoop-3.3.1 /hadoop

RUN wget https://archive.apache.org/dist/tez/0.10.2/apache-tez-0.10.2-bin.tar.gz
RUN tar -xvzf apache-tez-0.10.2-bin.tar.gz
RUN ln -sf /apache-tez-0.10.2-bin /tez

RUN wget https://dlcdn.apache.org/hive/hive-4.0.0-alpha-2/apache-hive-4.0.0-alpha-2-bin.tar.gz
RUN tar -xvzf apache-hive-4.0.0-alpha-2-bin.tar.gz
RUN ln -sf /apache-hive-4.0.0-alpha-2-bin /hive

RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar
RUN apt-get -y install mysql-server mysql-client libmysql-java
     
RUN  apt-get -y clean all && rm -rf /tmp/* /var/tmp/* 

# Setup sock proxy
RUN apt-get install -y  openssh-server


RUN  apt-get -y clean all && rm -rf /tmp/* /var/tmp/* 


# Step 7: Copy configuration files and bootstrap script
RUN mkdir /conf
COPY core-site.xml /conf/core-site.xml
COPY hdfs-site.xml /conf/hdfs-site.xml
COPY hadoop-env.sh /conf/hadoop-env.sh
COPY hive-site.xml /conf/hive-site.xml
COPY bootstrap.sh /bootstrap.sh

# Step 8: Create Users

RUN sudo addgroup hadoop
RUN sudo adduser --ingroup hadoop hadoop
RUN sudo addgroup hive
RUN sudo adduser --ingroup hive hive
RUN sudo usermod -a -G hadoop hive


# HDFS ports
EXPOSE 1004 1006 8020 9866 9867 9870 9864 50470 9000 50070 9870

# YARN ports
EXPOSE 8030 8031 8032 8033 8040 8041 8042 8088 10020 19888


# SOCKS port
EXPOSE 1180


# HDFS datnode
EXPOSE 9866

# mysql expose
EXPOSE 3306
