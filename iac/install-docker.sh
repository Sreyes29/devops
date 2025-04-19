#!/bin/bash
# Install Docker
curl -fsSL https://get.docker.com | bash

# Add user to Docker group
usermod -aG docker azureuser

# Install Docker Compose plugin
apt-get update
apt-get install -y docker-compose-plugin
