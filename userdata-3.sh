#! /bin/bash
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable"
sudo apt install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker ubuntu
sudo apt install python3