#!/bin/bash

sudo apt update && sudo atp upgrade -y && \
curl -fsSL https://get.docker.com | bash && sudo usermod -aG docker ubuntu
