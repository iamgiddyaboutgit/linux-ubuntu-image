# syntax=docker/dockerfile:1
FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]
RUN yes | unminimize
RUN apt-get update
RUN apt-get upgrade -y 

# for general stuff
RUN apt-get install -y sudo
RUN apt-get install -y vim 
RUN apt-get install -y man
RUN apt-get install -y less

# For nextflow (https://www.nextflow.io/):
RUN apt-get install -y openjdk-18-jdk
RUN echo -e '\nexport JAVA_HOME=/usr/lib/jvm/java-18-openjdk-amd64' >> $HOME/.bashrc 2>&1
RUN echo -e '\nexport PATH=$PATH:$JAVA_HOME/bin' >> $HOME/.bashrc 2>&1

RUN apt-get install -y wget

WORKDIR /usr/local/bin
# Install nextflow in the current working directory.
RUN wget -qO- https://get.nextflow.io | bash

# User stuff
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin
WORKDIR /home/admin
RUN mkdir /home/admin/bin
RUN chmod +x /usr/local/bin/nextflow

# Get color prompt
RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'' >> $HOME/.bashrc 2>&1

# Environmental variables
RUN echo -e '\nexport PATH="$HOME/bin:$PATH"' >> $HOME/.bashrc 2>&1