#! /bin/bash
sudo apt-get update
sudo apt install gnome-terminal  # For non-Gnome Desktop environments
sudo apt remove docker-desktop   # Remove previous Docker versions (if installed)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
sudo apt-get install docker-compose-plugin
sudo apt-get install git
docker-compose up -d

EOF
