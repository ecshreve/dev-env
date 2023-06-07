ARG UBUNTU_VERSION=22.04

FROM ubuntu:${UBUNTU_VERSION}

COPY install-base-packages.sh /tmp/
RUN /tmp/install-base-packages.sh

COPY configure-system.sh /tmp/
RUN /tmp/configure-system.sh

COPY install-hashi-tools.sh /tmp/
RUN /tmp/install-hashi-tools.sh

COPY install-docker.sh /tmp/
RUN /tmp/install-docker.sh

COPY install-ansible.sh /tmp/
RUN /tmp/install-ansible.sh

COPY setup.yml /tmp/
RUN ansible-playbook /tmp/setup.yml

COPY dotfile-setup.yml /tmp/
RUN ansible-playbook /tmp/dotfile-setup.yml

USER eric

COPY setup-dotfiles.sh /tmp/
RUN /tmp/setup-dotfiles.sh
