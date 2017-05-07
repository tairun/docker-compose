#!/bin/bash

# Install 'pwgen' if missing
sudo apt install -y pwgen

# Generate secret keys for gitlab instance
sed "s/long-and-random-alphanumeric-string/$(pwgen -Bsv1 64)/g" docker-compose.template.yml > docker-compose.yml

# Manage permission for secret file
sudo chmod 660 docker-compose.yml