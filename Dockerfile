FROM php:7.1-cli
MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

COPY exakat.sh /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/

RUN \
    echo "===> php.ini" && \
    echo "memory_limit=-1" >> /usr/local/etc/php/php.ini && \
    \
    echo "===> Java 8"  && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update  && \
    \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default  && \
    \
    apt-get update && apt-get install -y --no-install-recommends git subversion mercurial lsof unzip && \
    \
    echo "====> Exakat 1.0.0" && \
    cd /usr/src/exakat && \
    wget --quiet http://dist.exakat.io/index.php?file=exakat-1.0.0.phar -O exakat.phar && \
    chmod a+x /usr/src/exakat/exakat.* && \
    \
    export TERM="xterm" && \
    \
    echo "====> Gremlin-Server" && \
    wget -O apache-tinkerpop-gremlin-server-3.2.6-bin.zip http://ftp.tudelft.nl/apache/tinkerpop/3.2.6/apache-tinkerpop-gremlin-server-3.2.6-bin.zip && \
    unzip apache-tinkerpop-gremlin-server-3.2.6-bin.zip && \
    mv apache-tinkerpop-gremlin-server-3.2.6 tinkergraph && \
    rm -rf apache-tinkerpop-gremlin-server-3.2.6-bin.zip  && \
    cd tinkergraph && \
    bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.6 && \
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
