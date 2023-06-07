#!/bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    gnupg \
    gpg \
    lsb-release \
    nano \
    openssh-client \
    rsync \
    sudo \
    unzip \
    software-properties-common \
   
apt-get autoremove -y
apt-get clean autoclean
rm -rf /var/lib/{apt,dpkg,cache,log}