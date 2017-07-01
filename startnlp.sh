#!/bin/bash

if ( -z "$CLASSPATH" ); then
    CLASSPATH="/corenlp"
else
    CLASSPATH="/corenlp:$CLASSPATH"
fi

export CLASSPATH

cd /corenlp
java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000
