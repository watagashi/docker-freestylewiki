FROM httpd:2.4
ENV FSWIKI_VERSION 3_6_5
RUN apt-get update; \
	apt-get install -y --no-install-recommends \
		curl \
		ca-certificates \
		unzip \
		libcgi-pm-perl \
	; \
	\
	curl -Lo cgi-bin/wiki${FSWIKI_VERSION}.zip "https://jaist.dl.osdn.jp/fswiki/69263/wiki${FSWIKI_VERSION}.zip"; \
	unzip cgi-bin/wiki${FSWIKI_VERSION}.zip; \
	mv wiki${FSWIKI_VERSION} cgi-bin/wiki; \
	mkdir htdocs/wiki; \
	mv cgi-bin/wiki/theme htdocs/wiki/theme; \
	sed -i -e "s/\(theme_uri\s\+=\s\+\)\.\/theme\b/\1\/wiki\/theme/" \
		-e "s/\(theme_dir\s\+=\s\+\)\.\/theme\b/\1..\/..\/\/htdocs\/wiki\/theme/" \
		cgi-bin/wiki/setup.dat; \
	cgi-bin/wiki/setup.sh cgi-bin/wiki; \
	\
	chown -R daemon:daemon cgi-bin/wiki; \
	sed -i -e "s/#\(LoadModule\s\+cgid\?_module\b\)/\1/" conf/httpd.conf; \
	\
	apt-get purge -y --auto-remove \
		curl \
		ca-certificates \
		unzip \
	; \
	rm -rf \
		/var/lib/apt/lists/* \
		cgi-bin/wiki${FSWIKI_VERSION}.zip
