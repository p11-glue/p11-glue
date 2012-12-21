all: html/index.html

html/index.html: docbook-params.xsl sharing-trust-policy.xml Makefile
	xmlto -vv -m docbook-params.xsl html-nochunks sharing-trust-policy.xml

-include Makefile.local

