# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN yes | unminimize
RUN apt-get update
RUN yes | apt-get upgrade
RUN apt-get install sudo -y
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN apt-get install man -y
RUN apt-get install python3 -y
RUN apt-get install wget -y
RUN apt-get install less -y
RUN apt-get install finger -y

RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin
WORKDIR /home/admin
