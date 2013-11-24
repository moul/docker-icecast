#!/bin/sh

icecast2 -b -c /etc/icecast2/icecast.xml

sleep 1

tail -f /var/log/icecast2/*.log
