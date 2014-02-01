Icecast in Docker
=================

Icecast2 Dockerfile

https://index.docker.io/u/moul/icecast/

Run
---

Run with default password, export port 8000

    docker run -p 8000:8000 moul/icecast
    $BROWSER localhost:8000
    
Run with custom password

    docker run -p 8000:8000 -e SOURCE_PASSWORD=aaaa -e ADMIN_PASSWORD=bbbb -e PASSWORD=cccc -e RELAY_PASSWORD=dddd moul/icecast

Run with custom configuration

    docker run -p 8000:8000 -v /local/path/to/icecast/config:/etc/icecast2 moul/icecast
    docker run -p 8000:8000 -v /local/path/to/icecast.xml:/etc/icecast2/icecast.xml moul/icecast

Extends Dockerfile

    FROM moul/icecast
    ADD ./icecast.xml /etc/icecast2
