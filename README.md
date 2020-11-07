# FreeStyleWiki on Docker

![Docker Image CI](https://github.com/watagashi/docker-freestylewiki/workflows/Docker%20Image%20CI/badge.svg)

## About FreeStyleWiki

-   [FrontPage - FreeStyleWiki](http://fswiki.osdn.jp/cgi-bin/wiki.cgi)

## Usage

### Prepare volume with initial data

```bash
git clone https://github.com/watagashi/docker-freestylewiki.git
cd docker-freestylewiki
unzip wiki3_6_5.zip # https://osdn.net/projects/fswiki/releases/
mv wiki3_6_5 wiki
```

### Start container

```bash
docker-compose up -d
```

Open `http://localhost:8080/cgi-bin/wiki/wiki.cgi`

### Shutdown

```bash
docker-compose down
```
