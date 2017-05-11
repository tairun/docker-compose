#!/bin/bash

## Install 'pwgen' if missing
#sudo apt install -y pwgen

PACKAGE="pwgen"

if [ $(dpkg-query -W -f='${Status}' $PACKAGE 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt install -y $PACKAGE;
fi

## Generate secret keys for gitlab instance
#sed "s/long-and-random-alphanumeric-string/$(pwgen -Bsv1 64)/" docker-compose.template.yml > docker-compose.yml

SEARCHSTRING="long-and-random-alphanumeric-string"
TEMPLATEFILE="docker-compose.template.yml"
OUTFILE="docker-compose.yml"

cp -i $TEMPLATEFILE $OUTFILE

#for i in $(grep $OLDSTRING $(echo $OUTFILE | sed "s/\./\\\\./g")); do
for i in $(grep -e $SEARCHSTRING $OUTFILE); do
  KEY=$(pwgen -Bsv1 64)
  echo $KEY "/" $i
  sed -i "s/${OLDSTRING}/$KEY/" $OUTFILE;
done

# Manage permission for secret file
sudo chmod 660 $OUTFILE