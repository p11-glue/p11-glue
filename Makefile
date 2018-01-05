
all: specs html

clean:
	rm -rf html/*

specs:
	make -C specs all

html:
	SRCDIR="." python jinja2-build.py
	if ! test -d p11-kit-copy;then \
		git clone --depth 1 https://github.com/p11-glue/p11-kit.git p11-kit-copy; \
	fi
	cd p11-kit-copy && git clean -f && git pull && ./autogen.sh && ./configure --enable-doc && make -j8 && cd ..
	rsync -Hvax --exclude doc --exclude build p11-kit-copy/doc/manual/html/ html/manual/

upload: all
	-git branch -D tmp-web-pages
	git checkout -b tmp-web-pages
	git add -f html
	git commit -n -sm "auto-generated web-pages" html
	git subtree push --prefix html origin gh-pages
	git checkout master
	git branch -D tmp-web-pages

.PHONY: html specs
