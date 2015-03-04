FROM phusion/baseimage
#MAINTAINER Devin Torres <devin@devintorr.es>

ENV ERLANG_VERSION 17.3.2
ENV DEBIAN_FRONTEND noninteractive

CMD ["/sbin/my_init"]
RUN \
  curl -O http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
  dpkg -i erlang-solutions_1.0_all.deb && \
  rm erlang-solutions_1.0_all.deb && \
  apt-get update && \
  apt-get install -y erlang=1:$ERLANG_VERSION erlang-base-hipe=1:$ERLANG_VERSION

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
