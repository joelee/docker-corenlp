#!/bin/sh

ZIPFILE="stanford-corenlp-full-2017-06-09.zip"
if [ -z "$1" ]; then
    LANGUAGE="english"
else
    LANGUAGE="$1"
fi
JARFILE="stanford-$LANGUAGE-corenlp-2017-06-09-models.jar"

cd "$(dirname $0)"

[ -e "./$ZIPFILE" ] || wget http://nlp.stanford.edu/software/$ZIPFILE
[ -e "./$JARFILE" ] || wget http://nlp.stanford.edu/software/$JARFILE
