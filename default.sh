#!/bin/bash
set -e

echo "Updating..."
apt update && apt upgrade -y

echo "Guest-agent..."
apt install -y curl wget git htop nano qemu-guest-agent

echo "Docker..."
curl -fsSL https://get.docker.com | sh

echo "Docker Compose..."
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
     -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Done"
