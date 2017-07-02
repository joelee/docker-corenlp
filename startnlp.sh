#!/bin/bash

cd /corenlp
export CLASSPATH="$(find /corenlp/ -name '*.jar')"

if [ -n "$LANGUAGE" ]; then
    /corenlp/bin/getmodel.sh "$LANGUAGE"
fi

java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000
