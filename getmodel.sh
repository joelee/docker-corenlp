#!/bin/bash


# http://nlp.stanford.edu/software/stanford-english-corenlp-2017-06-09-models.jar
# http://nlp.stanford.edu/software/stanford-english-kbp-corenlp-2017-06-09-models.jar

if [ -z "$1" ]; then
    exit 1
fi

cd /corenlp
wget http://nlp.stanford.edu/software/stanford-$1-corenlp-2017-06-09-models.jar
exit $?
