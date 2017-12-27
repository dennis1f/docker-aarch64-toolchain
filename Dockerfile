FROM ubuntu:16.04

LABEL Description="This is a base image, which provides the Jenkins agent executable (slave.jar)" Vendor="Jenkins project" Version="3.15"

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
      # toolchain
      bash \
      gcc-aarch64-linux-gnu \
      libc6-dev-arm64-cross \
      make \
      build-essential checkinstall \
      bc \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists* \
  && rm -rf /tmp/* /var/tmp/* \
  && rm -rf /usr/share/man/*

ENV ARCH arm64
ENV CROSS_COMPILE aarch64-linux-gnu-