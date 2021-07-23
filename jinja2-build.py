#!/usr/bin/env python

import fnmatch
import jinja2
import os
import shutil
import sys

SRCDIR = os.path.abspath(os.environ.get("SRCDIR", "."))
INDIR = os.path.join(SRCDIR, "website")
BUILDDIR = os.path.abspath(os.environ.get("BUILDDIR", SRCDIR))
OUTDIR = os.path.join(BUILDDIR, "html")

jinja_env = None

def main(args):
	global jinja_env

	loader = jinja2.FileSystemLoader(INDIR)
	jinja_env = jinja2.Environment(loader=loader, autoescape=True,
	                               undefined=jinja2.StrictUndefined)

	os.chdir(INDIR)
	for directory, dirnames, filenames in os.walk("."):
                process_file(directory, filenames)
	print("Results: file://%s/index.html" % OUTDIR, file=sys.stderr)

def process_file(dirname, names):

	directory = os.path.normpath(os.path.join(OUTDIR, dirname))
	if not os.path.exists(directory):
		os.mkdir(directory)

	args = { }

	for name in names:
		path = os.path.join(dirname, name)		
		if fnmatch.fnmatch(path, "*.tmpl"):
			print(name, file=sys.stderr)
			output = os.path.join(OUTDIR, path[0:-5])
			template = jinja_env.get_template(path)
			data = str(template.render(**args))
			if os.path.exists(output):
				os.unlink(output)
			with open(output, 'w') as f:
				f.write(data)
			os.chmod(output, 0o444)

		elif fnmatch.fnmatch(path, "*.incl"):
			continue

		else:
			output = os.path.join(OUTDIR, path)
			if os.path.exists(output):
				os.unlink(output)
			shutil.copy(path, output)
			os.chmod(output, 0o444)


# For running as a standalone server
if __name__ == "__main__":
	sys.exit(main(sys.argv))
