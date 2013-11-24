FROM ubuntu

MAINTAINER Manfred Touron m@42.am

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -q update
RUN apt-get -q -y install icecast2

ADD ./icecast.xml /etc/icecast2/
ADD run.sh /
RUN chmod +x /run.sh

USER icecast2

CMD ["/run.sh"]

EXPOSE 8000

