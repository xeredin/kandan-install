#!/bin/bash
# Hayrettin Kilic CentOS 6x Kandan Chat Build Script
# hayrettin@kilic.email

clear
echo "######################################################"
echo "Welcome to Kandan Chat Installation!"
echo
echo "Please select your operating system;"
echo "######################################################"
echo
#Requirement installations
yum -y groupinstall "Development Tools"

yum -y install gcc gcc-c++

yum -y install git

yum -y install libxslt-devel libxml2-devel postgresql-devel

yum -y install mysql-server mysql-devel
