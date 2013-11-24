FROM ubuntu

MAINTAINER Manfred Touron m@42.am

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -q update
RUN apt-get -q -y install icecast2

ADD ./icecast.xml /etc/icecast2/

# Command 1: better for application-like container
#ENTRYPOINT ["icecast2"]
#CMD ["-c", "/etc/icecast2/icecast.xml"]

# Command 2: easier for debugging
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]

USER icecast2

EXPOSE 8000

