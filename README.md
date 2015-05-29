# Icecast in Docker [![Build Status](https://travis-ci.org/moul/docker-icecast.svg?branch=master)](https://travis-ci.org/moul/docker-icecast)

Icecast2 Dockerfile

https://index.docker.io/u/moul/icecast/

## Run

Run with default password, export port 8000

    docker run -p 8000:8000 moul/icecast
    $BROWSER localhost:8000

Run with custom password

    docker run -p 8000:8000 -e ICECAST_SOURCE_PASSWORD=aaaa -e ICECAST_ADMIN_PASSWORD=bbbb -e ICECAST_PASSWORD=cccc -e ICECAST_RELAY_PASSWORD=dddd moul/icecast

Run with custom configuration

    docker run -p 8000:8000 -v /local/path/to/icecast/config:/etc/icecast2 moul/icecast
    docker run -p 8000:8000 -v /local/path/to/icecast.xml:/etc/icecast2/icecast.xml moul/icecast

Extends Dockerfile

    FROM moul/icecast
    ADD ./icecast.xml /etc/icecast2

## Examples

- https://github.com/ultreme/scc-radio/
