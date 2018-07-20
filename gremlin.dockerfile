FROM anapsix/alpine-java

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

ENV GREMLIN_VERSION 3.3.3

RUN \
    echo "===> Setup PHP" \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache bash curl \
    \
    && echo "====> Gremlin-Server" \
    && curl --fail --silent --show-error --location --output apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip http://dist.exakat.io/apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip \
    && unzip apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip \
    && mv apache-tinkerpop-gremlin-server-$GREMLIN_VERSION tinkergraph \
    && rm -rf apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip  \
    && cd tinkergraph \
    && mkdir db \
    && /bin/bash ./bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin 3.3.3 \
    && rm -rf javadocs \
    && rm -rf docs \
    && cd ..
    
