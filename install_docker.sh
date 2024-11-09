#!/usr/bin/env bash

function logStep() {
  echo -e "\n\e[1;32m$1\e[0m"
}

logStep "Atualizacao do sistema"
sudo apt-get update

logStep "Instalacao de dependencias"
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

logStep "Instalando docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

logStep "Adicionando usuario $USER ao grupo docker. Requer reinicializacao"
sudo usermod -aG docker $USER
