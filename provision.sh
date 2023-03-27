#!/bin/bash
sudo dnf install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo "Installing and setting up Docker"
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin > /dev/null 2>&1
sudo systemctl enable docker
sudo systemctl start docker

echo "Installing and setting up Git"
sudo dnf install -y git > /dev/null 2>&1

echo "Moving Dockerfile and docker-compose.yaml from host machine to guest machine [/opt/agenda/]"
sudo mkdir /opt/agenda/ 
sudo cp /tmp/Dockerfile /tmp/docker-compose.yaml /tmp/agenda.sql /opt/agenda/
