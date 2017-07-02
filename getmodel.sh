#!/bin/bash

if [ -z "$1" ]; then
    exit 0
fi

JARFILE="stanford-$1-corenlp-2017-06-09-models.jar"

cd /corenlp/model
if [ -e "./$JARFILE" ]; then
    echo "Language file for '$1' already exists.."
else
    echo "Language file for '$1' not found. Downloading..."
    wget http://nlp.stanford.edu/software/$JARFILE
    exit $?
fi
