#! /bin/bash

# go to the proper working directory
DOCUMENT_DIR="${DOCUMENT_DIR:-/documents}"
cd $DOCUMENT_DIR

# working directory contains conf.py - so source dir is $PWD = .

# build html
sphinx-build  -b html . build/html

# convert svgs to pdf since latex is short on processing svgs
# this is done in an extra makefile since the sphinx make files aregenerated
# note: the svg-to-pdf makefile needs to know about the directories where
# svgs are located
make -f /svg-to-pdf.mk images

# build latex / pdf
sphinx-build  -b latex . build/pdf
make -C build/pdf

# clean up the temporarily generated pdfs
make -f /svg-to-pdf.mk clean
