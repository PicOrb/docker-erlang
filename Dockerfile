FROM phusion/baseimage
#MAINTAINER Devin Torres <devin@devintorr.es>

ENV ERLANG_VERSION 17.3.2
ENV DEBIAN_FRONTEND noninteractive

CMD ["/sbin/my_init"]

RUN \
  apt-get update && \
  apt-get --fix-missing -y install build-essential autoconf libncurses5-dev libwxgtk2.8-dev \
  libgl1-mesa-dev libglu1-mesa-dev libpng3 libssh-dev unixodbc-dev openssl fop xsltproc
  
RUN \
  curl -O http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
  dpkg -i erlang-solutions_1.0_all.deb && \
  rm erlang-solutions_1.0_all.deb && \
  curl -O http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_esl/esl-erlang_17.4-2~ubuntu~trusty_i386.deb && \
  dpkg -i esl-erlang_17.4-2~ubuntu~trusty_i386.deb && \
  rm esl-erlang_17.4-2~ubuntu~trusty_i386.deb
  #apt-get update && \
  #apt-get install -y erlang-nox erlang=1:$ERLANG_VERSION erlang-base-hipe=1:$ERLANG_VERSION

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
