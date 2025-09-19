.PHONY: all
all: specs .html.stamp-check .html.stamp

.PHONY: clean
clean:
	rm -f .html.stamp

.PHONY: specs
specs:
	make -C specs all

.PHONY: .html.stamp-check
.html.stamp-check:
	test -d html || rm -f .html.stamp

.html.stamp:
	rm -rf html
	SRCDIR="." python jinja2-build.py
	rm -rf p11-kit-build
	meson setup -Dgtk_doc=true p11-kit-build p11-kit-copy
	meson compile -C p11-kit-build
	ninja -C p11-kit-build p11-kit-doc
	mkdir -p html/p11-kit
	cp p11-kit-release-keyring.gpg html/p11-kit
	rsync -Hvax --exclude doc --exclude p11-kit-build build/doc/manual/html/ html/p11-kit/manual/
	ln -t html -s p11-kit/manual manual || true
	test -d html/doc || mkdir html/doc
	rsync -Hvax specs/storing-trust/ html/doc/storing-trust-policy
	cd pkcs11-trust-assertions-copy && make -j8 && cd ..
	mkdir -p html/doc/pkcs11-trust-assertions
	cp pkcs11-trust-assertions-copy/trust-assertions.html html/doc/pkcs11-trust-assertions/index.html
	cp pkcs11-trust-assertions-copy/pkcs11-trust-assertions.h html/doc/pkcs11-trust-assertions
	touch $@
