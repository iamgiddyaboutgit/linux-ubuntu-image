# syntax=docker/dockerfile:1
FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]
RUN yes | unminimize
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
WORKDIR /home/admin
RUN mkdir $HOME/bin

RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'\nexport PATH="$HOME/bin:$PATH"\n' >> ./.bashrc 2>&1






