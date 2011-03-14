#!/usr/bin/env python

import jinja2
import os
import sys

SRCDIR = environ.get("SRCDIR", ".")
BUILDDIR = environ.get("BUILDDIR", SRCDIR)
WEBDIR = os.path.join(SRCDIR, "website")
OUTDIR = os.path.join(BUILDDIR, "html")

def main(args):

	if "SRCDIR" in environ:
		srcdir = environ["SRCDIR"]
	else:
		srcdir = "."

	webdir = os.path.join(srcdir, "website")
	os.path.walk(webdir, process_file, None)


def process_file(unused, dirname, names):
	for name in names:
		path = os.path.join(dirname, name)
		print path


# For running as a standalone server
if __name__ == "__main__":
	sys.exit(main(sys.args))
