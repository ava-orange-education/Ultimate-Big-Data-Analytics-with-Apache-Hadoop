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
RUN ln -s /usr/lib/jvm/java-1.8.0-openjdk/ /usr/lib/jvm/java-1.8.0

# Step 5: Utility Tools
RUN apt -y install vim
RUN apt -y install nano
RUN apt -y install wget tar sudo rsync
RUN sudo apt-get update
RUN sudo apt-get -y install apache2
RUN sudo apt-get -y install tree

