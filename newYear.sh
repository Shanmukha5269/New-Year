#!/bin/bash

# this script is to execute the cloned New Year repo
set -e 

echo "Installing node...."

sudo apt install npm
npm install 

echo "Installing docker....."

sudo apt-get install docker.io nginx -y

echo "Restarting docker..."

sudo systemctl enable docker
sudo systemctl enable nginx

echo "Building image....."

sudo docker build -t new-image .

echo "Running container...."

sudo docker run --name new-container -p 2020:80 new-image

echo "END"
