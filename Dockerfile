FROM php:7.1-cli
MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

COPY exakat.sh gremlin.tar /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/

RUN \
    ls -hla /usr/src/exakat && \
    ls -hla /usr/src/exakat/config && \
    cat /usr/src/exakat/config/exakat.ini && \
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
    apt-get update && apt-get install -y \
    git \
    lsof && \
    echo "====> Exakat latest" && \
    cd /usr/src/exakat && \
    wget --quiet http://dist.exakat.io/index.php?file=exakat-0.9.7.phar -O exakat.phar && \
    chmod a+x /usr/src/exakat/exakat.* && \
    \
    echo "====> Neo4j" && \
    wget --quiet http://dist.neo4j.org/neo4j-community-2.3.7-unix.tar.gz && \
    tar zxf neo4j-community-2.3.7-unix.tar.gz && \
    mv neo4j-community-2.3.7 neo4j && \
    export NEO4J_HOME=/usr/src/exakat && \
    sed -i.bak s/dbms\.security\.auth_enabled=true/dbms\.security\.auth_enabled=false/ neo4j/conf/neo4j-server.properties && \
    sed -i.bak s%#org.neo4j.server.thirdparty_jaxrs_classes=org.neo4j.examples.server.unmanaged=/examples/unmanaged%org.neo4j.server.thirdparty_jaxrs_classes=com.thinkaurelius.neo4j.plugins=/tp% neo4j/conf/neo4j-server.properties && \
    sed -i.bak s%org.neo4j.server.webserver.port=7474%org.neo4j.server.webserver.port=7777% neo4j/conf/neo4j-server.properties && \
    rm neo4j/conf/neo4j-server.properties.bak && \
    \
    echo "====> Gremlin 3" && \
    mkdir /usr/src/exakat/neo4j/plugins/gremlin-plugin && \
    tar xvf gremlin.tar -C /usr/src/exakat/neo4j/plugins/gremlin-plugin && \
    \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/exakat

entrypoint [ "/usr/src/exakat/exakat.sh" ]

CMD [ "doctor" ]
