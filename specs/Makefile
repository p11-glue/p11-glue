NULL =

STORING_TRUST_FILES = \
	storing-trust-c.xml \
	storing-trust-dbus.xml \
	storing-trust-json.xml \
	storing-trust-model.xml \
	storing-trust-existing.xml \
	storing-trust-pkcs11.xml \
	storing-trust-policy.xml \
	storing-trust-retrofit.xml \
	$(NULL)

STORING_TRUST_DIR = storing-trust

all: $(STORING_TRUST_DIR)/index.html

clean:
	rm -rf $(STORING_TRUST_DIR)

$(STORING_TRUST_DIR)/index.html: docbook-params.xsl Makefile $(STORING_TRUST_FILES)
	mkdir -vp $(STORING_TRUST_DIR)/
	rm -vf $(STORING_TRUST_DIR)/*
	xmlto -vv -m docbook-params.xsl -o $(STORING_TRUST_DIR) html storing-trust-policy.xml

-include Makefile.local
