#!/bin/bash

echo "Atualizando lista de pacotes..."

sudo apt-get update

echo "Instalando curl..."
sudo apt install curl

echo "Instalando NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "deu bom "
if(nvm --version) then
	echo "NVM instalado com sucesso!";
fi

echo "Instalando node.js na versão 14..."
nvm install 14

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  
sudo apt-get update

echo "INSTALANDO DOCKER ENGINE..."
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "INCIANDO DOCKER SERVICE"
systemctl start docker

echo "Adicionando usuário ao grupo docker"
sudo usermod -aG docker $USER

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

if(docker-compose --version) then
	echo " \033[1;32m SETUP NODE.JS, DOCKER e DOCKER-COMPOSE INSTALADO!  \033[0m"
fi



