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

# for pipeline
# Install java development kit
RUN apt-get install -y openjdk-8-jdk
RUN echo -e '\nexport JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> $HOME/.bashrc 2>&1
RUN echo -e '\nexport PATH=$PATH:$JAVA_HOME/bin' >> $HOME/.bashrc 2>&1

# for samtools
RUN apt-get install -y wget
RUN apt-get install -y bzip2
RUN apt-get install -y cmake
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y liblzma-dev 
RUN apt-get install -y libbz2-dev 
RUN apt-get install -y libssl-dev
RUN apt-get install -y libcurl4-openssl-dev 

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

# Install BCFtools
RUN mkdir /usr/local/bin/my-temp-dir
WORKDIR /usr/local/bin/my-temp-dir
RUN wget -r --no-directories --random-wait --no-parent --accept-regex='.tar.bz2' https://github.com/samtools/bcftools/releases/latest
RUN find -maxdepth 1 -name 'bcftools*.tar.bz2' | xargs -I file_location tar --extract --file=file_location
RUN rm *.tar.bz2

RUN /usr/local/bin/my-temp-dir/bcftools*/configure --prefix=/usr/local/bin/
RUN cd /usr/local/bin/my-temp-dir/bcftools* && make
RUN cd /usr/local/bin/my-temp-dir/bcftools* && make install

WORKDIR /
RUN rm -r /usr/local/bin/my-temp-dir

# Install bwakit-0.7.15 (Burrows-Wheeler Aligner)
RUN mkdir /usr/local/bin/my-temp-dir
WORKDIR /usr/local/bin/my-temp-dir
RUN wget --random-wait -O download https://sourceforge.net/projects/bio-bwa/files/bwakit/bwakit-0.7.15_x64-linux.tar.bz2/download
RUN tar --extract --file=/usr/local/bin/my-temp-dir/download --directory=/usr/local/bin
WORKDIR /
RUN rm -r /usr/local/bin/my-temp-dir

# User stuff
RUN useradd --no-log-init --create-home --shell /bin/bash --gid sudo admin
RUN echo 'admin:password' | chpasswd

USER admin
WORKDIR /home/admin
RUN mkdir /home/admin/bin

# Install Genome Analysis Toolkit (GATK)
RUN mkdir /home/admin/bin/my-temp-dir
WORKDIR /home/admin/bin/my-temp-dir
RUN wget --random-wait -O gatk.tar.bz2 https://storage.googleapis.com/gatk-software/package-archive/gatk/GenomeAnalysisTK-3.7-0-gcfedb67.tar.bz2
RUN mkdir /home/admin/bin/gatk && tar --extract --file=/home/admin/bin/my-temp-dir/gatk.tar.bz2 --directory=/home/admin/bin/gatk
RUN rm -r /home/admin/bin/my-temp-dir

# Go back to right directory
WORKDIR /home/admin

# Get color prompt
RUN echo -e '\n# I added this.  I hope it works! :)\nexport PS1='"'"'${debian_chroot:+($debian_chroot)}\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '"'"'' >> $HOME/.bashrc 2>&1

# Environmental variables
RUN echo -e '\nexport PATH=$PATH:/usr/local/bin/bwa.kit' >> $HOME/.bashrc 2>&1
RUN echo -e '\nexport PATH=$PATH:/usr/local/bin/gatk' >> $HOME/.bashrc 2>&1
RUN echo -e '\nexport PATH="$HOME/bin:$PATH"' >> $HOME/.bashrc 2>&1

