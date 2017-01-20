FROM php:7.1.0-cli
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
    apt-get update && apt-get install -y \
    git \
    maven \ 
    lsof && \
    echo "====> Exakat 0.9.7" && \
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
    git clone https://github.com/thinkaurelius/neo4j-gremlin-plugin && \
    cd neo4j-gremlin-plugin && \
    sed -i.bak s_\<tinkerpop-version\>3.1.0-incubating\</tinkerpop-version\>_\<tinkerpop-version\>3.2.0-incubating\</tinkerpop-version\>_ tinkerpop3/pom.xml && \
    mvn clean package -Dtp.version=3  && \
    unzip target/neo4j-gremlin-plugin-tp3-2.3.1-server-plugin.zip -d ../neo4j/plugins/gremlin-plugin  && \
    cd .. && \
    echo "====> Cleanup" && \
    \
    apt-get remove -y --purge maven && \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/exakat

entrypoint [ "/usr/src/exakat/exakat.sh" ]

CMD [ "doctor" ]
