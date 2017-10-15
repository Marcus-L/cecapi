#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Creating flask virtualenv..."
virtualenv flask

echo "Installing flask into the env..."
flask/bin/pip install flask

echo "Installing the service..."
DIRNAME=`dirname "$(readlink -f "$0")" | sed -e 's/\//\\\\\//g'`
cat cecapi.service | sed -e "s/DIRNAME/$DIRNAME/g" >> /lib/systemd/system/cecapi.service
chmod 644 /lib/systemd/system/cecapi.service
chmod +x cecapi.py
systemctl daemon-reload
systemctl enable cecapi.service

echo "Starting the service..."
systemctl start cecapi.service

echo "Done!"
