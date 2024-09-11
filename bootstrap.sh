#!/bin/bash

sudo apt-get update

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
sudo apt install unzip -y
unzip /tmp/awscliv2.zip -d /tmp/
sudo /tmp/aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

sudo apt install software-properties-common
sudo add-apt-repository ppa:dns-oarc/dnsperf -y
sudo apt install dnsperf -y
sudo apt-get install dnsutils -y
sudo apt-get install traceroute -y
sudo snap install dnslookup

sudo apt install mysql-client-core-8.0 -y
