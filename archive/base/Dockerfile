ARG UBUNTU_VERSION=22.04

FROM ubuntu:${UBUNTU_VERSION}

COPY install-build-tools.sh /tmp/
RUN /tmp/install-build-tools.sh

COPY install-dev-tools.sh /tmp/
RUN /tmp/install-dev-tools.sh

COPY configure-system.sh /tmp/
RUN /tmp/configure-system.sh

COPY setup-user.sh /tmp/
RUN /tmp/setup-user.sh