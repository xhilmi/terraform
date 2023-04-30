#!/bin/bash
# Install Amazon Web Services SDK on master-vm linux ubuntu
cd
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install zip unzip -y
unzip awscliv2.zip
sudo ./aws/install
aws --version
