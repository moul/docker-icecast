# Icecast in Docker [![Build Status](https://travis-ci.org/moul/docker-icecast.svg?branch=master)](https://travis-ci.org/moul/docker-icecast)

Icecast2 Dockerfile

[![](http://dockeri.co/image/moul/icecast)](https://index.docker.io/u/moul/icecast/)

## Run

Run with default password, export port 8000

```bash
docker run -p 8000:8000 moul/icecast
$BROWSER localhost:8000
```

Run with custom password

```bash
docker run -p 8000:8000 -e ICECAST_SOURCE_PASSWORD=aaaa -e ICECAST_ADMIN_PASSWORD=bbbb -e ICECAST_PASSWORD=cccc -e ICECAST_RELAY_PASSWORD=dddd moul/icecast
```

Run with custom configuration

```bash
docker run -p 8000:8000 -v /local/path/to/icecast/config:/etc/icecast2 moul/icecast
docker run -p 8000:8000 -v /local/path/to/icecast.xml:/etc/icecast2/icecast.xml moul/icecast
```

Extends Dockerfile

```Dockerfile
FROM moul/icecast
ADD ./icecast.xml /etc/icecast2
```    

Docker-compose

```yaml
icecast:
  image: moul/icecast
  volumes:
  - logs:/var/log/icecast2
  - /etc/localtime:/etc/localtime:ro 
  environment:
  - ICECAST_SOURCE_PASSWORD=aaa
  - ICECAST_ADMIN_PASSWORD=bbb
  - ICECAST_PASSWORD=ccc
  - ICECAST_RELAY_PASSWORD=ddd
  ports:
  - 8000:8000
```

## Examples

- https://github.com/ultreme/scc-radio/
