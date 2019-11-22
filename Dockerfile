FROM ubuntu:18.04

LABEL Description="Docker image for simulations that needs Network Simulator (NS-3)+ SUMO (Vehicular Mobility Simulator)+EVALVID(converts video in trace file)"

MAINTAINER Laura Ribeiro <laura.michaella@gmail.com>


RUN \
    apt update && \
    apt install -y \
	gnupg \
	git \
	mercurial \
  	wget \
  	vim \
  	autoconf \
  	bzr \
  	cvs \
  	unrar \
  	build-essential \
  	clang \
  	valgrind \
  	gsl-bin \
  	libgsl23 \
  	libgsl-dev \
  	flex \
  	bison \
  	libfl-dev \
  	tcpdump \
  	sqlite \
  	sqlite3 \
  	libsqlite3-dev \
  	libxml2 \
  	libxml2-dev \
  	vtun \
  	lxc \
	  curl \
    fglrx \
    fglrx-updates \
    nvidia-173 \
    nvidia-304-updates \
    nvidia-304 \
    nvidia-331-updates \
	&& rm -rf /var/lib/apt/lists/

RUN \
    apt update && \
    apt install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2486D2DD83DB69272AFE98867170598AF249743


# QT4 components
RUN apt-get install -y \
  qtbase5-dev

# Python components
RUN apt-get install -y \
  python \
  python-dev \
  python-setuptools \
  cmake \
  libc6-dev \
  libc6-dev-i386 \
  g++-multilib \
  python-pip \
  python3-pip

# SUMO components
RUN apt-get install -y \
  sumo \
  sumo-tools \
  sumo-doc \
  pkg-config \
  m4 \
  ncurses-dev \
  zlib1g-dev \
  bsdmainutils \
  automake \
  unzip 

# Cloning & installing NS3-all-in-one
RUN hg clone http://code.nsnam.org/ns-3-allinone
RUN cd ns-3-allinone && python download.py -n ns-3.29 && python build.py --enable-examples --enable-tests
RUN cd ns-3-allinone/ns-3.29 && python test.py

ARG SUMO_SOURCE=/usr/share/sumo
ENV SUMO=${SUMO_SOURCE} 

WORKDIR /home/PerformanceEvaluation
