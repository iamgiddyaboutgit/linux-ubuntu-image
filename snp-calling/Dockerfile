# syntax=docker/dockerfile:1
FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]
RUN yes | unminimize
RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y sudo
RUN apt-get install -y vim 
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y wget
RUN apt-get install -y bzip2
RUN apt-get install cmake -y

# Install samtools
RUN mkdir /usr/local/bin/my-temp-dir
WORKDIR /usr/local/bin/my-temp-dir
RUN wget -r --no-directories --random-wait --no-parent --accept-regex='.tar.bz2' https://github.com/samtools/samtools/releases/latest
RUN find -maxdepth 1 -name 'samtools*.tar.bz2' | xargs -I file_location tar --extract --file=file_location
RUN rm *.tar.bz2

RUN /usr/local/bin/my-temp-dir/samtools*/configure --prefix=/usr/local/bin/
RUN cd /usr/local/bin/my-temp-dir/samtools* && make
RUN cd /usr/local/bin/my-temp-dir/samtools* && make install

# Clean-up samtools
WORKDIR /
RUN rm -r /usr/local/bin/my-temp-dir

# User stuff
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin
WORKDIR /home/admin
RUN mkdir /home/admin/bin

# Get color prompt
RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'' >> $HOME/.bashrc 2>&1

# Export environmental variables
RUN echo -e '\nexport PATH="$HOME/bin:$PATH"' >> $HOME/.bashrc 2>&1
RUN echo -e '\nexport JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> $HOME/.bashrc 2>&1
RUN echo -e '\nexport PATH=$PATH:$JAVA_HOME/bin' >> $HOME/.bashrc 2>&1
