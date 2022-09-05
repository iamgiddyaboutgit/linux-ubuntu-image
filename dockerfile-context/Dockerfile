# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN unminimize -y
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN apt-get install man -y
RUN apt-get install python3 -y
RUN apt-get install wget -y
RUN apt-get install less -y
RUN apt-get install finger -y
RUN apt-get install build-essential -y

RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin

RUN mkdir $HOME/bin

WORKDIR /home/admin
