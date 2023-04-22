#!/bin/bash
# Install Google Cloud SDK on master-vm linux ubuntu

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list;
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -;
sudo apt update && sudo apt install google-cloud-sdk -y;
gcloud version
