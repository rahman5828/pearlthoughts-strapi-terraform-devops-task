#!/bin/bash
set -xe

# Update packages
apt-get update -y

# Install basic tools
apt-get install -y ca-certificates curl gnupg lsb-release git

# Install Docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

usermod -aG docker ubuntu

# Install docker-compose (classic binary)
/usr/bin/curl -L "https://github.com/docker/compose/releases/download/2.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Clone your GitHub repo
cd /opt
git clone https://github.com/YOUR_GITHUB_USERNAME/pearlthoughts-strapi-terraform-devops-task.git
cd pearlthoughts-strapi-terraform-devops-task/docker

# Use example env as actual env
cp .env.example .env

# Start Strapi + Postgres
/usr/local/bin/docker-compose up -d
