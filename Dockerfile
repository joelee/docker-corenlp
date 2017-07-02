FROM openjdk:8-jre

LABEL maintainer="joel@joeworks.com"

ARG LANGUAGE='english'
ENV ZIPFILE="stanford-corenlp-full-2017-06-09.zip"

RUN apt-get update
RUN groupadd corenlp
RUN useradd -g corenlp -m -c 'CoreNLP user' corenlp

COPY cache/stanford-corenlp-full-*.zip /
RUN [ -e "/$ZIPFILE" ] || wget --no-verbose http://nlp.stanford.edu/software/$ZIPFILE

RUN unzip stanford-corenlp-full-*.zip && \
    mv $(ls -d stanford-corenlp-full-*/) /corenlp && \
    rm -f stanford-corenlp-full-*.zip

RUN mkdir -p /corenlp/bin && mkdir -p /corenlp/model
RUN chown corenlp:corenlp /corenlp/model

COPY startnlp.sh /corenlp/bin/
COPY getmodel.sh /corenlp/bin/
COPY cache/stanford-*-models.jar /corenlp/model/

RUN chmod -R +x /corenlp/bin/*.sh

USER corenlp
RUN /corenlp/bin/getmodel.sh $LANGUAGE

EXPOSE 9000

WORKDIR /corenlp

CMD /corenlp/bin/startnlp.sh
