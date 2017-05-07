#!bin/bash

sed "s/long-and-random-alphanumeric-string/$(pwgen -Bsv1 64)/g" docker-compose.yml