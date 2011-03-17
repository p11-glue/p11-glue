
all: html

html:
	SRCDIR="." python jinja2-build.py

upload:
	rsync -Hvax html/./ anarchy.freedesktop.org:/srv/p11-glue.freedesktop.org/www/./

.PHONY: html
