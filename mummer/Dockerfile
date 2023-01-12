# syntax=docker/dockerfile:1
FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]
RUN yes | unminimize
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install vim -y
RUN apt-get install man -y
RUN apt-get install python3 -y
RUN apt-get install wget -y
RUN apt-get install less -y
# needed for swig
RUN apt-get install libpcre2-dev -y
RUN apt-get install bison -y
RUN apt-get install byacc -y
# needed for mummer
RUN apt-get install build-essential -y
RUN apt-get install autoconf -y
RUN apt-get install libtool -y
RUN apt-get install yaggo -y
# add user
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin
WORKDIR /home/admin
RUN mkdir /home/admin/bin

# Install swig
RUN mkdir /home/admin/bin/swig
WORKDIR /home/admin/bin/swig
RUN wget https://github.com/swig/swig/archive/refs/tags/v4.1.1.tar.gz
RUN tar --extract --file=v4.1.1.tar.gz 
RUN rm *.tar.gz
WORKDIR swig-4.1.1
RUN ./autogen.sh
RUN ./configure --prefix=/home/admin/bin/swig/swig-4.1.1 
RUN make
RUN make install
RUN export PATH=$PATH:/home/admin/bin/swig/swig-4.1.1

# Install mummer
RUN mkdir /home/admin/bin/mummer
WORKDIR /home/admin/bin/mummer
RUN wget https://github.com/mummer4/mummer/archive/refs/tags/v3.9.4alpha.tar.gz
RUN tar --extract --file=v3.9.4alpha.tar.gz
RUN rm *.tar.gz
WORKDIR /home/admin/bin/mummer/mummer-3.9.4alpha
RUN autoupdate
RUN autoreconf -fi
RUN ./configure --prefix=/home/admin/bin/mummer/mummer-3.9.4alpha
RUN make
RUN make install

# Get color prompt
RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'\nexport PATH="$HOME/bin:$PATH"' >> $HOME/.bashrc 2>&1

# clean up
WORKDIR /home/admin





