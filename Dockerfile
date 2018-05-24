FROM php:7.2-cli

LABEL MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io
ENV EXAKAT_VERSION 1.2.8
ENV GREMLIN_VERSION 3.2.9

COPY exakat.sh /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/

RUN apt-get update
RUN \
    echo "===> prereqs" && \
    apt-get install -y gnupg  && \
    mkdir -p /usr/share/man/man1 && \
    echo "===> php.ini" && \
    echo "memory_limit=-1" >> /usr/local/etc/php/php.ini && \
    \
    echo "===> Java 8"  && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update && \
    \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default  && \
    \
    apt-get update && apt-get install -y --no-install-recommends git subversion mercurial lsof unzip && \
    \
    echo "====> Exakat $EXAKAT_VERSION" && \
    cd /usr/src/exakat && \
    wget --quiet http://dist.exakat.io/index.php?file=exakat-$EXAKAT_VERSION.phar -O exakat.phar && \
    chmod a+x /usr/src/exakat/exakat.* && \
    \
    export TERM="xterm" && \
    \
    echo "====> Gremlin-Server" && \
    wget -O apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=tinkerpop/$GREMLIN_VERSION/apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip" && \
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
