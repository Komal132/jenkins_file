#!/bin/bash

# Update system packages
sudo yum update -y
sudo yum install git -y
sudo git --version
sudo git config--global user.name="komal"
sudo git config--global user.emai="komal3323@gmail.com"
sudo mkdir git
sudo cd git
sudo git init
sudo yum install -y some-package
sudo yum install java-11 -y
sudo yum install maven -y
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
sudo tar zxvf apache-maven-3.9.8-bin.tar.g -C /opt
sudo chown -R ec2-user:ec2-user /opt
sudo chmod -R 755 /opt
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-11-openjdk -y
sudo yum install jenkins -y
#sudo systemctl daemon-reload

# Start and enable Jenkins
sudo systemctl restart jenkins
sudo systemctl enable jenkins
#sudo systemctl restart jenkins


echo "Jenkins installation completed. Access it at http://your_server_ip_or_domain:8080"