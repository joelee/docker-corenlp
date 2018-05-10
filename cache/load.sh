#!/bin/sh

# http://nlp.stanford.edu/software/stanford-corenlp-full-2018-02-27.zip
ZIPFILE="stanford-corenlp-full-2018-02-27.zip"
if [ -z "$1" ]; then
    LANGUAGE="english"
else
    LANGUAGE="$1"
fi
JARFILE="stanford-$LANGUAGE-corenlp-2018-02-27-models.jar"

cd "$(dirname $0)"
ß
[ -e "./$ZIPFILE" ] || wget http://nlp.stanford.edu/software/$ZIPFILE
[ -e "./$JARFILE" ] || wget http://nlp.stanford.edu/software/$JARFILE
