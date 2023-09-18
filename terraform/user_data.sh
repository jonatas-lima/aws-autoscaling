#!/bin/bash

sudo apt update && sudo apt upgrade -y && \
curl -fsSL https://get.docker.com | bash && sudo usermod -aG docker ubuntu

sudo docker run --name api -dp 80:3000 jonatasflima/aws-autoscaling-api
