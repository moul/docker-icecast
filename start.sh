#!/bin/sh

env

if [ -n "$SOURCE_PASSWORD" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$SOURCE_PASSWORD<\/source-password>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$RELAY_PASSWORD" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$RELAY_PASSWORD<\/relay-password>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$ADMIN_PASSWORD" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$ADMIN_PASSWORD<\/admin-password>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$PASSWORD" ]; then
    sed -i "s/<password>[^<]*<\/password>/<password>$PASSWORD<\/password>/g" /etc/icecast2/icecast.xml
fi

supervisord -n -c /etc/supervisord.conf
