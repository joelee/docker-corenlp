FROM openjdk:8-jre

ARG LANGUAGE='english'

RUN apt-get update
RUN groupadd corenlp
RUN useradd -g corenlp -m -c 'CoreNLP user' corenlp

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip && \
    unzip stanford-corenlp-full-*.zip && \
    mv $(ls -d stanford-corenlp-full-*/) /corenlp && \
    rm -f stanford-corenlp-full-*.zip

RUN mkdir -p /corenlp/bin && mkdir -p /corenlp/model
RUN chown corenlp:corenlp /corenlp/model

COPY startnlp.sh /corenlp/bin/startnlp.sh
COPY getmodel.sh /corenlp/bin/getmodel.sh
RUN chmod -R +x /corenlp/bin/*.sh

USER corenlp
RUN /corenlp/bin/getmodel.sh $LANGUAGE

EXPOSE 9000

WORKDIR /corenlp

CMD /corenlp/bin/startnlp.sh
