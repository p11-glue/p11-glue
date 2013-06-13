
all: specs html

clean:
	rm -rf html/*

specs:
	make -C specs all

html:
	SRCDIR="." python jinja2-build.py

upload: all
	rsync -Hvax --exclude doc --exclude releases \
		html/./* anarchy.freedesktop.org:/srv/p11-glue.freedesktop.org/www/./
	rsync -Hvax \
		specs/storing-trust/./* \
		anarchy.freedesktop.org:/srv/p11-glue.freedesktop.org/www/doc/storing-trust-policy/./

.PHONY: html specs
