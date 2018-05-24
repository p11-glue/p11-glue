
all: specs .html.stamp-check .html.stamp

clean:
	rm -f .html.stamp .p11-kit.stamp

specs:
	make -C specs all

.html.stamp-check:
	test -d html || rm -f .html.stamp

.p11-kit.stamp-tmp:
	git submodule update --init
	git submodule status >$@

.p11-kit.stamp: .p11-kit.stamp-tmp
	cmp .p11-kit.stamp-tmp $@ || mv .p11-kit.stamp-tmp $@

.html.stamp: .p11-kit.stamp
	rm -rf html/*
	SRCDIR="." python jinja2-build.py
	cd p11-kit-copy && ./autogen.sh && ./configure --enable-doc && make -j8 && cd ..
	mkdir -p html/p11-kit
	rsync -Hvax --exclude doc --exclude build p11-kit-copy/doc/manual/html/ html/p11-kit/manual/
	ln -t html -s p11-kit/manual manual || true
	test -d html/doc || mkdir html/doc
	rsync -Hvax specs/storing-trust/ html/doc/storing-trust-policy
	cd pkcs11-trust-assertions-copy && make -j8 && cd ..
	mkdir -p html/doc/pkcs11-trust-assertions
	cp pkcs11-trust-assertions-copy/trust-assertions.html html/doc/pkcs11-trust-assertions/index.html
	cp pkcs11-trust-assertions-copy/pkcs11-trust-assertions.h html/doc/pkcs11-trust-assertions
	touch $@

upload: .html.stamp
	-git branch -D tmp-web-pages
	-git branch -D gh-pages
	git checkout -b tmp-web-pages
	git add -f html
	git commit -n -sm "auto-generated web-pages" html
	#git subtree push --prefix html origin gh-pages
	git push origin `git subtree split --prefix html tmp-web-pages`:gh-pages --force
	git checkout master
	git branch -D tmp-web-pages

.PHONY: .html.stamp-check specs .p11-kit.stamp-tmp
