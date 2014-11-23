FROM ubuntu:trusty
MAINTAINER Trevor Bernard <trevor.bernard@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget build-essential libtool autoconf automake pkg-config unzip libkrb5-dev
RUN cd /tmp && wget https://github.com/jedisct1/libsodium/archive/1.0.0.zip && unzip 1.0.0.zip && cd libsodium-1.0.0 && ./autogen.sh && ./configure --prefix=/usr && make check && make install && ldconfig
ADD . /tmp/zeromq
RUN cd /tmp/zeromq && ./configure -prefix=/usr && make
# RUN cd /tmp/zeromq && make check
RUN cd /tmp/zeromq && make install && ldconfig
RUN rm /tmp/* -rf
