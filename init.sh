#!/bin/bash

# Update package list and upgrade installed packages
sudo apt update
sudo apt upgrade -y

# Install essential packages
sudo apt install -y curl wget git unzip software-properties-common apt-transport-https ca-certificates gnupg-agent

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo apt  install docker-compose
sudo systemctl enable docker
sudo systemctl start docker

# Install Go
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt update
sudo apt install -y golang-go

# Install Neovim
sudo apt install -y neovim

# Install Oh My Zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install CMake
sudo apt install -y cmake

# Install GCC
sudo apt install -y gcc

# Install Clang
sudo apt install -y clang

# Install GitHub CLI
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install -y gh

# Install compression tools
sudo apt install -y gzip tar zip

# Install MariaDB
sudo apt install -y mariadb-server

# Install MongoDB Shell
sudo apt install -y mongosh-bin

# Install Python
sudo apt install -y python3 python3-pip

# Install k8s
snap install kubectl --classic
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

# Install helm 
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

sudo apt install snapd

# Additional tools or packages can be installed here as needed

# Nodejs
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_21.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install nodejs -y

# Clean up
sudo apt autoremove -y
sudo apt autoclean

git clone https://github.com/isofinly/SelectelHack

git fetch
git pull

cd ~/SelectelHack/config/k8s
chmod +x start.sh
./start.sh

cd ~/SelectelHack
docker-compose up --build
