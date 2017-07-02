#!/bin/sh

ZIPFILE="stanford-corenlp-full-2017-06-09.zip"
LANGUAGE="english"
JARFILE="stanford-$LANGUAGE-corenlp-2017-06-09-models.jar"

cd "$(dirname $0)"

[ -e "/$ZIPFILE" ] || wget http://nlp.stanford.edu/software/$ZIPFILE
[ -e "./$JARFILE" ] || wget http://nlp.stanford.edu/software/$JARFILE
