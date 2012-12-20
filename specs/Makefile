all: html/index.html

html/index.html: docbook-params.xsl sharing-trust-policy.xml Makefile
	xmlto -vv html-nochunks sharing-trust-policy.xml

-include Makefile.local

