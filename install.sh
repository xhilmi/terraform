#!/bin/bash
# install terraform on master-vm linux ubuntu

sudo apt update;
sudo apt install  software-properties-common gnupg2 curl -y;
curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg;
sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/;
sudo apt-add-repository -y "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main";
sudo apt install terraform -y;
terraform --version
