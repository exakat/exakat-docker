FROM develar/java

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

ENV GREMLIN_VERSION 3.2.7
ENV GREMLIN_HOME /usr/src/exakat/tinkergraph

RUN \
    echo "===> Setup" \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache bash curl \
    && echo "===> PHP 7.1" \
    && apk add --update 'php7>7.1' 'php7-xml>7.1' 'php7-xsl>7.1' 'php7-pdo_mysql>7.1' \
    'php7-mcrypt>7.1' 'php7-curl>7.1' 'php7-json>7.1' 'php7-fpm>7.1' 'php7-phar>7.1' 'php7-openssl>7.1' \
    'php7-mysqlnd>7.1' 'php7-ctype>7.1' 'php7-sqlite3>7.1' 'php7-mbstring>7.1' 'php7-tokenizer>7.1' \
    \
    && echo "===> php.ini" \
    && echo "memory_limit=-1" >> /etc/php7/php.ini \
    \
    && export TERM="xterm" \
    \
    && echo "====> Gremlin-Server" \
    && mkdir -p /usr/src/exakat \
    && wget -O apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip http://ftp.tudelft.nl/apache/tinkerpop/$GREMLIN_VERSION/apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip \
    && unzip apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip \
    && mv apache-tinkerpop-gremlin-server-$GREMLIN_VERSION /usr/src/exakat/tinkergraph \
    && rm -rf apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip  \
    && cd $GREMLIN_HOME \
    && mkdir db \
    && bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin $GREMLIN_VERSION \
    && cd - \
    \
    && echo "====> Cleanup" \
    && apk del curl \
    && rm -rf /var/cache/apk/* \
    \
    && echo "====> Permissions" \
    && adduser -u 2004 -D docker \
    && chown -R docker:docker $GREMLIN_HOME
    
