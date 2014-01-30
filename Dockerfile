FROM ubuntu:latest

MAINTAINER Manfred Touron "m@42.am"

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 && \
    apt-get clean

ENTRYPOINT ["/init.sh"]
EXPOSE 8000

ADD ./init.sh /init.sh
ADD ./config /config
RUN chown icecast2 /config
USER icecast2

