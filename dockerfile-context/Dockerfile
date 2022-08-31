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
RUN /bin/bash -c 'export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"'

RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin
WORKDIR /home/admin
