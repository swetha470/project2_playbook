#!/bin/bash

clear

if [ $(id -u) -ne "0" ]; then
    echo " login as root!"
    exit 1
fi

if [ -e *.tar.gz ]; then
    echo "File exists, removing file"
    rm -rf apache*
    exit 1
else
    echo "Downloading Apache Tomcat"
    wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.81/bin/apache-tomcat-8.5.81.tar.gz --no-check-certificate
fi
echo ""
echo "Staring Extraction of Tar file"
tar -xvf apache* -C /opt

echo "Renaming Dir to tomcat"

if [ -d /opt/apache* ]; then
    echo "Dir found"
    mv /opt/apache* /opt/tomcat
else
    echo "no dir"
fi

echo "Creating Softlinks for startup and shutdown"

if [ -e /usr/bin/tomcat* ]; then
    echo "softlinks found"
    rm -rf /usr/bin/tomcat*
fi

ln -s /opt/tomcat/bin/startup.sh /usr/bin/tomcatup
ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/tomcatdown

echo "installing packages"

yum install -y net-tools htop


    

