#!/bin/bash
# Hayrettin Kilic - CentOS 6x Kandan Chat Build Script
# hayrettin@kilic.email
clear
echo "######################################################"
echo "Welcome to Kandan Chat Installation!"
echo "######################################################"
echo
echo "Please choose your operating system;"
echo
echo "1. CentOS 6x"
echo -n "Please choose a OS [1]?, Press C to cancel."
read choice
if [ $choice = 1 ] ; then

	echo "Please enter a user password for mysql database;"
	read mysqlpass
	wait
	echo "Requirements are being set up."
	wait
	
    #CentOS 6x Requirements
    yum -y groupinstall "Development Tools"
    wait
    yum -y install gcc gcc-c++
    wait
    yum -y install git
    wait
    yum -y install libxslt-devel libxml2-devel postgresql-devel
    wait
    yum -y install mysql-server mysql-devel
    wait
    service mysqld start
    chkconfig mysqld on
    wait
    mysql -u root -p -e 'create database db_kandan default character set utf8;'
    mysql -u root -p -e 'grant all on db_kandan.* to user_kandan@localhost identified by '$mysqlpass';'
    mysql -u root -p -e 'flush privileges;'
    wait
    yum -y install epel-release
    wait
    yum -y install libyaml libyaml-devel --enablerepo=epel
    wait
    yum -y install nodejs npm --enablerepo=epel
    wait
    
    # Open up firewall ports and redirect
    iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp -m tcp --dport 3000 -j ACCEPT
    iptables -t nat -A PREROUTING -p tcp --dport 3000 -j REDIRECT --to-port 80
    clear
    echo "Ruby installation and gem update is starting."
    wait
    # Ruby download and install
    wget https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz
    wait
    tar zxvf ruby-2.0.0-p481.tar.gz
    cd ruby-2.0.0-p481
    ./configure --disable-install-doc
    wait
    make;make install
    wait
    gem update --system --no-rdoc --no-ri
    gem install bundler --no-rdoc --no-ri
    clear
    
    
    
    
elif [ $choice = C ] then
clear
echo "Kandan Chat Installation has been canceled!"
fi

