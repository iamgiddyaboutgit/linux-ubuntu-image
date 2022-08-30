# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN yes | unminimize
RUN apt get update
RUN yes | apt get upgrade
RUN apt install sudo -y
RUN apt intall vim -y
RUN apt install curl -y
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

