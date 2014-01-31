FROM ubuntu:latest

MAINTAINER Manfred Touron "m@42.am"

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 python-setuptools && \
    apt-get clean

RUN easy_install supervisor

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
EXPOSE 8000
VOLUME ["/config"]

ADD ./etc /etc
RUN chown icecast2 /etc/icecast2
 