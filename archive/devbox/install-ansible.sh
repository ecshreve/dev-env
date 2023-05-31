#!/bin/sh

set -e

DEBIAN_FRONTEND=noninteractive

apt-get update 
apt-get install -y python3 python3-pip python3-dev
python3 -m pip install --upgrade pip
python3 -m pip install ansible ansible-lint

apt-get autoremove -y 
apt-get clean autoclean 
rm -rf /var/lib/{apt,dpkg,cache,log} 