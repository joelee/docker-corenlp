FROM openjdk:8-jre

RUN apt-get update

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip && \
    unzip stanford-corenlp-full-*.zip && \
    mv $(ls -d stanford-corenlp-full-*/) /corenlp && \
    rm -f stanford-corenlp-full-*.zip

RUN mkdir -p /corenlp/bin
COPY startnlp.sh /corenlp/bin/startnlp.sh
COPY getmodel.sh /corenlp/bin/getmodel.sh
RUN chmod -R +x /corenlp/bin/*.sh

RUN /corenlp/bin/getmodel.sh english

EXPOSE 9000

WORKDIR /corenlp

CMD /corenlp/bin/startnlp.sh
