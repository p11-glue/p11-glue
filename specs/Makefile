all: html/index.html

html/index.html: docbook-params.xsl sharing-trust-anchors.xml Makefile
	xmlto -vv -m docbook-params.xsl html-nochunks sharing-trust-anchors.xml

-include Makefile.local

