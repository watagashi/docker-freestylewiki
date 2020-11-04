# FreeStyleWiki on Docker

![Docker Image CI](https://github.com/watagashi/docker-freestylewiki/workflows/Docker%20Image%20CI/badge.svg)

## About FreeStyleWiki

-   [FrontPage - FreeStyleWiki](http://fswiki.osdn.jp/cgi-bin/wiki.cgi)

## Usage

### Build image and prepare volume with initial data

```bash
git clone https://github.com/watagashi/docker-freestylewiki.git
cd docker-freestylewiki
unzip wiki3_6_5.zip # https://osdn.net/projects/fswiki/releases/
mv wiki3_6_5 wiki
cd wiki
./setup.sh
cd ..
docker image build --tag freestylewiki .
```

### Run container

```bash
docker container run -dit --rm -p 8080:80 \
    -v ${PWD}/wiki/attach:/usr/local/apache2/cgi-bin/wiki/attach \
    -v ${PWD}/wiki/backup:/usr/local/apache2/cgi-bin/wiki/backup \
    -v ${PWD}/wiki/config:/usr/local/apache2/cgi-bin/wiki/config \
    -v ${PWD}/wiki/data:/usr/local/apache2/cgi-bin/wiki/data \
    -v ${PWD}/wiki/log:/usr/local/apache2/cgi-bin/wiki/log \
    -v ${PWD}/wiki/pdf:/usr/local/apache2/cgi-bin/wiki/pdf \
    -v ${PWD}/wiki/plugin:/usr/local/apache2/cgi-bin/wiki/plugin \
    -v ${PWD}/wiki/tmpl:/usr/local/apache2/cgi-bin/wiki/tmpl \
    -v ${PWD}/wiki/theme:/usr/local/apache2/htdocs/wiki/theme \
    --name fswiki freestylewiki
# open http://localhost:8080/cgi-bin/wiki/wiki.cgi
```
