all: html/index.html

html/index.html: docbook-params.xsl trust-assertions.xml Makefile
	xmlto -vv html-nochunks trust-assertions.xml

upload: all
	rsync --progress \
		trust-assertions.html \
		anarchy.freedesktop.org:/srv/p11-glue.freedesktop.org/www/doc/pkcs11-trust-assertions/index.html
