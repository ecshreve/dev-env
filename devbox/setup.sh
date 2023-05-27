#!/bin/sh

set -e

DEBIAN_FRONTEND=noninteractive

apt-add-repository ppa:fish-shell/release-3
apt-get update 
apt-get install -y fish

apt-get autoremove -y 
apt-get clean autoclean 
rm -rf /var/lib/{apt,dpkg,cache,log} 