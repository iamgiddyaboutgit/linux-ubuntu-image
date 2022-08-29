# syntax=docker/dockerfile:1
FROM ubuntu:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN yes | unminimize
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd
USER admin
WORKDIR /home/admin
