#!/usr/bin/env sh

set -e

groupadd docker

useradd -m dev -s /bin/bash
echo "dev:changeme" | chpasswd
usermod -aG docker dev
echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

mkdir -p /workspace && \
chown -R dev:dev /workspace

mkdir -p /home/dev/.bashrc.d
# shellcheck disable=SC2016
printf 'if [ -d $HOME/.bashrc.d/ ]; then
  for rc in $HOME/.bashrc.d/*rc.sh; do
    source $rc
  done
fi
' >> /home/dev/.bashrc

mkdir -p /home/dev/.local/bin
# shellcheck disable=SC2016
echo 'export PATH=$HOME/.local/bin:$PATH' > /home/dev/.bashrc.d/localbinrc.sh

chown -R dev:dev /home/dev