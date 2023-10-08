#!/bin/bash

sudo apt update && sudo apt upgrade -y && \
curl -fsSL https://get.docker.com | bash && sudo usermod -aG docker ubuntu

docker run --name app -dp 80:8080 jonatasflima/aws-autoscaling:1.0
