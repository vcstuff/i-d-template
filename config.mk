# The following tools are used by this file.
# All are assumed to be on the path, but you can override these
# in the environment, or command line.

# Mandatory:
#   https://pypi.python.org/pypi/xml2rfc
XML2RFC_RFC_BASE_URL := https://datatracker.ietf.org/doc/html/
XML2RFC_ID_BASE_URL := https://datatracker.ietf.org/doc/html/
xml2rfc ?= xml2rfc -q -s 'Setting consensus="true" for IETF STD document' --rfc-reference-base-url $(XML2RFC_RFC_BASE_URL) --id-reference-base-url $(XML2RFC_ID_BASE_URL)

# If you are using markdown files use either kramdown-rfc2629 or mmark
#   https://github.com/cabo/kramdown-rfc2629
kramdown-rfc2629 ?= kramdown-rfc2629

#  mmark (https://github.com/miekg/mmark)
mmark ?= mmark

# If you are using outline files:
#   https://github.com/Juniper/libslax/tree/master/doc/oxtradoc
oxtradoc ?= oxtradoc.in

# When using rfc2629.xslt extensions:
#   https://greenbytes.de/tech/webdav/rfc2629xslt.html
xsltproc ?= xsltproc

# For sanity checkout your draft:
#   https://tools.ietf.org/tools/idnits/
idnits ?= idnits

# For diff:
#   https://tools.ietf.org/tools/rfcdiff/
rfcdiff ?= rfcdiff

# For generating PDF:
#   https://www.gnu.org/software/enscript/
enscript ?= enscript
#   http://www.ghostscript.com/
ps2pdf ?= ps2pdf

# Where to get references
XML_RESOURCE_ORG_PREFIX ?= https://xml2rfc.tools.ietf.org/public/rfc

# This is for people running macs
SHELL := bash

# For uploading draft "releases" to the datatracker.
curl ?= curl -sS
DATATRACKER_UPLOAD_URL ?= https://datatracker.ietf.org/api/submit

# The type of index that is created for gh-pages.
# Supported options are 'html' and 'md'.
INDEX_FORMAT ?= html

# For spellchecking: pip install --user codespell
codespell ?= codespell

# Setup a shared cache for xml2rfc and kramdown-rfc2629
ifeq (,$(KRAMDOWN_REFCACHEDIR))
XML2RFC_REFCACHEDIR ?= $(HOME)/.cache/xml2rfc
KRAMDOWN_REFCACHEDIR := $(XML2RFC_REFCACHEDIR)
else
XML2RFC_REFCACHEDIR ?= $(KRAMDOWN_REFCACHEDIR)
endif
xml2rfc += --cache=$(XML2RFC_REFCACHEDIR)
ifneq (,$(shell mkdir -p $(KRAMDOWN_REFCACHEDIR)))
$(info Created cache directory at $(KRAMDOWN_REFCACHEDIR))
endif
export KRAMDOWN_REFCACHEDIR
