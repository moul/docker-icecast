FROM ubuntu:xenial

MAINTAINER Manfred Touron "m@42.am"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update && \
    apt-get -y install wget && \
    wget -qO - http://icecast.org/multimedia-obs.key | apt-key add -
    
RUN echo "deb http://download.opensuse.org/repositories/multimedia:/xiph/xUbuntu_14.04/ ./" > /etc/apt/sources.list.d/icecast.list

RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 python-setuptools && \
    apt-get clean

RUN easy_install supervisor && \
    easy_install supervisor-stdout

CMD ["/start.sh"]
EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

ADD ./start.sh /start.sh
ADD ./etc /etc
RUN chown -R icecast2 /etc/icecast2
