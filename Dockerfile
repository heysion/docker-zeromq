FROM ubuntu:trusty
MAINTAINER Trevor Bernard <trevor.bernard@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget build-essential libtool autoconf automake pkg-config
ADD . /tmp/zeromq
RUN cd /tmp/zeromq && ./configure -prefix=/usr && make
# RUN cd /tmp/zeromq && make check
RUN cd /tmp/zeromq && make install && ldconfig
RUN rm /tmp/* -rf
