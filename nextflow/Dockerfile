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
RUN apt-get install -y wget

# for fastqsplitter (https://github.com/LUMC/fastqsplitter)
RUN apt-get install -y python3-pip

# for falco (https://github.com/smithlabcode/falco)
RUN apt-get install -y zlib1g-dev

# For nextflow (https://www.nextflow.io/):
RUN apt-get install -y openjdk-18-jdk
RUN echo -e '\nexport JAVA_HOME=/usr/lib/jvm/java-18-openjdk-amd64' >> $HOME/.bashrc 2>&1
RUN echo -e '\nexport PATH=$PATH:$JAVA_HOME/bin' >> $HOME/.bashrc 2>&1

# for SRA Toolkit (https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit)
RUN apt-get install -y libxml-libxml-perl

# User stuff
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin
WORKDIR /home/admin
RUN mkdir /home/admin/bin

# Install nextflow in the current working directory.
WORKDIR /home/admin/bin
RUN wget -qO- https://get.nextflow.io | bash
RUN chmod +x nextflow

# Install kallisto
RUN wget https://github.com/pachterlab/kallisto/releases/download/v0.48.0/kallisto_linux-v0.48.0.tar.gz
RUN tar --extract --file=kallisto_linux-v0.48.0.tar.gz
RUN rm *tar.gz
RUN echo -e '\nexport PATH="$PATH:$HOME/bin/kallisto"' >> $HOME/.bashrc 2>&1

# Install falco
RUN wget https://github.com/smithlabcode/falco/releases/download/v1.2.1/falco-1.2.1.tar.gz
RUN tar --extract --file=falco-1.2.1.tar.gz
RUN rm *tar.gz
RUN cd /home/admin/bin/falco-1.2.1 && ./configure CXXFLAGS="-O3 -Wall" --prefix=/home/admin/bin/falco-1.2.1 && make all && make install
RUN echo -e '\nexport PATH="$PATH:$HOME/bin/falco-1.2.1"' >> $HOME/.bashrc 2>&1

# Install sra-tools
RUN mkdir /home/admin/bin/sra-tools
WORKDIR /home/admin/bin/sra-tools
RUN wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.0.0/sratoolkit.3.0.0-centos_linux64-cloud.tar.gz
RUN tar --extract --file=sratoolkit.3.0.0-centos_linux64-cloud.tar.gz
RUN rm *tar.gz
RUN echo -e '\nexport PATH="$PATH:$HOME/bin/usr/local/ncbi/sra-tools/bin"' >> $HOME/.bashrc 2>&1


# Get color prompt
RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'' >> $HOME/.bashrc 2>&1

# Environmental variables
RUN echo -e '\nexport PATH="$HOME/bin:$PATH"' >> $HOME/.bashrc 2>&1

# Polish
WORKDIR /home/admin