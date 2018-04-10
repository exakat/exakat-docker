FROM openjdk:8-jdk

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

ENV GREMLIN_VERSION 3.2.7

RUN \
    echo "====> Gremlin-Server" \
    && wget -O apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip http://ftp.tudelft.nl/apache/tinkerpop/$GREMLIN_VERSION/apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip \
    && unzip apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip \
    && mv apache-tinkerpop-gremlin-server-$GREMLIN_VERSION tinkergraph \
    && rm -rf apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip  \
    && cd tinkergraph \
    && mkdir db \
    && ./bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.2.7 \
    && rm -rf javadocs \
    && rm -rf docs \
    && cd ..
    
CMD ["cp", "-avr", "/tinkergraph", "/mnt/"]