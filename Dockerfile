FROM ubuntu:18.04

# To fix a Python-related issue
ENV LANG C.UTF-8

# Grab all the things
RUN set -ex && \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential apt-utils && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget bash && \
    apt-get install -y python3 python3-pip \ 
    && wget http://apt.llvm.org/llvm-snapshot.gpg.key \                                                                
    && apt-key add llvm-snapshot.gpg.key \ 
    && add-apt-repository 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main' \
    && apt-get update \
    && rm -rf llvm-snapshot.gpg.key \
	apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; \
    pip3 --version 

# Now, grab the build system and compiler
RUN pip3 install --trusted-host pypi.python.org scons && \
    apt-get install -y clang-8 lldb-8 lld-8 clang-tools-8 libc++-8-dev libc++abi-8-dev llvm-8-dev llvm-8 gdb
EXPOSE 80

ENV CXX clang++
ENV CC clang 

# Everything is up! Nuke the stuff

RUN apt-get clean \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*]
