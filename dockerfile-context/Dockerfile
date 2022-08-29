# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN yes | unminimize
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd
USER admin
WORKDIR /home/admin
