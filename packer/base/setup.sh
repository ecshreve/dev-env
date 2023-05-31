#!/bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive

# Set the locale
apt-get install -y locales

sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

>> /etc/environment cat <<EOF
LANG="en_US.UTF-8"
LANGUAGE="en_US:en"
LC_ALL="en_US.UTF-8"
EOF

