FROM php:7.1-cli-jessie

LABEL MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io
ENV EXAKAT_VERSION 1.4.5
ENV GREMLIN_VERSION 3.3.3

COPY exakat.sh /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/

RUN \
    echo "===> php.ini" && \
    echo "memory_limit=-1" >> /usr/local/etc/php/php.ini && \
    \
    echo "deb http://http.debian.net/debian jessie-backports main" | tee --append /etc/apt/sources.list.d/jessie-backports.list > /dev/null && \
    \
    apt-get update && apt-get install -y --no-install-recommends apt-utils gnupg wget software-properties-common python-software-properties  && \
    \
    echo "===> Java 8"  && \
    apt-get install -y --no-install-recommends  -t jessie-backports openjdk-8-jdk  && \
    \
    apt-get install -y --no-install-recommends git subversion mercurial lsof unzip && \
    \
    echo "====> Exakat $EXAKAT_VERSION" && \
    cd /usr/src/exakat && \
    wget --quiet http://dist.exakat.io/index.php?file=exakat-$EXAKAT_VERSION.phar -O exakat.phar && \
    chmod a+x /usr/src/exakat/exakat.* && \
    \
    export TERM="xterm" && \
    \
    echo "====> Gremlin-Server" && \
    wget --trust-server-names  -O apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip http://dist.exakat.io/apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip && \
    unzip apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip && \
    mv apache-tinkerpop-gremlin-server-$GREMLIN_VERSION tinkergraph && \
    rm -rf apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip  && \
    cd tinkergraph && \
    bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin $GREMLIN_VERSION && \
    cd .. && \
    \
    php exakat.phar doctor  && \
    \
    echo "====> Cleanup" && \
    \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/exakat

entrypoint [ "/usr/src/exakat/exakat.sh" ]

CMD [ "doctor" ]
