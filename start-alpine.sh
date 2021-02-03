#!/bin/sh

env

set -x

set_val() {
    if [ -n "$2" ]; then
        echo "set '$2' to '$1'"
        sed -i "s/<$2>[^<]*<\/$2>/<$2>$1<\/$2>/g" /etc/icecast/icecast.xml
    else
        echo "Setting for '$1' is missing, skipping." >&2
    fi
}

cp /etc/icecast.xml /etc/icecast/

set_val $ICECAST_SOURCE_PASSWORD source-password
set_val $ICECAST_RELAY_PASSWORD  relay-password
set_val $ICECAST_ADMIN_PASSWORD  admin-password
set_val $ICECAST_PASSWORD        password
set_val $ICECAST_HOSTNAME        hostname

set -e

icecast -c /etc/icecast/icecast.xml
