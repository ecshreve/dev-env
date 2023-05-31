FROM registry.slab.lan:5000/devenv:base

COPY install-hashi-tools.sh /tmp/
RUN /tmp/install-hashi-tools.sh

COPY install-ansible.sh /tmp/
RUN /tmp/install-ansible.sh

USER eric

COPY setup.yml /tmp/
RUN ansible-playbook /tmp/setup.yml

COPY setup.sh /tmp/
RUN /tmp/setup.sh