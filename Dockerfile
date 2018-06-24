FROM debian:stable-slim

MAINTAINER Manfred Touron "m@42.am"

ENV DEBIAN_FRONTEND noninteractive

RUN set + \
  apt -qq -y update; \
  apt -qq -y full-upgrade; \ 
  apt -qq -y install icecast2 python-setuptools sudo cron-apt; \
  apt -y autoclean; \
  apt clean; \
  chown -R icecast2 /etc/icecast2; \
  sed -i 's/ -d//' /etc/cron-apt/action.d/3-download 

CMD ["/start.sh"]
EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

ADD ./start.sh /start.sh
ADD ./etc /etc
