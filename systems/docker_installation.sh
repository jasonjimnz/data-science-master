#!/bin/bash
echo "Tested on Debian 9 (It should work in Ubuntu)"
sleep 3
echo "Updating S.O repos"
sudo apt-get update

echo "Installing dependencies"
sudo apt-get install apt-transport-https ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

echo "Adding repo key"
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

echo "Adding repo to the apt-get"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

echo "Installing docker"
sudo apt-get update && sudo apt-get install docker-ce

echo "Testing docker"
sudo docker run hello-world

echo "If it worked, calling ubuntu docker"
sleep 5
sudo docker run -it ubuntu apt-get moo
echo "If it worked, enter to the ubuntu docker"
# -it command run something in the container 
# sudo docker run -it <image> <process>
sudo docker run -it ubuntu bash
echo "It worked docker successfully installed"