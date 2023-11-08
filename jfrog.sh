#!/bin/bash
sudo hostnamectl set-hostname "jfrog.cloudbinary.io"
echo "`hostname -I | awk '{ print $1 }'` `hostname`" >> /etc/hosts
sudo apt-get update.  ---> Ubuntu Linux Distributions
sudo apt-get install vim curl elinks unzip wget tree git -y ---> Ubuntu Linux Distributions
sudo apt-get install openjdk-17-jdk -y ---> Ubuntu Linux Distributions
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/" >> /etc/environment 
source /etc/environment
echo $JAVA_HOME
cd /opt
sudo wget  https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/[RELEASE]/jfrog-artifactory-oss-[RELEASE]-linux.tar.gz  
tar xvzf jfrog-artifactory-oss-\[RELEASE\]-linux.tar.gz 
rm -f jfrog-artifactory-oss-\[RELEASE\]-linux.tar.gz
ls -lrt
mv artifactory-oss-*/ jfrog
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "JFROG_HOME=/opt/jfrog" >> /etc/environment
source /etc/environment
echo $JFROG_HOME

cd
sudo systemctl status artifactory.service
sudo systemctl enable artifactory.service
sudo systemctl status artifactory.service
sudo systemctl start artifactory.service
sudo systemctl status artifactory.service