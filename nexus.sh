#!/bin/bash
sudo yum install java-11 -y
sudo wget https://download.sonatype.com/nexus/3/nexus-3.70.1-02-java11-unix.tar.gz
sudo tar xvzf  nexus-3.70.1-02-java11-unix.tar.gz -C /opt
sudo mv /opt/nexus-3.70.1-02 nexus
sudo cd /opt
sudo chown -R ec2-user:ec2-user /opt
sudo chmod -R 755 /opt