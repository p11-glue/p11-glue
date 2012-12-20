
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
	rsync -v --progress \
		specs/sharing-trust-policy.html \
		anarchy.freedesktop.org:/srv/p11-glue.freedesktop.org/www/doc/sharing-trust-policy/index.html

.PHONY: html specs
