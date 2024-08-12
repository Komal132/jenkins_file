#!/bin/bash
sudo yum update -y
sudo yum install java-11 -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz
sudo tar xvzf apache-tomcat-9.0.91.tar.gz -C /opt
sudo cd /opt
sudo mv apache-tomcat-9.0.91 tomcat
sudo chown -R ec2-user:ec2-user /opt
sudo chmod -R 755 /opt
sudo cd /opt/tomcat/bin
sudo sh startup.sh