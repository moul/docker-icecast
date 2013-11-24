FROM ubuntu

MAINTAINER Manfred Touron m@42.am

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install icecast2

ENTRYPOINT ["icecast2", "-c", "/etc/icecast2/icecast.xml", "-b"]

USER icecast2

EXPOSE 8080
