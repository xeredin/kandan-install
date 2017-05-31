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
echo -n "Please choose a OS [1]? "
read choice
if [ $choice = 1 ]

    #CentOS 6x Requirement installations
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
    
    
    
elif [ $choice = C ]
		clear
		then echo "Kandan Chat Installation has been canceled!"
fi

