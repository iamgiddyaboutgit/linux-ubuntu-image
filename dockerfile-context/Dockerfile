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
RUN apt-get install git -y
RUN apt-get install cmake -y
RUN apt-get install libncurses5-dev -y
RUN apt-get install zlib1g-dev -y
RUN apt-get install liblzma-dev -y
RUN apt-get install libbz2-dev -y

RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

RUN mkdir /usr/bin/my-temp-dir
WORKDIR /usr/bin/my-temp-dir

# Install samtools
RUN wget -r --no-directories --random-wait --no-parent --accept-regex='.tar.bz2' https://github.com/samtools/samtools/releases/latest
RUN find -maxdepth 1 -name 'samtools*.tar.bz2' | xargs -I file_location tar --extract --file=file_location
RUN rm *.tar.bz2

WORKDIR /usr/bin/samtools*
RUN ./configure
RUN ./make
RUN ./make install

# Clean up after samtools install
mv ./bin/* /usr/bin/
rm -r /usr/bin/my-temp-dir

USER admin
WORKDIR $HOME

RUN mkdir bin

# Get color prompt
RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'\nexport PATH="$HOME/bin:$PATH"\n' >> ./.bashrc 2>&1






