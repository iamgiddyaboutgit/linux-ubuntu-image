# syntax=docker/dockerfile:1
FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]
RUN yes | unminimize
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install vim -y
RUN apt-get install libcurl4-openssl-dev -y
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
RUN apt-get install libssl-dev -y

RUN apt-get install libaio1 libaio-dev -y # for MySQL?

RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

RUN mkdir /usr/local/bin/my-temp-dir
WORKDIR /usr/local/bin/my-temp-dir

# Install samtools
RUN wget -r --no-directories --random-wait --no-parent --accept-regex='.tar.bz2' https://github.com/samtools/samtools/releases/latest
RUN find -maxdepth 1 -name 'samtools*.tar.bz2' | xargs -I file_location tar --extract --file=file_location
RUN rm *.tar.bz2

RUN /usr/local/bin/my-temp-dir/samtools*/configure --prefix=/usr/local/bin/
RUN cd /usr/local/bin/my-temp-dir/samtools* && make
RUN cd /usr/local/bin/my-temp-dir/samtools* && make install

# Clean-up samtools
WORKDIR /
RUN rm -r /usr/local/bin/my-temp-dir

# Try to install MySQL
# https://dev.mysql.com/doc/refman/8.0/en/installing-source-distribution.html
RUN mkdir /usr/local/bin/my-temp-dir
WORKDIR /usr/local/bin/my-temp-dir
RUN git clone https://github.com/mysql/mysql-server.git
RUN apt-get -y install rpm
RUN sudo groupadd mysql
useradd --no-log-init -r -g mysql -s /bin/false mysql

USER admin
WORKDIR /home/admin
RUN mkdir /home/admin/bin

# Get color prompt
RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'\nexport PATH="$HOME/bin:$PATH"\nexport MACHTYPE='x86_64'' >> $HOME/.bashrc 2>&1






