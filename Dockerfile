FROM ubuntu:xenial

MAINTAINER Manfred Touron "m@42.am"

ENV DEBIAN_FRONTEND noninteractive

RUN apt -qq -y update; \
    apt -y install wget; \
    wget -qO - http://icecast.org/multimedia-obs.key | apt-key add -; \
    echo "deb http://download.opensuse.org/repositories/multimedia:/xiph/xUbuntu_14.04/ ./" > /etc/apt/sources.list.d/icecast.list; \
    apt -qq -y update; \
    apt -qq -y install icecast2 python-setuptools sudo; \
    apt clean; \
    chown -R icecast2 /etc/icecast2

CMD ["/start.sh"]
EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

ADD ./start.sh /start.sh
ADD ./etc /etc
