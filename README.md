# FreeStyleWiki on Docker

![Docker Image CI](https://github.com/watagashi/docker-freestylewiki/workflows/Docker%20Image%20CI/badge.svg)

## About FreeStyleWiki

-   [FrontPage - FreeStyleWiki](http://fswiki.osdn.jp/cgi-bin/wiki.cgi)

## Usage

### Example

```bash
docker image build --tag freestylewiki .
docker container run -dit -p 8080:80 --name fswiki freestylewiki
# open http://localhost:8080/cgi-bin/wiki.cgi
```
