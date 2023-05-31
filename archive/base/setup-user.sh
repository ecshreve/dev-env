#!/usr/bin/env sh

set -e

useradd -m eric -s /bin/bash
echo "eric:changeme" | chpasswd

groupadd docker
usermod -aG docker eric
echo "eric ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

mkdir -p /workspaces && \
chown -R eric:eric /workspaces

mkdir -p /home/eric/.bashrc.d
# shellcheck disable=SC2016
printf 'if [ -d $HOME/.bashrc.d/ ]; then
  for rc in $HOME/.bashrc.d/*rc.sh; do
    source $rc
  done
fi
' >> /home/eric/.bashrc

mkdir -p /home/eric/.local/bin
# shellcheck disable=SC2016
echo 'export PATH=$HOME/.local/bin:$PATH' > /home/eric/.bashrc.d/localbinrc.sh

chown -R eric:eric /home/eric

