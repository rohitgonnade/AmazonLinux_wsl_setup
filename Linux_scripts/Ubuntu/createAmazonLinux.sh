#!/bin/bash

installDocker(){
    sudo apt-get update

    #set-up docker
    #Install prerequisite packages
    sudo apt install ca-certificates curl gnupg lsb-release -y

    #Add official GPG key for Docker repository.
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    #Setup repository
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt upgrade -y

    #Install latest version of Docker Engine, Docker CLI, Containerd and Docker Compose
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
}

createAmazonLinuxImage(){
    sudo docker build -t amazonlinux:2023 .
    sudo docker run --name amazonLinux2023 amazonlinux:2023
    containerID=$(sudo docker ps -aqf "name=amazonLinux2023")
    echo $containerID
    sudo docker export $containerID > al2023.tar
    exit
}

installDocker
createAmazonLinuxImage
