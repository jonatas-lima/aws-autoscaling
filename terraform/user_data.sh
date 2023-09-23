#!/bin/bash

sudo apt update && sudo apt upgrade -y && \
curl -fsSL https://get.docker.com | bash && sudo usermod -aG docker ubuntu

sudo apt install -y nginx

docker run --name app -dp 80:8080 hiarlyfs/arquitetura-software